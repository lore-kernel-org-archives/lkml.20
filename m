Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E981A238F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787810060; cv=none; b=f5GNnvV7D209oNDx1+3CaeqN62kejMBP+2m9NJKlFUtMknshBXZkMmj7PVHkMQLOUgSn7uapgvHTuWL3ILaPQdD8ie5bWEPDzN+j6g2NpMDXYOhQfl87occPQn0WgTOiEu4qKZOlwscNXMJS/qS6EHj4Jb6qnTZcfeADbkyEPlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787810060; c=relaxed/simple;
	bh=fez0YwzSVBn5tO9zzq6eY6fAetQpiAth7VVLFi/VlxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rZJpQEmOMtrDDmc+YqYjrIupBAOt4e8K6o7ZG1IH0poyTLXPp8ETg0hmt+wWf+LuYMJOGBzx+9xc7Ttn4XZzQbEkFJ7DNgzrtG4mWGAKxiO+V1OyUG92XXQsjOUgnRLCktt6ruOu0jitz8q5X2uGs3Wh7ViE542kAy6487TAKTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsfw/vnp; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsfw/vnp"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so494615a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787810058; x=1788414858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=plMv1alWLSmRUs996GTzyKVxl/InS+Hvvr87SnLX3mc=;
        b=jsfw/vnpcLnai21A9zKVW8mZxnMzkhJzFXKzhpUh1wI8l8xts+Iy2rPFjqnOREBq7H
         PrPhbZyYmFRTTX/LQGKItxh8NaSdRvH/vTXKb+9SW100lSejf7u6JBQ7hL8lFpjDAilX
         +hWr/WkDPP5P5D35wFOkbu7SC+ctudvGAArJHrd3Alf6WTjbmAM3zm6Zd63FOLYfNU/u
         XvEYYnyXePZMIDrej9V3LGJeRllRSHc1fL7aOOBbcU5M/9QHehZ8nthTq/HYvrUBfNiD
         M0VpK7UxVaHir61VmJmrbWaQ7cz0qljlBBfVc+8QSPtEBxROp7EFqEE9ubgLXVoFWjo8
         b/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787810058; x=1788414858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=plMv1alWLSmRUs996GTzyKVxl/InS+Hvvr87SnLX3mc=;
        b=bI11lm9pV05l8upKsv5Cs4XYrAZ6B74YtksWKp27AmxqGoJvqqch9VjtYqRgN4AC1N
         kok0XvjPNvzg9UCw7I9dePu9sO1FoSJGG6ptd1+qb39lDXG42jkC/MHidrs3S2U/WpMM
         5K1+PPC6oHTuqXnwcJSOIzWtlxokY3UbXHqv1Wsev5G1RB6uTCQkPgbIlmYHcLaQD1pK
         Ki0LHLsDKkcuq4Zf9cPGC2JEefJjXka7kT9Vo9HSIAf4YQM3kevo0zaI0kNc5cLtrrl2
         /QkDmMcFnhfo/C280Sb3vELmuGwTStEc6qWDgdo3Q39VDAddB7CteEXTqULFIPcPfWKG
         gKVg==
X-Forwarded-Encrypted: i=1; AHgh+RphWOSPK+56zRNj3cQtqjvXzBygEI4T7P9KSlbu3raRfgaVbCW0c2ibVLM0kSysprpHNT+D3fpGUZj2uWY=@vger.kernel.org
X-Gm-Message-State: AFuF++mpEqMjznuya0PCbucy4LyTpi6qULGRgDdY6KtW1famx1OW2xsH
	7RJUjyWz7T460x2HOm+rWaEuzYo6qsEmRxgx1tO1ltbQpuoc2A6Y5ja+
X-Gm-Gg: AR+sD109riV1srsBI6oMawcX6VvgLB+HGASJEf+6232gcLxJdP/Aczbs+cUXwDiWJH0
	8cTLAaVB+cZdEUosnK5u+GFT56uK8hP5OS7RSpjt6EUxm7JZLR7tdXQWe3T0YlIK9UHU4wBkpy1
	FTVCC61Md79EQcf7mHvWxFKHWg98Ku6yjkzRw/gt+JfTiTj9/n1BpaOi+n/6ICvLtSx0xONUA5Z
	IpfkTYkuKFLHejmMIs7vFERrfN4JRWswGn8l2EksRbOuhi7X8YpHtB3qoak6ZF1TC8BPlIW8JqB
	6Nh3TyZf9BLBXRauYV843WCxeidQAr5eVzAiHlVs/l+WjQlfSwyMARWaDsDaNqEact9SZP1K1dV
	sstaOHJTMt2E5tL3cdF6I+K1QOClY7nbekn268hFl0RqvSQpD5BD7YznVlOtavp+AdY7IweFc/o
	9cqwUBT1DR/yQyMQPHfHF9IECiraMrzngPiBOc0qPzrPIxKDL7qeXsNjrEQrkfLnzqnSeddnzHA
	alW
X-Received: by 2002:a17:90b:17d1:b0:38e:8300:af51 with SMTP id 98e67ed59e1d1-3966d20b09fmr23255966a91.8.1787810057653;
        Wed, 26 Aug 2026 22:54:17 -0700 (PDT)
Received: from celestia ([2402:1980:88cd:27c4:5897:46d2:587d:19e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b112b57bsm1361107a91.17.2026.08.26.22.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 22:54:17 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mm/damon: fix damos quota walk-position tracking
Date: Thu, 27 Aug 2026 13:54:26 +0800
Message-ID: <20260827055426.16874-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
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
revision, I will drop this changes and focus  on the minimal fix for
Problem 1.

Best regards,
Rui Yan
