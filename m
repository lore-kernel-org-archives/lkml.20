Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511273AFB18
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788030201; cv=none; b=cc6TmjAKlH7/BCrsfaNLj5gqpP77KEKAWWD5xbMDvPUGZqWoieNhbnRGYMhcdYSJM5OIXtuc6KBQZn1340ZkXipSOcEZNPmzBaRBXz4PBTZd2Q1dR4MAWhHJkC5WvW5RRnhROtRhurL9NXDtP9MeNhk90gKfZITQni9isTRLE1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788030201; c=relaxed/simple;
	bh=TIh4DOnD+S/iXHsrfiIEXNJifWn+ISjtMrnm++DfHQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XO4K9fPAfYQ52VYho0aPnzoIQytbuOXdlYv4CV4wBwc5H5MkI//wa9KI8EHEvcabZlo7o+1sXVwuRAEXLQ68AsRv9YFd/1bfcKzSiO0JnC/K1ehFk7OPVzFKwjnHj8OTJV5RURyKVuQH2SIrqI3ZNseIQa7JQP8ORJ3hbvbmO7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHwNax/x; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHwNax/x"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ce7d2adef4so32491815ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788030199; x=1788634999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwBa+9bQ9e6n2dIJ1FHVXbNuvQY4O8W1fjuVGTSJWDM=;
        b=rHwNax/xGH5RNCmO73Uz+d8CXObAOns7PN9z+pQAIALA4xDb1O0ElYqqsfUZDvdwCJ
         DsRd75piWpwTsMcNnEOo6u913+e2Iavm8PjLrA7hMRE0aaC6z+ZcRSiSOvCLkGscdTTs
         lUD/KDSix4+LRELTVf3/whOB+BRKO9RMSZE9REJ9Fju9IaEiC1gVbzN4QonS5zs40nru
         OaFsK6orOAzx/ksFkNDB6qaeQsv5wshBrNKwh1HxZu8vJb7GhnkKPGBb90jWHSErw5N1
         VG4Br6ENhyjUZZQkiSz/o5SuJ2xYkOwhAtRsiHLSSQuVunexPnL/D7Q8x+1iEcDZWFcI
         MxMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788030199; x=1788634999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pwBa+9bQ9e6n2dIJ1FHVXbNuvQY4O8W1fjuVGTSJWDM=;
        b=bCYwNEHIylyd+Ku9RbExdLMdsRZ3VQHvkbI1Rc5yM9uXpArcHvDleFTMQ+xRDZg9bb
         ovQiaZUZQE2mH3XDsZ/0lhcB40KlZQOK1BOasfoYP2WZP3oUZotYtBMKfvmBzywXHyN7
         GlcCRsbUvJBuqF5toovlBNgeMCHTNjBoWHLASHpRxKin9aXTEpKxa91kBzJssl2s/BNb
         FX2rRZBAMhOo4qnDEtgwkrnJsV2MMjTFCUy5OwdYlRzP1j2o7zxm5iNp1Ze6DomsGZPJ
         tBHkTZLFHIszHOSq5M0OxAnSdThcb3iiXmTCWHjdw0eQFN6dLIBgA52op8hI0NV3viSS
         CzWw==
X-Forwarded-Encrypted: i=1; AKwUvBxjG1V6zpgA7CJrii7PiSfsjqaedLvJl0Yw+OOtZtvdohPD+8JnL0/h19DQPop1rQInk20sFK0syG0RjVw=@vger.kernel.org
X-Gm-Message-State: AFuF++lvZMqZA4gcQnFZWkAv3UzWYYQJsDY7bc06bPopkPT1VynzNYMv
	xJ+DlNQDlWVexrlwcnsnGNVaxm8FYwPuXwDvNkmownolKvF7Sj50cpjQFlf9Pg==
