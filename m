Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229833E451B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929100; cv=pass; b=H5y+UhP+cgMoioF5A7EroACpq48HKmqOygX+/Zy3GWXVf6sHuzNPTfax8nk3m1wlSSrAhgn91NkFRuv1lUK/nsJ+IqzM3S1UTSwe0EqjxLQfTC7Asgp4Vif7ayJ08AecHgOUuU5+7HTZcrAHwYDE1fjhSLtDslbDj2b+jCjDkV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929100; c=relaxed/simple;
	bh=7EVMDuKzBqZVcNCXlQnBFINw7P1UnyWCrmfNr9JGnz8=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LmwjrXDnnCewd5hVUUmSgUHYxlIbS7JQ6dkJxFf0vt1X87EHjikWh1A7i438qUUvJue8dh2PoGJu3JYPiIf2QoquYAbmRBoAAVF97QZ8/IJoozjO+FoGdY3HjsZQmpbpEiXONDUCi+PE9VI19k2PEm8vCHJGaBKFnB+EeLUnusg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=na0QqLZ1; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="na0QqLZ1"
Received: by mail-oo2-f40.google.com with SMTP id 46e09a7af769-8231c185333so136973a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:18:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929097; cv=none;
        d=google.com; s=arc-20260327;
        b=my7MhcoAJ26Jh5kiFwhJkJsh3XdF4LaeKQR1/y1DoXmCKyR4qfN7YmGzjl3dzpLlVh
         oo+ZF67SkCOlY2rIKANN5lWTfQzqlEMxAxstdzy9qmub9bgx8Cqscah8Y+JP8QXBnkOd
         fkdprQhOqgwnqsPbRUWm/bEDKiA/qBpG07jSL8YI/QiYz5NL3zyY6d9M2qChX5YpMvYG
         6f0B2en3dMsZQvV+KPvoXQWqG1+gkrousrwgdKg182dVWCzK6ACI94TBOqeguVZsuzEK
         Qdvhuv7M7J3oHKV8qBNZ/qQ7PwkrnghFjaGC7Xzcca8FTn/u+QWUFEvvr6NRxnZ/obDX
         GiGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=A4IQ1/kTTHFgKJOYmQmnoUv9o1yUv01ASaulT28gTBs=;
        fh=k/XVJPtNXfBVepAp9AVdegOIVooU4A5etoyWk6Bcqjo=;
        b=MnZFBXVlLUCCzcPCyIxnFNqN/HakH+2gIZlGDvSAEy5pxZsPBzlhLIujnT5WwrGhtw
         Pg4PlC7KcE8AqqmoQoe+dKeMKM3JfO3fTaV/QpIMAWZZxAwK9cJr/PQ0S8dPhA3818DC
         DIPNWQI3jbrkym1h7QyNvMs8ppbFy+dk01hZm8WpYDwvmX0TfoKpzn8WaSifkSTGLbrA
         Ty+MieXT2nhlEgPvgliB8/fXvIqYJ5CQYrkhD+Ze7WCAFAzGm1QmeiHrfIFqfZuDoehE
         JgZvUge3xat89ZMKHBvL1yx1rVsCrp7bb2X0eibgKswLQKJs52qfzizkLVEnP9c9xpAq
         pdVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929097; x=1791533897; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A4IQ1/kTTHFgKJOYmQmnoUv9o1yUv01ASaulT28gTBs=;
        b=na0QqLZ1kkmct+Tpal96jABkBEEkn9MuANCRvU3YnJJa8N5dWrLbEIYmoH1zsK7kWz
         1drPWI0arGVRVraEH/Lw5rqVF5dkjhnXb1JHJiGX/GPNXEPSoHC0rBHel7kvURN6NP4Q
         NRl5yN8iwCyeajiD65a7CSmwIeLq6XGelyTrFivqcBEvdOWDfCNubWTV8I8wcE0sheAB
         2ctWLZI/5J/XFCfY4gatgbxhgu/HTavvq+D64l9astBZWLiaad9LSTf/7uhMp6kdJIut
         kvX+9uR7HsTPRik5/sq8zGZAkD+T+J8JXfXCNObWcndz1SeAAUk5LkKsWQEAQWwcJE49
         7eAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929097; x=1791533897;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A4IQ1/kTTHFgKJOYmQmnoUv9o1yUv01ASaulT28gTBs=;
        b=pC6S1W+IltiI6jyXGWHnooi6K2XLi0hRbV5R1cHQitNIxjIB4MF+nrB9obaG35BN+L
         bxxcg5hAWCOm109hzt5Fa+g8Y5t94DLIaYKMQkPgPunY091ulqPB2UW9RgCdcfoVF6VC
         jm/ccnHME0jn0+jmOyAY5mtO+h/I/xR/3HznxbKjgvOyXeeUE7EqGYqIdXY+oGeqohQ+
         FuEMLM9r6aJWDnh2vMKNuIZYSSkBWsV2RFpHrzerQTIGwaUXaTaKyo+WaixXDYT7ztRf
         Iu9lXzMcwu10+i0qm+KAUlOfFm+VYQmFLeTi/CbBSIIdmyQDcCUD+KYEHMDOJ0XZ/ovb
         uHaw==
