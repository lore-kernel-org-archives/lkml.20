Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792499869;
	b=p+bmuyXW8Jb3dLEEFyMMUGCTGAucVRQaHLLXK9nSQYkHFXB5rutnv3qZOwTMDTEC2Vv7
	 VRMJQrgKyd8D454RMfFBht1ANFfLlIJotjp6JdQKa54jd9RPLMMg8u48eXKOeMgjkVEP4
	 14y32hd4uzW9CPU+hRE2KedXMnpl6zeYwWItjYXzijs+Ap5pqM39Orn2FkckrRVkTvqSN
	 TlyX1LCGR63gg9zlZ7DaKTMXy1g/KQZMja9a59aaNNy1Cv8G9xv2m0XVhW4nnEPxyFKVi
	 3DiDRQ/4aHq8ysknEILatekISj0/1jys3I3h7cbwI49m0r6K1AoRGYDhbBcWleut22g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sAk8vAv8nUAyr6JPeIhpU/yIjHpAZXyzJ6Jytkg7sB4=;
	b=5icnvUrQUiVUwXxaYma8RtVhRRsPjPuPbY39bVWnWeNjL/1DxGNWKR7TRiJ8M8MsjGI0
	 dUo1Najcd/NOlK6c5gELF7tKjVzP8dUGw9MVRrhOA3F6bfAizT9litsCTFbr17Ct0SNTw
	 gz/AniD9BTfFpKgQ/z0NljRv7n1h+tOtsLwxIoCaQePdL0OItM6VwEKUmxLXUw5jacg8i
	 WxSWamvCAFhT118GyGap7JQPuMqDzmZNJTNMu9tBXoJzZUKTwjqA6mu7GowWBBWMDPN2T
	 v/4g/YAelWYJJYERJvIEy+ke3sE+RAjGTUuNpb+5oxaL4SQj5gw6jwocChBpyFZ7EAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lRxIjce7;
	arc=fail smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE6F606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE6F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lRxIjce7
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-843b6f8e2c7so2532806a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792499867; cv=none;
        d=google.com; s=arc-20260327;
        b=XyeTer9PwvgGnpDKf34DFeQGWIWP80vaKlgqaI8BPJCt6sWQ1LtLhI+KcccEUPxiF8
         5Bo/IZ8VhL4go702mS2C/WRdfeoy61oSoqRxxFS5nkkc86ZDcwmMA5ujwbk2JY2EN8RR
         dF/7jqb2YqsKrEvhrdQ/M3ZjWazST+8dPhwJQOvgUxWnkNSUgPWBoqMp1T+sVV76t4C7
         BHa2mt0YEfpPzNjTqUIVgqs05iA5uvuODDJgkUBrGuhHwKwBsrww6x01sHd5JGahDzSz
         Xly9StLb2HQZ0Oty01uKWVmbflyz6UgpKkgk6lG6u2lTIYJWT/MfYKf2IztTpit3Q2yV
         tzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sAk8vAv8nUAyr6JPeIhpU/yIjHpAZXyzJ6Jytkg7sB4=;
        fh=B7tXC9cr6EzcZumlh2GwPGvJN4+a+y3t0Mb8h1ympxY=;
        b=JcuzatL7bXPt834RePqLj+YYJghFctONf032F6O0gkYS6e2RG0T14u9OfrnAeMW12m
         Nezo1hwsCuJk35zH4Fp2TyaaXPKeFEIC1KAT0wuejhvRp+0U/+j2ck/Qf2vuEtp7VePI
         42yMdiBbWovglgpNVufuwNPNmjPDxDXcW1L7M6tK5RiGMInATmqGY9QfB/SV13HckvMP
         G8kRmPTAzLyq0+qCAnY/1XmKAZWGrZnMDpeFawwr3xKU+wn4IEWqCkg4DGiZlQg9S/f0
         HtezN9u5lDsz7EWM8Ia8d8RcRmux5AXxD4Vw8c4f7xEaLwlYZL9It18nrIvLxKRTtaWV
         rbwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792499867; x=1793104667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sAk8vAv8nUAyr6JPeIhpU/yIjHpAZXyzJ6Jytkg7sB4=;
        b=lRxIjce7c4p5s9C+TaeR8dFSAHuJYut2Flz9NmEEgv1zGqpb4BbQVa2TFONAZmm9z4
         VcnyOV/kmjaLSztdLCulYL7hLAlzuPuLgEPb1eAG+kLm6BdIcscPc5BgAEBrNZtCtEX6
         J8YV8IwxaAJl8mUFB7WRwPm0gqsiyzekghSxApsK5wBrPBAX+4/EGR/ghdqwUEkVsnN8
         h6c1wF7Lir6OB0FsZxg1gt0kuB1OvmQbrKpUNvju16grj9rYQGHRbzqm4NP5a58tF/in
         IWjqz9K9FfJfXdn5VgTfqnSEFpdVtwLBdgqdvO9IUz39XgMqKmj9bWNeLHfOYvgftNRS
         z5nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499867; x=1793104667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAk8vAv8nUAyr6JPeIhpU/yIjHpAZXyzJ6Jytkg7sB4=;
        b=ItN2qf2rcYuhWqEWbYWMh9H6YMIjYHS6Bv7snnlvQ1cbQL+VWA1OXokjTy5cZOi1iv
         WBTQUObhX0GxHFrtPzL6lmOVm6VnDxBHdwAUZGMMogXMYKHynmuo5jlEcgsZODJ9sg2z
         C6IsYW8msyzb3KzpMnz9SDuF5rRf6LMa7wR3r8ZHnwPvUWY1yrHz99j0EHTdl+deew3W
         4j6DSpPbDaFI09r1NXvPO7YgzW87uGGA6C50o3qPDualAmomrjXY7XyyPEPkxR5pgqPh
         depFG/tVtqhREB7K6V9cZ/svfRT6++9+ca/Sszouir7eKtrrMryhrbNN1qWRmJCQlqmI
         Mo8A==
