Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831296;
	b=UdH0fkNSXOXtQA7BjwZFyHAXcG5GMBtwenRlfzjeKVwQQrBPIZk3LsjVjR7BEj32TLH/
	 6lvc2IC9mlkNNT9BSxO4VSQOej3vCgNcIszvZR1vBCHPh+XpdjgW9FK1bWYtrgWfC16nK
	 hBPotIGjRHgaFGZ9QhJY9YtauFh/Ux8vlWbktYKHH4pvYk6GxbUIlGnCu6gd/YPZEr9x6
	 +aWsR/wU8nvQmYw/tbr9E4WGrfM/x7ZnCxsEDYvDfOCgQLk/C9Uuit0LZ0FpTnj9kjRXr
	 AFKfp/O+XfQ1dSUYCBQ9n1box0pM9SOHOJZ5rfA025uv8OkJi8oMm5MCpuTfpujTdcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831296;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=xV4wzEt93KKUYN4/i4GrUJiqH0YQDE0PVV6xnGic2Hc=;
	b=0ejj4uanwcrUzRu2sVD10juFCjN518ANtCiMxOlrwoYv/N70VSSTBRIg789k6bEOxKT2
	 NMJqEi2wZNMthPfXhVLOiJQx0dhnKV88Oj+ui7qxKt4HOQIxEcQidHmxaxLmnX1SBaE+W
	 FeKBwC1GHeXQN7vsVcyoOXIO+YQmlfKmpA+Rz4l9gUieUWakiuDAE4TfG8aIMg3amoLN1
	 4BAVqL6nOHAfRcUxZQssZ3/eEoWV4Mm5ACW12rk0Cq+pmJ+aawF3ezl1viVL9Kri/7Vr1
	 W6OAu4wbT7T03H/+Y9VAsX3DLMf8slKMaHEo5mWSVtpuoyiT3DZ1436Gud/bqEMsiwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCkU5WYS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CD3606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oCkU5WYS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720DF1F000C7;
	Mon, 16 Nov 2026 12:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794831296;
	bh=xV4wzEt93KKUYN4/i4GrUJiqH0YQDE0PVV6xnGic2Hc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oCkU5WYS+CVpA91k6NmI4IHmH0jQXa0rZt5gAv5kpICvbpTT3JqzSvRYuxqmwHw3Y
	 gQtYc+enyDPbJ9lDfRZengoYn3nCHVZnjRW8mDDH6g2VSC4uYI79Rrcvn5U3vRayef
	 nQqzAD9cMQJf5XLjL4hNwxOnWpeAc+NfbiNaIf5vMbqtJ2sCevZ0pVGbLqtZontuji
	 phh1+MJdT+ixpRLI1oh74N4dumOrqQJgD2IHW4LN6m/QCXeJt/N13VzmCEB6iNTCb1
	 pWrTkt5+p0XCPzVM1wCq/XIDQSBtwvl52bhoNeMdOUD+F8FiByc1K0kK2zln/vHsHh
	 ECFM9MZiz6uMg==
Date: Mon, 16 Nov 2026 13:14:50 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH v2 00/10] irqchip/gic-v5: Fix misc IRS and ITS host
 driver issues
Message-ID: <avrzusx1g1ZICo0Q@red-moon>
References: <20261104-host_gicv5_fixes-v2-0-e47ad20ea3c8@arm.com>
 <20261112145814.853424-1-fuad.tabba@linux.dev>
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
In-Reply-To: <20261112145814.853424-1-fuad.tabba@linux.dev>

On Thu, Nov 12, 2026 at 02:58:14PM +0000, Fuad Tabba wrote:
> Hi Sascha,
> 
> I found a couple more issues in the GICv5 host driver while looking
> into pKVM support for GICv5. Rather than explain the fixes, I thought
> I'd send you patches for two of them instead. If you think they're
> useful, please include them in v3. They apply on top of this series.
> Boot tested on the GICv5 FVP with a two-level device table.
> 
> For the third one, the thing I spotted is that if the IDLE poll after
> an IRS_MAP_L2_ISTR write times out, gicv5_irs_iste_alloc() clears the
> level 1 entry and frees the level 2 IST, but nothing cancels the map.
> The IRS can still complete it and use the freed table. Keeping the
> table isn't enough either, since the next allocation in that range
> rewrites the level 1 entry while the map may still be running
> (R_SDVFP). vgic_v5_alloc_l2_vmt() and the ITT frees after a timed-out
> invalidate have the same shape. The question is, can an IRS miss the
> poll, or is a timeout here only ever a dead IRS?

