Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5C67080D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903341; cv=pass; b=jlMREScYCtGwBA8EI9wa/et6zn99X1UYqychIFGYXXRI7pB3eGGCHWWE1SgEc0CzGj7dfo+SRl9wwXfTOZGQirsE3LFrHRVWg92DHDlttgNyD+PpBNb9YJQnrjiOLaIDXmT1O7KlkbIR3rzlNRrXp+hC+e1K/+/RuEArmFPRKjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903341; c=relaxed/simple;
	bh=JOhprJt3yuDmBPMpNx+yy62G+dzon9ZN29ecqaMOKyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdBsTWdZozyWTIuPsigLtj7aYeyv7pg9vx8JF09+yjeURF0YgRkkN0ZldgGqg7/nuSrCN1pTJC9Pj0clMWhvwvu+Ny79WlrU7NqyCP5sKY9WtKmjGrqrpHbEy4aAU/HiUV0OyepgjGr02rr8zTvgfRqBCgC90rRQey3D0icNpdg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9wec3DF; arc=pass smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9wec3DF"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-6768036283dso2256079d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 18:09:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790903339; cv=none;
        d=google.com; s=arc-20260327;
        b=eQG/VRFcj9+bYkky56MJBbqXkQ5TYcxlksNOJwzgp2KOoLJVIkrpVGmQOe2UoDLE9n
         UUQL643nJwDw4dnA94zZbXbAPjiJ2P43zDXvPrf2BuCsSJ6jZWOorKPrXcxrA/5lHoSl
         YMw9Iqvplkdtrc4SU0HOn98LWfPGmMdgain5XR/yzwl0jj1Qem8BOnj6s+i9qnIdGdq1
         rczti9j5BTL9XFa+hkbsnqcJzeLkM7mQABEDIQIuAbe1NPQCYlaqjxIVB4dlQBJ5HJcE
         WukP1hjb8Ia5YqZVtpCAiQYtxCexijsqcgwyFTZjGuC251/LJ2/geC1Y3DvL0cUfUOdF
         hTIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OP5zp61MrjKPY8CNhX4kYBCEBteI7PfiFh3wprS0txc=;
        fh=bvMpWDbZzHypzMu5PYw//QaZpdxSzMaz/WkWkxkZfrs=;
        b=HlUmGdnr26kDor5O6DYGMPp0PrnOt/trZjk6aR59BpbPIJiRoh3DzPMHLfh72B1h+D
         R/TkZ5c62jmS1mrrAxcRiCSS4Ds3U4/++hNiMNnECLKvBLZ2lSgZXmgeGbSMfi7Z3axA
         u/3VxwDoYT3gVAHJ3I+hJSJlYHOE6gnQplkPUjIgcLYUbU6NJUASUJvYpAZGpFvX0Ezd
         KdggIFAehztsDlUmktIe1KG3gPWOWM04vhfM905rpFdWxa0UG83E7H5yXwPPY8TBNcYu
         HEQdg+hp0WWi1ldjNVICxZJ2Lj5rf6JieEkaPsZpl4iZtItkj9Th5VczI4j7IiuN7BrP
         Xg+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790903339; x=1791508139; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OP5zp61MrjKPY8CNhX4kYBCEBteI7PfiFh3wprS0txc=;
        b=F9wec3DFHsWNxRwm9xJIY06Anv/iD3m/vSFLvGiPcBl80ubQySgSOHwiDZ/8koW0iE
         sWdJQAr0xb7ofoRmIUvVaee/LPZonhZPKiUWBflud2cz+dYiIryzMaOTbWQFMGKrKvKm
         4mQf9E9zem8rJKs3OepMp5zeVnviveuEvsdP0OETdn5eBvUdeauX51A4gwKdxKuz6DhG
         GS6vH5x/Qi1tpr+TGou5lK97An3F3CbmxclT3w7H9QvvtWr4ZcrIuZdqivZAWTMjJLr5
         FEIjIOv5EtUFsHTDvvJWOXwnWenD+pIcyxlN6m22dSyrcT2+8mwnOmaxsIj8MEzjjS8t
         T8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790903339; x=1791508139;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OP5zp61MrjKPY8CNhX4kYBCEBteI7PfiFh3wprS0txc=;
        b=BFSCjx1NVcZBv8Y9OiM9cqDS4udESVgrtqwBk1mfIhdT7XZwILGSBI0F2OX1rZMlJu
         4eQV873Q844Yw6Sfsy9ZqNeK08yOuZWvtwMYIM1jf7vOsvfJc1maLkQMp/9C0ZzePwHx
         aR2aKk6OtQDpyb18jXkN7gqYx5mzcD6j64QFS3cM7FZvQI9IAlKQsq5qJuiwhellHKLu
         KSlE86DZbf8WfuYwE/Rt/RFwF2vNb07x3Ca8uyYlE5fWIsUQodMJuvVDwX0sj8al370v
         pvN23Sr76ESrP/SdsmgMPs1PZ1Lb0Tz82Bc4yHSrXABtFXpjnDMXVmSKH2UeYthQv9Ge
         lv9A==
