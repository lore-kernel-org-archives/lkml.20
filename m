Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC004A689F
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005731; cv=pass; b=S4VUmoAhVjJsq4azdpoanQ4f6f9L0fJYwgmKlUr0kVAELgixl9VO1CZ/o+qyslxfYFVfMbn+ORnUr45jgTubVZ0rh72w2gSRIoQsyViJJbwQrJcPEsjxZb6/oKAJvDMeEEMDfpQVNJY1ECofa8fqquwXMK0bNm3fS8gxqcTTeS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005731; c=relaxed/simple;
	bh=hqCP8q73l4xlgKtVJj6PdBYEoe4oFusfyO5eUoNJNqU=;
	h=In-Reply-To:References:MIME-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I+2KohPuJW4Ov87MCCyBRWBJxYc4M9JZYbxhOFmWq/RtiOAvf40pR32+RabPHaYVAvFSrpqIduV6ALBbnbvAZQmnjhLU/ilCQ/ZNBQR0OrBLUxkI/xDFxSuq0nmJm2niVM83WWG5gtYSqSDGVc+0zDv4uXytNDSMt2varNdSgTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=E1smwW+q; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="E1smwW+q"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8b402f4e3so3276438e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:48:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790005723; cv=none;
        d=google.com; s=arc-20260327;
        b=XLRsWwYzpQxZSJHWHT6kGamBQ7itbPbfIwlthupaXe8ZEoCz4uYQmXvO4D0p5jU5LY
         MN6/Zd/EAleLbaaF5rsDAnMj24kfS++FuxSl7E7DLfjUypd1egd1RMZNuwxgDg0KVlw1
         Gkmor69DA22fr0lAK5LyVoud+vw2EyGL6WJyeY6wQo2yPLfg3huZI6EmhCifRq9XsWNj
         LbkdglicTfmIQFKMUjyxMCEfmxCJ9hxKpvLwCrxKCNv7aZ9lWd0C+5mpnM0wP9Wn71mK
         gsLW65QNp98QJBMt0Hf3OOOEpjcrQ35Vzi59L31BF1KWtvkF815MyxSUJpFSbz5S7ZKy
         nwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:references:in-reply-to:dkim-signature;
        bh=hqCP8q73l4xlgKtVJj6PdBYEoe4oFusfyO5eUoNJNqU=;
        fh=ZQ9vJGbMWFe+HGNth3s1KnlGU4XONLGKYB8c/ECLNXM=;
        b=HpcE9kqON6i+1JsKYxcQ5xDcIQJ05NHZGiDVPk6XTg2WW6nK8VPYSSNWzWAQsPltVU
         m/uQBR8z52irFx4SRRVk5o8QygCfG92xsJLfmLmm+kgbZT8Ng0ycgW1l+h6fBzUGySJP
         x8YMVNmhnx+qj338x69A+MtlHuL4If5IWyZ96vO38x7uwhdn6/oB6f7v+78lbHrO9uYz
         SmkHZE66/yxfLqk5PMYFT8wOo+izIK+cEdssxvsdWg72FcMeF63TgSYhGvbJDOI91mYK
         N7ycFfbsPE4u7TB1Tu6vB3RPWq7jrEYhH4XqmB9UrYd/LRO8g4jGbgNwCiomrl0VZHXg
         EDAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1790005723; x=1790610523; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqCP8q73l4xlgKtVJj6PdBYEoe4oFusfyO5eUoNJNqU=;
        b=E1smwW+qdPoE98wCzdKV3IFnCVe4KLjtJbnKhXfw+Ta1s3/237pAQsrAbc6gkQbqVO
         TfAWPaGBSroYmadOJxSAGLvcOdxTpO6chOTE8olhb7wxAKJfOyQXuFAe+l0j/2aUrf5j
         cEdDbb4TBlnLh0P62eHYdE/K4Ua0bBQ0KaoE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005723; x=1790610523;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:references:in-reply-to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqCP8q73l4xlgKtVJj6PdBYEoe4oFusfyO5eUoNJNqU=;
        b=Uiu4wmbdFghLfcBcdsNKpdJ4rpCEB8Y6Rf2VIqvemXLoYWMZwVaNDyQl0Ja7mBYIXu
         UlmGdimoiSGvKpuABucUDW2ZJZU+qBV6qMsa/QxT8ti4pUwdfDwSiwyUMDiwHOMxKf/T
         42xtvIYlwaHuVVWE9ViZDPgmZ+BD/cEoIFtZ5uTsBNhvBsxBuzTgj85Sow72/GyMz2uF
         d3B93bi5Dhoro+3m/gvd8zIzvnyQu8Kuql4xBXJGd18gSsn+tYx7gezDIjLLubIykpAV
         +3Y6ezl1DBoVZTxwRQjkTikGKfplKt+hYYmGYyUZT69kjfLawJqhQna3tExGGylUQm6N
         CooQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcN66FBEtjeKwiGcPeCuNNQjPCAKd12NYfJgXC0oicvbmy/49xt6gakIkhRFUgGABcx2QLNCWLTJdZ5W8=@vger.kernel.org
