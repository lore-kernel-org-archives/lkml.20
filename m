Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A92050EC01
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784483; cv=none; b=J+TwqmTtZHmqaoARrMCtHbBhelpOrLUQ3i0s9VLyFFktfvs5SY5+d3GRL6r3/FeaOotIwa1adT78GLRahnmArv/VjiHm9V7wbT4Ej/cVQltkWtCunBrt6ZnzFF/C7ttBJbfNxjEqx4f96Zk9cRqqfJWmD/MoafImmt4HEUD8Fwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784483; c=relaxed/simple;
	bh=AzoXOLzGjyaVfPtVwerDXKD7G1qpD1+GSMFpiLIuzMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3CFo0s/C+tzJcYWhDB7TMaBDVMZzuuplR2FqpmoZtcJ9gqMlZ3Kqyx3t4Zj8d96zn0x8HTTmGWRnry6sr7mnKut4SyRyiogQ/qlKEg2e7pqNWNU9yK7K96MkZ6NnSjSrX7J02iQwRd4vKbtrdmhb3xbzXL+xMtQjcxNOplzrpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GmFnVKTt; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GmFnVKTt"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C0721596
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:07:51 -0700 (PDT)
Received: from [10.2.11.34] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7EED93F85F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790784474; bh=AzoXOLzGjyaVfPtVwerDXKD7G1qpD1+GSMFpiLIuzMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GmFnVKTtDUojai0mgt7j9ZCjtoXvLWjgxF2fmAKla8E22cpsH+0YIsyeEANhBmHM0
	 DLWqazGt/TV2EABailVbeGj+9W5KiOmac5MO3OHVf/PUDwFUNzcD9sH2yHKbJsHfAh
	 wizl4epM/W3mYiAEun2Gk2e60DKLf8XwVrHLejl0=
Date: Wed, 30 Sep 2026 17:07:43 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [PATCH] drm/panthor: validate userspace queue count against
 initialized firmware slot count
Message-ID: <ar0zz1IS8f4eUpXg@e142607>
References: <20260804160048.174148-1-osama.abdelkader@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260804160048.174148-1-osama.abdelkader@gmail.com>

On Tue, Aug 04, 2026 at 06:00:47PM +0200, Osama Abdelkader wrote:
> In panthor_drv.c:panthor_ioctl_group_create(),
> the queue count is validated against the hardcoded maximum:
> 
> 	if (!args->queues.count || args->queues.count > MAX_CS_PER_CSG)
> 		return -EINVAL;
> 
> However, if the firmware reports fewer slots than MAX_CS_PER_CSG,
> panthor_fw_init_ifaces() will only initialize that smaller number of
> stream interfaces.
> 
> If unprivileged userspace requests more queues than the firmware reported
> (but no more than MAX_CS_PER_CSG), cs_slot_prog_locked() fetches an
> uninitialized stream interface and may crash when dereferencing
> cs_iface->input->ringbuf_base.
> 
> Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
> Cc: stable@vger.kernel.org
> Reported-by: sashiko-bot@kernel.org
> Closes: https://sashiko.dev/#/patchset/20260803141149.68182-1-osama.abdelkader@gmail.com?part=1
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

Sorry for the delay caused by holidays and other things, this patch has now been merged.

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 5832dccfc093..64749750e6ee 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3673,6 +3673,9 @@ int panthor_group_create(struct panthor_file *pfile,
>  	    hweight64(group_args->tiler_core_mask) < group_args->max_tiler_cores)
>  		return -EINVAL;
>  
> +	if (group_args->queues.count > sched->cs_slot_count)
> +		return -EINVAL;
> +
>  	group = kzalloc_obj(*group);
>  	if (!group)
>  		return -ENOMEM;
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
