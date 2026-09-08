Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAE44A0910
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859297; cv=none; b=TuGhsBhdSZsfn2LBWHgCPAdEGtLh80n77U9j1OCA3x39jdSFntqqCwb1JeZ658j+tRkcSYds0Kxn+/Sva7JFlqI56tcDJn9uNY1+Gq5t/Td+i9rxi+99EwR+bTMDec/LFk1mh7+nafuAzgHgwxByrf0FcdLtbPKoR/E9w7edfBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859297; c=relaxed/simple;
	bh=xWrOOxVsxRN3LXDfi0keZT2OgReFcmiltrMhNLeizkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lylvdJkPTixekL6vWZ9ZQLho4eWNH94fV1JocY3RR/qzqbjt2mnOjGxPF2lnwkb/+UJoYXpzpTXvC1xA0Fu2ZpLLDLSqRT9dZzRh+Vo4+Q3PAWnGUiE/QD6lBRGNk1+Hdnvo6QJecdnFuXI52YQV8E3tQus0kJgR9XgqzXEied8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P4Ubfyga; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P4Ubfyga"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c28eef361f0so314342366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788859294; x=1789464094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYr9afLBfDRHtvCbBMbwszzMr+ByUO2IiAiD43JF+WI=;
        b=P4UbfygaZnDE8QULn5D3dOsXxZvwHs8ygU38XHpkL4C4iIwc1gVQkjwP+J/ibZL5ps
         Ypac9tSbdjPuAZu36uddG6JrBhPGI6Te11m+w1sqKylsViiKvCJOxj1/mM1Ar/fIyIuy
         h0aEqYkjFoCm+1OevL1ePcxcVOkiIixYr8z3zcM4Tfpi9wDz2TlZWHVsu4zEZOFgAAkz
         JY23UZ6M4da+rb+5mzdeX31YGXExybATN1cVOn0Q9ZYKwbUDczFoEzlfFHLBcP529otD
         wwnnVBIGoZ/J8sSxg8teKwq9igjLTflediwHfOUeUObQT/FS/nsT4qJtF32rpEypB229
         2d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859294; x=1789464094;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYr9afLBfDRHtvCbBMbwszzMr+ByUO2IiAiD43JF+WI=;
        b=fvPDYwZf3ysv6qLQ0fKNMKy7W9DX3stRQ6hqb0ZuSG22XUyE8Q3D7x+2/hKjDLpiHz
         27OKi4ZYA0sWDpG9kzxyLjxBQy/3RrJGjwofId3VkEwAgS4LEoRII1PuQJ+BIdPtiOaA
         EFFDupD4Sl2yjSimzOVTbsX+g/9KnDJHlY0VJaAZITeqdOj2w+cL7B071bAmiV6fNk2K
         Hjyp1jlwg1S0lmqZZiU6/u+iF8jLQz54E10TFW7D5Ll1fSKgogrT73/NhyHp06aD8ez4
         IjO7QE0/pxkg4lBfyRf8tsxFtW/NZR7lTJJRXNmql0l+vT491bgBL0ugwBGbNqCPaGbr
         1UsA==
X-Forwarded-Encrypted: i=1; AKwUvBw3+9MjXXjzvmidDuMkBFB5Zq7kwHWcfHDsJCMORGxf0elvSy5ojutlIOxJu16z8cp8u5qEX5uaMOxvJH4=@vger.kernel.org
X-Gm-Message-State: AFuF++mAfsrJXWcQYmM1KfyXLhNuq7CS58+P747lpWAEH9ciNreL0sXx
	Rj+J3i7tWtXZpkZkS7WA7z8E2HVr/vhtknsRH+/1KbeFBL2oPlDy0eF4Vz3GIY5mwao=