X-Gm-Message-State: AFuF++kxaszS7M70F1A528fnyavEBeQhAf+oEoZGEDldKAKoLg74QSa3
	bgmYl9LSqgctk5tR8QMDBlDwmUnFo9y0qJzIN52Z1sfR9y41WoWLMt889NYG8MrtwzYBA417S2u
	xOhO6qD4c3PAUmX3uNNy8SO42x5fBRAhXc1RQt3R7/g==
X-Gm-Gg: AYBFou37I7EWNoQFNc3R7R5Hsq7g761E+ew9BDhT8g6yIUwjx57ibtttFvvCoOmqSDL
	fGnlYv85TmuSuEg8sszxRhaPYsNRxMgzDKWaISHk6exKPQCYxtKbVPnEDhZQc4qBoY/jCxrXRK/
	70l3eTy80PHXz6sOeefbb9pF5lHNL4Acw4a4wNigOzjyNQkUzk+fkXEnXQZjMgTbMrPLpiPEH2P
	KGFKlCauJSRJD2HyvAKotOXrl0P2aOsbT/9kuZ+sZbmL5qMsQVbFPrbx9m3xYZiYf2n9cMgeCSZ
	DFX9V2zcIyeQtuGFYH3MnkwNXsAxYwPO2OCRau2GhCbpdhPPTaF2BafD7QfhUhBR7f4FPfnqPoV
	3PsDczECbeEM6Fj400a6DWF2twxsD29Zt
X-Received: by 2002:a05:6512:39cb:b0:5b8:bc5e:d100 with SMTP id
 2adb3069b0e04-5b8c195b41cmr4452537e87.42.1790005718733; Mon, 21 Sep 2026
 08:48:38 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 21 Sep 2026 08:48:38 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 21 Sep 2026 08:48:38 -0700
In-Reply-To: <DLL0PZY25HAD.1RWXC61P3MZRV@bootlin.com>
References: <178911388614.25348.8892025153904636456.macb-resend-1@khu.ac.kr>
 <20260915083839.71546-1-pabeni@redhat.com> <CAH1Bc_yQYJ6cWyYVvfWK0pAgrXW1TMkpzmNxZvAXAKZJdiOqWQ@mail.gmail.com>
 <CAH1Bc_z6PFc7N6XVZ2dQEH=7D9mkXwGkXP2KKMW-Emd4zcf3fA@mail.gmail.com> <DLL0PZY25HAD.1RWXC61P3MZRV@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?4oCN6rmA7Jqw7ISdW+2VmeyDnV0o7KCE7J6Q7KCV67O064yA7ZWZIOyghOyekOqzte2VmeqzvA==?=
	=?UTF-8?B?KQ==?= <5mghybrid@khu.ac.kr>
