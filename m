Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897588;
	b=dhdFhzHcHjQXaOboCWIp/S7i245AHWAt2WInY5Km1TmuFEJzW04xT08DoeT9Td90XaH4
	 Ho+Xq6SxqQZ7iTvLvmi7i58igERYaNFF85ifUwGi4dWvWx5ijrx2tEYhR4QYFjMRb1IOq
	 rk3cbQ88Us8+1mS3+EyW78H2w+MZmC9b+/Uj++88LB091YVo/FSU+3S2fQcK4TFLhCP06
	 k/xA7C70ZjroYlhUK7kboqMKdeyyeHEAOIkVt/qT5UKAmDYzo/7vjNKL/07VQW/3d4213
	 U5Kz1bz03KQrUwLLAf2GaMDlro0/FQEKnmM5KqEYLUd7S3LZNw79mQQ2Lb6VQ3NkA9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=WUR1yw/NzCt/ibiVDN/9/OoN1Hg4UhV1CJmzmryBLQU=;
	b=IWQczbtNyR88dj9SsvuvD5edLtmILJzJvSDo48sTIkSF5F6e6E7ff+ZbIckmJTyuIA2V
	 hQTZfg2npJoqjKckrrAkzKh1OTMSw0E1wVtBVpv66PJvuNntnw5bJT/c2DZmLEF9zlFGR
	 w2L209I1CpK4khIRvIwe1JAtzSgm+F84m4wInQ0zOWDq3GNBl1ET0yAXGCFsf5R0RqH2m
	 gTwPqpkBauxrHNL/hu6QI60/7Tj32Hm9g/zfKXWphcpuAzE4vRW9/n2BbehE+VEdyeq3V
	 cul0SBwjOu8zdI6Lgd13pUSkHPEwxDfD24/YSFbl4r9Svlpb7M+jG5aRwlzGv44Febg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eyIg0Uq+;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC5A606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:53:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADC5A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eyIg0Uq+
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so240195eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793897587; x=1794502387; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WUR1yw/NzCt/ibiVDN/9/OoN1Hg4UhV1CJmzmryBLQU=;
        b=eyIg0Uq+Pn0ny/dlnpNDcY4E3rAYt3Zya953Ttlgf9w2l8X75nYvlqIWPKYYAGbz4C
         xVvT8xgr0RHUfkS9ngFHomYeMYXr12JBOFmVd5li9Mm5Gzuin2hRsdajhkVpUtnMnvZa
         HuHGAkEmkTjfTqGM6S5iI76TqAwGe7pFBPn2kXf7qzKJErN9kQ7IArqBDn2edVpRyak7
         b1dJ56Qvcn2QQ48EHsrvX4qojkph7+/kqWJaPYpqWRJY8R4ssT9KuiFLkfVYs92nCJ+n
         vBHHP9vto/BDLXZn3DZ+ziuPt7Smb7b6uKjQSh07CCqulcuEy4+X836f50evWR3m1VtP
         l8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897587; x=1794502387;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUR1yw/NzCt/ibiVDN/9/OoN1Hg4UhV1CJmzmryBLQU=;
        b=qComWUtQ4IWZg+HIaQ0bo89sZScSnEMyha4YvfwLnhW8u13GIprilcn51nsu7CmuGg
         I2ZAJ8jYwMo2JwXf+hrXia/hUDVlEDvaoJFu5FbsoVOl3DSrazXIaw9GfMUzM8iZbdrq
         yWBfv6haRR+2jZ0w2Dd0j2+pWSnDaWtrHbXLG7Cd4t3XuTUcb6f5BMgr4s6Ayj/OUsVg
         0htx5+UiAmlI00Ebc03ybC6Rh1CEH0u6LNUgwLibongFlvegqw3iwZZWghjiP6bBaAbr
         D+ybtJESm655e9ye2KSGw61RlpwFanSwisLkLbKvWzdUGGM+kXYakzWa+JF+U4fyb94L
         p83w==
X-Forwarded-Encrypted: i=1; AKwUvBwmnJYTtX1DonZ7ktramik3tcOaZHGT9u1L2moxcZO03zP7kvbiNPBqzZSzxr2oTEMCairsGF1fYt2wOpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z++0s72fc68T1Q1KOXs13SHgGcvR1Ni5dN0O/OhI/aM4z/rDunr
	1m0B3Tzgvj5mRRwMbsVYaDOa1vVsSC88XyDpKNe0jUdGNmrcPLi5VDoPlCnxb0o3lBWFajYSLHL
	0S94Q4t/qpcuZyjWtiOPzhpZYNJYmwA==
