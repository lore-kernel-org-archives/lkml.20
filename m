Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792696422;
	b=yRJ8iDcqOnHRxsGUrUvCfpP5jQ+4l7FH1ipN2ApR/30SIGhTFmzKzV2fgGplljDsGUuQ
	 t1HhBHLRrWfiWBIUA+kiJhWh3VkoX8jFqewahQVHmNMDg0P7G48kuhJQDxCjkoI46n9wu
	 CAaPcW5eC93RuwJDEznMoTae8Gm0fDjxcmlaGP8KGEwn1YjFsc1Rl67lBDlyJgTu3zQX/
	 MJlYzSKRf7QQNAwCfNGbqN9VleBH7Z3O5IpI3jzFPWm/DDohExuYl/4vaafVha5FwmV4e
	 AbQm+3E6aaDxw8PGU3f6yMIGlXnhbU2CTKnWpG4Ebmn8uG0M1/yT9t5Yh1vHrJk7eCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
	b=LA/MZ72LnaQBIkTU02E7somjUsEvfVIptHGBo0sbLCgur/gp5KRfN6+P40qS/BIeg6if
	 /06gUbtmg9jBXQOQrnAtFpG/FmO1LCTmNCpX9tnv5pCPhJLGX6AjyIAjEuUO2XnaY3cE0
	 X4+/iP9jaOdF7NILM9g54sOLlfOBHrCYj8I3lzqxtS5M7uvC4lU5U5L8dz8UA+QsPH/Iy
	 V4mhkk/jtMQa8lF6yVeZBHJQE5HPjstqQ4WBbOEKojZq9iDcvuJdERIvCraql1TNvlMlH
	 9gUjOSxVNx/BTssiVZGgkLjhXyC7OaKxl4d7F9v3XX1a34CbnoDVIezithf62gCqSig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i7darYlE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE420606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:13:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE420606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i7darYlE
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eaeb7fdda2so202363e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:13:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792696421; cv=none;
        d=google.com; s=arc-20260327;
        b=FVzsuXljfJGxa95UnUCfs5JxBjQ8ugNV7GA9ngYbMKAoHnaCYXzV5LH7WxnGRGqmxK
         HxS1wfnJw8U2Uo95TwftB+BLnCXFPwUqfBNU8pUUlHrotG8crRDj+EXsNxk3ZKIAGFlW
         qv5lxT+QDKT8mBiQCL/3OBLLFEOr2Xlo7M8dtzqAprD152iBMRaUDLzUT8PCO+a7SAKu
         7ZQgefkz07cMeIl4m5irYVIgT95XcYlPZFmvFZSGkmqoUENtgNs81/2g+B0n1+zVhlfg
         4epXgj2SdvdIuT68sOJWwYRgTcLnS3k1e4jCsnKGvLgb+tFlaNKK57wRMZvmTMDZhhwJ
         tBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
        fh=XS7IzfLbU1nqWfYG3PbMrsQWSETPUNugkFMhf9CqlA4=;
        b=jRhItgvcvdwDgQRRJIByrlwI0rSFSKR2e6+8WWZQVb1AD2txD1Ke0cTeXx45FCnDMF
         pKCgIn055sZET9wu7N/4GjyZtVntu44zoaPksmENNfgSm7OwunnMHQhByDQI6WZHCWcQ
         EnCya0eY3kVangXrBTDXaMBxbuEIdOBWHQy9umjopB5w4lwrP2EqUk6BmDwFAitoiyl0
         a98+PJN0jNEW6A8zR/1236SMHV+Sjq0LAEyXfgbDwtNf1kfJXuOO6MbzPDCe8b3/6uDJ
         zNFk90mpFCt5Pyir+W/zVurgPmXsXgCVAABzb8XmpoGw9i2265FdEia6sqMv3XuA6IMs
         mO/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792696421; x=1793301221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
        b=i7darYlEIo1U43FFo1YC+jEltkgS+5KI2K8Hl4HrATDhLYkHgDZDLf8J57wzqWKu+R
         TJ7Hpds3OmA7DsfIjembs0PSPFnrJLk04BjnJ9OU6jPxxR3XBAE5IxYotNQtQefMA5Ji
         Ni+Xc4h88Q8DAFZEn14ibIamI9m0IgyWiJBYsuzvmHEm5iAYqPNC/lPDoaZN7Y4jEgeA
         UO4FBm56qPXcYVXEWGFJ+RZK0M7s7y8GEZO/LjM/gg+h7C7y8oUD7PujRMaBPS7P+7uz
         B82358d/dqcfTqIUwVcvIzfx4ZTLDpYO8BhZlxn4Qr/s3f3wVpnU1prvi0SRIRlQOvxv
         WP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792696421; x=1793301221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TtAVhYz4QvdzrjAhGjbDu9/cGxuf5U8xz1dalJDUVVM=;
        b=MCgAkF3ko+7GTbefEiaIEM4UOdPDv7Arkr/RSaeBbMEXgXhTz+3KeuPSq1lXC7AZAK
         a2LOwOjpp5S6NcRubjOLaQKvx+VWaoZ5z0pKUNyI+x4b+HypLVqQeNLORQN4oaq1uzh9
         lOFUCBbklH0xIeKpBpHcBEDVOgRaD23EKvrexphO8jQfAKAhzBjXvFrZ5o/mHzb+3/mv
         bA1WB/WWnZfH21sOZFX3uG9dXlzXiU0yHahSFve14OKXux1hya934tHxvi+LLd2i3Njn
         BXdLvaiFWBABQF+0+HPcqZtKi3X8ig6rM4l6RXQQb9Jk5zrxdTOSDYenFerRctCSugzB
         Dg4g==
