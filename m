Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5415F3F4139
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744167; cv=none; b=qPtLR3NLSDaqMM01c/VdD1BR3t7zvOGMMo/riGf90VMun5lT+lBcaKerswD5WzutCz0Q80ZIFrSNiqrvDmm4nfipXJWTefFnQ3bPWI/xg3ulTrXm5m7WmJpxfYzqVuZKGRY+41UUNLZaKvzNae3fzDqY850Kbv6E6HbRYnWYuTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744167; c=relaxed/simple;
	bh=Jwzk4loIHd5rF2n3Zk/fq6mQUULzVLUH828IgwUOqKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IC0cKLxCjFRVZSbHGBTRg6rrCXjU38rvoaocihMXr+obGgrnJw3mFsnhG3HxSRkzdxRU17S6y9AW5xxe9c4XPdSwCOB8BRUFZHuNdjpjv2l1JYITR6d+JjtRklPQKeNKUNdI/AywsItZNMeI4YvEbN5WdtYPX+9qBifgmlhuMJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai; spf=none smtp.mailfrom=furiosa.ai; dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b=eGOdZWQl; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.b="eGOdZWQl"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e58034d05so988772a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 04:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1787744166; x=1788348966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qgFsXhDsJkFJhJ+ciJcglHTEsr6ZDltVDS+SXgw7Qko=;
        b=eGOdZWQlZCe2o7dMI1bm3hS+FnYvhWaAsmHFx7Rot496nPCzv+wQ2LfrT5HJyMVgEy
         q5Q7R4Zg/vgbZlUOIqP1PdKOk2ZHbPQlV/BiN/DCSc5wLNkgfRXpIIsbIFOyY6sxyK4t
         6M/guX1cd9cHfyQ60pDe++rKKkDutFWuDgtOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744166; x=1788348966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgFsXhDsJkFJhJ+ciJcglHTEsr6ZDltVDS+SXgw7Qko=;
        b=cYwjWGVjPyVk3vMFI8hnb0m8UDHd5RARc2+A5jP7w9d1QOTz8YyyYIu8r2eiN1kR34
         Qyg1t0smEwRfntfesvP00N1YSRx4x2SVUMV6JeJa/+wf4ooN1aChvR+PunBUZBeES6vc
         Y/E+Kzq2ykRyTaS/ySW+NHEEr1J40J+N0f8GRsP4HKu8Dny0JXYzLgcz3/0bUEAI9rYy
         431JpOFCaHn8C7OUoW3o24SgjfQWrMOY4tU8+pbcnkJ6Fybi9JIHLvi9BRdmOEaJtse+
         App7Qb5pIj5HLqKn8hejYH0Svmw0t1tO+MrBLnAm4AAziQN232HsurxQI6jK028Y4Z9g
         Frrw==
X-Forwarded-Encrypted: i=1; AHgh+RoNGdZVaB900IlB1OQpgO+YicpOcYitGO38NM5Swf5sGcT7wiWoHT40GGZiifhM/cDzTYf7wi490Ga7+m0=@vger.kernel.org
X-Gm-Message-State: AFuF++noqj0HgA34ndy/UUeWq6yd5gIGR4g3r/nKDHzts8kkh2XJKqj1
	ZKdcKDD+yzsLvJI7lGXlRal+oKIJZ/5J6bWN0op7iYZLpWMGRPkh8xS9mN3GB1Rrskc=
