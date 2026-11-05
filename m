Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866388;
	b=e0YfYHkjqVQC/UBRQCjWblnV51/NoyXt1oXH495zc45x3DFXwTm9EVKK87et2lWxTu9l
	 n1p015rM78OqjeUtLFT6/91Vzqq8i4v9nFhXtgaNQxoRdQhYtqt2wEWfSc7uJuHCqTPiM
	 36+IDekIaExQmwXSm5/PzSxt/nKbUwe0dAuNta8BMrISFnhpHTe/4EwQhfFetvYW24Fgc
	 OyQCxY/QONgW6n6zFVFBvf3ZU2Ldp5siAKSDkbvENLj4sY8FyUUS7jmdAeLzcWKLn/uJa
	 24xdgy91lbuqxd5QIMO74KAfdRcIE7/SRHdP5TU04nt0B4hxOMmwhZFpxtFUUjS2Vzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9dHqEQDspEWpNSsGAH3iVlCCP1/Qrk4vRtH/AtYlCt0=;
	b=WekxBkPnn7Ga/glDAbHMrmymNPte5yZC2wK5Pr6MKW8wHRdeROExq/j/9pAY1nA0TIb+
	 f2Go2Uw5vcBxM2f9T6ucWkQt9wPL98IFsccUuAK97kE/LB7Y7jVVxKGE+q21vsHKRQoTV
	 k7ChDu/6kK3ZKnfjy5as6ASk9j22Fkr5nF2D3q6RJ6NeZNMP32IUnA2RGnLZoCd9SNclG
	 0rvJ/gONKuFFiUXNFfFu0576Pc1yvPqC1dxj+1f7GBkkzroFkn4vNKLd4tep3akyLBtFM
	 I+Qgw0WAGG2lT4dCGcz9eM43cSromFOA6NBwHYK5Gb9/SEPvCV9IV7hnJ7oqMkOB6mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gszowiG2;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3C6606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED3C6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gszowiG2
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e09aa5264so794069f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793866386; x=1794471186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9dHqEQDspEWpNSsGAH3iVlCCP1/Qrk4vRtH/AtYlCt0=;
        b=gszowiG2ccQVtUg1EsYV87agHiRL09NHFwH6O/IOTo3qFvWgpHNPasdcYKX81gAJrH
         7HXtUnEC6c47sLD2gMa2wUNO0I+U0YyWbIUPQjOAiakkPBDpupTR2VqjfAqgiGTkC6aC
         RLVQXRHKUz37McSjaCsqhHlr6qnYE16VSE5kX540qPAjiPjm0W4zvSTqZ3d3q47j5qrd
         qGuX5My9myNkSTPYJI1O+T2uGDg1rN5Pxf7nfcbnHMCEG8RBjr3MVYQwTx5t9wSRX6qv
         4yvglYXy38lMf22Ua0id4PivbWTUrdmVSyJb/Mjx0wNfF046lRBGgVCgyk5Cls5Y+H9t
         t8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793866386; x=1794471186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9dHqEQDspEWpNSsGAH3iVlCCP1/Qrk4vRtH/AtYlCt0=;
        b=mhvO5pOUlvOJ6QetXyVL0b4GZOmQucTEY1lsnqhUqmnwv67RqypuPEf0vwST8nu7Uq
         MpOshP7a6711823bKRot+6hAmFWyuSc3DjQjFYKKOtUTugEGU64zjf9iDd6csWjDLbg0
         7djDi6BFBFBWQ4zyDGTkXuphF4prMdaXnjNbfXOWtkmbSDWFOYpBVwMn3NWt6IIjX1Qa
         n/55NjxruIYW4s8AblJAeVD6VS7DdT8Jau/MkpTJ8+B2dTYTb1OMmGYkWbf85X0aFpbm
         Vqf3U+Q0kk3oHVfHHvsWH0LA0KzLkwEAvZsSL6WstpSFj7uQL9fLeUMCYLvKhNcqTVwu
         Es/w==
