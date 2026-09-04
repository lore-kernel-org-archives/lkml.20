Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75395377A8C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511511; cv=pass; b=SiE7/NJyXw8IAeBGWb021aY78jDe1TrK9DA97XL5BdrfU1G3+uKcbLb2ztz7eDZuQrNI8+d21I+c61z6rl53KcN21v4UTv+X8fZgdxf6gtCLANkejRp4TmoYbmW6UDJv1f70soPQYOfnrnhFiFnIY/dr0EgM+H+RwiPAwS20hT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511511; c=relaxed/simple;
	bh=ddWQm3AZ6cvQ44lJc0rMjwwvQelTHxTzDdlLxm7fDVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pv8stfb1BfeZ4UUh0HJ+kTcUU9vRHzmtOr7spwVPeUCHtzjbF+B6CwVtwlPuqm25YoRkSxl0Ma4Q1d/da930nx7EGLW+th7dHvIsUlhcyXklwHez2Acy/sz4HOO5fhTIIeGgO9vWmsKF/Z3w672A2samSpf0LlmD0NmDvvFWUiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aDEgE3Gx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OHq3BLB2; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aDEgE3Gx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OHq3BLB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788511508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5hWDcK1vRIq8wGKAJgDKooIThOZ4ktEKyx/Je8y3ptg=;
	b=aDEgE3Gx16F5a81dR4/WYqbjI5OePsUxtoW2tJaTndCIuk1X6wNOWneB/obrt0fA8i985j
	WIUo8EPQZ/b2tcyG+fMpSC4tOTPo4lge3ljxh1QBMoyDEmbmki/wiKMu0k7woITd/qGWGR
	KUGW1ozrbSeOW8H4+Jng/Ud2Gh5DfTE=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-176-O-DQVerOMGquxHPd0Yer0w-1; Fri, 04 Sep 2026 04:45:04 -0400
