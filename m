Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690469;
	b=fgNZ2n6cPwZBB5K/AAmX9yfVk8zwIftAOPBYJkcf1VTtIQQl5jUAegd2yI+K5w2u7Txk
	 ns91qrYqUK9gMc5cLA4GhJRbIPAyV2KDIAdQw1aipNIHlsp4wxkbCAKqEjCNvE6Ejznpi
	 3+MTkUZk9qiiQezIe3u+jNcRa4SXP+GkKrlvb+RDKqhwrAsDGYVhI0ph+1U2nq1uv3Fgj
	 mkvme36ACkVyOAg9OGm6i3UAJQjvchNEghGiyTUbkGK+wdP7WCRhfuhOZdyIrYgIyF85Q
	 hZg1dteydX4dz0r74c2WK84ufrk12wQ7u62HVtce+DHknIWwE+Z+ezfKGZiPr+6NSSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=eNt51ERTHzWJfRV7jcAQw585b0hP8yWgGWiry/cAsUY=;
	b=wqogTRQpbUemi7qkLEPoGHcXfYvi8c3dcPIjVYgXu98qRXdd6jWy+26n5PZOKDhDQaBc
	 u6rw9IRZrVnvwQnIwQwBRbafjHU6/klmibj75TXpfL73fPtyN7EeOR3O5g+6s2H2ixSdA
	 FIbdKfM0pimj9fs2VySWPUdeZVKL+OkRPxaG8p1vfne2Qd3sHfVAz5uwE9/Vl7QgcwNwP
	 EAzeOpgniGH62yjXEkrnRyrGomdcljGan0pYwl/0OiXRenOfi5jHDlMe1BPax30PNscvy
	 3v/CfbN8AeDt/BfzWMsK+2z1p5Idl5SXkMqAeKwDmO6SJuYrdBYrWC39Gjv14wRrT1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=DEdOsYog;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B8F606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B8F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=DEdOsYog
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso666785e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690466; x=1793295266; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eNt51ERTHzWJfRV7jcAQw585b0hP8yWgGWiry/cAsUY=;
        b=DEdOsYogoSDpZiFPBmnQjTLIMW+kGzKuDfo2ee5DCjfyeOeq9RK7N87Vh2WeYC0UpC
         t2isgkbM2bwSioapj58H0MazWDwgb2gfmT2/m5UbcR7pl+osGp+rRPfNh2G3SmI4hTYu
         /jz/hFqCN4Aob2HJA8IQ+juUv0iruOIVY8dzc3Km0iTnvE2gbPR7bC64HomNSK+Q6pwh
         LUCRoUnguxsUNQtmp4Ki2fyapM1dl17LWWabGwQD1ZAkL1mzNM9myUh2NMJ/cl0ba/aU
         RmL0pEZI0WRUUwo4aE07j1m1QL7+xR/M64O4decf5EAsArVsm74tu/mWGQKOysrpUKzs
         QPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690466; x=1793295266;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eNt51ERTHzWJfRV7jcAQw585b0hP8yWgGWiry/cAsUY=;
        b=kVdqNbNBXGhYwlgLi2ySHaLUGCoSY5wGU30tBZfRWu+TjY0ZNLGII3u8WDr6UeE4cG
         oaPzOQ7AePcekTXCl5Ehh4hIgXhtaN0H7eNLqyQgPeUjkUajgSW9AhIXsDoQk7/jvvMi
         S9rR0MLq/z6U/7h2LA3doijcmq1I5SyAFcqsJuT9jIoifv1cN4GnQoK3RN/1HC5r7MTl
         AUCIuVhS99zpjNQ/dwuLXpuk1JR4Wv7LXA8nbVmaULiF3CcesHVL11L24A7yI90p1vx8
         Cn51ib3I70GO2+TRygOhm+FV0XjZPE1571K4p7RDuwp84Ml0gHghYNtaZHfmebgDutuS
         Vpew==
X-Forwarded-Encrypted: i=1; AKwUvBwNrmep+vMebzSXpFM1kCwmMOKwgCsoTu1S837c3ZRv5qGOrqjgPBZnH836F8Pgj+Z7A7aOkEm3d5hTCWA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfNA3GPtFgBJ5TefN3WXYEVbGsZ5axRSNrR8Zb3SSmbCggCWu+
	+fXR7SDF7ilvq8RYOKkwC8x4ADAHgzS1Rao3yqLEgDhBPpVHawwa+1zYuIH24cL7uN8=
