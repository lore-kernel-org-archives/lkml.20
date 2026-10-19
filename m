Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792442409;
	b=VyrEPLKa7g33n9WXDxLMOGipNmZ/mNmCl+ZcAjqFYoHH+JiZuknMJDIyrCGUGTOymaZ8
	 iNfi0vV8aI4POnyMyi6VKJcGSrBxp/cL9zWALxGOqIZmEuBZxlougm7LQZWRya8gUuxCj
	 Li4Ad79MLeMpSpQ4atH+wyoOEIedS6E2VO1gTiaCJMc3XSF1QR3jWo/hqTqJ0F4+6YvNO
	 fwmqiBeYK5gBsI3+vDreq8Gn0CDtSnR587RC46U7dSdovuer1P041+44pss4w0OuUVuZD
	 jcxbiAzgZjZCdnx/zEYVZmmvx3mpMNZvtmqjzy1LaCAMUa6Y3Msjj+JWPts+oE23QRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5TU2bw9dZra1XsKruc6sjmGSbXJI2gRuYiN6+oX/+4Q=;
	b=NvZx/JjU2Nacd5VM5YUe6oO0xPngy7Q9GBdEHwv+dIosNn87f3l6UEQJkDldft3aDqIp
	 mx0L92s65NniF57v/mTWLNXRI1Acya9yQR0h+JLn6iwTengJ7z3hXq9QaxG0eD7eiaDMK
	 7A0B8Dlfcl7bnC30mpLPC5JKYbM49bvqkxkWDmOq0UUsr7QNclwG0Kc8lnrBV/0UGYpn8
	 uG6W2Nj7rgNKhB/X6ZVDolfDezZfmrJ4SeU0j0qooDqM1nhHt6ilARGbGgTFPPpBU/tDE
	 Nct6/X5bIp5xzzPXfWNj6l2Ggv7K0Z9lqozuin+3LbxVo75QCpfN/mNpgDCAzUEKeTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="qh2oa/PT";
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C47606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 20:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64C47606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=qh2oa/PT
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91b8306b9f8so38979756d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792442408; x=1793047208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5TU2bw9dZra1XsKruc6sjmGSbXJI2gRuYiN6+oX/+4Q=;
        b=qh2oa/PTZ3nuizLJeZdLuovrOnJisLWk0uJSVXpsLqbBDOrGiyH72OnRBgcPM0Kg+I
         0OqnRa646nBH5N44EN8ednjw6EDcuf02swSwOall9HGm+yrT2dBaKiByMBUDCg7HtZLa
         OS1J9KzDEDGmtR8Ly4ZQI0WUvw4fcfYehIun6xJVnsGwmteCu8VO1bP2jJiJFFC08eH4
         V6FYj2voeNTQETB+hw+hI1HmtM3Ps/T/h8L73ZtdRribrSgxfmgZQSRz3z9Fo00vS32S
         xw2PwznSuizP1KzDUnZpgfeaR3bYkiBH2dj6I+l0oP6GK9tEFmD5Ew4YpMxmxujUv5Od
         pTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792442408; x=1793047208;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TU2bw9dZra1XsKruc6sjmGSbXJI2gRuYiN6+oX/+4Q=;
        b=jYwdIfGKvVFzhj1GQ5PrDx682fBWgudz3oxn7yvls+pA2sVNNV2b6SmAjUeS3LwQNB
         YSw4On6X29p2QE6dkDg8W6y1ZeNYiGc1fFnOeHRT5qJwOV8w9Co6asF7kxbV9srKv1ni
         15xa4uq7pV5Q+zTf4dFmcD6tIcZH4x8m59yIuyynWDvGDTJHCt1+iVyA2Oc3SGlIEFp+
         P5jWY6IoJmCiASXztZZl0R9R1oVrNGFQAVjf0/+uqFBuXGDQ6UJdi200bp4fK8wRowGI
         NcPHUneZfKeHctVdtOidfEk5fG92kKgSBWiHIDAxWaXVFxFxtT+tgy8dSwlU0b2/6Zbs
         Xoww==
X-Forwarded-Encrypted: i=1; AKwUvBwT52MZtOdGPmh2a4SvjOn487R2wD8oCTKzSTeWej3DF1s3IpxpGNb25sYdVHxFep9hW67amJ+9zdcdzVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPQngseGFcOAPA53wmaMIUM6AbRPG9bqioPMaYmM06GO7uKrzJ
	v69E0MahMDPBKFInFwQt+lX2oD02l6lnbS99ii26FfwoyzWCVOOC15hsX7g3GLjGj18=
