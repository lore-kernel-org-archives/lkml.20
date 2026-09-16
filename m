Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A732931CE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789519066; cv=pass; b=dmR8KYEw2QMkcUHoMmRWcim9g6oTOU81bomzgMVfapnY6c3uanqf6F0WskvsPFpLs6cSvDCyB56J+WEGUFREdxoXjScOGIfr/R60C2DsvZsyJN/dH/zexuVR677gGLWh41OA+ZTXn4240puqX6UKuH6bZf/udT8xRpFMoMD4XYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789519066; c=relaxed/simple;
	bh=lyc02VtQIZxhw/NaQxlFiomk5M1MRIsJ/0DiRUUBSzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uuCsPao8+lEAXwNGHT4AzVBWcUBs1dxs4V7ZU5VVPoA8+aEnxGY7ysIb0JCK8z868xp5UToL/vV0Ta6JcxMCTa7G/O/RV+JElhTEKpTG5JAtcasLNNsfs1m86hZ8awuZ+CRQlx2Eb7AKaKe8ALLxxBMyw96JIPhqG3V8h1efzbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lH9u2seC; arc=pass smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lH9u2seC"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4b37a3688a2so332491b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:37:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789519063; cv=none;
        d=google.com; s=arc-20260327;
        b=aA9rtYajVsz+uk7GrMPo5NcHRw+hlfnv3yW1p3Ye6qIZm/2FNODJu1fql7z+Yx0H48
         /Q1vELgkoyBKz1D5d9UKwzUTKbYb4VJMaYCCD+ryXwnGe+LOjXH7BvsbNrcDcHGTW+SE
         WobTbOEDeUn5vF9lIFWsvxgzHpQTF1UDSJ+59rHokw39eS+ESgE9XFYKrT2WbpMyiZ/I
         ax7nuxcrYaxKTLuaCfx04ni1gGzJrlmjULgnxoHPVwX2oAL0xRJKqcVhYKpXrzCTp+NK
         fGT8VUsITLQQAV52vT2F8zCZuzR171G/9gh0SDzrVh4HwCSexLiHUi5Wx/WPgr+4iVt5
         YbjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DWeROdCeteC+h1bv3zClbfu9jEolgnytmK08OqnLrD4=;
        fh=XJOJumpCUX9GTTUgV8VNQ1pM3sBRK1wT+FZ006iRW8Y=;
        b=SojWwMGhr3QKTgJwNJMtzvKdeSu2bo+yLpBIDvewcZkV50EYwHndwsDhC78YM6Sz7C
         G6uS5IoFKrGw/kS/c0ApYrOh8Gd8yjsZ8TUOq4qOjRGpfSd6lWwXfs68bkMfPDZZAx9w
         XwdnjiXaOf7vVEGMSKndHTFpl/QN+E514JU60jJSbN96zEqk/jJEyRuMBCtsYDHmYF3z
         kyN9Vd/jmwIQkbUrvC/0964BQjrEvxGrzvIdQMZCCJhTbwIEK9yBTh7qg0a46oN+fLws
         c5G8/+2ksnMPXuOSUbC0ZsbyxDyM90obpQu7+bLHBFH6LvsDtWr38kOLSPP6HImcG7kX
         ddYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789519063; x=1790123863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DWeROdCeteC+h1bv3zClbfu9jEolgnytmK08OqnLrD4=;
        b=lH9u2seCno1Pu6lfoz0hNUo9rocBd2SKeqrIpiV9yF8XKajrD7l5Qj2zHH61/c1H8E
         tb7WqJJ87Iwwd07f+zMB0DYvPhsS2A9gT06KU/ZF57XnQRu8NIYEvmLKN6h9JJe/aN11
         dhtN28MtoLyX9n/ojEgT+9CACwK/O71bZYRxtEhbsGddaHzKBgnUWwhkOJzK3lgnDDtO
         zn+WNPGved0U32aaFGe7Ewm3AtUCc6ZQaEvJEERZ+6A13zGY4j572jqDDD6H8zXy9EA4
         u2OTZhI8frBYy8nQyYWrLOAwhRfpEX1Zwwarkg11BHrNan6g4LO6jjb9kpjG3mluSwyQ
         wZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789519063; x=1790123863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWeROdCeteC+h1bv3zClbfu9jEolgnytmK08OqnLrD4=;
        b=A3FKIvlhSzR8Z3BnAQf2LA9CisIMwSZmO7t+aedsMeCx0kJEcz+6IMIrGGW8M6HaxP
         GwSMh1Lypl+xOnvD5Fq9MW6qtOxYyhs8jXFG9DnIYVf/4jg3a/Q5QLZ7Zh2+wn6NrnC2
         9E3eyFSEKWaxRk6DkyIgHlIx5WUrtl3PGIBEDVAGCMT+Hbe/fzCz2DFf2bXS5SeSS3QI
         3U8nlFzRXIqUJfxvnryOikz21JauW9xS90+pD+CB/nOzOMMaubtJot33ET6C+rQXRjXb
         GxfXcZ7lMTCKf5ebUJHlUc55czylhebkGXZbRosFHpRfm+bEWnY9FjBI38aXo78dEXZ6
         tAgw==
