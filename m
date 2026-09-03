Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0352D49E5D9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440610; cv=none; b=W9mMo5Tr32SF90eqSUXkbeGpL0ykGjBD4p3T4jdmbLJFVNaOwqLjMozmxun4STMQANoQAtLye50kOUdbvkCU1Q/qsHrfc9STLPbCmdUGawUS/m6C9+F1UYbmxtsSKP0WDzSNzKykyf6rfVMB01QYJr4NdzgdX9rj4wrxUJIGhig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440610; c=relaxed/simple;
	bh=ob5eiYeuCZYsXL+A7MdawzkLmkoUvOE4FfKBJ4ZMYwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geLQ8IM+1/OyPSn0iHJwV2n1hf8IOWcvXKO5dbvbmF/zOyTxpJYz4U6RMOXRpJnoXcLLiyf/2yxTP5hVpn4FD9QwvE2oiumuXpkzUwp+xWJZN/ysDduE+wiBp4PJ7hAQ9O/xbXabQJaq2rSN/PW5t5qXtcID9V62EUj5s3ZbApM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=f7DGtZxt; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="f7DGtZxt"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-855c26cf490so20714237b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1788440591; x=1789045391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ob5eiYeuCZYsXL+A7MdawzkLmkoUvOE4FfKBJ4ZMYwk=;
        b=f7DGtZxtmhw/wqwy9QoMIHqIfNkGFoqZMTQV8P5CXTgCr8bdshtGyydGyotkf7AZKQ
         LXiyKDsEs/rzErnBdOOjemscXrSVSYDKo5vaMN6qm18mkq9w16BdkdcEu14/lH288mXz
         IW1oTmt/rYlsgXOtXw4zcZveomGhhUxlub3nM39CQWs9Uiijk5PcftFOy6EHCq/zzdpb
         lly73CJBVqTwvhtHiJwcnVkj/REHLeLxZm2VHe4FRRH3jmdwmZMRLFCNLCbbHdnymdrC
         QK1jS07kGkXtV6XSd2s/SgXLj8+sw0uYbZMXh8Kk/L4Wc5Cg5/LokIgjgbG8GQp4NCE2
         gK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440591; x=1789045391;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ob5eiYeuCZYsXL+A7MdawzkLmkoUvOE4FfKBJ4ZMYwk=;
        b=K59teQQDf4ON/ZPIBpiof6cnYtp1srcTYcEoM9mlLxPqyboIFoYTe1BEAZgqbZehm8
         0xbz+ubN2Uhw6RB438M2WrWrWcUaVdkxxV96MSbAPVmhDL+5XAvo6nY+c+eEhFuJ31k3
         lyQdwdtcgAqWHwtmr1AI3OyHzwhsnF7iKYZGdq3RGS4r6URpRS8oGkFYiOQM2LA5lliT
         sAqvzRgAKgI8X693aU710GimNq7hxLWNURHvSWtDHsE4Lnd3PHG9g2RVeSStPXAtweFb
         ysd8yAWP9iyB3jHyP+t3psm7G+vvfwTTLkV0wtOF57U/NW7ESMp/B3vR5sGZ89nzwwjq
         wZxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLNf0hgCkrZ0Xi409xzAnJfGIlQLmvShO/JCRFT+RIKUCIiF5AQBZ6mzjg3VReWKvRRD6d35BDMcjW6ck=@vger.kernel.org
X-Gm-Message-State: AFuF++n39gtUJ4nNIAYISMaao/geMhuerSm0/Xf2yj7MR+ttXzb2vsJB
	rZtJ9r1xPkjE24TV8z1/w8EVq5PqcuMmNm+A9dhcNFNg5p739n4SDMVGbeBSHPtAFII=
X-Gm-Gg: AYBFou3MIbc1e+tmpZWJ5ezkqJKxaLd6V6EQLc/3rI3rx7m+hn5gqlheLxN9WCMTgBP
	PROoCru+cn9WTfpoc9T/PbQuGcbexVzOQ4NpCF4xU/rgWhcKRy839Tn0ib6Pp5ryJr4f6hXh5Ae
	3jOhAFww4jff7WgJclkbov9YPJCCworfPJNZoNsbNPTFL/bV3cotd+9VudwKUh0jFJFOpTCU2O4
	OyeI28l5e8EiWltOHKklKy8RQNOjUNSey/mFPrKlEIwMVbjOSNx/7kpy5Qad03vALu89DW6aPlQ
	xrkaYShfMzmxQEuyJXzFLWoqyq8IE7rKQeiRcG/QA5F+Pm1uBFDI3v3981sz8TsMkfhs2hKK+7U
	7W/Yh0Di0+DEHOYX8A6Gf+4ffwG3fjLAGFr+7KBgNHUkMHN+OHXXAPQ6l3akSNQqnOWD56l63c8
	1xLfyjUrz1bkCxS8RmUNRrr1jSsv2ZXeYetEpfi+dSKSvfzqJ1P7JONNQQMybe
X-Received: by 2002:a05:690c:6d83:b0:870:f53:4edd with SMTP id 00721157ae682-8700f5350fbmr10493197b3.7.1788440590683;
        Thu, 03 Sep 2026 06:03:10 -0700 (PDT)
Received: from localhost ([2605:8600:200:1a83:fe59:7385:2855:8588])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-86c129b2eecsm39802527b3.15.2026.09.03.06.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:03:09 -0700 (PDT)
Date: Thu, 3 Sep 2026 09:03:04 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Bo Zhang <zhangbo0325@gmail.com>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev,
	shakeel.butt@linux.dev, baohua@kernel.org, david@kernel.org,
	mhocko@kernel.org, ljs@kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Bo Zhang <zhangbo56@xiaomi.com>
Subject: Re: [RFC PATCH] mm: vmscan: avoid anon scanning for GFP_NOIO with
 low swapcache
Message-ID: <20260903130304.GQ3004@cmpxchg.org>
References: <20260903040131.4016290-1-zhangbo56@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903040131.4016290-1-zhangbo56@xiaomi.com>

On Thu, Sep 03, 2026 at 12:01:31PM +0800, Bo Zhang wrote:
> We have observed some cases where memory is allocated with GFP_NOIO, so
> we cannot reclaim any anon folios unless they are in swapcache. We can
> end up spending more than 150 ms looping in `shrink_folio_list()` scanning
> non-swapcache folios without reclaiming a single folio. This is pure
> overhead.

Not entirely. There is some value in aging anon alongside file, so
that the next __GFP_IO reclaimer doesn't look at a stale list.

Can you describe a bit more about what you observed? What workload is
running, maybe you have a stack trace of which NOIO requests are
routinely getting stuck in reclaim?

150ms sounds awful indeed. Is this cumulative for a whole reclaim
cycle or single shrink_folio_list() runs?