X-Forwarded-Encrypted: i=1; AKwUvBxcZX+J3mC6xpu4zfDu9jhtlNlH13ywRegKZrp18l5XWGazE6X/zkZFfkLQUb3iBIY6YaZuFIBDqXLHIK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqs+EJJIRqmonKlwgVu4uScQTzuSucQrTsNTcE7tz7J0kxogTY
	ftzX8EyhIW9E/P8/VX1X1Yv+/lqSmYp0P18VmRO+Pg74ajUl3+NCIhLCTv/I/QMwHLs9MOB51ux
	8PWTm9pW1+snyghoX/MMIv/gYql+XzgU=
X-Gm-Gg: AYBFou3qxUm598Fi9+EeNWRtIiNX5bSvCryMUaOBNbRsTXA9W9d+aV7z4xvYmjg9OCz
	4v8VB5WEaisVQe5Q6Wi+BhWGgZLCGKFY6ei/HnP68UITwWaQa2Y9Z8zoa/y8a/esNEcXxIDJ0zA
	qJOFTJ8IvCSuStctbLIJ436NVDDhzv/sXDQg4P064NfNDJLyrYl9Goas0tl9KYQXYO77c8xFxXA
	/NxNVCYJ/4rC1IWA6Wd16G15+bp8spOSoQddyvMeaVrTgmk4lQqDOM+MSROk8prKO7H6nkqBt/9
	v4OO46da0Y+TwpMw8xhj2dz/N+xOhPPt125Mmg+8FVwaRYNcEvP1SAcHHy8Kx+IzUsLTDlaMFMr
	s3QAbGXJ4rX5N4sXwEttveG746uUUmsyB+5QbiotauEeN7rlqrueLYm04VGvglr6bwKpvqjYAqx
	zTH3AgYZgzicDf/4YZdrCmVQSXkYG1fMunowcW/5DUbtGSotzBtXZDKmaKqGFlINt0g/ysX9nr3
	TP8bcXHlyRZYqurFZwiQyq8CvY87g==
X-Received: by 2002:a05:6102:4bc1:b0:7cc:1218:1d2a with SMTP id
 ada2fe7eead31-7ccc32eb44amr171247137.9.1792696420656; Thu, 22 Oct 2026
 12:13:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-submit-sun6i-dma-descriptor-mask-v1-v1-1-76e72bd52e57@gmail.com>
 <ato1bMSJgTVZnOyd@SMW015318>