X-MC-Unique: O-DQVerOMGquxHPd0Yer0w-1
X-Mimecast-MFC-AGG-ID: O-DQVerOMGquxHPd0Yer0w_1788511504
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4519ef1babeso556509fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:45:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788511504; cv=none;
        d=google.com; s=arc-20260327;
        b=RTGrYMVb4We2LQqpeVe7jxKF1vZpfLKgUnRx4yBk8ukdb90OwZAjU4WiG+KE60n/95
         M2pm5RcpsjhR2Eay6w8xYkafbFcKPND9qikyYzAimJOEc20Vp51WfsVjtZVRYZQxzaRH
         JWfl8sSMegO7vsFEHgMLZnG8yDI6kv1Q6dbjpyZZjeb4ItBgBp/uODIG7yZfOJQ/fPm7
         P4RnK6OZDSW1MkkDvcLPyHIH6NDCpdQuNJFw6XLwgEBgYrvIDs9BN/Ulf/h7d2imFeFS
         jG3TCSvuQd+H4zR1jJNQPAcUhLkQZ0m/cguUIDIzdkIDCbJm+Rlj3njtrnQlxeAFfjCx
         9TJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5hWDcK1vRIq8wGKAJgDKooIThOZ4ktEKyx/Je8y3ptg=;
        fh=dIFsiOJ9cGOlUqHYmvWeL/J9NldOUTGaStieEYPgakU=;
        b=a7yUoTDUeoZbnGhnS4Mmpp0oadZWHUYC4gnp8YzV29OGE33Ay+ceKqhSNh1KVAKvW0
         miRFwVU/8OeMwf5d4802mGBf4sHUlc8EtFm94pxQIpp13eds+RHojgxFhPrCUNkmDhEb
         8PpDSdw1gEbtykIgbr28uvM6nC3R8rquSaml4D2eGTAY7u6H8LCpP58PWHHGX62U5Z32
         KxKu7zn7657PhRdmFRnmbDdOVV4OVR7eLY6uXQHm89FMFGfmHset8NWHHrouJ7k9GA4W
         UU7qCeSj33eessnQEV3rhm7NNgYAEiv6idpH4Za5t2AQ/l+7qK9/RfDK/YbHOrMWeA1h
         d+SA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788511504; x=1789116304; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5hWDcK1vRIq8wGKAJgDKooIThOZ4ktEKyx/Je8y3ptg=;
        b=OHq3BLB271y1jwP3b0ndufgr7TNvfUJRhjRvUJtosBavzp4H3EnvaTWaTVaNj0QGVU
         QPGrYH6sMFqC8aMe78wydXChgzhUWYC9YMo9XT6hss52aXFnX0hOddzkpwIKusXeEIho
         pMqklrdYX725vRVFRiqQE/VsOQA4xKFL4OQSKOwrepe50LRypCtcK0ismEzxo2VbHlDb
         o5McWZ0MvCr84UjS/MFTr3HrwImPkiTWO/n6F+EgCS7sFb2e3mPbLE4uHQS8r7r7P0BJ
         985x90yoOjZC/jCtnPB40nOeFMfqXYP78GnZ9FgFfELPH5pUvSURAey1x3c6NdglpSfk
         j1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511504; x=1789116304;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hWDcK1vRIq8wGKAJgDKooIThOZ4ktEKyx/Je8y3ptg=;
        b=IkA5x6puKpH31TH1pA6OMeTErEilmW5L73dc1OOlfBWl8/vH5Qbox33vg2W8We8vrl
         /OTfnzk6Oj5kKEDLF/29r40b7ESDfFiFuhEAofzVR4Kus28Cw/uNIeFTu2/3E5ldiUdO
         bMQbKhGrcPzY90ZrBnIK+o+iAdpiDRFNAtYQKGrQhp2VNrUd61aJVY/G3b+nNHTb1eLq
         CpdLcpx6yaXQH4OfedoPNEiF0cRu8WtXdzrMeMyHxIiLFBqEykqwPNWm69kS7EAi2K2X
         7NAtgFIRKO8q/FklnGons/NE+00Bwbv6+cYSNld+n1gU3T6wdr0JZT3/3179YpNAxKG9
         XJTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgZnwl/pDu4MziJ+trxOMNTbPfkoifehvHRkvZIseeIO/aQ/HTiZpmICXbZcPm/Nyr4LTdoXzpKkod+mU=@vger.kernel.org
X-Gm-Message-State: AFuF++k3oQo+A4cZM1klcOT8nMDPL1xcyQ+OhFtGHJ2/z1fg2fidRpN4
	3LGbsEgVJpvCEgas6aZBSRf0Azyr5azfb1IxOIUdwRj7c8X5Ah7NE6cRnr+JGA4cnaZgFBT8vJc
	Vrytiq9cJH8MOn0UFirIGkf7hSiMwanc3rerVQHLi0Hd9kWgAUls6aWfwDpfuGTofRwfXrG1V2e
	9rYbBtjp/5URPe5/h5ntRWIhL7Wbz9LgbgC8uRU5Hz
X-Gm-Gg: AYBFou1iSL67qdxDK3+m4qhLezl4Q8Wc207MRJ7ZPBYSoHJTvfJREj0sfeSPGY49+7I
	jTUGQzSEKqWwLaXuXRbqi8d7aOJ5pvfd6yAUg4sQewsTCq4YUkPvr8BdUvWi0OmH6KDyfbqCgof
	t4sj3Jk50S9HEvodTF+OMQNJik6XbCDSInTedbvTT7/MhpkuOxDMvMO70r
X-Received: by 2002:a05:6820:16a2:b0:6b1:4280:9e18 with SMTP id 006d021491bc7-6b6fb8d26c1mr3436177eaf.13.1788511504122;
        Fri, 04 Sep 2026 01:45:04 -0700 (PDT)