X-Forwarded-Encrypted: i=1; AKwUvBwXQqhlSnYbG3PU8So/ww7d+uKDENEn9+5no7EgiWlO0/6nqSSovQa3GjufTFhvjcfaPhIPZsHOnvjxTRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BkRI34chdU90IDgSZbXWNiS+iiBQzzLCFkY7S+VchAncsCax2
	V/2M/7HuI80yjo34Hy16J3NMUEDyo8+Q1aLIC0/WTXDPEa3FDFMc9DDf
X-Gm-Gg: AYBFou0iSEaGQUe+oOpS5W2szgV8jyzojJYVjdHNJh4V4hWVvxtGEyfYjkSeJ4D7kFY
	lsPns70vsaIPVeVaqQg5610tk9jgZXPcsuQTwRTZi9DIXtWfOK7QMxH4Rw60JnyuDjLU61a75nz
	GI+GhbVIsobIh/d8G1qEFuLX9/VMtl+fkZfK7ZA4vz7PA/lIVjCzSFTFj2MvsorFThI1JBilwZl
	gmb4uGNtVOh+N/qdMJhdSMIo6yUzZA1eubGGSNVYZN9FEucHCZpv/FRlt4hZA5nt/8J3KvATv1p
	7G0K/cGZIywjdU4wbSH6Bk3yB7hA+gJm7UTEFQnEPePNEN+/d4iOZUKEBgb/EulyngOq8WInp4z
	ivznutV+PRO/ent0oiihH5fhbTzmUsP+ZeXDZkkiGAxazpQj/1k8dcymY/qF+BvpRf9T4yEXU3/
	73kfuvfRbdmBRrdsKyB4mIpIr9ctxTC2MZeoJoCYIN82ggLjFreyWJ2j6bn4qRhoK+aEPKud2Ss
	FMOvU/Caef1So0FF44jlRp8yeQlaRLSNCmgy6VsFezjyqn1YKIMSdkOJgZtNwA2n82d2vDIitqu
	20A+Fkwr8Mr90js+V3k=
X-Received: by 2002:a05:600c:4e50:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4ac16fa3523mr419543105e9.5.1793866386076;
        Thu, 05 Nov 2026 00:13:06 -0800 (PST)
Received: from fedora ([2.35.201.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca22f4sm79093385e9.13.2026.11.05.00.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:13:05 -0800 (PST)
From: Francesco Nigro <nigro.fra@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Mike Galbraith <efault@gmx.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [REPORT] sched: ITMT + DELAY_DEQUEUE: woken task waits ~1 ms behind another task on the preferred CPU while allowed CPUs are idle
Date: Thu,  5 Nov 2026 09:12:45 +0100
Message-ID: <20261105081245.81773-1-nigro.fra@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <5af4860d-096a-4e9d-a3b3-0b8277924146@amd.com>
References: <20261103154603.1893325-1-nigro.fra@gmail.com> <5af4860d-096a-4e9d-a3b3-0b8277924146@amd.com>
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

On Thu, 2026-11-05 at 09:41 +0530, K Prateek Nayak wrote:
> Hello Francesco,

Hi Prateek,

thanks a lot for looking into this, and for the patch.

This is a corporate machine, so I can't promise I will be able to boot
a patched kernel on it, but I will try.

> Since you say ITMT disabled actually solves this issue, I suspect there is a
> race between the idle balancer moving the delayed task to a preferred CPU vs
> a wakeup that also lands on the same CPU.

perf sched shows a race like that, but the task moved is the running
one, by active balance. One example (perf sched timehist, trimmed; ms):

    .654334  [6]  worker 482   awakened: migration/7
    .654337  [6]  worker 482   blocks
    .654338  [7]  worker 481   preempted while running
    .654341  [7]  migration/7  migrated: worker 481 cpu 7 => 6
    .654341  [2]  waker        awakened: worker 482
    .655572  [6]  worker 482   ran 1.006 after 0.224 sch delay

Does your change cover the active balance path too?

> So at this point, I would have expected B to have already been
> moved by a newidle / idle balance.

Not here: in 270 of 286 waits of 0.5 ms or more, neither worker left
CPU 6, and CPUs 4, 5 and 7 were idle for at least 98 % of the wait.

Trace summary and excerpt:
https://github.com/franz1981/itmt-delay-dequeue-repro/tree/827b6b2

Thanks,
Franz
