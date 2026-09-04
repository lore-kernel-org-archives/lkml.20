Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08F54FB9B4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536189; cv=none; b=ZJcDZfMmBfvNEvvjAnVk+5j5DIq2NrD4zYr+sBjqjxfgQmhToW+uwjDZHTuOAwK4KEF7x9Yz3/ccEXYL/n5av3JlZY9AK4WY/86Ac16Xa6+gTPyLz19EQgBWpuECdpJDP72rlFoXh2yl6qDLLS9FtD5De75Si2dFRsxFOmsJQd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536189; c=relaxed/simple;
	bh=yEI4BV6iNvGNTp6yVxJz/nr+ZKBl7Obpkxk5Yr1QfAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eTGeq9HjannmkT266oRhbGT8VOjBon2Ep/5Tsm5IyrxYfnjPDh+4fcNGeGN+Cz98qm0YehMP6ZrA0BuTc7Z6koUv6HqmtUtl+UWTQM6dtdVKNZQ9Aa1a7U6Ws5C91b4NXAGQXzh9bnKaK8OtRK7QuK+00bF1k+orLr91hacdke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgTXdtQ1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgTXdtQ1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-853c947bfefso991769b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788536187; x=1789140987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owo9HPKkc5Wy9mPuxsDxORlEguNqRT/FIkEdbsJf07w=;
        b=WgTXdtQ10RN2bkdXQs1QZ9/01v+3awSURx8sEBr9tEJEBPkpTrb/HJckrRgUP5bboV
         50SBqfaIuusVlvz78WExrOu0+dIbUGhRYcqlNdl58cI1dypzewGmMXJyF4CCt1iuPzqY
         xqysF0Nu9DqnJJoW3jcBw81qnYVWGudtSPavWe7QncqkECpJkQAjBPPIKdSSaJIjzfT7
         dm12dqjR68f40/qrcQzvo0ojGW+ZJ7cQa1qCr6BcjmKkuPK5rgLWmmPp7W/RSqOHCmBv
         HAcH1vH482chzk6ZTe+IygZNayXlupM/CmETe/aeMb1RkNHMVqvwsEnlfFon5k/mmtza
         HITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536187; x=1789140987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=owo9HPKkc5Wy9mPuxsDxORlEguNqRT/FIkEdbsJf07w=;
        b=os2YLC53cJJr+ORQw70VoMNa0rrLfZoQZEx/EA2f31W/uFyH0zOv88HqcWaqYnXUWi
         80w2y6xOFcsSyxqt6XD8alXMLuA8jbwKwufDWhYWEZDeFPogvt/QpkJy5EiNTap9GtKt
         xYw33WPHzr6lHP7sYIipcXr+dyskcEwYd9G3fQ+NsFF4DOjhJvWVoWlbD0WZ39r3lYda
         wY2wKx8V4VCMq3GThbIBUIlcXqP9KMJ6Ew6yUH+PpUvJ+MaoQIDLszPje/nZ64L54k3O
         H+da2u4xZq+QvZDqi0a28/m51GlaufEhD5zUo0JDUZrDP8GnqPCfX3C37ohgQsXAtfLq
         Gftw==
X-Forwarded-Encrypted: i=1; AKwUvBwXL2m3HEDa7WspnZDNO2sDxPSzRovmZKyF1DpLibZjt4rNq+yAFE9YHL8wKj3f7I2URL9qyZN30wxKeHE=@vger.kernel.org
X-Gm-Message-State: AFuF++kcLdwNBBs1r9ZCOh19ZBiYI/J4+cPTxj2FCpD76tigk0Vxw3WW
	i4OYTcL/DUqL2DGzL6OVfAXJ0eznibtPax3OIXqz5GvK0NpNCHxV/ZyJ
X-Gm-Gg: AYBFou0nXpknZc/HKc7n14LWAXi5eBqvwISznWaGzRzqGGdDa+7vpUyNA1E15t2BuVm
	6WZJbo6uGixHxhPrWDnM4INZjqxhhnBYAFNMGxDZFQqiMC3X13COl0/tGIh++YJX+5D8+TXn0iI
	8pkgf85UhonClbkuxMh6U1GpmGDoMTTvRZGeNVbeC8+CRxtkyKXJsq3Bd7IAOunD5jwlMDmxzYe
	J0EjSf2R0Sr0/rm88gHfLzpocuYKUKqtjEVv+ogwFqpPRAOpmgaI7xkGwRULuLJCNzykMY8QS94
	NSNhQrHi/K3r+QWFc6O8MIWQ48Pj0S7ML6N93HczvTmpxUFcpYG2rhxZ9zqf3v/t+NqsLb+ZRg0
	cikykdqKVyUKFdYXrYW3cQZowRJQxX24WSwW3BVbtb2l/qaMNbla/WaOPdQER65xYz6DYErdhsg
	XHAGVjAFyUQMToo9EoAXJ7m3v2nCQ6t85phzkNcWOWjZgMeOs8/lxoJpMQWYorE+azeV3Xyn9nM
	8DL5zozVT/beVE=
