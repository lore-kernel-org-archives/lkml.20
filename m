Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260985;
	b=byFxvX7yPbLpZlyhgB/DV2Amx54E74S6tk3+6b95qfS4r3tLBWbraFYNPXkLPhmVZkQj
	 BskSB1kyeDw6cCBL1DbyxMngsWdIBiPR0tRbhKwk0lg7ibfdyyJ5UjyVOn/Sr+7D10rxs
	 GVXuQpFRCgQflECVcS/COMfQrgZyx3JtNbuybE9xnIaBCvSDG/bFpRXELQVR2QLv4tZKw
	 LtxEMxhNkTF6Be40oAbYHwpNp9wQsujJpU19Cw6lMiXP/PG2i7Sb2fRWMH4C57vlQg8+e
	 SkKA1xysZZPuBDhLGMKIx8xT1fn+zSsA3e+G79tOz7g3HabBv0dLd/XWxl53XrO98IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=kIPvUyy58FluJNp+/4hObdnVo8Xv8U2P/+DLXfONN+A=;
	b=gYfWLT9rfWA12BgOVaBS6tnG/BXhmQYSzw+jHR2Y6ddaAWKkEtxzW6Z0wjna2aiI3PuB
	 Lbh6osTZEcRImlHmsZxBQjn5QRHe7HnpqPJtoFPHjka+j8DxPh3E9wibqq6XtXQhuDcA/
	 c97rumFrzQP8ezNRU72T2cNkfrbR9yl+ri+4Cuj6o02uc+XPr4v8pS7etq8KGSsn2TROt
	 J6QKOrDgavLpo+BPYpOPDH25oIjQreYqGfHWuRsJdQVlXSEtUBE02V/xck3uGmorjoobF
	 owexYahfuDq1u7gvJWICXHKh3cJVAaCbWA+wl6Jpi13SeOtSzwrskXpASh7/cflDUcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="P/5X1NKO";
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BE9606A332
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BE9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P/5X1NKO
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a60f90a924so517742b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794260984; x=1794865784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIPvUyy58FluJNp+/4hObdnVo8Xv8U2P/+DLXfONN+A=;
        b=P/5X1NKOtIip1FyBmDSV4p0wl2ud61ENGtVnUGBVCAjEcvdt0YUwj455lJmo9UfqMt
         vCOhEAmZ4yrEzAb2eT5Iv4n8biEztSWh0scwKCiXrk1MmEA3o2mXwAjpM6ETbakkQYg0
         vNNye0WeTz+ceNZPeR5hJT2cNv54WQgI7/V5URcrhNbfO9DNd1MAUP/8kj5qivrPUoVL
         sLAHqfryiGqWxigTQpR/0hk9aw9CHzGbrRJB4zwn7RREdvd4AY17qM8kIfLHJM3z7kuz
         HGwIQlp3cOYg8a8CznYLh0PlnYU6Ug6wU9OaDqzjVyrTJjusApj909yqk/ur67ohJS5g
         GydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260984; x=1794865784;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kIPvUyy58FluJNp+/4hObdnVo8Xv8U2P/+DLXfONN+A=;
        b=LAG2N4g620m1aLBzlHgYAbFqntdlyjxuavI53TbcqEfjvaVbRkVh1m53vJzuMGcUIa
         De4rUeDN+FImS4DQ+4ah3C4PY4fi53Fmkni6y9L5L/0UOS4M7oWuuSVHPiHZwyq9RylH
         Y0Gp2kVJCu36S9fk+qhsEa7YzzMqZTLr7BPAIVFVQFoC1QaIqKYB1uKA/YbDQYmomFdS
         OtvzEez5DH1Hem8jgt8QLrS85h9WYC2kzrz+UdEFaMXHo2fbJDIi5njaRDJKq2i0wg1L
         9GMkmDMUZsi6QiCsbqZT/wYb1gwz7M/RVOX9Cw2xhk6sQLZSllFbk9NZfBwQAmc1zHrF
         XTmA==
