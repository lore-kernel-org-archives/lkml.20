Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318064B04B1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559224; cv=none; b=Uj+bZ/w8paraCM7/dELgkVv1sph10ec+oCYkbJ5BlGhkiaFf+QaKfzlQ9LkslxIsXowCaNSMwC8I+bklNr+EkbpRO3BnBFLEAitK3HS3TW+Uin10D5pnvwKfSEyzYjGxGwYkjYbWBB/3mt2bv7WwLipwQ5mUR2o67a4ozJWU+38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559224; c=relaxed/simple;
	bh=41/H3+wV+C3ujyoz9pIl1FvptpMMe2jRK1WK+9Zs6CU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mt8/zQhG58sNlUfB9aEX4JUx6pCni6O1zA6jfUkdDMrl6kcdG0APOSJQBAsGvtICYVCquKKlzdJgA+wrv1SxX/HxFjhOMbB+NBH5SQcYQMAj7w56B2JhvmZWBrrbhnau7YyGuXcroAid41V/THynTPmPsvLxwCayP2L1K6FIeUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLzZqs6t; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLzZqs6t"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fbb1e1cabso360055e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789559213; x=1790164013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbkqAaL5SGcaxI6pARTdx7iSpDgbeB9gXVgD+3Jn6FQ=;
        b=OLzZqs6tsqcFeJChFXqBt33mFcrUQadko/AR+6SrEGPJmXRbSZtteGBX8BLw3u9FvH
         Pkaixygcbr569PD8aqZZjF2kNLVaSDS5Xv1ysjYO/9YMPu/Ye5Zr5i6i5GnzRiIrJYOY
         74quZqzqPN1h6Rfdj8x6C4I+p4gmWIkvTOeDVr4ycTmpSwhAr227Bs+eTLfwwkdUEvTV
         LRV5/ZAD+MkoRIVf6oNLuAtkQPf3I9+DGX3WIJMZG8BTvPpn03iy1z2mcFMzJLcT+cWL
         HgFyeRoJyzP9vG0be+xN4P7uNC5oI8KXgiejFOLrGPbN1McWGuV5MuRqN+ZKerHud8cc
         YeCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789559213; x=1790164013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbkqAaL5SGcaxI6pARTdx7iSpDgbeB9gXVgD+3Jn6FQ=;
        b=CTXbWTZVI5AdzYUyl2FN7aYtuxY1X/mUKBQCb/9+si7oCVOV4bq3n0KxKZn0aRLUaS
         ejRNIK2+ZUXAFjvXQRojaDHAVCUop4otm/BSz41QIZHcZVsm885MiYjaHP5RMRkP2l66
         KYFzDS4arVarlVl+bk/9RcROMit+thOs9Q6TsKonnP3ohIWGIVXh9yFI67vaskQRO7SC
         1J+/h1urG+V8jbPRLzm4O6DljyXbG0QVwsuwSAheMAp4Q5UtorGrI/gpZ+0r6omgTBLc
         Qwc8pynnc6JRVoPjDf3+cjamdWpPMkmm42TDnqzjwMFfoQ40udKrzolu8T/JqaZOXAiy
         jwfg==
X-Forwarded-Encrypted: i=1; AKwUvBw3ipuCqgnuk7z8rDS8Dg7Wm0MntDUN7Whp7NNXGkUufzhEbeDGPEc7gwljx23IWHllMFosmWIdDagn2vc=@vger.kernel.org
X-Gm-Message-State: AFuF++nJQ4yebyrwJHHIbrkx6UVt/KxJ1UAYwA+7llWxYEUH5h+CuS2a
	S3q1JBYHeiy384T9ajZFIQWzx38ezqiylJgdsI4eRD4PivbZhK9sMziy
