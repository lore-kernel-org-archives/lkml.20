Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4155F3B7767
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744165; cv=none; b=Md3gdl2TGEeMDKv1N8Ri+SOQRLlexx0xcVJ+n1XZM+GjkUdqllgC0kAg35Emj+m6OLkVLukAH0SoC/PpzqzWlpvI/sxoVYFEeiglnwPfhGFCUIDsHzu3icO8WRW41z3ksRsQ4i3SiB0LnJBKIgkUx705GG7GIcxKab3mqPsPVfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744165; c=relaxed/simple;
	bh=z+fDlk796E/Evf5U1FxblAPiJytmD4uyq7eRrVdzlBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZ+AcfIXbnmHf116QO9Dyv/UmaIrEAviVIRYC5le8pUzgD0/7hTYP7acIqsL2A8Hoi6ivgN+f4M8M9t2L6WiBa8m2Ig5wdMBAva0hNswO9Aou/hDmIuxDYUeQXWRmcqmvzoNbLl8czMXJaMK87NBPIxBsUvNumYyHs4kaU+bTr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=oGrmwYyX; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="oGrmwYyX"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-395cf2535acso989227a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1787744163; x=1788348963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxuuGjx64HHjPINtAtl6gH3Y2mM/pzADeTGiTnvpMS0=;
        b=oGrmwYyXHDggsMhMpOtm8WryTfYYKoYVjbAB78hv/y3z+w9J18kuGi6wc9xgzQiMkh
         IXPV1N8Lo8kMzIlXTwVBQ4o4zyKsdXCm1yqxDkGRQXQziXC31N+2LPbRbARpvakfYWsK
         GQro2b5PwiDoKgRG9GIV48/POz48neJ/RxH4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744163; x=1788348963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gxuuGjx64HHjPINtAtl6gH3Y2mM/pzADeTGiTnvpMS0=;
        b=HvwD/yLdP1wFL99BVdUx6+Mbbl66MbUoyGxISkdE7avr6/3pBajRaYG59b9J2uudGa
         j54WHz6x35pf0ghw4mFXpIoyegYmyCvUbhfay40jn9U/b9GrYSZmZO27QC0uUbSTm0wJ
         W5XCxV1F3REYFvN02CaQrgOwS7zP+IvTmL3rryAhr+qleTImizZ3GGp6oHB+Cit1Mx+l
         euk/ltz5I7OTl9nUoZnUEEkLbkqHyQccqNL3WzAquPeJjpRLkTVkvdgHsK5uUMHmlfY7
         xjNHZCMO3SBZmoYKOxuU2pnrHkCJ7t8JWY3zta/F8MoUS1SqzMN5NsbttnqdXl2AwTsx
         DAvA==
X-Forwarded-Encrypted: i=1; AHgh+RpcP/W60ijs2WKc844QYB2UTRHCHk75kXx6XEiTXWc6/pEAX74ZWn851RXknFQ/7VvK2acoV9IL8S3f2cE=@vger.kernel.org
X-Gm-Message-State: AFuF++lHfAKXLAYaOLP2Bi4gKkGDdSs+GchBO0fQlNn8F/6ZBs5QH81b
	k+sH9ofpBgjXQBurOJ6j+SYLlfuxs+1zMz6vxH8+kBxGCettXpqBOHV1lxSTJv87G8w=
X-Gm-Gg: AR+sD12yEu8SqFGO9dtKwcZLiCTsKDIuD4OeW3VNSdtWzG7oMUG2IXVI9RANbD9ArZP
	vjxHwZzmHPa9DqfM7MizxQYF8x8S13Os44kHLy0NXGKXRYntibKTurd/ZEGaxORBm/QZ8lfyL3i
	WW55k04ViumtNlcTwQvX1ZHAPx90XSVEoV3reYNWf3i2sVDacNQXPQJmTgNWln3zNuTq4WmOjsR
	GCmAXUovOwRptDZ+G8/iLPOWJakVTUUhW3Pa7tPXs7F+SNJUSwIGuMlAc7MH61M+kgtRu0lqH5C
	W3f0Ywk6OPmmMMbChuWX9XsUPc5N7roKesILABYKwSTpOLDdwTol+bT+KrWUSgeIffg5QwEsvSd
	jSrmT0nqzB/s8U2Fwzx3jn3Nn2TxZwbEHKHJY/KsYoQ22tj8/Onv/o2XyKDM/zeMRfZGM4ZxxL3
	1ghMp1wBBrKU9R3XbULLDSj7ZJbyKwN9fUyp56MxlEVj4Xh2T8aIgtUIpfaaeLul8=
X-Received: by 2002:a17:90b:3d81:b0:38e:6d55:b1a6 with SMTP id 98e67ed59e1d1-3966d3d1262mr7778096a91.3.1787744163543;
        Wed, 26 Aug 2026 04:36:03 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d989cesm7634294a91.16.2026.08.26.04.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:36:03 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Triet Hoang <triet.hoang.dev@gmail.com>,
	royalnet026@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	ogabbay@kernel.org,
	tomeu@tomeuvizoso.net,
	markus.elfring@web.de
Subject: Re: [PATCH v5 1/2] drm/rocket: Check allocations before use
Date: Wed, 26 Aug 2026 20:35:30 +0900
Message-ID: <20260826113538.42111-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818041505.1579320-1-triet.hoang.dev@gmail.com>
References: <20260817093009.22359-1-royalnet026@gmail.com> <20260818041505.1579320-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Triet,

This does not apply to drm-misc-next, which is the tree accel/rocket
goes through:

  error: patch failed: drivers/accel/rocket/rocket_job.c:189

That is the rocket_job_push() hunk, already fixed there by

  https://lore.kernel.org/all/20260524155716.90955-1-meatuni001@gmail.com/

with the same NULL check, the same check_add_overflow() and the same
Fixes: tag. Please drop that hunk.

The rocket_job_open() part is still needed. I forced the kmalloc_objs()
there to fail on drm-misc-next (debug-only module param, this kernel has
no fault injection) and open(2) oopses on a ROCK 5B+:

  pc : rocket_job_open+0x64/0xd0 [rocket]
   rocket_open / drm_file_alloc / drm_open_helper / accel_open

With your check, open(2) returns -ENOMEM and the log stays clean. Worth
mentioning in the commit message: rocket_open() calls try_module_get()
before rocket_job_open(), so that oops also leaks the module reference
and rmmod is blocked until reboot ("Module rocket is in use").

kfree(scheds) on the drm_sched_entity_init() error path is right too -
rocket_job_close() never runs if rocket_job_open() fails, since
rocket_open() unwinds and .postclose is not called.

> 	if (WARN_ON(ret))

Since you are touching this line: ret can be -ENOMEM from
drm_sched_entity_stats_new(). That is an allocation failure, not a driver
bug, so a plain if (ret) seems better than a stack trace.

So a v6 would be just the rocket_job_open() change, rebased. I built and
tested that (this patch minus the push hunk, plus 2/2); happy to give a
Tested-by on it.

Nit: the prefix in this driver is accel/rocket:, not drm/rocket:.

Thanks,
Sidong
