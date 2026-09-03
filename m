Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991E34F7988
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458504; cv=none; b=YSDF1cKD+k6aPPhpWI8cGVN1MTntQDv5tAVu0g30A3VSkCaHJYRh2YymQVdhSUqRgyUIj+ja8GZBoYavuSvrAYML2sX7Lly4/M/ZZ55jOEIqUlAkJM/9UJIbjLfb4M1QNyMX9co0Oows8tyvp1d6lMfJCk23UF2nv94SAyd9ilE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458504; c=relaxed/simple;
	bh=c9h8sTgQRIIMSv/aHlWA8Z3GOaXQdFc0sgBc/6SZt4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q8IPb6GxompLH2G9GQC2Ab5oU6fLtyHAdFyeysWXn6g80K8eYGeFbYYwolb9O2J44PdBWDqy240OLW9plIIbjj/zu14ydP+giXVfCx7L2I54ofziO9fx5vYy+MGkSZa2cC/TY3aZPc/d4rQwDTDFOdUb9uwndhiHdcvgJ3BHvrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPKRVHPD; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPKRVHPD"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84864086bfeso79224b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788458502; x=1789063302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjazdtGuj7thY8vVrVUeII/vHI3KkN+Fj8pG30w25iU=;
        b=NPKRVHPDvYym000DYQUBcdl8xxX7rA/Nkp5WkmOW91Z55U68Fy+Y0AaXm3fmCSlgrR
         W6A3LItszAkYhFz5f4yGS6thqzV9geJAGi6Yw72AC8G0it8PN+NgQcTrEusaTWnAIe4c
         2BSqcW9cAb1nhzZPTuxOGWdFiMbDycezhAoYj6J2bfB4qSzbkwhk5DrTzbPcNF5vtX0P
         EczxuoajNdvm9Xs7BAy8tH1MQ2hnKZiZ1DxM2AhqsCQxsKUBkxqENDEFVfSbkufR7e8s
         WwlKaov4MhknSBy1P2xn/cyTxduALd5+U4VbwUPi3OAbo7Dz7hTAnyEKeuJHu0foUiNh
         +g9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788458502; x=1789063302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjazdtGuj7thY8vVrVUeII/vHI3KkN+Fj8pG30w25iU=;
        b=BLgYcGJGPFmqYdQbPbDibMn6mZGim99M9J8u0XYE4YllQvNG81lK8cXPj0DTpeoRO3
         XqiKP9Re2bZ3u9Gl/cwYsSDBKhw14Llq/IQZDOnAvSjNQIHzv5QIzj9PjIwdjm8iY0E2
         FwoZfHdkHPSFouBs/KxVWzK2o1KBSLLE1/uxnfEcbR7H2dY0n/i2kEu+n1QdMO36KQSF
         ItkxMZ/uVBCUMNRCRUi5z7BSMRBWjqSFQiCtq1Tm+6sZdNophSA0xBvfT20Mvn8YGXB+
         4Q3S7oyme48GI00nZjHosUb0Tvhw7Pr6PjaRNfgLUMKB6QEBh/OBOwkCul99hSOplb4g
         ivIw==
X-Forwarded-Encrypted: i=1; AKwUvBxjkriOQ73ycGwGocxAZ1UqyfOfltGZ9hjyFctol74ct4wDgSo8IFiMgK9JleArqBIVmSRTiSpCeWjDXKY=@vger.kernel.org
X-Gm-Message-State: AFuF++lFRg0V3Fc8dRtBnXpp4IBeisIHDO5DQdMl3bLlhB9MKVPrNA9j
	uHNR4yGnBmhsm7Tu939cOaxKqEy6wLdtE3tU4Gf0zJkZ8ScT1xHmyNc=
X-Gm-Gg: AYBFou3LGf8finoWrGNd/wUuW/02kZh/ZrKSDdfG4yx6w+9Chpm4gZvydlheyKNnsP/
	P0c58DaftfmHj/xSyJI359nuq+audlGvsIemqxyY+YKFtVlEMDspjMdyk7euJEAKdJuUb6bAtE3
	OjajsVoT14F1zkxSdssAit0c2oE7EOPhVyYkp+a8i556yvw8UPwae/P3viT26IN930wjxJ+DmMU
	dHiECkD1vXqdSDZCkreGh8Hc1egtEbfxZqv7bjKLvmr3BFcI7yl0ESL9goNc7eIbG0dNLLpR7Ph
	/c4g1ezKZiT28zJkyzSada8F5PWuOvVRwjRYKl0C1SB2QrpyGTcVyIMUSeq8yHs6MhLB4rikU8V
	M0wTO5L6+/31Wmsf4e+pfY+6/5mdQmBPAL+uNYuiX5VhSVxWZuWZhJfGQe067g/54JXy2K5iu/y
	y5nO5arrM+HWrrrmBN0spWDtDnoBsaz+AJh6xFw5Aj4hUcaqdwyOgyLiVIEE1VleBkwBcygk8Fx
	Bx3tmYPAufMzgtf6tIMUsXnv6g=
