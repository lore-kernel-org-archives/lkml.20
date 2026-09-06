Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DEA368941
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 03:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788666996; cv=none; b=ExmHSM5uIJ6X7FdTVnNztWS1ow2G5oGCcUOcBFJ+LM4m5JCsTm2BUEmXZ+H7eMzmesQZAGe41TAqBqaeVcM8bUSNLWCTDjjsDumHVyVV2/p5y53z/LSrE/WM3es0v0I+Yn5fZ6UxVx4e5x6N5B+sAKOXRDiLTviapiHDPIJ70bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788666996; c=relaxed/simple;
	bh=LndMqLWFndpBATKF4p0N6KzAWh+u0BMEBf9KkfFIjZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B0v4CnY5DlSzNxYQfIA/mdZuoXa5k9RHV8apW5A6ZrdfKNHqwXbGupLpC9hSfd2GXs/yo2M/8WlmaoIrMvBIKzLbgldwleZ9yQ/ZubxRJIAcKASXL1QMOObD10yZOY5Uuu7Bl92o4YO9rxgDAOgfXgYzDvj/sVJ4tqj8gz5JQZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZjEttDM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZjEttDM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d9520b9155so20372105ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 20:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788666995; x=1789271795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BFIuZ6zIqPPlmMH3AGzmZi9cqGjx6Zhr5KeBymliPYQ=;
        b=MZjEttDMy7Dvw8zOi2tx0dQNIE4pNH0685um2XrQ6fxQ669UkC/bbSIfuExUYtEINS
         XeZQJ3IIuq1XyXaEh15V0xLBWRrQoFEPXKqGSto8eBUDH++YNVbGZ2jcGtGbDU56zRee
         ZI9n6gZ7gvkvuYZ1pdUGDxaHdG81oSQa+Y4Gp2W2I//wz6Tn4plm3C+PRvSHZmcRV9o8
         5GFvD2drcqqlyplTKOPsNKnIzueKnszfFZWk2UHNYVIHw6OuTzIEP0687OZfFSgwNeB6
         vaXvaNIv1s1966/EwAQkiMJXSBU+Kz6DCV+U26nWRv8VHyTebKZ6PIMPez8fshuV/4Vt
         8/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788666995; x=1789271795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BFIuZ6zIqPPlmMH3AGzmZi9cqGjx6Zhr5KeBymliPYQ=;
        b=cms9dO8MaOUzkXFSuqxnPelk85dHPUpN6sRlCmINH0A4YQUtf3ZDlo7aDzYjP3Aukn
         GrnRY8IjdzJeDy/mnK7jIwwAWnhWLhx7jVxNT4Z5Uglk07W1SvEVsZ+y49SnnFH47xhg
         OrV2fg/7GeV01jrdG862S97xVUnuNoPDJN5BX2BCtaoeHAtPs0nIBzlyOMlMkc3EB/TX
         ah5UH6Dk06w7/ddrDufGOphu2+yIDoOgRhIZwd2Gikx8mLcAdv/y1XVgjDz26fO4NF2q
         1cuiUkSJaJXemJaB6ybDZO6zDPrOM7fZu0ec5Z4W1wRy4t4V8UP5M7oqBRFEHPE1JHv0
         qg+Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6fSN20H/BIdxLBTjqM8Vr++83uYQfZX5qSbJswj9FPtZzH6M2x2kvxr50Q78iKj58QENO5ZkxHHB0hTs=@vger.kernel.org
X-Gm-Message-State: AFuF++ngUmFDk5sLt1+dD2YfjvGFDTVc9NJla6U9/94sDMK60S8hNO+e
	/TkFpuWz4FnXZNmPaqk+pnyb2H/b04uFFhFqXDLyOCrWOornb/rkoNc5
