Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551056;
	b=eG8zcy1IVkyncxbK6c4qrmuWLT5a4BvHWPJaGrSz3KUOlq8V9Z/7lsWqy3X1bAhVeKNV
	 YT4n94WwkZpFRMv0ezi9aNfsQeP6pEntGpPyjX2SfKNwd9wU24QpEoRB9LW/C2HpFZI4/
	 qThKyUlnD0omtvOSIY9TBq4+AB8404RK2Gz4h64CGLWg5LVTgkORntxMX1zEE/6lYlKTX
	 nf3N7AZfWIvWO+Yc4QyFi/h/ZXdBA6SM08pabcFQR/U+TML+nTTR3TQGqbjvwp6MX2HOp
	 MW8NVKC77dY790fIkBSm1ClGch6U7Qi63y0jvNMQV9Hi65mygKJVaaBRSs84YG1sT+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wZoEfE7hyPINcO4oEzH6Xm/UEuOnJmf4WzCd35Q4EqI=;
	b=o/XOnwZg/emcHidwlZ36Xt7c7kBtBSWaYASh+HgV5s9zXrVjgBPVhoe3NglCD6R4oPnr
	 0I22Twa3l7k/ctTJHzFknIFvrSzYsRdNXK0pjDNT92gT9SkDLjqsnW9rQHGQXPVTZwZTj
	 G7D3+3Kcjf7zL7SmghQRFkVdznd5O/PT4cQ8s2PKpBgp1A43b5h4l6Q6STTmAr/1WMx9k
	 0VunrrjgTbGRSvTTCyPpi2j56iJvqzV6+BLgBKVzBN27C752hRg+gi6F92LzkBzY3Idsn
	 NLg5vQ8BCAhBO2oNcgdmaXLx9hr2IGujDe/GKhuUcMQLrvCl05nVbhhy3d8PBw20xzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hHjYrzFv;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1397D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1397D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hHjYrzFv
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so611352eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792551055; x=1793155855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wZoEfE7hyPINcO4oEzH6Xm/UEuOnJmf4WzCd35Q4EqI=;
        b=hHjYrzFvGja06AK5clILci44z6cRylDO7K4O9c0+fd4jLMi5LYN1soRxZ9YO3xmTM/
         8LSFYg2XJuj+R4+q+fQeyJnnldsSwyrCvF6M3MpMYQa/yJzZ3IzxzFInDc5Eg+qAqHO8
         ds4chpMAmBe0qyEY7bhw9NyRvcH59D6LHjyWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551055; x=1793155855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZoEfE7hyPINcO4oEzH6Xm/UEuOnJmf4WzCd35Q4EqI=;
        b=PXsB5Jf7SGFhDWHG+V5CxSzEp/r2tDrUxs56vzzUxL0xnicQPDcfHY/FmS/TLZIjUC
         UgsIkprBIRoKx6YdrQlquWsBvY9S4rEQKME/+FiMS/LL2QBgI8N3aBFMjPOncGDzh4iE
         XrqSLGMTWf/OCZGt8krx+MAgnur5/V3smfLjQHO1s0dXkT+y71dG/sGqwEfYXNsgfxti
         dIYFXkr5BKyY+7GzFczYpkTGBsppFixDhVS4uWO668bPfYGtz2KFuAZzItSTKMogH2ZF
         32H6/4eixJ/5MhURYaPOzdKqknFqQmaicK6rZ/h+DYz1SlPlv1kENk871WSBbBReWCAn
         rtFw==
X-Forwarded-Encrypted: i=1; AKwUvByC2Ae9au8dVEfpscQQi1apod7rbiPF0RpJRkppuc1Rpwx+osOCk/4/Fqi+NiumuDuot45pPxCvI2QqRyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyMF/fRX9ie94qkacBjVaUEKLNSjBxeaI56dvOEeFIDzU18ft3
	n+SXTA0n3FfyMAw2uI1umoRwnVXRdMKaCixBlLlxW/89UDm+whO0J+ZEMHqGhpgy9w==
X-Gm-Gg: AYBFou1QevReSR/Hrhux7BXrklZStIuIUkxoUX/XGLlmhTdqnujTshuJyr2XASPtCXA
	LNIlLOFGtLNrYT1RBqQRhYenYnKfOrOrF4+yAa4aQkvNOtrftt+T//nRHfO1TLLYgOqljteJOmJ
	m3GOn7RQmc+1DUCXx1dNqv6S2LSKaKbhgbRVX0NpBcoQmkD68Q2j59dfd5dDx0ADrDGQITAERM2
	MR6YcVgklY8JpSfCPmbt+5BOPEg0VlfIWzqlbPKEkKnjQV0MqzePle2UwAc6EFlqwGsc7gzI/I9
	3HI7bVq414b1sJ54tzP3Jls57hKC0fzY8uRRjjhaBdyonoVDme9lS3uH5u93zoAxhMxI/vEWboG
	JYWxd3SFg0Xr+lQIvVoh4hZQTWan/lV01g3Uis46QC9utfCQKJMlOnBvRcn8fG4HKRyropqK+XP
	RjyKGLQtg/8hGqYoqj1C4z+amC+2o4jHN09T4zTNDlACzOdskBeLQER/AcBeuFQt011octuJyZ9
	1e7ZaFc3HJxVzJoHZQLXQVcWqvppRJtFGy6oxqxKfwIKL6GkkTfjw902njp5+hUnTf9ZVhSH4l+
	D/mu7YiCep6IY1A9R6yH
X-Received: by 2002:a05:7301:144a:b0:35d:363b:c115 with SMTP id 5a478bee46e88-3674db4c591mr1276619eec.30.1792551055018;
        Tue, 20 Oct 2026 19:50:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bd2a6sm3819901eec.18.2026.10.20.19.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:50:54 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:50:50 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Petr Mladek <pmladek@suse.com>, 
	Douglas Anderson <dianders@chromium.org>, Tomasz Figa <tfiga@chromium.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: Force console verbose when reporting lockups
Message-ID: <atgoRCF8OCsD4keA@google.com>
References: <20261007051726.4154849-1-tzungbi@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007051726.4154849-1-tzungbi@kernel.org>

On (26/10/07 05:17), Tzung-Bi Shih wrote:
> When a hard or soft lockup is detected, the watchdog prints a header at
> KERN_EMERG (<0>), followed by diagnostic details (modules, registers,
> and backtraces) at KERN_WARNING/KERN_DEFAULT (<4>) and KERN_INFO (<6>).
> If console_loglevel is quiet (<= 4), the console skips those <4>/<6>
> diagnostic messages before vpanic() has a chance to call
> console_verbose().  With the buddy detector, this leaves only the
> detector CPU's panic stack on the console and nothing about the locked
> CPU:
> 
>   <0>[ 1535.991833][    C6] watchdog: Watchdog detected hard LOCKUP on cpu 7
>   <0>[ 1535.995960][    C6] Kernel panic - not syncing: Hard LOCKUP
>   <4>[ 1535.995970][    C6] CPU: 6 UID: 0 PID: 0 Comm: swapper/6 ...
>   <4>[ 1535.995997][    C6] Call trace:
>   ...
>   <4>[ 1535.996063][    C6]  watchdog_hardlockup_check+0x1e0/0x288
>   <4>[ 1535.996075][    C6]  watchdog_buddy_check_hardlockup+0xb4/0xc0
> 
> Similar to commit 168e06f7937d ("kernel/hung_task.c: force console
> verbose before panic"), call console_verbose() before printing the
> lockup report so the diagnostic output is not suppressed.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Looks good to me.

FWIW,
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
