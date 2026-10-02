Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C8230567D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929052; cv=pass; b=gj664N82zvaYGIF65wPnC+pgDbUGdI/krbDTuLDkWhV7xNRQcsSN2pwT6q6nFM+g42UPQierSC6y9q1wcpGUOFn0Zq6gyle/jL6eVFFhNhQCmL1ajHkNfuiRMqQAF8CBJ8CN8GiMt6o4wmItUKBd+wwDSqQ/kl8Mz5YLizpn9dQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929052; c=relaxed/simple;
	bh=yP0Uvka0dBVEPB/Ts+qYbZsrtI1Iq4TR9VK1IZ5/J2M=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hG+6TRUZSMmUK4kwvqnHWV0b7j/3Qj4/BFbFHYNbMYKU4lk8sZgucaMhb/i1lOElRQP6Rvp0crTQfGzQUA8FuknGVpn1twSN6euYr5RqxlttQ0mi8LCnoGqq0q4gaG3T8CrpTSi92S6u5VZKaDs2L6ikLFIxzw0t+9jo750vKOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dHAN25Ua; arc=pass smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dHAN25Ua"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6d821901872so3161822eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:17:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929050; cv=none;
        d=google.com; s=arc-20260327;
        b=bWwWiBoUfaf/07gmPDHJDSupItTk/saSwHOZmOGIhF+iqnaHDBSmpXpN93OmOW9l2U
         YPwb4Oevtlu7fqLx1qJWevN2/N4JJoQMf3lOFktbKGBF3qnHeCa/sC3MyQqWkJxIpvVl
         U/Ch4WQinenl/OrgvmybeX5kruUqynTcU9MQNwmUegx0Lt6FmFwHp2ZdHJv/yczlaszS
         VuFkj/w/9h2rJqCr/S6k4rjUn3V2K0XwAoS56YoFShP3clD0KTqeiqwjy7+If/MjdC5i
         q5oWziDqV/WG18v9bbNdAh+OOxjxXkB/VF+x+n/R9FQ4y27OEx/1YKTVBec4zY1Jxz4N
         8o5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=nAaf6vnA5XQ9vnvtvU/bvGUXPo3uUVdVfKvAyLZjyh8=;
        fh=WsP2n/NGm2ZIV/8v7cgqWjSRoLgJl+q7y+azuiWOhA8=;
        b=GXMSOVGZCyhYqoSMfvPByK3OPXgIaMUyFbqHF8a+dWesKTKwz4g91lf9j5isufWVEy
         xDoz7qaJ2t3itsWIAiz4y63odd27XlFMRecejpZuVHwc/fK+XN8GIDayKduLxj4QIq4R
         y32XwNHs+fF7mplvdTStyzE0QrihqQUv54rQkIslINGiXinFXHU4/OIEvmb6D8atA1On
         Z57hjKLmfeEXh2HAsJHVRRTEbB1T0nRYT+eWHo3aJJivmEokVB35TBNAi+V0vomY+H87
         xO6bEwt7LDE8lLu1mtWs9378LZfxMf4fjaUt0wC592gnIjypyPPUyp5qlkG292/fZk6g
         /rXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929050; x=1791533850; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAaf6vnA5XQ9vnvtvU/bvGUXPo3uUVdVfKvAyLZjyh8=;
        b=dHAN25UaDD6GIg2AaK6g25ePNhkTejmVkWbhnbIv9fq0N1wIUuwrzyvk2OkW4sekUn
         OfBR6zMcdY7U9SlronmorLdJbVZQR7YyQY268QUh1a0nGF8c/rHvzRNbt9ONeawRxjdn
         /RurAq4sfeK6FVZDmedzaEkUNOYqravsaXkRooxm059KKxcV0npLiDVMCw+tZaMkyaOt
         /SMetuPDklMSEDzhIxzpjKStQdPLyzrJXVSkwF7w2TXlbQvC+OIuBDRKq3uRl0rSqEen
         ZUMS2CQGTF9eJUeKTFNKkOWJ6s2zCPF5m3DZl3Df6goAy7Gdwc7mLkA4uZAVQGGhoVhC
         niUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929050; x=1791533850;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nAaf6vnA5XQ9vnvtvU/bvGUXPo3uUVdVfKvAyLZjyh8=;
        b=kcemroxpX/CsI0+rpfdeMV7N7q0VFcnKPEo3v/2+EFIqWXzTVNjanznngwGBJZh3Jk
         F+ThNed8VMzLn1lC7tDjU78eNQxcpGp4aWz4bqYtfKfeNgHqlq4iWZBBusuXGZvR/FIh
         dRIWyADwfyGERN99u4/zCR6BahaJ0tKD7ydEsQxCJTpYeAFIB4/QpqRj1WbPB0I4zLEo
         eEJENtpswFh6qgih+YIJN2sh7NTCKnbw/Qe58JvXDcaxOqkZOBmp55cChbJaiX65Av1m
         N8RjCPRkptS0bz/z/yAtkzstOPDy2nqIUpsnoiB7s50BitbQIjPLIfGF013JIyus8AXN
         LbNA==
