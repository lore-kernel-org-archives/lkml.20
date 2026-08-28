Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D8318C02E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787882064; cv=none; b=gJDTXq9o3lYv/1HVhCXeby54mss51Fw5uD3p1FjDbfJNC06PryIe6KTfrm4LjwWWLWbM9r5vzcFsTAEwoxddaUF06x5sUPisVA+XVui6yjN+OAHssaGd//WAhDBGa+vZlZCXAJteHdHMB+dzONa1yVl5YGK80GWBQ2cmSfB/zhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787882064; c=relaxed/simple;
	bh=WgDaZMAxyleJ8NRjkYHlGR996RTyM8XrdfZXTCw4nn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HtckIghj1ADDcRgooQ8P8u717VfxASEwm2V+2sELO6ohoOKACqNx35LQ6+2rHBYBLItg1IRxeLHlKK+Zz6KCkYhE7aSG7cYjYgmTNwctq3Ksoa4FwIuNXZ7miQ2Ow8kLAhpS1urNlF0CzxgD4IjHIsznSi1MUZPX+6iPJhncnqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgNbK/RJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgNbK/RJ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84830c774a0so736726b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787882062; x=1788486862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vd9OkwVydrqNipxeyj51CTYPIro5FcNJ7G6Zlk0IYLY=;
        b=PgNbK/RJ9KGfUEiUe2Tz+hAJjUCQPM3qBRSb0NuMwL+hKp324UQqjibR1f+8mZcncB
         FB+0lwssOYK2bm7asxTXlwhjFEkk0xnX0pMzPDovEBUtLylk17vq7yJa5bitOTBR+aOg
         H+I4/xhvvHG/9vZ1dpE98JdHwz4XBjFWE4OnYC9Zf1m4h+G9lSsH+tki19b3tgxUGyr+
         MuUw2Ueow7zbCO5Ih+YxutkQpAOb+uBf2CJh40VNAWWT/8TKFpdAQY2ap17w22KQUvs8
         YjlxKCmB0P4cpyb9/fLEj2tgJDz++QiaoV6dDEbgIHljjUm0JCL5hHC8sfrfrkSjqh07
         Lnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787882062; x=1788486862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vd9OkwVydrqNipxeyj51CTYPIro5FcNJ7G6Zlk0IYLY=;
        b=ZxJlkYl4U/6sOB36v+V79rL3oEvyQBroWRiAf2qnXyE7jqyfv0MF84Vhi8ExDRrF9j
         lfGWyDKNQ/uNV3eaQQM+7JAJf8rHmHHU+xTbXByIy0Kimk+wyA9qBa9UAo9kq+I16Qwr
         qORxYG+aXjM7Txu0Gs+VZYsX9UZcsppaK+hf41ocFEx4QNOEE6+uJjmBAUeV3NLKNjcD
         33m8F6D8EhPXlYvqWaeds2clGUlRxQL1rf4bAST68t3ppU1lIwBthxSoBkw1iI4zqLkc
         vb8gzxJ5icYsc4u33I4bxYLztA9GkqgtFVhDdpBLo4UxKnOSvFYjrKQhDiBtbz8/Rk4Z
         GIaw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9H0oPFMKnmj/QbzRyAx9R1/1ecyTkfI78I7e0s87+SvajTITepUTgEqiHgrjpEq2u75buues+rfQga3U=@vger.kernel.org
X-Gm-Message-State: AFuF++kN3rz8Y2mAnlajsPPKYZ1Uv2HOKfJQqid29o7l0+ILPElinTgj
	IgkjVvoFHvINNTLPCYW0NHdng2KMazlyryPES8BDh6hBQWKec/A6aKk7Ww2bYQ==
X-Gm-Gg: AR+sD13DpgAFnMOUQJckoqlR8pyV43m2O538IQA7AT9e0PHfHQmjYVJv371B7KC+PuI
	KetJCYxjCMoVd1O0OAIkoke/CaoAmr+ZIY/zQMh67cpzDIvDzmgAyeiaZU5MKYv76QrWQAbmSrs
	6W5qQlS+a7C2k9bHQ7z6MBPCSif7kwRLyXPL4jBY88HzjCUDNs8EOI9c6buVkzeDMhXW7TRYskl
	spLgFDBJlkNHmOotaOxpKStyLWmyWM3t1tzQnpRlWURyHeAVRYzcGeDBikGvxCZKks/y/uRB8Ux
	87ydjZOROwnqaZ+3nwGL94rnUplw5lFDN7qWqQHCj+YZUfgwSwM16BFDuHGHuzrCSdL9K5cT4UJ
	fpPQkIqWc9VGUQ1JUYNQtbzLaV2DdmOoMZgtguVPbboytaQ2s1SGqnAcYSZL5Z2iS83THROkRt7
	0HmRUHjdDcnVtFtgE1rDmSrnJW9yNxr+lGQdbs96QfHqEAxowEoZuitTI84pQnbfHTQA==
X-Received: by 2002:a05:6a20:158d:b0:3c8:d3a4:7b40 with SMTP id adf61e73a8af0-3d266ebcbb6mr5931228637.2.1787882061816;
        Thu, 27 Aug 2026 18:54:21 -0700 (PDT)
