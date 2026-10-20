Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792500150;
	b=jLp3uer9CQjz9aT4VC/ebd1FgOHa6FZgqg5/pQb1ndEDKPg1O9N/KgIxDS+c4HpBiRnb
	 PDtCWTmlaT9ZhuejAs4qHruZpdAUCJouvxjMLo/soquqsjiXV2e4DQfv7+ieVjLOxKdhL
	 6prMepyuNDVpz1kgm6kJcw2I/85P41/yiGQbD/LUskAogP9gcfCFSv8X80Cj3TiFiUjM5
	 jW0NG7n6BYFfVoiI/tLjRWsApkmx4q9x7ivoAtMHMBCNLGNKFpzrYtTLR7bsN1Qx2zTki
	 FBB0jQgAZnYg3i4gsOfaMBHaQT3V3CKwPQFabj8rj3ACo0566003j81RY0OAzpAZPAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=czINu4tNn892A/gqG20V0sIiMq+iNhxvP3cIYEKn6GM=;
	b=WGh7Uz4JiWLSXZD82tWoEdyMFSD4Th5wuTaat+roMgw5Rk7StS7OnRZpXA9YRUIWdjQH
	 uO2QDZd7T6act0zEDZLAoTdbkE3UFCbTC0C+kRMKh1ssgxW5RSEOJSjuURaJuMdFSzm7G
	 ojp+HdTezRbEn3D3Q4HTnawo05t1HV8oJq/sqA7mWxNWCXs93bWYCknIcIHWGAem0+cEw
	 V5mylsxnfHGOt8eaFWRxJGxOm59811pDJe6xdZJ2EkXOqQ+mXdXZXlnZt8wy8pQFzC8Cp
	 C/C1ydWErSvSWCwEA+Twx1a5uzyHHgWEVL4jb3GP5xSpO/Y/H4uQO71XY+WqmZwwGDg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EJIrdUmF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879BC606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 879BC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EJIrdUmF
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6d68de53053so1203879eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792500149; cv=none;
        d=google.com; s=arc-20260327;
        b=Lkv4qItII5Tkc6YNblv4Pu0m5fHsAfOCtW9F8jdSnnYTrpNTPr543L0DiaYjo6TDKh
         EbsNQ+Hk51ruXmS4mAesllSKAMmlBrevEBww0piSun7R37WgV7WgP95jnnEoYSOSwSxy
         DXptJ9HD2w4H7h13cQyffsTiUVdyPaXH3CN2zt5921+JfmfJa5Iz1ka09sKP7tc/2ckc
         pJuqv6AWYweOiWsO9VRFkaldJaW/VT9kd1N99iPkvX9u9izkb0/GVA+xs5q4wPip3u5c
         DouE9y9XdlANLIThQ0gh4gU9jK6MJysq+urlW0/Scgk3OYshTI2dyZav+X7djmj3OLoN
         I9yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=czINu4tNn892A/gqG20V0sIiMq+iNhxvP3cIYEKn6GM=;
        fh=kGlQZBM0XgDGoCJuFQScs4NGKOKAz7Xdbpvg9AgRGIc=;
        b=AX+fUI82MTyM04G6Eyimqj0UxTT64NkXV2cFnhPm1HvaKwjNQcys4kp0VY868VM9+P
         Kw+UAun868EFfjlPf9ks6UCTvNTr1z559JJg19P4LQT+vHvwoiir8OXI4ukTgjqKisid
         1qZx57pR8M2pC0ityBjAggsltrJCvbmSfHiGoIue/fh5OKXfo3xSGbqfWE9aXcL59lgi
         Cj6dnk+zPgsKYumUhYywS1nmywyA8Pai0OgubC3HW2/8DnG1j3EMRe3BcBToHgaxDHtG
         ZuFLKYrWieBGxSS1e1rfVYurjYtoIiLK1CMaRMFypmgDWC0cOa22iIBaRhreJq9fzHx2
         mY1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500149; x=1793104949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=czINu4tNn892A/gqG20V0sIiMq+iNhxvP3cIYEKn6GM=;
        b=EJIrdUmFYW+DvG+uj2erWSVOOTKZ8ZT88oyIgynWGqRk4sOJKBjmO/mDGIMpnqf+1D
         zB8N+05VUwmD+45eRntM+DqOVaJp4WdV3SujVoP5slAaWV+6v0GqMUI7WLkoE1RcR0j7
         TQKnjoVLOwsL13bAk+zKKFiv3TfYYEIFValRhRKzieFcemZtS1FK+olRVBOBnwDVyQ98
         DzekziBC+sEtKYsnyqM0c+BdDqQjhBH1CuIEV63FoTYN6HUfzUUiZw3kiIXb6+ufiGIf
         9Rd1bBcYMC/d7y18mfPznR93LWVbceBLo7qr+5uT7tyQyAjJe95NuYqG1i3RCi2HeGSz
         ZyTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500149; x=1793104949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czINu4tNn892A/gqG20V0sIiMq+iNhxvP3cIYEKn6GM=;
        b=f921BM2lkZ3GXpxqcscOblPtBD2Tgwx2ldEvDcGfUsHdxBdN7t/lc0sEpI9w9CBuWF
         PAqg/8TKNOZdFV22XJhH1cP3fGxOyqz6FNtOTbyJhaKCKRomAivv+ROTJsn6/XLAz6Yk
         WLDwWYVUihHE2qGUhOCszdT75XnR/Zrdw2HH/oWH9ZZYLTSAeVG6MWVELmFabq0eQrpp
         mXo0w4gLPyUDrSUnyuXkAd9A5pp2KU4tnPlSn3daBFoumMIqBSyYXbAnjnHQjQyj3fhD
         qHfvjm+aVLBGdzJsGSv+ukWAE2B6HKm7eGUQLmt6lzVsjbECZ9LisOel4KPgbkIzXPBW
         CUeg==
