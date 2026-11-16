Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847274;
	b=oPhaungnxHtH6+lG4di2pQngFhSOQ+ndgtVsH2vRW2w6XpY0IT9g0mndfYbJDD+JYpGo
	 PU2AV0ADCJJ4ZerpBsxS97RJMojZRgWuZIxtzeE9UpVQWUtdOXTFBX0nSLLNB9U8dlsVI
	 qXknyfEQIxnzt6sPRfJbM/VHvcYcquTti6jgrW7TnPMrQfMMVpW3bXDKSVfvOpx1r6eTH
	 xRiif++BIBn+yAKhi8ml40hukMorvNpC5N7c8OXw44D5BsVsxLxdHCh3f8UQH8Q/LHPsJ
	 IqkPLvQGcAOCv5jeNfjp8ClDO72dBJzmfNkjJrq5jrZpqJWGmkbcv/Z0SxZRMspqqng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YA4HSjIeB4gPYXT/wWzHI76b1JmPd/ZJtbNmLZ/Ltrg=;
	b=wqJMbofYEaQa2nmvpdfwpWhKR7NU62NLf6fXy8cdAh/2EQGwMpi+QkRT0VOMPqZ/2ADh
	 YgD7eAw3k71dF9SieU+erWoAXXcRZx0R3eGIpTeiQz1Tyyc+L5kydFWQzzahCS8iWBMkn
	 4R81rsw04n0I12nxbeuXAkawsCxHEA2fAJwX+UMnaQqJHC5uH8HDye38LK/W9TzKpIsJ+
	 cZtzbct4BJQDvlNf/hn7nmIgOOTJiIEhe6kg4rPdmEydqrpRHKgfg8jRO0Ag8INLgMEBr
	 1dCQswSjO0uPJj+WvZZ8Xo0ELDlmMKIi1IpVX4lVxllTNNpdjkeNO52bu64eeJAdvbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V29fsNcR;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4E9606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:41:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF4E9606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V29fsNcR
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso23070685e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794847271; x=1795452071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YA4HSjIeB4gPYXT/wWzHI76b1JmPd/ZJtbNmLZ/Ltrg=;
        b=V29fsNcRoT+kHjA/1NgagaHF1FWALzsDmm3hWscsySkBhszGabODRevlhTC0yVyoA4
         s5WpF8LIAA+ASvyLwlzN95LtYaxvmAkhMm1t+UVMyhOTpIJXZ7F3CnKrO0vugySdFw+l
         /Sy1AucmfS/hf/lumS6MmQsmJmlfKeBbM62aAJdQ6RJbYO5s14O3uJdVlHkzh07+J+Zx
         +xCwL17WqOe9D66UjthUMLVdO/A4jh+Gg36jfqbt9Mpryo8ynrhlp4LGtA8Zbvd4YLJs
         yDD4DYf5zqcp8HBGoBIErVBVeRZS1Qp2zw4q57l0dGHIlSOB85C2G4Ppby9E3wIXXDKS
         +G4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847271; x=1795452071;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YA4HSjIeB4gPYXT/wWzHI76b1JmPd/ZJtbNmLZ/Ltrg=;
        b=q+xEFRwQ03b0pxrAX+eNtfR5a/5HKBL23YPadVPZyFWkpy0M3s/gAlExYoBN3HXVK4
         aN0wQFbCi133xhkD2F2pZIcsUo9Vm2++Ur7T339s5PZGfnnUAO6p0dQDSxuIf4AAQmuZ
         hY5uG4kcfKT41uWZtvaXQN1kZ0NvCpF7GXTueRkaX0ySJlXqcVMa4dfU+NueKnT7KhQa
         E7RaOcm+q9dEK9Ru2l+xmEW8kQd7sruNDUanVRMtr17JA7f6p1NS5fk4ULxqdKi+WRus
         +njUBfg37/MDFfkaeG9EFPwJPVMG3X6FhdIluudQlGv803N1b+l5Oct9D3rmuvSc+Trf
         4wEg==
X-Forwarded-Encrypted: i=1; AL+hErEusP7HbmimjRjmmaMonDmPtAMXh04h5yxz773sElpU1Xy0WBnZ7h95CF1JbuTjyaEohTL3/BqOu4ikpb0=@vger.kernel.org
X-Gm-Message-State: APuU4Z81mjobivBc/5Yw1WBeWPdbDEPyq5T81oA6nEmxHjwUtZWMDS9p
	afqv1/gdkLexENUCG5P0cjgRjbljACAWWZNCfHyeUKunMn7vW58D66wxsG8axqbdafgfpbrWvqd
	yoX3tw+o=
