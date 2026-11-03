Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716298;
	b=1dDZMkjDvIQk8OkTCkaC1L3dBPMH63DOS7JjwEzgZumb6PtC4R9gaFdX7nm4qSbuW57G
	 yf4VD4dfXvfFd4//cYPrArxfxfdRm4gtI5H9X7vOkQv1fJuvNCEAVMcspHp9ihCqSvFcy
	 p1AFqMWiJWPFb7+NlBBsVn2x57UWhEpPZeKQZcOuThmx7BpDxMRt1aYIHTYZfTJII0AUs
	 B3y0XCbQKepXiH/i27j8GrTqcG9VP46NT+w62rrJgh7boEeE2iZdlDvIH8VGprbKxWJih
	 0QXkznknMDx6ndftxhbjQCzoYJIQdPDHSon7nBRTUje5dsWyYEpR4f4JQbOMFQ2RClg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=uYybwPb89QwCww+5dp+JltAH+UFg4/2qC8d9/J9llBk=;
	b=Qq6XDAvhlZzsjyTqDQEy4OyE/dohWqo+eWjUOukz3fpxqvk5+oAoUwlGcTpgpXoKKJqh
	 tydjO2V559M+n86HYTJbTymMrsEczndvzEoKw0WA9a1BlLJFvltCN1Lj8VQBFgSutpAws
	 96SvRQjp6GDS+mI7UYw9hXCEedJMUTQRGzzzJITv+PX9KbYthFT++Gidx/8HFni1Jn9WV
	 yUG+ONzZPB3hXnlcBxr3t+gm09NaSSdJk0GSGkJfDwxGpV8F1Mdrl7s06F7mT2W06+/8X
	 gsh6H8Rnf6CEkTSP7OiMPdcPTafIrAF56gu3qK1FVb7ULe7WuWdCCBzIyXzIPr4Ilkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="i35I/h3W";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110260A2611
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:31:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6110260A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=i35I/h3W
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-15dd124bbe7so6038660c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793716296; x=1794321096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYybwPb89QwCww+5dp+JltAH+UFg4/2qC8d9/J9llBk=;
        b=i35I/h3WiGP2irRIUqEFG4dVkgKZgcLvGR0H2bNMnIVIYlsOme4aozuauP0CWGqGQp
         cwkPoU3bRlYX44WqrNEIZKi0IlxOqkfckXBzGct7OQJTUOpgFPIycvec28JNH/OeenHk
         zcSa5FL0oePvH1Gi/X+5+HFc4OXMtMceb06I9L4mqXsD3jJ/kb9aUpk5BOagZEWX3OcM
         i6ysa6Lv6HC7BBA2EILnCSzNq+eTkOZ924CqqFhwlX7gpmaLxWdo+9DM2xh2VrZsx/M8
         V4B6T90//w6YhlFAcxGRzbRoWNgfvjFAUhc1VGhgpxCklaVKUlLR3uLlbXBv2IO440ou
         AEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716296; x=1794321096;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uYybwPb89QwCww+5dp+JltAH+UFg4/2qC8d9/J9llBk=;
        b=GzMljGXUiHnFDjO2Rn3gTrBB1DXRr80LQQfV/JJ2qrjYvnpAnmSH4f78lj2wCXSdmu
         j5n8fUTpspWhpklTHa2HpmuyxqG0LF7aiZjUIZRYMgIQ1DgHTvVebCjmET5stzxaCBh7
         Jnj1IYe398HKBH4NFhiCUFjZIRZZfkHtB+/FzZJ+nKYN1h+JtlwH9OfEE6Rh5q50GTpj
         h8oyvoIGBnqZL1cuE62GXcPZdJUs2OdaTrQE8GQlWwvOSVoX6JtCBoNC5o8P3i6DXSmF
         sU5z0YNa7c/0DdhRdRZNJkLPUxkdAqrQHajBUkGshN2aO2nXXYbdSCT3nRoswJJTpmiz
         Sbyw==