In-Reply-To: <ato1bMSJgTVZnOyd@SMW015318>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 13:13:29 -0600
X-Gm-Features: AclHuK8dUweaO7VirTuh-oMszxWLhvnB6Zh7PvCummnzZQmZVHWezvakVRYMIa4
Message-ID: <CADvTj4o+XjFjE4uhNSaaA78t0dqhXaOFkzux_CfWGyC1CCp6Yw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: sun6i: constrain descriptor addresses through
 the DMA mask
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 10:10=E2=80=AFAM Frank Li <Frank.li@oss.nxp.com> wr=
ote:
>
> On Wed, Oct 21, 2026 at 03:11:29PM -0600, James Hilliard wrote:
> > Descriptor allocations pass GFP_DMA32 to dma_pool_alloc(). The DMA API
> > chooses the memory zone from the device address mask, rather than accep=
ting
> > zone-selection flags from the driver. These flags can also reach the po=
ol
> > metadata allocation and trigger a slab allocator warning, as observed o=
n
> > H616 when preparing the first UART receive-DMA chain.
> >
> > Set a 32-bit coherent DMA mask before creating the descriptor pool and
> > remove GFP_DMA32 from its allocations. The driver does not encode the
> > extra descriptor-address bits supported by some variants, so descriptor
> > links must remain below 4 GiB. Keep the streaming mask unchanged for
> > variants with wider source and destination addresses.
>
> Spouse other dma address in src/dest in descriptor also limited to 32bit.

The src and dst fields contain the low 32 bits, but on variants with
has_high_addr, sun6i_dma_set_addr() stores address bits 33:32 in the
descriptor's para word: bits 17:16 for the source and bits 19:18 for the
destination. Those variants therefore support 34-bit payload addresses.
Variants without that capability retain 32-bit addressing.

> Do you means only descripor address have 32bit limiation, other have not
> such limiation?

For the current driver, yes: descriptor addresses must remain below
4 GiB, while payload addresses can use the wider range on supported
variants.

The descriptor restriction is not necessarily a hardware limitation.
Some variants also support extended descriptor addresses, but require
encoding their high bits into the otherwise-unused low address bits.
The driver does not implement that encoding: it writes the descriptor
address directly to DMA_CHAN_LLI_ADDR and stores the next descriptor
address directly in p_lli_next.

The patch preserves that existing restriction by setting the coherent
DMA mask used by dma_pool_alloc(), instead of passing GFP_DMA32.
The streaming mask and existing payload-address encoding remain
unchanged.

> Frank
> >
> > Fixes: ec31c5c59492 ("dmaengine: sun6i: Add support for 34-bit physical=
 addresses")
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  drivers/dma/sun6i-dma.c | 11 ++++++++---
> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> > index 7704b016aed8..0ef6ed1f936e 100644
> > --- a/drivers/dma/sun6i-dma.c
> > +++ b/drivers/dma/sun6i-dma.c
> > @@ -684,7 +684,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_dma_memcpy(
> >       if (!txd)
> >               return NULL;
> >
> > -     v_lli =3D dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWAIT, &p_l=
li);
> > +     v_lli =3D dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
> >       if (!v_lli) {
> >               dev_err(sdev->slave.dev, "Failed to alloc lli memory\n");
> >               goto err_txd_free;
> > @@ -743,7 +743,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_slave_sg(
> >               return NULL;
> >
> >       for_each_sg(sgl, sg, sg_len, i) {
> > -             v_lli =3D dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWA=
IT, &p_lli);
> > +             v_lli =3D dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
> >               if (!v_lli)
> >                       goto err_lli_free;
> >
> > @@ -826,7 +826,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_pr=
ep_dma_cyclic(
> >               return NULL;
> >
> >       for (i =3D 0; i < periods; i++) {
> > -             v_lli =3D dma_pool_alloc(sdev->pool, GFP_DMA32 | GFP_NOWA=
IT, &p_lli);
> > +             v_lli =3D dma_pool_alloc(sdev->pool, GFP_NOWAIT, &p_lli);
> >               if (!v_lli) {
> >                       dev_err(sdev->slave.dev, "Failed to alloc lli mem=
ory\n");
> >                       goto err_lli_free;
> > @@ -1345,6 +1345,11 @@ static int sun6i_dma_probe(struct platform_devic=
e *pdev)
> >               return PTR_ERR(sdc->rstc);
> >       }
> >
> > +     /* This driver uses unextended 32-bit addresses for descriptor li=
nks. */
> > +     ret =3D dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
> > +     if (ret)
> > +             return ret;
> > +
> >       sdc->pool =3D dmam_pool_create(dev_name(&pdev->dev), &pdev->dev,
> >                                    sizeof(struct sun6i_dma_lli), 4, 0);
> >       if (!sdc->pool) {
> >
> > ---
> > base-commit: 93f51579e7df248780214094418f205253383cc5
> > change-id: 20261021-submit-sun6i-dma-descriptor-mask-v1-35bb381b932a
> >
> > Best regards,
> > --
> > James Hilliard <james.hilliard1@gmail.com>
> >
