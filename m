Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743111F418F;
	Mon, 19 Oct 2026 01:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.183.30.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374483; cv=none; b=bv7OkGUfB3hvLflxqqNrRN78Of6r6b7s0OJrhkswv/tULS3HWZtwJgYouAaMDaReld2CyI15BHQvCqW82ouva2H8UvsO2mU9og4b3XqDw+M/tbYP872cTuWkiXfz/1qPdodM/7VCT978M1NgKOjFoAOnStne6e5d9vhXiTVsTJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374483; c=relaxed/simple;
	bh=DL+RRbxvlaQnLF/GJIgcYvuTl3ZVP3juqw9UJwtTeVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ieq/9O4RGbiUMDfmXqJX5pQkdWYwDSnWoRzj4DF80BNJqpoqsJ74Rd9QftWQmZoGxR4K+Dp4EaukDBHzw29rDTS2FkQGwC9skx7HYvgOz0uXqdFab9egNcpT6jC6pQ2qQqvk23ZAoM/9MzIPxWyUMAGpMosG9diT3g2l2WrmqKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=iH/3jswb; arc=none smtp.client-ip=185.183.30.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="iH/3jswb"
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1IhF01372285;
	Mon, 19 Oct 2026 01:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=p1; bh=vznjTp89xtWE+n8juShSFf7wtdWHODzrTuJjFEyw4R
	U=; b=iH/3jswbXcM1YgXXI4sBKmi0EC0BLeKA5IIk2TDMDW3EnVm+/0Bk/cW4BE
	G6Osme16lR7jDO6jfZ6+Zkri2V/x1cBRFbk4p3snmBas42RAQKMZgsYf06BERr9D
	OFcJd7x8DtYPDCh5EBuNNsJDY8+Q9aE4ovwKP5aIDq+wboxarukctdf6qEQ5dNRM
	QYXyRFYKq/FSc48mQSP2mrHrMhDu57ajF4sXVFuPKpF9CO+nikIBm+PxThBDnq+L
	j0b7djMBpevZ2MTfqw6dybS7ni7E4Y2wBsFi5tlrjNTvnXBmBXtUugmyzm3aoqB5
	rokFAy00H5K3T3+iNO7jgDZVjD0Q==
Received: from usculxsnt01v.am.sony.com (usculxsnt01v.am.sony.com [160.33.194.232])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4hbyt3smg2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 19 Oct 2026 01:47:36 +0000 (GMT)
Received: from pps.filterd (USCULXSNT01v.am.sony.com [127.0.0.1])
	by USCULXSNT01v.am.sony.com (8.18.1.11/8.18.1.11) with ESMTP id 69J1N2Kq745330;
	Mon, 19 Oct 2026 01:47:35 GMT
Received: from sgppsba03v.s.gdce.sony.com.sg ([146.215.113.220])
	by USCULXSNT01v.am.sony.com (PPS) with ESMTPS id 4hc4qjs1ma-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 01:47:35 +0000 (GMT)
