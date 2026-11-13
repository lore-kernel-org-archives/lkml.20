Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574074;
	b=d+UJGRH7kGlhBO7yeXN6PTnXRVHQNAGNYdUNSmUbvLK5fM2p4qcbAw+krF027D51xPQo
	 mcsx78/4HDmLBdodObI058srHMjm5giIp74VDHipPMHPc5VCHiBi6a6BJ5DznfgHN0jsz
	 2Pjct3Gj87wuFEB+ALazEaYhW4eeAynnf1bwDsIip43pd40DfInD8CiQDJ6QadRbzN/dq
	 2+b8c8pyX+ouazBFB6v8bBBp1Rp6LRkDnsDo1J9xwhTmmqIak83p6ZvZsSzMtb9CrtuzP
	 jZa7/qGngIUTfyTWZHQ+NFUfB56yLtortz+ioFEA76/bJS0XgFqaDrXti3HDEPts68Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=dmx7lZXkcixTl+10Zvhm8UM2FpQt4AXP/0UX1bcGrY0=;
	b=szBK+rWysgTia+B6gmTkiyYTVVaQEfxPT/BjJe6a4wZjl4eHB8HAEVzJJQb8SoSuAh5a
	 fDQ3GFswrIfz6EdOpB6dSS2EhvPyQTToFJqehTPFrWPr/NBX5PtmTw8pFEctnLw55Cxbu
	 WDcEjZ2bnu0o8JbxKZVGjM26yIUCWMcxi2n2O2SUDpD7NDtf61WWvZrIU9Q1PYDP4R350
	 jpLRHJjEZpWt5zz9WbpFm4RabC4Q61oK2vDUHn5kfujG0NtcBYNJIwZ4h7q1/c0rujPAm
	 wQ77mgn2tFoGTGyK4L10H0fOXI+SBks+0CiH/8kYsSSQ6nJwAFhAQ49/rhciMlHKGSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ll2dmfz3;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0354D606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0354D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ll2dmfz3
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so7110555e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794574072; x=1795178872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dmx7lZXkcixTl+10Zvhm8UM2FpQt4AXP/0UX1bcGrY0=;
        b=ll2dmfz3ZZQqM8p9tvh/cMBW3KmZXtaganop9u8ZdwqRMpn0T+Y7xApwcrpQTwjQ/c
         xsVOA9R5CVimLyPj0nWN1BuvpZbvwc5ypvcVDJdCdKWhJMHWjJvJ5s+zbFUpCkWc/9xf
         kmTuDx0xWFwDvxtFw6Qh1G7JESctUQNORHgPgcrmqWl4DrC8QWliGpdy55ZbmcwhVXe8
         0Ue1Ttey5jf10xnSu4WF9Nwrz5CxU9vokIaxutOI/uPGcuma7oSkCwU4ZCx6hyMofs6S
         /Y1vw4WnWEwY4106ORp3BYUdd9+ioJRodbW8Uww+cEBDOcBgW67QXwT8cS9QLuKWymfO
         ljOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574072; x=1795178872;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmx7lZXkcixTl+10Zvhm8UM2FpQt4AXP/0UX1bcGrY0=;
        b=yJK+h3Y3T0uucv+J4ASGUHQbWBJVdOeTd1QcUCKxitRQw9x8NafoI4g3yjUczoRO8o
         dmeFd6/x17C/Tg8m0L69cjB5DIDW6bbmM3v7gXjiVRslc6WZV8exMnCJd6agDfJws2rq
         7YfiLvEgImm5L3LfONTeSsxCn9N/+HKpewvbQ7dIJ101vlo61ahfxJklE1iz/32QYn+Q
         MFuT0LPF4JoAxf9DdwxYKCp+6FRCZzwMkkfldw3kbcq9BkPPjdMPhJ2eDNf09AjeRsuX
         N8g1zhBXPURn8zPJcdhb2Orc4zgMK6pQqdb64PfLN7+sbTYj0LXzYm9nLO2Jk0pmYCP+
         jdgA==
X-Forwarded-Encrypted: i=1; AL+hErHFZVd3n0tfNIs3KhIx3LtHgl/UyXSzSJZWiQJjQbkpdVdiJmIZE9DX12V4CWwJKWjV2ds9un+GZm9DsxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+homQEv0bCUH+6WI7bJhSAQ+9V7oftoIRvOz32Q0wwAe2epamg
	igtpPIXQ6bByHx2doTGqwpMemumZu/9UWuU+X/n8PGK5QlWBv6OWmGXODJxX0JgT0DE=
