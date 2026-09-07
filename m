Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AA7472F84
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786195; cv=none; b=KGFHnmVtDQAUWreoBb3XKUkjKh0M37CuV36SqhckJ0DHFRIhy7E56FoCIgRWGIDqreonhH6P7hpjjd6Vx4KJD9cAUIprPcxBqSviSJLdbGIc+UwgjPQyfuIip22AXNRjJMlpg6qGItUdZry7VLAW2JmZwevMej+5xQnlHOznYqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786195; c=relaxed/simple;
	bh=73jAnViu/1SeioaAgHXKmEaKDNd7BfCn+yxrO00hjUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SehXa0yg9NNUrFiaP0lp9LLDsze0CFZbiOAab03KTGzQTOqDUtIrYaL/1bkHyMDbbxPs5NXwjGJMWnQGg1bwfNORc09tyEBiCpBD5U+PpQOeyMXDmWeGj4boNcr7WM5BmY+H0KS0LsLbSgHs2tEh1Dd3cka7A1k1Sh0pnSzvaI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l9XELI78; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqhYZ5cd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l9XELI78";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqhYZ5cd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An80f3350140
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zVF75xZvVYhZe9KWDOZ1dIGPa2bo7QkSIlRemr9XaoM=; b=l9XELI78Lu7Ml3M6
	aLbEdmBGjIGb3yrty8qO6inHnl1f4WLwg3gnI+TE7VG8By4uED5ObHVPh4jbUv7d
	axex2xPpr2U2j30fPBmtLVyaFwP160bVD3tqEbH8kjQDGfSK/4EfaaWjXEQXpsEu
	nwGecrR58j3KkMRcWAaBfnYA045sciTQ/ZYUmtRDm5lU58xyF4aojnOz1jJ3kkj+
	/o/pEqHrQvpLNfS17YvoTdRQFxn650ClHI/G//UlFTa3H29L0rcxUoLIveCfU0Ek
	0uM74qwSItmJhkSNimAf7GB7m6T3GmeEUN/apOmW3Xhw+/2jiRAF0In5u7p16wEx
	XMyfgg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0v60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:03:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c664914e69so3886809e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786183; x=1789390983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zVF75xZvVYhZe9KWDOZ1dIGPa2bo7QkSIlRemr9XaoM=;
        b=HqhYZ5cdVhZckbUiMEs2+zJ5+D7gSuSZqgXlfr1RSXnnBg/lZdk6A3sKdSI8AqwIK+
         /LXtBCYKMJ7jgi5tYSvhcl5Upk6sf0pMt2cpYn/7B24bDbRW28PMb3VRGx2kjcOzwCiO
         HgUz4JNwccxRsrs+nx/SjRBejYO/hmLjr2bVvBC7uPX+4NRy3EX9oAPQkm4fxjZ/mD/E
         9tWXs1Oj0ovu+ievYlzVl/DFJVeUYrwzla7hOxh0lcIMzpwqxXCwntyQwTISKgHIz7RI
         4J2jE1U4IoSfYs4Jp5F5jbONb7WKc9dnBvouY+2JUA75tG+wOG9bk26sim5ZXhQOQvEb
         tZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786183; x=1789390983;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zVF75xZvVYhZe9KWDOZ1dIGPa2bo7QkSIlRemr9XaoM=;
        b=lLgyed2OGZZIsRTO6sS9XLNqo8FRvJqT6AJBu6TcFY+Z25gBFkdPCy9kA8kBZ/VZtP
         BLeU331cuV0uEGlcBJ88oX5nn6VfQutA1HLIHaX1S7d+HsEhqTw7XduSTh3L2LvBdfoU
         IcHWLExwP+5hDTJLviIkVWq5UFrlNq7AvyRAr6rgUrAxBIyVHescBjAm9bRfFIw12OHT
         6Lu+OCjBKVvWCWe8IQzfIAxg2bxDNc2N0uhzUZmXq/EW7FXoAY7A1y2IRZTZ9OtR8c2w
         hWeNQKKsenRGu6eTisIPWoGmsh/fn8LYNwYZFtDbaTSDRUFb/Ja1/xb2dgdLYZR1XIFJ
         wymQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3cNVqID0TOvFQxRPQX0eJfG+QW2Gm5nHR+Al6WTSlEF2MEsVS+tx5PssP/ssV+ZOavdOXz7+9CpPxz/M=@vger.kernel.org
