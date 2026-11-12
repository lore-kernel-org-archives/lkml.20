Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481902;
	b=LV2yOI0N97MKP8PQNhfRxwFvYx/qe3FqCHPmXpZ8c6zywKGQBCxjfi0bI4NMU98e4bu8
	 Ge/4IJPImlcr4y1mLWOEvEhKfBlpHICFVfoY7+WEotpVCsGpsdvhJFQ9ew9/n8uybf1po
	 tc0JqxHEeTRr+N7NSGXWDJ4gQmZCATQyExqd75sukJ2zrB3+1ASJPd+tgUfnoN4d4mPtZ
	 GBXFi24QKlktxVf8QrXTcB1VMj9KMrSE8KqF8wgizj5eTh1DVV/YXATNMWvZuPiDuAoD7
	 e+iKwBx6pd0pu/Hvx4+39ElBiCQTWDsaAdTdoNaF8obTTC+T6aRT78j9Q2mRnCvzgRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f+jGuGb1qkK7jSM3drmVQfuryQok7tFfCPkS9qY3leo=;
	b=I5tCeQIJj06hq0Xo0ULY/8WmaE+ut7L1s+Mnk6G0gaouxF8QVfNKyaXWAf1gNXM8+Rm1
	 fH0D+o25zUgixlgsUyh5g7t+4wycdiXZIiKA+q5JvZ0IyPu/fY250jOJTX9vr+i3SGtfD
	 FRhp6jru+aj3BjiBw1bHI0jfnFaqgFxU3oJ0/ZDMD8S6HImN3bItVLXCvuzf7UJhWlVTC
	 QfoxtO67zVsVtfcC8Byj9r7mEtYR+KSHZUV3K6hDhMBiSyyVhQsD5abs6WkPmYuIYEwdh
	 I2vIy9jxbHC6m9ZKudYuCDUdzuYCsKQR0CZfzh4Hix139pN+oVXzXPn9vSztk0Xw9jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XO8Zx/M9";
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C938606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:11:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C938606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XO8Zx/M9
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b4a2688f96so1817307b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794481901; x=1795086701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+jGuGb1qkK7jSM3drmVQfuryQok7tFfCPkS9qY3leo=;
        b=XO8Zx/M9pgKkHWbWAsPy0iS5nA3/oaY/fdCIIx9lZQuF/3RsuRmqm6A+wxa6qZq1KQ
         OXvAnnjpRC6L3m41Mwn42Y2AuklJdosCTFt6pyvDFpLnx1fKvVo5odS/RT/5cu6PVV+y
         BfuqX07e5L87OH54/4nTytI7APytMn9CejB6Wh2LzvIH03q/fJbkHTCegepIC9wmQN3e
         kWFhSWDMnqicU0IEN2nCBOL46bMYRPRFqJIaInLX4qfOaiZm689RgMRTXyY1wInM6E9F
         rJgk4TqesyKIaBd8EAmaidEjaMce4dbffOAo0gyy6jV6II153N9bE2KsKILRzVDtuMgn
         dFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794481901; x=1795086701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+jGuGb1qkK7jSM3drmVQfuryQok7tFfCPkS9qY3leo=;
        b=XNTq5JPzFS/aORcmUDzbLQmNaoBdPiPpZfDcCneYzAWAQrZc98GbG4XuUINXVEcki5
         epqY7b3/wtnXrDTn8vBttFcC6eyTWqy1zbYRSCpAkjXj+pfe/YMnHBIYc1TU6cjM2QKp
         +hTrSGigrAZi3M4ZQFNRDuQkLqRqRSueT6i+izc1wfVunGRHzBVAoAo7cD+n7C7MaduP
         hq6SHAC7cSY3/iVPeoYJAhEacLcaZf6OwiwztRPlB2RQbb6JkLInkPKs4kvzRXeMQOn+
         1M5aqrheEQEtgLGyONqI1Mg+dFuCzeAlVkDMRUHppE7qP3d5QoP1xTdc0c5Y1uAuK303
         YGSQ==
X-Forwarded-Encrypted: i=1; AL+hErFFpuS+GRShgGESke2NPXWq6oBa3mx4cljKx5bqsILoWDab80HqzCbmxt5fTbAI+rpYXaNAaBTroCymPsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n1IgksXR7/m/+bn1fyelyO/WUDbpNGyKAyaAYeBuP6x+nN0DT
	NirukDccgzQalBLyKDpcRTXPqReKwhjnpmeckT4niUsRtROdME5z1aq2
