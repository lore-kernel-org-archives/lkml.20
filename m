Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792585740;
	b=xNKtYdRdgx3/d5+ok3eUBEemYsYjXqaiZnKN1vikoC433krEzPgTvPE4iIdgsRjXePWp
	 M2C75/Z0Y6dTRkw2FITSFoMB9TRwJ+RG/vqRNcJ2QTgwdDAAK1MDwH9zzb3mhK5jtYGgR
	 CJf0n3Sz1ZBH2cMt1hgEUXfh2O6PYi08qjQwKmxXS0t4+ivNK83R4d9cn+/9wodD1/Hue
	 kGjoOL2BR7rHwIZThu6MnbpjxebwLUwSIInHJ6Etr80N+gxAr29hR5dcStGByhpno2QTC
	 SZQggGq8vphjKYidFJOwc8acPzXRpkH8wUrUVhg/qa+MmfWfEvD4pYrFvqw30VurbLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=g4O8khcTpJs61vFbjSBcX9Y11r4LD3txGBsj73SOpGc=;
	b=b46F95ZBfK2GIKB9+Gop23nIYbDQ3j5QQeDiieJkeLQTK4k4G8u9kk0kbki6VxyHExO6
	 q375e5LF4Bdd6QBdUZFzKDQxONE0pRvdVXZuy9KDAiicJYUL/BGzEDVABwat9sIBUL/TQ
	 gjTl1U99BLFHmQhPJ2H6WupMSzs+uCGg9ZF8Oxovz/lULXoHI7cZpGs0F1uBzK8o58Vd9
	 I4yW16nQbn0U8SxzxVecz7najuBvaQ1bfY5VOo1By042t2fdQyUbo4GK2N1xWpAWayMgo
	 8PSx6sZeEfeR+DroZJyMBBqJKC6gniKzqiSmjtFajRIJls4x4Zs++2BOW63yvCjSz7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=F5SCqw95;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FC2606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3FC2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=F5SCqw95
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8470d7d430fso300614a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:28:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792585738; cv=none;
        d=google.com; s=arc-20260327;
        b=ptFaPK5inXhn4JSa7E8p9JWfA3m236PRiSl5fKaj5ryeL5/nmTvSj//toBMNfKRj4Y
         qTsXv+ZrkVhuGZjWC+QZyiqrvX9YsvKa1ub0uAg/Bs8ZcqSpkrjZgtqUpsRX8dNOJX+M
         lAkzNC8dk7FK+PgRTnCZz2onEZN/9K6Kg6wsNRxAfYwvLtt0uNN2lhHpfmcE2z8Lldx+
         hrx3RnnyURBeWNkAAgcdGoPR2xpn2PTPHLxwK79mcaGJhfzh7fJoBgA/nCfR270ZmGcc
         0VvL2MrVcF7lKaMsR7FDTXj6JL8eJfCiSm7RcP/ZsTZdu+NXE0BAXHxm7Vi2/SjEiJbv
         Gvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g4O8khcTpJs61vFbjSBcX9Y11r4LD3txGBsj73SOpGc=;
        fh=HUrqBnzRSpChubWtulRZWh56o3hBjtYCh3oK9RO50vU=;
        b=kq83tUYOVj82JXHo2heEGefGhnhd3WLHs2y9rF5uACZkppvzkRSJzCbQO4NLajAEK/
         IKwhzog0YsCBMke/6cWBRTNooTApTuWyDSdT6dNjjF0Pz64GGOjpUOhBO/Ka9OmAOmpN
         IgIQKXqe0Hq2L7rkOZRjvEMTditDdeursrh27AruaeLWLmYlm79mGbv0Zh0QjAy2e/OF
         XsnQSUTAeQkK6NqXuShfpZxEQt7hHaHi4VyYoDz9+X0z7dMvQba9E56HshqNztdPfzVB
         e8ssVELAlbWonUWsA7707nQFMpL2QAJW1dg86ZRk5XjZd+WPh+0kpPFfu/XoMU5Qc0hT
         aKQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792585738; x=1793190538; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g4O8khcTpJs61vFbjSBcX9Y11r4LD3txGBsj73SOpGc=;
        b=F5SCqw958yf8kyvurMPJAim7LDasq8Nt5QRzf7QGPv5Q913QUdYlRBbQbtTq5mMzZW
         OwD1CR/EDhHPSC6ky/A797uYqB7h21X6v+cRgeIFLskkblHBjeRPMlLJqW34CyVWDwmH
         BbbEtk2tuEVEGvlMdJ5ugrxGyMzdhqS3JHepF/FKEISjrQ+eMCd+5QlqsO14VctNtjI1
         bezZJGRP8ZhYqTnmGNj8JGTtqJN7vfgjbjULvZQ0tFyrl3oulePM8KbwiLpeaIBfYZv5
         002QYjQjFRTQgNpMZpJd1zIVqYYcQPsztiCi6JR3FE3/hfk0j+ZOxBejdjxVWWtin2jH
         ciFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792585738; x=1793190538;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g4O8khcTpJs61vFbjSBcX9Y11r4LD3txGBsj73SOpGc=;
        b=GvuLGR+EPQIKX4jKLf2Wwa0lEyjczmUg6xXcCN28Tr2QLhCH1L67vBre3hjlIWYcdk
         /R//R2qAY8QtXGILKAcPKAsn/PFHabFbsPAO/HFT5EIRJ5BsQN6X9uhPkiKsZkJucf6r
         YIkKl7TUwoySOzKo58JgATUk2kJFvtZbzxDN8a8VxRjhboELk9CAllExlwh+NSrsv5wo
         lmDrnOcq1O9RvEbcUl34qrOTCrNFq3NoSBrB9yuAK6M9aLef2fYUZ3g0LzfKFFXNxpHR
         o0WZGhf1EOH4IILBxvQ7uK9857yVKv2QfkNTrMKSVTulZbmnjM/M+LznnOyIW/4O25fP
         Qkbw==
