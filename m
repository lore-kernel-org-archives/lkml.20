Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792681948;
	b=xGcs8Y9JTgIj8ZkjkAmd+g7OwpgmTgdP6USOc/GbCSfy9FQWl3EYtPtbsq66rWa4HZit
	 DX7/w7cYOgyZYThGGhV+w9IG/1RHrjvnnpUDQX/NXBOcBD5SqFci/8AmkmNtJ6YF9TVhY
	 2AHYLEWkw4ZnhDuYT6wPDsS2izqrcUkKcG+YOtP17JJFxCVswm82wCXb7qzTpmPZSwefV
	 mHd6Fe2985AbU5LNG4YUnaJVsRY4EpG32l5butvMDkR7rfRFjgnYvpzdQFDpPCsDBjA7q
	 +GEWvL+uZiQqzqMvrK3J787Uy5vgsUrsSr00BHryJYV2MfL1H/HkvFKcclOJhrHymsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Y6tRRI63BHu6BkuvJZ93X8sv4xfpLog4Vlfs+glJY/A=;
	b=td16oUShKLInq8zBWUeRoL/iAChhNqvmrTcVKOd7HFBIIqbtw8cdVq5DdnMTxE+m0YTZ
	 6sK3w7tORB2OE/HekR0iUWGdnaUpToJfyeGSiXLpX3xyy7rlO9Z1/HeRBG3/Ot2JvOlVc
	 Dgg7GhHyirwE0Jt2IjAOfG9gbbYitqawSxkVhhd9Jguhcn11eb0mObGCnO+GYBXmuPAZZ
	 /Tr9YAS2IMYfmEPdasZvGcLzCfcL7EDCXvsasWXcH3J628qToTeDbuQAl74y3g1nLNYG8
	 hhNSe3xbzLoMHeqWeWkkMnFv/2Q0834ugigoRljJFs+vDfPheEYsKBmdJIkydu11Z1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AxqnO1lD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B460A6F6B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D19B460A6F6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AxqnO1lD
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc074a653cso98131137.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792681947; cv=none;
        d=google.com; s=arc-20260327;
        b=dyQunqvhPow+rouayeZW5HWLfLxotSVRmVPe7WsmVFrVMLzMKFS9H8EqOnNB/003qY
         evsLW+cXhAvNVaT0qaWXOmapEL8I1P6oLVZ9EAhWnacuIP6Y4QEFfXfxSELw83waIZYc
         hNMSXzXTDE2ySasQjMaVvRQ427440X1ixH8YgcscADr8nepeoecIq7kGHj1unTs5ATQl
         I8+Zqi4dgNopm8CXEMqfzubRXnlaqTsOteRRnsy7I3ifOiz1Kf7MRAX5wyf2EXr9k5XE
         z2v+wRQj5nix6GHLBHui5hV4kHnsBXWlLYuwOcJeTzCbRKmgLL33PbY9tURe5bBuyVyV
         JoZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y6tRRI63BHu6BkuvJZ93X8sv4xfpLog4Vlfs+glJY/A=;
        fh=39uu7uyH7sCg7rPXwbMRLvSWXAKcC/3PKixMlOMuxxs=;
        b=W/LZjll8ixOp/9Ipmhhsgaf7Du2HN1cGtU8k+Djzzlgm+Df3qHtC78dvWwVcUxPW+s
         uvW9mXORP0B9tTU7JcPsng7JrhuJvJDY/x8p09m0uk4+KEADSnxJdzSkxDOehuRBzkQd
         0pxyBxrWHcaRtrdkXLx6HXU8JBoLlQJdZ8EkEDGvh1BK9tBfflNnL7XhetDDRgDx66ZK
         98BjE7+VmS3SBoOtS2n8WmczcpiYU7aKp1wFy1ZXIUPki3UN8nvzkNeX1A7VVv64G/o2
         ykNfLfEOIXtGPmMqux+fBbf2YcyfBDY8e2dogs/tDg0/BeOJDbY4Gtm2SHpEc48RPdWs
         m6AQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792681947; x=1793286747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y6tRRI63BHu6BkuvJZ93X8sv4xfpLog4Vlfs+glJY/A=;
        b=AxqnO1lDSBN7+Z6L8/bfJ6G7pKFBWvisaSX+FyoT+NnJ3b4w2X0X7chLH5BSM2suwY
         d5l0Mep/6Z4D6KnBiARSYyEHPaRFP3d7NeCaCljdqFP9o16O6uC6yZIKDfWDqg77m0WT
         hYNJquFMTkGhPmp4Se94CwyHAAYzMu3hxNp55ygbdGunefzjqfr2cM226jDSmyRJmpKp
         xTYqRoartLHDajkJxihNK0G0USxZDnt+sNqJeCYAxSlmEQxTcKCoGAQFltvxgu42b5Xz
         RHN5aQPwIjBMIc6k6VYbs/RiWw/LlPQDpY7GZrO+6RMca42OdlHAAT1gOs81YYaOkjpW
         OvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792681947; x=1793286747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y6tRRI63BHu6BkuvJZ93X8sv4xfpLog4Vlfs+glJY/A=;
        b=AlEezwCcW4+4eDfeH9MQG4lWBKQV5qndIy8tAA8gjd/uyjTsoOs9Gr1tMAo/99rjlB
         3TYaoKsiaZN7riGKzhEHsGO/RNNhIKEQd4lZIym7ZLa4byin2VdOVXx1V0bsDXzywoTK
         5v3n9+UCVsaLs3WKyzZE9SopVfPhKWb3qIsYlyBD2XN8+v8FKKBDczVehpoZw6KoxodP
         mNXE+ir1hWaxPl5y6T/iQ5iq8wvHjWhkznyKCkCcFlLfqEDI8gobjjYs7GLuMRuWa2tU
         whOnwqj99y0t1WPSSHArW8NWIDT5vy4Z+XrtLit4UvF99JgElbiuhZcbw/7MUqx4l3XN
         2XnA==
