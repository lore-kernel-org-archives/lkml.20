Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0731944E65A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 22:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792189172; cv=none; b=SXFVDfQ2XxSlAVQuVhTEYkqpYYkow3AxFJA3cud2g6Z4hc7RQn1g8jNggJrGAAosZVxCPcR99SyQku4anrcZCI+mWuqOVXju1uf3VKeqiLwVOcjqzyhjhMqh9uBm+TIL3gArSAS4T2kX9HjAeoZmdNnkzkiPGJy877vDeYGkQ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792189172; c=relaxed/simple;
	bh=CczPsXEzRRfqJ9GyVserx+qYU8CP5SVMLNDQ8x8WOsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZbYjPlCXrZeUG8mvBWbyNhACAr9KyO8wT3LJ5up4BRBYuPa1y/U271bBlYgpJ7OLIngXnGGTrFFTkp3OVurhC4HGSi9hiioB4v3ZLlpJnjrN9baSiA2auAmUrZz7dKqIodJklmU0j4/6uHBpUm8CGpzS1UqmaoztNB6C3tvzKMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IZJ4gV2S; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IZJ4gV2S"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso168483f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792189169; x=1792793969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OhD9xLYcSH+hZ3LcnQSTj3wOScq4AWKpIi8HmoA4vQ=;
        b=IZJ4gV2SKYIpM+47r9EHL/k91zdJ0x0Mhkz1OxMeDhgt/jgsXghaJRErhKbcspzZ6G
         e9mlKjoCZGc3rg2fZQisDHbI0aW8MHFBjQJkJ+OolHPry09U5HMFIyT8zuwQDhgQoE81
         95F/IMO69lecscsMxeiq6zAKWT9WJE4UysZV8tKqZkbT6odrBkdCBenaP9+lTgsow//v
         rhDEKtdpjQlZiKMCBOgODq17rLKknBe8AwfPR+W0e4ZULdn14AhVDFXrGD9bqDymvLjs
         8S9Zc/9KymPiM2zoSl3ZomAyYp5QsUFWmNPbntFrhF9Gw34ewqoQTUjUfCoTP1lxvB54
         AnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792189169; x=1792793969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6OhD9xLYcSH+hZ3LcnQSTj3wOScq4AWKpIi8HmoA4vQ=;
        b=rjUKKTkk5dC1QOEiYBb/Bsj5JV6kKsL1UETNNzlEyt+VklOSXEcvRZ3i2FM7eDjhFE
         wyQA23mu9IqunphNkDhFP0VqQjq2ZWRvsfILbSz1R3UxuGLEyNAaunnIaFrefY/JdhO1
         p8K1sVyCEGCKnCkjB7XvETxuG7gyOMlvYWec6MOrXZKzfbMCXEh8u9/G/VFYwgY4RpOh
         ZKORO+Cgl24+bM2oIdG/Ca3jl6Ok1LmW7Lle4SAD5g2Mg7WemmWr90L2Pk8hnkv8SyLq
         0M4e9IUzRo39P1ohAbFO8DVGmJtIyGp7vZtydid0voBgiKCmbuRZ5PYmZzeN8t4VOZ0d
         c7Kw==
X-Forwarded-Encrypted: i=1; AKwUvBzPu4mCaGW9Iv1OdXzvfn2QyU/v3W1AvNpqK2KC/dYHL7SpbjQAXfBuZtztBtev1uD7wF6qRkGoHee0HXg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeLX/AJzIQ2KXas2BbNhccw338d8RN6+ky3ZsAurChAeGybM6Y
	sy1BR2GJ40SXYW2mf32DaNkedjjO509PcMO7OJHSEYdpdL1Pf7UB6r0Q
X-Gm-Gg: AYBFou0rv1X6njUcTF/JCX65K2hnr20aFKstw8WbttimIuAG5P7bdamo/iCqGZXEDxi
	T9vU1X6Je7sjWHnH5+igbFheapoxB6DjmUmLG59HZ6ZZIbgHAki0IKUx4uGBCVFtmDd1ZvpWWVC
	LkaNdwsVJzOTKcssOOfNElBIjiWp9R5/YRBVpEUYqxkXJxpqXcdYSk6FTiAB6LuRtjQ7lZCUpg5
	g8ifivg4GZ9FkEFI8y0fBw2nmzk9KN1othMRxnKz+KW0U3hi6yt7Fn1nYw029JOsd8q7AZGiL3q
	fZbSuxK7CeHUlC0yaCHXJRXCzn4GHWJoNwDNvbszcuD2UVBoHxPLPrHUlp0EF1XamJmqBg13bFV
	nObLwuPJKeQum47zMvSbLEmGmcGaMOMp+5Bo+sjIdLxYFLcdqwFXQz3H1N1nP762ji4L0dFnp8W
	eJi3v3ux9xa1Iqk9H2ovXFP2B6uZx2IZwdh4kwTYs81A3uurExbYlHRS/r0ZtdaPoT7Qjz4QiHF
	HX4WQ==
X-Received: by 2002:a05:6000:469b:b0:48d:efca:5f3d with SMTP id ffacd0b85a97d-48e07f9c439mr1254947f8f.30.1792189169148;
        Fri, 16 Oct 2026 15:19:29 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm6416485f8f.1.2026.10.16.15.19.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 15:19:28 -0700 (PDT)
Message-ID: <637a1420-69bc-42bc-a1aa-df70faf769da@gmail.com>
Date: Sat, 17 Oct 2026 01:19:26 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rtw-next] wifi: rtl8xxxu: isolate the USB register buffer
 from CPU state
To: Kim Wooseok <5mghybrid@khu.ac.kr>, linux-wireless@vger.kernel.org
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261010-rtl8xxxu-usb-dma-v1-0-e670d9c08fdf@khu.ac.kr>
 <20261010-rtl8xxxu-usb-dma-v1-1-e670d9c08fdf@khu.ac.kr>
 <fd91ff33-d8a1-4ab0-83da-c15816c148cd@gmail.com>
 <CAH1Bc_w89ymu+E1Gx13M9JD7ZNmdQ3=y_zFwVvMkQMKk4m6NAA@mail.gmail.com>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <CAH1Bc_w89ymu+E1Gx13M9JD7ZNmdQ3=y_zFwVvMkQMKk4m6NAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/10/2026 21:05, Kim Wooseok wrote:
> Hi Bitterblue,
> 
>> Perhaps it's a silly question, but doesn't this just move the problem
>> elsewhere? Or does kmalloc_obj() guarantee that nothing else will access
>> the memory near usb_buf?
> 
> With a separately allocated kmalloc buffer, the kernel ensures that
> CPU accesses to other objects do not corrupt the DMA data through
> cache-line sharing. It provides the required alignment or bounce
> buffering, and usb_control_msg() uses this DMA mapping path.
> 
> The patch turns usb_buf from an embedded member into a standalone
> kmalloc buffer so that this guarantee applies to the buffer itself.
> 

Okay, that's good then.

>> An allocation for every register access was not happening even before
>> this patch. I guess your LLM wrote this...
> 
> I did not state that the previous code allocated a buffer on every
> register access. That sentence describes the allocation strategy for
> the newly separate buffer: allocate it once in probe and reuse it.
> 
> If any part of the explanation is unclear, please point it out and I
> will clarify it. I don't think speculation about how the text was
> written is necessary.
> 
> Wooseok