X-Gm-Gg: AYBFou3y9xIegq8lw6HFa9YpUdZvtwOXaWbUHHKPQylCCOAOm8IuFrLFeWbPhPew+20
	iNC5xLagrNexfM1OqgT8u3AcNVZkZpVDUAG3tJfBBOINQZOMFJN2HzCSoTYIJ5WKuROg2hEkAnZ
	Lnalo0wCAB1SDIfZsXx0y4MGm3vNmrVepmQYzsFh3e4fi/3MVNPk4VRnGBgglnj5zorg+nQbEkL
	Wzmcco7dcv4tQX6JE9qnDCogpJ//0k/HF9/GLLz1T0SVfWrr0sjxdZV+Fafsx3FhVoV+dR4RDpy
	H6ujvhMZa2JRcjn530LvkQNOaur5bCxiIGsI8lKNW84zLIN0peDT/7Rtlx9fnS4yIHsruXEZf6k
	HYkog3olxz1abqjlZEBCVrJ22r+naqjM7lu35DDn1dK6qTSysEYQ84TJubb2DFZPdh3Rul5tfHd
	Jmjz0rbpygAzX3l3yRqGyY+NPALIi09/MaI4jOaPZlv4Ba0z7C67ynMhXYTOPDEzKiGRrnt7EMB
	+JdzUoXP89TjvVsfGblfGu+YixEeOSzQbD0injqNQRcNTtacaQJiydOfvffZOU7pLOCsUfnM8Wa
	wXHubtcKpo6CRA08U4mRfOTFeGu+7tTt
X-Received: by 2002:a05:600c:1c0d:b0:4ba:59f7:9032 with SMTP id 5b1f17b1804b1-4bb55c5f60dmr58910305e9.10.1794574072378;
        Fri, 13 Nov 2026 04:47:52 -0800 (PST)
Received: from [192.168.3.100] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm161390445e9.2.2026.11.13.04.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:47:51 -0800 (PST)
Message-ID: <7a268a4a-692b-4aa4-82b3-a13006e9a3e3@baylibre.com>
Date: Fri, 13 Nov 2026 13:47:50 +0100
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
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Christian Hewitt <christianshewitt@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
 <CAFBinCBLK3Ok7QpKUVT5XtOqDafVzGP2Tn1oBj3f=PUQ_DgnwQ@mail.gmail.com>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <CAFBinCBLK3Ok7QpKUVT5XtOqDafVzGP2Tn1oBj3f=PUQ_DgnwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Martin

On 11/13/26 12:05 AM, Martin Blumenstingl wrote:
> On Wed, Nov 11, 2026 at 11:09 AM Valerio Setti <vsetti@baylibre.com> wrote:
> [...]
>> @@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
>>          struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
>>          struct snd_pcm_runtime *runtime = substream->runtime;
>>          unsigned int addr;
>> +       int ret;
>>
>> -       addr = snd_soc_component_read(component, fifo->mem_offset + AIU_MEM_RD);
>> +       ret = regmap_read(component->regmap, fifo->mem_offset + AIU_MEM_RD, &addr);
>> +       if (ret < 0)
>> +               return snd_soc_ret(component->dev, ret, "Failed to read FIFO pointer");
> As far as I understand:
> - snd_pcm_uframes_t is "unsigned long"
> - snd_soc_ret() returns a (signed) int
> 
> Doesn't that lead to a signed to unsigned conversion error (highest
> bit set -> large value)?

That's something that made me thinking a bit as well and the reason why 
I implemented it this way is the following.
'snd_soc_component_read' internally goes into 
'soc_component_read_no_lock' and then to 'regmap_read'. If the latter 
fails then 'return soc_component_ret_reg_rw()' is called and that calls 
'return snd_soc_ret()' internally.

So my goal was to keep the same return value in case of errors.

> axg-fifo simply discards regmap_read's return value.
> That seems odd at first, but knowing that its regmap is MMIO backed
> (same as for AIU) means there can't ever be any error.

That's a good point indeed. I will follow this design then.
Thanks for pointing this out.

-- 
Valerio

