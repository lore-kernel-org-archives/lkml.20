Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9C0284B2F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929085; cv=pass; b=B9Bb5wW90iKwwj/60QMk2oFvA4XYOASc6G+Yft0s32PmTCFQY2ounnacDW1SMMjjLODsC1zCLQU6bjMDFH/MTiv3s58szLwMKIf1IDGJVDfqWM2iJ8ER1aQsrr7rLgGCKpIrDU0A8DthknHFTP2oAFVkus+aI5UhedtmE8n85aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929085; c=relaxed/simple;
	bh=twBPHrY5BKr0n3iVtHv1M8Hxql+kPbMFNXvWJopuaBA=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s3Bu1TQFs2RqxoJe2DfJq7ob2a7WGaDZTLh2LNPwBKGRqSeByR7IPkrrahuQjCrmBTNl0/dW4E1ANrywEwaz/CJUxVxzgk/xM7FIqGfkFgdNd0XnuDAe5Au94jrB+VGY+vclU5b86ZzU733f7qVdFGB5c20A1U7RVo+uUfGEbB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oad4M3IL; arc=pass smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oad4M3IL"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6def0527340so553614eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:18:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929083; cv=none;
        d=google.com; s=arc-20260327;
        b=fvLbOdbf6/j9IYVhKMklLnmzRQzihJPJzNELDspXB4DoJokYGQgmCJKICANlclbHLT
         Z5Etq86LShMtDzcDSl9NTX1fIUR6Vi7XSaBfdJe/YgbXZitVDMXfdEuKX1c6mLRQDo6Q
         f9EvcRQxoYIwxh4KuQ5b9Ybpow5HCVCnPmmGuQ/9+i2ULbJog5z9rVW1S390BSuimzhs
         +OgYVoYxeSmzU3VSHlupB9pwePUep6EIadWF1hJPrFQHVV1OKjkPtDS3IP4d4RP9suUc
         5NdV1bXUnNY54LWXrMw45e6iCS5i6D25PXX+3TD+yJv8IDr9C7MxvwGCgj9E8HS8HJrO
         4Plg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=bpg9iRtZofswrYhKLOFSBMFWRKDxygadnyFAvbF7xh8=;
        fh=2OgzZLaP4lKisojNBAWP5H4dhz9z0pa06fadNovYXKI=;
        b=RuWcY/m8SCWc3S0zXXqx7UiWvqp3GgAgTJpaELKt89p9ejWTwuJklkTeHWrFxzHUGQ
         rh1zbAQATwE84Acv+BiAc6xDauSX7mA9k7hCsLvDa4i7jzk7hquGDEBxZ0ifQF0gLn56
         o5//+6V861n/6luXNDuzYgbeFGbvJXqp8vy7XH6fhNIgPLs/r7Q1rLttAmgf/BSHO/NR
         fpnA1m40yxsn3LgfbPa/BCxmrnzD6joeRLoq3h7sT8ZzqWOqNZ706jePMY5KDMmXAcJQ
         dw6lTHQ3Lt4HWuZE1Wif8oL1KavJMz7BHCn3YoBSIVziuYI6EN1reN140p8t/Qde3Hfp
         GQTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929083; x=1791533883; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bpg9iRtZofswrYhKLOFSBMFWRKDxygadnyFAvbF7xh8=;
        b=Oad4M3IL+pVN9UnBDpC3dyYCyxqlsGmxSsLONHHMj9HFnwmJUUTSacJgUr901/0aLi
         +0KsVvUnhaH+EhtIQytEPRUIRSM9BLh49P9veV310ycCAnIWVFIOHOUaU6YWGhj1JsoT
         XwNPwdcCuefh06CZFt9UjvgkIf5x2xAOFgCYr0UPPIthjF6otTpMOU6uN08mjowbDptx
         iN7kOzqL9FPkio7ESF6gNZLFXat8Ojm7jTeDlOlU6K3g4IycSy1U2VdEHaQ5afKBrqB4
         m4fu/UCXQjmcOa1QVI8S+hTUvoaSgu2hmWpqu84nCZ/JLQZqvV8oAWEs2Wz7GDOypwbs
         Geag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929083; x=1791533883;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bpg9iRtZofswrYhKLOFSBMFWRKDxygadnyFAvbF7xh8=;
        b=qyFfm7QM82miehL2jUHCxirzaVEPDwQiD7KNSRtirKYiCeRm9m+FlOrOG4qiSrWtkU
         LFqzb5ORKMLCn+9q+Bfzm9slNXTnxldWrn9QbC1WfWzxyxiOUPrwJbRoFHe5eWo1aG7p
         eoWXCOfuH/eLEU6eEXwlcLNmNEA5fPh098fJVRpO2VPh1COHDAzODc1l95P+QSNakrFg
         NsnVN+cfyHnFJyYHdzyG5CAqdkLSTfMkFtCf/9xH76pFS/uZFiKGyHG4GX5cOW278Z13
         Ae1AX5vXNIgWn64O3fxxa4rVSo4ZBtgzUL/l7i4zR7UeYOriqdMNK2LOdTCAYRPYzO7C
         RjFw==
