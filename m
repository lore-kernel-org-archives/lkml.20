Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432921;
	b=qPj/CfgTozPvg9JT7pLDYA7J0w20u1It63i4kZ3hE+nVm0njN+LauO3Wf0zUKzECQ9Ve
	 KGsTCSlC6qoc1gEt9jnAnkQsUGY5Yrp1k1i3grGE2yypplLMgn2/X9CeM47T0M6G/oDCq
	 LVPUNhLcHuggdC2SlDI1tZEmsFRtIG2l1a/w3Gr+w65lcGNyHfEKop0FDtpcqh6raSvfq
	 yvKaFg0VGLZlfi7w9ckrG1mjCcZA5lvSEoATa2DAX0J/KrtsgsWlDaqgiBdTSusPS6ptV
	 3U8JhQKKjES8g1OvllyLA+7RKKn/qxQchPmOvHh5UvBE/BRin/d6sJU9cABXlD0H7zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432921;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sW6wsvLSGEQH+dHBFrKQtcaRjqkC6uKag18Gq8M8A28=;
	b=U0+Lgdln8o3SByBSpMBwXYqoIjO+f4qBQxaDYTu0KvnSF/0OA3KDefBuYnxDFIUdNd3j
	 VfDccY2Xho2vzzrkbYYPJ9msedOELycPFwxnxTiJKN0cQOU0cNdLe+TWnRK2UPbRkPxx/
	 YvgZBDzeIxKkh/3FoPLBRB0BglzznAezUx8/1Dsa1t8z0Mxdbscnd72B6usgbtmNO5OCJ
	 b7t0ezJuKeYD+y2XXBy3OQV8fOZCgKoDLA78BAYlXRjudDG40zlQmg0mxqD9A2vVYZwN1
	 Sa787J3SbACy0dElKGeItLG6+7ZbrzvDYf/ImWFjKEUA7qVFTLFw5MJTxUM0kX42BeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ndyLPVH1;
	arc=none smtp.remote-ip=91.218.175.34
Received: from mta0.migadu.com (out-34.mta0.migadu.com [91.218.175.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B39E606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B39E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ndyLPVH1
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Sa6gI7A8DHatasyW05KtrCrLMc7JhDUu7H0B12vA+gI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792432917; v=1; x=1793037717;
 b=ndyLPVH1H1drKL+VzJ+vDttoMx7wV3mua19LFiLsCux3tyfcERf2nz0UFj1/t0XNurlmRoap
 CJHWpE/YPJ59boR3WP6O0wR3cb9o1Jax9AewtNpQr94fWwHf1c+TWZJ1dN3MPW5NiBoZOWKHqVd
 52jno0a1XmNpTUKHGY1R8fhA=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0a68e15fcdf969c1;
	Mon, 19 Oct 2026 18:01:57 +0000
X-Mizu-Trace-ID: 0a68e15fcdf969c1
X-Migadu-Flow: FLOW_OUT
Message-ID: <1d05936f-c5f0-42f5-bc3e-ae793a04b73d@linux.dev>
Date: Mon, 19 Oct 2026 11:01:53 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: tas2783-sdw: refuse playback when the init
 writes failed
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, broonie@kernel.org
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Niranjan H Y <niranjan.hy@ti.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
 <20261018200009.1493438-4-matthew.schwartz@linux.dev>
 <3ef796a7-33f5-4b9c-9a18-476acf39c7ac@linux.dev>
Content-Language: en-US
From: Matthew Schwartz <matthew.schwartz@linux.dev>
In-Reply-To: <3ef796a7-33f5-4b9c-9a18-476acf39c7ac@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/19/26 9:10 AM, Pierre-Louis Bossart wrote:
> On 10/18/26 22:00, Matthew Schwartz wrote:
>> When the SDCA function initialization writes fail, tas_io_init() leaves
>> hw_init false, but the firmware download has already set fw_dl_success,
>> so tas_sdw_hw_params() goes on to play through an amp that is missing
>> part of its setup. On the ASUS ROG Xbox Ally X20 those writes come from
>> the ACPI DisCo initialization table and include the posture, which the
>> BIOS sets differently on each amp.
>>
>> Refuse playback until the init writes have completed as well, and log
>> which of the two steps is missing. A stream that is only prepared again
>> after a resume does not go through hw_params, so check in the port
>> prepare as well.
> 
> Same comment as the previous patch. This patch logs an error message for
> a critical error, which seems fine, but what does it take to make the
> init writes succeed in the first place?
> IOW, this patch flags an incorrect setup without giving information on
> what possible corrective actions could be taken.

Same as the last one, I haven't seen this fail on the X20. The init
writes come from the DisCo table on the X20, or from tas2783_init_seq
on platforms without one, so they'd fail either on a bus error while
the amp attaches or on an entry that the regmap or the amp rejects. A
bus error can clear up, since hw_init stays false and the init runs
again on the next attach, which on the X20 is the next idle wake. A
rejected entry fails every time, and fixing it means knowing which
entry it was, which the log doesn't tell you today, as
sdca_regmap_write_init() just returns the first error. I'll log the
failing address and value in v2 so a report says what needs fixing.

> 
>> Fixes: ca8f3611dcf8 ("ASoC: tas2783A: use acpi initialisation table")
>> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
>> ---
>>  sound/soc/codecs/tas2783-sdw.c | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
>> index 8e7376889b6d..6c4cc8868415 100644
>> --- a/sound/soc/codecs/tas2783-sdw.c
>> +++ b/sound/soc/codecs/tas2783-sdw.c
>> @@ -1055,6 +1055,11 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
>>  		return -EINVAL;
>>  	}
>>  
>> +	if (!tas_dev->hw_init) {
>> +		dev_err(tas_dev->dev, "error playback without init writes");
>> +		return -EINVAL;
>> +	}
>> +
>>  	sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
>>  	if (!sdw_stream)
>>  		return -EINVAL;
>> @@ -1427,6 +1432,12 @@ static int tas_port_prep(struct sdw_slave *slave, struct sdw_prepare_ch *prep_ch
>>  	addr = SDW_DPN_PREPARECTRL(prep_ch->num);
>>  	switch (pre_ops) {
>>  	case SDW_OPS_PORT_PRE_PREP:
>> +		if (!tas_dev->hw_init) {
>> +			dev_err(dev, "error port %d prepare without init writes\n",
>> +				prep_ch->num);
>> +			return -EINVAL;
>> +		}
>> +
>>  		/*
>>  		 * The Function has to be powered before the port can complete
>>  		 * channel preparation.  hw_params() does that when a stream is
> 