X-Forwarded-Encrypted: i=1; AKwUvBzygtBNa6Oh6woBbI/g7CuBzjIWcDufTrFG/vb8FdxX2d3rE/05pAXYDgkRc42FS1BhvOS0019+P4/umLc=@vger.kernel.org
X-Gm-Message-State: AFuF++nrapq26ouCsFVumAH3RH7ftLiIbneRuj8HPGapax579CJ/cAUB
	Hp4UzlG+P91klCMttPatmCcgoqNn1RdMkWRJkhiojXEqxPCcoxuWwrvPSizvOU8KF54AQas8Cyp
	0oQVj0LiTzZugqzMuBHcCzPUOKH3FdsE=
X-Gm-Gg: AYBFou1+XCQjLkDwQMLkSBr15TsGd+EXGcpYAWFGKB6mmMbDiMeCWgLmX9up+gFQT5L
	lLrgmP2EjsBn+CoBjAQKZwKchfq539c92+lIlK3k4qbjYoySnNYzBKYotuvRRqsi43SbrTqWRnE
	M1/1V4fl0cL56g7byp/lwshWqY9o83hMwz9crFLvekoaySlYs8aPN3PojgHS58WnbAH2NpkoUIf
	DGe8X2by/TBeBDlUKodz6m2yml2ZZui/sHTCVKs5JdRKgWBkroSQT+8O5Zx3lM6blq4SBya8oZA
	nq7pqkfUWxzyDa1JnXJUmsqP2rm/pcA276pfpeAXfadFPB2xNygNgL8vixfT4ZtI0PcxdwNCfH7
	6jL0ugOALcfQUyX5hor7YG/LmAFBCyf+jacwbkSy9XBpr
X-Received: by 2002:a05:6820:4d0b:b0:6d3:abd1:9b87 with SMTP id
 006d021491bc7-6ddbbc00bfbmr3849611eaf.45.1790929049888; Fri, 02 Oct 2026
 01:17:29 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:28 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:28 -0700
X-Gm-Features: AclHuK-LkFsJIx5Cbfw0ls1bBDJPniprCrmiLQY6zRB0q00k-eSSW4zhDq20kFk
Message-ID: <CAO7O_xiWyfnnxh4OrnKCAFtsx=e-187sAW_Vj+Tmii_F_u8tfQ@mail.gmail.com>
Subject: [PATCH v8 05/15] media: ov8858: Add INT3477 ACPI ID
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 97bcadda3fd8..ed6d3e1cdf7d 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */

+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2093,6 +2094,12 @@ static void ov8858_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }

+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ .id = "INT3477" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static const struct of_device_id ov8858_of_match[] = {
 	{ .compatible = "ovti,ov8858" },
 	{ /* sentinel */ },
@@ -2103,6 +2110,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
2.53.0



On Fri, 02 Oct 2026 01:15:55 -0700, mauriziocasciano7@gmail.com wrote:
> Add camera support for the Lenovo Yoga Book YB1-X91L. The tablet uses
> an AtomISP ISP2401 with an OV2740 front sensor, an OV8858 rear sensor
> and a WV517S rear-camera lens actuator.
>
> The series adds the missing ACPI and bridge configuration, selects the
> OV2740 link frequency through the existing IPU PCI-ID mechanism, derives
> AtomISP CSI-2 timing from the sensor link frequency, enables raw Bayer
> capture and adds the sensor controls and actuator driver needed by the
> hardware.
>
> Runtime validation used the same 15-patch content on the current
> media_stage.git master. The final media-committers.git next rebase changes
> only three source line wraps needed by the media 80-column check:
>
> - W=1 builds and sparse builds of all eight affected objects passed both
>   before and after the rebase.
> - A full x86_64 Debian binary package build passed and produced kernel
>   7.3.0-rc1-yogabook-media-v8-20261002-001605.
> - The kernel booted on a Lenovo Yoga Book YB1-X91L with AtomISP PCI ID
>   8086:22b8. OV2740 negotiated 288 MHz and OV8858 negotiated 360 MHz;
>   both sensors bound and AtomISP registered two cameras.
> - OV8858 digital, red and blue gains were changed during streaming and
>   read back correctly. Continuous raw capture produced changing frames
>   from both sensors (6/8 unique rear samples and 8/8 unique front
>   samples), including front-to-rear-to-front switching without OV8858,
>   I2C or CSI errors.
> - Both front and rear cameras were also exercised successfully with
>   Cheese.
> - v4l2-compliance 1.32.0 completed 47 tests on the AtomISP capture node:
>   40 succeeded and 7 failed in invalid-ioctl, multiple-open, input,
>   control enumeration, stream-parameter and buffer tests. These failures
>   remain a validation limitation; this series does not claim to make the
>   staging AtomISP driver fully compliant.
>
> Only the Yoga Book 19.2 MHz OV8858 path was hardware-tested; the existing
> 24 MHz paths received build and static-analysis coverage but were not
> tested on separate hardware.
>
> ---
> Changes in v8:
>
> - Keep patch 2's commit message focused on the implementation, remove the
>   invalid review Link and move runtime results to this cover letter.
> - Express OV8858 frequencies with HZ_PER_MHZ/HZ_PER_KHZ, name clock
>   tables by their input and link frequencies, and remove platform names
>   from the sensor driver.
> - Explain that V4L2 exposes standard red and blue balance controls but no
>   standard green-balance control, so green remains the unity reference.
> - Replace the per-sensor link-frequency override with the IPU bridge's
>   existing PCI-ID matching mechanism. Add an 8086:22b8-specific OV2740
>   288 MHz entry before the generic 360 MHz fallback. This removes the
>   associated AtomISP hand-off patch and reduces the series to 15 patches.
> - Add the introducing commit to the OV2740 group-hold fix and mark it for
>   stable backporting.
> - Use the documented Assisted-by tag syntax.
> - Keep the padding helper as a normal static function and avoid a
>   single-use raw-format descriptor structure.
> - Retain Andy's Reviewed-by tags only where the corresponding patches did
>   not change materially. In particular, drop the tag from the redesigned
>   IPU bridge frequency patch.
>
> v7: https://lore.kernel.org/linux-media/cover.1788360629.git.mauriziocasciano7@gmail.com/
>
> Maurizio Casciano (15):
>   media: ov8858: Extract digital gain programming
>   media: ov8858: support 19.2 MHz clock and manual white balance
>   media: ov2740: Use C99 initializers for ACPI IDs
>   media: ov2740: Add OVTI2740 ACPI ID
>   media: ov8858: Add INT3477 ACPI ID
>   media: intel: ipu-bridge: Add Yoga Book camera sensors
>   media: atomisp: Add Yoga Book camera configuration
>   media: ov2740: support 288 MHz link frequency
>   media: intel: ipu-bridge: select OV2740 frequency by IPU ID
>   media: atomisp: derive CSI-2 timing from sensor link frequency
>   media: ov2740: release group hold after gain write errors
>   media: ov2740: add manual white balance controls
>   media: atomisp: Use struct v4l2_area for padding
>   media: atomisp: allow raw Bayer capture
>   media: i2c: Add WV517S lens actuator driver
>
>  MAINTAINERS                                   |   1 +
>  drivers/media/i2c/Kconfig                     |  11 +
>  drivers/media/i2c/Makefile                    |   1 +
>  drivers/media/i2c/ov2740.c                    | 114 +++++++--
>  drivers/media/i2c/ov8858.c                    | 221 ++++++++++++++----
>  drivers/media/i2c/wv517s.c                    | 208 +++++++++++++++++
>  drivers/media/pci/intel/ipu-bridge.c          |  13 ++
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  81 ++++---
>  .../staging/media/atomisp/pci/atomisp_cmd.h   |   6 +-
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |  20 +-
>  .../media/atomisp/pci/atomisp_csi2_bridge.c   |  19 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c |  32 ++-
>  .../media/atomisp/pci/atomisp_subdev.c        |   4 +-
>  .../media/atomisp/pci/atomisp_subdev.h        |   3 +-
>  14 files changed, 605 insertions(+), 129 deletions(-)
>  create mode 100644 drivers/media/i2c/wv517s.c
>
>
> base-commit: 4a069a763e8a86821edac4159f7c59a20015631b
>
> With Best Regards,
> Maurizio Casciano
> --
> 2.53.0