Date: Mon, 21 Sep 2026 08:48:38 -0700
X-Gm-Features: AcwNN1Vx1sHe6ZDAEcThELJ4Tdn2z8qxNTUS-8vTPEnaX6AQ6ya6oOxZJBqyO1M
Message-ID: <CAH1Bc_yDpY1q3yLH5R+fbr_3=LicRv-qsrcPQYspZHz095TVxg@mail.gmail.com>
Subject: Re: [PATCH net RESEND 1/2] net: macb: Preserve one-step mode on
 rejected timestamp requests
To: theo.lebrun@bootlin.com
Cc: netdev@vger.kernel.org, pabeni@redhat.com, conor.dooley@microchip.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, richardcochran@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Th=C3=A9o,

Thanks for explaining the approach.

I found both issues while validating hardware timestamp configuration
on the Raspberry Pi 5's Ethernet interface for my research. I reproduced
them on the board and tested both fixes there, as described in the
cover letter. These were hardware-verified failures, rather than
cleanup based only on source inspection.

I've already applied the fixes locally on my Pi, so there is no
immediate urgency on my side. That said, the structure you suggested
looks like a cleaner way to handle the configuration path overall, and
I think it makes sense to take this opportunity to rework it in that
direction rather than keep the changes limited to the current fixes.

Rather than posting a v2 limited to the current two fixes, I'll prepare
a new series that refactors gem_set_hwtst() along those lines and
incorporates both fixes. I'll link back to this series for context and
validate the reworked path on the Pi 5.

Thanks,
Wooseok Kim

On Mon, 21 Sep 2026 15:11:13 +0200, "Th=C3=A9o Lebrun"
<theo.lebrun@bootlin.com> wrote:
> Hello Woo-seok Kim,
>
> On Sun Sep 20, 2026 at 11:04 AM CEST, Woo-seok Kim wrote:
> > Following up on my September 15 reply. I noticed that the series is
> > still marked "Changes Requested" in Patchwork.
> >
> > This series fixes rejected timestamp requests changing the TX mode and
> > the two PTPv1 RX filters disabling receive timestamping. As explained i=
n
> > my reply, the additional issues predate this series and are not made
> > worse by it. I propose keeping those fixes separate so that this series
> > remains focused on the two reported bugs.
> >
> > Could you please reconsider the Changes Requested status in light of
> > that reply and continue reviewing the series as posted?
>
> To me it all depends on the intent behind your series. If you have faced
> this bug in practice and your patches are intended to fix your usecase
> and prevent others from facing it, then we can take your patches as-is.
>
> If they are edge-cases cleanup patches and you never encountered the
> issue (maybe because you don't have hardware), then either
> - the patch won't be accepted because it's overall churn or
> - you fix the full sequence fully and we consider it a noticeable
> improvement and take that series.
>
> About "the proper way(TM)", I expect something like:
>
> int gem_set_hwtst(struct net_device *netdev,
> struct kernel_hwtstamp_config *tstamp_config,
> struct netlink_ext_ack *extack)
> {
> struct macb *bp =3D netdev_priv(netdev);
> u32 regval;
>
> if (!macb_dma_ptp(bp))
> return -EOPNOTSUPP;
>
> // Step (1): tstamp_config->tx_type validation and precomputing
> // of TXBDCTRL and NCR values/masks.
>
> // Step (2): same for tstamp_config->rx_filter.
>
> // Step (3): read-modify-write NCR, writel TXBDCTRL & RXBDCTRL.
>
> bp->tstamp_config =3D *tstamp_config;
>
> return 0;
> }
>
> Improvements:
> - we remove writel from the validation code
> - we write to NCR once and not twice
> - we don't have a tiny gem_ptp_set_ts_mode() function that returns an
> int for no reason
> - also NCR RMW probably deserves some atomicity through locking
>
> Thanks,
>
> --
> Th=C3=A9o Lebrun, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