X-Forwarded-Encrypted: i=1; AKwUvBzf0zHTTTIt1NnXQAsk8Icg3qoW2WnsMZheUu2INl4sZ8tIn/L7TZ212Lj8AnquAa25oZLOM4N17y7qoq4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1RKVz3lhTqVUMHCcwIrrYLl/R/kMVFavwIDFgy0EvVUC0j6Nq
	6x2sWn9jAPHDhXQuKHW/Ub5BMvcWV/Ph0NwD5k3EcUbdxLiuB2n6KDXmmgbwJHViMula5mkq6Ei
	CdqBu5W739YSCoO8osf7o5hHMePBApSU=
X-Gm-Gg: AYBFou0LtnKTLyOuOlOTUawLJIC5iihsjx8Goih0rs1A3+R+efqXpryU/PSeF21RLru
	LhIxRmo/mzDRE+BCsci5ttIESmIQPrQf+HwUutF73xSEqDKMLmkFXiJNqXnIJGueW3sYCQ4SZqR
	OvvrhzGgbEACzuLde22QJSqqS2AzUdkBmS0J6feFrGFxOymolvzAsdgbrigLRUqKmV17SgJ5Xy6
	6x+sGCLKpS9qOc+rmP/WHB8gaWTIQDsr7t9GnnT2CWpRL/cQVYxtLiqGTLgocUfoPGTQ4V50K/9
	VTOieJV73AlcWHoAELd5Mxn4cL3FBXZgYaD7O6tCUKjhQzTEbCiyVBGIKZQJdKWiygQ=
X-Received: by 2002:a05:690e:1d2:b0:673:2e61:1720 with SMTP id
 956f58d0204a3-677ac0ae6bbmr380025d50.82.1790903339575; Thu, 01 Oct 2026
 18:08:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-pvr-fixes-a-v2-0-f58254e5dfb8@gmail.com>
 <20261001-pvr-fixes-a-v2-2-f58254e5dfb8@gmail.com> <0e62e6395ca0ea1c0cb6d5f973eef05a57df2136.camel@imgtec.com>
In-Reply-To: <0e62e6395ca0ea1c0cb6d5f973eef05a57df2136.camel@imgtec.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Fri, 2 Oct 2026 10:08:48 +0900
X-Gm-Features: AclHuK-OHWJzRH5kn9gO-J8iY5okJLINZwSskhDvYeT2xdlw8ABFwgR8e13fUWU
Message-ID: <CAKbEznvLy3dio5FigiVzcAggES0e1fjd_xFUzq_SZ4+zv0Rw5w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/imagination: Size page table preallocation by
 device address
To: Brajesh Gupta <Brajesh.Gupta@imgtec.com>
Cc: Luigi Santivetti <Luigi.Santivetti@imgtec.com>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"airlied@gmail.com" <airlied@gmail.com>, Alessio Belle <Alessio.Belle@imgtec.com>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	Alexandru Dadu <Alexandru.Dadu@imgtec.com>, "mripard@kernel.org" <mripard@kernel.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"imagination@lists.freedesktop.org" <imagination@lists.freedesktop.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Brajesh,

> > -             const u32 l1_start_idx = pvr_page_table_l2_idx(start_addr);
> > -             const u32 l1_end_idx = pvr_page_table_l2_idx(start_addr + size);
> > -             const u32 l1_count = l1_end_idx - l1_start_idx + 1;
> > -             const u32 l0_start_idx = pvr_page_table_l1_idx(start_addr);
> > -             const u32 l0_end_idx = pvr_page_table_l1_idx(start_addr + size);
> > -             const u32 l0_count = l0_end_idx - l0_start_idx + 1;
> > +             const u64 last_addr = device_addr + size - 1;
> > +             const u64 l1_count =
> > +                     (last_addr >> ROGUE_MMUCTRL_VADDR_PC_INDEX_SHIFT) -
> > +                     (device_addr >> ROGUE_MMUCTRL_VADDR_PC_INDEX_SHIFT) + 1;
> > +             const u64 l0_count =
> > +                     (last_addr >> ROGUE_MMUCTRL_VADDR_PD_INDEX_SHIFT) -
> > +                     (device_addr >> ROGUE_MMUCTRL_VADDR_PD_INDEX_SHIFT) + 1;
> Shouldn't we use 'device_addr + sgt_offset' instead of just 'device_addr' as
> start address for l0/l1 count calculation? Only account for requested mapping
> instead of whole memory.
>

This already counts only the requested mapping. `device_addr` is not
the start of the BO but the GPU address where this mapping starts, and
[device_addr, device_addr + size) is exactly the range pvr_mmu_map()
fills.

Adding sgt_offset does not narrow the range; it shifts it by
sgt_offset, which is an offset into the BO, not a GPU address. This
can leave too few preallocated tables, and VM_MAP then fails with
-ENOMEM.

-- 
Thanks,
Gyeyoung
