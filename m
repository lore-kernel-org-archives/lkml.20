Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511E64E50AA
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169077; cv=none; b=mxlXu2Y52oEpi3s0dKMP3MWjrNbJMJPiriu1R6M8/atxjIuVcVziZvzcbArEs+POzsJiCDEYPqENi20XiV9H+65KiLQp1owH64/dYW+UT1OL+UPREhGlFlbnIz+0tm+x82c1f4YXiQDRYpvEst3Lhpwdpu/udkaNt3eMejskCqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169077; c=relaxed/simple;
	bh=s9lKTZF8DBrh8wqpwctlnT2WvIuygkwQPynvZ5EjKu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDb8AoQ5fd18afljOnM4VcIFc3r2LLIJkrTHYdlbFXnLrxHZaqOhhFx7VSeNkMaHnbP8CWGZVZR6/io+IZOAIlWmGXnq5GFYtibv7ZrCaQ32SmZHzweJvevuR4cuDoDVs/dmce9W+1a0I+zqgseq5yzQSbjWKScj4Gv+gesMcB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XcrqgQco; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XcrqgQco"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91ba702cceaso1937016d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792169074; x=1792773874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wEVFUYbKAFDbpMze0BDiWYsy7fzEm9zY0vOk13vTjGQ=;
        b=XcrqgQco8JlgB1V166qMser8YEgzamOtUWbM3TsRGBEr0wskcwpQ6mUTPhjQj8fRZn
         8MfRmzVTz5saWvvsv1zkE84UbvTbHi1DyTZlH5fB4bNJbcqRTcEo6cFXXYM0OI6rbXeX
         F4yZPMMWI/lk/zwymDotYhkQFX4SIOYL5/P9lAbuhfnt6IG7exNO79mB4Qx4fQuC/qOA
         ViCmJxkcy/DSWIW60pbFHEY+E2WPUwhDChs/ntsNsAXfNCY0IaPmx6/eTMFvpKIDlZLB
         u75p+jEl7jN3zp5UnI6VAV37M9FkLgyKBm742KTViNQ0bv1U0f5ksNWnwOID2qUrRCjt
         aG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792169074; x=1792773874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wEVFUYbKAFDbpMze0BDiWYsy7fzEm9zY0vOk13vTjGQ=;
        b=OgnZ7MXJERa0k2acGwjP8sCinPF2FvSh7qoXvGmPnY1YXZah+cOyaGfM+QTJZ28VI+
         y/tZD/f+oZaw4R30ma6AzjbrsGJ71XvKvetY8AlycW56CBzHZLUTDf7S28JTBKrlk7sz
         swOI/ucwnff7J8ILV8oQsuyvf88at126JKcnnMuvUx3ipYuTRUUfvyZn/87yS1FCJ8Fj
         oYQ9jX7cC5jMgMzWLR0KgOGo+O7/HJGavS0w+kFnCh/qqvwWbgRZPYntQH3uRUM5Tr1k
         3djWLdJpk8xoqTIxhUFxB8BjZeKChyMytOl1A0zFyA5sCPTwHYvO7zGHR26gA2jujwwd
         FWeA==
X-Gm-Message-State: AFq9FYLWpsZnS8gXIh7ABUHsYvksjwKT8I7xY4BiiLYLJInlvR3wp5kC
	V/su2EE5cV64xDoKjU7UZJha5v10npBin2u3xaE/QsBDkoKEdygJI0/HquL8EK3g9cE=
X-Gm-Gg: AYBFou1S8AXygMczBjkCpqi0Uc99tNMA+7CMVsc1GGFNStQS01Oe1aOkqtCXkLpgUpw
	3TM36NsIfRjnPhG8Y3IydYDJfyAPWFedflVVtEjRw57FtI6uLUD7mjekaEmDay/8g3a5AqUERTV
	tMuotnV/mJumuiI4kHdz4fp7UCk+Vax5FMLj6dJx1qQMKTST9K0oeej/j+HT2qAuTRkDOoTvMAU
	6CtMR5cDyFpBYP4vSzGqpCXAKMf2kwP/DToF39QK5KT/wcFwbqDcHtozJMee8k3batltOrNWog8
	yJDEqtlORxDVm03yk50ksLrnJdAGGo+lgUpSgTsimJElJ1QFpI9nIRZ1qrcDOxLu3Xd6jGyOguO
	QEUB7k8wSCd9Qm3b06Gxjc1UjRhZz/bl76g5cctMxqh9H77eCKx7eC3sdP2mkFwGewM5iW9HV9n
	pAt9CC26WIcFP9bXu4+qXAmRTpQ7lvOrk6GWm/Zp5G3JX0oXv1XctU9qWFlcpAF59VANL4AGlQd
	vm9YzajoXY/+TuiZgW2ha7wa1x4sb7EEo6Ada13HgyjLb9vRBarVrXj
X-Received: by 2002:a05:620a:269a:b0:93f:26e7:844 with SMTP id af79cd13be357-93f29d68b94mr65782485a.55.1792169074078;
        Fri, 16 Oct 2026 09:44:34 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91bcb8b69f3sm27054236d6.3.2026.10.16.09.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 09:44:33 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:44:31 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org, cgroups@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, longman@redhat.com, 
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, 
	akpm@linux-foundation.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	brendan.jackman@linux.dev, ziy@nvidia.com, david@kernel.org, mgorman@techsingularity.net
Subject: Re: [PATCH 0/2] mm: fix two allocator races with zonelist and cpuset
 updates
Message-ID: <atJUCRRcgRkTPigw@gourry-fedora-PF4VCD3F>
References: <20261014222456.2318284-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014222456.2318284-1-gourry@gourry.net>

On Wed, Oct 14, 2026 at 06:24:54PM -0400, Gregory Price (Meta) wrote:
> Two small fixes for lockless allocator checks that can act on an
> inconsistent view of state another CPU is updating.
> 
> Neither of these are stable-worthy.
>

I'm going to need to repackage this with some additional race fixes:
https://lore.kernel.org/linux-mm/20261015210539.3243563-1-gourry@gourry.net/
+ 2 others not posted yet.

There's some mild conflicts with the CONFIG bits that make the entire
series worth backporting for ease.

~Gregory