Received: from celestia ([2402:1980:88cd:27c4:5897:46d2:587d:19e7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312146sm58242a12.8.2026.08.27.18.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 18:54:21 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH] mm/damon: fix damos quota walk-position tracking
Date: Fri, 28 Aug 2026 09:54:29 +0800
Message-ID: <20260828015429.131338-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828004049.62386-1-sj@kernel.org>
References: <20260828004049.62386-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 27 Aug 2026 17:40:48 -0700 SJ Park <sj@kernel.org> wrote:

> On Fri, 28 Aug 2026 02:08:22 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > On Wed, 26 Aug 2026 17:44:38 -0700 SJ Park <sj@kernel.org> wrote:
> > 
> > > On Wed, 26 Aug 2026 07:05:08 -0700 SJ Park <sj@kernel.org> wrote:
> > > 
> > > > On Wed, 26 Aug 2026 18:24:13 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> > > > 
> > > > > On Tue, 25 Aug 2026 06:54:57 -0700 SJ Park <sj@kernel.org> wrote:
> > > > > 
> > > > > > On Tue, 25 Aug 2026 20:46:16 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> > > > > > 
> > > > > > > DAMOS uses charge_target_from/charge_addr_from to remember how far a
> > > > > > > quota-limited walk has progressed.  The current implementation has two
> > > > > > > problems:
> > > > > > > 
> > > > > > > 1. Once set, the cursor unconditionally skips and resets at the last
> > > > > > >    region of the tracked target, so the last region can be skipped even
> > > > > > >    when it has not been processed.
> > > > > > 
> > > > > > I don't fully understand this.  Could you please clarify more?  Maybe adding a
> > > > > > realistic example scenario would be helpful.
> > > > > > 
> > > > > 
> > > > > Problem: Unconditional skip of the last region
> > > > > 
> > > > > In the current damos_skip_charged_region(), there is this logic:
> > > > > 
> > > > >     if (r == damon_last_region(t)) {
> > > > >         quota->charge_target_from = NULL;
> > > > >         quota->charge_addr_from = 0;
> > > > >         return true; /* Skip */
> > > > >     }
> > > > > 
> > > > > Scenario:
> > > > > 1. Target has 2 regions: R1 (0-100 bytes) and R2 (100-200 bytes).
> > > > > 
> > > > > 2. Quota is configured to process only 50 bytes per window.
> > > > > 
> > > > > 3. Window 1: Processes R1 (0-50).  Quota is full.  Cursor is saved at
> > > > >    (Target, 50).
> > > > > 
> > > > > 4. Window 2: Skips R1 (0-50).  Processes R1 (50-100).  Quota is full.
> > > > >    Cursor is saved at (Target, 100), which is exactly the start of R2.
> > > > > 
> > > > > 5. Window 3: The loop reaches R2.  Because R2 is damon_last_region(t),
> > > > >    the old code unconditionally returns true, skipping R2 entirely and
> > > > >    resetting the cursor.
> > > > > 
> > > > > Result: R2 is permanently skipped even though it has never been
> > > > > processed.
> > > > 
> > > > Ok, makes sense.  The user impact should be not that big, though.
> > > > 
> > > > > 
> > > > > To fix this, the patch advances the cursor every time a region is
> > > > > walked, regardless of whether it is applied or filtered out.  This
> > > > > allows DAMON to accurately track whether the last region has already
> > > > > been visited, eliminating the need for the unconditional reset.
> > > > 
> > > > Sounds like a big change compared to the problem.  Why we cannot modify the
> > > > last region case?  Have you also considered other possible simpler approaches?
> > > 
> > > For example,
> > > 
> > > '''
> > > --- a/mm/damon/core.c
> > > +++ b/mm/damon/core.c
> > > @@ -2686,14 +2686,15 @@ static bool damos_skip_charged_region(struct damon_target *t,
> > >         if (quota->charge_target_from) {
> > >                 if (t != quota->charge_target_from)
> > >                         return true;
> > > -               if (r == damon_last_region(t)) {
> > > -                       quota->charge_target_from = NULL;
> > > -                       quota->charge_addr_from = 0;
> > > -                       return true;
> > > -               }
> > >                 if (quota->charge_addr_from &&
> > > -                               r->ar.end <= quota->charge_addr_from)
> > > +                               r->ar.end <= quota->charge_addr_from) {
> > > +                       if (r->ar.end == quota->charge_addr_from ||
> > > +                                       r == damon_last_region(t)) {
> > > +                               quota->charge_target_from = NULL;
> > > +                               quota->charge_addr_from = 0;
> > > +                       }
> > >                         return true;
> > > +               }
> > > 
> > >                 if (quota->charge_addr_from && r->ar.start <
> > >                                 quota->charge_addr_from) {
> > > '''
> > > 
> > 
> > Thank you for the example!
> > 
> > While your approach works, I am curious, why should the cursor be reset
> > every time the function returns false (does not skip)?
> 
> It doesn't.  It resets charge_{target,addr}_from only once after the regions to
> skip are all skipped.  Am I missing something?

You are right.

My concern was that the current
'return false == reset charge_{target, addr}_from' might be a bit hard
to understand.  However, I realize that my change was quite significant.

To make the existing logic clearer for future readers, I think adding a
brief comment would be helpful.  For example:

'''
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -2368,6 +2368,15 @@ static bool damos_skip_charged_region(struct damon_target *t,
                        damon_split_region_at(t, r, sz_to_skip);
                        return true;
                }
+               /*
+                * Reset the charge_{target,addr}_from so that the remaining
+                * regions in this/next target can be processed normally.  If
+                * the quota becomes full later during the walk,
+                * damos_apply_scheme() will update the
+                * charge_{target,addr}_from to the correct position.
+                * Otherwise, it implies that all applicable regions in this
+                * target have been processed.
+                */
                quota->charge_target_from = NULL;
                quota->charge_addr_from = 0;
        }
'''

If this is not necessary or redundant, I am perfectly fine with dropping
it and just applying your minimal fix for the last-region issue in the
next revision.

Best regards,
Rui Yan
