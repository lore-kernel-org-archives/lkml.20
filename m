Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2695A415F25
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587299; cv=pass; b=RiJN/bp5G37R082y/dHUpSH4+wLIjJ9BWj0u0Fh+sHjJ98ipYtvM0qD5gDPhe6aTv7GbFfSMaBCkP/F00QKX2xxA+0m0DLQK9Kg4JzExG9V0ULUBWvEwtK3mPfBaqp6vTr4mVn7E6b0WjF0zvObZWw6+zFEwuxBIHJeCuXLhvFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587299; c=relaxed/simple;
	bh=lbkr1e+oVHmAXh9PMaJpKET/ZPWCaHqCdzTnFjKanZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k1nI2oMBREe6sAsDh+ZrAFMmxz/+VMTm3rFTQyDfm1AkHH+gFqW3O1LLQ+7zQhpPWlEPjvv6rtYU072P0RC8vLKqThr5hgYaPnRdv79ZyBDcTN2mOUcl5DcgWBc6l22JWHGXtlVWzILDiCm09RDeXkgja/9AaeK/L+7mwRt/NXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UF3mDb/l; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UF3mDb/l"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso18576466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789587283; cv=none;
        d=google.com; s=arc-20260327;
        b=MTWLqg9LBeQXklQo5DzoghTedjKnTDpyb6wdAC/vWka5zPe3P90TuhRH96Hh03+mXh
         IVbaR+cuRy1sXSt5SX673KE11LgMU7p5lekZDo8I9BDjDeJtpKlxFgvh+Z2rVdZ/pQNW
         o9XYaP+Ozhy8GkgcC/l/ouT2pOzVLPsFTzFDvvuZIpsh8oqICPMj2a1PlBzkdNbXhuXh
         B3KMVzlAlR3yibkDfn7LPCFApB2SR7MpEmP2+fZFcdv6tzADsKUMrpUA7oPU49DRMv6M
         2vBqs+fhn4ruRki93zevjg2XS4rJD3z+UYy8hglL7+e4D8eRRdoYM08k3kaVEfs0tcKy
         rjQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1Y9KLbKJHfx489zL13A2Cg7pSCrSzAZXPuS+c+f7Y8=;
        fh=d/4rmOTS+mqz+0PoVj8Hw9knRU8NfrekNW1UK9fvq1s=;
        b=rSvGVlHcZG40mDs6ZE9gl9aXlLyhHo7LGhUNW9tkleQVgaPjliM+aB87ttIygqAmmf
         DPk7gJHn6FZinGGL7WtudoAadk4Pu4S1wty+ReLg5Ex4XPvkT5RVfr2qPJYhmSofcKa3
         vjqpc5cSU30svZc+wOdr7+O2SLcQtaDzaS7PpUzIXfyuCaQ1j1H0JPVLhUIjhoX5JUlD
         LemSxF7jfWFui2SttwwhkUppMl7pHWoKZWlcuda9XzS+c+mHaGb4TVkOvsvNucIhDfvU
         2Qd6BxqHDTn6hXxSizsnVPDp90AK/ab9ncpfHNCU4UQK0ADeiXJwj2XW+fsUlsXd6u08
         YpAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789587283; x=1790192083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1Y9KLbKJHfx489zL13A2Cg7pSCrSzAZXPuS+c+f7Y8=;
        b=UF3mDb/lSlH04u4IJ0MaVvp9Gm3tTVJ6/5EOD/Qq38QSyfxWpcL5PGtiaWDWyus0od
         MJHN9ZHDJiVhmhi+WJX3JafnEqwhfOS9r8yrINqeRIdZUkynYgTrnNmCmW/R28To/In8
         4/iUvBVisv2vqco1In+ZpStb9gT3J9MCTe+L/xJYO0XZIdF2PmSKNGYSR7m7zJkMFpKg
         5AUiknApoQerFQ1qnqcSxy0iW/wSjdFwbE5DeOcfWqwyXyMooAw7u4sAcNF2ZL3+QrJ2
         Xb6W8CTjeFDsLrjjVSgUGG9MK9tJr6vtvK6MHG6Z7I1XOH0gWisA1K2seKTdhTx4wW/Q
         zqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789587283; x=1790192083;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1Y9KLbKJHfx489zL13A2Cg7pSCrSzAZXPuS+c+f7Y8=;
        b=HxW8afCKGbZXxdFopUc6UBXOhSqiOJ5cp75vjUbiEOows2GM50HVhQ16tR1NKkLvrU
         ozjCJ8gxwhvA2nv/IIEwFW9ajo3Etr++YGJN37/K2aA4bZrdG9jzDA5offE/JAUDekI5
         EKVC2Urctk60SpQtM6pTJnBaVlNyJZnYujMalT3mIKwGBEYccAWqAvjiKoWXXxSMiS3U
         S9cKu4WR1Tv5mmze17p5/yGwtuT2g/iznkUuDeHaNCviW8m0OsKFZ7Fc16bv8Sh2nkz9
         t6zF+kzd2ewd4/1Uvy5u7tzH214nyPpGn09M0b2vEj4wy73rN/tk+MfY6FiaNE++FXFU
         bCkA==
