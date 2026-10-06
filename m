Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B508A3ABD8D
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 08:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274619; cv=pass; b=oCIk45tJmbMKtkKPFfCeZQQaUPaAYCAck5fOYhi63cjgauB03+jqGKX5ak8+SjWZ2pM85UrqcbHi69s5aY8YMGWvS5nw6wI+JNwSoJHi6DJXwDtcyjhSiE+/dHgOWPjwZpBSRVe3vYuQ8DqFt25NsGjRAyvV+5ob0r0vWCl3bqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274619; c=relaxed/simple;
	bh=3/qcKLki0ue7nV6GwBZGHBVJFNGkKXvy/ZJioZDVx+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=plFIUqShlmgZ5lfmOp/FqrCNyAd1YYR/n3pp+Um0Jdg7hDXNTTj4wcwHUdyhD0TdhvfjFkGVbw9HnEv7Zdow645KPcHmJyvolaoh+31pLvPg3dRRVj/8MEM0OjD1MEDQAM9HJv7DTf3GVTapZbous6kX31cCNnVrsjU+g+PXBfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rfCTIkyD; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfCTIkyD"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67694513f2fso233589d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 01:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791274614; cv=none;
        d=google.com; s=arc-20260327;
        b=EvBwk+5/ByMG7V3yHeUiP38VEQ4GIFWUh0hsGXO9TciA3YxvRaQaCS4mnCGcD9sn7E
         mViXSbyoU+qCm0e4rS0D+iNfuTzhqa5Grtcs1QMAVvQhvVQYry/couad6Do1XXNAhUii
         tmYIWV/lJBce28mYhzR6OlEK4kETCWM+DBEyTcILmHl7HRrNuWrlQA+eAo1Xf+S2ZDSa
         fiPcbGiZAdUuTzzALIZ08JGODpOSc2ux8BJTKAGJjsmjZYripZgKnx7uAR6Xnoaw7OgM
         wlR23zpOC4vPBYvm6seACKI9ZVo37dNmCXCD0Hcj3sNZqqHZQvzzw3H12EhC4+Ggt9Vj
         vUHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M9Rv85jYRiQwHKznmIIhpDMEGyoRERFYUq6l/Icw6yw=;
        fh=O2uMQQLJKEEHPGwd+/i3Hk8yjwhJGDIvOiKrK1uD9jw=;
        b=J/gOofGbNMXWh2ftL/3zP1i4qWc/pJjO0vwLiPqT8/n/tze3wEwpDEgN3hCr+odOXB
         OWR0X0+5qpOy/5tNcGtM2jDo+hZLrmut/aHrICY1VRKxWzJylw42PSUMA4hCp4vPSL/p
         ouIZnPboaiNcIcmJIPMCvBHXgwxL302WG9nNQOXf5sRRV1Zm1X9+oSZlrqaxz1Fhnm79
         PgyG4aMCw9AzKB4cAWRsKMHTX2gYVsox+fxrY5eXAdCOLbn5zFA35Po0C44q7lXfDoIy
         NMoljeIsVitJF8Wt67/PyfxjKHGwDvo1lUpATU5JGbFa30m0SXWexOH1O3+Te+wUDXzl
         mpfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791274614; x=1791879414; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9Rv85jYRiQwHKznmIIhpDMEGyoRERFYUq6l/Icw6yw=;
        b=rfCTIkyDlvjVfF3IrrtO9rFY/Dz11feOWIIBXYDROys3H1jAHEICyCNm8cTccXTdvX
         nG6kVjHgU7/Lj6JPek763xAgGK8Sr1NaU8/2lM7lBRPO8ZUB8lmWYxZYf4sCB1LgqSBI
         jQ3BYZMhgdpRKBMbpYpe5X0E1UeAwRuUSXydR45vcn0pis6pezZwtR8mgb5dxl6F1HQh
         0IrI89SfddnZ5IZA8VhTX+tz+9jqahWotnOHgVPPKZTLD9L3p+HeFCuGfTiqILqmnbHS
         q5GqXnzV0mG/5yn1ODGDiB0AmlCnUmZ7PeV7DgVo8jXWE9oZycvMjjC5tRW33ikfUWNA
         rQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791274614; x=1791879414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M9Rv85jYRiQwHKznmIIhpDMEGyoRERFYUq6l/Icw6yw=;
        b=lVxFTRv7qGoV6alSj1aj9mFBvtUGIDLh0U/Xm2G5SgIQTiLJZbT2YgmVUp85b9lxTc
         Ngamp+SIGhIEg+dUyrn55FifMsgtBHQSspuS1cn4EPbwsYkxyqm8whylsGoj2Moghi7j
         HOLm4IdiwJpYS7qRzbTaq7Z+3O4VKsxEJjpYcICSJ8e83LSDCXLl276IU2SPjqOfOVCH
         GX469PUcYdIzjBSQkmAfcyCHrPiPcb5LHvUsG9bCvD7GCvRlZxzWAMphDpoYj0r6Q2iY
         D91RnbM9uxP92S0gA2O7/ANPNyqY739aFXdlMHwB+DAeYNOG7uFuc3OBYRMvsRa8Q+a7
         Yh5Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/qIgV/qhiOTNwkymWEHI0FYJ4r1yepHcUb+8nvN7drkQSa9P/W7RIKT13T7/+qTdS0S1AczvkviIF1cI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKOD5U1QGqD2Fh7ZxfEoEtusdZMyIoY6mosetblD4DeVcYmQL7j
	+nUSdpO1NDyImFaReZX9I0wJ9EsRkSuNfpHAHSwcpdBV5eR1Lv2xDVyrh2TZqKekIyNpN+ybkaj
	o1ZPel1jFgj2xG6G0ZewT8aoVZCb53KnmXmm6