X-Forwarded-Encrypted: i=1; AKwUvBzLdHlTAXkOMRFlV1bPgB5/IZDhzgWBSFnHHcRXTCB9BCCuLbNJdhSm2U9YlzuIWZYlIErppsUM3eqMFyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR1QDolW3Ce5m7jHyhM05nToccBXXsjuJNLRuX8LKbysDdRDC7
	Fi/Ccssg8bLQic4lsklmWP3ouF879IzYFJBR5oGYmZidVIZ/7kFcuxY0aE94cd9YBHdB+FqumbG
	egpkzOYVNMC9652qlS26vVmWLAtMSRz0=
X-Gm-Gg: AYBFou0aQKhKRrjDl9TlkFT+cdw+IvhVKGcHye+a6cgYtd0pd6l9nySBLDa1qzg0cjY
	rI18qJIptVsBNc7ZWtUJo//F1Qo1lfohAmHYO3wPCTAVLtnAYpOZmDLr5axv9xr/CTDrPp4HZG/
	BWG7tAYSMz4lcpt6Y/nZD2PCMnqpe0GBbBqeUts3827soXl52UkK98dDcXnpld2AdPKmnHmxqi8
	6Rha7l32w2cwGJDFbuypj0FFcGsinFFCR2vDHur1K31g0n0Iwy82MOm8nWRPBjZe5uylE1/Pe+V
	bSUvyW4jGwlSNT+doQQ286BJMS4G4kHWTVSOYxz5OV/FrtwWOZ14CQ4=
X-Received: by 2002:a05:6820:f023:b0:6f5:a49:6175 with SMTP id
 006d021491bc7-70355983cd8mr7947845eaf.14.1792499867428; Tue, 20 Oct 2026
 05:37:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-wedfix-v5-3-8b02e78fd34f@gmail.com> <179249104276.3135.12420565113536395663@kernel.org>
