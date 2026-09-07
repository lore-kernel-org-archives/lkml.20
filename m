Received: from mta0.migadu.com (out-115.mta0.migadu.com [91.218.175.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CF5483BEC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780761; cv=none; b=dRr+aV3W0fdf7vo/PObaOosOWrVrbTeo0xMLy5JUNHvxNZ6JRMo06ATdRq/aBhIx57ksrrdhFPgAmgP9xXBmmFVDtb84TP0voRAmCdvFvox089Ijke2DfO4DLuLnpZnlABprjvAZdJ37APsqopUZFf4jZQ/glrbTZQo+jNgw7fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780761; c=relaxed/simple;
	bh=nor8OMnKbqc68bSUdRJWTTEArN9hgfGagsM9dJidQ/Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Rcaq2z1UTpdsWYWRS8uydkyZclBBXPqB8mmEUHTt6PBSBqDsdVwQzEo5ihvfvyfwrI2ui2SqyosrHVUZDdguQzyab/yWUoHuIREbvVL+8YW7WrEXAjnqH5wxqKtSRW73O79aJJKCcrGUZOd5uBDeuBBYuEboWR0dfG/KO/qv0ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PVRMMyIJ; arc=none smtp.client-ip=91.218.175.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PVRMMyIJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nor8OMnKbqc68bSUdRJWTTEArN9hgfGagsM9dJidQ/Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788780757; v=1; x=1789385557;
 b=PVRMMyIJnFMzKdqJd0rNse39XdFAzMtZfvTcsInd6N1yHRBcjDn3mzHp7ircDhfXP3k4unyG
 rvN5oWzSkC6LiKVR7vc+/MPnyfwvB2pP1gIBDitnColaUV9NaBNoE5/ZrDcqs6WZ57zTtz9FHp+
 FCpmJuVhCaqQYCnrlsAjxWYo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ad12b088e5b25ee6;
	Mon, 07 Sep 2026 11:32:37 +0000
X-Mizu-Trace-ID: ad12b088e5b25ee6
X-Migadu-Flow: FLOW_OUT
Message-ID: <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
Date: Mon, 7 Sep 2026 13:32:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
 Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
 patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 10:37, Srinivas Kandagatla wrote:
> Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
> mode over SoundWire.  On ARM/DT platforms without ACPI/DisCo firmware
> the SDCA topology and SoundWire port properties are supplied as static
> data through the codec driver.

wow, I realize now I completely misunderstood what this whole endeavor
was about. I *thought* the point was to read the information about all
the functions from Device Tree tables. I now understand there are no
such tables, all the information is encoded in C as part of the
higher-level codec driver.

Is this really intended?
I mean, the whole ACPI set of definitions relied on the _DSD mechanism
that mimics what DT provides. Do we really want all this information in
C? Why not have a set of DT properties for each function?

I guess my main objection is for opaque initialization data aka blind
writes or SWF table, this should really come from platform firmware, no?
With this approach you'd have an endless set of kernel quirks for each
board variant using the same codec.
> +static int wcd9378_sdca_hw_init(struct sdw_slave *slave)
> +{
> +	struct device *dev = &slave->dev;
> +	struct gpio_desc *reset;
> +	int ret;
> +
> +	/* No SPMI parent: supplies and reset live on the SoundWire DT node. */
> +	ret = devm_regulator_bulk_get_enable(dev,
> +					     ARRAY_SIZE(wcd9378_sdca_supplies),
> +					     wcd9378_sdca_supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable supplies\n");
> +
> +	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(reset))
> +		return dev_err_probe(dev, PTR_ERR(reset),
> +				     "failed to get reset GPIO\n");
> +
> +	if (reset) {
> +		gpiod_set_value(reset, 1);
> +		usleep_range(20, 30);
> +		gpiod_set_value(reset, 0);
> +		usleep_range(20, 30);
> +	}

Could this be part of wcd9378_sdca_probe()
> +
> +	/* SCP writes below need the slave attached. */
> +	ret = sdw_slave_wait_for_init(slave, 5000);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "slave attach timeout: %d\n", ret);

That wait doesn't seem required, if you are using the existing class
probe there's already a wait?
> +
> +	/*
> +	 * TX PDM clock: bank-1 shadow + SCP_COMMIT. SCP survives PDE
> +	 * cycles; one-shot at hw_init before any port is enabled.
> +	 */
> +	ret = sdw_write_no_pm(slave, WCD9378_SCP_HOST_CLK_DIV2_CTL_B1, 0x01);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "HOST_CLK_DIV2_CTL_B1: %d\n", ret);
> +
> +	ret = sdw_write_no_pm(slave, SDW_SCP_COMMIT, 0x02);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "SCP_COMMIT: %d\n", ret);
> +
> +	return 0;

and this could also be done in the existing .status callback upon
enumeration.

In other words the need for this hw_init() isn't very clear to me...

> +}
> +
> +static int wcd9378_sdca_populate_function(struct sdw_slave *slave,
> +					  struct sdca_function_data *function)
> +{
> +	/* @function->desc is already set by the framework; fill payload only. */
> +	if (function->desc->type != wcd9378_sdca_desc.type)
> +		return -EINVAL;
> +
> +	function->num_entities    = wcd9378_sdca_data.num_entities;
> +	function->entities        = wcd9378_sdca_data.entities;
> +	function->num_clusters    = wcd9378_sdca_data.num_clusters;
> +	function->clusters        = wcd9378_sdca_data.clusters;
> +	function->num_init_table  = wcd9378_sdca_data.num_init_table;
> +	function->init_table      = wcd9378_sdca_data.init_table;
> +	function->reset_max_delay = wcd9378_sdca_data.reset_max_delay;
> +
> +	/* Elevate is_volatile / has_reset to match the DisCo/ACPI path. */
> +	sdca_apply_default_control_classifiers(function);
> +
> +	return 0;
> +}
> +
> +static const struct sdca_class_hw_ops wcd9378_sdca_hw_ops = {
> +	.hw_init           = wcd9378_sdca_hw_init,
> +	.populate_function = wcd9378_sdca_populate_function,
> +};
> +
> +int wcd9378_sdca_probe(struct sdw_slave *slave,
> +		       const struct sdw_device_id *id)
> +{
> +	struct device *dev = &slave->dev;
> +	struct sdca_device_data *data = &slave->sdca_data;
> +	struct wcd9378_priv *priv;
> +
> +	/*
> +	 * 0x0217:0x0110 covers both mobile and compute modes; the
> +	 * qcom,wcd9378c variant compatible identifies compute-mode
> +	 * nodes only.  Mobile-mode nodes carry the plain class-ID
> +	 * compatible and are picked up by the mobile driver.
> +	 */
> +	if (!device_is_compatible(dev, "qcom,wcd9378c"))
> +		return -ENODEV;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, priv);
> +
> +	/* DT has no DisCo enumeration; seed the descriptor here. */
> +	if (!data->num_functions) {
> +		data->function[0].type = wcd9378_sdca_desc.type;
> +		data->function[0].adr  = wcd9378_sdca_desc.adr;
> +		data->function[0].name = wcd9378_sdca_desc.name;
> +		data->num_functions    = 1;
> +	}
> +
> +	return sdca_class_probe(slave, &priv->class, &wcd9378_sdca_hw_ops);
> +}
