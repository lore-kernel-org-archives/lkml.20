Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124906;
	b=RRSjFiALuBmet6JOA9TKnj05ZJtlLbaI0DuhPyly911K/bbxcjCKOyZ+ns/Hol2y4c3E
	 Ct/RjmZc5GM+K7exlgBROdWQRgdRcM2nYXtaC5UT5GqDTLpS7x7ZqP8rERzH64J7/N9pI
	 l3NsYNVrBlCEHjThog9CM2EPQwqJeSnHeL+WsQQ3pe9RBJ0oHTZGzLIoGPHfTP52jKL89
	 XPz25Jagi1tDkEayNhIa3UpfGGpk/TgTOvFausVB0iXQ9+7cndvngBr1UZy422yJuR8yH
	 8ZL1q1s7J4Ib407wGifxpEJxdOGycPuopg6eyOgpznuocCk1nKgi+/t+P7ujgwCDwDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124906;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=a1Ja3qIFPRW5o1f0UvkP2WWshxKnpvUF89aERI+066U=;
	b=vKfR/pRZH4OYxyxMRZB9Kuhcq0EnCuJCD0d+MrnQX3f6O0u4mUEch+zmEDTIK3XF7yfG
	 d0LbtudtRaRWKN96PZRsBC1dbco26rV1xeg88kuwR03Chmr7JRxGh54S0tXCh9rWGIizn
	 pSvRSAjt36QhY/lg7e5oSl8bXVumW7nKNoX2WUTPLToNNhfHj+IgPZsRLSmaIS15S46aH
	 uW0KpFqcKN0Ovn199kEvNSJe0tTwA5f5GcivO/Zt4gWotG9bRtrHY/PRT8EtsM3c0LbYv
	 ZQUA4SrzAYQs1eImZbMXFVTeMi2BbL7RdaRJgYFUaMYq2RHEZxtRRUzndr7JOachT9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF845606A327
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF845606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so1164215e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:15:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793124904; x=1793729704;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1Ja3qIFPRW5o1f0UvkP2WWshxKnpvUF89aERI+066U=;
        b=hq2aTrx4Dl6GPwVr5C9e4VWLsrgqHf510FYgvTli7wOA2djPgAEizk3SnhFZGXv2xO
         GjIgUUrZVHmBFR1AdOXnTdLC9ixyv0nFrQPmAcae1NuNXVOXo6a58aglwekkRbcu0jHJ
         TpLdDMoXV3Jx/eoeiBmFtnyAerc3SPlWZtFt8CGm733uV+jKLnmyAvCALcP4IT+Zo/S7
         kv0SxoUziQS1kBeZDetiBi25m3ZSDaHatUMZlk8+MV64TROecmPS4aSlFCIH3lhak87N
         YfQhjyOhLehYhwag+Qho9cZzi93HUsoIE3K6w1KTDlTqT7peR+TZlMgNn4lvYhaJu3bI
         usaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeMCLeFPQe+2tf4Ke6DS4Z99b+zUW10I8Obgvf9SSjztQL6R7vNzDikvOfFez5HGng1epwZkEePX7hoRw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6wQsodatf43uoqXxrvpZEvf4jMv+wRC23yUz2BLKeBtTSmZAT
	VqJ8G8RFlZI7zGAoHZD63CZKs57ManHAPoCrySC5F5HKu051QGX6vNw=
X-Gm-Gg: AYBFou1Z3a4rjs7WYDXwgkvuUHLM+WaA45X2mUzbxvslZJMab89CoddiSvNKSCL5Jdr
	wSj7/UMDNo6JoETFlKu91RyLmu1XMqeFR7gKUwPkd6dDj2OwBLp5jQoO/OCg9na7kbX4tKwik3I
	1B8VRNruAVOhkxz++AVYAE2ZUoLyapdEF5R0YXVIhTekkKpRZGtCeSCkH3ciyn/pSNchLeTumJc
	T083DvRWI8SWSEWoNG0KoahP7LZ9xKZuMpLQkMAE0m4kqnJ4Six2fK1Lew4tHMKyQm0mfu8ENJf
	S9PaamJwl7m6Ubms0h54rKeAAebjwSW0cIYCWrWAyjkzIjiUfAjdl/RxXWuUpZUyGx6I9GM7ID8
	SGduog9SkGoov1s1NSgMbjdjPCmajCsZK7IWKkVPwZLsZkR7iH/O6GehLq0c5TMjsu3Ojas3Dub
	DcU4U5+XAU34yRK8p9ukiaWr5/AO8teD/aI+ythCWRjZ250bdkpvzVyrrP5spMhI0/LZwSX/9Px
	B69mn1ZLv0A0UC+XPYGDT0u74aqvpIrK0cneUhvxszIu/G5yNkIO/3bavMIeuyvlAWwyM6FxwSN
	UNt/lLON25rBjFYcjmvriI+i8sxxGkr4vIeuQO0=
X-Received: by 2002:a05:600c:37cc:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a35acb990emr210145325e9.33.1793124903858;
        Tue, 27 Oct 2026 11:15:03 -0700 (PDT)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94c118e19sm10345e9.5.2026.10.27.11.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:15:03 -0700 (PDT)
Message-ID: <6ae0ea27.08a8f783.2e4276.0395@mx.google.com>
Date: Tue, 27 Oct 2026 11:15:03 -0700 (PDT)
From: D. Manresa <dmanresa@gmail.com>
To: dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org
Cc: antoine.pichot@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
 dan.scally@ideasonboard.com, hansg@kernel.org,
 andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/7] media: i2c: ov7251: Fix link frequency index
In-Reply-To:
 <CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com>
References: <20261026111032.88355-1-antoine.pichot@gmail.com>
 <20261026111032.88355-2-antoine.pichot@gmail.com>
 <6ae07c65.e52dcaf0.293af3.e7d5@mx.google.com>
 <CAPY8ntBFJJPg3y46gC=bNq_55QifC7mKmeq8+pAEDVN42fGUXw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Dave,

On Tue, 27 Oct 2026 at 16:50, Dave Stevenson wrote:
> @D. Manresa it'd be worth trying using a prediv instead of (post)div:
>     .pre_div = 0x04,
>     .mult = 0x85,
>     .div = 0x01,

Our mails crossed, and that is exactly the change I had just finished
measuring, from a test patch Antoine sent me. It fixes the link on this
receiver: thirteen 150-frame runs at 30 fps, every one 150 of 150 in
5.2 s with zero dropped buffers and zero CSI-2 error lines, against
seven bad runs out of ten with the index fix alone, three of them hard
stalls. i2c readback mid-stream confirms 0x30b4 = 0x04 and 0x30b1 =
0x01 with link_frequency still 319200000, so the link rate is unchanged
and only the VCO moved. Full numbers are in my other mail on this
thread, which went out a few minutes after yours arrived and does not
mention you only because I had not yet seen it.

So the 19.2 MHz / 319.2 MHz mode you could not test behaves exactly as
your 24 MHz oscilloscope measurements predict.

Dan's instinct in the parallel branch was right too: it was the
driver's PLL settings and not the value ipu-bridge advertises.

One data point on VBLANK, since you raised it. With 2/7 of this series
the 90 fps mode runs at vblank 92, and in its clean runs it logged no
CSI-2 errors and no corruption I could see here. I did not go below 40,
so I can neither confirm nor contradict that part.

D. Manresa

(Written with AI assistance, directed and reviewed by me.)
