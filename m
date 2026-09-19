Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4B02DCF45
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789796657; cv=none; b=uPzYhGTaMDvGBA+jdXX4yJNHcu+vx6ZnewSv/DTDeSqp31cW75drzg3phYXH8mbvDl9k7OFuVz/pJ6jX7Kd9By3h2Hv7J56z4ba32jlxoZ84UsJdaILDVa7DhizFXT9I0ajVjVzjLk47YGlN9QvQsPPjFVn0GdHZ7RndpBKCO/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789796657; c=relaxed/simple;
	bh=nXQcnOX6QQenr0BQhIKwzKmc5cpqd4wJ5yRBp7AjTJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smLpNhkano7biVZzrmn6cyPpWUb5TeFWetvTguubR7pbMp+gwBFIkb3v50b3G+HyiqNcJi/uQTFIJaVtIWF2BWZD02HsKngSMvLd0TOrbAwxJGzewh+2+iiMvr+bNIVbCrnCuhujcJrKK/5PbI4lsFRDIx5gUJ/VWsmd3S6EarQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHxrocJ5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHxrocJ5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so7840765e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789796654; x=1790401454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eycts9u1BqM6pEzcHLiCKEjmginPPloZHsyT+3j+oFc=;
        b=ZHxrocJ5mPwu+StNfhXod8lDs4D7+4oF6fLu3NVcZVwTeXU0REiftC/z9+vKhv0Rcs
         QVsC+tMUfmclX6pHmKIpAJZS/Zu2ID05hytA5407MGra51gkOsMGFHqOS6RPhCj2BnK9
         YcVnx5q7vMIsk8X1zj6uTgYR6EGBIfRSZTr9QM87RTJ+LHzUZAPh3q4VgQwi6Fooza5c
         flhcNxyydkD25yR3HLUiHySCqRYk5uXII55/lZ7tnzjywxOlP5mFK7yOJDmq+jlgVUKM
         UTC58HRLViR39un1qw1kzJBRwjR/uRBFqvgrlJAt9rwK2fY5CjCOUeXJi2PvbUBg7CEl
         5ZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789796654; x=1790401454;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eycts9u1BqM6pEzcHLiCKEjmginPPloZHsyT+3j+oFc=;
        b=ed5E1VumyCaP9Hq/z1C8I7qXXDVc9ckIm7AuturtUjMFNRmkkfFRC0qA1S5vFbCf5R
         Yp5ayUuCD6ujB0RH8I9SgJD+rJ0s8ZLgP0DX/vfgTf8+4XKx3MsFohn7rCNilTZJWTRa
         mpXgxQnLJP/bIIAIBEyPXa2eBvljerYTG41QKIvbGqWGgoPfsweXxihjpoUtZrcCHePp
         IzCMs65QejrtXoU+u7iYwk8cZ7qWUgew6b3by14QPWe2HVpbbot0lY+5IJNbPgfcKFCj
         c8Gm2EzvmeRM2xLPPthKKxvDo/nSXM0seuHWUdNA/o7Q1s08gvhZef/6ABO6XmjNz581
         mHGw==
X-Forwarded-Encrypted: i=1; AKwUvByC6h65kF5lnxqVtuNbOHAfjc133I8WKIfvYAEH8XqDszeEvzQTi1CNRKOszl5WcZfrDT38XZl3X5RLW8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nbsbTT3JBB+8vQolKBDbUftEzeTPwdPP0NbNrVU+UNOIK7meTs
	YloamkW3s6bxOHHuBy26oINf0zw6cHY27GY3ohsUmEThrbTC8PENW6OS
X-Gm-Gg: AYBFou1D9MHf0tMZTs//Fg0kiKL4uvP7T1OiJNCmseWwHwMWGOBf/4ameygAZuJmkne
	9zpIusyRJ6ddsltPIJXoBNlndgFuezX4scNh3jR9acdtX6lyhSyb2YdRF91MpW9LTQg2NnMut5h
	c53a4jqa3c3wotHTzIWv8lsQRlpUWZOzwyT/JskeRSdVX9AtGEdsjRBcwFR+gcR6oNj44r+l1KO
	ErNqpS9NU+wz5TbSCV/qotaypDb46gakeLgQbhXLjHA54enx+EjMzEaT+0Hn17gn9BIUXINXRNt
	FYYGrXq/E+DwJCkQ4gvRKRlNiJ/CkQU8U62RY5ijgVBSxea0k2D257lPXEcOTnfIVf0RqFA2kty
	EcfPTIsPzeeauGsvZiMlc08CW+ZP9oPfVngLp6gaXCtfYl0BUg3gei+QntducukZlbdL5DAbNij
	lP3mMHdhqHRqY9kDpjYawzwtoD0gWZoX3QTIaC5BbXHI7NFKhYIC0nCiSTuH7Lp3e2bIxQE9DX6
	HUuHlrJeB1IWDuh6S0/JjGeOMVwbMqgF1LTK7bhuCxDdEJklFUdlRWh3+OPQt++zmojTqJfq0Eh
	JcSNC+QdKdsb7I65GNWEL2LmZtmOQNAy0nCN7MPjJ6/shL7QmMCRDxvDv3wWbkLtKG5KzcFlCI6
	x0PzNS6InDX3NIMU=
X-Received: by 2002:a05:600c:5250:b0:49f:bd0d:59f5 with SMTP id 5b1f17b1804b1-49fc5746338mr64293805e9.18.1789796654317;
        Fri, 18 Sep 2026 22:44:14 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc585920fsm251972985e9.4.2026.09.18.22.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 22:44:13 -0700 (PDT)
Date: Sat, 19 Sep 2026 07:44:11 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lian Wang <lianux.mm@gmail.com>, Kunwu Chan <kunwu.chan@gmail.com>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mm/damon/core: score an unmeasured PSI goal as not
 achieved for the temporal tuner
Message-ID: <aq4g5W58PgWLqJ8p@gmail.com>
References: <aqm1ZPUHiXf9PFWq@gmail.com>
 <20260916001311.101024-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916001311.101024-1-sj@kernel.org>

On Tue, Sep 15, 2026 at 05:13:11PM +0100, SJ Park wrote:
> So I'd still prefer to just making no effect this round.  And my commit was
> failed at doing that, because it didn't aware of temporal tuner.  Maybe we
> could show whether the goal was achieved or not, using esz and let the tuner
> show same achieveness?  What about something like below?
> 

Thanks for explaining the two concerns. I am still new to the DAMON
code, so I may be missing something, but your suggestion looks good
to me and it is simpler than what I had. I have prepared a v2 this
way and will wait for your comments before I send it.

One note on the first concern: as far as I can see last_psi_total is
updated in every tuning round, so commits in between would not make
the measured time longer than the reset interval. But I am fine with
your approach either way.

I would also move the last_psi_total update into the new helper, so
that the helper is the only place that touches the field and the
unit test can check it.

While testing this with damo I found a second problem. A full
"damo tune" still gave a zero quota for one window, on the unpatched
kernel too. damon_new_scheme() runs damos_quota_init() on the quota
of the caller, and since b90408ef1163 damon_commit_ctx() passes the
quota of each running scheme to it for the test context. So every
full commit zeroes esz, esz_bp and the charge state of the running
schemes. Please correct me if I read this wrong. I can send a
separate patch for that.

In a quick QEMU test with your suggestion and that change, the quota
stays at 1 MiB over "damo tune" and "damo tune --quota_goals_only".

Thanks,
Karl