X-Forwarded-Encrypted: i=1; AKwUvByBsf47x88Nc/GsRoT60sX1zlsIIns39cx7zzzir4zzcfE+WUWc9BuLvs+CjT6CNwKUtj76/NUFrrSMKOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i4LJ/MHeKeX4MPiZGDVOb5Rk8ogizceoGwh86TEu4JgDMeHC5
	VfdCG59jDIn7i5ibUzXrbqYGEsXOQe6Ac2VIn1hLPm3tKHKkEDD22BmLI2h5ogA9fAE=
X-Gm-Gg: AYBFou3ahXmPcxo9sqKBaBI5JY3bNCO4r/qg8PRnQb1Wn43sozOV6OfEJ3EpxTsmAJr
	DDJvV3Ijdu4gWcUuXCYSb3e5h85My6CX9IMamKLKWHGxIUVRVUS1I4WXt5OYm4Y5keM/lk5trCC
	LKfVe9FxnamI9zQ7H+O5TvvAO0b2KV3vMpjcUJg4R8y6352AvcH8RnpmHM1nm6//NO7R0ZZmCwI
	LE6Mu0+ElkqNoOxjb2Yd0K85WNbgUPO65GJbHxO3uS/bkJuG3gVMnRvgNp+LT/B6V9x3IWkkB+q
	e2f2pWK3nUDtGqW7MkrZYUgoTANYNN5kbBrxRUeP+mOImKxWt98Lt3bND/itPXpYMxes+ah55la
	t3sjZbdqWICi7psc5rbJbxiiBJBMqD8Q9guURpfwwtVsY0ZBK5foMrIVqfB7WXqgPofH0imHBa9
	6gmFAh+6RipRal2t0KjBGISW3X18Zvi44GcR9Hl//ofAuk/Zaw3m6Gei9i5o/zRrHX2FMSdYZy/
	Q1oZu1bz85M3fV1LqwIq6zCMEKpvuQADRfLLGBVNCUqEHj2L88LvmI2OA+GY4goqz6XOljMhvwI
	TQTIwluSrflXg8ZFVg+Mbogss8HKWypB4lZdmAIVKKXsuSaR0xdWIKt+vFLMoUA/CHMt5Q5XuKS
	XS1aoKgt+z+Gu
X-Received: by 2002:a05:7022:223:b0:144:f089:b189 with SMTP id a92af1059eb24-1ac5c369250mr26670869c88.36.1793716296265;
        Tue, 03 Nov 2026 06:31:36 -0800 (PST)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b23b847348sm9534779c88.4.2026.11.03.06.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:31:35 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Meta kernel team <kernel-team@meta.com>, io-uring@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20261101022146.309201-1-shakeel.butt@linux.dev>
References: <20261101022146.309201-1-shakeel.butt@linux.dev>
Subject: Re: [PATCH] io_uring/sqpoll: do the return-to-userspace work in
 the SQPOLL thread
Message-Id: <179371629544.3691261.3795019117614680928.b4-ty@b4>
Date: Tue, 03 Nov 2026 07:31:35 -0700
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


On Sat, 31 Oct 2026 19:21:46 -0700, Shakeel Butt wrote:
> The SQPOLL thread never returns to userspace. io_sq_tw() runs its
> task_work, but the rest of resume_user_mode_work(), like memory.high
> reclaim and block cgroup throttling, only runs when the thread exits.
> So memory.high reclaim only happens inside a charge, with sqd->lock and
> ctx->uring_lock held, and not at all if the charges can't block.
> 
> This used to work. The loop called io_run_task_work(), which does this
> work since commit b5d3ae202fbf ("io_uring: handle TIF_NOTIFY_RESUME
> when checking for task_work"). Commit af5d68f8892f ("io_uring/sqpoll:
> manage task_work privately") replaced that call with io_sq_tw().
> 
> [...]

Applied, thanks!

[1/1] io_uring/sqpoll: do the return-to-userspace work in the SQPOLL thread
      commit: f013b695506491c5202a412a6568313549c81f50

Best regards,
-- 
Jens Axboe



