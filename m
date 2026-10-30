Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371858;
	b=U34CgxEZa8UAtgqL10Ls9YrHgAimhDkKbh7Jdr3krDsQLZ2dNoerebezujBNLWBDw+26
	 MZg7tnEoi6QxgqIz0uqoagOJWKHanGC+FO9duRdVa0GsPrt6BYjeSmKZZhaG16U9lJPwp
	 0JJskaEQODUM+t56F+73wcGFxmSxmY5w0/eCZc7OvGKdYPQBefkWjzavMjP833jwq1sIs
	 M1k9N9M4rHl/cb+XbED+f+6YUjUMg4aR6ZxeMWpAKo7wGOKctjMyB8PsiSU8Yw7f9k1sl
	 8PNC8k+4UBgbR1mVCZvsVB/ibEAFrjc4vUa8reTj7DT8UbjS8j3+PjBBct+fPYG+Ocg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371858;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=jGWtdlbWMHGNgloX7EqfHV279r2fDcsDj1Rd/d1NoRs=;
	b=NVs2nUTRPhqD4iZqdk6vsTy9mZSSiUbozNVaLtQqlM3b6B3Jn2B0WuNjk28X+ICV5FdU
	 2wLn4RzaLjexRVR9tus8l0kTrID6d4fjlYatGlVdYvQTQCp7ikHePHMmwL3uE1S14etCV
	 wkVSqE2LA6vfunORo6LOHxrGPt3S5dLUyh5JaodUHoKJua6DdkTfHKe9+H/8ue26x1DEz
	 M/mtN3TUoL37qJfEkSugNcBXc/NCHi9AESqhqmGUj26BT9bdJ5bnxXTzUznOuSUgPbJ12
	 6bUt1S8VEp0RFRJb8KUBEQ2LNOprFYeI4qHwZQW3sigWEa7OgNXzZj0y15Sr1YDTZDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Tsrq+bJK;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA389606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA389606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Tsrq+bJK
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24C761595
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:50:54 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 15C303F673
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793371857; bh=ZS2k+FypBHiuo5+SFtfW7Gv767dr3RvQc3r5rKZYMBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tsrq+bJKI+7eXIgqLRe1DWEU1E6G6rN/vxwPVWrLSDZfx1mu5XOdz4c4Fc8/z2lgP
	 v7VOWtPpHhaq0K49f0cVXsyhiipMllCkSJOwANoJ1o/Pc9ea6KAZMlcaQlqDqGeG2e
	 j9p0TH/C6GHiCmwyS/eSLCrjCno9le/C3vSNo/Sc=
Date: Fri, 30 Oct 2026 14:50:35 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Andy Shevchenko <andy@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andreas Werner <andreas.werner@men.de>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] mfd: Constify mfd_cell arrays
Message-ID: <auSuu45DB5QTQuUX@e142607>
References: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030140240.211786-3-krzysztof.kozlowski@oss.qualcomm.com>

On Fri, Oct 30, 2026 at 03:02:41PM +0100, Krzysztof Kozlowski wrote:
> mfd_add_devices() takes pointer to const, so 'struct mfd_cell' arrays
> can be constified whenever driver does not modify it in the probe.
> 
> Acked-by: Chen-Yu Tsai <wens@kernel.org> # ac100 & axp20x
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Acked-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com> # cgbc-core
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Add tags
> 2. Drop wm97xx-core.c, it was not intended to be committed
> ---
>  drivers/mfd/ac100.c                   | 2 +-
>  drivers/mfd/axp20x.c                  | 4 ++--
>  drivers/mfd/cgbc-core.c               | 2 +-
>  drivers/mfd/cs5535-mfd.c              | 2 +-
>  drivers/mfd/intel_soc_pmic_bxtwc.c    | 2 +-
>  drivers/mfd/intel_soc_pmic_chtdc_ti.c | 2 +-
>  drivers/mfd/intel_soc_pmic_chtwc.c    | 2 +-
>  drivers/mfd/intel_soc_pmic_crc.c      | 6 +++---
>  drivers/mfd/max77705.c                | 2 +-
>  drivers/mfd/menf21bmc.c               | 2 +-
>  drivers/mfd/mxs-lradc.c               | 6 +++---
>  drivers/mfd/rohm-bd718x7.c            | 6 +++---
>  drivers/mfd/rsmu_core.c               | 8 ++++----
>  drivers/mfd/stmfx.c                   | 2 +-
>  drivers/mfd/vexpress-sysreg.c         | 2 +-

For the vexpress-sysreg.c:

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