X-Received: from dyad26.prod.google.com ([2002:a05:693c:835a:b0:36a:de0:d28a])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:fd14:b0:36c:cd7a:dd8d with SMTP id 5a478bee46e88-36ccd7ae336mr7157275eec.20.1793897586257;
 Thu, 05 Nov 2026 08:53:06 -0800 (PST)
Date: Thu, 05 Nov 2026 16:53:05 +0000
In-Reply-To: <CAO9r8zOY1E7gCYnJZAfKvyHcbj8e2WVuXMqsaPGPsKR4-9itsg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <47ed45b5-de67-41aa-aa21-a3ba3479a7cc@vivo.com>
 <anXJ-5_vO7-toSe1@google.com> <CAKEwX=Mm2tXcen-quRXHf1Y2qSHYvpEUe4xiw-mHYaJnRUR-EA@mail.gmail.com>
 <auKqt6b4AxCLziIH@google.com> <aufPMirl4cD7tz0X@google.com>
 <18e4542967ebdd10.3137322e32332e3235332e313736.1dfc41.0000sendgmr@google.com>
 <CAKEwX=MV_xEUvz91pz6uc4qXWnWOUDtXZ2zASdNVOBHBLeA60w@mail.gmail.com>
 <18e4ebf806e937ec.3137322e32332e3235332e313736.1bf52a.0000sendgmr@google.com>
 <CAKEwX=PFdgEbba+H3fEnJFDnfkxCTsvuHEb4numVwJRaiMgwKQ@mail.gmail.com>
 <179384102494.19062.12740032892044628762.b4-reply@b4> <auwOBaRtM9p_Wxfx@google.com>
 <18e529a5ab0738f7.3137322e32332e3235332e313736.873cb.0000sendgmr@google.com>
 <CAKEwX=OUt4=wqDLiPvYuiTnkpuZYnszkuNQScNR93hHhVPRRGA@mail.gmail.com>
 <CAO9r8zMMGem-LTJQseT5xSSBjfr3UX2gzG_ftpw6+KF8m9v5yw@mail.gmail.com> <CAO9r8zOY1E7gCYnJZAfKvyHcbj8e2WVuXMqsaPGPsKR4-9itsg@mail.gmail.com>
Message-ID: <18e53459a8013078.3137322e32332e3235332e313736.12c7b6.0000sendgmr@google.com>
Subject: Re: [RFC PATCH 0/2] mm: zsmalloc: make shrinker compaction budget-aware
From: Chris Wiseman <chriswiseman@google.com>
To: Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Xueyuan Chen <xueyuan.chen21@gmail.com>, 
	Xueyuan Chen <xueyuan.chen@vivo.com>, Barry Song <baohua@kernel.org>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 5, 2026 at 7:40 AM Yosry Ahmed <yosry@kernel.org> wrote:
>
> Never mind the compaction argument, this is just to move zsmalloc
> pages around, it doesn't help with internal fragmentation. -ENOCOFFEE.
>
> I still think we should check if the zsmalloc shrinker actually helps
> zswap or not tho!

I ran a quick test with zswap turned on to check.

Yosry is right - as long as new pages are swapping out, zswap naturally
refills the freed slots on its own.  Both runs ended up at the exact
same 95 MB pool size, and turning the zsmalloc shrinker off cut page
fault latency by 26% because reclaim isn't fighting itself for the same
locks.

The only time the shrinker actually saved memory in zswap (~20.8 MB) was
when I blocked new swap-outs completely after punching holes, since
zswap doesn't have a manual sysfs compact knob like zram.

ARM64 QEMU (Linux 7.3.0+, 4 vCPUs, zswap lz4):
                             Shrinker ON    Shrinker OFF
Active swap-out pool size:      95.9 MB         95.1 MB
Active swap-out p50 fault:     3,262 us        2,414 us  (-26%)
Idle pool (swap-out blocked):   44.2 MB         65.1 MB  (+20.8 MB)

Maybe we go with Nhat's idea (CONFIG_ZSMALLOC_SHRINKER defaulting to
ZSWAP_DEFAULT_ON) for now, and if zswap adds a proactive compact knob
later we can just kill the shrinker?