X-Gm-Gg: AYBFou1lJ0iK0gGbGc0OEQOmXEsWGfLW4niyNv0TLwH6iVmQPg3I83gs2C3+Ox1bsGP
	ju83C0abUDwIqthgvG5f0cg7ZwrWVc2VdSJfqZ1zkwh0cNTVdjOllBIkJdfd65bMH2YWIvibdoi
	r8+JgnzBGqW4YtcOSiX7d/0Ah/azqQBgoHh+bsKxsErbeR3dfw829YuyF729F3U47/ohluroU5q
	JabSawfuy5iVktDTvwEfcoKu3c5HLBqYdKcQ2CTKBZeS4d6oSnfjvP5aKhp8GiroNrTxklhbxFZ
	cL1WUQdcpLftMeTI8BV73JLOF4UhtDOFPNRw2JTUFd0xQwfL8o/d9Mmd
X-Received: by 2002:a05:690e:4889:20b0:676:8313:bbce with SMTP id
 956f58d0204a3-678fce4b33cmr117248d50.122.1791274614075; Tue, 06 Oct 2026
 01:16:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-pvr-fixes-a-v2-0-f58254e5dfb8@gmail.com>
 <20261001-pvr-fixes-a-v2-2-f58254e5dfb8@gmail.com> <64b915fe3c794567a04c955fa89184204e3b9552.camel@imgtec.com>
In-Reply-To: <64b915fe3c794567a04c955fa89184204e3b9552.camel@imgtec.com>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Tue, 6 Oct 2026 17:16:42 +0900
X-Gm-Features: AclHuK8Xt4FPcZVN1sc_kd2ytwjyU21VKl9isbIhwqEN1jIJop9c6JgW5_I0rHI
Message-ID: <CAKbEznvDanJtt8yEL2UmTeLpA1SZOT693E6AD1Xau+mU4Mztuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/imagination: Size page table preallocation by
 device address
To: Alessio Belle <Alessio.Belle@imgtec.com>
Cc: Luigi Santivetti <Luigi.Santivetti@imgtec.com>, 
	"tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"imagination@lists.freedesktop.org" <imagination@lists.freedesktop.org>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, 
	Alexandru Dadu <Alexandru.Dadu@imgtec.com>, "mripard@kernel.org" <mripard@kernel.org>, 
	Brajesh Gupta <Brajesh.Gupta@imgtec.com>
Content-Type: text/plain; charset="UTF-8"

Hi Alessio, Brajesh,

>
> Somewhere in the description, could you also point out that the previous MMU
> page count calculation could underflow when a mapping crossed a page table
> boundary, that would lead to the driver preallocating a huge number of MMU
> pages, exhausting system memory (so more or less what Sashiko pointed out in v1
> of your VM_BIND series and in one of Brajesh's recent patches), and that the new
> calculation also fixes that? I think it's ok to fix these together, or anyway
> I'm fine with it in this case, but up to you if you'd rather split them.

Since it's all within one function, I think keeping it in a single
patch makes more sense.

> Due to all of these and the fact that these errors are easy to trigger from
> userspace, I think this patch needs Cc: stable@vger.kernel.org below.
>

Agreed, will add.

> > @@ -2337,7 +2337,7 @@ void pvr_mmu_op_context_destroy(struct pvr_mmu_op_context *op_ctx)
> >   * @ctx: MMU context associated with owning VM context.
> >   * @sgt: Scatter gather table containing pages pinned for use by this context.
> >   * @device_addr: Virtual device address at the start of the requested mapping.
> > - * @sgt_offset: Start offset of the requested device-virtual memory mapping.
> > + * @sgt_offset: Offset into @sgt of the start of the requested mapping.
>
> nit: could you also update the other similar description inside struct
> pvr_mmu_op_context?

I'll address the rest in v3 as well.

Thanks to both of you for the reviews!

-- 
Thanks,
Gyeyoung
