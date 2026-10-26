Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792991777;
	b=Pda03zWQ6fHC7xoHP2qPEVr8RlXfKwBXkSEf9duO304II7Gup5fme/q2g85W11YTEFxY
	 TVITPDsbEOusntWUnTcJrNw4auSgsv9q+1DR3kUq08IIF6/VBWmTbZW8W6jr4YjNbY2Si
	 MFBMPJXRyW0a0gnvhqDoMxHxY6YuAy6Jeb+MMQret9kWNreAKAy1llQvQ/V/hs7+x2y4x
	 JZEKv7avJuEGpA2qjqSHIuY7ycjyY6dwWE2U1mMF6EeFyIY9EZyjTzRhQYlP4EPu0nzpe
	 ggy6RBgH7Rzvkf09Pdt5wDvlHjHNedCsu+pjuXXSeiGBv5dcHxWhepDSzWAdO6NQTng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=qL8IK15iDdJ6e87UHDu6WjOG2/RB6yOrdImyR+qVQVg=;
	b=bIoVxNQ676U5DbPuntIVf0c60mozpvupOOv4EO3cUvr6mpbzMyYqhUbjuo6At+LJYszg
	 My2qosAi2ogu/8ff5YVgEc1YjLBlppLCFKsZ9EO9zYSYE4oncog0MR8JBCCKP+GV0ZTYX
	 lHDbjmdAg9Du/gdOwbWBvfsyIUBd4jPD8bEBImpPgXkqdTJ2Y3kgVaTuLTZD4qsnwgjlY
	 Bjqpz2phA2G/13F59GbtyZIvLTcchP0fzL3QVQv+ih3/M4iONjE/cx2sJ+oYkkmw8LkHi
	 CoaMi6bxuD2+/jcXGpmX6QeR+JnTY3lepJ+kdLLBSGRmjwZOAVVNbUdlgDignc1QFog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jEEDZLv+;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A6E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A6E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jEEDZLv+
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so653574a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792991776; x=1793596576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qL8IK15iDdJ6e87UHDu6WjOG2/RB6yOrdImyR+qVQVg=;
        b=jEEDZLv+0m998ZvepBb9s9pGYLTg40stcVxE9Gh/JU749eoMUJXikQzewGKE3AXu3s
         Vzi8oe7Nh81zDSyBeSjYF/B4qISNeiZTRWXXzEdlaOP+G/3nn6Q47tX289dmg93MBkyL
         sm2X0e2zl2o4hbMIQXfenuzKxqgJ6d26wiP0werb0QWUWMmt+37QUmTakqIFVPwG60W3
         qP/djV9UmtjaDn2q2IIYyrJM3NeDJTL9KyJPWS9gAF7geI5y8R9LtnIYJI+zOA5eyY7l
         JGsBarCwM6/Z6JQ2PG9r8nPZJ1jzOkApY9G27ToiUywClVrO7KpiyxKj2HDQ2za4EFy9
         jleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792991776; x=1793596576;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qL8IK15iDdJ6e87UHDu6WjOG2/RB6yOrdImyR+qVQVg=;
        b=XAvxY8W1X235s69E+tV8nE50M75iNL7XFQR36Mcm/XR0X+NuhaoF0IRo53ye6h37ht
         g++R5VGYr41cLpuYHHS3oZtm07h+vVs5vrohSy2cct0uHUMhIUUPUxacWkBGr0+KymBD
         N8pi2QYnQH6t53XzGjZO46x7tezvk1bx8od/9rNXY/KWRNKuKMwW/27FaFkajQkHYQpw
         0v7z6BtbBeOTgz4qr89MKxI3CSASRMXpl4jv8NH8e9nCbig/aRyrXMouu+MIPJIjOW0D
         cdHAOkBuvqVqGvg9Tr1vKB7Lvorg8Uz7UwTGdBnMoFR3l+tqpsyKKNy9IPaYqsww1lbD
         /p2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMQwPKLdYkBh6BmRp/coK3XcGZFoYfDKtU3BuRkz+0EHcb8FKYfrcXgeilxCZyr8z+MZb1HNJ4ljwRPRw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF0oB99IQ4pIggMoR7Xl2hV/9dnwtq98EGtDtqOkS8066mxff6
	5qZgmx4zalA4og6NFlzng9vEUCpKElKw22yN7BxbS8XwSEJsX2ko4sBo