X-Gm-Message-State: AFuF++llb3nlg1e44V7otFGAvGnIBTyRO3C/RV+UNEYwqXMV3MkZOKVt
	j2ZGbVqanraFp/xTe16byslZQ3A8Cb07A6QR5Tmo6SvBy3VdTGeF5L1ebDEfCHdXX9zuWqvhGG9
	bV7pzmhRBR/hDjHnzdg9523N0HAfibsHPoOw6SXHXBCwfP2VM8KONcmlM9PAOmheIlbY=
X-Gm-Gg: AYBFou3fneyIclmSUmaxTiA/SQUdLqy4znG6RNuhc9ZRbBmpJId1pogLtzciOl36CwC
	6wfeEgQnNFvP7l0vqrykx4SOwmnu6L9IUBKbLDM7zFywKPEmus27njIsuH6E+PF1Yt08aoJeS+I
	MvDnsx4Z5Ax4FtzauXoXSTyj9evCf9O7zV6Bcc4WaCvDBQkGyOlxHOXKJDeUz5WrEQ+q0I9unPR
	+DtcbEdpAdVhtrS2iE9YHN0WwQAkQuvruscDnoZbBj5A/bLpcAF/u7FxMwjYUwUXge7Ag8mWiXZ
	jjHV6iypA6qRXiqQfflfpurgXJdrVHd6kaS5L9W61+yBpJ7L0dtG63VfLVhJvzgE5WhBJwAoCsL
	OmaU5Vrc4JXs2t5bDmh9GRn/+Lw4=
X-Received: by 2002:a05:6122:c11c:b0:5c6:64ac:d6f3 with SMTP id 71dfb90a1353d-5c7ed612e57mr10021542e0c.3.1788786182537;
        Mon, 07 Sep 2026 06:03:02 -0700 (PDT)
X-Received: by 2002:a05:6122:c11c:b0:5c6:64ac:d6f3 with SMTP id 71dfb90a1353d-5c7ed612e57mr10021449e0c.3.1788786182032;
        Mon, 07 Sep 2026 06:03:02 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm27254607f8f.3.2026.09.07.06.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:03:01 -0700 (PDT)
Message-ID: <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:03:00 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9eb607 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OGjWj8McAAAA:8 a=D19gQVrFAAAA:8 a=VwQbUJbxAAAA:8 a=32YqD_e_CNEs7w_r1eYA:9
 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10 a=tNoRWFLymzeba-QzToBc:22
 a=UYjydHh6ynBBc6_pBLvz:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-GUID: goRs5cQLXTOVLZ0gFuessUbMolYPoWqO
X-Proofpoint-ORIG-GUID: goRs5cQLXTOVLZ0gFuessUbMolYPoWqO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfX4dWX7Wd+rIwH
 CNRHkdE/WiP3p5uoA7zqu8Yf9+K9zlaQNdiDuVJiudJ4WP5hspME+TGiOJlRgOi5AqYj/hJpFpp
 R6JB1iP9AQOfHOMYdGUvMicf++3iZy0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfX/muZ4xgQl34d
 3j6iBs05neQWF9diS/BUrOFkE0/vef0s6DkhoRRx4A12RphwJbXUEXYIdSw1Kaj4fbxSqimog0S
 C7I8QYe4Un9Sck/aP7RFKsjKuyNQciyDA9VClW1u3svEztuJOvfI/MRJoQqcfIyAAUtcJxc0fsa
 yUz89xwJBUV2MNHDHy2o+su8seDMV1FswtqPmltAar/WvNqTnAhehtd2tVqJitH6h7tNhn8Kodl
 NXEczdQDuKdvb/HQaftOo1sAV6idtuCcRmxrJzkSC3hJJxH+sIgay+QPz0CylRRwVcnzD6IotFK
 wc/sbsiruih/K/kE6KBj+HGgeAnvhAHsitEBzpDvIDbOhtCJbVYSzEzEPlPr1gIfiIzzZQzV9LV
 bhnqT+XcQhtesbn8paUr8xTEADZwY6mV7EwinTFBGmoWdDX3W3mtluOyOhGEvJtTlQmDyApj2a9
 BNnrNYd/AiExIL55WTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070144

