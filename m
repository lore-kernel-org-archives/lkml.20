Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C1B38330C
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790443291; cv=pass; b=i5fMyuAHCwcL7fYm5GYcibJXfpAJrmWYubMf3WJrQdPXbVs+45Xu+ApuAZU0oq6Ew36deJddtF3wZ4vGLv71K5xu+EiKcVgsMz05RZaEwU9XrzJyVInqW38eihRlQt5SDGujEiyJzciO2ysd39Z2PWHy4tHHc7XeyOY5riUtQ2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790443291; c=relaxed/simple;
	bh=9u4Wqtg4qpyeBT0sOT/aJf74/jMuOahB7RDE+KuTt40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzOHSRgfSsgD63JorAjBKtnOoFIYnXer/JNu1cjU72nAK0QZjT7PYLmLOXiaYJIIUaOaESR4+JvSsyM6gM6++rAOqJb5QH1zSlMP7NjyinAPUbKdSGpn2fsm28ARfEZrAYgsGM94S6/7LytV+2mYlKkRIjDEoapdkAHk9JRl1bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlvRd4jz; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlvRd4jz"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5f3317027so174103a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 10:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790443288; cv=none;
        d=google.com; s=arc-20260327;
        b=C9+hhD96+HZ21EiT41FqIfOLjSdphSz6/2hgWSFzN8eRnCn6t0whHsJJN/M7nJbzT5
         3xit3B74Q2x83M9IC7JsOBZINdu84fkVb1MpEw4lEwavf4BI7+oLtfvwGSa3FOeMwDl7
         syHTcTGGxAFwXQ+rwL+SKREW+F7iPDWOBrly/ZHQjS+Ynt8eL2UBtqXuuoBa4O2oploQ
         H8mYangq1QvpQBJAT0pZSLcmCoydNFVFK4Mbnyg5A6AjrSmtiph9QzRTPaw1tzcWGNjO
         pP/ZXEEz0jCQ8XWH6r4cND8tO/DK9Ar4h7Ipn0hAS+7jnnSmx3X8eoI5xi+HHtFufrow
         RMZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=;
        fh=7/Wh7cMnGSb+/y6G4XLByMQUH2w9aDr70d2UJkHiTkw=;
        b=iUlEwuwleRW/R7WlCNH+UHnrki1hvfnu1nkDyE1aZI2pPQ2Ovquj+AcG1t8yu3T4E5
         KfFnTgO0vEzqjIGKZS7/p1cqHhosMgM6stpJ2fyPAb6V1Rt6Z4O2DmDxSKfexp7mPGxI
         9k8TZpaYRmYS6azWlb5SF9SEWTISAcgqWJZrBCEGUeBR7ZilpeznZdll4N/R3psHbgis
         L9zRo4zPQNuugOblYrpsdcNXtfnwp096OQBKkb0bwmrG1SAW+cRZ5DFEWEDOey1tMiCp
         kbSd6cKCVjeo4t2SDaogoHGqc0dIRIEc7IGaDDpOwqMKPW2OIFH3d+rckXI1MxB/kQ8X
         X5Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790443288; x=1791048088; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=;
        b=dlvRd4jzH8V5HqYoI//aWRQ/EWCiZnZjWdbSOca9kYyxX201VUFGqZqEFk+iQzoCOt
         0F8Erf/as7S230x+smAmlXMIPv5wxLBlbIxPb/t1cOtsSmFFJ8GJFgKfa/0p1ragFKd2
         BBFlL0kkWBUvDv0BM3ppToEClLUaffkgaTKys5azDPf2F2cZ5snkzVN8CrkQaX8WHprS
         MQ8SCwRwi2NcHTe5RgUCp0rKVFXg0UG/9zqYRWBjWZyoqmX8pR+YYpTYkcvX/oYj3Xvg
         mcbEiPTSZ++hmx5CfjXT8yuJJPKxpbtkGnmdb+oZNcjcnzaB/vnLFHGWK6MvdOQWLUx3
         a1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790443288; x=1791048088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvyozJOaCBCBuN/SvwKhJCZbcYQBkuG7QNbutM7h4GE=;
        b=TFXXrW+4RkSPMOzAOb9zT3zHf7C1knvljqFCDsBeGtpcuQooJVptWbKgOYJwC62uuD
         ZC00lk4aWrlM//ecCsNLNe6eGjR3faMuavUYPBgAVKolqQ6pGKun7TM58U2qd1Z9mABp
         NlpZ2hnxPgLzolMIJKFOMPA3GDam1uOvkqblMebWLHxl5921ylu4IS9aVHdjAeK5nDW3
         z0LV4/xcybxNpOl7OEPLEyZCEAz/g6uA7T/X5kvajeipsq74JKrceED7Vmm6zZ0P/qTx
         O6qZw9iZQXCu6j9MN2XcNgJZSjv9eXy6/SkZ8/OjViKjW9VzB7J5ONzPq+LD0jlMtv7G
         7X1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxuMX2SZVSnZ17fA+TVW4aSGQCRoUzZIi0vM6eZqLp79onyTF7itCt3ekaPV8JvsgayZHQuQSNsKIKHou8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6HMJ8nUI2OYgmSK7DxSsgUvvmcV5yG4ywKH4UNqrrBPwFuvVF
	HPQqm96r3N6GEt7uM6RZumcjk+WYTbx7cH4NAxX7L3dTm96Wh9I9r41+DPwLINmAH4eMrcLoENj
	qh4GkEBLTD8fRX2I9d290q19mVsnW0RU=
