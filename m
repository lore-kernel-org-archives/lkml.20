Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B935F4772A6
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854101; cv=none; b=Ne4916dhGjc/3dsFlxZz6BwRdpZB37YeAJsRKwwiatwuR6xvrV8ruykkSodyNj7NMy8a76gZdNm9xlETi4EJS0XMdC677EYPOoWXYQl7oXr6FCOZ5aSF07aA5FOZ29czZogqTAgHM6X+oM9RADTROIVD+scrc2dncfBTG/ejPng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854101; c=relaxed/simple;
	bh=ArT4A9LnLuUwhgr/cxAD+B5AibwuMzq9queyu1Qs/hw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BeByi+LrrDNIEguvbuXO4/J56gmKZCe6Kc1q4+ewVEEGMrvpDFmQlkzwcBydCzl6Kl/d/UZ7LwmFAZQkdgW5sdIloJ0thlr8l+u5j9xciqioaUvMyIkgvGCfMF0fBXudWq92RWs5ZTck7PFELLaUN2h9V9Hv+Ov+vnd5PLB0s3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pvW46l1J; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pvW46l1J"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39686abd426so381051a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854093; x=1788458893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plMv1alWLSmRUs996GTzyKVxl/InS+Hvvr87SnLX3mc=;
        b=pvW46l1JvjWDgPrFcMlLODLgl2LDA4SmwlMs1Lh9FcMCWOz4hCbARtokNWvropSAuw
         gzJC8/A1KEWVFHFh44IKPgnXaRAMT02ffD9XDhB8v7cSRByzG8f4rNnS2eYXvjPl5DF4
         CAAABmMuYNrf8fFLmd6mSblvoMk55HDDRI/WpfsSumnb9KAuhQTVTZlFQtwQnian4ctq
         Oi2nmdpCPPJlcQnS28T+ycW96CRcrMABX3YzBWRKrd23ZqvAF6VwacRMe/AGlMRWv235
         BEf3bWz2z2XueQ6Apce7FwRmrIflY03/7910A087RTY3Uw9/upuEu4q/iRqeUutNljxu
         8rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854093; x=1788458893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=plMv1alWLSmRUs996GTzyKVxl/InS+Hvvr87SnLX3mc=;
        b=h2b30Bz7BZv563U05/rKwVJE1L3KXuJck/Wkz0x3gQfl/H66yo2SvGTPU3tzk1aZ7e
         cdbbFl1aShP8+2KuOVPMklB/fNvFFy4Li3Kvfzj6l0z4wSh2Bf8OXMJb1tgE0GAfx4C6
         l0jc3NuXlILWC5lJk49R01S5cpJqGgpQLJ/f+cJTLRLePyRCnGhUi8utmEESLGHO9hXm
         f1mXtVwBkNRPd94OHO7cMz5UN8IqeLXXgIG6lV819NfY3+YPjGMeVqPiQ758V1Yorq7o
         2SIl1mH9MBNtF3DW22edOrHloe5hNt0faHnJiMHUslTA6Zjr7CWTfSTz0QytJOCXogPh
         0VVw==
X-Forwarded-Encrypted: i=1; AHgh+Rpu06d0G5WLLz1/DX20kDnRCGaMJSUU30MvVLgn1jD8DuN8TN8QrBd8e805ncy+35oKAe+HgZYi6o54KSQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nnVuVGQnfEY4Sum67lfb5bYWKpJ+z7t/GTNYttJqUVbEXoZDhZ
	8sUVK+DJzi5HmwLdSOGfxdWMoejad1bby3Csw/pbWTytROtWUpN1aKng