X-Forwarded-Encrypted: i=1; AKwUvBzFYa5AEdiTBB4d959uxKvEXlMkEEdeog2hFu3iOAd2ggE42CkxlzI8jmZ0gtAl0VAhbGD1m2Xmw+FCu0M=@vger.kernel.org
X-Gm-Message-State: AFuF++m4DGYWHzGh45gAAHXrFo+eT2Hqmv6XdqOsZYmt9zRoC9zStQdU
	cbci61gljNsdY/yqjn4x1i+jQNXGtumyaof9PHcp8rxgx7htdxJ/dffVujaL/jdx591z5hHceyb
	GXsGq6rUqiQbVHD6Dp7E+mnB0ClMRJnw=
X-Gm-Gg: AYBFou38fKU5BsLsGSulHviWKmxTjtkbNHo5TK22nsTACbiULeunYp+7vU2MqYDB5TJ
	CRo46W+7QHmB+eBZF6KMiuuSfbpJYa6yLgNJrWdgLfOxCbLqvaUo9rUmW9ovc3Cj2PynaYbYQv0
	Fi99kc0g+MbfCNkZyNpeJ0GdyOD5Tidio/b6qqRg6FVKOrlUxu+EOAwepH5XFGydAYklCv26Q6e
	1Gl9pN1COUPQh+nmc5Sk1lQwzcOi5Usg7hGtfG+ma8DzqN1QiBnql8UaVBOgdwUFP6dyTwqEdcF
	6baQirSifWE07gpjEWu80JmmUPibvCHtmjn7R4Q88xQzHbul5ixQgFHbmNRLfXoJBAJBeUnHR+d
	Mjt7jgRsBcmJgmN9XOZG2+jFRrTyeRRIft/2RYULNi2zBjZzacttIW8Aljq2gLX2qb0SLZCt3hN
	YD+E556Lc/ka9D00nD9WfUEyYy2/Jq5bJh6MqwAFc3mJTMNXFfTwo4o5hoPBBn6wHFXg==
X-Received: by 2002:a17:907:3fa8:b0:c15:f26a:3438 with SMTP id
 a640c23a62f3a-c29e5392d27mr271360466b.24.1789587282657; Wed, 16 Sep 2026
 12:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916182608.13523-1-rosenp@gmail.com> <aqrpAlpvHWTi9eGI@SMW015318>
