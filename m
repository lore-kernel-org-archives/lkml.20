Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883764;
	b=eX96txs4hu/OOJlf4/yRMvjnYNnqRbmxeuecyLfIYGz1OdQ/ViqOd16CPqOzrD42Z/5m
	 zh4Mp5MUwoY2HPNulKROOzmUXP+7RZpg64yJqJeR3l5DYbrBPoIJ4ncne787vpbDu/eJo
	 bgwEC6+1r3hPPxFGeeGHQl6QFUJ96yeuactObcNYBzZ62mZp2n8oNh4cn+rd9J16Lrj2W
	 RM1TN4fDgKzUyxa/uyMocZ6joHDF/RHlHVploVEcVP7hLJftXE+CNGQrI8JVTRYXYZX0F
	 THw4vkvCFmFeX87tSMULlwR2I2rzLuF2Xkcdz/VVOObFkOzb25JMVZbr4hk+Aao+3Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=gUJ/mTAIlGtpLVkM7Z4srYRjyZABwmfl8+lgRfY7VNQ=;
	b=rhDQ/n70yTwpqiOqmom+bQNwmmhZuNg72wS0nIQuyWwehsY6cOTgxbhKyVoLuZRInwls
	 g4pPlNsFSq1A45U5XZSDKOwAV/fYuzprQrG2w3Ez7qlDRnhf1T1nvGGT3yl0IYTvZwsVm
	 7LFleD6Zc6+/27LEzbl9e8b4tVvCSSboKyEpnP31Q0qYA7JHIJk+oMjyFkRhS/VXHpQqR
	 kl8fZJyiFmF3mqRFj6d2cEbBZWorgnIo1kwuL+/USDF62XrQI/cCUoVwY4JNgv6ql2rEY
	 uogPAwAAvkgohE5ZqSEDvBAafQV5TmMuxcupMMEW1Gike5rw2/n2SqoPFuAbeQuBW4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hjaLq9Vr;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBFF606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CBFF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=hjaLq9Vr
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-380b40312e2so2450132eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794883764; x=1795488564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gUJ/mTAIlGtpLVkM7Z4srYRjyZABwmfl8+lgRfY7VNQ=;
        b=hjaLq9VraRkmZ3WvbkBpbzvfl0aUS6cyn5IGTECbEcV5FGLXjTH2bbiPrB/i4nFdwI
         9FJqg3WBywSqI0Qv3t0Lxk1L6zqArH+bH4alapmiKhdwVUGjRXPhfQy3brAfnNx02HAY
         Q36iSD26wpjGgk4+1TduAmiu21VChpK2ysq6NoxhP2lPaElRZwD89TYFXU4kfF9Y5Fyv
         NxfvLaLtcLORHwY7GGEm8dG5H0EbItGELMfEK8RoUlaPoNR7P4pzUChOEWtrZGCWpq2y
         FzWcT45l6ZNOgVJOMnpnaPBi9Bef4eVViOjzX5g4yH48wMP6W0uz8rVzDpTokvuS8xr4
         Eagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883764; x=1795488564;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gUJ/mTAIlGtpLVkM7Z4srYRjyZABwmfl8+lgRfY7VNQ=;
        b=CYGMtlsk6Ob9D7wAnDL99EtDY2Ebp+mXgpf0AfMTX/bLOy79kjS5C9TGK/WG58WISW
         o7DDL+uzknqCTXHO3tPIv/rl45toZOStAFXysvDWIh1rXwqnFkXKQXhInAr+jVFnTzPr
         PXseI+97YN7EAMCnM4PYg2tmbuCmmDdUvDQn0PyEHFMSh/6NbO6wg2paHGf/4bd4PxN7
         K0JAxWwwqWXRRXLGgK82oOGnXIjaAait829y3Cn8HtPlP8/ICe7R+hbP0e0/XrhkIDWx
         8TyV/riae826W5pmXfavKk/GKyVaUr06ZfITw6FfVkPy+jG2UoNjJWC4qZxG+fWuIl2v
         cnKA==