Received: from pps.filterd (SGPPSBA03v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA03v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69J1IQjB3714774;
	Mon, 19 Oct 2026 01:47:33 GMT
Received: from localhost.localdomain ([146.215.113.251])
	by SGPPSBA03v.s.gdce.sony.com.sg (PPS) with ESMTP id 4hc4e862c7-1;
	Mon, 19 Oct 2026 01:47:32 +0000 (GMT)
From: Lachlan Michael <lachlan.michael@sony.com>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
        Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird2@sony.com,
        Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com,
        linux-kernel@vger.kernel.org,
        Lachlan Michael <lachlan.michael@sony.com>
Subject: [PATCH v5 0/2] Add bindings and driver for Sony IMX908
Date: Mon, 19 Oct 2026 10:47:18 +0900
Message-ID: <20261019014720.2635-1-lachlan.michael@sony.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: wYE7F9rZxDOl6X9n51ZfxL7Fk_QvNI1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Sony-EdgeRelay-GUID: DL1kPAzRttP4P9oq1zMPLAtqSxkV3ps-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-GUID: eVrtW8mZK622DrnRBCrwHg9IUswK6CG9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAwNiBTYWx0ZWRfXzymEN0jV9lVZ
 AoqYjBYO6ybWMpi+DjYpHf8/MbPI8wgEyCGApLEMUhtD2TVdbNPVLg1fRQpcmPXM+6v7hoPTvrA
 3IcT/EiyX2lth55WRNKHz8iX0HuTWAB5Zp5RzPSajxYQVyVZUFDC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAwNiBTYWx0ZWRfX8GPn4rMWSwaW
 IZNbwVGSXMFjXUMVCrfPKpLFoetgmyGtMl46E6Nt1gsW3HjDmEzDEZN6SJmnBVF1XsbQrXoePjs
 f8ThSWZqJc/ZrxBZoz+nLTF8OOT5u3nZQTExk0oEkmWsAIf6PcolukIpLgrPVdm1uNjDtbMkhZc
 3sV0NvT8kfn/Up8PwfLxmmOLzHMyozwfjJZ7qkcN+ai7vSnoHOWMJP7Tt/oKlFCoMvV7JgMCXG6
 2RFyv1693hCaD0v6vtXGPJJsmGfgTFwhP8q226+mII4sPjVcKNzX/4+Vdc0rrah5dnn9Y0vMVPv
 blAPStu2bkNYhIcerU52eA1Aprh75JRMbOGYndeyrRzbigbVQJizd156Sc33nUfAqnvcInP65Q9
 D7qar/tBCzp7Of24kVu7Z5XlOKwtUmbU14oK1AoxV/f50bjuEdETUJRc8xSs4S5R/Ut19ix9R+e
 SRxLA2ilDkkXOVj6PRw==
X-Proofpoint-ORIG-GUID: eVrtW8mZK622DrnRBCrwHg9IUswK6CG9
X-Authority-Analysis: v=2.4 cv=ZPNCCn7b c=1 sm=1 tr=0 ts=6ad576b8 cx=c_pps
 a=+By/qi0JbgTNrI/GZhIcbg==:117 a=+By/qi0JbgTNrI/GZhIcbg==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22
 a=cIyGuqrkuvkXWOl_fzuj:22 a=VwQbUJbxAAAA:8 a=z6gsHLkEAAAA:8
 a=c5J9Qkk1vctEdVfC9ssA:9
X-Sony-Outbound-GUID: eVrtW8mZK622DrnRBCrwHg9IUswK6CG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_01,2026-10-14_01,2025-10-01_01

This series adds device tree bindings and a V4L2 sub-device driver for
the Sony IMX908 image sensor.

The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
output interface. The driver supports RAW10 and RAW12 output formats,
exposure and analogue gain controls, image flipping, blanking controls
and test pattern generation.

HDR modes and RAW16 output are not currently supported.

The driver has been tested with libcamera on Raspberry Pi 5 based
hardware.

Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
---
Changes in v5:
PATCH 1:
- Add Reviewed-by and Acked-by tags omitted in v4.

PATCH 2:
- Add the IMX908 driver file to the MAINTAINERS entry (left out in v4)

Link to v4: https://lore.kernel.org/all/20261016075918.19345-1-lachlan.michael@sony.com/

Changes in v4:
PATCH 1:
- No changes from v3

PATCH 2:
- Refined sensor initialization for the updated settings, including
  register-address/value corrections and bit-depth-specific programming
- Removed crop support; the driver now reports the fixed 3856x2176
  active-area format and no longer programs crop registers.
- Updated HBLANK and exposure control limits for fixed geometry,
  including exposure adjustment when VBLANK changes.
- Improved stream start/stop error handling and ensured failures during
  setup release the runtime-PM reference.
- Consolidated power-on/off into runtime-PM callbacks, corrected probe/
  remove power sequencing, and added builds without CONFIG_PM.
- Cleanups and bugfixes from the v3 review comments (thanks to Sakari
  and Laurent).

Link to v3: https://lore.kernel.org/all/20260828064843.65047-1-lachlan.michael@sony.com/

Changes in v3:
PATCH 1:
-  Adjust the binding description to match the actual hardware: the I2C
   target address is selected by the SLAMODE pins, not fixed to 0x1A.
-  Add the standard video-interface schema reference so the endpoint and
   remote-endpoint validation match the media DT conventions.

PATCH 2:
- Correct link-frequency indexing mapping to match the sensor
  DATARATE_SEL values and the frequency ordering
- Changed the pixel_rate to 16-pixel-per-clocks based on datasheet
  mode values
- Clean up the constant names, register definitions and comments in
  response to review feedback.
- Remove various (uneeded) checks in code based on feedback
- Remove cached vmax/hmax and recalculated where necessary
- Drop pixel_rate and test_pattern pointers from struct
- Remove read-only controls set_ctrl switch
- Remove event handlers
- Remove uneeded delays at startup 
- Simplify runtime_resume/suspend functions
- Remove the 4k recording-area in favour of larger active area
- Use the same constraints for VMAX for crop and all pixel mode to
  simplify the driver logic by removing branching
- Rework HMAX based on the fact that the whole line is always read
  even in crop mode. HMAX varies in all modes now, but not with 
  horizontal crop.
- Minor edits and bugfixes 

Link to v2: https://lore.kernel.org/r/20260806070934.21764-1-lachlan.michael@sony.com/

Changes in v2:
PATCH 1:
- Reword subject to drop the redundant "bindings" suffix.
- Reference video-interfaces.yaml for the endpoint and switch to
  unevaluatedProperties, fixing the remote-endpoint check.
- Drop "link-frequencies: true".
- MAINTAINERS: drop the L: line.
- MAINTAINERS: move the driver F: line to patch 2.

PATCH 2:
- Treat the pixel rate as a fixed sensor property (594 MHz, 8 px/clock),
  read-only.
- Compute HMAX from both the array and MIPI link floors.
- Express HBLANK in pixels with a step of 8; keep HMAX fixed in crop
  mode.
- Drop struct imx908_mode; cache hmax/vmax directly.
- Change the link-frequency table to s64.
- Fix the probe error-unwind ordering.
- Be silent on success (chip ID print is now dev_dbg).
- Drop redundant comments.
- Kconfig: fix a "module will be called" typo.

Link to v1: https://lore.kernel.org/r/20260730021525.166811-1-lachlan.michael@sony.com


Lachlan Michael (2):
  media: dt-bindings: imx908: Add Sony IMX908 sensor
  media: i2c: Add Sony IMX908 image sensor driver

 .../bindings/media/i2c/sony,imx908.yaml       |  108 ++
 MAINTAINERS                                   |    6 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx908.c                    | 1168 +++++++++++++++++
 5 files changed, 1294 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
 create mode 100644 drivers/media/i2c/imx908.c

-- 
2.47.3

