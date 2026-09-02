Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22DC13AF2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390785; cv=none; b=eqRMPZBfy6FKvvjzSthsY7wYsABr8ghO4wkuqZXxX7cHUWemTHze+Q+1ddJ4A7Yz4lIvCxPnxfCi1Q8L1JKZzNzoDoDr7StqyJUr7UqthtGQ+tfErbn6LQskt6MIqAs/bsJ4XwlF07WOSSz98j6xUgdzAcOZY2hDVG2egj+EV+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390785; c=relaxed/simple;
	bh=JMFpftqvtzAK7T6uDBXYST2tNQp4P622trlIeP6sid4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1BrnGi6TMmdXOEvTvZr2R1RTZxJyR9/0fKrKTFW4Zf7RcZuZYrwW73vhAqtwF2g1zPC5+/88BZMISBbTWY6Thp01QxHaSxuP5AueHHWLXSK7Aq28/+eWkpJjL3eEIQNKbFbd3umpDaHT3SKA4Y7wg/MtEiwfeVjQ7swWoeMwSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNTkHdwq; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNTkHdwq"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso1988629a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 16:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788390782; x=1788995582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oANsTqPYV0zfdfhrNmsez3y2Ei2vdqKIizOLng4NKB4=;
        b=ZNTkHdwqTxJbayOqUTElXNo0mCcIDwN8p8BapexC6975akzcrgEbEEckza53K4eXF1
         fwHkbjJztfZTYvlljUmuZw/dzuVwa8U3CwycG+qeK0n9l6Q347E3CgXB7L/kjfYCYxGG
         GIwupCvR94cnLEJ3ZPwKWwI4fzVvQFNIXHYLhA2XgWfZBZea3y5RmjS3UaGFdAOTv0AV
         qfd6lwEnEn3XhlBFqkokJAcZTBhSjjAGvxojwIjylmYyM2dO7aORI4ZwmEoXobIOC1NK
         QND7uMdgop+jC/xT1lx/CrH3JhMM3Zfd7QyVvwEwv/q2Sblupm+d2SACA4+dQe6B/dXq
         Cj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390782; x=1788995582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oANsTqPYV0zfdfhrNmsez3y2Ei2vdqKIizOLng4NKB4=;
        b=k97daJ1u5psVzR5zktSe5njWAbO1nauYldDpe5brK/YWQen7ngsOgv7Tt0aV0xbebv
         703NZYIuNyBmsjU1ecU+PAPgP4tZxEOiU1MZYz/TleQn0VL1CbYRgXMXxR0B7jNYS1h4
         olrsWTJjPxGRO8hDaZkWQDyUpgZC8IHLNTcNx/PkORxkvlpyGrfmroxWy1r6sAZgaofQ
         npTThR1JvjvH2hpptpwnEYxLRXUnbOfG+qUh0xDqaP5I5ik48/cg+XcgKqTEYn2xtPTa
         BxdW0QNk0rE5Is9hFzq/MbqJ8h5btnoWf8SIJhS1OEOqT7quEdq1J5h4pwURBQkshH9Z
         T9oA==
X-Forwarded-Encrypted: i=1; AKwUvBxYhleS2Y0Y0crhdcw6BOHeP42bhouF+cCUlUfRTurwoVyFlETIGDezOzhWIsPn6gDPP3uLyeV2geCGKmg=@vger.kernel.org
X-Gm-Message-State: AFuF++l9TXRndQ9ygVlFgH8Ysj8/Os7WZWaaQ01ebQ1miOV3CHAT9m0f
	4X8t3AAagcT+YpLCFJ6iEz50lmWZhNsT5PJU/WrbVNhwO3fx3uUmbBb1
X-Gm-Gg: AYBFou2LewH70T9Bhlsx7ZAfhYbkmXM6Hrj/HOBVOWmo4fbd3wzxYIUPvnd/4wC3LtB
	TwMyzytqtL7p8y/LQKuF4MJjtROVic9SrRwdcCPHc6ncQt0YUMFZXglOj1wOdStL4Huz+Etm8s1
	F6cDZRkKWVq7KeKU+2l4py9/i73LTM858Mf3kOMXyhTdsGBZo1zHOslxAVCXErJa0XT68cxUJLK
	h1aWfg1KrfIL3/eMVMxSb3Dn9Y/VhMHZAIAGVt0PXykT9kENaBudgVDiWE5HZcZDU/seswXa2F/
	8DLaxGIRWOS+HAJDGvptpFYp6Vxs5hmuHfj9Or4AW0fysjDWzDqhaeUD4uEII3i3xjvjoVBASdR
	rRmjoAiCpp/aF28h+gq0EOMJPKzSjDcfDRMalvUigERfPmDB3DzFcuEg5xxLB4L0s2QOe+roFLo
	ylts0YnDYtH8Jj1yrrxV2iq7fai75B+KNR5SAmYfBJWdb/M+V0ya1k8GUEz4UJ36pu
