Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585EA33D6E6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790314143; cv=none; b=q236yfKUnaH69j0NlMcfo0pnin86YgTOqsVTp36eP+z/jesR/kKGh32C4WSvBheIS4do9yUvkQtxPxuHXzdnwPW7EB04QD98sPwzPNLJkby80bDH1MIhHdaieTeLloZKC1Qb3jz/2MrYJ+f/4NqSj4UT5UZFYxmdEy+n8eFFcqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790314143; c=relaxed/simple;
	bh=EQlkcZbyYMaPVP5hT/VoZokRCyh0/k5LdHADmUHN7qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=docNXiU8yWDNeE5jS6o420Y80dkiiaWslIWlL8BJFJOCjDIpczrB3BICI1tfxHe3MZfoDKbXwI7g5n5KiCVz14vYWCstoxTZRTR7JswxPy7TVOhrdazZV63S2DchYH3c6LfPkd+5b33JsObmR3ekd+PUsmnqwjs1F6DmDtRr8oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tHpZRxro; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tHpZRxro"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so1652645ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790314142; x=1790918942; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jjesyLAW8O7xyuzsdrbUH/i4uqP33Nn67plGwTSNEoc=;
        b=tHpZRxrocflsVocNJDqPQghAgI5EX3NufSazf7b6jhBrHXhEw5OGbUu31Ea9HHoLom
         RfZOMHcNIrWDsX6808BoN6LX4lxZ6C6ee2r0qBBkszJR5UHdREucKf5NgbP78/Lh1BWh
         r2U2d/A5IOL4sI8BjTUW78IILmBvv14KcXueN2PZzY8aH0+JdoTa1BLwldpvWLMNO5Th
         DdOoReU+JdxzaTIeZSp5vm0F5Uyx4BKMrDc30ZCbgxgwje8LYUl8hFSalUrBBeRM/ht0
         vdVtf6glxyUHGppSChLS9OX6YQdedEMyTZh5puvuawz8Z4F4ZJ39AP/OsI04OCMieeVz
         hIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790314142; x=1790918942;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjesyLAW8O7xyuzsdrbUH/i4uqP33Nn67plGwTSNEoc=;
        b=GD8P1Jg2VrU3QXowXLe4NQh660tN3h/oGRh1oNjBffPMs+a7jaxlM7mCiJlwxPQi3x
         NmtVKdJDQfFUxCxzuqDBPhbZY4XkaLwKzC1Gcz1lAkT0msMVdNShyvjY+C/17JKZIQbS
         M9ZYqQtC90m2BrL2+Jsmey40GtXI1zohaYakj83OSMsk5k6akSFfQmnCuue8MMx5X2X1
         G3WgeABK+4AohHcD6XXzuQxZ+eSYfEIJCsrelgzMmyRaQfni8vWo2Ua2y5X/pnVXTyOT
         vxU3lIaK5YdSSffq+8HOm2TBdTBcXjMX6aeCZFEVytmvna0LT4VGzeAtW0SmDQ7usyM1
         O0wg==
X-Forwarded-Encrypted: i=1; AKwUvBwsBxcTr1mV7iJcdbK8U2Ri80ujwIJgW1WyQtn0ZkBHacCeWJ3WBGlP02wu+vFTcRqsmJOuKGNfXG142zU=@vger.kernel.org
X-Gm-Message-State: AFuF++lxe1EXZ45jviC+JYcXy0XZEl04VQNt17tIE2XG1/RYAgB43A2k
	VtnxD0j/4mX+suTwHsOKWPfK0QBsB+bgSQ1jV89LJZOz2Be7xrnF5yoj
