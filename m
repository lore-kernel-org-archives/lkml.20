Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66D93815F8
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790456843; cv=none; b=DUF+VMUmeM3Xp7L/TqQqFktk33XPjRPj5+GVdHXCKYUuMYg/dfEohsbN5YSznCJSwVMTtyEbKHxRkv4IDu4zF1mujZUFJ25TSMM5525+8ygZjd3r5DmXSxRpB8QBy0MOohS6or/t1tfKMO7cZ+LsewYNMFVAnSaG/SaN4NRHscI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790456843; c=relaxed/simple;
	bh=zM/rdveoAKUL0koww0d+01SZ9/01sHGGtOdBr5Kj+w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1czlohSPXh99LDCeBDYIzjW6gVhUj9C/OOdTuaT6wO/fW0rFeVuWvBLvl6lzEALtQET9nCP7Wu2sjhKiDOnE9rBvhwog5igwcdC+chCW/bcBGo8XKjsglEu5YNpdX4B+PsiomQsG6/kub0iu0tVYxHfMpHcSTnPCsXL5Wc/BUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiEynbK1; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiEynbK1"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd54610so557446a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 14:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790456842; x=1791061642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bpSCnKLdDqOi9AdxZc7ZAonemUZupk1aEtdY90Xtb6I=;
        b=TiEynbK1vvTTFszqn4SDn45fxjYHFqEEVpHe21kYh2jG02KoubkQbo2V+1UquiFdKI
         nhqhwKbGEtJ7LJzoVfqTAjX79uSU6xdhXPQxpeaksQ2VaHNRnGQUTV/NCplAXhuDjciS
         Yy7s8mwKCFNLb84XiOpqrWsyu2w1BjSRFGlPzwG7sYCt8I1qXEN/h7SawH3G0ATLCSnh
         KUZFNGtCvuRBPAAzgBOu5jJ4fK8Lb6ducb2Age+AuTQNBmIGnEFu3LbVlD9eUa/86Xhe
         1uoBgX0A0fl3Ada47P/Adq/223GRvcP5J0WYwEOD8X83etMSRWIn0cCTUiLPn0Ybw17o
         79ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790456842; x=1791061642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bpSCnKLdDqOi9AdxZc7ZAonemUZupk1aEtdY90Xtb6I=;
        b=B7wvxK2rnI0QoPlzdTb4yqwVppZXNpV6ld3b2RfviBA2zwATv8AML7Mf8pii331YCG
         /suWcYSsMrDwgtbHboRXgm15Cmf7O2ptcdKKhqwGv/ZCh8L+JxfYd5tvtrkxU5S6EQ1Q
         s7lquLBApNHzJ2X9VcvoTVDy3gPo6YdRmbHEHfN9ThhcGoX1KjbC/yqjzvXiZGSg8YvI
         pYHr/+kKamNbfyh2ySyWFciy74nQBKtdrBlWJcJmLfoSt2R0k274ZZabRd7qT7OR07e6
         E0XOGaxcqZ4JDVN2sraptz99Fc1W0id56DeRER5WBYUHQBBTFl18JofHdsEhWEUG4R/0
         ajLw==
X-Forwarded-Encrypted: i=1; AKwUvBzF54Fkdbq32zP3XqYUTevActqnK9IsRASOAr/q0j3MI3c2mcqYdkawckkwZ3bNaPk7gLg9gNjF/GRe+RQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kqSCkpkHCFlCcthFNNZjdwFldiHnkOHgkhIXu5yBhOtfN5+HLV
	qprCQWRDw0d8J4/eVH+7uV50oh7b+gKAEls5XJbTORIgo8Xy+rhfvGSm
X-Gm-Gg: AYBFou01ikM0q45roVblriaIrykF3rYIaJ8UhxWKskGLfP5COh9oBJRQM/uBFQV61AL
	csR5UchoxVVuRZNqUyLeZr6rUPfO0vB/w/EkUyKxRfaHu4AJhm1OznlsoZqYzOc3dWEhxSWTcvm
	eSo2QFnMCoaD9NI3/S7aGcm99GC/GleArnSBVxfZfEqXmgfdB4o8ORmCD21G1Cmy7/yICfL+/mb
	fQvoBc3eNw1qHplkb+EYMx53w4aGApdo10Kc9YapLXO14MBttNVKuzDaeYYxieG/0GZPlMbs295
	ytWviO28r7IknGTBQXJY3SHtecUGkSptQFtq0hk6tZuVsR2sMw+PrJSOhHJbs/WQmZ6MCtWQB6A
	/VOOh/GJLDrI3Y6+Vr38N3lApFUHN5GnCiWu5QTLbdTQXV/1VQ2qzSdrmoDfqjbYuq3ubPJRyhI
	4wHuIumnxeWche7EscrfSSkoAB1YFu/eCEpmbFbrRoszpMUDpSai5LfitCv27JD2RBaRHdxd+j
X-Received: by 2002:a05:6a00:2988:b0:87c:f67f:f7d3 with SMTP id d2e1a72fcca58-87e95b5ec2dmr7070362b3a.0.1790456841899;
        Sat, 26 Sep 2026 14:07:21 -0700 (PDT)
Received: from celestia ([2402:1980:867:387a:70b:38f1:a1dd:9303])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87ff54fa206sm2380979b3a.0.2026.09.26.14.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:07:21 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v2] mm/damon/tests/core-kunit: add test for unconditionally skipping the last region
Date: Sun, 27 Sep 2026 05:07:09 +0800
Message-ID: <20260926210737.8837-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925090239.47821-1-sj@kernel.org>
References: <20260925090239.47821-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 25 Sep 2026 02:02:38 -0700 SJ Park <sj@kernel.org> wrote:

> On Fri, 25 Sep 2026 12:53:35 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > Commit 50585192bc2e ("mm/damon/schemes: skip already charged targets and
> > regions") introduced a minor issue that causes the last region to be
> > skipped before it is processed.
> > 
> > Example:
> > 
> >     1. Target has 2 regions: R1 (0-100 bytes) and R2 (100-200 bytes).
> >     2. Quota is configured to process only 100 bytes per window.
> >     3. Window 1: Processes R1 (0-100).  Quota is full.  charge_{target,
> >        addr}_from is saved at (Target, 100).
> >     4. Window 2: The loop reaches R2.  Because R2 is
> >        damon_last_region(t), the old code unconditionally returns true,
> >        skipping R2 entirely and resetting the charge_{target,addr}_from.
> > 
> >     Result: R2 is permanently skipped even though it has never been
> >     processed.
> > 
> > Add a test to prevent this regression in the future.
> 
> The bug is fixed by commit b3723b596b54 ("mm/damon/core: fix unconditionally
> skip last region"), which is merged into the mainline for 7.3-rc5.  Could you
> update the commit message to mention the fix, rather than the original bug?
> The fix commit already has a quite good description of the bug, so I don't
> think we need to duplicate it here.
> 
> Other than that, looks good to me.

Okay, I will change the commit message in the next revision.

    Commit b3723b596b54 ("mm/damon/core: fix unconditionally skip last
    region") fixed a minor bug.

    Add a KUnit test case to cover this behavior and prevent regressions
    in the future.

[...]

Best regards,
Rui Yan
