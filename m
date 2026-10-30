Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371459;
	b=QqnHnACkSvxdYxsVJB1qXrya2xVvttocKpBoIaSG64bbgG3NUFXlTcSRQnbl7hTYGPOw
	 BgZ1JGIiM8qxRNoCdd+LEBAWzi18rZaNlXDttvq8ajQ4nhBaL8AAfrJpVPFfo/gREfYFi
	 Us+X1V9ynhy8kRcqeZLeDTYFkNSk8I2RwBPUlh5zBS7WXej+8cs+Ltop8mk4lJ9UGNW5e
	 2kV6LeuYHR4HZeSGRPq4xrjTBvkLK95pGcwuGjQOXBCYMBjJizveJFzV6hBzNZjMGdSNk
	 SXQvNK/EpoZsqSLLknVtChKHpCYjz+aLepDMcZTIEavPAX5giVTlnVqFiA7ieOMAGXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UtnA/zteumxQwftTkhrGmioZkrzpjA4GBLPRv/xbLwQ=;
	b=buey4zuP1AKtiRSf5d3Y4EK8RWWOv8ZkWQmd0FjlXHswKO++mQgdoCQ5PduK8KW+2wPO
	 qMv5HXmkUjaYZd4+yhJTPPMWPLjytv1KjD1SyoZQ7jAaSz3kvPByJKZbPseu2goLU19A2
	 Zf2hor5zZNJ7vmIOvJg1Z1S7RItBKbtDyK5TumERhqKev4Bri/P6NklcVrSrGCstqN0GZ
	 97edTMjF8P322/+07D6mqvlzDuXBWCB/IXdj7uHYDbQHCZr/XXsWKHVxzWg0riUgI01oj
	 kvHlifUnulZzgnOMhNBOOh4n2yvvox/Z9DuKKv3lcTDp0bYExpODSmaubqs3lELWRvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f9myn3CC;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C5606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 486C5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f9myn3CC
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c418e215671so98787466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793371457; x=1793976257; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtnA/zteumxQwftTkhrGmioZkrzpjA4GBLPRv/xbLwQ=;
        b=f9myn3CCW4N0lbI48oVnjVSSZMzwSTxiGbyDRuu0vD5aaLVeRGBZuc9E0UJEPpnyJ/
         U7O3Vm3GoJu94PKkS2L3pVRgEk/AhZJ7Dqfjmu3XX2kxkGECHyIiHzVTq151ZeL+vLyG
         OGQADnIdAq5if05tHC0uYdpHkwKwMogr/gyfk7hMJN5xsGDp4ZVNPDXuu836EtNKBYtc
         E7CO104x+cYw6KXrQf23tqfJEEsyy4BhYXxTBnSYrxniYLmInjxiBw7Y58SGiK1GHBVZ
         F4iZiBjVh3XQ0RZzmOd9ZwGeOkbB9UKDmHyIoWzljAMjMFezfB9TlFN0GeTrsqPLP92R
         osbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371457; x=1793976257;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtnA/zteumxQwftTkhrGmioZkrzpjA4GBLPRv/xbLwQ=;
        b=MCnDHpr3G7mSafZYJTuxi/olgpJ1fuoM6GRLL2vAJrRrQpRsy+9xNrcupRPoj8MB4F
         YNtYIdRd125U94uTvnTs3l6Mq/sF3lEFmaMJEdP8LNk+gJAJ9XTnrfgsq4ww7FVqkARS
         9wXbAhAAdsdj+N+cKlqJYCmIZPrP/MdR244VoWyvgFOt4nHUW5yoECFkdAFCAgFtGUOd
         1WKCvDGl9u40PnnZcwGp20SeTyrTb8dslceOzA6KlyxgaqTPxlPMD85fpi8TuuM9RuT/
         AvcFwLzkpoyIqk26oPCK3LsjdCQj/7dxVNCtL/4MHphPjSf2sgCoMy2voNm/o0UR+mrl
         KO8Q==
X-Forwarded-Encrypted: i=1; AKwUvByHoNDAy5sfWDWypmJki6owmDbuhoNiTg6fwrtwpnePkbBS2Y6fkt8r9eSfJWDi/rtTiBi6JTLN7x/VLn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbYOtSbGaaym87cBstMe85OVkGPDIwzJeThVg03hahXzRRrP2/
	xIl7kBob9/O31Fl7+T+ZMSSjtabYOufZynfeR+THTHO5tQzhoT1z8cfT