X-Gm-Gg: AYBFou0MKdEfGB34nxsOcjLVX9Gw5ApiAdCGKbo0X8xS96XZ3hn2uOajiAKAWqsLxt+
	5aql8qIsOFq1Eps9pfnQy/IEs54mYAzPkJdyXmF6M53pZQmrg35hcYLMjqpJWirqQ1oxsgrs+vp
	fGo2m7Oerix4LFG9cnDiA1Zjy2gvIhRoLsaHFMywz3ulraIBOV86CGOrrPkHiDhKo+K2h+Jf0hx
	P/91s38ju0eG6E4AZ8yZ3Gg3HDt3+OvrMhZykSaHUXmVLY9l5UsJKdZjI5qKsNIaw8vno0kdYje
	AIgL6uvfwdx5kgrSQ6KGMMPurIPfCa6Z/R4UwxAPUjIPgKf45MemXHmqsfjlzbrYdChAFB9J4Bh
	+2AzGgaHknejzLI4jJ49NQTcD4+e3hbw0YHHQ9mWBzJSsn8Pu7+t0wECRIiXQI363/ADo8tXcY7
	3vHbJSnjNLCjCdX6S57gmKF/KWKJRoGF1cw3Zu4d7p3AMkmxOBxq8z9+Azq1wUUXQUrCIcrV9fp
	f8pmqUadqsM2JJCqH8y+EXZsWxiprni9DGeIAnGLlUQV6tZ2Ia2Rvg=
X-Received: by 2002:a05:6214:d4c:b0:915:eb0e:321d with SMTP id 6a1803df08f44-91bdf3fe6b1mr160127356d6.46.1792442408212;
        Mon, 19 Oct 2026 13:40:08 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040da11bsm5657186d6.35.2026.10.19.13.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:40:07 -0700 (PDT)
Date: Mon, 19 Oct 2026 16:40:05 -0400
From: Gregory Price <gourry@gourry.net>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, ziy@nvidia.com, flyinrm@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] mm/page_alloc: let the highest memory node recover from
 hopeless state
Message-ID: <atZ8ej_zL-D_FIIt@gourry-fedora-PF4VCD3F>
References: <20261019184850.3427905-1-gourry@gourry.net>
 <20261019201321.GJ371161@cmpxchg.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019201321.GJ371161@cmpxchg.org>

On Mon, Oct 19, 2026 at 10:13:21PM +0200, Johannes Weiner wrote:
> On Mon, Oct 19, 2026 at 02:48:50PM -0400, Gregory Price (Meta) wrote:
> > free_frozen_page_commit() clears a hopeless node's kswapd failures once
> > its zone recovers above the high watermark, but only if another memory
> > node exists for allocations to fall back to.
> > 
> > The test `next_memory_node(nid) < MAX_NUMNODES` finds only memory nodes
> > with a higher id. The highest-numbered memory node therefore never
> > recovers on this path, and its kswapd stays disabled until reclaim on
> > that node makes progress and balances it, or demotion is re-enabled.
> 
> This seems to be the express goal in the commit referenced by
> Fixes:. Can you explain why this premise was wrong?
>

tl;dr:  next_memory_node() is not the right check for what the
comment and patches say it actually wants to check.

on a 2-socket system you would have:
  if (next_memory_node(0) < MAX_NUMNODES) /* clear's hopeless */
  if (next_memory_node(1) < MAX_NUMNODES) /* doesn't clear hopeless */

despite the fact that each node is the other one's fallback node.

> The patch in question also only added another re-wake event. It didn't
> remove one. How can it be at fault for kswapd getting stuck?

Not at fault for getting stuck - it didn't fully fix the thing it claimed
to fix. So this patch completes that patch's attempt.


> I don't understand what "having more than one node in the system"
> means for re-igniting kswapd on this one node.
> 
> Generally I don't understand what the heck we're trying to do with all
> these patches against the hopeless state code. It shouldn't be that
> hard, right?? If kswapd on a node failed for whatever reason, let it
> sleep until direct reclaim makes forward progress, or other frees
> (unmap, etc.) put the node back above the high watermarks (which means
> enough of the unreclaimable pages were freed to justify a new wakeup
> in the future to attempt reclaim against new pages).
> 

Zi said the same thing, and I agree.

I didn't want to propose that in a stable tagged commit, but if there's
strong opinions here I can just outright drop it.

~Gregory