X-Gm-Gg: AYBFou0y2iRIzTiPcFEXGGjfuNDTjjiRrRoOHbBEgP09Nc0Zx453q066LKP1tE4ldhS
	yLaGrde1fH/L8r+GrWxEgkrfDWAWJw+bG2LsNyVFb6vaQQ+5wLM2oDjwBNVqQR4WzJHWS0QqyVl
	jDv7MFMM4NPH9SUbWVwkxyax9OzgV/RUnpEWlMho3IAqgRH7TowwgYlhx5Skam01oa2ypQUVcPW
	HxqnKLC1l4NfeCL+Z57lxo178wmo+HdJqc+akN2QnxdBVc11FSbKmRM/K2W5hXv0UMGMRwWxwB/
	/e+4wHL/cjSSC2JfD/gjzLLFUZJ1LIW3rt0hxDbmKBfPbyvDMzVHvW9uQ1g7T2NOvQXCyoLzqqs
	62wtG1GrXNhq80/nudgJ+bp6u9tuDBqd5S7XwGGmDyyisV9pWgB8eapm8wjIdF5m5S+xw+7xEqP
	7FA1BJ1ZtrONZcz2scfm61OhMfLt26TcPrJC947MTt8uT7Ip4EsQiLhjpp0Nf8/sHqPZJfStoP
X-Received: by 2002:a17:907:d0c:b0:c26:1691:b36e with SMTP id a640c23a62f3a-c261691b966mr907855166b.39.1788859294292;
        Tue, 08 Sep 2026 02:21:34 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.78.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5375d9sm577411766b.30.2026.09.08.02.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 02:21:33 -0700 (PDT)
Message-ID: <5d00f6f9-43ce-434c-9036-aacd4724e65c@linaro.org>
Date: Tue, 8 Sep 2026 10:21:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: ov02c10: Accept a 26 MHz external clock
To: Felipe Calliari <calliarifelipe@gmail.com>, linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <20260905030732.39196-1-calliarifelipe@gmail.com>
 <VOpCLJBQy3XN6uCqoTmAGSKx_vojTrQAmOODetFqbzl990ejy1WA1gHcca4T8beBdtKK-BcDC3-YupQEpxZvTw==@protonmail.internalid>
 <20260905030732.39196-3-calliarifelipe@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260905030732.39196-3-calliarifelipe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/09/2026 04:07, Felipe Calliari wrote:
> Several Meteor Lake / Lunar Lake designs (e.g. the Samsung Galaxy Book3/4
> series) wire the OV02C10 to a 26 MHz external clock instead of the
> 19.2 MHz assumed so far. The IPU6 ipu-bridge forwards the rate from the
> ACPI SSDB verbatim as the "clock-frequency" property, so probe() just
> rejects it today:
> 
>    ov02c10 i2c-OVTI02C1:00: external clock 26000000 is not supported
> 
> Rename OV02C10_MCLK to OV02C10_MCLK_19_2MHZ, add OV02C10_MCLK_26MHZ and
> accept both.
> 
> The PLL register tables are the 19.2 MHz ones; OmniVision's 26 MHz PLL
> programming is not publicly available. With a 26 MHz input the same
> dividers make every internal clock, and therefore the MIPI link, run
> 26/19.2 = 1.3542x faster: a ~541.7 MHz link and ~40 fps instead of the
> nominal 400 MHz / 30 fps. Rather than leave link-frequency and
> pixel-rate describing the 19.2 MHz case, add a second
> V4L2_CID_LINK_FREQ menu entry (400 MHz * 26 / 19.2) and select it when
> the external clock is 26 MHz. pixel-rate is derived from the link
> frequency and scales with it, so the frame rate and exposure times
> reported to userspace match the hardware, and the IPU6 CSI-2 receiver
> programs its D-PHY high-speed frequency range and bandwidth budget for
> the rate the sensor actually transmits.
> 
> The ipu-bridge fwnode only lists the nominal 400 MHz link frequency
> (keyed by ACPI HID, not by clock rate), so v4l2_link_freq_to_bitmap()
> still matches on the 400 MHz entry and the 541.7 MHz index is selected
> explicitly for the 26 MHz case.
> 
> On a Meteor Lake test machine a single CSI-2 "frame sync error" may
> still be logged by the IPU6 receiver at stream start, after which
> capture runs cleanly; this looks like a sensor PLL settling transient
> and is not addressed here.
> 
> While touching the clock check, terminate its error string with a
> newline.
> 
> Signed-off-by: Felipe Calliari<calliarifelipe@gmail.com>
I don't see how this gets handled with Intel's downstream work

https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov02c10.c

So perhaps it just isn't handled. Seems a bit odd that several ODMs 
would use the 26MHz clock but there is no update to the ipu sensors 
drivers to match.

Absent the real init sequences for a 26 MHz xvclk, this solution is 
better than nothing.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
