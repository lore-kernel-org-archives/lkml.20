Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6BF48EC63;
	Tue, 15 Sep 2026 08:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460806; cv=none; b=WzunaiOq3z4JrmgGkSLRUuYlyH6T/xU4u4cpKjYMX1M5ftRNjOE9VgR6qj7cRtYOP9tcuxrymdLmcNMh21MtR2reXTly67NjiaCkV37PPSxVFy/g6DkqjrX0op21zpboo0hYDQJN10OZYqZbMCySjwfsWgCkRfhIb0KK0fC1mDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460806; c=relaxed/simple;
	bh=Mcxm2eZBaUSab7V2BxURMy56qBJEYr7x6oE4KD5VWB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZw68/PPn8CKnGUCBOx00aUS9FpTescQbDM2ANG8MgHfOu2tZsgVMXJO9hAPkvJmmJLC8Gj+jI+DYKYojMIcIwFIZLl9WN0VXrAyvbCEHTL7cdZXHVw6xW/wJvPUWpseBSdg8eSWiZFA2ZXvkwOIg+6Nrem9wxl8/YJrxU1JDSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QSLAnEuw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QSLAnEuw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789460802;
	bh=Mcxm2eZBaUSab7V2BxURMy56qBJEYr7x6oE4KD5VWB0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QSLAnEuwULHu0mfV2zcgoR8yvQQUWiQK2L+deDnun03gaXkSAnr8/04QFcC70z5AM
	 IwXH/ydw/MjUfqWSKSzYjmI/qRPTUkBoj6Lw7heRJNZPk9uSM2sUUjIT3A78DzQuJj
	 rhNQJ9HU/cQd1ettpY8dMzYPslS+qOSVzsBsuDy+WmjMsDXAOjy8YES+DxA5V9XvBT
	 Mb/WX9a6MVvzOcTZMBqGdmw5okTpuW2jqsaPsRDRNP0Q2J9UX4XOSPXwRPHL7EfJpr
	 RpQ6yOss/bCSf9srn4HKEJhkf9sChdoS2f0L2PjQhdAiCnxI4lmsAifgVrP3SfqjpN
	 44gKhJn07n8Hg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29FF217E07DB;
	Tue, 15 Sep 2026 10:26:41 +0200 (CEST)
Message-ID: <bcf23df0-30bf-4dd6-b5ad-7ad23f74efa2@collabora.com>
Date: Tue, 15 Sep 2026 10:26:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume
 errors
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Cyril Chao <Cyril.Chao@mediatek.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Dan Carpenter <error27@gmail.com>, cassiogabrielcontato@gmail.com,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
 <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com>
 <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
 <CAABR9nGVYghGE-kshpeJQJrvuUFJmDATW_mBCoJfVwDNVnSErw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAABR9nGVYghGE-kshpeJQJrvuUFJmDATW_mBCoJfVwDNVnSErw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 10:23, Bui Duc Phuc wrote:
> Hi Angelo,
> 
> 
>>>
>>> In the probe function, there's a call to devm_regmap_init_mmio(), and that's being
>>> correctly checked for error as in, if any, probe will fail.
>>>
>>> So... during suspend or resume or anywhere else in this driver really, the regmap
>>> pointer can't be NULL.
>>> The right thing to do here would be to just remove the useless check.
>>>
>>> Mind you, this comment applies to some other commits in this series as well.
>>>
> 
> I found something interesting:
> 
> in mt8189_afe_pcm_dev_probe()
> 
> -------------------------------------
> afe->runtime_resume = mt8189_afe_runtime_resume;
> afe->runtime_suspend = mt8189_afe_runtime_suspend;
> 
> ret = devm_pm_runtime_enable(dev);
> if (ret)
> return ret;
> 
> /*
> * Audio device is part of genpd. Registering it as a syscore device
> * ensure the proper power-on sequence of the AFE device.
> */
> dev_pm_syscore_device(dev, true);
> 
> /* enable clock for regcache get default value from hw */
> ret = pm_runtime_resume_and_get(dev);
> if (ret)
> return dev_err_probe(dev, ret, "failed to resume device\n");
> 
> afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
>     &mt8189_afe_regmap_config);
> if (IS_ERR(afe->regmap)) {
> ret = PTR_ERR(afe->regmap);
> goto err_pm_put;
> }
> -----------------------------------------------
> 
> Here, it looks like mt8189_afe_runtime_resume() gets called
> before devm_regmap_init_mmio().
> 
> So if we remove this part:
> ---------------------
> if (!afe->regmap) {
>          dev_warn(afe->dev, "skip regmap\n");
>          return 0;
>      }
> -----------------------
> from mt8189_afe_runtime_resume(), that could actually trigger the bug
> we were just discussing.
> 
Well, then...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

...still, please check the other cases.