In-Reply-To: <179249104276.3135.12420565113536395663@kernel.org>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Tue, 20 Oct 2026 20:37:35 +0800
X-Gm-Features: AclHuK9NT-9EOIYyPIth6-MRT74ZwJUNVrZ8OhqVSMXdfi7sbVHRzVyLo962vUM
Message-ID: <CAHGaMk9E7b=3vJku55Qs2shoV8pkXF5OtBsDC37-H7AuEu0iJg@mail.gmail.com>
Subject: Re: [PATCH net v5 3/5] net: ethernet: mtk_wed: free up rings during detach
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
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 2 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] Copy-paste bug in the new rx_ring cleanup loop in
>   mtk_wed_free_rx_rings()=E2=80=A6
> - [Medium] The new flag gating in mtk_wed_free_tx_rings() causes a leak
>   on partial setup failure.
> - [Medium] The patch now frees the rx_ring descriptor memory in
>   __mtk_wed_detach() =E2=86=92 mtk_wed_free_rx_rings(), but WED never dis=
ables=E2=80=A6
>
> --
>
> net: ethernet: mtk_wed: free up rings during detach
>
> This commit adds frees for rx_ring and tx_wdma in mtk_wed_free_rx_rings()
> during __mtk_wed_detach(). It also sets MTK_WED_RING_CONFIGURED in the
> tx/rx ring and wdma tx/rx ring setup paths, and only frees rings that hav=
e
> that flag set.
>
> Link: https://github.com/mediatek/mtk-openwrt-feeds/blob/main/25.12/files=
/target/linux/mediatek/patches-6.12/999-wed-04-Fix-reinsert-wifi-module-cau=
se-memory-leak-issue.patch
>
> > diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethe=
rnet/mediatek/mtk_wed.c
> > index 3f0be70c3f145..b8264435acbe5 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> > @@ -949,6 +949,16 @@ mtk_wed_free_ring(struct mtk_wed_device *dev, stru=
ct mtk_wed_ring *ring)
> >  static void
> >  mtk_wed_free_rx_rings(struct mtk_wed_device *dev)
> >  {
> > +     int i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(dev->rx_ring); i++)
> > +             if ((dev->tx_ring[i].flags & MTK_WED_RING_CONFIGURED))
> > +                     mtk_wed_free_ring(dev, &dev->rx_ring[i]);
>
> [Severity: High]
> Should this check dev->rx_ring[i].flags instead of dev->tx_ring[i].flags?
>
> The flag on rx_ring[idx] is set in mtk_wed_rx_ring_setup(), and that
> function never touches tx_ring[idx]. The existing reader in
> mtk_wed_dma_enable() also tests the flag on the rx ring itself:

ACK will fix it.