X-Forwarded-Encrypted: i=1; AKwUvBwq7+fs6TRN6AyOJUXquDRNQIdnrsgr5rZEQOPU5XfprJ9ni04jz9tXqpu3G0xVEJ1H28K8fbVCOzoP2Xg=@vger.kernel.org
X-Gm-Message-State: AFuF++nVjwg55ceFBS+Gdo+vyXQFSLA3IRVhIzCR/AwOKzam7U67qYvQ
	GJfWWmCYUsmN1sHUqGV49JEAfQmJpuedIsoUTCcw6ZGc/5SLZbMDpZ+4SH6OwM0hJPWZNJhMjSh
	Dd6oST4TYuuY211x/LPZgC9eP6wukOeE=
X-Gm-Gg: AYBFou3rpD2VUk2d2P88DDJShS7iPRbr93jyoii/ouYyFLs9Ou5RNdD9bz8wlNSwg29
	PHGkadbmgTtaJDwe7tiwzmkoclAB8eOpzCibHuYYloV8rNz6zGXP87mgLPlwkHd5nrC/0EScvEQ
	Mz4cgH8mkYN7ADYy9ScSGmecZFwtW88A/1pFfJZSKHW1TRvw9+kCBzuhl7R2gXz43qzrcFGWCcw
	WEzxmeClI4TAUx1MuMdNu3N4xPwCHxYFJLCdszlAQWxcsKv6gq0lEIm/nWO8fwU9V9IQmy1RCCs
	w02RkMppKhP+jht0FavAxmLR5cOi2t78V4HKh0JqPqpba4Q0DrHW2A8b+b/ZcmtDRP4FiZNYHJS
	4TQtDXuCZtKbLAMk9PPO+CYZC2qltSm9PFw==
X-Received: by 2002:a05:6820:1787:b0:6b7:8415:d780 with SMTP id
 006d021491bc7-6df33b9a1c1mr1670231eaf.43.1790929078189; Fri, 02 Oct 2026
 01:17:58 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:57 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:57 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:57 -0700
X-Gm-Features: AclHuK_y4aZgp-8VABFxR2YWElsBKo_XUFzWtprIfFIUbpsBiWg0j3l3zIKhLyU
Message-ID: <CAO7O_xgtBoo65XO5K7NMiRZX4QicQgEr1BgcBrk85kwGckS5Kw@mail.gmail.com>
Subject: [PATCH v8 08/15] media: ov2740: support 288 MHz link frequency
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The Lenovo Yoga Book YB1-X91 front camera uses two CSI-2 lanes at a
288 MHz link frequency. Add the matching PLL configuration and mode
timing.

Reuse the existing 1932x1092 crop and mode register list so the Bayer
order remains SGRBG across link frequencies. Cropping the CSI-2
receiver output to a smaller processed frame is a userspace pipeline
decision.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 830f5857d73f..ca33ef30267d 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -12,12 +12,14 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/unaligned.h>
+#include <linux/units.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>

