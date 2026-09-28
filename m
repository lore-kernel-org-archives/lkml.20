Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B1D4E4C20
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616466; cv=none; b=ASgdT1t1vDIaMJR+fXQcR+Jhx9X1gLTqmtKFfqSuQbI9vZLI1ujczDwxB+KyGpdRFjN+SyQ+LOIn+EmZkPQYGzzv4AC80YQvIJ2S30XAzEk8GRq1bQ/CWdVRHd2zaC8FvH3uvYtd2z4XgCAAFy6PetRmNskI6jYXb3mpcq8vQaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616466; c=relaxed/simple;
	bh=v0Tvegi3Y0r41uqGe1gwF29EUW2tl7b6bRd3HIgumbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFgdwqt2QFMeyprww47z2mMXdZN0bJ3/0HcMGY8JCz3+ZuBKBXwzbFBFd6U/kRGsU8PMWrdR0YPiy/Tmq1dqMuGDpMt9MDyxaHUgfAxox9WJ68+Lfu1Y8w8kfAGP09c9wEntIBvf/MPnJM7IvTesfGW+QwQxEo5dHwbAd5nX/hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jBZY1H6g; arc=none smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jBZY1H6g"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-91784fbb60dso885416d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790616463; x=1791221263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Snkhkpv5tfQYCAgHHo/k8kMLGqfuMfM+gSc1uL+OvlM=;
        b=jBZY1H6gJrJU2t5Mpv8+BExTazX70+SEqM5JxB+NaEfWB1/kscdowjDaaFcK64C4bq
         oNu8NgcPKadq9dJ3ulXRwtuhjjy7Cfc2svmgLDWLgu9N0l3Hc6WgLwhZo0/HReMBjjwn
         mvZ+QqayPkHNjlESUWva+E5fOEMWHiHvechPjhhk54vrOmavltX01sdnIK2UwKd1nwlt
         5nuLz9QSpOO7DPkds1TLIPxZQQqJIyK3wDF+D6LCJiP6ZOR4+9ZYPG2VLcZNaeWGjE5n
         9N1LTpYiSr94lCEbI//a58ok2AcRFbDMviwqGwRCHz0BMS30PxAITO3XcWb/n9V/usfX
         tDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616463; x=1791221263;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Snkhkpv5tfQYCAgHHo/k8kMLGqfuMfM+gSc1uL+OvlM=;
        b=Dv7jNpRpfpUL9D/QjHEr23pqheTrYMPlvZ/SC/87567dXQT5+rGW0Yw+fg/0SL9pko
         vSB98VWhY5dw+fqFe88jbVz0iZnQWkpMz/loUAsvT0qlPFlR8nXqQt1+wULQkbNc9rBU
         JTmvBnBf/jtEvG/YXsfyG8853RM5t9l+lgLFnVey5JKBvvhkq2bkTEjBT5XqR3b83/Qk
         mxaEQ+0HoZdyDgqNiPZgsnNE65dnzFEbhJSXSKieMqvNi0L3d5AOkQMMuNfgUn3UOgIS
         MvdrWq6w4BU96CacjWTFHzJ8hCuVm30mgvFVXjhkEFKHRAk0j4fL0TdfsPsecRp0LQKU
         Thrg==
X-Forwarded-Encrypted: i=1; AKwUvBy6IO9nihZ1W0PvQWc1prVvtkLbkR7qzvJXZGiaXDtR8ehBSNT55bDFjcS2znycuLaV7dpVFY/7xO5N/10=@vger.kernel.org
X-Gm-Message-State: AFuF++kyAljw6x9Hz2kvLiqUDEEoz9WHa3ufRvrA6EZeMXG5q/tVc1sU
	H934XY9HF17bAL44a0nxl1p4IjPoH8gr6FrK6U2ehYeR460DYudRyuAn3WISUcMOHQU=