X-Forwarded-Encrypted: i=1; AKwUvBzF5oyqctUf+/wmlqJso1kFch4bkPWTQOg7xwngBqYm9wMhAVNVQTNUGFUozD2bbc273sEhwItdl+CZgmg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIffN10+zXSfVTVMsnohd/u/rsdbtY5fwvnk1gGLsQrj3L/nzxN
	FJWy9t4/Z8sHGdykViamFw6sMpHNv3IgXZcqVFjtMYKn5RjHjZiUpyLCuLqnPDeERbffx7VMuK6
	OewjTo0AFsHRh3NKyZLdCacojBqj3HvLsJp6m+RDPgg==
X-Gm-Gg: AYBFou0aDweEx4r9fQ53XFfhJwcU2PHmVGInEzR01X0l3gjrnAwCeeOek0l9rUBcKh3
	wE/ETFJ/HeaoBnkv2SgR7PgKZImI0PZTGhdBKIexaYNZqTm43RdwKKEXa7LcV68fm4YwDLt0xo0
	pXVMt/rfscMUr0AIda+lL/M31we9W0S3qWHZIyWeGFVGzhm1s17xpqUhxY30aycYKEYTrq8ktjB
	so5CiaNqJpRuhvWqKuYx+37EEhSWC3RYkJzDftHtKeuxkdB1UOcdy/znL2cvcqATvIHQmoS8OXX
	qR2cr/z/RmOQKEJ8CkYYSft6uSSW7bU2McX8Fs0lcaGug8Il6S6CVay8ZWhf61kl3HnAC2u0NzX
	s6LaAv2Zv7GxLTmjQJ6dxdTwGVnQ0CHCDFufT1MxXq7NsLHuynNIbwR3CIrbL8OBUkohK1I45CG
	mCGexgQQ17nVBOxnmeaRCnYkPWJbL27VXCDiN1qH+OU+MDSkbDJ2M81Q==
X-Received: by 2002:a05:6808:4482:b0:4d3:9029:5ab3 with SMTP id
 5614622812f47-553585760c1mr1050030b6e.35.1792585737133; Wed, 21 Oct 2026
 05:28:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019014720.2635-1-lachlan.michael@sony.com>
 <20261019014720.2635-3-lachlan.michael@sony.com> <atdGr8S2sf1kZFUw@kekkonen.localdomain>
 <20261020125630.GA158670@killaraus.ideasonboard.com> <CAPY8ntBUncMWB2DqFG+iS9gFgW2aaeyMrD6x-c_4Da7rJDv6Mg@mail.gmail.com>
 <atiogo14sCFw4xlT@kekkonen.localdomain> <20261021120521.GA273922@killaraus.ideasonboard.com>
