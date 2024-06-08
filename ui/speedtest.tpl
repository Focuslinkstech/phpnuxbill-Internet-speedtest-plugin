{include file="sections/header.tpl"}

<style>
    /* Checkbox container */
    .switch {
        position: relative;
        display: inline-block;
        width: 50px;
        height: 24px;
    }

    /* Hidden checkbox */
    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    /* Slider */
    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: .4s;
        transition: .4s;
        border-radius: 24px;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 18px;
        width: 18px;
        left: 3px;
        bottom: 3px;
        background-color: white;
        -webkit-transition: .4s;
        transition: .4s;
        border-radius: 50%;
    }

    input:checked+.slider {
        background-color: #2196F3;
    }

    input:focus+.slider {
        box-shadow: 0 0 1px #2196F3;
    }

    input:checked+.slider:before {
        -webkit-transform: translateX(26px);
        -ms-transform: translateX(26px);
        transform: translateX(26px);
    }
</style>

<form class="form-horizontal" method="post" autocomplete="off" role="form" action="">
    <div class="row">
        <div class="col-sm-12 col-md-12">
            <div class="panel panel-primary panel-hovered panel-stacked mb30">
                <div class="panel-heading">{Lang::T('Speedtest Settings')}</div>
                <div class="panel-body">
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('Status:')}</label>
                        <div class="col-md-6">
                            <label class="switch">
                                <input type="checkbox" id="speedtest_mode" value="1" name="speedtest_mode" {if
                                    $_c['speedtest_mode']==1}checked{/if}>
                                <span class="slider"></span>
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">{Lang::T('Template:')}</label>
                        <div class="col-md-6">
                            <select class="form-control" name="speedtest_template" id="speedtest_template">
                                <option value="a" {if $_c['speedtest_template'] == 'a'}selected{/if}>{Lang::T('Template A')}</option>
                                <option value="b" {if $_c['speedtest_template'] == 'b'}selected{/if}>{Lang::T('Template B')}</option>
                                <option value="c" {if $_c['speedtest_template'] == 'c'}selected{/if}>{Lang::T('Template C')}</option>
                                <option value="d" {if $_c['speedtest_template'] == 'd'}selected{/if}>{Lang::T('Template D')}</option>
                              </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-offset-2 col-lg-10">
                            <button class="btn btn-primary waves-effect waves-light" name="save" value="save"
                                type="submit">{Lang::T('Save')}</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

{include file="sections/footer.tpl"}