In-Reply-To: <aqrpAlpvHWTi9eGI@SMW015318>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 16 Sep 2026 12:34:31 -0700
X-Gm-Features: AcwNN1Xbx_JJZ6j4oUjA6U9H3g3nle4kXaOU00QLrD790RcfaMDYk2LY_Cj838Y
Message-ID: <CAKxU2N_bJJijZ7QLx=ubaVWA6Mn=q7tswKj=mE8NFJXz=Uf6RQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: mv_xor: protect MBUS window access with a spinlock
To: Frank Li <Frank.li@oss.nxp.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Stefan Roese <sr@denx.de>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:07=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Wed, Sep 16, 2026 at 11:26:08AM -0700, Rosen Penev wrote:
> > mv_xor_add_io_win() reads and writes shared MBUS window registers
> > and updates the shared win_start/win_end arrays in mv_xor_device.
> > Multiple DMA channels can call this function concurrently via
> > mv_xor_prep_dma_xor(), leading to races where two threads can
> > select the same free window slot, corrupt the registers, or produce
> > inconsistent cached state.
> >
> > Add a spinlock to struct mv_xor_device and hold it across the
> > register read-modify-write and cache update in mv_xor_add_io_win().
> >
> > Fixes: 77ff7a706f01 ("mv_xor: Add support for IO (PCIe) src/dst areas")
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/dma/mv_xor.c | 15 +++++++++++++--
> >  drivers/dma/mv_xor.h |  1 +
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
> > index 0de2b1ad5c30..e7c6ec54ce25 100644
> > --- a/drivers/dma/mv_xor.c
> > +++ b/drivers/dma/mv_xor.c
> > @@ -497,11 +497,14 @@ static int mv_xor_add_io_win(struct mv_xor_chan *=
mv_chan, u32 addr)
> >       u8 target, attr;
> >       int ret;
> >       int i;
> > +     unsigned long flags;
> >
> >       /* Nothing needs to get done for the Armada 3700 */
> >       if (xordev->xor_type =3D=3D XOR_ARMADA_37XX)
> >               return 0;
> >
> > +     spin_lock_irqsave(&xordev->win_lock, flags);
> > +
>
> use auto clean up guard()
Could that be backported though?
>
> Frank
> >       /*
> >        * Loop over the cached windows to check, if the requested area
> >        * is already mapped. If this the case, nothing needs to be done
> > @@ -511,6 +514,7 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv=
_chan, u32 addr)
> >               if (addr >=3D xordev->win_start[i] &&
> >                   addr <=3D xordev->win_end[i]) {
> >                       /* Window is already mapped */
> > +                     spin_unlock_irqrestore(&xordev->win_lock, flags);
> >                       return 0;
> >               }
> >       }
> > @@ -521,8 +525,10 @@ static int mv_xor_add_io_win(struct mv_xor_chan *m=
v_chan, u32 addr)
> >
> >       /* If no IO window is found that addr has to be located in SDRAM =
*/
> >       ret =3D mvebu_mbus_get_io_win_info(addr, &size, &target, &attr);
> > -     if (ret < 0)
> > +     if (ret < 0) {
> > +             spin_unlock_irqrestore(&xordev->win_lock, flags);
> >               return 0;
> > +     }
> >
> >       /*
> >        * Mask the base addr 'addr' according to 'size' read back from t=
he
> > @@ -540,8 +546,10 @@ static int mv_xor_add_io_win(struct mv_xor_chan *m=
v_chan, u32 addr)
> >
> >       /* Set 'i' to the first free window to write the new values to */
> >       i =3D ffs(~win_enable) - 1;
> > -     if (i >=3D WINDOW_COUNT)
> > +     if (i >=3D WINDOW_COUNT) {
> > +             spin_unlock_irqrestore(&xordev->win_lock, flags);
> >               return -ENOMEM;
> > +     }
> >
> >       writel((addr & 0xffff0000) | (attr << 8) | target,
> >              base + WINDOW_BASE(i));
> > @@ -556,6 +564,8 @@ static int mv_xor_add_io_win(struct mv_xor_chan *mv=
_chan, u32 addr)
> >       writel(win_enable, base + WINDOW_BAR_ENABLE(0));
> >       writel(win_enable, base + WINDOW_BAR_ENABLE(1));
> >
> > +     spin_unlock_irqrestore(&xordev->win_lock, flags);
> > +
> >       return 0;
> >  }
> >
> > @@ -1353,6 +1363,7 @@ static int mv_xor_probe(struct platform_device *p=
dev)
> >
> >       platform_set_drvdata(pdev, xordev);
> >
> > +     spin_lock_init(&xordev->win_lock);
> >
> >       /*
> >        * We need to know which type of XOR device we use before
> > diff --git a/drivers/dma/mv_xor.h b/drivers/dma/mv_xor.h
> > index c87cefd38a07..034db4d0bfb1 100644
> > --- a/drivers/dma/mv_xor.h
> > +++ b/drivers/dma/mv_xor.h
> > @@ -80,6 +80,7 @@ struct mv_xor_device {
> >       struct clk           *clk;
> >       struct mv_xor_chan   *channels[MV_XOR_MAX_CHANNELS];
> >       int                  xor_type;
> > +     spinlock_t           win_lock;
> >
> >       u32                  win_start[WINDOW_COUNT];
> >       u32                  win_end[WINDOW_COUNT];
> > --
> > 2.55.0
> >