In-Reply-To: <20261021120521.GA273922@killaraus.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 21 Oct 2026 13:28:40 +0100
X-Gm-Features: AclHuK9hqxcMJ0HhysTs5L34pzu1OSW612PUOHHd1l1X6LjoVQ847rGG4xISb-Q
Message-ID: <CAPY8ntB6bbdX+3drOjubV4dNAxxKgNmHoE+uZ_1JmQ2-Y+ocbg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] media: i2c: Add Sony IMX908 image sensor driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Lachlan Michael <lachlan.michael@sony.com>, mchehab@kernel.org, hverkuil+cisco@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, kieran.bingham@ideasonboard.com, 
	jai.luthra@ideasonboard.com, Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, 
	Tim.Bird2@sony.com, Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sakari (and Laurent)

On Wed, 21 Oct 2026 at 13:05, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Oct 21, 2026 at 02:56:50PM +0300, Sakari Ailus wrote:
> > On Tue, Oct 20, 2026 at 03:50:09PM +0100, Dave Stevenson wrote:
> > > On Tue, 20 Oct 2026 at 13:56, Laurent Pinchart wrote:
> > > > On Tue, Oct 20, 2026 at 01:47:11PM +0300, Sakari Ailus wrote:
> > > > > On Mon, Oct 19, 2026 at 10:47:20AM +0900, Lachlan Michael wrote:
> > > > > > The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
> > > > > > output interface. The driver supports RAW10 and RAW12 output formats,
> > > > > > exposure and analogue gain controls, image flipping, blanking controls
> > > > > > and test pattern generation.
> > > > >
> > > > > The imx908 appears to be a Starvis 3 sensor. How close is it to the Starvis
> > > > > 2, for which Dave (Cc'd) is working on a driver (see
> > > > > <URL:https://lore.kernel.org/linux-media/atdAsDGw_jvhaydM@kekkonen.localdomain/T/#m0c50ea017ef9ae0d3d76a36b840db9b6f7ac296c>)?
> > > > > The register defines in the two drivers appear to be quite well aligned.
> > >
> > > Asked and answered at v1
> > > https://lore.kernel.org/linux-media/TY6PR01MB17839FF48671E744E7E23A93E92D42@TY6PR01MB17839.jpnprd01.prod.outlook.com/
> > >
> > > > The current version of the driver implements very few features of the
> > > > IMX908 sensor, as crop support has been removed pending the raw camera
> > > > sensor model, and Clear HDR3 is being developed. I expect more
> > > > differences to appear when those features will be merged, so I believe
> > > > it makes sense to have a separate driver here.
> > > >
> > > > In the future, I expect the raw camera sensor model to open the door to
> > > > more code sharing and more drivers supporting a wider variety of
> > > > devices. We can decide then if the imx908 should stay a standalone
> > > > driver, support other sensors as well, possibly across the Starvis 2 and
> > > > 3 families. I'm willing to help with the refactoring at that point if
> > > > needed, the maintenance burden won't be on you (and I'm sure that
> > > > Lachlan and his team will of course maintain the code base).
> > >
> > > Agreed.
> > > I have compared the datasheet for imx908 against the Starvis2 ones,
> > > and when we start looking at HDR modes they diverge a reasonable
> > > amount.
> > >
> > > Even the later Starvis2 sensors (IMX585 and IMX676) have minor changes
> > > to the earlier ones, so adding Starvis3 would need some care.
> >
> > There's quite a bit of this in the CCS driver, due to the variance it
> > allows for implementors. I don't see this being a problem as long as the
> > foundations are reasonably similar, albeit we can see whether this could be
> > further extended later on to other sensors.
> >
> > I'm fine with having a separate imx908 driver for now. Dave's driver also
> > exposes the variant information through the media entity name so that
> > should be done by the imx908, too (at least if there can be multiple ones).

No it doesn't. My driver passes .name from the variant to
v4l2_i2c_subdev_set_name, so the media entity name is common for both
mono and colour variants.
It's the same with the imx290 driver supporting the different variants
of 290/327/462.

libcamera uses the media bus codes to determine whether the sensor is
mono or colour, not the entity name.
Having different entity names would mean duplicate entries in
libcamera's sensor_properties, or otherwise manipulate the name.

  Dave

> As far as I understand, the IMX908 does not have a mono version.
> Lachlan, could you please confirm that ?
>
> > I'll review the driver properly soonish but I reckon it's in a pretty good
> > shape already.
>
> --
> Regards,
>
> Laurent Pinchart