X-Gm-Gg: AR+sD13NcIUvA8EdVs3BypnjoxMNdPjIJUNgej+7EaW95uW4JdR/P1nEXW8qCs5rkG0
	luKDd619gwWedKc8NrLNviUaUP2fi1i25jpByZXWBm0tEH0zoSHWFJwbxVVm05H0kVZxRwqHziy
	XhULpL5qex8ASu+aWBKomW0eYXYT261c0f7lGhafLWO7VNQQbNLszA4eTfqEkO/I+8fGMN2bzvX
	WOLfkqnS95gnfcTmlW2ld8NozvfOpjHxEdXHiW2EEMED35nG7+hMy8BBzKcu6MY50qhJE1pcm7F
	Vk5oksipLAh7jrkrU84u84IqttZHKVV/nxuKhMkyYAUF9ED3UNI6Ur4twiE84k3x6+Hrm6KRqh0
	IUoIpRdNyQxnWTVrpzC1sEQXOPVPwjjQ9pNf3FBtyFT5lyYN8e2UsLY4EOhtLjaM/GFefe4wxhh
	s2TAflyisQvosj8+nJwDj1aP2klVVIl9agFsz1OVWi8j3wrUe2QoVlYs7ch460o5pIJna90G8pj
	WHqbTVlYFTZGivVNec=
X-Received: by 2002:a17:90b:440d:b0:38f:bbc:6a0f with SMTP id 98e67ed59e1d1-396d0e5f35fmr1346864a91.1.1787854092659;
        Thu, 27 Aug 2026 11:08:12 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:88cd:27c4:5897:46d2:587d:19e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0d80008sm3682194a91.6.2026.08.27.11.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:08:11 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH] mm/damon: fix damos quota walk-position tracking
Date: Fri, 28 Aug 2026 02:08:22 +0800
Message-ID: <20260827180822.4037-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827004438.82746-1-sj@kernel.org>
References: <20260827004438.82746-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 26 Aug 2026 17:44:38 -0700 SJ Park <sj@kernel.org> wrote:

> On Wed, 26 Aug 2026 07:05:08 -0700 SJ Park <sj@kernel.org> wrote:
> 
> > On Wed, 26 Aug 2026 18:24:13 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> > 
> > > On Tue, 25 Aug 2026 06:54:57 -0700 SJ Park <sj@kernel.org> wrote:
> > > 
> > > > On Tue, 25 Aug 2026 20:46:16 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> > > > 
> > > > > DAMOS uses charge_target_from/charge_addr_from to remember how far a
> > > > > quota-limited walk has progressed.  The current implementation has two
> > > > > problems:
> > > > > 
> > > > > 1. Once set, the cursor unconditionally skips and resets at the last
> > > > >    region of the tracked target, so the last region can be skipped even
> > > > >    when it has not been processed.
> > > > 
> > > > I don't fully understand this.  Could you please clarify more?  Maybe adding a
> > > > realistic example scenario would be helpful.
> > > > 
> > > 
> > > Problem: Unconditional skip of the last region
> > > 
> > > In the current damos_skip_charged_region(), there is this logic:
> > > 
> > >     if (r == damon_last_region(t)) {
> > >         quota->charge_target_from = NULL;
> > >         quota->charge_addr_from = 0;
> > >         return true; /* Skip */
> > >     }
> > > 
> > > Scenario:
> > > 1. Target has 2 regions: R1 (0-100 bytes) and R2 (100-200 bytes).
> > > 
> > > 2. Quota is configured to process only 50 bytes per window.
> > > 
> > > 3. Window 1: Processes R1 (0-50).  Quota is full.  Cursor is saved at
> > >    (Target, 50).
> > > 
> > > 4. Window 2: Skips R1 (0-50).  Processes R1 (50-100).  Quota is full.
> > >    Cursor is saved at (Target, 100), which is exactly the start of R2.
> > > 
> > > 5. Window 3: The loop reaches R2.  Because R2 is damon_last_region(t),
> > >    the old code unconditionally returns true, skipping R2 entirely and
> > >    resetting the cursor.
> > > 
> > > Result: R2 is permanently skipped even though it has never been
> > > processed.
> > 
> > Ok, makes sense.  The user impact should be not that big, though.
> > 
> > > 
> > > To fix this, the patch advances the cursor every time a region is
> > > walked, regardless of whether it is applied or filtered out.  This
> > > allows DAMON to accurately track whether the last region has already
> > > been visited, eliminating the need for the unconditional reset.
> > 
> > Sounds like a big change compared to the problem.  Why we cannot modify the
> > last region case?  Have you also considered other possible simpler approaches?
> 
> For example,
> 
> '''
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -2686,14 +2686,15 @@ static bool damos_skip_charged_region(struct damon_target *t,
>         if (quota->charge_target_from) {
>                 if (t != quota->charge_target_from)
>                         return true;
> -               if (r == damon_last_region(t)) {
> -                       quota->charge_target_from = NULL;
> -                       quota->charge_addr_from = 0;
> -                       return true;
> -               }
>                 if (quota->charge_addr_from &&
> -                               r->ar.end <= quota->charge_addr_from)
> +                               r->ar.end <= quota->charge_addr_from) {
> +                       if (r->ar.end == quota->charge_addr_from ||
> +                                       r == damon_last_region(t)) {
> +                               quota->charge_target_from = NULL;
> +                               quota->charge_addr_from = 0;
> +                       }
>                         return true;
> +               }
> 
>                 if (quota->charge_addr_from && r->ar.start <
>                                 quota->charge_addr_from) {
> '''
> 