X-Received: by 2002:a05:6a00:1950:b0:85c:3922:25d5 with SMTP id d2e1a72fcca58-8616aa68194mr968000b3a.21.1788458501589;
        Thu, 03 Sep 2026 11:01:41 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152d29654sm248926b3a.33.2026.09.03.11.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 11:01:40 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: phasta@kernel.org,
	christian.koenig@amd.com,
	tursulin@ursulin.net,
	matthew.brost@intel.com,
	dakr@kernel.org
Cc: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	mdaenzer@redhat.com,
	alessio.belle@imgtec.com,
	luigi.santivetti@imgtec.com
Subject: Re: [PATCH v3 1/2] drm/sched: fix use-after-free of the fence timeline name
Date: Fri,  4 Sep 2026 03:01:34 +0900
Message-ID: <20260903180134.950043-1-malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <611c2624e60ea422229e666480da3e504d126682.camel@mailbox.org>
References: <20260902144204.1843670-2-malhyuk97@gmail.com> <611c2624e60ea422229e666480da3e504d126682.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks a lot for the thorough review, and for pulling in the pvr folks.

First, the important one. You flagged the ops-detach as dangerous, and after
your and the bot's pointers I agree it is not viable as-is:

 - amdgpu dereferences the helper unconditionally, e.g.
   amdgpu_cs_p2_dependencies() and amdgpu_ctx_fence_time() do
   to_drm_sched_fence(fence) and then touch ->scheduled without a NULL check.
   Once the finished fence detaches its ops on signalling, to_drm_sched_fence()
   returns NULL for it, so this is a deterministic NULL deref an unprivileged
   process can reach by submitting and then referencing completed jobs. That is
   the bot's [Critical], and it checks out.
 - pvr is worse in the way you described: pvr_queue_fence_is_native() uses the
   ops pointer as an *identity* test, so detaching ops makes it race between
   "native" and "foreign" for one and the same fence.

So detaching the ops breaks the "identify a drm_sched_fence by its ops"
contract that these drivers rely on, and papering over it would mean auditing
every to_drm_sched_fence() caller. I don't think that is the right trade for a
fix we want to backport.

Christian's point that the finished/scheduled .release callbacks are
"unproblematic for the problem at hand" matches this: the release callbacks do
not need to be removed to fix the timeline-name UAF, so keeping them (and thus
the ops attached, and to_drm_sched_fence() working) is fine.

Given that, I'd like to fall back to the minimal caching fix and drop the
ops/refcount rework entirely:

 - get_timeline_name() caches the name in drm_sched_fence_init() and returns
   the cached value, so it never dereferences ->sched. Everything else - both
   .release callbacks, the shared allocation, the call_rcu() free,
   to_drm_sched_fence() - stays exactly as today, so there is no amdgpu/pvr
   regression and nothing new for the backend to reason about.
 - This also addresses Christian's point that the reference must go from the
   finished to the scheduled fence, not the other way around: the caching fix
   keeps the existing finished->scheduled reference untouched and does not
   invert it, so the finished->scheduled conversions that rely on that keep
   working.
 - This makes most of the per-patch comments on v3 (the shared-allocation
   lifetime, the extra dma_fence_get(), the "last put" wording, moving
   call_rcu) moot, since that rework goes away. I'll keep the ones that still
   apply.

On the specific points:

 - get_driver_name(): it returns the literal "drm_sched" and never touches
   ->sched, so unlike get_timeline_name() it isn't exposed. Only the timeline
   name needs the fix.
 - The "already-satisfied dependency / dependency-collapsing" wording and the
   whole to_drm_sched_fence()-returns-NULL discussion only existed to justify
   the ops-detach; with caching, to_drm_sched_fence() keeps working as today,
   so that reasoning (and the confusion around it) goes away entirely.
 - Caching only the pointer: the earlier objection was that it doesn't help
   drivers whose name is freed together with the scheduler. The mainline
   drivers that actually hit this (amdxdna, nouveau, msm VM_BIND) pass a name
   that lives as long as the scheduler, and panthor/xe (dynamically allocated
   names) are already fixed per-driver. If you'd rather close the dynamic-name
   case generically in the core too, I can kstrdup() the name into the fence at
   init and free it on fence release - one small alloc per fence. I'm happy to
   go pointer-cache or kstrdup, whichever you and Tvrtko prefer.
 - Cc: stable: will add "Cc: stable@vger.kernel.org # we don't know since when"
   and let the stable folks pick the backport depth, as you suggested.
 - Whitespace/doc reflow: will split into its own patch and keep the fix patch
   free of unrelated formatting churn.
 - kmemleak: the caching fix doesn't change any refcounts, but I'll re-run the
   KUnit suite under kmemleak as well as KASAN before resending.

Unless someone would prefer to keep ops-detach and fix the two callers instead,
I'll respin as the caching v4 once Tvrtko and the pvr folks have had a chance to
look as well.

Thanks again,
Jonghyuk