X-Gm-Gg: AYBFou2A7c14ZKheUC/a3k5ZuAJEtSXhmbq4iHc6F4+z5THSztw8xkGoThafzelu+DC
	gcyy8/v2wM8cvuDTrljHZI4CGGLoAEDB0lfmJwjLNAFS82OgrggjjEr2a7AWKYs+/gB2pPFU3Y4
	7keFlYfsNpZI0rYEcW29BQXAM4ytwpkj2xHd2u+hDXAqtrXwleq6TFM988BxYA9qGc0yhxj1nU8
	8X7dRcIqlUJnpbV5wFpgtvIpHwd56RyJnTkZxFW5hLjXTc+jKKQ0s0AKVfuiWiPoyPitUhYHIQg
	nKxBcN3iDB+40Czm/O+HB7Ecgb9Zd489HCCmSEjhnid/jRiu/wYrHFDbGRFIgZcrs7ZXMn4Vykw
	YT+HtFOd+GMH3QiNhdjV7EnOLh1Sljgnk3/uzXF5LMO0g5bsLzo5k6CLLl77GGq4GFN6wniUlhu
	WseZWOUAEo7cydv0fEO+gFvR5gLEHk2sxVcNH1AZL4O+qx6Peft9WsjuWs/qP4G44JjyA2TbrW1
	eo22IlEZ2t7Vely
X-Received: by 2002:a17:902:fc4d:b0:2d8:d4cc:5bb0 with SMTP id d9443c01a7336-2d8d4cc5d79mr139929965ad.16.1788030199448;
        Sat, 29 Aug 2026 12:03:19 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d9055ddfdcsm900305ad.18.2026.08.29.12.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:03:18 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/damon: fix unconditionally skip last region
Date: Sun, 30 Aug 2026 03:03:27 +0800
Message-ID: <20260829190327.17400-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829161509.77406-1-sj@kernel.org>
References: <20260829161509.77406-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 29 Aug 2026 09:15:08 -0700 SJ Park <sj@kernel.org> wrote:

> On Sat, 29 Aug 2026 16:34:26 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > On Fri, 28 Aug 2026 11:29:09 -0700 SJ Park <sj@kernel.org> wrote:
> > 
> > > As you replied to Sashiko, let's do the last region handling in every case.
> > > While doing that, let's do the charge_{target,addr}_from reset in only one
> > > place, like below.
> > > 
> > > '''
> > > --- a/mm/damon/core.c
> > > +++ b/mm/damon/core.c
> > > @@ -2688,36 +2688,40 @@ static bool damos_skip_charged_region(struct damon_target *t,
> > >  {
> > >         struct damos_quota *quota = &s->quota;
> > >         unsigned long sz_to_skip;
> > > +       bool skip = false;
> > > 
> > >         /* Skip previously charged regions */
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
> > > -                       return true;
> > > +                               r->ar.end <= quota->charge_addr_from) {
> > > +                       skip = true;
> > > +                       goto out;
> > > +               }
> > > 
> > >                 if (quota->charge_addr_from && r->ar.start <
> > >                                 quota->charge_addr_from) {
> > >                         sz_to_skip = ALIGN_DOWN(quota->charge_addr_from -
> > >                                         r->ar.start, min_region_sz);
> > >                         if (!sz_to_skip) {
> > > -                               if (damon_sz_region(r) <= min_region_sz)
> > > -                                       return true;
> > > +                               if (damon_sz_region(r) <= min_region_sz) {
> > > +                                       skip = true;
> > > +                                       goto out;
> > > +                               }
> > >                                 sz_to_skip = min_region_sz;
> > >                         }
> > >                         damon_split_region_at(t, r, sz_to_skip);
> > > -                       return true;
> > > +                       skip = true;
> > >                 }
> > > +       }
> > > +out:
> > > +       if (r == damon_last_region(t)) {
> > >                 quota->charge_target_from = NULL;
> > >                 quota->charge_addr_from = 0;
> > > +               return true;
> > >         }
> > > -       return false;
> > > +       return skip;
> > >  }
> > > 
> > >  static void damos_update_stat(struct damos *s,
> > > '''
> > 
> > I noticed a potential subtle issue in the suggested fix above:
> > 
> > '''
> > +out:
> > +       if (r == damon_last_region(t)) {
> >                 quota->charge_target_from = NULL;
> >                 quota->charge_addr_from = 0;
> > +               return true;
> >         }
> > '''
> > 
> > If 'skip' is false (region should be processed), but it happens to be
> > the last region, the condition 'if (r == damon_last_region(t))' would
> > still be met.  This would cause it to reset the state and 'return true'
> > (skip it), which inadvertently re-introduces the original bug we are
> > trying to fix.
> 
> Ah, good catch.  The 'return true' is a wrong copy-pasta.  Let's drop the line.
> 
> > 
> > To ensure the reset logic is centralized and correct, I refined the fix
> > as follows.  The comment is intended to help you and other reviewers
> > quickly understand the rationale behind the compound condition.  I will
> > remove this comment in the next revision.
> > 
> > '''
> > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > index 644daf5a1656..82c5aed8a417 100644
> > --- a/mm/damon/core.c
> > +++ b/mm/damon/core.c
> > @@ -2342,36 +2342,48 @@ static bool damos_skip_charged_region(struct damon_target *t,
> >  {
> >         struct damos_quota *quota = &s->quota;
> >         unsigned long sz_to_skip;
> > +       bool skip = false;
> >  
> >         /* Skip previously charged regions */
> >         if (quota->charge_target_from) {
> >                 if (t != quota->charge_target_from)
> >                         return true;
> > -               if (r == damon_last_region(t)) {
> > -                       quota->charge_target_from = NULL;
> > -                       quota->charge_addr_from = 0;
> > -                       return true;
> > -               }
> >                 if (quota->charge_addr_from &&
> > -                               r->ar.end <= quota->charge_addr_from)
> > -                       return true;
> > +                               r->ar.end <= quota->charge_addr_from) {
> > +                       skip = true;
> > +                       goto out;
> > +               }
> >  
> >                 if (quota->charge_addr_from && r->ar.start <
> >                                 quota->charge_addr_from) {
> >                         sz_to_skip = ALIGN_DOWN(quota->charge_addr_from -
> >                                         r->ar.start, min_region_sz);
> >                         if (!sz_to_skip) {
> > -                               if (damon_sz_region(r) <= min_region_sz)
> > -                                       return true;
> > +                               if (damon_sz_region(r) <= min_region_sz) {
> > +                                       skip = true;
> > +                                       goto out;
> > +                               }
> >                                 sz_to_skip = min_region_sz;
> >                         }
> >                         damon_split_region_at(t, r, sz_to_skip);
> > -                       return true;
> > +                       skip = true;
> >                 }
> > +       }
> > +out:
> > +       /*
> > +        * The last region may remain unapplied for extended period due to
> > +        * various regions (e.g., it is invalid or has been filtered out),
> > +        * preventing other regions from being applied (those preceding the last
> > +        * region and all regions with different targets).  Therefore, when
> > +        * encountering a region that needs to be processed, reset
> > +        * charge_{target,addr}_from.  If necessary, this parameters will be set
> > +        * to the correct value in damos_do_apply() due to quota is full.
> > +        */
> 
> Looks too verbose to me.  Let's drop this.
> 
> > +       if ((r == damon_last_region(t) && skip) || !skip) {
> 
> Why this becomes this complex?  We should reset charge_{target,addr}_from if it
> is the last region, always.  Am I missing something?

Thank you for pointing this out!  As long as it is the last region, we
should reset.

> 
> >                 quota->charge_target_from = NULL;
> >                 quota->charge_addr_from = 0;
> >         }
> > -       return false;
> > +       return skip;
> >  }
> >  
> >  static void damos_update_stat(struct damos *s,
> > '''
> 
> > 
> > > 
> > > Btw, I think damos_skip_charged_region() may deserve a kunit test.
> > 
> > I agree that a kunit test would be valuable.  While I am still getting
> > familiar with the kunit and it might take me a little time, I plan to
> > work on it.
> 
> Nice.  Looking forward to your patch.
> 
> > 
> > Should the tests include these scenarios?
> 
> Let's not add new topics.  We can discuss this on your kunit patch.  Please
> ensure it covers at least the corner case this patch is trying to fix.

Okay, I will ensure that.  Should the test be sent along with this
patch (as part of the same series), or should they be sent separately?

Best regards,
Rui Yan