Thank you for the example!

While your approach works, I am curious, why should the cursor be reset
every time the function returns false (does not skip)?

In my opinion, a cleaner and more deterministic approach is to reset the
cursor only after the target has been fully iterated through.  This
separates "skip" logic from the "state reset" logic, making the flow
easier to reason about.

Here is my proposed minimal change:

'''
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2347,11 +2347,6 @@ static bool damos_skip_charged_region(struct damon_target *t,
        if (quota->charge_target_from) {
                if (t != quota->charge_target_from)
                        return true;
-               if (r == damon_last_region(t)) {
-                       quota->charge_target_from = NULL;
-                       quota->charge_addr_from = 0;
-                       return true;
-               }
                if (quota->charge_addr_from &&
                                r->ar.end <= quota->charge_addr_from)
                        return true;
@@ -2368,8 +2363,6 @@ static bool damos_skip_charged_region(struct damon_target *t,
                        damon_split_region_at(t, r, sz_to_skip);
                        return true;
                }
-               quota->charge_target_from = NULL;
-               quota->charge_addr_from = 0;
        }
        return false;
 }
@@ -2658,18 +2651,26 @@ static void damon_do_apply_schemes(struct damon_ctx *c,
                if (damos_quota_is_full(quota, c->min_region_sz))
                        continue;
 
-               if (damos_skip_charged_region(t, r, s, c->min_region_sz))
-                       continue;
-
                if (s->max_nr_snapshots &&
                                s->max_nr_snapshots <= s->stat.nr_snapshots)
                        continue;
 
+               if (damos_skip_charged_region(t, r, s, c->min_region_sz)) {
+                       if (damon_is_last_region(r, t)) {
+                               quota->charge_target_from = NULL;
+                               quota->charge_addr_from = 0;
+                       }
+                       continue;
+               }
+
                if (damos_valid_target(c, r, s))
                        damos_apply_scheme(c, t, r, s);
 
-               if (damon_is_last_region(r, t))
+               if (damon_is_last_region(r, t)) {
                        s->stat.nr_snapshots++;
+                       quota->charge_target_from = NULL;
+                       quota->charge_addr_from = 0;
+               }
        }
 }
'''

> > > This patch ensures that every target is traversed sequentially and
> > > deterministically, even when the quota is set very low.  I omitted this
> > > benefit in the initial problem description.  If you think it is okay, I
> > > will add it in the next revision.
> > 
> > What's the problem and benefit?  I still don't get it.  More clarification
> > would be nice.

My original idea was to ensure that every target would be checked
sequentially, which seemed like a fairer approach.  However, upon
further reflection, I realize this might not offer tangible benefits and
could introduce unnecessary complexity.

Since the DAMOS Quota min_score mechanism already ensures that regions
truly needing action are prioritized, the current behavior (eventually
resetting at the last region and moving on) is functionally sufficient
for typical workloads.  Therefore, I do not see a strong justification
for this change at this stage.

Thank you for pointing this out and pushing me to clarify.  In the next
revision, I will drop this changes and focus on the minimal fix for
Problem 1.

Best regards,
Rui Yan