X-Forwarded-Encrypted: i=1; AKwUvBw+Jt2GsXxNQtDhf9HyV25N7FQOPZoJ86n4OfhdpEtVXbyRHGP545eY5yL0gn+msME3jg/D/8yT5hj6nOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIi3Ld8yA+7iynWTFTvLA+Xkc0vsdkDpz3WSImDxGiqsGg/hDM
	tkhjnOsuoWgSNejnC3kiWf1kasQlg893nmGBEl4bafFXHexPtYO0ERgQsxO6N74o8rslXnHK3qp
	YPHwNpKMjGYbXl41hjnq48yVhxf1PrHA=
X-Gm-Gg: AYBFou3zY5UdOGH9vRZ1sxdFyjcOr240feZ59mcVGct6UDYMULVsMniTIeVPLgin3g4
	mMr7F/UTDon5iNCHz7h12g/ZCCirsDhv4ANYbEUElgJfi4cpmGGTXWiG6EzukKHweNuMNEP/Div
	1R1Lf0l3o0eZXwzAY6Y4ToFAL5EXDfSjPfrg506JfbzMY5MkUTonW6JU1rKEq4BitrLxX3l7h2q
	1i/7pSNU6SuaET8vfCvXOUoEizQolE/76u6vfCL3Neo8vUy35iyKpeekI0CW0Q8OHiDjktw5B7J
	oZWs999TJupPelmgIUi5sjghnMwu+I/91McNzDi3eKh2SzqILhmQSU00VNyJ3+pWe3uN5nUe0Xs
	kUCvFYyFpbSxlHeGuPzOYJccjK7ZduJLddmYZF8VTA8mDw7caj9UnM6lO6TEzqJisaaWN/bzonH
	DBmCgYrYhx8NXcep29ANkSgnORt2g7Zx2oizZZO+/YK1e1