X-Forwarded-Encrypted: i=1; AKwUvBwiS3ijp3oyTQ1vyEPsI4Ci8XiBkBFTtzfN8y5cBGVCRpVazrRMjWoXj74RXaz5t+9bURllF0sYCVpxevY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6z9wpG69Z5c3ejrT5FBu3IlTV2L/t6r99yDVbjp09j+NdPYUD
	z0aaGbZMwVJGhnLhgL3ywye/WXlTWIVznKT9JY0TV2QCdGM8kLRb02aQ6+xtWdRXLGtQDBNbRd6
	ol36y/wXrn6CRHglEsiTyTXGV4UImVYA=
X-Gm-Gg: AYBFou3CAYAx8ftkmdHtimW6I1cay65ClQuZ+VZB2kiSh74vl2yjz1HptCmimxgJODm
	bLkMIN5msORCTt+3B/pSYxUtUdcEpTZG3gcUTKNuP9ow6cfQuRGZ5Owp+EkP97Of3wl5e+twHDZ
	JLc/urcZn2fewPIKB4ZhbXph9zthZm4ZbkvSz8v25reRUDicoBUX+yXRqiqyF99bRo+EJXPbcIa
	4w3NB+E2zi4/zSpI57DeMGCtwpeYYZKCeZEnyJS3I+uBfmpXIKY+1h+1bdFpBcJZgmqOhCxEAos
	OaFnv5UBIc/PrTs9xnVDa2DuO+wA/8wVKmQJEaat8PnS/XvSltjb/VJ2jiR7FxAkhw==
X-Received: by 2002:a05:6808:4f62:b0:4f4:b5ba:a236 with SMTP id
 5614622812f47-53ccaf299bdmr10702127b6e.10.1792500149414; Tue, 20 Oct 2026
 05:42:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-wedfix-v5-5-8b02e78fd34f@gmail.com> <179249104567.3135.3150268582386164073@kernel.org>
In-Reply-To: <179249104567.3135.3150268582386164073@kernel.org>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Tue, 20 Oct 2026 20:42:18 +0800
X-Gm-Features: AclHuK9W4Es3s2qEoBcM8btZ9Y3bS_NG69-SBXVVPIf84hDXQvp4ykMnqjjWBv0
Message-ID: <CAHGaMk9LPyH-kCGLxP0q8s4-_Soed_NBqLVtdvUB7KOB1xJikw@mail.gmail.com>
Subject: Re: [PATCH net v5 5/5] net: ethernet: mtk_wed: bail out when failed
 to set up rings in wed_start
