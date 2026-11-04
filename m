Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804852;
	b=z4s1e+dmEo3BuWV/MiHlRlBOoSmg95b9Z5CMzmvQBSqG/szyA+7mVXT8HT6L96fRZOD4
	 5UO2B9gf8rH0u5Jb1SqcYNmKb0Yu2pH9FvhtUY8FNOXIfhcMt2gfGgnSmBUaS44gxBpjM
	 KR2cucQPmyNagcuIEvQITJ7rw9IW7w4VzL+OrMkKPzguZYAazgs32ZNMHArsZQRAUZzcZ
	 BYDrunFh8+Gp08j6EXLZdYQMQ/B6/yGIlUo/VHXq+VfOP5L9U2WJVpDdzAtsRu08Ap2es
	 8bsYeHE+YKwDVWpdwAEIt4HORQjEaLPc12qCB/CBn3hTJiyLuKeR2GiUA/7T4dQWuKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=SRwwF7d6JKQ+7rZ7FwUD8U4JtRdsbauXUbAizZTDQkg=;
	b=DjPc/BzUAgNH5VgVPJloIv9OzEBKQQ0fSOBEDaUZsNCsBL6l3kXT8g9DJ1S+SDJHGejG
	 O+1/2QzP4fC1fzLbTyRAwmOIEKOstwyK90rGWHUSiqG9IItyt5KCFHNlyYx4atn1YBTsv
	 9Zao62iobUYd789l39xZtoA7YyInHRbiPwhTcUAOorG9H+4CRtZjjlENRdjQljLweVJVK
	 cmFDeutbAagkviHspLllpfSqq+QybFLUjGum3FIv8tkfRUw357DZadePTT8zszTPAesdb
	 Ch8Yh9kzyu5+20nNu/hFPf9oqnZPD01xTLAXJ3h/UYKFLuGS1oqRNf4+cYF96zhb+9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iaPSO7yl;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E83606D808
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28E83606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iaPSO7yl
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-70b875f6f13so743574eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793804850; x=1794409650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRwwF7d6JKQ+7rZ7FwUD8U4JtRdsbauXUbAizZTDQkg=;
        b=iaPSO7ylhtk6kcT1szhbnRBx/7YenRZ2KsqsxdHayRL5Vz46gvSXYRaeg7gflqS6pu
         l11ScjSb8DAMDgP/ohO2M4OIGNXebt0EZL8kwwCzzvNFJbOkFBcA8SXIpF0WxV1s/way
         I5YO3i1tPWzqyR4Oy/2YxxEdtcn+o5sek0iIrFbhGuC+9qtiSM2A6a892R+N4dUE4MIr
         eMTLWEza1A/aNqm+XpJBr6XdL2MaALHkp9Avi4ptspwk20uHIgo7JCQRKZTHO9a1QKii
         MtYUcL2RtxZi3Zo2tedy2Gl9HULVFyt9nyW5u2/Qwovq+xhJC209skaa4pwwfA1F1V1e
         dWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804850; x=1794409650;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRwwF7d6JKQ+7rZ7FwUD8U4JtRdsbauXUbAizZTDQkg=;
        b=Nx302zYR0pfEd5Ih7DY/VbOgZ3pqLA9mXSTI3Nk4wFOhgiDa7kWngUDX8XriHbmnLv
         14EzDakHvu32eoO4diiHXO2V9npfipR3JrEGNPdATDBdEaUaUX7gzZugv088Kyyz+VPd
         xvKUgonUM28+278W6P5eXof9aYcODq9S+TrjZ0tfHYo2mqWc6sAnk8wpO1m00WoaK4Q0
         PXZI/yiUx8Yo7pir5XRZQswrXOfuf1JVtH0MzxgibfUDbFi1L6kPBmm2FbBn3P8sqwRf
         gKZlKAnilRgoIfyFmdGnkADo61I2SRT9ktZ/TnWbNEiLojSsY1sMoUyVsr+re9N4EvNK
         sSqQ==
