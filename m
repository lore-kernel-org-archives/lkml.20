Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8CC1419A4;
	Mon, 31 Aug 2026 06:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788157648; cv=none; b=QvTIQIJgUjpBwhjmVg35KdaJD5+P2AsI6qg/HZpcozq/X5OUYzco+6N/3dsqH83G8XDsPA6pFOWuu1tOUXjN7B4dL93bRmhUNp/R4DAojS6Vf6x4QCjwuFyvxO+QcS200Eimv+NsebYYcDCwnJP10u0fv08vSjOiMF6M1XBnrLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788157648; c=relaxed/simple;
	bh=h6TrPn8BNsIv5ZFTjsdChli3MYu0Z+ur1tvxsNGVmaM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Sb1YZPNefR6bHqW4FSYnNRBnVwLWDn0LR1xektH3L2+5rOaiw3Q1nU+QkHv2eNQMlxSRdHXc4HsqMCkBlA+ZU/U3lLB0c3iF1l/7ES2n2A1E53RJzO55Gdo59iLtzcs/bwiBKDpESJZXWM60Vp+eBP5CeK6fbsSK62WDxtz8xLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NoNHBMnQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NoNHBMnQ"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:a9ae:3688:6dfb:71b0])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CD53D4BB;
	Mon, 31 Aug 2026 08:25:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788157555;
	bh=h6TrPn8BNsIv5ZFTjsdChli3MYu0Z+ur1tvxsNGVmaM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NoNHBMnQyODMUNxuY5tF7WdSCg5psyzcrzeTiTIjTLbT2dRrMXYvyQmKHZ+WrhFU0
	 1aZ1jMoXx5+aQvDkGysFFpK5QmkscQ4SeUkVI36/De9l4asnE+Xba+J4GD55thRE1p
	 wcxUyoEEqmiqcuvVFbH1gNbA6GakJr0FLo9ZJymA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <178428817339.1426769.9456608230178052105@freya>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com> <20260717-b4-vchiq-isp-v3-7-fb8235e15c68@ideasonboard.com> <178428817339.1426769.9456608230178052105@freya>
Subject: Re: [PATCH v3 7/9] media: platform: broadcom: Move unicam driver to subdir
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Mon, 31 Aug 2026 15:27:19 +0900
Message-ID: <178815763934.1005982.3278179844103617258@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Jai Luthra (2026-07-17 20:36:13)
> Quoting Jai Luthra (2026-07-17 16:34:22)
> > The BCM283x/BCM2711x SoCs capture camera frames using CSI-2, and
> > optionally process the raw frames using a VC4 firmware-based ISP block.
> >=20
> > As the ISP driver will be added subsequently, move the files related to
> > the unicam driver to a separate subdirectory to ease distinction between
> > the two drivers' files.
> >=20
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
>=20
> [...]
>=20
> > diff --git a/drivers/media/platform/broadcom/Kconfig b/drivers/media/pl=
atform/broadcom/Kconfig
> > index 93ba565d9a02..cab44885182c 100644
> > --- a/drivers/media/platform/broadcom/Kconfig
> > +++ b/drivers/media/platform/broadcom/Kconfig
> > @@ -1,18 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > =20
> > -config VIDEO_BCM2835_UNICAM
> > -       tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
> > -       depends on ARCH_BCM2835 || COMPILE_TEST
> > -       depends on COMMON_CLK && PM
> > -       depends on VIDEO_DEV
> > -       select MEDIA_CONTROLLER
> > -       select V4L2_FWNODE
> > -       select VIDEO_V4L2_SUBDEV_API
> > -       select VIDEOBUF2_DMA_CONTIG
> > -       help
> > -         Say Y here to enable support for the BCM283x/BCM271x CSI-2 re=
ceiver.
> > -         This is a V4L2 driver that controls the CSI-2 receiver direct=
ly,
> > -         independently from the VC4 firmware.
> > +comment "Broadcom BCM283x/BCM271x media platform drivers"
> > =20
> > -         To compile this driver as a module, choose M here. The module=
 will be
> > -         called bcm2835-unicam.
> > +source "drivers/media/platform/broadcom/bcm2835-unicam/Kconfig"
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig b/d=
rivers/media/platform/broadcom/bcm2835-unicam/Kconfig
> > new file mode 100644
> > index 000000000000..32b76ebfcd9a
> > --- /dev/null
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam/Kconfig
> > @@ -0,0 +1,23 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +config VIDEO_BCM2835_UNICAM
> > +       tristate "Broadcom BCM283x/BCM271x Unicam video capture driver"
> > +       depends on ARCH_BCM2835 || COMPILE_TEST
> > +       depends on COMMON_CLK && PM
> > +       depends on VIDEO_DEV
> > +       select MEDIA_CONTROLLER
> > +       select V4L2_FWNODE
> > +       select VIDEO_V4L2_SUBDEV_API
> > +       select VIDEOBUF2_DMA_CONTIG
> > +       help
> > +         Say Y here to enable support for the BCM283x/BCM271x CSI-2 re=
ceiver.
> > +         This is a V4L2 driver that controls the CSI-2 receiver direct=
ly,
> > +         independently from the VC4 firmware.
> > +
> > +         This driver is mutually exclusive with the use of bcm2835-cam=
era. The
> > +         firmware will disable all access to the peripheral from withi=
n the
> > +         firmware if it finds a DT node using it, and bcm2835-camera w=
ill
> > +         therefore fail to probe.
> > +
>=20
> Oops the above paragraph is no longer there in the old location, I must
> have missed dropping it during the rebase.

Ah, yes :)

With that removed, looks good to me.

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

>=20
> > +         To compile this driver as a module, choose M here. The module=
 will be
> > +         called bcm2835-unicam.
>=20
> --
> Jai
>