X-Forwarded-Encrypted: i=1; AKwUvBzaL7MMbnv1EseU0ftDDTk/gj1QkfzU0Nu0oW8ClACqfZH2W38GA04GRDWrK8FcowpUUgk2TWAr6ezj9IA=@vger.kernel.org
X-Gm-Message-State: AFuF++nYcQ4EXxBpNqh1HvQ8T9LzeNvCnH1Q35cmie5R56FsT322KA4L
	TmpTzBpB/d08s0SiT3F9zF7dHjfGwEE53VLzWepsWBa5jukRktZqOoPJvcHPlDyDpre+ue1Dw/Y
	NjO8KoQm58VdSJmsxH8SYYPnbw8ZVCsU=
X-Gm-Gg: AYBFou2tmr+/HUfL8wzd8FlsaJuQm04NvrcPeHuAGSYM28pCiQUv3D3uzpMHeDqK+5E
	oQPKpgL19Y/LQNyUW6OL2WDny5IVkr+crI1Y59UGcjyDoNaRDNPYyFuULWZi/FeE5KMuhXrPlMn
	VWAjPmHTbdpMqsO3ppqGzsyFFsqWnThDRmpsK0NXD9z5r/evXT8adgSk0FBRQci6bXMG+nhqVWb
	ArxyTnppNkrtS9LAWF0j72PngtDhxlrTVomVjT00ARMQv56yZHDwTvwTypEZlRBNLDPTFCQZzK+
	ac0m8/Ba6PX7EZUb4Py7zxoCjgzg4Y3VTnYmDggDdkK5fWzanOT+1UcZmaQnvyxGby08Ld0gAsM
	U5k9hlg7GYAUJcPY3dE8nRR/brBcEAZtzQaVPFILnPDDnB53BFmB7c+g=
X-Received: by 2002:a05:6808:1782:b0:4b9:a8ac:47e with SMTP id
 5614622812f47-4ca4c283485mr938132b6e.28.1789519062807; Tue, 15 Sep 2026
 17:37:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915200107.3522560-1-arnd@kernel.org>
In-Reply-To: <20260915200107.3522560-1-arnd@kernel.org>
From: Ming Lei <tom.leiming@gmail.com>
Date: Tue, 15 Sep 2026 19:37:30 -0500
X-Gm-Features: AcwNN1WN6n5VaFsDoH3kCwWcr9SYOgDUJLo2q6b2SsGwG9_bgzJWczNA720qB7k
Message-ID: <CACVXFVMBZemmYjFYYo-E7mij6R6aqNbQ2iAQiZ+P6rqhKxUQsQ@mail.gmail.com>
Subject: Re: [PATCH] ublk: reduce stack usage in __ublk_shmem_remove_ranges
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@arndb.de>, 
	Caleb Sander Mateos <csander@purestorage.com>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 3:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The array in __ublk_shmem_remove_ranges() is one kilobyte long,
> which is really too much for an on-stack allocation, as can be
> seen with a frame warning limit of 1.25kb that otherwise produces
> a clean build on my test system:
>
> drivers/block/ublk_drv.c: In function '__ublk_shmem_remove_ranges':
> drivers/block/ublk_drv.c:5573:1: error: the frame size of 1392 bytes is l=
arger than 1280 bytes [-Werror=3Dframe-larger-than=3D]
>
> Maybe half the size is good enough here, so try 32 entries.
> If 64 entries are really required, the array could be dynamically
> allocated, but that would risk an allocation failure.
>
> Fixes: 309e02dccf64 ("ublk: avoid unpinning pages under maple tree spinlo=
ck")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I have really no idea if the 64 number was significant or just chosen
> to fit within usual stack frames.
> ---
>  drivers/block/ublk_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 66eb55e7162e..6fe85aba32ce 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -5531,7 +5531,7 @@ static void ublk_unpin_range_pages(unsigned long ba=
se_pfn,
>   *
>   * Returns true if the tree walk completed, false if more ranges remain.
>   */
> -#define UBLK_REMOVE_BATCH      64
> +#define UBLK_REMOVE_BATCH      32

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming Lei
