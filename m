Received: from mail-oi2-f41.google.com (mail-oi2-f41.google.com [74.125.231.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5423D415F32
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929043; cv=pass; b=j+dthyo4oZJxCJNEriIZlg9L0q5QphG/cT0BJg3COgf3rytX2cYYFrCPz3A9XUBaJHvrnwEQeUpvkxkw07tOTYS+qmzR79NKzg8EKjExM27xNz0apzavlPL6KTDz/Osb1KatCdCJKd5+farH8T87hTcYCeq/tOW2cRD+Y/YWIwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929043; c=relaxed/simple;
	bh=V9mlkn6rFZgJWc3sdMpgHtW1gw94RUIGRN5GFmumsAw=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UMtxDGiIfUEbN2W8ShS1FUaoMMvSIeqiPJjbfZ/JEEzmgMAD6Yg9QDjOQOhG7vXi910XE3cjMjOwWN1Do/hy9Ia/677hq00PjtL1S0PlXGoqmKTNP7EVR5YTF5VDKKGL4WJ4GgRp5sxmbNVXF16DdOL/p/nHUNT7q7c++H4QqWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXGsLsmY; arc=pass smtp.client-ip=74.125.231.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXGsLsmY"
Received: by mail-oi2-f41.google.com with SMTP id 5614622812f47-4f252fb8c7aso1023849b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929039; cv=none;
        d=google.com; s=arc-20260327;
        b=ZPwRCiBcQXeSAde3BE1eQPwfP21/+CvDVZX0BmNo7EQE5M4WZcjs3EJVUnU4Agy5it
         OnPBoDqYTvvyVnvyXv22Kz/hHAJoaay0FF+falWMrjt1ZYfad2pWH2V0EDqKR5l+sNx2
         4O0vNF6Ziv4yVSgR60MDCg8rZIwRiU+yT8Dz4Cn/Kt35/9ni2/kEcj8odMfFQxSishNT
         oeoOKU0oQR4XPOzDeRzg+8HAuz0Ti/+IWpGlamMF+vZLn+DOlw96/pyMFJkp4qPD74XJ
         cWOm+XnhTL7Uyc0fDGaJzR0aD8p4DVrEl4uYurDjQBfGo5ie2UdTWCPnAd667jWB+QrQ
         X6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=pcFDa9I883BpJ1qewU49epkbu/O1gg/G2fJgTy7QgDE=;
        fh=WEW1K6NDO+KOfafPkYnpBnRxXWJe4wS+ds3J0mjYTpQ=;
        b=QHi4jK3lQsf3Ro7iOWkqLQTwFA2DcHzzYmcKupZd3zSpP/dKC+0h6gajdh4FJC4SB6
         uBVw8BvdWJ/uuZImtf9mE/mJT1cAc81tvvmKGl+I+TvVJg6EYtRJN1aEew5x7IIvcQ0U
         BgVVDPs81hcaItwpKioRyyUcLruAO+RJoZld0g39sBtye78a8LfNDoC05GiMmSgfDITn
         ixIT6GueWzI4gGdn9b0qbBheSJNkeRM69s/Tfpv/VWit4etojEL6stXsPS9uxctDNXsM
         0ZJlOPdvJJ+DKhbeyiTzi1VtmNusHlthmAngpBIdnTlgU8lta+i9Zq6yrgZLpPIL8r6F
         otYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929039; x=1791533839; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcFDa9I883BpJ1qewU49epkbu/O1gg/G2fJgTy7QgDE=;
        b=LXGsLsmYYsrfekQ0X4iQOaUHtGqQBpzEDR3uSaL+g1u0M1RDbUWwDwIu+0d/0pYcj5
         AW197aMDh9NYoKk1CxR9VjFpqf5lfWhqo0a+2YIrwIMSqr6jCy1RHW7pRbXiILcKAfpg
         JWnk2WuhV6Xd7862NOSMvy4T/4acJ2UezzElx/CKWbMq0Mmp3H7Kg6IMsmtUvckA58Ac
         y6jMxoC/bbIN2oORn4kRovynJg4EBZ7p2GXhkU3FU5U0t+PNxEbsxwzPcvxQlbg0xenn
         yqG6mJFeELozBQc1PnRR+t/fErjpjhU3uB717Oz87+C8S+ouVz75EYYLwIc5BIya3PRH
         oHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929039; x=1791533839;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcFDa9I883BpJ1qewU49epkbu/O1gg/G2fJgTy7QgDE=;
        b=RXuBiEjmTV0XiLAD9/Z36iqzOlJafBE0KSP5Xrqu62BUDgWT0g4Xq/lFaMsl43UziD
         aIocqWliBFkpjo9pHcGlrG+qn5r2IRKyExyTkf/JQ3gAd4J2F2ie3P/W268w1vWj3mQP
         L37QKbNesfR9hb1sasYghtADmrCGOaR/0RrrVXGeu4afEFUvpojNUxHbVPkFbviix/pr
         +kip0A3bRpSFacAND/Pq0OeH3eGo/W3jGkA/BmmNsLgkKNlc0zDoqWcuNf0wq1ZA+etv
         I4byxOrn7BWdkva6pFHnCq+89MmE3VyxHDtTr5GVUB8BR7pL5PXtUSjgy5bKKBecaoNY
         8lcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPWcVaZghrK7eSZKjlKZ59+LfGa+af/gnLUHHEdnIhyLIZZX20qlEBOvqY4tv/JmrO0A0+gNAWLlQXYkI=@vger.kernel.org
X-Gm-Message-State: AFuF++l5U3ll0t2I2VWzjUKg3wijiPNOT7UcU0Nky36q7+4Ecisj9kOn
	pHCqWKxY4NyU0qeSfcI3k/BDoEZJ4HjYavivVVblPuf3cn7jCE9kAO7cb9PhXiO9UWlHfFcsMb2
	xYToPSlb/ocf5Wz4NxgYj34BBYLuUxbo=
X-Gm-Gg: AYBFou0RS0Jm1tbZ8rlALOgAqk/y93I7CDHo76MkvA3fcpN32nDxe5aD/WHBQdxQkq1
	ikriHs1tTOCW+x17RdXFTcM6NiLNP5fop4iUJaQdteTcPCCAY6Mx9rtgxiA3QiiJX4BnufMBotb
	+yZf7vQL6m2Yw+AIyqinqu7vybs9UvFj0VFQ1QvbjZnJxPIicc3l+AjDhoxFQYvzz5lU115E1DJ
	GVV520QRcDpXlxuHZHtjeJqr656aWJwGYaDwoB2fZUWPKsFNIMaH+oD0/G3DFXuXo/3RnkO5xNq
	XQkoS4NPFJVPvlRN1xXEtkVmICk+xolLamUezBAhNRb/zp9Oa3MvXnhH4Qw/vbt6WqiV2ivvAad
	ggM5OHr1Rokz2imC/nuofHqpeRqEM7bnbi8hQAAZp8gA=
X-Received: by 2002:a05:6808:6408:b0:4d5:295c:a82f with SMTP id
 5614622812f47-4f52bacb381mr1370022b6e.60.1790929039252; Fri, 02 Oct 2026
 01:17:19 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:18 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 2 Oct 2026 01:17:18 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mauriziocasciano7@gmail.com
In-Reply-To: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
References: <CAO7O_xi61=0kUtYkYFKonaSEJRC_KiXKvgMLSwRbnDTVfmQsPg@mail.gmail.com>
Date: Fri, 2 Oct 2026 01:17:18 -0700
X-Gm-Features: AclHuK8iCzKbWnYiIfO1nOdV2_eMWyLE27DrxpNhzaQNvYCQiT81CDMNKLaOXFA
Message-ID: <CAO7O_xhaMCV+w1qF4hmnFuOBJsed_LnhdRd=x8oxTwLedRVDiw@mail.gmail.com>
Subject: [PATCH v8 04/15] media: ov2740: Add OVTI2740 ACPI ID
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@amd.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nicholas Roth <nicholas@rothemail.net>, 
	Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 64a85735c1b8..830f5857d73f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1463,6 +1463,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops,
ov2740_suspend, ov2740_resume,

 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
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