>  15 files changed, 25 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/mfd/ac100.c b/drivers/mfd/ac100.c
> index 8f47c392cbd1..51b4d468c51d 100644
> --- a/drivers/mfd/ac100.c
> +++ b/drivers/mfd/ac100.c
> @@ -75,7 +75,7 @@ static const struct regmap_config ac100_regmap_config = {
>  	.cache_type	= REGCACHE_MAPLE,
>  };
>  
> -static struct mfd_cell ac100_cells[] = {
> +static const struct mfd_cell ac100_cells[] = {
>  	{
>  		.name		= "ac100-codec",
>  		.of_compatible	= "x-powers,ac100-codec",
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 50df66de24e0..4d770e718716 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -1055,13 +1055,13 @@ static const struct mfd_cell axp152_cells[] = {
>  	},
>  };
>  
> -static struct mfd_cell axp313a_cells[] = {
> +static const struct mfd_cell axp313a_cells[] = {
>  	/* AXP323 is sometimes paired with AXP717 as sub-PMIC */
>  	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>  };
>  
> -static struct mfd_cell axp717_cells[] = {
> +static const struct mfd_cell axp717_cells[] = {
>  	MFD_CELL_NAME("axp20x-regulator"),
>  	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
>  	MFD_CELL_OF("axp717-adc",
> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> index 2becaf797646..3460c50047ea 100644
> --- a/drivers/mfd/cgbc-core.c
> +++ b/drivers/mfd/cgbc-core.c
> @@ -231,7 +231,7 @@ int cgbc_command(struct cgbc_device_data *cgbc, void *cmd, unsigned int cmd_size
>  }
>  EXPORT_SYMBOL_GPL(cgbc_command);
>  
> -static struct mfd_cell cgbc_devs[] = {
> +static const struct mfd_cell cgbc_devs[] = {
>  	{ .name = "cgbc-wdt"	},
>  	{ .name = "cgbc-gpio"	},
>  	{ .name = "cgbc-i2c", .id = 1 },
> diff --git a/drivers/mfd/cs5535-mfd.c b/drivers/mfd/cs5535-mfd.c
> index f3becbef19f5..d91d60dc5416 100644
> --- a/drivers/mfd/cs5535-mfd.c
> +++ b/drivers/mfd/cs5535-mfd.c
> @@ -37,7 +37,7 @@ const struct software_node cs5535_gpio_swnode = {
>  };
>  EXPORT_SYMBOL_NS(cs5535_gpio_swnode, "CS5535");
>  
> -static struct mfd_cell cs5535_mfd_cells[] = {
> +static const struct mfd_cell cs5535_mfd_cells[] = {
>  	{
>  		.name = "cs5535-smb",
>  		.num_resources = 1,
> diff --git a/drivers/mfd/intel_soc_pmic_bxtwc.c b/drivers/mfd/intel_soc_pmic_bxtwc.c
> index 117517c171b5..5aa9e52401f0 100644
> --- a/drivers/mfd/intel_soc_pmic_bxtwc.c
> +++ b/drivers/mfd/intel_soc_pmic_bxtwc.c
> @@ -245,7 +245,7 @@ static const struct resource tmu_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(BXTWC_TMU_IRQ, "TMU"),
>  };
>  
> -static struct mfd_cell bxt_wc_dev[] = {
> +static const struct mfd_cell bxt_wc_dev[] = {
>  	{
>  		.name = "bxt_wcove_thermal",
>  		.num_resources = ARRAY_SIZE(thermal_resources),
> diff --git a/drivers/mfd/intel_soc_pmic_chtdc_ti.c b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
> index 6daf33e07ea0..8412a25d37ff 100644
> --- a/drivers/mfd/intel_soc_pmic_chtdc_ti.c
> +++ b/drivers/mfd/intel_soc_pmic_chtdc_ti.c
> @@ -53,7 +53,7 @@ static const struct resource battery_resources[] = {
>  	DEFINE_RES_IRQ(CHTDC_TI_CCEOCAL),
>  };
>  
> -static struct mfd_cell chtdc_ti_dev[] = {
> +static const struct mfd_cell chtdc_ti_dev[] = {
>  	{
>  		.name = "chtdc_ti_pwrbtn",
>  		.num_resources = ARRAY_SIZE(power_button_resources),
> diff --git a/drivers/mfd/intel_soc_pmic_chtwc.c b/drivers/mfd/intel_soc_pmic_chtwc.c
> index aa71a7d83fcd..f27985a58c87 100644
> --- a/drivers/mfd/intel_soc_pmic_chtwc.c
> +++ b/drivers/mfd/intel_soc_pmic_chtwc.c
> @@ -50,7 +50,7 @@ static const struct resource cht_wc_ext_charger_resources[] = {
>  	DEFINE_RES_IRQ(CHT_WC_EXT_CHGR_IRQ),
>  };
>  
> -static struct mfd_cell cht_wc_dev[] = {
> +static const struct mfd_cell cht_wc_dev[] = {
>  	{
>  		.name = "cht_wcove_pwrsrc",
>  		.num_resources = ARRAY_SIZE(cht_wc_pwrsrc_resources),
> diff --git a/drivers/mfd/intel_soc_pmic_crc.c b/drivers/mfd/intel_soc_pmic_crc.c
> index 627a89334908..ce4c9ef59198 100644
> --- a/drivers/mfd/intel_soc_pmic_crc.c
> +++ b/drivers/mfd/intel_soc_pmic_crc.c
> @@ -54,7 +54,7 @@ static const struct resource gpio_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(CRYSTAL_COVE_IRQ_GPIO, "GPIO"),
>  };
>  
> -static struct mfd_cell crystal_cove_byt_dev[] = {
> +static const struct mfd_cell crystal_cove_byt_dev[] = {
>  	{
>  		.name = "crystal_cove_pwrsrc",
>  		.num_resources = ARRAY_SIZE(pwrsrc_resources),
> @@ -93,7 +93,7 @@ static struct mfd_cell crystal_cove_byt_dev[] = {
>  	},
>  };
>  
> -static struct mfd_cell crystal_cove_cht_dev[] = {
> +static const struct mfd_cell crystal_cove_cht_dev[] = {
>  	{
>  		.name = "crystal_cove_gpio",
>  		.num_resources = ARRAY_SIZE(gpio_resources),
> @@ -142,7 +142,7 @@ static struct pwm_lookup crc_pwm_lookup[] = {
>  
>  struct crystal_cove_config {
>  	unsigned long irq_flags;
> -	struct mfd_cell *cell_dev;
> +	const struct mfd_cell *cell_dev;
>  	int n_cell_devs;
>  	const struct regmap_config *regmap_config;
>  	const struct regmap_irq_chip *irq_chip;
> diff --git a/drivers/mfd/max77705.c b/drivers/mfd/max77705.c
> index 2e9b81f26414..771015c229c8 100644
> --- a/drivers/mfd/max77705.c
> +++ b/drivers/mfd/max77705.c
> @@ -15,7 +15,7 @@
>  #include <linux/regmap.h>
>  #include <linux/of.h>
>  
> -static struct mfd_cell max77705_devs[] = {
> +static const struct mfd_cell max77705_devs[] = {
>  	MFD_CELL_OF("max77705-rgb", NULL, NULL, 0, 0, "maxim,max77705-rgb"),
>  	MFD_CELL_OF("max77705-charger", NULL, NULL, 0, 0, "maxim,max77705-charger"),
>  	MFD_CELL_OF("max77705-haptic", NULL, NULL, 0, 0, "maxim,max77705-haptic"),
> diff --git a/drivers/mfd/menf21bmc.c b/drivers/mfd/menf21bmc.c
> index 0f24de516d72..252d5c81db6b 100644
> --- a/drivers/mfd/menf21bmc.c
> +++ b/drivers/mfd/menf21bmc.c
> @@ -17,7 +17,7 @@
>  #define BMC_CMD_REV_MINOR	0x81
>  #define BMC_CMD_REV_MAIN	0x82
>  
> -static struct mfd_cell menf21bmc_cell[] = {
> +static const struct mfd_cell menf21bmc_cell[] = {
>  	{ .name = "menf21bmc_wdt", },
>  	{ .name = "menf21bmc_led", },
>  	{ .name = "menf21bmc_hwmon", }
> diff --git a/drivers/mfd/mxs-lradc.c b/drivers/mfd/mxs-lradc.c
> index 64afc7631790..71ad5184f7e0 100644
> --- a/drivers/mfd/mxs-lradc.c
> +++ b/drivers/mfd/mxs-lradc.c
> @@ -90,7 +90,7 @@ static struct resource mx28_touchscreen_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(MX28_LRADC_CH7_IRQ, "mxs-lradc-channel7"),
>  };
>  
> -static struct mfd_cell mx23_cells[] = {
> +static const struct mfd_cell mx23_cells[] = {
>  	{
>  		.name = "mxs-lradc-adc",
>  		.resources = mx23_adc_resources,
> @@ -103,7 +103,7 @@ static struct mfd_cell mx23_cells[] = {
>  	},
>  };
>  
> -static struct mfd_cell mx28_cells[] = {
> +static const struct mfd_cell mx28_cells[] = {
>  	{
>  		.name = "mxs-lradc-adc",
>  		.resources = mx28_adc_resources,
> @@ -128,7 +128,7 @@ static int mxs_lradc_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *node = dev->of_node;
>  	struct mxs_lradc *lradc;
> -	struct mfd_cell *cells = NULL;
> +	const struct mfd_cell *cells = NULL;
>  	struct resource *res;
>  	int ret = 0;
>  	u32 ts_wires = 0;
> diff --git a/drivers/mfd/rohm-bd718x7.c b/drivers/mfd/rohm-bd718x7.c
> index 0b0f8e27e329..bd087004dde8 100644
> --- a/drivers/mfd/rohm-bd718x7.c
> +++ b/drivers/mfd/rohm-bd718x7.c
> @@ -19,12 +19,12 @@
>  
>  #include "rohm-pwrbutton.h"
>  
> -static struct mfd_cell bd71837_mfd_cells[] = {
> +static const struct mfd_cell bd71837_mfd_cells[] = {
>  	{ .name = "bd71837-clk", },
>  	{ .name = "bd71837-pmic", },
>  };
>  
> -static struct mfd_cell bd71847_mfd_cells[] = {
> +static const struct mfd_cell bd71847_mfd_cells[] = {
>  	{ .name = "bd71847-clk", },
>  	{ .name = "bd71847-pmic", },
>  };
> @@ -113,7 +113,7 @@ static int bd718xx_i2c_probe(struct i2c_client *i2c)
>  	struct irq_domain *irq_domain;
>  	int ret;
>  	unsigned int chip_type;
> -	struct mfd_cell *mfd;
> +	const struct mfd_cell *mfd;
>  	int cells;
>  
>  	if (!i2c->irq) {
> diff --git a/drivers/mfd/rsmu_core.c b/drivers/mfd/rsmu_core.c
> index fd04a6e5dfa3..02bfb84653ae 100644
> --- a/drivers/mfd/rsmu_core.c
> +++ b/drivers/mfd/rsmu_core.c
> @@ -22,7 +22,7 @@ enum {
>  	RSMU_N_DEVS = 2,
>  };
>  
> -static struct mfd_cell rsmu_cm_devs[] = {
> +static const struct mfd_cell rsmu_cm_devs[] = {
>  	[RSMU_PHC] = {
>  		.name = "8a3400x-phc",
>  	},
> @@ -31,7 +31,7 @@ static struct mfd_cell rsmu_cm_devs[] = {
>  	},
>  };
>  
> -static struct mfd_cell rsmu_sabre_devs[] = {
> +static const struct mfd_cell rsmu_sabre_devs[] = {
>  	[RSMU_PHC] = {
>  		.name = "82p33x1x-phc",
>  	},
> @@ -40,7 +40,7 @@ static struct mfd_cell rsmu_sabre_devs[] = {
>  	},
>  };
>  
> -static struct mfd_cell rsmu_sl_devs[] = {
> +static const struct mfd_cell rsmu_sl_devs[] = {
>  	[RSMU_PHC] = {
>  		.name = "8v19n85x-phc",
>  	},
> @@ -51,7 +51,7 @@ static struct mfd_cell rsmu_sl_devs[] = {
>  
>  int rsmu_core_init(struct rsmu_ddata *rsmu)
>  {
> -	struct mfd_cell *cells;
> +	const struct mfd_cell *cells;
>  	int ret;
>  
>  	switch (rsmu->type) {
> diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
> index f683fdb6ece6..b0db33c0a7f2 100644
> --- a/drivers/mfd/stmfx.c
> +++ b/drivers/mfd/stmfx.c
> @@ -73,7 +73,7 @@ static const struct resource stmfx_ts_resources[] = {
>  	DEFINE_RES_IRQ(STMFX_REG_IRQ_SRC_EN_TS_OVF),
>  };
>  
> -static struct mfd_cell stmfx_cells[] = {
> +static const struct mfd_cell stmfx_cells[] = {
>  	{
>  		.of_compatible = "st,stmfx-0300-pinctrl",
>  		.name = "stmfx-pinctrl",
> diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
> index f49cee91f71c..c5f375cd22ae 100644
> --- a/drivers/mfd/vexpress-sysreg.c
> +++ b/drivers/mfd/vexpress-sysreg.c
> @@ -69,7 +69,7 @@ static const struct software_node vexpress_sysreg_sys_flash_swnode = {
>  	.properties = vexpress_sysreg_sys_flash_props,
>  };
>  
> -static struct mfd_cell vexpress_sysreg_cells[] = {
> +static const struct mfd_cell vexpress_sysreg_cells[] = {
>  	{
>  		.name = "basic-mmio-gpio",
>  		.of_compatible = "arm,vexpress-sysreg,sys_led",
> -- 
> 2.53.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