X-Forwarded-Encrypted: i=1; AKwUvBxMfdsHOyYrgfCpPq7//0Ewrr60K8BDTvpunnTqxiM8Hrnnd7YHJsuXKWm5IiUuM2Zihc9QVcatMJtl0vI=@vger.kernel.org
X-Gm-Message-State: AFuF++l2CdltdjTJcA2hte+6MzDpalqxFidnBs1BoZDnHEcv+pdh0QDH
	Xari8BKEBhehTKi7ooXWO1GtZHmFtQMbrwqL/vRYVW0p+QHJb2MbHj9UZ/VTJBPrPSpHg8KMFzN
	cm4O5kBXxPjUpjP/dxZrPXKVJ5FXYArA=
X-Gm-Gg: AYBFou2gs9bSpR3xFeNAAimzkKwlo38GJ4lbyShVZ++7/Di35KgfD8NIvyZphDgKh8J
	1bTLogih9OHBBJfGijAEkHnAay49OgLyoQzXnnaKy707wpOCezUZkmNPvVb42tT20JfET4kabPM
	Ls2lGQVuTvbP2zAI1y3F7PcDjQUqG77jaV8mhVXqC37IYyL/8hJrmdurFcM2pldjU0jRN0rtHJM
	PhGzuwFj8QsyQDv148Jt6vnspwHUNauxzc/K1SbN7/fL4C6H3FdrdFcwOkWl/0tGRyt7dsZtvKz
	M+kBQLoGfEXB6mj4or9lp6OHdFXfZ+4vtnFncTDUz2znflsPcqq/dRIwDdkRUz/+LHTBxkDypGI
	ZhCFKdoefHKWH/X3+jwRTUfpAP7edWr7r
X-Received: by 2002:a05:6820:5719:10b0:6d7:97cf:dba5 with SMTP id
 006d021491bc7-6df3428cfa0mr1169209eaf.37.1790929096883; Fri, 02 Oct 2026
 01:18:16 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:16 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:18:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:18:16 -0700
X-Gm-Features: AclHuK84cUtRH4JRxtuSY_ddwBbCFvBy-HgK4ZJTbtS9qQzzgWUbme_DYYS7jnE
Message-ID: <CAO7O_xgRZryqJjnGGj9xv4Bd6-cLPTs0W_yyt5ZHNufeQLv_GA@mail.gmail.com>
Subject: [PATCH v8 10/15] media: atomisp: derive CSI-2 timing from sensor link frequency
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ISP2401 CSI-2 receiver timing depends on the sensor link frequency.
Query it through v4l2_get_link_freq() instead of reading a 32-bit
control value directly.

Keep the frequency as s64 throughout the calculation so valid link
frequencies do not require an arbitrary S32_MAX limit. Fall back to the
existing default timings when the frequency query fails.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2.c  | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
index 71df4ef629c2..cbdeac32f6f3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2010 Intel Corporation. All Rights Reserved.
  */

+#include <media/v4l2-common.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mediabus.h>
 #include "atomisp_cmd.h"
@@ -210,7 +211,7 @@ int atomisp_mipi_csi2_register_entities(struct
atomisp_mipi_csi2_device *csi2,
 static const int LIMIT_SHIFT = 6;	/* Limit numeric range into 31 bits */

 static int
-atomisp_csi2_configure_calc(const short int coeffs[2], int mipi_freq, int def)
+atomisp_csi2_configure_calc(const short int coeffs[2], s64 mipi_freq, int def)
 {
 	/* Delay counter accuracy, 1/0.0625 for ANN/CHT, 1/0.125 for BXT */
 	static const int accinv = 16;		/* 1 / COUNT_ACC */
@@ -289,18 +290,18 @@ static void
atomisp_csi2_configure_isp2401(struct atomisp_sub_device *asd)
 	int dat_termen;
 	int dat_settle;

-	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-	int mipi_freq = 0;
 	enum atomisp_camera_port port;
+	struct v4l2_subdev *sensor;
+	s64 mipi_freq;
 	int n;

 	port = isp->inputs[asd->input_curr].port;

-	ctrl.id = V4L2_CID_LINK_FREQ;
-	if (v4l2_g_ctrl
-	    (isp->inputs[asd->input_curr].sensor->ctrl_handler, &ctrl) == 0)
-		mipi_freq = ctrl.value;
+	sensor = isp->inputs[asd->input_curr].sensor;
+	mipi_freq = v4l2_get_link_freq(&sensor->entity.pads[0], 0, 0);
+	if (mipi_freq < 0)
+		mipi_freq = 0;

 	clk_termen = atomisp_csi2_configure_calc(coeff_clk_termen, mipi_freq,
 						 TERMEN_DEFAULT);
@@ -311,6 +312,11 @@ static void atomisp_csi2_configure_isp2401(struct
atomisp_sub_device *asd)
 	dat_settle = atomisp_csi2_configure_calc(coeff_dat_settle, mipi_freq,
 						 SETTLE_DEFAULT);

+	dev_dbg(isp->dev,
+		"CSI port %u link frequency %lld Hz, clk timing %d/%d, data timing %d/%d\n",
+		port, mipi_freq, clk_termen, clk_settle,
+		dat_termen, dat_settle);
+
 	for (n = 0; n < csi2_port_lanes[port] + 1; n++) {
 		hrt_address base = csi2_port_base[port] + csi2_lane_base[n];

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
