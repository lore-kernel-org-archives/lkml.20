Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426851;
	b=HmAMzPAm/7UfJeYF+O/hYCV6TEFsk2eCrUPS1tg9khPiSL6dB9Hpdw+ScXOhqW1wjTw8
	 BKU5okR80suWvGlb5Tw960+PRFn+fVUTr4S94e0R1Xi7014XWBwfKPgyiRNXK1xtKRLA9
	 ysNkmhkZBo9jH1dVilJ+3CCj33XS+QECXfqVc8rBuSNji4com7vyPGwl7SdosMUemvOwV
	 DmjBww7LlcoQ6DC6iPQtcAhWHhLZCrurMbg0tB4grTCtqkoBd2Pt8Jz9ZOtyXYi287Bj2
	 cfWW8eNVbU03l9vsES1Jcf+/PFivrfsWDpoetHBSseDV4KHEMeeP83ztAroVISmZ8xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426851;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=J/0wPbhXzTQT3bpxR/dxioe0MV62x2a+VU8CjVUfg+A=;
	b=gNuj5gZX3carHKbztaLmO/xK2Nj8XNKmHkWKTK7LZX0mM7xxMHlBrNq2zu862FMOQPGp
	 U8rG1rJ6H+SnSGDuwncMCFq7/UAGffBKGYWh9I+2+iCJGInfXfDm6lckEZaog9ebI0mlL
	 DsNZfC8MW5/PJbQoL9NBfaSpy27GCIylvlyh3ZXYHkWsMreEGZxVaP//Er/vJVf0tj1bB
	 9dfAp8RVPgqTMO/tVdL6KF1UwevWL9lLk9Hsad7mDqGty/XajQ0VD70Z7M490EVHsOVOx
	 2EyXibHpifw7UPgHBERVv7629ZYK1b7u5SdFcO5YdX3HKR+ezik+cQ9WEJnWM9Ab77g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xOaYxYMH;
	arc=none smtp.remote-ip=95.215.58.108
Received: from mta1.migadu.com (out-108.mta1.migadu.com [95.215.58.108])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C52F606A333
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C52F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xOaYxYMH
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xeca3n6lmfyJVzcxN3CESOBuimNE32PHjo4jv87HDG4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792426849; v=1; x=1793031649;
 b=xOaYxYMHRgUpFq94Z31nEPnhj3ySdI57wx7UEImkWB/nkCX3pVHzPMoRN5AsSRznFW0XHTgP
 kUQMoON0UORLKt4+0swkpS+24kAAf291jau4BXwUc+Crwcm1C+bcAKRuKW20NxzgJ6e62fF8wDA
 7cgW7kbe7HrVzIEADD+hJ0yY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d60bd2750841b06b;
	Mon, 19 Oct 2026 16:20:47 +0000
X-Mizu-Trace-ID: d60bd2750841b06b
X-Migadu-Flow: FLOW_OUT
Message-ID: <e1d55639-bdb2-4b26-876b-68c71e7f724f@linux.dev>
Date: Mon, 19 Oct 2026 18:19:10 +0200
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
Subject: Re: [PATCH 4/4] ASoC: SDCA: class_function: clear sconfig.bps on PDM
 data-port terminals
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261018192359.287987-5-srinivas.kandagatla@oss.qualcomm.com>
 <atXck2Ef4OllKrAA@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <atXck2Ef4OllKrAA@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>  static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
>>  					     struct snd_pcm_hw_params *params,
>>  					     struct snd_soc_dai *dai)
>> @@ -133,6 +144,7 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
>>  	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
>>  	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
>>  	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
>> +	struct sdca_entity *entity = &drv->function->entities[dai->id];
>>  	struct sdw_stream_config sconfig = {0};
>>  	struct sdw_port_config pconfig = {0};
>>  	int ret;
>> @@ -152,6 +164,9 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
>>  
>>  	pconfig.num = ret;
>>  
>> +	if (class_function_terminal_is_pdm(entity->iot.type))
>> +		sconfig.bps = 0;
> 
> I think this is fine, as you say bps makes no sense for a PDM
> stream but I might need to spend a little more time working out
> how this all propagates through the core. I guess my concern is
> if other drivers don't handle PDM in the same way.

It's a bit odd to rely on bps when we already have a type for the stream
in struct sdw_stream_config:

@type: Stream type PCM, PDM or BPT