X-Gm-Gg: AYBFou0+3nbpFujMZUNm7nhR+BUu6mbDlYPGyFW/dqp1Jt+p3zzxmY21/n2MVsb5zG8
	3W0xsyVUWWTULNjaMlVvnZeH5kzuxKImZKmnzqeAJXs0fwPxh0eD00syysG4DgY+7bIJV/KhXN+
	WASBW8g2+yMJq/23tnJNYSzwLKUnvXUv5QngovsGH5teG6nZig1fiIZbw03dUuyrZZ/5wIS+CSw
	xOlUs8I6wgE2PhcE/ry/VOWHZ7n1knGzfevzjQ1E3SyP6R92B3ftvtfNO6CZtLrilYGMw7pjt74
	4DGpDzXTQfvDrHuHhu1aRwB+li3jUQuxk+jSpVZQszjdv/E62l0ENIan4VeGIFvU4xZcVWdKSRN
	bJE81NeiVKE9sa5jwfBZn4LSq0ouAg5Wu7Ln9KLDw9nlGHMRRZ7xKpz4BcsbesUPleQ+Mo6y6m0
	ibeba9IjuuYFu/Rnl1FWLQG026YnN5a6ThE5D03mHbB1/l6z6P9OhpcOizGmzFHJ9LeUYTnLUbo
	T6QTaWm2X7IGxH9IV9IYw==
X-Received: by 2002:a05:600c:4e0a:b0:49e:479b:c13b with SMTP id 5b1f17b1804b1-49eb732056fmr20743095e9.1.1789559212997;
        Wed, 16 Sep 2026 04:46:52 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847f176asm44406885e9.3.2026.09.16.04.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:46:52 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: christian.loehle@arm.com
Cc: beata.michalska@arm.com,
	cl@gentwo.org,
	daniel.lezcano@kernel.org,
	dietmar.eggemann@arm.com,
	elif.topuz@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	rafael@kernel.org,
	rostedt@goodmis.org,
	sh@gentwo.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH 2/2] sched/fair: Randomize equally shallow slow-path candidates
Date: Wed, 16 Sep 2026 14:46:49 +0300
Message-ID: <20260916114650.2627-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ea2c4680-ccee-4ad5-978c-95dade454091@arm.com>
References: <ea2c4680-ccee-4ad5-978c-95dade454091@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > Hello Christian :>
> > 
> >> Picking the first eligible idle CPU leaves a scan-order bias. Concurrent
> >> slow-path selectors can choose the same CPU before either task is enqueued.
> > 
> >> Use reservoir sampling in the tie branch, resetting the candidate count
> >> when a lower advertised exit latency is found. Use the per-CPU scheduler
> >> PRNG and reciprocal_scale() to avoid variable division or a second scan.
> > 
> >> This reduces deterministic convergence without reserving the chosen CPU.
> > 
> > OK. 
> > 
> > But, your test platform was 160 Cores too. I don't think randomization has the same effect on lower
> > CPU systems.
> > 
> > Let's create a scenario:
> > 
> > On a 80 Core System, that %50 of it's CPU's are idle the randomization's chance of choosing the same CPU
> > is low. Since there are 40 CPU's to choose from.
> > 
> > But on a 8 Core System in the same idle conditions, randomization's chance of choosing the same CPU
> > is really higher. Since there are only 4 CPU's to choose from.
> > 
> > I think this solution works better on higher CPU counted systems. 

> Yes, this mostly works for higher CPU count domains, but the
> issue I'm trying to fix basically doesn't exist in the 8 CPU domain
> in the first place (first of all fewer chances of having simultaneous
> slow paths running that can race and also the slow path is much faster,
> i.e. the race window much smaller).

> > 
> > And I don't think it fully removes the issue. Just better than the original tho.
> > Thinks can still go bad on this one too, just harder.

> Fully removing the issue would require some synchronisation which the
> numbers (which admittedly are pretty modest already) just don't justify.

> > 
> > Maybe we could add a fallback. Because the real concern is the selected CPU's state
> > changes when we come to enqueue. If possible tho, I did not really test anything.

> And then do what? rescan?
> I don't think increasing the slow path is justified at all, when this relatively
> straightforward randomization already significantly reduces the chance
> for the 'pathological' test platform.

Fair. 

My real concern is that randomization is not predictable while the other solutions are.
I don't really care about their speed when it comes to that.

That's just a concern tho. I think this version is better than just placing the task
to the CPU anyways. (in terms of approach)

