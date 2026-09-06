Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22038365A14
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 22:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788733585; cv=none; b=bwXalv6vy3GsbJ5qPPDc/g6dojuzyoi5nHyrydnv6jEJZ0qFtQ8B9Nkj2cjJ+WuHaZABg/t4+MGxj/sqDKzgFBr4LUAjO5kzg0t6cHjkdP4GSddWDKWhedm0xJTawRjJk5AwiTDpbv45IbGb5EdwtI5CfDmwfDliRf5wmoZimsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788733585; c=relaxed/simple;
	bh=ESGoqGmMu10/z0U2P8gBm5vkYhM+UfjKWUsR+Iji2b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFzTuPAAvCJpZGpogfchchXoNWKVmrRDHifE14vkSNB3r0O24c1UDRLnFYMhFIvr/tvRGMOG3k4Z3lLZtFPjFidYtWGVLNHHy/LsRmewZ69UuX7aq/I+LCEsB2kuf1rBx1AgFf5Sn4Yq6sTQUv2ukIteiZYV0rSGRziYYviUleQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDsiYCL0; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDsiYCL0"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398a5aad413so2069917a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 15:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788733583; x=1789338383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BQEMgxoBllO/xAi8qxIuWvSKZOLcvy0DblUANoSGaY=;
        b=mDsiYCL0mSqfhUFYiAnpdUjcpcMWQtYdJsZz3PundnILz9cu0IusKJUfAsEoC7zXS0
         sPKn3G1cVVYXu/fPge4n61gjYgQR7dCWOh1h3yyJozc0Fiah/Mk5FYxw/hXWRS3tkYJ4
         ugydrmrM6r9rLkVngWyEB2PY8QMiH6+jE1xYyp3wmtP1LqyPPtSW47JwM/j9XbdP1u5e
         Ld3bmGhgkI16d4mwsIC1y4N8Osy4mAJe47Jp3vX8ApRbSQP+0ihxAxTuiJvGcGMILmdp
         U4c+f11xmrthVTOCDC8htnmSYXkIk69Kc6j0lQ0CKe17ffa1xJjK53vPqX4YK790I4cZ
         ukag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788733583; x=1789338383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BQEMgxoBllO/xAi8qxIuWvSKZOLcvy0DblUANoSGaY=;
        b=ADl7JGLd0pCBOuLB3pDBnurqdBp0yjqZc92GTkyMZnnO7YzJgVR21Fc/JemjS2uzqL
         NVaUfAv9HD0k8Dd2FQy/V++FCGGwochSW5tUJtb28dn/XSpk2KFTcDTpGAkXcNCx/kS3
         0q95wlQNJRQcHHdigFoFVBVsp3AaZ+943lcihcjti5O3wIu1Z9BlOMp2eKcBaEe8IQBT
         iN2YYJxVc0MRGNFAwrjZwcwAvU82JfRCCFIwrsjOmLvkrZ8EE3SHheRQyGtkt84lqZFt
         dHt/RJeq7efM1SPuH8GvsnfcbmCmF5vLdZP6JCf42gO+RsBpHeI6l4myQFNT9L/GurgB
         0ipg==
X-Forwarded-Encrypted: i=1; AKwUvByenHnxagCLtBW/NCESqYGL9O+j2qZs1vUnPyaVqaGC/V0CU4JrB3Dm0yccAGJ/GMc0VZd+cAZOnc5GqzE=@vger.kernel.org
X-Gm-Message-State: AFuF++ljRpJF8D4cy6GVh+MeYdLuUR5IH/zTd/nNzxWvOVjjOZNmx2QV
	CFvgFc0Yl03F3GnV7RGOD5mKjqy2sWkPMlHpzo47zX+XGy1LgDARPexZytSGiQ==
X-Gm-Gg: AYBFou2vLXrehRiTTQmBC79Q+XPsWNh4NNAl3f1LHzYimuQcJ8foTsw2cWt3EotcATe
	xIL1WMvpRbZn+yEmLtfXk4xtLjwPjguGv9FskzIMZ9NKEXbqLf21mP/yQt/eK1rDP44n1yP63rx
	R35G2OYd7d9Y4ODFwGBfqk8h0qAR/FMQyFg5aDRUiwkYfDLzJZhRyACGXuJGJR/a45D4e8fIDyS
	f/ROb2RpULVHYIze2+gXLtxGYK9xX55RltWBzw51H/4Jgyry0eQrXc5ExaR3bF5ko+rwV3gG2Ko
	SsyGAVR+gbEAAdobRIXqj+5+XEccXui7gjwdwiC03824/F5XUqKeugJKwOv/dGwZecR/dNIhAdQ
	uzMM86aIlXTDO8RiQ8RnXGL0kN2yPWila5VrZJDWxVGaxNXSEV5dJbN/GRFEBIKJiXUD0x6BVT9
	M+AEiQQTEPeAV+6wPZSzMtVOGFMeIY+AYR5QNuamZEuS0h27/rSKrqoTHAh9xDn5328eyb9XQ68
	wtIyd80qprLbhmq