X-Gm-Gg: AYBFou1U2fnQq59ppN+WZhYF0EFkQA/Po+gNavgl+dxr4oSZ8KwrDkotHo6TZKj5Huy
	Nqr8uQCcJIaPLPJt/uXHJglMKkVW5MuQ5fLAqbNdf6wLYe0jybQF97QS6kl7gNMLfNGsxBKqyQs
	zdqSn+FkfUZuWU2Ezw9kmk/9KDerdidRZSADKM5eK9ssxmlFcjoXDGRBMB1uo89+mNRxbXu0V2i
	ef3Z98HVmwGwiY69LPEp1LY2/okyB/gWf5pWoT1oDyTkIIKi9nj4YJn3fB6v/1jVdH8Rhdda3uh
	EJJycpzx5Qcv+7EWAiO/2mDnuZCP5Fvbse3DOZiDrbcu3lRFaZy/r1wF7WjHq3+BToCdkpXiQQ7
	88B7KO/JJosLm+CIQvEOs0N2NpqsMTdzS8gKlN7zfEXL49v84AfmpfWyC1TNqcCVESi8UtMgTzT
	FF9NDbTgpBgqAG+AV68zJAQCJDzaNFqfhi4/4EK0LeDZjKwc09VWfFgH4Lrz0fddLXZBWcal2HS
	4+s
X-Received: by 2002:a17:902:e552:b0:2dd:c100:7cbb with SMTP id d9443c01a7336-2df7dc514admr37582425ad.55.1790314141611;
        Thu, 24 Sep 2026 22:29:01 -0700 (PDT)
Received: from localhost ([2400:2650:24e0:bf00:cc77:213f:afc3:65e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df964d46b0sm2611595ad.15.2026.09.24.22.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 22:29:01 -0700 (PDT)
Date: Fri, 25 Sep 2026 14:28:58 +0900
From: Zhenyu Wang <zhenyuw.linux@gmail.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: airlied@gmail.com, changbin.du@intel.com,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
	linux-kernel@vger.kernel.org, rodrigo.vivi@intel.com,
	simona@ffwll.ch, tursulin@ursulin.net, zhi.wang.linux@gmail.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gvt: Fix mm reference leak in
 handle_g2v_notification()
Message-ID: <arYGmj-FpQS_OBCA@dell-wzy>
References: <20260916173720.2088455-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916173720.2088455-1-vulab@iscas.ac.cn>

On Wed, Sep 16, 2026 at 05:37:20PM +0000, Wentao Liang wrote:
> intel_vgpu_get_ppgtt_mm() returns a reference the caller must drop, but
> the PPGTT page table create path only inspected the result. A page
> table that is already tracked gained an extra reference which nothing
> would ever drop. Skip the lookup-get for an already registered mm; a
> newly created mm keeps its initial registration reference.
>

Besides sashiko's reply, those reference was designed to guard against
case that possible same ppgtt table usage within single client case.
This change just breaks all of that. So NAK this with other reason Joonas
has replied..

> Fixes: e6e9c46fd235 ("drm/i915/gvt: Factor out intel_vgpu_{get, put}_ppgtt_mm interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/gvt/handlers.c
> index a34f56630af9..3d7aae6c5cf1 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -1506,7 +1506,17 @@ static int handle_g2v_notification(struct intel_vgpu *vgpu, int notification)
>  		root_entry_type = GTT_TYPE_PPGTT_ROOT_L3_ENTRY;
>  		fallthrough;
>  	case VGT_G2V_PPGTT_L4_PAGE_TABLE_CREATE:
> -		mm = intel_vgpu_get_ppgtt_mm(vgpu, root_entry_type, pdps);
> +		/*
> +		 * A newly created mm keeps its initial reference as the
> +		 * registration reference, dropped by the DESTROY
> +		 * notification. A duplicate CREATE for an already tracked
> +		 * mm must not take an extra reference that nothing drops.
> +		 */
> +		mm = intel_vgpu_find_ppgtt_mm(vgpu, pdps);
> +		if (mm)
> +			return 0;
> +
> +		mm = intel_vgpu_create_ppgtt_mm(vgpu, root_entry_type, pdps);
>  		return PTR_ERR_OR_ZERO(mm);
>  	case VGT_G2V_PPGTT_L3_PAGE_TABLE_DESTROY:
>  	case VGT_G2V_PPGTT_L4_PAGE_TABLE_DESTROY:
> -- 
> 2.34.1
