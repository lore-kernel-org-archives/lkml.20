Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2D33191BA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097958; cv=pass; b=ZUb0n16GgIEqRlaQXfYt+lghiCHqA4vjwgwUWE2uh3dVM1NW34n3QPO8MF1RWllP3sriiAOaClJNpGmAYMfQT6ucxcQL9OuNddHXJGkjQNLDUCzdDUBPX9BA9TfBJJY5CI9uPgIO6PK7MNKnqQJ3Ao1/6D06OvbaPyOu84ie1i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097958; c=relaxed/simple;
	bh=UxxKIaYYmPxrvvA5m3BpbmHKvvPaJzzWcWfE21FICq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQ3fjZeDSQeRlNyFJF37chin6noaP+2LJ6veZZ1FoEIr2E6iJ0eiapo8asQN9QWKy7ZFW1PGdZqOW6P+6JiAJIZoWldIb8xMjDAGf33zJj9esCUZNejKkn/GhKq1MWFChbc3Rs9oh7c1Zm+Vnez/LUj/cX5RrfsArEysA0XZxEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=DAW717dL; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="DAW717dL"
ARC-Seal: i=1; a=rsa-sha256; t=1789097940; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gK9/zX6s/coOIucDB3hrRKlVnbVA2vU+V8N0szzMHK6oGXuIDD/o7GHzGrcUL0pzx8PCp5pnetuT+exBQWmFDWDK3KrU/ULsrUpGnpwzhVicO0q5yuNKHPzz74caXY1dKjCfnbZ2RzjAE+UcZ24NXQJS0GYYym0QYj9rBOwgt4M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789097940; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4jJ+POfMu2Tw4yymez9yx/8Kue65U9SCbE/M1BRM+Xs=; 
	b=GUeeBuYBF63xD26nc3JKJwfOKPad99/6c9bLitiS/oC2KynaZLXUcJleDZ3PMD+z5Mr+KJ8SCddNFlU0nb5SRT4btoEwVeuAJ8PCubtrEmKNFw+tz3L0kih0hyRmGUoVDNdL6tFyql9KFOdx5eWehLnQuOhTaHsh0OmZs8KIlKU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789097940;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=4jJ+POfMu2Tw4yymez9yx/8Kue65U9SCbE/M1BRM+Xs=;
	b=DAW717dLhCJ4WO+aA0sVgMY2wLohNEyHW0OSXC64eQAFS9ole/Zeq6wUWptHpEcf
	O2HMfwam5nuZbsOyzIjvu8DSmm2yihOEbdU5HKnrtau8ZR0Fl1TJ3e1d5bcmzQdFGnq
	pSg7PptD05QOMTLniqVYYDSKkGjyFn2b5XqC+jKI=
Received: by mx.zohomail.com with SMTPS id 178909793892232.876527949816705;
	Thu, 10 Sep 2026 20:38:58 -0700 (PDT)
Date: Fri, 11 Sep 2026 04:38:55 +0100
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/18] drm/panthor: Don't pre-allocate VMAs or page
 tables when preparing a full VM unmap
Message-ID: <aqMPMvr9OOo9Q32H@sobremesa>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
 <20260826-panthor-unplug-fixes-v4-11-982cc8f4234b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260826-panthor-unplug-fixes-v4-11-982cc8f4234b@collabora.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/289.74.40

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

On 26.08.2026 16:56, Boris Brezillon wrote:
> In the cleanup path, we unmap the full VA range to make sure things are
> clean before the VM is released. I'd rather not fail on memory
> allocation in that path, so let's make sure
> panthor_vm_pgtable_prepare_unmap_op_ctx() doesn't allocate VMAs or
> page tables when the unmap range matches the VM virtual address range.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
> index 58f0bd2ac7a2..11a9bbe87986 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -1477,6 +1477,10 @@ static int panthor_as_prepare_unmap_op_ctx(struct panthor_as_op_ctx *op_ctx,
>  	op_ctx->va.addr = va;
>  	op_ctx->flags = DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP;
>  
> +	/* Unmap on the whole VM range don't need new VMAs or page tables. */
> +	if (va == as->base.mm_start && size == as->base.mm_range)
> +		return 0;
> +
>  	/* Pre-allocate L3 page tables to account for the split-2M-block
>  	 * situation on unmap.
>  	 */
> 
> -- 
> 2.55.0

Adrian Larumbe