X-Gm-Gg: AYBFou0c1c5gC0TUCL3zg3FR1UMniHl5jlAp8Tpc7ldYXwgx3/b4+82JlKj3tO422xi
	4GvpgTIYRaNvR+2sXkftHESPEwGrlkf/bnHWgO3TQJ8Pslb8Jcdu1S7aCdw0MV4wcDXrEs4OsWR
	AyVizuNFGQr/V18BCs1nJn8qsNiBJvFMjaVvxe5zAyHPou4emi6GUs2glFCiRGzHbdzbvXrmS74
	VbEAN3EZBhIJ9mFGdKM0rpzLm9O88twjCrcquqw+pEoA9mmAxxyMMXHG0Q8ZSDC5Zegq7FamDQR
	9bimWr7de2UhxwkNrMwHHJGZfXMHW+ZI3MWWtXyqhfnYMM/QpqKkVjja+e2V3KLAYQ+Th6tfRQ7
	TgxqJSc6HiZwRuPSMxxwDGSEaalqODgF72dUHKX3JAHhZTx/vV0yA5KcmK5Wn/tnrlxiYvnC89t
	cm90956GXe6uFNAWerZBavswWTfdiuFVAfWWooQ0OcH5acunFEAhTOQXAQ3dulTMvoYrN3Fg9f3
	FjkxiwSAILbeKF5gGVbUdq9VWbBBfNdkoxZ/OC8mQsYqU6Y3GSmdmz1N5rfLffcOY+5AmorRWIi
	R2hpVrdOWS9ybOpCk0zLAeA1SOWFUAY=
X-Received: by 2002:a05:600d:8646:10b0:4a2:390:712d with SMTP id 5b1f17b1804b1-4a203907493mr48509035e9.33.1792690466306;
        Thu, 22 Oct 2026 10:34:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:25 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v6 00/18] Update imx678 to act as a common Sony Starvis 2
 driver.
Date: Thu, 22 Oct 2026 18:33:53 +0100
Message-Id: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAFJ2moC/23Py2rDMBAF0F8JWldFjxnJ7qr/UbrQY9xokThIQ
 RCC/71DocVUXg0X5h64T9GoFmri7fQUlXppZb1ycC8nkc7h+kWyZM7CKOPUpEBeKJcg2z1Ufjb
 SYcCYQGH0ILh0Lu2+1seP1zWfj98q/q92LZWcNU0EFAhgea+h3SLV+riV17RexCeD3fwhWmk7I
 IYR67zyxmSDKhwjdo8MI7plJM04WWciZuWOEdgj4xxgxOOScgTt7GKPEdwj84AgI0TLbNGCTzS
 PyLZt316SMSS2AQAA
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.1

The IMX678 (8MPix) driver has already been accepted into the
kernel.

Whilst preparing a patchset for IMX662 (1080p), I observed such
commonality between the two that it seemed sensible to attempt
a common driver rather than submitting a separate IMX662 series
again.

On checking my box of sensors, I found I had an IMX675 (5MPix) as
well, so that has been incorporated. Subsequently I was able to
add IMX585 (8MPix) and IMX832 (1080p).

The Sony datasheets are rather lacking on the limits for HMAX.
They list HMAX (and VMAX) values for nice round framerates at
a number of the supported link frequencies.
These limits have been adopted for IMX662 and IMX832, but for
IMX675 and IMX585 they have been determined empirically by
observing values of HMAX that start to introduce image issues.

Now cleaned up over the RFC V1.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v6:
Addressing Sakari's comments:
- Updated CAMERA SENSOR DRIVERS in MAINTAINERS
- Used tabs instead of spaces in register defines
- Added myself to MODULE_AUTHOR
- Added Raspberry Pi Ltd to Copyright header
- Reworded dtbinding description to avoid needing a paragraph
- Removed unneeded parentheses and assignment to ret in link freq
  patch.
Sashiko:
- pm_runtime accounting error.
- REG_INTERFACE_SEL and the mono ID register have moved for IMX585.
  Now parameterised.