-#define OV2740_LINK_FREQ_360MHZ		360000000ULL
-#define OV2740_LINK_FREQ_180MHZ		180000000ULL
+#define OV2740_LINK_FREQ_360MHZ		(360 * HZ_PER_MHZ)
+#define OV2740_LINK_FREQ_288MHZ		(288 * HZ_PER_MHZ)
+#define OV2740_LINK_FREQ_180MHZ		(180 * HZ_PER_MHZ)
 #define OV2740_SCLK			72000000LL
 #define OV2740_MCLK			19200000
 #define OV2740_DATA_LANES		2
@@ -91,6 +93,7 @@ struct nvm_data {

 enum {
 	OV2740_LINK_FREQ_360MHZ_INDEX,
+	OV2740_LINK_FREQ_288MHZ_INDEX,
 	OV2740_LINK_FREQ_180MHZ_INDEX,
 };

@@ -142,6 +145,14 @@ static const struct ov2740_reg mipi_data_rate_720mbps[] = {
 	{0x0312, 0x11},
 };

+static const struct ov2740_reg mipi_data_rate_576mbps[] = {
+	{0x0302, 0x1e},
+	{0x0303, 0x00},
+	{0x030d, 0x1e},
+	{0x030e, 0x02},
+	{0x0312, 0x01},
+};
+
 static const struct ov2740_reg mipi_data_rate_360mbps[] = {
 	{0x0302, 0x4b},
 	{0x0303, 0x01},
@@ -468,6 +479,7 @@ static const char * const ov2740_test_pattern_menu[] = {

 static const s64 link_freq_menu_items[] = {
 	OV2740_LINK_FREQ_360MHZ,
+	OV2740_LINK_FREQ_288MHZ,
 	OV2740_LINK_FREQ_180MHZ,
 };

@@ -478,6 +490,12 @@ static const struct ov2740_link_freq_config
link_freq_configs[] = {
 			.regs = mipi_data_rate_720mbps,
 		}
 	},
+	[OV2740_LINK_FREQ_288MHZ_INDEX] = {
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mipi_data_rate_576mbps),
+			.regs = mipi_data_rate_576mbps,
+		}
+	},
 	[OV2740_LINK_FREQ_180MHZ_INDEX] = {
 		.reg_list = {
 			.num_of_regs = ARRAY_SIZE(mipi_data_rate_360mbps),
@@ -502,6 +520,22 @@ static const struct ov2740_mode
supported_modes_360mhz[] = {
 	},
 };

+static const struct ov2740_mode supported_modes_288mhz[] = {
+	{
+		.width = 1932,
+		.height = 1092,
+		.hts = 2160,
+		.vts_min = 1776,
+		.vts_def = 1776,
+		.vts_max = 32767,
+		.reg_list = {
+			.num_of_regs = ARRAY_SIZE(mode_1932x1092_regs_360mhz),
+			.regs = mode_1932x1092_regs_360mhz,
+		},
+		.link_freq_index = OV2740_LINK_FREQ_288MHZ_INDEX,
+	},
+};
+
 static const struct ov2740_mode supported_modes_180mhz[] = {
 	{
 		.width = 1932,
@@ -1179,6 +1213,11 @@ static int ov2740_check_hwcfg(struct ov2740 *ov2740)
 			ov2740->supported_modes_count =
 				ARRAY_SIZE(supported_modes_360mhz);
 			break;
+		case OV2740_LINK_FREQ_288MHZ_INDEX:
+			ov2740->supported_modes = supported_modes_288mhz;
+			ov2740->supported_modes_count =
+				ARRAY_SIZE(supported_modes_288mhz);
+			break;
 		case OV2740_LINK_FREQ_180MHZ_INDEX:
 			ov2740->supported_modes = supported_modes_180mhz;
 			ov2740->supported_modes_count =
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