X-Received: by 2002:a17:90b:3d92:b0:398:bf7e:b267 with SMTP id 98e67ed59e1d1-39b2614df9dmr30677023a91.2.1788733583339;
        Sun, 06 Sep 2026 15:26:23 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8e0b117sm8413777a91.3.2026.09.06.15.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 15:26:22 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2.1] mm/damon/core: fix false positive in damos_quota_is_full() when esz is zero
Date: Mon,  7 Sep 2026 06:25:28 +0800
Message-ID: <20260906222633.4227-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905161233.81892-1-sj@kernel.org>
References: <20260905161233.81892-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 05 Sep 2026 09:12:33 -0700 SJ Park <sj@kernel.org> wrote:

> On Sat,  5 Sep 2026 18:36:58 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > On Fri, 04 Sep 2026 17:25:34 -0700 SJ Park <sj@kernel.org> wrote:
> > 
> > > On Fri,  4 Sep 2026 23:35:38 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> > > 
> > > > That said, it's not important for me to add explanations to the
> > > > document, but may I know why commit [2] changed the behavior which
> > > > introduced by commit [1]?
> > > > 
> > > > Commit [1] Behavior:
> > > > 
> > > >     if (quota->esz && quota->changed_sz >= quota->esz)
> > > >         s->stat.qt_exceeds++;
> > > > 
> > > > Commit [2] Behavior:
> > > > 
> > > >     if (damos_quota_is_full(quota, c->min_region_sz))
> > > >         s->stat.qt_exceeds++;
> > > > 
> > > > Before commit [2], qt_exceeds will only increase when quota->esz is not
> > > > zero, but after commit [2], qt_exceeds also increase even when
> > > > quota->esz is zero.  I'd love to understand the rationale behind this
> > > > change to better grasp the design evolution.
> > > > 
> > > > [1] 6268eac34ca30 ("mm/damon/schemes: account how many times quota limit has exceeded")
> > > >     (Fri Jan 14 14:10:20 2022 -0800)
> > > > [2] c7ec7d5f6b3d1 ("mm/damon/core: handle <min_region_sz remaining quota as empty")
> > > >     (Mon Apr 27 18:33:50 2026 -0700)
> > > 
> > > Seems commit c7ec7d5f6b3d1 didn't make a behavior change that you are
> > > describing.
> > 
> > I actually wanted to point out the behavior difference between commit [1]
> > and [2], but I've understood and agreed with your point.
> > 
> > > 
> > > '''
> > > $ git show c7ec7d5f6b3d1
> > > [...]
> > > @@ -2601,8 +2613,7 @@ static void damos_adjust_quota(struct damon_ctx *c, struct damos *s)
> > >         if (!time_in_range_open(jiffies, quota->charged_from,
> > >                                 quota->charged_from +
> > >                                 msecs_to_jiffies(quota->reset_interval))) {
> > > -               if (damos_quota_is_set(quota) &&
> > > -                               quota->charged_sz >= quota->esz)
> > > +               if (damos_quota_is_full(quota, c->min_region_sz))
> > >                         s->stat.qt_exceeds++;
> > >                 quota->total_charged_sz += quota->charged_sz;
> > >                 quota->charged_from = jiffies;
> > > '''
> > > 
> > > And I don't think there was a behavior change.  Hopefully commit 54419bbd0ee3
> > > ("mm/damon/core: allow quota goals set zero effective size quota") will give
> > > you some clues.
> > 
> > Thank you very much for your clarifying :>
> > 
> > Now I completely understand why there is different behavior
> 
> I told you I don't think there was a behavior change.  I still think so.
> 
> > between
> > commit [1] and [2].  Because in commit [1], esz==0 only means quota is
> > unlimited.
> 
> No.  Commit 54419bbd0ee3 says "DAMON core assumes zero effective quota means
> the user has set no quota."
> 
> 
> > After commit 54419bbd0ee3, esz==0 also can means do not have
> > quota at all.
> 
> That's what the commit is describing the before-commit status...
> 
> > But the qt_exceeds should just not increase when quota is
> > unlimited, that's why the current implementation is completely correct.
> 
> There is no unlimited quota.  Hence I don't understand what you are saying
> here.  Please carefully read the commit message again.

Thank you for the detailed explanation, and sorry for my confusing
wording.  Let me confirm my corrected understanding:

Before commit 54419bbd0ee3, esz == 0 appeared only when the quota was
unset, i.e., the user has set no quota.  DAMON core therefore assumed
zero effective quota means the user has set no quota, and the code
checked quota->esz to tell whether a quota is set.  Commit 54419bbd0ee3
decoupled "quota is set" from "esz != 0" by introducing
damos_quota_is_set().  After that, the temporal goal tuner
(af738a6a00c1f) made it possible for a set quota to have esz == 0 as
well, for example once its goal is over-achieved.  In that case the
scheme is intentionally deactivated, and counting qt_exceeds is intended,
not a bug.

Commit c7ec7d5f6b3d1 did not change the behavior I asked about; it only
refactored the check into damos_quota_is_full().

I will send a documentation patch in the near future.  Thank you again
for your patience.

Best regards,
Rui Yan
