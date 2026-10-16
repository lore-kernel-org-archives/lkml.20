Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89F74611C7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792153543; cv=none; b=vBXFtXEjQo5aLKQOIl9a9wmvi+wa4Sjq5CdXr/WlsU4bhqEhYP6jMXm24LwA9CPBVl8p6NXG5XL1DlL7nil0bZ1enw+wrg8Yjyvj88unYuGC479m+KpJWL0jXz+vMKL/4EhVOFRIiJp072bSmv0wQonCdZqVvxPv0uNyd7nGgV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792153543; c=relaxed/simple;
	bh=krxKzyNI1ZYpileNc2uCsCIeFjKDXJ2c5kSdMOWJL38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exIxncS6D9ON3hph2sqnjY9xlwvwaOpcD8EjZUnjPKssMh+UwOheJDlUi+n6eiT6cukPWRSwdy5ZrsrAQluUFVJV2ie4yoJAyzoa86FrjTQsKGV1Cp6dSttjisYh4FNKfZlgk+iZfPM9/IGFtLpIa9Tk2DSHMg5g3LsnJb1HNfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NE0wR8zX; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NE0wR8zX"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC35C1516
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:25:37 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E5A363F871
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792153541; bh=krxKzyNI1ZYpileNc2uCsCIeFjKDXJ2c5kSdMOWJL38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NE0wR8zXsNDPwDPv29Rja8LPc2hgsmSlu8DIv04j1+3cgaWyIBoTidLphtTaA+00s
	 iPY28dIJY5XnrcGPEx+PgCXrJXkQtlpQeWTB5fJSlB6Jo48Sr4vqEA2e8lG/ZiUYxj
	 2ii8k8n9KM15OebDQHgzpXNvF68glxRnsnKu1NdI=
Date: Fri, 16 Oct 2026 13:25:29 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Akash Goel <akash.goel@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] drm/panthor: Misc MMU fixes/robustness improvements
Message-ID: <atIXudY6VCIdO2Tc@e142607>
References: <20260924-panthor-mmu-fixes-v1-0-e25f9b106466@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260924-panthor-mmu-fixes-v1-0-e25f9b106466@collabora.com>

On Thu, Sep 24, 2026 at 02:30:42PM +0200, Boris Brezillon wrote:
> The first commit is fixing a bug we've seen on v13 HW. Even though
> we don't quite understand what happens (race in the flush-elimination
> logic when flush requests are sent concurrently from the CPU and the
> MCU), it seems that the downstream driver has always been doing a
> flush+invalidate of RW caches from the start, and that we were doing
> so up until the atomic page table update changes, so let's go back to
> that state and leave the RO L1 caches untouched.
> 
> The second patch a fix for a race that could very well happen if we
> ever end up with a failure between the as_disable() and as_enable()
> calls. We've not experienced this so far, but it seems worth plugging
> the hole regardless. The last patch is a much more theoretical bug,
> which would involve a buggy FW telling us that a CSG is suspended,
> when it's actually. I've deliberately not added a Fixes tag on the
> last one for this very reason, but I think it's worth staying on
> the safe side by addressing this theoretical issue, still.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Boris Brezillon (3):
>       drm/panthor: Don't invalidate OTHER caches
>       drm/panthor: Fully disable the AS even if it's going to be re-assigned
>       drm/panthor: Move cache-flush after UPDATE(UNMAPPED)
> 
>  drivers/gpu/drm/panthor/panthor_mmu.c | 43 ++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 23 deletions(-)
> ---
> base-commit: 45585c3aa285854face65293acc95eff73063d6d
> change-id: 20260924-panthor-mmu-fixes-a1832dc60908
> 
> Best regards,
> --  
> Boris Brezillon <boris.brezillon@collabora.com>
> 

Pushed the whole series into drm-misc-next-fixes after updating the comment
on 1/3 as suggested by sashiko.

Best regards,
Liviu

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