X-Forwarded-Encrypted: i=1; AL+hErEA2JotMVbn3Jv5TKi1Kz/RvHkVsTO5AqTbPxk5EN3F2ZckW7/1h/WDFNJtFIKY6XmbhyHCwFdKUu4WCs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uT9gzAIqpvDijkJAqHJ/4HCDaC7ptTv4ULu27ESlMr2LdTIWD
	EW0xG++VhzsAYFbMRER6QUad3UwjJCEpSy84mFWnP5lAH8R4ydz8kqz3p7f7gyrAnARqDeWAyLR
	g3TaE6Ic=
X-Gm-Gg: AYBFou3Dai28L5GXDJS/hSljFzsMczGi8kTX9VjF9LMhaOwJLFRy1+qUSpR9wgHIBij
	49hobZVOmAA2/5mRMdhidjsB44IPnOBV70klUNNGK7Z1e5RgJk2+f6+iC5JjEjjTVSewIpK/khT
	rXXy/oL+HYYd9OCqOKlOGqo4+DQlt+/O7WjWNGzFGSJIj61TpfP8O/UrnaFHNtRrB++dZAE8CdD
	+Xh4vbhIPhaBnnx3/HrfNiWzmeBJZ+5L4/WNeDoRkVOPGxNfX7e/NB4Q6F3BWQ+D/+jE4qQiNyI
	f72WSvYRG5YT9ybsM52VC0C//ifubvfbi3Ftu2OStSuXFj8XRF63Fck7gaQj2ak0yTOuWpSx4Wd
	bS1n7sEZOGoYwEzgkh9Ieh42QTgiFbd8LBf0cXjnW8mPe2BWUUcA+ksvYU1NhE4Cf/iZO9sjsgD
	fJpdSEDkVWnafpezxSiad0AKBEwk7kWreyG8xDicVxtQGPY7TunI9lOaWhk1FPhBX+reLfFm/5d
	he0VHuGMf1IwZ+czwSMYfOYXAtGJGR8k3Wx5/acRscefSSSXeSYuikAJ5GvVdyjqv6b+7MivUyp
	detla8ZB5U99Dk8+p0X1lQSQGLJykUbNEg981Gx8NoZ2HalIiu5d1k+1PS/+iQ9ljy4OGaHrg0C
	EfjVyWV1OY3PI
X-Received: by 2002:a05:6a00:3e24:b0:8a0:3ed7:939b with SMTP id d2e1a72fcca58-8ba864bf926mr840169b3a.29.1794260983915;
        Mon, 09 Nov 2026 13:49:43 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa1b2896sm129427b3a.17.2026.11.09.13.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:49:42 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Cinq Prairie <notprairie@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Stefan Roesch <shr@devkernel.io>, 
 io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261027204840.7823-1-notprairie@gmail.com>
References: <20261027204840.7823-1-notprairie@gmail.com>
Subject: Re: [PATCH v2] io_uring/napi: don't end the single NAPI busy poll
 early on need_resched()
Message-Id: <179426098226.155418.4382559329615606121.b4-ty@b4>
Date: Mon, 09 Nov 2026 14:49:42 -0700
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


On Tue, 27 Oct 2026 21:48:40 +0100, Cinq Prairie wrote:
> With a single registered NAPI, io_napi_blocking_busy_loop() hands
> io_napi_busy_loop_should_end() to napi_busy_loop_rcu() as loop_end and
> runs its own loop once, relying on __napi_busy_loop() to spin until
> that predicate fires. napi_busy_loop_rcu() sets NAPI_F_END_ON_RESCHED,
> so __napi_busy_loop() also returns on the first need_resched(). io_uring
> treats the return as the end of the busy poll period and sleeps in
> schedule_hrtimeout() for the rest of the wait timeout.
> 
> [...]

Applied, thanks!

[1/1] io_uring/napi: don't end the single NAPI busy poll early on need_resched()
      commit: 39c7210e970200f8b17de3767c73efe64173a95f

Best regards,
-- 
Jens Axboe



