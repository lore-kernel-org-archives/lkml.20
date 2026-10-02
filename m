Received: from mail-oo2-f35.google.com (mail-oo2-f35.google.com [74.125.231.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A003C4551
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929032; cv=pass; b=gOvymFLjJ0mkDLDzwLwqzMxghWxpZ8JuydBzs+SSZZjndvyocjAF6nMrt+EhgK64Fad+IqZhLcZOZzJlTONOkOwBkXHdXMCDR3PI2zQFyn3Og4kMjGffrSZ6Pa6TMB3LqlDTSnoTBRTC3A/IaH9VsgTxRaZj6e2mgzHZTjWNdPM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929032; c=relaxed/simple;
	bh=AW/hl4GAxmdzelzgtfN6Zdian7Bgh15Ju/suGkVS214=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6eDc8Q65d8A328BZbhiPHIcF6oRtoon4v6/ck8XCIhggM22DhNMTc6nYpzikzEeO3e1OytKOW58hqcCu82cFB21HscVBAFCx/VL4USVhRVae9RSv6ZEKaF7DJQfgKr6DRjqyF+Sgf6ClZMWTl7feVhROSsFkJc0ftxY8OVtLh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcljU18Q; arc=pass smtp.client-ip=74.125.231.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcljU18Q"
Received: by mail-oo2-f35.google.com with SMTP id 46e09a7af769-8212a719d15so1184857a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:17:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929029; cv=none;
        d=google.com; s=arc-20260327;
        b=EvgKxN8UQWjLTkwWIRMlf655UdLL+wnFBp3I+4uwNcYspDRmqNt+aKPHpbgewrfZL6
         oadZ77hqM5jWWFtqF2ZF6TsDvv5TaRhkTpQmwmOiWXhvjx4CTcHnZKAjelAfgwUqaadF
         lkIY2Whp0hetabspDa30AFxiIictOLq+908urWuPyBQ+BmmmOhfCkhS19hL5WJdfK5wF
         IWU3+LlukgnoROEP7ahSmpJTWKVRrFwHcv15jtpC/wxC6z4v0dGR1yT/XGsOorAzh3g7
         XgF0n/xmkaX5urTQfAMlY03raggV++mbrzBJVd8ptOWTCSzNnQCBsaPkLNHM3a8fbsO1
         X9Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=vwlaLQjJD4LA4qoX5aX57TZ11LYaUU8pRjBICIySVm8=;
        fh=5+xjhUvrl/Bn0mDIlQ2C/+nK8StYDUV3uIuH91mCEjg=;
        b=GqT6AUnxGfzOPeLYv68Xj55lKorlhktm3LU/ojbcoRX6L3tIakRpvrgrP0dEypM4Ji
         Q+CZUe5t8V8mAO2Vj5eCNHui3osHi+X1bj07uJ7g2eEd3tjM0Q+dd+3Azvyy0q/ayP9H
         tpV++OPg5sxmrjOtbS8CwCFqj+lW3Cf3GeNYibvML1+iLGgtwx5lHVUvhB4lkzZfipEx
         rHl7Bh1BeW6Osi9JVjHkT/mbY0PCnLaz9QkIGd80J/BTahLTan4wt4Kr3WNKEfqU+wt4
         YtVMy38r6nxYRjUsAszss3Cr3NCjeq76HwzRE+EfnYvrHGE5BmbQRV8vKI7OzRePztA6
         0/4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929029; x=1791533829; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwlaLQjJD4LA4qoX5aX57TZ11LYaUU8pRjBICIySVm8=;
        b=RcljU18QX/MfBolDxIwBObWNRGKGj9uqdIqBOR+RR8Ml2aRpG1HLCH2A1ED9uCz7qz
         2B6uHjLQNY+64i++ennbpBVbupWQl+U8aCdBsLe0mbZ5vTBXgep6mduhGQBJUXsWU5AO
         fm4+A/s+b3w+Ex3fA9eTH2G07fYR6LpPaHGgXUSWm6xpmW9uEl+QSd0lZ5fD1i+cnI1k
         +3RTIs5U5xC53JMVNsHwZXx5I3Knjn8gVcdO9oN4g2cbEaYkuIVwY0OS42qo2PPBpAdp
         7fxEfujcSUor6rpGlPhMNFR14mOZSROnMlYyc1jNM/+rJCWZi7NDtX6VC687ZpoeD3N4
         EvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929029; x=1791533829;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vwlaLQjJD4LA4qoX5aX57TZ11LYaUU8pRjBICIySVm8=;
        b=E4tZpjhbIkMItuoD/+FGjYFqBvhBZpMhB7RsQf5vPZ82Z+QGySgCisH6p2p3psVB/F
         UsJS4de9fIlA0UKGuiQXg7jtPb2AAAeMxHAXe3LVxps7fovD/V7soidfNnrQ0osE73bC
         U4VVSPKJKAXUJ7qW12j7mbAYRQuoMsvHqOlamJx1olqEYfsLydiahC3OkpHyXN2Yp9Av
         PjPe0PzHqpUJ5IItaKdZ8Hk+b/3G3o3CyA+13FOh9kLFtD3xz49XYpaJ3pvuiiYCEtT5
         L5zzPDr+5PP/JUiYANJX0drziJs/boPOC+YZJkkARq8Tt4SW1k+JI9vHJLNPJiQXVZN7
         wfjQ==
X-Forwarded-Encrypted: i=1; AKwUvByN4hg3DhR4YhAwmJd1p55FyhSKUPWcwiqeXJOFZBTLclrdyHRrHvHa3g1AJapXzDSLczq2o7r8e8WVook=@vger.kernel.org
X-Gm-Message-State: AFuF++lpyf/OAhYUo1lSo74wEd9ZUl+PdAc6K1B9kGvHyBN9MfMRdc3n
	i92Qf9s5eKJZS77HUzL9jBCg35/m9zC/oT79vltV3+5uusHG0r1G8up4MtHo0c8qvcheC5fSzdm
	NEburgvz+7pTBCI6MpkKuNLinqOsim2U=
X-Gm-Gg: AYBFou3jukurc5coTjQR3HLC0wLx7SRJw4RFIXNpml9tVp/vIMTZD4iOOL+6P37wdGO
	ckB89vdq48b8Zwc/H0mbSxh8x1oZpGK2mhOXWrgIhQwHkzVB4yCvWUDGaywOUYS1RoFnSMVsW0S
	fEw2Mi7/B3FepwtRHgBxq/KVAm+fxyvWfN4DdaEoW0x01ud27JNWyVsew7ZuDjOKlCydJwjnj+O
	/8AZ6E1D2TX71dJ0gFnPbcHA02MlIp8dmVU4QsZF25gafTRHZaSyfGtlg2ILZOMKaakIYzAhtMT
	0ICWg8Dkl7S/FQr3ago5Cxi7+/TM6gpDRH/HjUnoomhJq1wYo457fKvDS1zlC43uFWgXXRbvz8n
	mj3w9SNCnU1M96aysb5CanuC7ugO6WHeRVSgkZxp9bGc=
X-Received: by 2002:a05:6830:f81:b0:81b:9724:8724 with SMTP id
 46e09a7af769-82284553bb3mr2195651a34.11.1790929028678; Fri, 02 Oct 2026
 01:17:08 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:08 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:08 -0700
X-Gm-Features: AclHuK-s3En-dBInVKqqd_wUvqqzXZ7qVMyjE-03z1fuCXIHtAVrIsCb8dbhHsM
Message-ID: <CAO7O_xg+aLuRELykNbbBjpku3ttjoHL0EnH3texn3J2ewBL=dA@mail.gmail.com>
Subject: [PATCH v8 03/15] media: ov2740: Use C99 initializers for ACPI IDs
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Use designated initializers and the standard empty sentinel style
before adding firmware IDs.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Assisted-by: LLM sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 536325bb7b92..64a85735c1b8 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,10 +1462,9 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops,
ov2740_suspend, ov2740_resume,
 				 NULL);

 static const struct acpi_device_id ov2740_acpi_ids[] = {
-	{"INT3474"},
-	{}
+	{ .id = "INT3474" },
+	{ }
 };
-
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);

 static struct i2c_driver ov2740_i2c_driver = {
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