X-Received: by 2002:a05:6a00:b91:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-8619ae94866mr5005293b3a.7.1788536186798;
        Fri, 04 Sep 2026 08:36:26 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2001:f40:906:1c06:7a81:226b:e033:d971])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152f32447sm1277202b3a.38.2026.09.04.08.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:36:26 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2.1] mm/damon/core: fix false positive in damos_quota_is_full() when esz is zero
Date: Fri,  4 Sep 2026 23:35:38 +0800
Message-ID: <20260904153637.9670-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904140535.64833-1-sj@kernel.org>
References: <20260904140535.64833-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 04 Sep 2026 07:05:35 -0700 SJ Park <sj@kernel.org> wrote:

> On Fri,  4 Sep 2026 16:07:41 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > First, I'd like to clarify that this isn't a problem encountered by a
> > real user, it's just a scenario I came up with.
> 
> Thank you for clarifying this.
> 
> > 
> > 1. Users sample qt_exceeds periodically (e.g., every 10 minutes).
> 
> What's the purpose of this sampling?
> 
> > 
> > 2. Within this 10 minute sampling interval, the counter aggregates both
> >    the real quota exhaustions and the increments caused by esz==0.
> > 
> > 3. When users notice a high qt_exceeds value, they eventually realize
> >    (perhaps by reading the code or documentation) that it includes the
> >    counts from the esz==0 state.
> > 
> > 4. To get the actual quota exhaustion statistics, the user is now forced
> >    to perform additional testing and implement external filtering to
> >    separate the esz==0 increments from the real exceeds.
> > 
> > Even if we explicitly state in the documentation that qt_exceeds
> > includes the esz==0 counts, it still burdens the user.  The user still
> > has to figure out how to filter out the esz==0 increments externally to
> > get the signal they actually care about.
> 
> Users set the temporal goal.  They can know when the goal is achieved since
> most of the goal metrics are already exposed to user space.  Users can also
> show the current effective quotas.  I agree that can be cumbersome, but how
> problematic it is?  Also, as I asked above, why they want to do this after all?
> 
> > 
> > Honestly, I struggle to imagine any valid use case where a user would
> > actually rely on the qt_exceeds increments caused by esz==0 to make
> > decisions.
> > 
> > If the only purpose of qt_exceeds is to let users "easily notice" if the
> > quota is too small,
> 
> I agree it could be a signal to show if the quota is too small.  But the real
> purpose of qt_exceeds is, in my opinion, letting users understand how DAMOS is
> internally working now.  After all, how much quota means if it is too small or
> not?  That all depends on the real use case and complicated things including
> their SLO etc.

Thank you for your clarify.

> 
> If documentation is saying the purpose of qt_exceeds is to show if the quota is
> too small, that is what need to be updated.

I completely agree your perspective.

This is the current documentation of qt_exceeds:

    - ``qt_exceeds``: Total number of times the quota of the scheme has exceeded.

Although it state the purpose of this statistic, I think adding a
note to clarify that this stat also increase when the quota is zero (but
not unlimited) would be helpful for users.  For example:

    Usually, a quota of zero means the DAMOS scheme has an unlimited
    quota, so qt_exceeds will not increase.  However, if user sets a
    temporal quota goal, the quota is set to zero once the goal is
    [over]-achieved.  In this situation, qt_exceeds will still increase.

I can prepare a formal documentation patch based on this if you agree.

[...]

That said, it's not important for me to add explanations to the
document, but may I know why commit [2] changed the behavior which
introduced by commit [1]?

Commit [1] Behavior:

    if (quota->esz && quota->changed_sz >= quota->esz)
        s->stat.qt_exceeds++;

Commit [2] Behavior:

    if (damos_quota_is_full(quota, c->min_region_sz))
        s->stat.qt_exceeds++;

Before commit [2], qt_exceeds will only increase when quota->esz is not
zero, but after commit [2], qt_exceeds also increase even when
quota->esz is zero.  I'd love to understand the rationale behind this
change to better grasp the design evolution.

[1] 6268eac34ca30 ("mm/damon/schemes: account how many times quota limit has exceeded")
    (Fri Jan 14 14:10:20 2022 -0800)
[2] c7ec7d5f6b3d1 ("mm/damon/core: handle <min_region_sz remaining quota as empty")
    (Mon Apr 27 18:33:50 2026 -0700)

Best regards,
Rui Yan