X-Gm-Gg: AYBFou2YvbUd8imoxmckn5XgVXvrCQ4aPsY29zhUfJXjQ+XFCAA1jUndxFm5Kdmj7gv
	f3YuztYwSDwiRgN82R2r9otV5VgwvMpALxG4rt1R4Gg7GgExujZg0FiwgiYDSvdoWoV3dvXSOh3
	flH/MBAr/ayq6S3/ouCw0ILGk9qrhvxNpnT1RoDEAJCmdcCPNBm47fugd1GpLh6pQYd4D1ASe58
	rsKtYr+pAN9SIS+DGgNaECUkUDijbEfbQbvqy7WzFnAXzU+VhUsQUpIaHjvWJdq8rB+CMMxyKVV
	iOoeifuSN91aFY6JTrR6caQyH0tQatt6k0NiitNWWe8i8z1Ubvn2apQTITor5yNUSl6cGTf7Orj
	JHlHTLijn/q0QcuAfRgSJVLYy97JHrCRze9ZEaq3xApOA+44DESwBBPr6expPvjVyYIYAhDHwVA
	ONfz1/hyf6HG69dsub5MgpNijNOmMRptqIAjx5YFO9uYNLWHGyrYce+tg1hUuSYCLMvDcIpICZK
	yEFvGmfICILEMwl2RVlKYWI6ZbhKY3u3pyL+sXRdYiVLIO8XoYLsy82SZumO1LlOm3pv/VjQRbw
	q4FNlrvj6u/OuGL2af26I4YgJc7yIGkcRoDCEIM0EAYGuINFDaXNkIn6EijVC7n2eJr3n1DlQH4
	gDV6BMBP/jJeuj4cTY/JWbNnh0BAUbFY=
X-Received: by 2002:a05:690c:c10d:b0:8b3:4022:d81b with SMTP id 00721157ae682-8b3a7d8e436mr35968017b3.4.1794481901382;
        Thu, 12 Nov 2026 03:11:41 -0800 (PST)
Received: from fedora ([187.120.157.132])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933d1047sm66813717b3.19.2026.11.12.03.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:11:41 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: hdanton@sina.com
Cc: bvanassche@acm.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nbd@other.debian.org,
	syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com,
	trintaeoitogc@gmail.com
Subject: Re: [PATCH] nbd: fix circular lock dependency
Date: Thu, 12 Nov 2026 08:11:28 -0300
Message-ID: <20261112111128.261395-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261112001319.463-1-hdanton@sina.com>
References: <20261112001319.463-1-hdanton@sina.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hillf Danton <hdanton@sina.com> wrote:
> FYI reclassifying sockets is also corrupting memory [11], so can you fix
> the corrupter before reclassifying again?
> 
> [11] Subject: [syzbot] BUG: spinlock already unlocked in corrupted
> https://lore.kernel.org/lkml/6aec63fd.5f5735a5.290c1c.0003.GAE@google.com/
Important thing to do.

I'm not a nbd/net specialist, I only get the "fix possible circular dependency"
bug to resolve because this appears in mm subsystem syzbot.
But, I read this bug and see that is a race condition between inet_shutdown()
and sock_allow_reclassification().

How IA analysis say:
"""
- Thread 1 (runner/shutdown) calls inet_shutdown() -> release_sock(sk). Inside
 release_sock(), Thread 1 acquires spin_lock_bh(&sk->sk_lock.slock).

- Thread 2 (reclassifier) enters nbd_add_socket() ->
 nbd_reclassify_socket(sock). Right before Thread 1 acquired the lock,
 sock_allow_reclassification(sk) returned true. Thread 2 calls
 sock_lock_init_class_and_name(), which invokes
 spin_lock_init(&sk->sk_lock.slock) while Thread 1 is holding slock.

- spin_lock_init() zeroes the spinlock and marks it unlocked
 (SPINLOCK_OWNER_INIT).

- Thread 1 finishes processing in release_sock() and calls
 spin_unlock_bh(&sk->sk_lock.slock).
 ... 
"""

What lead me think that when Thread 1 try acquire lock this would must be
blocked to acquire this lock, so a spin_lock(&sk->sk_lock.slock) inside
nbd_reclassify_socker right bellow sock_allow_reclassification(sk) fix this
bug?

```
static void nbd_reclassify_socket(struct socket *sock)
{
	struct sock *sk = sock->sk;

	if (!sock_allow_reclassification(sk))
		return;

	spin_lock(&sk->sk_lock.slock);

    ...
```

thanks,
guilherme