X-Received: by 2002:a05:6122:5219:10b0:5ea:cc1d:173e with SMTP id
 71dfb90a1353d-5eaebc1422dmr1548043e0c.1.1792681946761; Thu, 22 Oct 2026
 08:12:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022114754.865669-1-mptagliari@gmail.com>
In-Reply-To: <20261022114754.865669-1-mptagliari@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Oct 2026 11:12:12 -0400
X-Gm-Features: AclHuK_pmpA8FYbBRpXzvreBUaKMzQ3M_QgHr4Byziz9NDrFFS95zIqKnggaqPY
Message-ID: <CADnq5_Mvjyi+a_2zhSg0cmNUm7nKCK3kD8_0+mcFYeZzbQ-d2A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/radeon: fix VCE1 encoding on SI by handling
 the VCE interrupt
To: Matheus Tagliari <mptagliari@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	=?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 9:21=E2=80=AFAM Matheus Tagliari <mptagliari@gmail.=
com> wrote:
>
> Hardware H.264 encoding with the VCE block on SI GPUs (radeon driver)
> hangs the GPU after a few dozen frames.  I hit it with the KDE Plasma
> RDP server, which encodes through VAAPI, and reproduced it with a
> plain "ffmpeg -vaapi_device ... -c:v h264_vaapi" test on a Radeon HD
> 8870M (Cape Verde).
>
> The VCE1 code never enables the VCE trap interrupt and the SI (and
> Trinity) interrupt handlers do not process it, unlike the CIK code and
> amdgpu.  Patch 1 adds the handlers, patch 2 enables the interrupt.
>
> Results on Debian 6.12.113 (see patch 2 for numbers): hang before,
> none after, and 34 fps instead of ~4 fps for the workaround that avoids
> the hang.  The KDE RDP server (KRDP) itself, driven by a local FreeRDP
> client, now encodes on the VCE ring for several minutes (about 40
> fences per second on ring 6 in the radeon_fence_emit tracepoint) with a
> clean kernel log.
>
> Two caveats:
>
>  - I have not worked out why the missing interrupt turns into ring
>    lockups instead of only added latency.  What I know is that the
>    hang needs the VCE ring to wait on a hardware semaphore (disabling
>    only the waiting side, or both sides, of radeon_vce_semaphore_emit()
>    avoids it) and that handling the interrupt makes it go away with
>    the semaphores left enabled.  If someone knows why, I would be glad
>    to improve the commit message.
>  - The Trinity/Richland change has not been tested on that hardware.
>
> The series was developed and tested on Debian's 6.12.113 with the
> radeon module built out of tree.  It applies cleanly on drm-next
> (fad06cf), where drivers/gpu/drm/radeon builds without warnings (W=3D1,
> allmodconfig) both after patch 1 and with the whole series.
>
> v1: https://lore.kernel.org/r/20261021114122.94008-1-mptagliari@gmail.com
>
> Changes in v2:
>  - Patch 2: only enable VCE_SYS_INT_EN for VCE1 (family < CHIP_BONAIRE).
>    vce_v1_0_start() is also reached on CIK (vce_v1_0_init() from cik.c,
>    kv_dpm), where the register is at a different offset and is already
>    enabled by vce_v2_0_resume(); v1 would have written the VCE1 offset
>    there.  Thanks to the automated review of v1 for pointing this out.
>  - Patch 1: unchanged.
>
> Matheus Tagliari (2):
>   drm/radeon: process the VCE interrupt on SI and Trinity
>   drm/radeon/vce1: enable the VCE trap interrupt

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>
and applied.

Alex

>
>  drivers/gpu/drm/radeon/evergreen.c | 14 ++++++++++++++
>  drivers/gpu/drm/radeon/si.c        | 14 ++++++++++++++
>  drivers/gpu/drm/radeon/sid.h       |  2 ++
>  drivers/gpu/drm/radeon/vce_v1_0.c  |  9 +++++++++
>  4 files changed, 39 insertions(+)
>
>
> base-commit: fad06cfaf385787b9ffa2f73f049d42dbe1de57f
> --
> 2.47.3
>