X-Forwarded-Encrypted: i=1; AL+hErFx2YTF5yC09RpUjoiH/jS4Qr+5Rslj6xu+MG0fzHRMXIDcX83Yfsuv3QnvR9ZY8BecJW8A1O2Sj7tfIv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mvwmzVJUUedNy7z2YqLLl+ZW4ibVQnqbiMa+I8IwoPXH+9E0O
	oYgexPBiTfjKiHMfqRIM+GcYHArtfJgw0eKQB06UYvHV19gjVfC5Y8Hnn95AXOTsIdg=
X-Gm-Gg: AYBFou2jOhLB6D4Y3McpaaTZRAhqdHChyYHtF6OO0zYOu74stt+oDZKn1oTq7AWTbuM
	mPPfXD1BWFDTjdXHxOs8au2eSJbcH5P1TyYPs3zz6GnEZzap190WAfv6ZrD+x6xYwImSahbRmSn
	s7j3Gku9GI+KZK36bRcOgtUopES2fnAYFmXOHbrJRDnfREvje8/LLl7JCxMXSNIqoM3MT1g87lj
	8QdzKUtOfcgCMBKfiIetrXJb4OgpbdLG9iIUUs3qvulYymeaO4MF8a0R7rCjFo0F+/DTAV50jUk
	O0OqAk9pNPAxwrlYwK8TTryG+uGN1IVkCixeXI5PM9m6OhwkhoOM32lo9w2JcQ0pmwj+UFN464G
	BVXeVbTRdUbAN/UnFh135mAoM0RBIQ8tb24lYurUkEyDNbotTfWiHU3OtzRVR7pBxAXZ/XMaiO+
	qHO+Ef8MPelScgVGdchPy4UWpIZqA9Yk3j0g7nmo2n/n6g3HCfwlKqOYYEahwuBUIszZb34eD5k
	IkNdVaCSQ7hGkLVzcRFbEfxwr8xhtjcIi1keAlw5aXvYWLgbL9ikZqlryzyAXbGsKWcskSYVSqr
	jv/e4nsky8/A+9MfnTULx5qwfUST+xdc3xzjTnyvzn4PW9g5e3C8EwyxT6Uj9D6patdVjtTfZ1v
	NXQkw910i9Xg9
X-Received: by 2002:a05:701b:4248:10b0:1b3:b455:93db with SMTP id a92af1059eb24-1b503131b06mr13141980c88.24.1794883763733;
        Mon, 16 Nov 2026 18:49:23 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm31493244c88.1.2026.11.16.18.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:49:23 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rachel Menge <rlmenge@gmail.com>, Hardik Garg <hargar@linux.microsoft.com>
In-Reply-To: <20261116193146.65315-1-sidchintamaneni@gmail.com>
References: <20261116193146.65315-1-sidchintamaneni@gmail.com>
Subject: Re: [PATCH v1 1/1] io_uring/kbuf: initialize arg->out_len from
 arg->max_len in io_buffers_select()
Message-Id: <179488376281.22588.16183512803050273616.b4-ty@b4>
Date: Mon, 16 Nov 2026 19:49:22 -0700
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


On Mon, 16 Nov 2026 19:31:46 +0000, Siddharth Chintamaneni wrote:
> io_buffers_select() passes &arg->out_len to io_provided_buffers_select()
> on the legacy provided-buffer path. Because callers initialize
> arg->max_len (from sqe->len) while leaving arg->out_len as 0,
> io_provided_buffers_select() sees *len == 0 and always selects the full
> buffer size buf->len, ignoring the user-specified sqe->len limit.
> 
> Initialize arg->out_len = arg->max_len before calling
> io_provided_buffers_select().
> 
> [...]

Applied, thanks!

[1/1] io_uring/kbuf: initialize arg->out_len from arg->max_len in io_buffers_select()
      (no commit info)

Best regards,
-- 
Jens Axboe