Thanks Pierre for review,

On 9/7/26 12:32 PM, Pierre-Louis Bossart wrote:
> On 9/7/26 10:37, Srinivas Kandagatla wrote:
>> Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
>> mode over SoundWire.  On ARM/DT platforms without ACPI/DisCo firmware
>> the SDCA topology and SoundWire port properties are supplied as static
>> data through the codec driver.
> 
> wow, I realize now I completely misunderstood what this whole endeavor
> was about. I *thought* the point was to read the information about all
> the functions from Device Tree tables. I now understand there are no
> such tables, all the information is encoded in C as part of the
> higher-level codec driver.
> 
> Is this really intended?
Unfortunately Yes.

> I mean, the whole ACPI set of definitions relied on the _DSD mechanism
> that mimics what DT provides. Do we really want all this information in
> C? Why not have a set of DT properties for each function?
> 

We discussed this topic at LPC 2025, Devicetree MC:
    "DeviceTrees - MIPI SoundWire Device Class for Audio (SDCA) and
     classic ACPI-DT problem"
    https://lpc.events/event/19/contributions/2024/

Among other options presented, representing them in a intermediate
format was something which was doable.

I have also proposed another follow up of this topic in this years LPC
Devicetree MC too

RFC of this patchset got some comments from DT maitainers.

DT maintainers are not happy with the idea of keeping this info in DT
while it can be derived from compatible string.

https://lkml.org/lkml/2026/7/29/1166

> I guess my main objection is for opaque initialization data aka blind
> writes or SWF table, this should really come from platform firmware, no?
This table is directly generated from ACPI tables both from Lenovo T14
and Reference platform.

on ARM platforms DT is is the only firmware entry for such things and
its not 1:1 with ACPI example, Somethings that can be derived can not be
in Device tree description so its bit of mix.

> With this approach you'd have an endless set of kernel quirks for each
> board variant using the same codec.

@Krzysztof Kozlowski <krzk+dt@kernel.org> that is a valid point.

Idea is to gate them using platform specific compatibles, so far we have
few laptops that are pretty much identical w.r.t the description, may be
we got lucky in this early stages.

In future if it turns out to need a quirks per platform or changes
needed in this table then we should be able to handle it with platform
specific device compatibles.



