Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.231.198
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793255921;
	b=kBK9zuvETWA3goOUjr0Yr2OhpIFSE1rpbaLtfJaR3kTDPcZxShCIASP+io0VWyEhhuP4
	 yGU4kFv3n0AtN0Nyoigk4bbwIgy/GCv/VDJCbNhCzWgC8q8+2sVNe7sNOTz/qqxUgS3M8
	 jg1Mn5aqrUB7EoFcRQRVcGKjp8VWGE/7qlhYqPcHf20/4TsQL5oDNYMryNsCr5w6jzU+h
	 1HjloI/X3DjNjwyMkv4Y8Fx1/fpnVK7hp/1fKvA02aXCCUJyxBd9uDAzcFa4PsSOkxHLr
	 HxLfwUAuogTYGl7ZMKEU8+6QXoP8S8M1THBKZXDwpQBfXRx3XTf7PLLVICY3ILCqmww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793255921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=3gBAmM3LC3tWo85Han3FCwW9Y43tPIO+MqwsQV7d8Ik=;
	b=I77Y250fWfRM6CD6bB0R/ovkZpSDXxMwbAaklyOk9hSASR/CFzsDYuc6QFj4UWzXWnE8
	 iVvRchELQZv3ENiJYsx3xtSNvUAQNB70nkvRwbWnGvJDryfTCMivaf3auYMONo6ADjiMG
	 5u94zFUGzpTCsiPj6hNPx9gAnNzyMA+EoVsnT4Qhh3TJUrt/zdRAyQxIVL1XrA2fyUkUL
	 qxzxv/wgcYWW0yqbV8DGRj2AskKxPLifUyiq70IC7IKRO/RxKE7OeJNL4+6sidE9FKLOO
	 xkt2PewcLQB6q+gPdex9tNnoboBSk6gAnRzv4ZyK4nJjQ86lkgiMbif1v1HVkUiFSxg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i/NQx0gS";
	arc=fail smtp.remote-ip=74.125.231.198