X-Forwarded-Encrypted: i=1; AKwUvByrxUhPBTyYEYxGJ7/SslxK2kVNfXRuAbSySiip/SOC9RU1ZCYrH9BNwlWTuGZRC3Fpda1+IxwGH0TFxdE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9igrX85lh6R4nXlBeXpp8/dpVh9xao+zS6PsNhCqcy/s3ppTA4
	qG/5Nm48c1Nxlidwfge4x/Gc/p8cbFF83eKJYl7xpLUTfRZqwRgvxnVn/SMCWWHUYTM=
X-Gm-Gg: AYBFou2O0VdfKadp4wEiUunrDU4diSZvTsm9g/YW+Jg9Fvf8PnM243UUJK6XOhrut2R
	m1qgvHjj1Ie/1TIjWPd9yhoRcDy6Zcd0BIUN2MaXQRujRxQo0uDTbwfRRB/e+VAwO9MMiAYS0sj
	QeWyPh2JcrfWDyC6hv1m5JuV+Mx+LrKV5SeXzqTcK3wVvJgAi0X/2b5WkGu8Yx1nYTyKQ7T367t
	U70Z7P+dHn8D7yQhnkj3POEmycZZaBDOwSOaz6BQuAFTIM4W3bPQxDQLhUj/qBpbXoU3EWibvdt
	wu5c+K8Hih91mTO+XSFTiUUX04wEuQMCXYCcYrCwXq0LQ6deuJZTZ3xer7inrtCyD93XP2wUOD4
	CuMeq99DgVLSORdSHa1uf0c16kCf3PxJGViP6j83M9SR8OXOgU51C3z0nTByF7rJaVOmQNF9DnK
	wVKkZ8ZtOlVlRY3evVk7Eqh2197qlUkSBfQgah4ePOCtBIPIe7GBX0XxbKjoR+ZtyXNt9NYgJVT
	Jhw8dMU5yi3eNisTg/juls3G6n460p8lBEIT/y+9KhZiKxPi+6Gr4LZ/lfsTAgnlDgxo2ftwoEq
	aYkk429DXyRgWYLP5gvHWvA6vRbP+Tbz3j3/HWTJTqwwbvUatMHWa+VHltUGlky00iW7y1c=
X-Received: by 2002:a05:6820:169f:b0:6dd:4f30:258f with SMTP id 006d021491bc7-714f253a484mr9672440eaf.56.1793804849653;
        Wed, 04 Nov 2026 07:07:29 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c0cdb22dsm1886033eaf.0.2026.11.04.07.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:07:29 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261103163928.641519-1-sashal@kernel.org>
References: <20261103163928.641519-1-sashal@kernel.org>
Subject: Re: [PATCH] selftests: ublk: fix the build and file offsets on
 32-bit
Message-Id: <179380484851.4021488.1650834850006214841.b4-ty@b4>
Date: Wed, 04 Nov 2026 08:07:28 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 03 Nov 2026 11:39:28 -0500, Sasha Levin wrote:
> kublk puts pointers into 64-bit UAPI and SQE fields with a plain (__u64)
> cast. ublk builds with -Werror, so it fails to build on 32-bit
> architectures:
> 
>   batch.c:379:42: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
> 
> Cast through uintptr_t. kublk also passes 64-bit user copy offsets,
> which start at UBLKSRV_IO_BUF_OFFSET (2 GB), to pread() and pwrite(),
> and with glibc those are truncated to a 32-bit off_t there. Build with
> -D_FILE_OFFSET_BITS=64 as well.
> 
> [...]

Applied, thanks!

[1/1] selftests: ublk: fix the build and file offsets on 32-bit
      commit: 3197517875fdcfae1e9b5a4dcaf35cbbd66c413c

Best regards,
-- 
Jens Axboe