Jai:
- Added IMX676 support. Copied from https://lore.kernel.org/linux-media/20261022105623.4179467-2-jai.luthra@ideasonboard.com/
  with minor fixups due to the above changes.
- Link to v5: https://lore.kernel.org/r/20261019-media-starvis2-v5-0-eef935347ce9@raspberrypi.com

Changes in v5:
Fix Sashiko issues that were present in V3 but it didn't report.
- v4l2_ctrl_new_int_menu failing for LINK_FREQ could avoid
  printing an error.
- Make setting common_regs_written conditional on all cci_write
  calls having succeeded.
- Please note that the checkpatch failure on the first patch is
  a false positive. starvis2_of_match does have the sentinel, but
  it's not shown in this patch as it's being renamed from
  imx678_of_match. I'll report the false positive.
- Link to v4: https://lore.kernel.org/r/20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com

Changes in v4:
- Added Krzysztof's tag
- Made the variant_def structs static (sparse)
- Put the sensor back into standby after identify in case PM is
  disabled (sashiko)
- New patch to enable pm_runtime_autosuspend.
- Not fixed a Sashiko report of potential use-after-free with
  v4l2_subdev_cleanup vs v4l2-ctrl_handler_free. It is a
  pre-existing issue in imx678, and many others are sharing the
  same pattern. There is no immediately obvious solution as the
  active state is sharing the control handler lock, so the
  suggested inversion of operations will use a destroyed mutex.
  https://sashiko.dev/#/message/sashiko-outbox-171674%40kernel.org
- Checkpatch error "missing sentinel in ID array" is a false
  positive, confused by the comment in the middle of the array.
  That comment was pre-existing in imx678.
- Link to v3: https://lore.kernel.org/r/20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com

Changes in v3:
- Sorted compatibles list (Krzysztof)
- Corrected exposure limits for imx585 via parameterization (Jai)
Issues identified by Sashiko-bot
- Fixed the Kconfig for VIDEO_IMX678 still depending on GPIOLIB
- Removed the remnant build rule for imx678.o
- Fixed sending the common registers if CONFIG_PM is disabled.
- Fixed potential NULL deref and lockdep in link freq handling.
- Fixed the duplicated active_area definition for imx585
- Link to v2: https://lore.kernel.org/r/20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com

Changes in v2:
- Switched from an RFC to a patch set.
- Add the dtbinding changes.
- Added IMX832 and IMX585. Tested and fully working on all 5 modules.
- Updated 2 lane handling so that the higher link frequencies achieve
  the maximum frame rates.
- Adds a patch that corrects the minimum exposure time.
- Allow userspace selection of all link frequencies specified via DT
  (makes testing all the link frequency options far easier).
- Link to v1: https://lore.kernel.org/r/20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com

---
Dave Stevenson (17):
      media: imx678: Rework into generic Starvis 2 sensor driver.
      media: sony-starvis2: Reorder link frequencies to remove lookup
      media: sony-starvis2: Always program the sensor in window mode
      media: sony-starvis2: Parameterise the configuration to allow for other models
      media: sony-starvis2: Rework 2 lane support for higher link freqs
      media: sony-starvis2: Allow runtime control of link frequency
      media: sony-starvis2: Correct the exposure range
      media: sony-starvis2: Put module into standby after identify
      media: sony-starvis2: Use pm_runtime_autosuspend
      media: dt-bindings: sony,imx678: Add other Starvis 2 family members
      media: sony-starvis2: Add support for IMX662
      media: sony-starvis2: Add support for IMX675
      media: sony-starvis2: Add support for IMX832
      media: sony-starvis2: Only update bits for window mode
      media: sony-starvis2: Parameterise exposure min and step
      media: sony-starvis2: Parameterise the mono ID register
      media: sony-starvis2: Add support for IMX585

Jai Luthra (1):
      media: sony-starvis2: Add support for IMX676

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |   44 +-
 MAINTAINERS                                        |   15 +-
 drivers/media/i2c/Kconfig                          |   19 +-
 drivers/media/i2c/Makefile                         |    2 +-
 drivers/media/i2c/imx678.c                         | 1447 -----------
 drivers/media/i2c/sony-starvis2.c                  | 2566 ++++++++++++++++++++
 6 files changed, 2626 insertions(+), 1467 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260804-media-starvis2-65a5bc405b74

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