X-Gm-Gg: AYBFou2Ktb3ojkOX0IRHEjWSIfgQ7PA11y/Nta69KaOO8Xdfr8iOVdEM/EnKXpHKUIG
	LJssaa3FaobvVdx7tWby7zpJ/3rMQANuSKi9cNZq1qeCY3tlbfevIpCj1jqWnxBQzpX3wMu8gPX
	ZBMV47+0K5svdZZgvyy9CRRZydoB6Tp57Cu/rlgDCgPOxYgeaszTDoSiCQlIKqPir4cOUCVz27X
	JCur8T6K7ggiB58qutBmcyvI7g+PsY3IpE0qsjqiZTIzTmaJ1JF7UfrqbDmOnB9sAOuMgemtTVI
	6qYLaxm2cT0eJ0/C5eYv2ql9qohzxfhn0wrucwQByHIVSMSki/2aMNaMFkVLBJm0L1VMZYWbHy7
	8rH1Yq8tVNX4Nb6afs5jeeMYIRuq13IePphCS32hd52nqdu6ldi1UaaKtCaboxv7Hc8Scc+rSgT
	zDTzJljHnkzAw3V5CfXC1cUBQzUmj8tbZWRVkSXrX4AU5DyvuOpc2PAGkncU7EuggM57dUHzMAd
	6RkCSdRxcckAnL1nG9YULiThri5412vuaX0O0tZccMYeqWX/R/IpJVDqEVp/U4h77LbK7NWzKbM
	GvTl6ngx3XAO7Xu3NtzDjkMmLZxznyfp
X-Received: by 2002:a05:600c:34d2:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4bb55ac6cabmr228383715e9.34.1794847271206;
        Mon, 16 Nov 2026 08:41:11 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm154341245e9.4.2026.11.16.08.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 08:41:10 -0800 (PST)
Message-ID: <34e02f23-1ace-4a13-9353-b73a1464a592@baylibre.com>
Date: Mon, 16 Nov 2026 17:41:09 +0100
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
Subject: Re: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is
 held
Content-Language: en-US
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
 <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <0140bc0b3d1078bf8851340e0cb893b2907e146a.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Manuel

> I have read your patch and have a question.
[...]
>> @@ -48,14 +49,22 @@ static int aiu_fifo_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>>   				struct snd_soc_dai *dai)
>>   {
>>   	struct snd_soc_component *component = dai->component;
>> +	unsigned int val;
> 
> Here is val.
> 
>> +	int ret;
>>   
>>   	switch (cmd) {
>>   	case SNDRV_PCM_TRIGGER_START:
>>   	case SNDRV_PCM_TRIGGER_RESUME:
>>   	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> -		snd_soc_component_write(component, AIU_RST_SOFT,
>> -					AIU_RST_SOFT_I2S_FAST);
>> -		snd_soc_component_read(component, AIU_I2S_SYNC);
>> +		ret = regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
>> +		if (ret < 0)
>> +			return snd_soc_ret(component->dev, ret,
>> +					   "Failed to write register on trigger");
>> +
>> +		ret = regmap_read(component->regmap, AIU_I2S_SYNC, &val);
> 
> So as I understand val/&val is just there to listen and forget what gets returned.
> That's kinda weird, but not an issue.

Well, I understand that it might be weird from a software point of view, 
but it makes sense from the hardware one. According to the manual:

     A read from this register indicates that the next sample to be
     sent out of the interface should go into the left channel of
     the dac.
>> @@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
>>   	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
>>   	struct snd_pcm_runtime *runtime = substream->runtime;
>>   	unsigned int addr;
> 
> Here it's addr. It's not yours, you just kept it.
> 
>> +	int ret;
>>   
>> -	addr = snd_soc_component_read(component, fifo->mem_offset + AIU_MEM_RD);
>> +	ret = regmap_read(component->regmap, fifo->mem_offset + AIU_MEM_RD, &addr);
> 
> Similar as above. But why is addr here and val above? I think it's the same role in regmap_read().
> Would it make sense to name both the same? If it does, I'm in favor of val, because that's in the
> kernel-doc of regmap_read().
> 
>> +	if (ret < 0)
>> +		return snd_soc_ret(component->dev, ret, "Failed to read FIFO pointer");
>>   
>>   	return bytes_to_frames(runtime, addr - (unsigned int)runtime->dma_addr);
> Here addr is used, so it's not same as above.
> 
> Looking forward to your POV.

Here I left 'addr' to minimize the number of changes in the patch.
Looking at it again now, I'm more in favor of keeping it as 'addr'. I 
understand that the regmap documentation uses 'val', but in this case we 
know that the returned value is really an address of memory, not just a 
generic value.
Also keeping the name as it is makes the last line of that function 
reading smoothly.

However if you deem this unacceptable I can change as you requested. 
Just let me know.

Best regards,

-- 
Valerio