Thank you for your patches Fuad.

The latter, though freeing memory on timeout wasn't a good idea given
that there is no way to cancel the respective, pending, mapping.

> Cheers,
> /fuad
> 
> --- >8 ---
> 
> From: Fuad Tabba <fuad.tabba@linux.dev>
> Subject: [PATCH] irqchip/gic-v5: Invalidate the level 1 DTE when registering a device
> 
> With a two-level device table, gicv5_its_device_register() makes a
> level 1 DTE valid when it allocates the level 2 table that it points
> to. However, gicv5_its_device_cache_inv() invalidates the ITS caches
> with ITS_INV_DEVICER.L1 clear, which doesn't invalidate the level 1
> DTE. An update isn't guaranteed to be visible to the ITS until a cache
> invalidation that covers it completes (R_HQFDL in the GICv5
> specification). An ITS that cached the level 1 DTE while it was invalid
> can keep dropping events for the DeviceIDs in its range.
> 
> Set ITS_INV_DEVICER.L1 on every device invalidation. It covers the
> level 2 DTE as well, and has no effect with a linear device table.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
> 
> Notes:
>     Setting L1 on every invalidation turns each registration and
>     teardown into a range invalidate, both rare paths, and keeps the
>     function simple. Setting it only when registration allocates the
>     level 2 table would miss a registration that fails after the
>     allocation, which leaves the level 1 DTE valid.

I can't follow. I agree that we have to invalidate the L1 DTE on
L2 allocation but that's a one-off, I don't understand what issues
you are pointing out in the Notes above, if you can point out please
the code paths it refers to that'd help.

Thanks,
Lorenzo

>  drivers/irqchip/irq-gic-v5-its.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 101aceec68f63..83952e30178b1 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -372,10 +372,11 @@ static int gicv5_its_device_cache_inv(struct gicv5_its_chip_data *its,
>  	u64 didr;
>  
>  	didr = FIELD_PREP(GICV5_ITS_DIDR_DEVICEID, its_dev->device_id);
> +	/* L1 also covers an L1 DTE that a registration may have just made valid. */
>  	devicer = FIELD_PREP(GICV5_ITS_INV_DEVICER_I, 0x1)	|
>  		  FIELD_PREP(GICV5_ITS_INV_DEVICER_EVENTID_BITS,
>  			     its_dev->itt_cfg.event_id_bits)	|
> -		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x0);
> +		  FIELD_PREP(GICV5_ITS_INV_DEVICER_L1, 0x1);
>  
>  	guard(raw_spinlock_irqsave)(&its->inv_lock);
>  
> 
> --- >8 ---
> 
> From: Fuad Tabba <fuad.tabba@linux.dev>
> Subject: [PATCH] irqchip/gic-v5: Clean a level 2 device table before making it valid
> 
> gicv5_its_alloc_l2_devtab() allocates a zeroed level 2 device table and
> writes the level 1 DTE that points to it with VALID set. Unlike the
> other ITS tables, the new table isn't cleaned to the PoC first. On a
> non-coherent ITS, the zeroes can still sit in the CPU caches when the
> ITS reads the table, so it can take stale memory as a valid level 2 DTE
> for a DeviceID that nothing has registered.
> 
> Clean the table before the level 1 DTE is written.
> 
> Fixes: 57d72196dfc85 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  drivers/irqchip/irq-gic-v5-its.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
> index 83952e30178b1..b2d61ba3828cb 100644
> --- a/drivers/irqchip/irq-gic-v5-its.c
> +++ b/drivers/irqchip/irq-gic-v5-its.c
> @@ -416,6 +416,8 @@ static int gicv5_its_alloc_l2_devtab(struct gicv5_its_chip_data *its,
>  	if (!l2devtab)
>  		return -ENOMEM;
>  
> +	gicv5_its_dcache_clean(its, l2devtab, BIT(span) * sizeof(*l2devtab));
> +
>  	its->devtab_cfgr.l2.l2ptrs[l1_index] = l2devtab;
>  
>  	l1dte = FIELD_PREP(GICV5_DTL1E_SPAN, span)			|