X-Gm-Gg: AYBFou2ouESupf9JPwA93DSn51Q+ac4td/xBlploFbcyaJ13IZbufB0AgYWf5pm5f3M
	90mfMY85B2BtiSlfXXpvnL5t5znoBNRl08M9zt9M3MErEaSKLICS6LH7crGo/gLcNYE9MIizOOW
	GLtcUEM102JP9iA0IJqadXciSIHj0sMWWp7/1pXEr6ipwm8a5PAZETrODqD56Jsd82MXxLpf4ZC
	e3PquWgwi7kDJPeG/Z+mpKR6sZbhRVfa+umTvuI6Ej9knaez8YvNnWaSHnehB+G8WUIHju4YgMa
	ShTNi0MJQsqM7uVIZ+7Yx3vOdLio7VeQ545s3e3Nm0fuLHCBDsjfOkAId5vXzXVCxvRDDgNuWjc
	L1SNSXbCV3cI+/2LBK3zUAxkSihkZNYu8BCXKdI2JkOZBpDL6Bfozr3upIFZYcu9cobLYhoTWme
	qs7QspaDnn65iv11f6uPX8zqSqZhm2PvVv0JFQzVUvSPJ4mEicCa8Gkx9E4xU0ez3PY88PA5HXE
	XRSVfEMt3rQLf879H0FC6IYjaGzVzCIeoc8xPrXX5VS/V8vqxSX0TvrTqVA+v28trZXLd9payUK
	U6VkNb2z4HzHNHT7PGP34EfFumyyosIBRNJU1ZDvh5vLdAx0e8EWqQVmbMT2zvNB9wyM6IHzYsI
	=
X-Received: by 2002:a17:907:3e0c:b0:c37:c0dd:6642 with SMTP id a640c23a62f3a-c4ca7ad13ebmr240192666b.37.1793371456921;
        Fri, 30 Oct 2026 07:44:16 -0700 (PDT)
Received: from [10.142.16.156] (62-101-160-75.telecomgroupservice.com. [62.101.160.75])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm69844266b.64.2026.10.30.07.44.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:44:16 -0700 (PDT)
Message-ID: <c18fe7d6-c738-4049-ab88-c12817f0108e@gmail.com>
Date: Fri, 30 Oct 2026 17:44:13 +0300
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
Subject: Re: [PATCH] mfd/rk8xx: fix sleep during RCU read side critical
 section
To: Eric Anderson <ejona86@gmail.com>
Cc: lee@kernel.org, mfd@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261029192223.462367-1-paskripkin@gmail.com>
 <CAFyMnzbvDVvDuNfYgD26ThSyWDqt5u0TLHxF+Tp4=h8fkyepug@mail.gmail.com>
Content-Language: en-US
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <CAFyMnzbvDVvDuNfYgD26ThSyWDqt5u0TLHxF+Tp4=h8fkyepug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Eric,

Eric Anderson <ejona86@gmail.com> says:
> On Thu, Oct 29, 2026 at 12:22 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
>> SPI does not support atomic transfers, so it's dangerous to call from
>> atomic notif chains, since it can cause stall during reboot on
>> orangepi5 (see trace below).
> 
> For my curiosity, is the hang during reboot/shutdown random or consistent?
> 

They are basically the same, since they both trigger sleeping SPI I/O. I 
agree, I should have used studown/reboot more consistently in commit 
message...

> You are explicitly mentioning reboot, although the stack trace is for
> shutdown. I'd have expected reboot to have always been broken for you.

Likely. I've just bought it, so cannot say if it was always broken. 
Based on code I believe that it was indeed broken from the beginning. 
Also I've found previous attempt to fix it [1], so looks like problem is 
known for quite a long time

> In my change I noticed that reboot and shutdown didn't agree on
> whether to use _PREPARE, and my change adjusted shutdown to agree with
> reboot. Since you apparently need the opposite, prior to my change I'd
> assume shutdown was working but reboot broken.
> 
 >> I don't have rk3288 board to test. However, I strongly suspect 
that>> patch does not affect your case.
> 
> I'll test it this weekend. I suspect it would work fine on Veyron/rk3288.


[1] 
https://lists.infradead.org/pipermail/linux-rockchip/2024-July/049312.html


With regards,
Pavel Skripkin