>
>         for (i =3D 0; i < MTK_WED_RX_QUEUES; i++) {
>                 struct mtk_wed_ring *ring =3D &dev->rx_ring[i];
>                 ...
>                 if (!(ring->flags & MTK_WED_RING_CONFIGURED))
>                         continue; /* queue is not configured by mt76 */
>
> TX and RX rings are set up separately, so their flags can differ. Take
> MT7992 with a second HIF:
>
> - mt7996_dma_init() puts band1 RX on the primary WED's rx_ring[1].
> - mt7996_register_phy() sends band1 TX to wed_hif2.
> - mt7996_init_tx_queues() then uses MT_WED_Q_TX(0) on wed_hif2.
>
> So the primary WED's tx_ring[1] is never configured.
>
> In that case, is the rx_ring[1] descriptor memory still leaked on every
> detach? This loop skips it, and the pointer is then lost to the
> memset(dev, 0, sizeof(*dev)) at the end of __mtk_wed_detach(). That looks
> like the same leak the commit message says it fixes.
>
> mtk_wed_free_ring() already returns early when ring->desc is NULL. Would
> dropping the flag check here be enough?
>
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(dev->tx_wdma); i++)
> > +             if ((dev->tx_wdma[i].flags & MTK_WED_RING_CONFIGURED))
> > +                     mtk_wed_free_ring(dev, &dev->tx_wdma[i]);
> > +
> >       mtk_wed_free_rx_buffer(dev);
> >       mtk_wed_free_ring(dev, &dev->rro.ring);
> >  }
>
> [Severity: Medium]
> Can rx_ring[i] be freed here while the WLAN chip's WFDMA RX engine still
> points at it?
>
> mtk_wed_rx_ring_setup() writes ring->desc_phys into the WLAN chip's PDMA
> RX ring registers through wpdma_rx_w32(). mtk_wed_dma_enable() then turns
> on the chip's RX DMA:
>
>                 val =3D wifi_r32(dev,
>                                dev->wlan.wpdma_rx_glo -
>                                dev->wlan.phy_base) | MTK_WFMDA_RX_DMA_EN;
>                 wifi_w32(dev,
>                          dev->wlan.wpdma_rx_glo - dev->wlan.phy_base,
>                          val);
>
> mtk_wed_dma_disable() never clears MTK_WFMDA_RX_DMA_EN. On normal teardow=
n
> mt7915/mt7996 disable DMA before mt76_dma_cleanup() detaches WED. The
> mt7915 probe error path does not seem to do that:
>
> mt7915_init_hardware()
>   mt7915_dma_init()
>     mt7915_dma_enable()
>       mt7915_dma_start()
>         mtk_wed_device_start()     <- WFDMA RX enabled
>   mt7915_mcu_init()                <- fails, returns without DMA disable
>
> The probe error label in mt7915/pci.c or mt7915/soc.c then runs:
>
> mtk_wed_device_detach()
>   __mtk_wed_detach()
>     mtk_wed_free_rx_rings()
>       mtk_wed_free_ring(dev, &dev->rx_ring[i])
>         dma_free_coherent()
>
> If the chip writes back an RX descriptor after this point, would that
> corrupt memory that has since been reused? Before this patch the ring
> leaked, so such writes landed in memory that was still allocated.
>
> The error path leaving DMA armed predates this patch, and the RX packet
> buffers were already freed in this window. Whether the chip really writes
> descriptors after MCU init fails depends on hardware behaviour. Freeing
> the descriptor ring here is the new part.
>
> > @@ -959,9 +969,11 @@ mtk_wed_free_tx_rings(struct mtk_wed_device *dev)
> >       int i;
> >
> >       for (i =3D 0; i < ARRAY_SIZE(dev->tx_ring); i++)
> > -             mtk_wed_free_ring(dev, &dev->tx_ring[i]);
> > +             if ((dev->tx_ring[i].flags & MTK_WED_RING_CONFIGURED))
> > +                     mtk_wed_free_ring(dev, &dev->tx_ring[i]);
>
> [Severity: Medium]
> Does this leak the tx_ring[idx] descriptor buffer when
> mtk_wed_tx_ring_setup() fails partway?
>
> mtk_wed_tx_ring_setup() allocates the descriptor before it sets the flag:
>
>         if (!reset && mtk_wed_ring_alloc(dev, ring, MTK_WED_TX_RING_SIZE,
>                                          sizeof(*ring->desc), true))
>                 return -ENOMEM;
>
>         if (mtk_wed_wdma_rx_ring_setup(dev, idx, MTK_WED_WDMA_RING_SIZE,
>                                        reset))
>                 return -ENOMEM;
>
>         ring->reg_base =3D MTK_WED_RING_TX(idx);
>         ring->wpdma =3D regs;
>         ring->flags |=3D MTK_WED_RING_CONFIGURED;
>
> If the rx_wdma dma_alloc_coherent() fails, tx_ring[idx].desc stays
> allocated but the flag is never set. The -ENOMEM travels up:
>
> mt76_wed_dma_setup()
>   mt76_dma_alloc_queue()
>     mt7915/mt7996 dma init
>       probe error path
>         mtk_wed_device_detach()
>
> Before this patch, mtk_wed_free_tx_rings() freed the ring because
> mtk_wed_free_ring() only checks ring->desc. With the new check the ring
> is skipped, and the memset in __mtk_wed_detach() then drops the pointer.
>
> mtk_wed_rx_ring_setup() uses the same order. A failure in
> mtk_wed_wdma_tx_ring_setup() returns before rx_ring[idx].flags is set, so
> the flag-gated rx_ring free in mtk_wed_free_rx_rings() cannot reclaim
> that ring either.
>
> Since mtk_wed_free_ring() already guards on ring->desc, what does the
> MTK_WED_RING_CONFIGURED check add in these free loops? The commit message
> does not explain why the frees are gated.

The flag was from the original vendor patch.
I will change to rely on ring->desc.

Best regards,
Zhi-Jun


>
> >       for (i =3D 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
> > -             mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
> > +             if ((dev->rx_wdma[i].flags & MTK_WED_RING_CONFIGURED))
> > +                     mtk_wed_free_ring(dev, &dev->rx_wdma[i]);
> >  }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261016-wedfix-v5-0-8b02e78fd34f%40gmail.com