X-Gm-Gg: AYBFou04W7iCrIBcpYQQzJCH1Wd5piqIbYSZLGenpK+OUcbncIupUma9RJtOYgCuOnX
	EuQrTPOrq1fPcgx5DStLbYJvl0DsOlZFV3aHHd99GRqYf3nHKLt3peMfGOAWF5Rn8tDMBKOKDGS
	PP0v0BeDTAhJLTq1s9vxVtcNboC2rmdMO3bAWBm6WkwUXy1zsia73fZaOxuq3kD+YgZoIXLjx7u
	ceN6qa3VKAwd6+4LFHf9PC1VM8QHVz1NEEFR7Vt18wn2NxLXfreSpgO9+4N582Ms+4hhmaWC/Iu
	coJedJ/1zf+/cNWfLEzNIoQi4FLEabYYGSgUlJBWCoI3/ycQUkZ05D1omcXzOLNBy6WeM2WpwE0
	CY2ZoJ2wKiEunyrcaDyeX2k7QjCB2YqeF+7c1dU5hmm3vaWisTZVfbMdczhnah8ZaYNuNFbZ1Qw
	ABywhhI+OAsYCD9Pv6zTIX67avYZbkH0oxkeUq5+YOiRVgmiJzvajXHGqwntyPcqtQIb5VPXoge
	XWGVtG/gX25VjLX
X-Received: by 2002:a17:903:2302:b0:2d9:3365:7f48 with SMTP id d9443c01a7336-2db127c0b2bmr222747835ad.14.1788666994824;
        Sat, 05 Sep 2026 20:56:34 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c2850sm28176825ad.62.2026.09.05.20.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 20:56:34 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: akpm@linux-foundation.org
Cc: hannes@cmpxchg.org,
	baohua@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	david@kernel.org,
	mhocko@kernel.org,
	ljs@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: vmscan: avoid anon scanning for GFP_NOIO with low swapcache
Date: Sun,  6 Sep 2026 11:56:03 +0800
Message-Id: <20260906035603.399231-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260905194602.b88f549b9462033e40336db6@linux-foundation.org>
References: <20260905194602.b88f549b9462033e40336db6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks a lot for the review, Andrew - much appreciated.

On Sat, 5 Sep 2026 19:46:02 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> > To stay conservative, this only skips anon when the swapcache is really
> > tiny - below 1/64 of the anon LRU - i.e. when essentially no anon on the
> > list can be reclaimed without IO. Whenever there is a meaningful amount of
> > swapcached anon, the normal path is used and anon is scanned and aged as
> > before.
>
> Argh.  The thing about magic numbers is that they're always suboptimal
> for everyone.  But I understand that a full-on dynamic tuning setup is
> a big project and hopefully not worthwhile.  And yet another /proc knob
> would require quite some justification.

Agreed - a full dynamic tuning setup would be complex, and I'd rather not
add a knob for this either. For now this uses a conservative threshold to
catch only the case where anon is effectively unreclaimable; the reasoning
is explained in the function comment (below).

> I think this function deserves a comment.  One which explains why isn't
> doing what it does rather than what it does.  That comment would
> highlight the heuristic and explain the thinking behind it.

Done in v3. The comment now explains the "why": a !__GFP_IO reclaimer can
only reclaim anon already in the swapcache, so when swapcache is far below
the anon LRU, scanning anon reclaims nothing and only burns CPU - and the
aging it would have done is merely deferred to later __GFP_IO reclaimers.
It also notes that 1/64 is a conservative "negligible swapcache" threshold.

> Also, AI review asks "does reclaimable_anon_is_low() incorrectly use
> root memcg statistics instead of node-wide statistics during global
> memory reclaim?".

Good catch - it did, and I've fixed it in v3.

For memcg reclaim, can_reclaim_anon_pages() is called per-memcg (memcg is
the concrete cgroup being scanned), so using its lruvec stats is correct.
But for global reclaim it is also called with memcg == NULL - e.g. from
set_initial_priority() - and there mem_cgroup_lruvec(NULL) resolves to the
root memcg, whose stats exclude the child cgroups where most anon lives.
That could make the check fire on the root's tiny stats even when the node
has plenty of anon and swapcache elsewhere.

v3 splits the two cases: use the memcg's lruvec stats when memcg is set,
and node_page_state() when memcg == NULL, matching the node-wide view its
global callers already use for the file side.

I'll send v3 with these changes.

Thanks,
Bo