>> +static int wcd9378_sdca_hw_init(struct sdw_slave *slave)
>> +{
>> +	struct device *dev = &slave->dev;
>> +	struct gpio_desc *reset;
>> +	int ret;
>> +
>> +	/* No SPMI parent: supplies and reset live on the SoundWire DT node. */
>> +	ret = devm_regulator_bulk_get_enable(dev,
>> +					     ARRAY_SIZE(wcd9378_sdca_supplies),
>> +					     wcd9378_sdca_supplies);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to enable supplies\n");
>> +
>> +	reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>> +	if (IS_ERR(reset))
>> +		return dev_err_probe(dev, PTR_ERR(reset),
>> +				     "failed to get reset GPIO\n");
>> +
>> +	if (reset) {
>> +		gpiod_set_value(reset, 1);
>> +		usleep_range(20, 30);
>> +		gpiod_set_value(reset, 0);
>> +		usleep_range(20, 30);
>> +	}
> 
> Could this be part of wcd9378_sdca_probe()

Good point, I have now moved this to probe and eliminates need of
hw_init callback all together, I can fold that in next version.


--srini
>> +
>> +	/* SCP writes below need the slave attached. */
>> +	ret = sdw_slave_wait_for_init(slave, 5000);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "slave attach timeout: %d\n", ret);
> 
> That wait doesn't seem required, if you are using the existing class
> probe there's already a wait?
>> +
>> +	/*
>> +	 * TX PDM clock: bank-1 shadow + SCP_COMMIT. SCP survives PDE
>> +	 * cycles; one-shot at hw_init before any port is enabled.
>> +	 */
>> +	ret = sdw_write_no_pm(slave, WCD9378_SCP_HOST_CLK_DIV2_CTL_B1, 0x01);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "HOST_CLK_DIV2_CTL_B1: %d\n", ret);
>> +
>> +	ret = sdw_write_no_pm(slave, SDW_SCP_COMMIT, 0x02);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret,
>> +				     "SCP_COMMIT: %d\n", ret);
>> +
>> +	return 0;
> 
> and this could also be done in the existing .status callback upon
> enumeration.
> 
> In other words the need for this hw_init() isn't very clear to me...
> 
>> +}
>> +
>> +static int wcd9378_sdca_populate_function(struct sdw_slave *slave,
>> +					  struct sdca_function_data *function)
>> +{
>> +	/* @function->desc is already set by the framework; fill payload only. */
>> +	if (function->desc->type != wcd9378_sdca_desc.type)
>> +		return -EINVAL;
>> +
>> +	function->num_entities    = wcd9378_sdca_data.num_entities;
>> +	function->entities        = wcd9378_sdca_data.entities;
>> +	function->num_clusters    = wcd9378_sdca_data.num_clusters;
>> +	function->clusters        = wcd9378_sdca_data.clusters;
>> +	function->num_init_table  = wcd9378_sdca_data.num_init_table;
>> +	function->init_table      = wcd9378_sdca_data.init_table;
>> +	function->reset_max_delay = wcd9378_sdca_data.reset_max_delay;
>> +
>> +	/* Elevate is_volatile / has_reset to match the DisCo/ACPI path. */
>> +	sdca_apply_default_control_classifiers(function);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct sdca_class_hw_ops wcd9378_sdca_hw_ops = {
>> +	.hw_init           = wcd9378_sdca_hw_init,
>> +	.populate_function = wcd9378_sdca_populate_function,
>> +};
>> +
>> +int wcd9378_sdca_probe(struct sdw_slave *slave,
>> +		       const struct sdw_device_id *id)
>> +{
>> +	struct device *dev = &slave->dev;
>> +	struct sdca_device_data *data = &slave->sdca_data;
>> +	struct wcd9378_priv *priv;
>> +
>> +	/*
>> +	 * 0x0217:0x0110 covers both mobile and compute modes; the
>> +	 * qcom,wcd9378c variant compatible identifies compute-mode
>> +	 * nodes only.  Mobile-mode nodes carry the plain class-ID
>> +	 * compatible and are picked up by the mobile driver.
>> +	 */
>> +	if (!device_is_compatible(dev, "qcom,wcd9378c"))
>> +		return -ENODEV;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(dev, priv);
>> +
>> +	/* DT has no DisCo enumeration; seed the descriptor here. */
>> +	if (!data->num_functions) {
>> +		data->function[0].type = wcd9378_sdca_desc.type;
>> +		data->function[0].adr  = wcd9378_sdca_desc.adr;
>> +		data->function[0].name = wcd9378_sdca_desc.name;
>> +		data->num_functions    = 1;
>> +	}
>> +
>> +	return sdca_class_probe(slave, &priv->class, &wcd9378_sdca_hw_ops);
>> +}