X-Received: by 2002:a17:90b:4ac9:b0:398:9bd5:490c with SMTP id 98e67ed59e1d1-39aee0b498dmr10034854a91.19.1788390782043;
        Wed, 02 Sep 2026 16:13:02 -0700 (PDT)
Received: from celestia ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b083f04d1sm1501603a91.8.2026.09.02.16.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:13:01 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sj@kernel.org
Cc: aethernet65535@gmail.com,
	akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] mm/damon/core: allow esz to be set to zero
Date: Thu,  3 Sep 2026 07:12:15 +0800
Message-ID: <20260902231311.17490-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902150301.88535-1-sj@kernel.org>
References: <20260902150301.88535-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 02 Sep 2026 08:03:00 -0700 SJ Park <sj@kernel.org> wrote:

> On Wed,  2 Sep 2026 22:35:20 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> 
> > On Wed, 02 Sep 2026 07:13:48 -0700 SJ Park <sj@kernel.org> wrote:
> > 
> > > On Wed,  2 Sep 2026 16:20:50 +0800 Liew Rui Yan <aethernet65535@gmail.com> wrote:
> > > 
> > > > When the temporal quota goal tuner determines that the goal has been
> > > > achieved (score >= 10000), it sets esz_bp to zero so that the effective
> > > > quota (esz) becomes zero.  However, damos_set_effective_quota() clamps
> > > > the quota to min_region_sz, preventing the quota from ever reaching
> > > > zero.
> > > 
> > > Where in the code it is clamped to min_region_sz, when?  And what user issue
> > > this can cause?
> > 
> > In damos_set_effective_quota(), when quota->ms is set.
> 
> Please clarify this kind of thing (when quota->ms is set) from the next time.
> 
> > 
> > '''
> > 	if (quota->ms) {
> > 		if (quota->total_charged_ns)
> > 			throughput = mult_frac(quota->total_charged_sz,
> > 					1000000, quota->total_charged_ns);
> > 		else
> > 			throughput = PAGE_SIZE * 1024;
> > 		esz = min(throughput * quota->ms, esz);
> > 		esz = max(ctx->min_region_sz, esz); /* <- HERE */
> > 	}
> > '''
> > 
> > This is a minor issue, the main problem is that it doesn't match the
> > description in the documentation, which states that if the goal has
> > already been [over-]achieved, the quota will be set to 0.
> > 
> > Original documentation:
> > 
> >     - ``temporal``: More straightforward algorithm.  Tries to achieve the goal as
> >     fast as possible, using maximum allowed quota, but only for a temporal short
> >     time.  When the quota is under-achieved, this algorithm keeps tuning quota to
> >     a maximum allowed one.  Once the quota is [over]-achieved, this sets the
> >     quota zero.  Useful for deterministic control required environments.
> 
> Thank you for clarifying.  Please clarify what is the problem like this from
> the next time.  Without it, reviewing spend unnecessary time.

Noted.  I will ensure future commit messages and descriptions clearly
state the triggering conditions and potential user impact to make the
review process more efficient.

> 
> I feel like your recent patches tend to lack such clarifications and spend
> unnecessary time for reviewing.  If you unsure, please ask questions first or
> use RFC tag at least.

Understood.  I will use the RFC tag or ask questions first when the
nature of the issue is ambiguous.

> 
> I agree this behavior is not matching with the documented one.  The point of
> quota is making DAMOS not unnecessarily aggressive.  Hence it is designed to be
> set as minimum as possible.  How about below?
> 
> '''
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -3485,6 +3485,7 @@ static void damos_set_effective_quota(struct damon_ctx *ctx, struct damos *s)
>         struct damos_quota *quota = &s->quota;
>         unsigned long throughput;
>         unsigned long esz = ULONG_MAX;
> +       unsigned long esz_time;
> 
>         if (!quota->ms && list_empty(&quota->goals)) {
>                 quota->esz = quota->sz;
> @@ -3505,8 +3506,8 @@ static void damos_set_effective_quota(struct damon_ctx *ctx, struct damos *s)
>                                         1000000, quota->total_charged_ns);
>                 else
>                         throughput = PAGE_SIZE * 1024;
> -               esz = min(throughput * quota->ms, esz);
> -               esz = max(ctx->min_region_sz, esz);
> +               esz_time = max(throughput * quota->ms, ctx->min_region_sz);
> +               esz = min(esz_time, esz);
>         }
> 
>         if (quota->sz && quota->sz < esz)
> '''

This solution is much better than my initial approach.

I will incorporate this change into the next version.  Thank you for the
review and the improved fix!

Best regards,
Rui Yan