X-Gm-Gg: AR+sD112mJeXNyEDKBjiWKGc5GpEEv6uPejQiUYbxUDs2BSjINWaJU3virCR4QmIrvS
	YDh+ZmNNAXRaqCjD31YmhgfNReg+qT3peBShhwaYOzMJiW+/LWF7DStWjKrPKvb4PE5nlTZ3/1D
	nhRzzbv19f1bL+g4AXZos86VFHWWKlzMaA/KCold10S6LNrjaVccyPJPzUHfcMtGfw5tsrYkGp0
	ctaDfLzzithGA2NE1V+8h+Mi4Zlv3V4qoylFHlc0fUV4rcfsTqiXNkPeIk0d9CGf1Qlh3KZ7zTu
	AW0RSlsXPSmVqu8WgvHN2JRR0G9kNISAkdDA3Y/NQtKaQ0b4zhdq38JCfXgBcSVmDahCDAVZq+1
	NGfGfdtPuU6ubVFJV1fzH3q9vVfD3eVkHvA636n22/C9HJpoMO8QTUVSmfr9TWUWaQPMStnK37S
	sDFkSF0bM0YPkvFe7rppol3mTlOj0bLVCuFm+9FlaOJgOrCTSceu1pZMPHDIHu4YJLUtkkMujt1
	w==
X-Received: by 2002:a17:90b:3890:b0:395:bbfe:fc6f with SMTP id 98e67ed59e1d1-3966d401db6mr12655903a91.3.1787744165623;
        Wed, 26 Aug 2026 04:36:05 -0700 (PDT)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645d989cesm7634294a91.16.2026.08.26.04.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:36:05 -0700 (PDT)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Triet Hoang <triet.hoang.dev@gmail.com>,
	royalnet026@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	ogabbay@kernel.org,
	tomeu@tomeuvizoso.net,
	markus.elfring@web.de
Subject: Re: [PATCH v5 2/2] drm/rocket: Keep scheduler allocation in rocket_file_priv
Date: Wed, 26 Aug 2026 20:35:31 +0900
Message-ID: <20260826113538.42111-2-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260818041505.1579320-2-triet.hoang.dev@gmail.com>
References: <20260817093009.22359-1-royalnet026@gmail.com> <20260818041505.1579320-1-triet.hoang.dev@gmail.com> <20260818041505.1579320-2-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Triet,

The code looks right to me, but the commit message does not say why the
change is needed - and that is what stalled the same change before:

  https://lore.kernel.org/all/20251107024620.912403-1-liqiang01@kylinos.cn/

  > Are you sure of this? The list should be freed in rocket_job_close(),
  > just before freeing the entity.

Fair against that patch, which added kfree(rocket_priv->scheds) while
keeping kfree(entity->sched_list) - a double free for num_cores > 1.
Yours replaces the free instead, so it avoids that.

The missing argument is why kfree(entity->sched_list) is not already
enough. drm_sched_entity_init() stores the list conditionally:

	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;

With one scheduler it keeps only entity->rq and drops the array pointer,
and rocket_job_open() has already let its own copy go out of scope. So
for num_cores == 1 the kfree() in rocket_job_close() is a kfree(NULL)
and the array leaks unreachably. For num_cores > 1 there is no leak,
which is why this is invisible in normal use on RK3588.

num_cores == 1 is reachable there anyway: rocket_probe() registers the
DRM device when the *first* core binds and increments num_cores as the
others follow, so an open() racing the probe of cores 1 and 2 gets a
single-scheduler entity. rocket_remove() also decrements num_cores with
the device still registered.

Independent of the leak, the driver reads a pointer back out of
drm_sched's own struct field to free it, and what lands in that field is
drm_sched's decision. Owning the allocation removes that dependency -
that seems worth stating on its own.

Two small things:

 - No Fixes: tag, although this fixes a leak. Same one as 1/2 fits.

 - kfree() still runs before drm_sched_entity_destroy(), so
   entity->sched_list dangles across teardown. Not a live UAF today
   (select_rq() is only reached from drm_sched_job_arm(), and .postclose
   runs after the last fd reference is gone), but the order is backwards
   and moving it after destroy costs nothing.

Caveat: I could not measure the leak - no kmemleak or KASAN here, and
with three cores I cannot open the num_cores == 1 window on purpose. The
above is from the source. What I did verify is that this plus the
rocket_job_open() half of 1/2, rebased on drm-misc-next, builds clean and
does not regress normal submits or the malformed inputs I tried.

Nit: prefix should be accel/rocket:, and "Changses" below the ---.

Thanks,
Sidong