To: netdev-bot+sashiko@kernel.org
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sujuan.chen@mediatek.com, rex.lu@mediatek.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 6:10=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> Critical: 0 (1) =C2=B7 High: 0 =C2=B7 Medium: 2 =C2=B7 Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The new bail-outs in mtk_wed_start()
>   (drivers/net/ethernet/mediatek/mtk_wed.c) log a dev_err() and return,=
=E2=80=A6
> - [Medium] net: ethernet: mtk_wed: memory leak on ring setup error paths
> - [Low] The commit fixes error handling for two calls in mtk_wed_start()
>   but has no Fixes: tag.
>
> Pre-existing issues:
> - [Critical] This problem wasn't introduced by this patch, but it is a
>   double free in the same reset -> start lifecycle.
>
> --
>
> net: ethernet: mtk_wed: bail out when failed to set up rings in wed_start
>
> This commit checks the return values of mtk_wed_wdma_rx_ring_setup() and
> mtk_wed_wdma_tx_ring_setup() in mtk_wed_start(). When either one fails, i=
t
> prints an error and returns early.
>
> Link: https://lore.kernel.org/all/179000700034.2160803.105942816913840150=
89@kernel.org/
>
> > Add error message and return when fail to set up tx/rx wdma rings.
> >
> > This is suggested by Sashiko.
>
> [Severity: Low]
> Should this patch have a Fixes: tag?
>
> The previous patch in this series, "net: ethernet: mtk_wed: setup
> WDMA_RING_TX(0) for non-DBDC MT7986", added the
> mtk_wed_wdma_tx_ring_setup(dev, 0, ...) call checked here, and that patch
> carries Fixes: 4c5de09eb0d0. Without a tag on this patch, a stable
> backport of the earlier one could land without its error check.
>
> The unchecked mtk_wed_wdma_rx_ring_setup() call comes from commit
> 23dca7a90017 ("net: ethernet: mtk_wed: add reset to tx_ring_setup
> callback").
>
> Every other patch in this series has a Fixes: tag. The line "This is
> suggested by Sashiko." is free text and does not say which bug is being
> fixed.
>
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethe=
rnet/mediatek/mtk_wed.c
> > index 3a7c2bb33691f..86845893ae20f 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> > @@ -2353,14 +2353,20 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 i=
rq_mask)
> >
> >       for (i =3D 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
> >               if (!dev->rx_wdma[i].desc)
> > -                     mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
> > +                     if (mtk_wed_wdma_rx_ring_setup(dev, i, 16, false)=
) {
> > +                             dev_err(dev->hw->dev, "wdma rx ring %d se=
tup failed\n", i);
> > +                             return;
> > +                     }
>
> [Severity: Medium]
> Does the caller ever find out that start failed here? The same question
> applies to the tx_wdma[0] return below.
>
> mtk_wed_start() is static void and is installed as the .start op. In
> include/linux/soc/mediatek/mtk_wed.h the op is declared as:
>
>         void (*start)(struct mtk_wed_device *dev, u32 irq_mask);
>
> The early return therefore skips mtk_wed_hw_init(),
> mtk_wed_configure_irq(), mtk_wed_set_ext_int(), the v1 PCIe mirror map
> write, mtk_wed_rro_cfg(), mtk_wed_amsdu_init(), mtk_wed_dma_enable() and
> dev->running =3D true, and nothing is reported back.
>
> mtk_wed_device_active() only checks the ops pointer:
>
> #define mtk_wed_device_active(_dev) !!(_dev)->ops
>
> so mt76 still treats WED as active. mt7915_dma_start() has already put
> WFDMA into WED mode and written MT_INT_WED_MASK_CSR before it gets here:
>
>                 mtk_wed_device_start(&dev->mt76.mmio.wed, wed_irq_mask);
>         }
>
>         irq_mask =3D reset ? MT_INT_MCU_CMD : irq_mask;
>
>         mt7915_irq_enable(dev, irq_mask);
>
> It then returns 0, even though it returns int and could pass an error up.
> mt7996_dma_start() does the same after writing MT_INT_MASK_CSR.
>
> On WED v3 with hw_rro, mt76 later calls mtk_wed_start_hw_rro(). That
> function has no init or running check. It writes MTK_WED_WPDMA_INT_MASK
> and MTK_WED_INT_MASK and sets MTK_WED_RRO_MSDU_PG_DRV_EN. Because of the
> early return, mtk_wed_hw_init() never programmed MTK_WED_RX_BM_BASE or
> MTK_WED_RRO_PG_BM_BASE.
>
> Can this leave a half-initialized WED that the wlan driver keeps using as
> if it had started, with only the dev_err() to show anything went wrong?
>
> Would it be better to have ->start return an int, so that mtk_wed_start()
> and the mt76 callers can propagate the error and unwind?

I will let the maintainer decide what to do there.

Best regards,
Zhi-Jun

>
> >
> >       /*
> >        * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] durin=
g setup
> >        * but tx_wdma[0] is also needed for WED to function.
> >        */
> >       if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
> > -             mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE=
, !!dev->tx_wdma[0].desc);
> > +             if (mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_=
SIZE, !!dev->tx_wdma[0].desc)) {
> > +                     dev_err(dev->hw->dev, "wdma tx ring 0 setup faile=
d\n");
> > +                     return;
> > +             }
>
> [Severity: Medium]
> This is outside the lines changed here. It is the same ring setup
> error handling this patch is tightening, though, so it seems worth
> raising.
>
> In mtk_wed_rx_ring_setup(), mtk_wed_ring_alloc() first allocates the
> descriptor memory for dev->rx_ring[idx]. If the following
> mtk_wed_wdma_tx_ring_setup() call fails, the function returns -ENOMEM
> without setting MTK_WED_RING_CONFIGURED on that ring.
>
> mtk_wed_tx_ring_setup() has the same shape. dev->tx_ring[idx] is
> allocated, and a failure from mtk_wed_wdma_rx_ring_setup() returns
> without setting the flag.
>
> The teardown helpers only free rings that have
> MTK_WED_RING_CONFIGURED set. In both cases the coherent DMA buffer
> for the wlan-facing ring is therefore never released by
> mtk_wed_free_tx_rings() or mtk_wed_free_rx_rings(). If setup is
> later retried with reset =3D=3D false, mtk_wed_ring_alloc() overwrites
> ring->desc and the old buffer is lost for good.
>
> mtk_wed_free_rx_rings() also looks like it tests the wrong array. It
> frees dev->rx_ring[i] based on dev->tx_ring[i].flags. Whether an rx
> ring is freed or skipped then depends on the tx ring with the same
> index, not on the rx ring itself. That makes the rx side leak more
> easily still.
>
> Should the error paths in mtk_wed_rx_ring_setup() and
> mtk_wed_tx_ring_setup() free the ring they just allocated? Or should
> the free helpers key off ring->desc instead of the flag? And should
> the check in mtk_wed_free_rx_rings() test dev->rx_ring[i].flags?
>
> [ ... ]
>
> [Severity: Critical]
> This isn't a bug introduced by this patch, but it sits in the same reset
> and start lifecycle. mtk_wed_rx_reset() does:
>
>         mtk_wed_free_rx_buffer(dev);
>         mtk_wed_hwrro_free_buffer(dev);
>
> When dev->rx_buf_ring.desc is non-NULL, mtk_wed_free_rx_buffer() already
> ends with its own call:
>
>         dev->wlan.release_rx_buf(dev);
>         dma_free_coherent(dev->hw->dev, dev->rx_buf_ring.size * sizeof(*d=
esc),
>                           desc, dev->rx_buf_ring.desc_phys);
>
>         mtk_wed_hwrro_free_buffer(dev);
>
> mtk_wed_hwrro_free_buffer() frees everything but never clears
> dev->hw_rro.pages or dev->hw_rro.desc:
>
>         dma_free_coherent(dev->hw->dev, dev->hw_rro.size * sizeof(*desc),
>                           desc, dev->hw_rro.desc_phys);
>
> free_pagelist:
>         kfree(page_list);
>
> Does the second call in mtk_wed_rx_reset() then read page_list[] from
> freed memory? It would also __free_page() the hw_rro pages,
> dma_free_coherent() hw_rro.desc and kfree() the page list a second time.
>
> This looks reachable on every SER/DMA reset on WED v3 with wlan.hw_rro
> set, which mt7996 does for the primary WED:
>
> mt7996_dma_reset()
>   mtk_wed_device_dma_reset()
>     mtk_wed_reset_dma()
>       mtk_wed_rx_reset()
>         mtk_wed_free_rx_buffer()
>           mtk_wed_hwrro_free_buffer()
>         mtk_wed_hwrro_free_buffer()
>
> There is a second, separate issue: mtk_wed_free_rx_buffer() leaves
> dev->rx_buf_ring.desc pointing at freed memory. Suppose the next
> mtk_wed_start()->mtk_wed_rx_buffer_alloc() fails at dma_alloc_coherent()
> before that pointer is reassigned. Could a later
> __mtk_wed_detach()->mtk_wed_free_rx_rings()->mtk_wed_free_rx_buffer() the=
n
> free it again?
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261016-wedfix-v5-0-8b02e78fd34f%40gmail.com