X-Gm-Gg: AYBFou0KPZh3HPn6+5Atk7sOtp5qClILnvL26CGU46J2IiNj7otAHoXDSldYq93UOF5
	vWy73u35jOO6StgtAHeaeY8YhqhmKiYZ4+D5di2jrFygX3WiYBPpJj5fOeJgD4gLn4KzF6hOFPz
	JNfOwzLJzUqCmW8JqkPBTUhqacGmcLCjab50eFVc60vIJWKkV99OZvSko1lP1Yq5caW2dhMq6Cm
	86mF4ks4y9eFXB3lW5RgJGNXLqdYdjC5KlkWPqLsInLJ1kIMmASayiO42LSROGIZzI0hEfN3O/I
	cQ9s9dz7l5JggGj/uPJFdAAnHTwlmrYi48mfcabXyBiq/zq54RRlOVfUcW0R3uHXVwKbiw0guAi
	H63H2vYnuy/o=
X-Received: by 2002:a05:6402:13ca:b0:6aa:13d6:888f with SMTP id
 4fb4d7f45d1cf-6aae1fa590cmr5300101a12.1.1790443287630; Sat, 26 Sep 2026
 10:21:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog>
In-Reply-To: <20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Sun, 27 Sep 2026 01:21:16 +0800
X-Gm-Features: AclHuK_oi-zKoshtXCuOOr3CsOX0yKq1NGgpk2U78md_ZK4k1diCt_1GHatAQ2s
Message-ID: <CAAo+4rUpf=e+rVKR4FhTOuGb+xGx+yTz7KOZbrRc29ErgznuCQ@mail.gmail.com>
Subject: Re: [PATCH v3] dmaengine: sun6i: Fix potential deadlock on &sdev->lock
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 1:10=E2=80=AFAM Nguyen Minh Tien
<tien.nguyenminh@embeddedlinux.blog> wrote:
>
> From: Chengfeng Ye <dg573847474@gmail.com>
>
> As &sdev->lock is taken by the tasklet sun6i_dma_tasklet() in softirq
> context, other users of the lock in process context should disable
> interrupts, otherwise the tasklet can preempt a holder of the lock on
> the same CPU and deadlock. sun6i_dma_terminate_all() and
> sun6i_dma_pause() take it without disabling interrupts.
>
> This was found by an experimental static analysis tool for irq-related
> deadlocks. Lockdep reports it too on an Allwinner T113, where the lock
> is also taken inside the HARDIRQ-safe vc->lock:
>
>   [  299.389380] WARNING: possible irq lock inversion dependency detected
>   [  299.411196] c7109568 (&sdc->lock){+.-.}-{3:3}, at: sun6i_dma_termina=
te_all+0x40/0x2c4
>   [  299.419137] but this lock was taken by another, HARDIRQ-safe lock in=
 the past:
>   [  299.426398]  (&vc->lock){-.-.}-{3:3}
>
> Use spin_lock_irqsave() in both places, as
> sun6i_dma_free_chan_resources() already does.
>
> Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 =
DMA controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chengfeng Ye <dg573847474@gmail.com>
> [tien: rebased, added the lockdep report from a T113, Fixes and Cc stable=
]
> Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
> ---
> I ran into this on a MangoPi MQ-Dual (Allwinner T113-S3): with lockdep
> on, stopping dmatest set off the report above in
> sun6i_dma_terminate_all(), and a small test module set it off in
> sun6i_dma_pause(). While looking for a fix I found Chengfeng's v2 from
> 2023. It never got a review and no longer applies, so I rebased it on
> dmaengine next and added the lockdep report, a Fixes tag and Cc stable.
> Chengfeng, I hope you don't mind me picking it up.
>
> With it, lockdep stays quiet on both paths on 7.3-rc4, and dmatest on
> four channels passes while another channel is paused, resumed and
> terminated in a loop.


Not at all, thanks for picking this three-year-old patch up and
testing it on hardware. I=E2=80=99m glad to see the patch can move forward.

Best regards,
Chengfeng