X-Gm-Gg: AYBFou2/iiKqDllLRox0YojdA4gwKRZ0CaRfs352m5byG3eHtzFg/cCtzvg8530MBWm
	n3CrZlpiU7BnuesfNnDRThcjoT6544RG/zY4/LnqB1WUdnPCUVOlDzAW7U8yDO7Z3L/Rb+wx0j3
	B1FC9g8kLx1dGWjRuMuwWFpE7NRnpwlqVZp33VQBXnwRbfSjR99OLmamKdeoiOkb0F1WB76VemG
	oyBx9Hn9YhaZu6xkRNmbnnNO4eOoJzuwhHyUg5UYOZDB7HtDy/ipp+JGE4idWfs4gu4iwSbW3tc
	YLMAv/HOrGWWLQwI47sqWQUjWggpSbGm0CiXSwxLArUIA22dsS37nfrsyKJeEQPrjynjSHen3G7
	SZdD5J3/a/TwixlM+kaF8Z/z/+FG1GhsThTZrXt0H4LgHoKFyI+mLX5kS46uqE6dIcWGyMl6ZGx
	o/owoGwcpLxA5KBSqkUO/0tNy0pDlPOr7WvdjRwL+WlhDS
X-Received: by 2002:a05:6214:ca2:b0:915:e892:d932 with SMTP id 6a1803df08f44-915e892f966mr81063516d6.3.1790616463265;
        Mon, 28 Sep 2026 10:27:43 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9144b6335f6sm57161666d6.11.2026.09.28.10.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:27:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBF8f-00000007NXN-3v3H;
	Mon, 28 Sep 2026 14:27:41 -0300
Date: Mon, 28 Sep 2026 14:27:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:AMD IOMMU (AMD-VI)" <iommu@lists.linux.dev>
Subject: Re: [PATCH] iommu/amd: Make PerfOpt compulsory for APUs in identity
Message-ID: <20260928172741.GJ163130@ziepe.ca>
References: <20260928045050.955165-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928045050.955165-1-superm1@kernel.org>

On Sun, Sep 27, 2026 at 11:50:50PM -0500, Mario Limonciello (AMD) wrote:
> PerfOpt is only a feature usable by integrated GPUs and only in identity
> mode.  Instead of leaving a policy knob in amdgpu, just turn it on when
> an integrated GPU in an APU is in identity. Re-use the heuristic in
> amd_iommu_def_domain_type() to make this decision.
> 
> This drops quite a bit of compatibility glue.  There was a refcounting
> system, exported symbols, and device attach/detach logic.  By just setting
> it immediately it's a lot more straightforward.
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |  50 -----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |  12 --
>  drivers/iommu/amd/amd_iommu.h              |   2 +-
>  drivers/iommu/amd/amd_iommu_types.h        |   3 -
>  drivers/iommu/amd/init.c                   |   3 +-
>  drivers/iommu/amd/iommu.c                  | 234 ++++-----------------
>  include/linux/amd-iommu.h                  |  11 -
>  8 files changed, 48 insertions(+), 268 deletions(-)

Diffing across the originals to net them out it is much smaller:

 5 files changed, 122 insertions(+), 1 deletion(-)

And I think this is much better , but I have a few questions

Why is this setting and clearing perf_opt in dev_data?

I expect probe to make a determination if this device has the special
path and if so then there should be a permanent flag in the dev_data.

Based on that flag amd_iommu_def_domain_type() can return identity to
override things

When the driver does an identity attachment it would enable the
perfopt and write out the right DTE for it.

Whenever the driver removes that identity it would disable the
perf_opt. These points are all marked out in the attach function flow
you don't need another variable to keep track, or the funny logic to
block things. All you want is an attached identity domain that is
"optimized".

Release goes to blocked which should already disable it, so no need to
disable it again in amd_iommu_release_device()

The repeated pattern is a bit much:
+       if (dev_data->perfopt) {
+               if (WARN_ON(amd_iommu_perfopt_clear(iommu)))
+                       dev_err(dev, "IOMMU%d: failed to clear PerfOpt on release\n",
+                               iommu->index);

Clear should probably just do the warn on and not return any error
code. It is never OK to allow this to fail..

I'm also scratching my head a bit why the global register needs to be
set/unset like this? Does that global bit completely bypass the iommu
for a single special device? With no way to discover from FW which BDF
is the special device? If this is the right guess please document this
in a comment around __perfopt_write (and again that's awful, ACPI
should have a pointer to the special device so the OS can understand
this)

Jason
