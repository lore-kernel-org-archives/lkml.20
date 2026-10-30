Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355757;
	b=4mEDH4+P9pDqgcuMmjuQQ/CH35fGiWmRduLPxPOpusNTjD67AWsE0c4QP2Fi1Mk1r/d3
	 0uGYFiixOLG7OZZv/QF8OClCuGjGJu3qyd252vgg2fnr3m7LIiEkpfk+641MoFDX9ELG3
	 CGPpK5iskFPlOoR/LebviGmMR7RNMhDXGCB2vCZYlnot51U1ZnHtrKI1lSytbq1scCtEJ
	 pCj2qNgqh9vQVjrC5Exb3gBmsXl5YofEyv5tqMUlQFCZsuj1ZkqYL3i19R2iW2wu7SAli
	 fSg4OEplhxHmKBxjaBWtgMxp3lTlrb1L5OHKxDCkwBLR6zqk9z9aHwv9kOHYyDxBiNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gyUxqqV28AHDPJm2TnGuyjG0MyV1cy7PlWRsAeULnhc=;
	b=G4es39vsRq5vU338Veg2z5oRudM7V+oJAWtxrGPm31Lj36f0tRuVyywS78M2T7vPeFJl
	 Gf+0d5pdjQ+Z2vSQHDhY9GE1jmAaE4fCV3jz7A1OZTPquM264XLE9x6MrTd5OJz4Tsl2r
	 xe2F/XhEdt8mUzy0/7iYKPPcydLZ0WZHwmTf+iLNf/IkA5OA8zVOdhGLva3bvWBZoY0vj
	 +PXoyr2MYijewJsvpi91JSCV8s8bt8oUutOQx9qntUvprY3ni89EUihnJYmwBjvtogfdD
	 A9R8L15vrjxlypd/jl+MKAoTjop8CB7ZERY+YkgY1ILSGqbbu/Cox32bR3zJLP8O63A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYq4nzL0;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B887B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B887B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYq4nzL0
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3adc0ac3566so94116a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355756; x=1793960556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gyUxqqV28AHDPJm2TnGuyjG0MyV1cy7PlWRsAeULnhc=;
        b=zYq4nzL0/k76KI3Q8NYrWIMDK58WMNmyVXHk6uZFFryQo59Kep89IivA1R3zKYBlkQ
         NaWcbJ5tFY8CwLvan7JSPlQY52ux63ljdnCcZpmhHy15zIo0jfcT92/UQE3hrIXPntWi
         +W357g5N0GzkJOmpBfemuGEfkOg/OUUBFunnDb8OD6d2WhxLYQDSkoxJWb5UdtKUf4F5
         ETk5/i8GUDvik/M4u2cLk16Ceow+LSPqtOouGB6OLJrgzAUBZF8j97dlLk+VpKTK5Yk0
         l50uc3Ze3QxeOgscVwgmGvD69txMRxZLlOfXsJdgxu0bGzxaofU2dlRkXR1ekat/JvJ4
         jsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355756; x=1793960556;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyUxqqV28AHDPJm2TnGuyjG0MyV1cy7PlWRsAeULnhc=;
        b=UOfGyw2nwtbI5hByX4u5iilnSh7bMQ4un/XtrPWQBEaKtNjHuDGwSt+yJJu6LFjklF
         LRDndBhh0qL5DLQv/ww4s/72wVQOkf1P5RIBurc6IvhEe2Cn2aTLFHI8laIFKcp2ph5/
         ryD45MbZ+yzy0G5uWwORec4S4PTs6/MfrRQrpUxcum5JtTCt0L+NV5ttXmjji7i76fyu
         NJLrBzuWIlMKMH432ovhSHKuyc5Sc0oOYxDtpy8DItQEoZQ+t9YGHzmKsEmA4VQCywFp
         BIwE+KmdwMJdFuTIMydE5javKgRrXQQDSYxX0V1GN2hAZRJDrJeBG6Xh0kw2RJj84ZeW
         XW3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwSSc9OnZeEn87OygQEgoUbu2v2PSaD2gOqw2q5cUC96DR4ija19ZsIgeoFGIbl7FC9VmdtyIoc5OIF99g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPiBSfvZ4UbsRs18VaEjt+v9/u90nA89Mk2vy0CNWVzdzkyaKd
	UkkXeLzHy3cxibJxgPZctjoIIh1dAlVUAWQx4mQU4LVelIZXW0zmTgYo
X-Gm-Gg: AYBFou0qmpsjT3Gxg5jUfKQyheEKzyhpgs77myEqIGKrjZ/rMgVqfy2M4bPEi6lfGB7
	WoEhORG/QO+jubF8owJEd2LOtAK80EtAGmTAC+BP0OcIdV6K9BxihZ52pIJENGXzNz7GZeMekW8
	p71L+Z1xkI/NakhjVn9AsVjKn74qLZ9DVnneyPvaKl6VFMQTK0R9famaukipHH1RGwrZ+vQuxzp
	rAj42mCcyeCKAo4MZrMQqVNaSF4tFLkspu6m2zGW8EWkfQcWXP9EDcE2hga/bSg6cJP4bI9KcIQ
	3/3omTNezfPF3zfTsX5anw3T+cAN5mc02jatlBXSy+G+XW4ddZZcuero0kcIhI4BVxNlYTOi6rv
	aktVEmhD8DY/xAau9ZTGI1/FTB7Hu1zYBQDPzuKE4ZHPvHPUbEUp8oesqe3S2n3Q5ZAtlEWgtSi
	RFUfkho1DWs6OzhpQoCNMHaAqBMXnGqtsYh/mE1CQFmFDnuvmIBHHRXUw3FvjJXHvUs6s3+2cIj
	T6ZO6d5BmWG2AMOhSofKbr4ZuNTj6k/fTJMQkoJG/AflbolP74nCl6RxXur1Xu9Yg3u+K6paR4P
	RP5X2u8SI8+CDQbpBDDHklOE/8DWaO641i+xJS3NzVHdeYjImKjxGsFlig==
X-Received: by 2002:a17:90b:2246:b0:3a4:b8dd:1447 with SMTP id 98e67ed59e1d1-3ae8974bf64mr1558226a91.34.1793355755865;
        Fri, 30 Oct 2026 03:22:35 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845ae5b9sm3567615a91.12.2026.10.30.03.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:22:35 -0700 (PDT)
From: Qing Wang <wangqing7171@gmail.com>
To: peterz@infradead.org
Cc: bsegall@google.com,
	davichazbh@gmail.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	tim.c.chen@linux.intel.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	wangqing7171@gmail.com,
	yu.c.chen@intel.com
Subject: Re: [PATCH v4] sched/fair: Replace random newidle_balance with Bresenham accumulator
Date: Fri, 30 Oct 2026 18:22:26 +0800
Message-Id: <20261030102226.2501158-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030095630.GJ2668200@noisy.programming.kicks-ass.net>
References: <20261030095630.GJ2668200@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 at 17:56, Peter Zijlstra <peterz@infradead.org> wrote:
> Funnily enough, treating this as an independent variable and using a
> random number works and 'fixes' the slope change problems.

Hi Peter,

I explained this in the v3 thread: on a slope change, carrying
newidle_window_pos over from the previous window only shifts the
first allowed balance in the new-slope window (512 calls) earlier or
later; subsequent balances are still uniformly spaced. So the
initial value can be anything — it doesn't matter.

--
Best regards,
Qing