X-Received: by 2002:a05:6820:16a2:b0:6b1:4280:9e18 with SMTP id
 006d021491bc7-6b6fb8d26c1mr3436163eaf.13.1788511503655; Fri, 04 Sep 2026
 01:45:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904075113.125751-1-hpa@redhat.com> <20260904075113.125751-2-hpa@redhat.com>
 <app-yOyzA32vQE7e@valkosipuli.retiisi.eu> <apqCH5zmpHdgr7cT@valkosipuli.retiisi.eu>
In-Reply-To: <apqCH5zmpHdgr7cT@valkosipuli.retiisi.eu>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 4 Sep 2026 16:44:50 +0800
X-Gm-Features: AcwNN1XTYKXi-Mg7NPCpn9KaqgTU2gMB3DRT1LOh7pBu5pPrgKf8OCjGK4zxtSc
Message-ID: <CAEth8oGi2funBOGaG71SpyGoSnPbvxuobmWV+Ay3Hqc46PM+vg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] media: i2c: imx471: Add line length PCK setting
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

Thank you for reviewing this.

On Fri, Sep 4, 2026 at 4:32=E2=80=AFPM Sakari Ailus <sakari.ailus@iki.fi> w=
rote:
>
> On Fri, Sep 04, 2026 at 11:18:16AM +0300, Sakari Ailus wrote:
> > Hi Kate,
> >
> > On Fri, Sep 04, 2026 at 03:51:11PM +0800, Kate Hsuan wrote:
> > > Add the line length PCK setting to the IMX471 driver. This parameter
> > > determines the horizontal line scan duration and is used to calculate
> > > and control the sensor frame rate.
> > > Set the line length PCK value to 0x0a00 (matching the original value
> > > in ipu6-drivers), which maintains a frame rate close to the datasheet
> > > spec (~150 FPS in 2328x1304 binning mode).
> >
> > This fits on fewer lines, please rewrap.
Okay

> >
> > >
> > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> > > ---
> > >  drivers/media/i2c/imx471.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/imx471.c b/drivers/media/i2c/imx471.c
> > > index 4053aed84340..3c939f2a9056 100644
> > > --- a/drivers/media/i2c/imx471.c
> > > +++ b/drivers/media/i2c/imx471.c
> > > @@ -91,6 +91,7 @@
> > >  #define IMX471_CSI_2_LANE_MODE                     1
> > >  #define IMX471_CSI_4_LANE_MODE                     3
> > >
> > > +#define IMX471_REG_LINE_LENGTH_PCK         CCI_REG16(0x0342)
> > >  #define IMX471_REG_X_ADD_STA                       CCI_REG16(0x0344)
> > >  #define IMX471_REG_Y_ADD_STA                       CCI_REG16(0x0346)
> > >  #define IMX471_REG_X_ADD_END                       CCI_REG16(0x0348)
> > > @@ -240,6 +241,7 @@ static const struct cci_reg_sequence mode_1928x10=
88_regs[] =3D {
> > >     { CCI_REG8(0x030d), 0x02 },
> > >     { CCI_REG8(0x030e), 0x00 },
> > >     { CCI_REG8(0x030f), 0x53 },
> > > +   { IMX471_REG_LINE_LENGTH_PCK, 2560 },
> >
> > The register definition is nice but there's already a control for this.
> > Could you do this via s_ctrl()?
okay. I'll update the value when set V4L2_CID_HBLANK.

The original driver in the ipu6-drivers sets this register with 2560
and I found that a larger value slows down the fps. I try to make the
fps close to the datasheet.

> >
> > There's also another set addressing related issues here
> > <URL:https://lore.kernel.org/linux-media/20260904075113.125751-1-hpa@re=
dhat.com/T/#t>.
>
> Wrong URL, I meant this one
> <URL:https://patchwork.linuxtv.org/project/linux-media/patch/ede568ada430=
4d2dc92cd43986fc07aa68628154.1788377269.git.christian@themurphys.eu/>.
It's ok :)
Ah yes, I noticed that. We can discuss the pixel rate there.

>
> --
> Sakari Ailus
>


--=20
BR,
Kate