X-Gm-Gg: AYBFou3fsILrNEjzsPb2IU4G1WRmO0f9q1KFdY/WerhGwpKlfctAGA4zTbbLIB7gX4x
	ZzPTRjgTXLaanJiW3b59Yi0t69sEQghf0x/iRRJ7mXZAqoJN11HIij09YH2K7L5fQFiE/BYWVaZ
	F0As+6qfXdupVydjjWLgeQHU95g5Nd/kFOM1UwGtFvwjMqwqpONOEc5SzTVPP59MwIQehLSMRAC
	nKQdjSdkEtxsi7pptMMSTw3294rckoJ5c6lGrqQiUVW4NXrOyQgAdGrCihO62t7sSe+ehIonrmR
	2P998WSNAbFl1oVjE9cX50rO38iua8/fVYNYkEf+lGWxnD5/+CiVRDjAc21ykX1oSpD+Xq3mtmk
	6O7TFcy43gIlAi8xQ2KIKR0ROXAf/Js5fmBIKjSLaLaCOuS3QgLPpEuZhgKNFngTVIxqelFewpW
	cAVikR/Mt2latQmBl28Pp9kzXWnN5NcPxWaMTPP+Ray8Al35PAbUrP0KSp2kDO1cw5JV+tLzcWC
	72uITUa8EpdHNkzvc4bHuvXUklButQqAM5iMZig0etzOLVSjAdHR84ZXs+70fBMaXU1LDzSUWPI
	5gXbxNGmgShL0ULI8mhFpj3S0FHkW9bihMGhjI5yCCXiig==
X-Received: by 2002:a17:90b:57cd:b0:3a7:a6bc:9d58 with SMTP id 98e67ed59e1d1-3adeb0f1869mr4566926a91.54.1792991776467;
        Sun, 25 Oct 2026 22:16:16 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm6881508a91.12.2026.10.25.22.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:16:16 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: jstultz@google.com
Cc: peterz@infradead.org,
	hannes@cmpxchg.org,
	surenb@google.com,
	mingo@redhat.com,
	kprateek.nayak@amd.com,
	arighi@nvidia.com,
	stevensd@google.com,
	tglx@linutronix.de,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	suleiman@google.com,
	Metin.Kaya@arm.com,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	zezeozue@google.com,
	longman@redhat.com,
	boqun.feng@gmail.com,
	paulmck@kernel.org,
	joelagnelf@nvidia.com,
	qyousef@layalina.io,
	xuewen.yan94@gmail.com,
	kuyo.chang@mediatek.com,
	hupu.gm@gmail.com,
	soolaugust@gmail.com,
	sh_def@163.com,
	sh@gentwo.org,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com,
	Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: Re: [PATCH v33 1/7] sched/psi: Preserve sleep-persistent PSI flags on off-CPU sleeping dequeues
Date: Mon, 26 Oct 2026 13:16:05 +0800
Message-ID: <20261026051605.1997313-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023220431.1106611-2-jstultz@google.com>
References: <20261023220431.1106611-2-jstultz@google.com>
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
Content-Transfer-Encoding: 8bit

Hi John,

On Fri, Oct 23, 2026 at 10:04:12PM +0000, John Stultz wrote:
> +		if (p->in_memstall)
> +			clear |= TSK_MEMSTALL_RUNNING;
> +		if (p->in_iowait)
> +			set |= TSK_IOWAIT;
> +
> +		psi_task_change(p, clear, set);

In this case psi_task_switch() also clears wake_clock when the task going
to sleep is the psi_avgs_work() worker, so the worker doesn't re-arm its
own work.  psi_task_change() always passes wake_clock=true, so that check
is lost here.

The worker can get here: psi_avgs_work() takes group->avgs_lock, which
psi_show(), psi_trigger_create() and psi_trigger_destroy() can hold while
sleeping, so it can block on a sleeping owner and be dequeued through
this branch.  TSK_ONCPU is already clear by then, since find_proxy_task()
doesn't park a chain that contains curr.

The cost is an extra aggregation period, not the ping-pong described in
psi_task_switch(), but it keeps the averaging clock from shutting off
while idle.  Should this branch do the same PF_WQ_WORKER check?

Thanks,
Zhan Xusheng
