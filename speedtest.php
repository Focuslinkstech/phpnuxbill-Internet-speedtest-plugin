<?php


$configs = ORM::for_table('tbl_appconfig')->find_many();
$mode = false;
foreach ($configs as $config) {
  if ($config->setting == 'speedtest_mode') {
    $mode = $config->value;
    break;
  }
}

if ($mode == true) {
  register_menu(" Internet Speedtest", false, "speedtest_clients", 'AFTER_HISTORY', 'fa fa-dashboard');
}


register_menu(" Internet Speedtest", true, "speedtest", 'AFTER_SETTINGS', 'fa fa-dashboard');

function speedtest()
{
  global $ui, $config;
  _admin();
  $ui->assign('_title', 'Speedtest Settings');
  $ui->assign('_system_menu', '');
  $admin = Admin::_info();
  $ui->assign('_admin', $admin);
  if (!in_array($admin['user_type'], ['SuperAdmin', 'Admin'])) {
    _alert(Lang::T('You do not have permission to access this page'), 'danger', "dashboard");
    exit;
  }
  if (_post('save') == 'save') {
    $status = isset($_POST['speedtest_mode']) ? 1 : 0; // Checkbox returns 1 if checked, otherwise 0
    $template = isset($_POST['speedtest_template']) ? $_POST['speedtest_template'] : null;

    $settings = [
      'speedtest_mode' => $status,
      'speedtest_template' => $template
    ];

    foreach ($settings as $key => $value) {
      $d = ORM::for_table('tbl_appconfig')->where('setting', $key)->find_one();
      if ($d) {
        $d->value = $value;
        $d->save();
      } else {
        $d = ORM::for_table('tbl_appconfig')->create();
        $d->setting = $key;
        $d->value = $value;
        $d->save();
      }
    }

    r2(U . "plugin/speedtest", 's', Lang::T('Settings Saved Successfully'));
  }
  $ui->assign('_c', $config);
  $ui->display('speedtest.tpl');
}




function speedtest_clients()
{
  global $ui, $config;
  _auth();
  $ui->assign('_title', $config['CompanyName'] . ' Internet Speedtest');
  $ui->assign('_system_menu', '');

  $user = User::_info();
  $ui->assign('_user', $user);

  if (isset($config['speedtest_mode']) && $config['speedtest_mode'] == true) {
    switch ($config['speedtest_template'] ?? '') {
      case 'b':
        $ui->display('speedtest_clients_b.tpl');
        break;
      case 'c':
        $ui->display('speedtest_clients_c.tpl');
        break;
      case 'd':
        $ui->display('speedtest_clients_d.tpl');
        break;
      default:
        $ui->display('speedtest_clients.tpl');
        break;
    }
  } else {
    r2(U . "home");
    exit;
  }
}
