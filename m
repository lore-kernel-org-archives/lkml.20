Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DB044A411
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929561; cv=none; b=BKqWBfGDaELCUbYTwgUf3Fdy2mfH7pUONIvUYJarzPk5lBkWB5bY3s6tnraUBqDAehIqMwEev7W/AuurxXtKxSkckbXYeODG6XxwLMcAp+ITD+xYgRb8Mqb1Hbxp4bMnaNBjq4R+I1UBjwVGiXTvzvDczWSl3d1p1wigIxuX0cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929561; c=relaxed/simple;
	bh=PAvkE0hEsDjsrQLIbjPxiMaGNpImfrF/NuPpzzyRhCA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BlUv5r2rJ2R5dHX+QtAV3La2SXuvtHS41hzBVJJRtGnB9iv4bTTREIqVtgjpZUs34Ax9qDgv1G9sthwW7gltba4Yd7NvbCLYZoL264Yo3o4Iqbbern0XhHsuPo/sDLT2sLC37gmhnm0fpUa02fNylnz1nDbkoqb6uza0tIz3G8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=hooxsSSI; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="hooxsSSI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790929550; x=1791188750;
	bh=JF+lB9N5zrc0eEEV+Fj6tuEAiMhErWeVlB2b6FMPFZ4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=hooxsSSI3hQCx5VeXhgQsgmFf99GD5CzFYfLgKsa0N2vpvu2Yt/MyO678pkKs66YL
	 VbGgeSIKxq6zGYDljCQGIWuVfgfmWEnC9zteCaYi41tFB2ojenkp9BVM7pgz5OGG+C
	 DgFFxP5epZfgo0Zi77pKonRfvdsE49f2OFGLLW3V+3t6J1JDpWJue3w7Y6Vlrk4bZ0
	 KXrWDBk+Cw7ivPIKUhLBjsa4+0UcEDw9GiVSuAs/YqQ4yJGZuFxqomeuId4HUohpAe
	 Zh91b65AWvIpsiRnObV81KtUdWhprwtvg/7ysUd/j3uWg4Fp0RlA5ap3LZfLr30qQ8
	 WRawpjbuQ+YKQ==
Date: Fri, 02 Oct 2026 08:25:43 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, sashiko-bot@kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/3] Add support for the Sony IMX681 camera sensor
Message-ID: <20261002082537.74084-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 13de14f6c47b96018f1a3acedde943f2f6b4e680
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Sony IMX681 is the user-facing camera on the Microsoft Surface Pro 11 f=
or
Business (Intel Lunar Lake, IPU7), ACPI device SONY0681. Without a driver t=
he
camera does not appear at all.

  1/3  dt-bindings: media: Add Sony IMX681            (mine)
  2/3  media: i2c: Add Sony IMX681 sensor driver      (Andre's, co-develope=
d)
  3/3  media: ipu-bridge: Add Sony IMX681             (mine)

The driver is Andre's, reverse-engineered from I2C traces taken under
Windows.

Changes in v8
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

From Andre's review of v7 2/3:
https://lore.kernel.org/all/CAKNG7X8_fNSNKK8FGtm4pey+Pq1PP+38PFTn8O2yP8L04r=
pcpg@mail.gmail.com/

- The clock comes from devm_v4l2_sensor_clk_get(), and the 19.2 MHz check
  no longer depends on a clock being found. v7 skipped it when
  devm_clk_get_optional() returned NULL, and its comment said INT3472 on
  this machine hands the clock over outside the clk framework. That was
  wrong: the sensor gets INT3472:02-clk at 19.2 MHz through clkdev, as
  v7's own cover letter showed.
- The probe error path calls pm_runtime_dont_use_autosuspend(), as
  remove() does.
- At Andre's suggestion, we are both maintainers, in the binding and in
  MAINTAINERS, and 2/3 carries Co-developed-by for me.

Also:
- Andre's Acked-by on 1/3, from a mail lore does not thread under v7:
  https://lore.kernel.org/all/CAKNG7X9NkbXSnWGR4-79akJ7WiVeGa7D0mC=3Dp1Pz2g=
TFO4npZw@mail.gmail.com/
  Krzysztof's Reviewed-by is kept: the binding changed only by the second
  maintainer line.
- German's Tested-by on 2/3 is kept. Its only functional changes are
  Andre's two above, which he tested on the same machine, as I did.
- Each patch carries Assisted-by: Claude:claude-opus-5-5.

While this sensor streams, IPU7's CSI-2 receiver logs "Received packet is
too long" once per frame, and the frames are complete. Andre sees the same
with his downstream driver, so it does not come from this series, and he is
looking into it.

Tested on the Surface Pro 11 for Business, on media next 2dcdfb625c3 with
KASAN and lockdep:
- the clock is INT3472:02-clk at 19.2 MHz, with the sensor as consumer;
- v4l2-compliance 46 of 46, no warnings;
- 3844x2640 at 30.01 fps;
- the four flip states give the four Bayer orders, and EBUSY while
  streaming;
- runtime suspend after streaming, and capture after unbind and bind;
- no KASAN or lockdep report from the driver;
- W=3D1 and sparse clean, dt_binding_check clean.

v7: https://lore.kernel.org/all/20260923211816.89954-1-lsa.uz@pm.me/

Andre Gilerson (1):
  media: i2c: Add Sony IMX681 sensor driver

Sergey Lebedev (2):
  dt-bindings: media: Add Sony IMX681
  media: ipu-bridge: Add Sony IMX681

 .../bindings/media/i2c/sony,imx681.yaml       |  108 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx681.c                    | 1032 +++++++++++++++++
 drivers/media/pci/intel/ipu-bridge.c          |    2 +
 6 files changed, 1161 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx681=
.yaml
 create mode 100644 drivers/media/i2c/imx681.c

--=20
2.54.0 (Apple Git-157)