Received: from mail-oi2-f6.google.com (mail-oi2-f6.google.com [74.125.231.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0931606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:38:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0931606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i/NQx0gS
Received: by mail-oi2-f6.google.com with SMTP id 5614622812f47-545a4fb8d5dso108409b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793255920; cv=none;
        d=google.com; s=arc-20260327;
        b=dajI30sySuaJkD2vrLdSecFRFb/sKd2xvSWM3xzesjegGDfrWUoJfFOqZXHJWZr5Xf
         +ysdwgBcV/j3hFHVelqK8zrcHqkkNYjOqh76jhq9xTkoEFI/BxPQzbHCDQxpKdX6OIAF
         P8L3wumX/xBbH6Vo0sMsNG6ZOs7XSab2Fq2id3T6zWrWOhgPniFJqi2CkDqh5vWhYJwy
         wdcpgysUdEe4be1BDXx+GAYcVbXCaEg2zm5w6ocFbfuH1EV3q8EdHN0t/ZY8oj/KW5Je
         El4WxTblqIUPK2KCmVHILdoTU6zZpaJxSa8A7CL9JBnKZMcjWnACv22SPmD7VOHdNhtP
         PGDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3gBAmM3LC3tWo85Han3FCwW9Y43tPIO+MqwsQV7d8Ik=;
        fh=UEnojLN1bhmFeL6X8e9GUwqYodo4pUfh1WyAYS63WO0=;
        b=rL2mArk9dBG8kSFjrbM1y/hZ7tbVzFLkcZZ4T0oUBd60x9qTkSQ+4cYmnIoZjdmwRM
         AF4qARwMz/FhUha8ppLp359fg8S2yDYvHYKAfpZjFiOkl/ppVdPpITWmweMzRXgdNO9j
         2dmxV3qhvXcni6ynQDFP2i5gGfMUCc2tMNsfOSvf457/Gvr3+8+sQFJ7Ha6e0YR1i3bI
         hTefho25FBCLSMhVRH1QjhczZgkntBJf+yRVTdu1nNa5PvIFOI7hsDqCITsgfPJ1T3xe
         19q7p7/zBrZ1gNEVoNMZ8uSJtO+B0jk6W+L0ojOW1s50TBO9Gn/zNbaJDVyqXopgjCNc
         8V1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793255920; x=1793860720; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gBAmM3LC3tWo85Han3FCwW9Y43tPIO+MqwsQV7d8Ik=;
        b=i/NQx0gSkOjJQl0K0epv2YWmOQZ9jPeUuvcIg9BHNzhqMbxG6iwJmEtrej38fjOryl
         Q1GWjhPP5/W5qfUXyoxsC8Bis7MasWNT8cCAWwrF8JpoxlVEh0L2juXD7M4IFqs7aQ4B
         JJRKCeAx9fPvaMdR2kmNIzbFb9aZK5imrI9eN2fL5EJR9YQCZ8zKQEr4rsFWfiAAmBJM
         CgA1HT7kVe5AZH4kzrWPFmsnuAeAO/l55Es/x2p5LToz3s+tKmSzWAVhfuXYKI1yVRSI
         t0ZxuHvJh9xWMqfzPPnN3mIRluSylimeZc5PUxsLAmH+jle8nt+KtlanWO6PJ8Ie9as/
         5kKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793255920; x=1793860720;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3gBAmM3LC3tWo85Han3FCwW9Y43tPIO+MqwsQV7d8Ik=;
        b=UaZcL01v9kIDcExh7XwhBcYbp/uBLK81FjHwfNRnLedgtQaOl3/U9+6mUpiRCNB2qF
         lSK1Dr+JSJSmwgu6d9igjw0jBh9Jzcu6BJIGmv+hc0lD7LGlrSLWvz46M3to9ovLAqkf
         z2FpABiGavv965JA1s603QjGp9Af6E7mEz8w0dTjQLJLRGZzJlgMRx/7y+AGJqsZV/Tg
         eFunQ1i1ytfefWDq/5DqloxbkEKseIa1Lv+EtZ7etxMAuOvAxvMvm/OjlEFghfc643lU
         rVjWue04fZfx3NfQ1MhC+yIxMpxpJYV0llroB8R2UEoXb6YW8bGuxFx5bFYgrFTyAdpr
         VxhQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4jbnSCoZ1jl7FXq7ajQWugRne0OnHDVByMyuEo1U4yrDwEO1p58ySyg7mxFI97tFAhG2hBxWxSjY1OoU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLK2sKG87q29odela6zosuBz5f7OEYR2uyRfBQGzX24SbKgzLYB
	oORQnT1UJ0UuCJjnxbUP2hXWx6pQrxfCqZ/HLCzKo8jn7R/IGclfsp10Guz6riZ38KFE0X+1Giu
	cuV4sb4cP1s+ewSYJdZjkzq4MX61USsg=
X-Gm-Gg: AYBFou0ifmDk7qOVI2zx16dWZDyLJ1Tlv1QbV3wZHRnFgATijhPhzJeIinU2K63GlMJ
	eebHP6jZCSl7XN6Z6rGHABOTPC7sB7MLIPwq3gqDG/KyhrdyHVlgcpah3o8IihAPDfHwaKL7CJ6
	wQ1bIOMPj1UAfFpvtM2C4SRAfHjxwEeiLxbsLO5Hx1nlxP/FlU8/AA8XueFV4TfFlXOZLbdD4vd
	bU9Z/Ib6k7W7UxnVCtuamrLcilpBhbBJoJSUlT/aUCG6f+yySU3XlR5uRXbEusywwz/VK+nlnA/
	qoMDFFn2kBRL99+RF6n24GbC15JqKQt+os4s5YYitQsIqiGwYLQ7Bq3FPUDw/jdauOhK4HkwQ37
	hKdO4oqbdyqUQ5iU+Uhln2gMzpYWZw6pUpKmQiDf1DvHPCXyTS/2mRU3dSUFTitpdsR/6Qpg=
X-Received: by 2002:a05:6808:1b26:b0:4d6:90f3:74a3 with SMTP id
 5614622812f47-5638439be59mr3259317b6e.46.1793255919749; Wed, 28 Oct 2026
 23:38:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029002052.54117-1-dennylin0707@gmail.com> <2026102957-suitable-gesture-be83@gregkh>
In-Reply-To: <2026102957-suitable-gesture-be83@gregkh>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Wed, 28 Oct 2026 23:38:28 -0700
X-Gm-Features: AclHuK970NKTknXqhyuBgBwWz22aYrs_CUFSUWZhOmuLQSID-Urkoi621mgPKbo
Message-ID: <CAGEkeHft5gqu1Kq0saC1O0hg+ZE9AEO1tOgeXmd-g10uk2obgQ@mail.gmail.com>
Subject: Re: [PATCH] tty: n_tty: convert the full VTIME interval to jiffies
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jirislaby@kernel.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> What real system uses HZ=128 ?
>
> In other words, is this a real issue at all?

AT91RM9200, for example. arch/arm/Kconfig fixes HZ to 128 when
CONFIG_SOC_AT91RM9200 is enabled.

OpenWrt also uses HZ=128 for its at91/sam9x target; see
target/linux/at91/sam9x/config-6.18. It publishes images for
SAM9X60-EK and AT91SAM9G20-EK, among other boards.

Thanks,
Hungyu
