Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C014426EB7;
	Fri, 16 Oct 2026 07:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.183.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137595; cv=none; b=rjakalx5WiKgnj0FL3IVEPpSfl0wW4tLRP2/fAuC3k+bE+VKRFcT0kxuX+hctNa9r2oJyeCX8oBSv0K7AwGvBMznLvc2haJO9CHMrtbClhNT9cGSyedeWkqBgEJG9xabxgHHB3hPieMBkUYCG/nkS+c7ePPpDeNa3qbDqR1NXio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137595; c=relaxed/simple;
	bh=yqC0nuU5G3gZIraKqaUfZ98fsiMiDWsX9/sai81SUic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T4tePFlCswo/MvjoUybZWnRGVOp6+ovITcvf3Z1un0/rj+H7hOxYhPMuermTY7DDscgs99RAp+YSzFKCOhdffeKS2bOib+mnM2wp3PugPhLJCMb8ThmlXCZlkklyPhdrXbQ+n8P+0dR698xlEricl2xyYqfb5iGlB5rB9XU2sYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=WUomkK6P; arc=none smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="WUomkK6P"
Received: from pps.filterd (m0209327.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G7YkHO3156091;
	Fri, 16 Oct 2026 07:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=p1; bh=hVyusgmqw8+Uyo1IbUosqRXAAP3uVv5KpKsUxoF+m3
	k=; b=WUomkK6PnE6VUAbMbhYiSNkkMKSAl8FMCecFaAiGuiM/Av2/NcIuAZxuYM
	gtUuOtZHFxN+KorZHoZ5q4yJUsbnx4h/xzk8Pq2GpX/jqGxwtKI/Vefuz2+t773v
	EAr6t4+24/QEQ+eEiQuqEDkuxf36z+7L1ZTAdjz+QDfBT212zQ1GbhTzF7Svegwj
	1IQPL/XO+nwr4PSlaw3Vtniy6r4oTDjkYFZgDnA3iunQmaESEFDc563PuwZ2D/V8
	uEn4fKLdGJLv+4MF+C45OybWIzNy5bod8Uhvswv+nG4KHVZk2yjHG1Uda+SVVNtz
	RtVesOAnYsYN6ITPA0e+lQ9OA7ZA==
Received: from sgppsea02v.sg.gdce.sony.com.sg ([121.100.43.226])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4h7da87eh0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 16 Oct 2026 07:59:41 +0000 (GMT)
Received: from pps.filterd (SGPPSEA02v.sg.gdce.sony.com.sg [127.0.0.1])
	by SGPPSEA02v.sg.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69G7fol81453289;
	Fri, 16 Oct 2026 07:59:39 GMT
Received: from sgppsba02v.s.gdce.sony.com.sg ([146.215.113.219])
	by SGPPSEA02v.sg.gdce.sony.com.sg (PPS) with ESMTPS id 4h7eejcc0f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Oct 2026 07:59:39 +0000 (GMT)
Received: from pps.filterd (SGPPSBA02v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA02v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69G7U5Ke2896468;
	Fri, 16 Oct 2026 07:59:39 GMT
Received: from localhost.localdomain ([146.215.113.251])
	by SGPPSBA02v.s.gdce.sony.com.sg (PPS) with ESMTP id 4h7eejxknj-1;
	Fri, 16 Oct 2026 07:59:39 +0000 (GMT)
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
Subject: [PATCH v4 0/2] Add bindings and driver for Sony IMX908
Date: Fri, 16 Oct 2026 16:59:16 +0900
Message-ID: <20261016075918.19345-1-lachlan.michael@sony.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: MLPSw_A4Fd_7vOtYFmZt8slkmfZ2FZWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Sony-EdgeRelay-GUID: WaUQ-90Tk2XrdlVXbchhwtqCKv3_YzxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Authority-Analysis: v=2.4 cv=AeUkjHXG c=1 sm=1 tr=0 ts=6ad1d96d cx=c_pps
 a=6mgWUpd4vGE96FGw1JXD8A==:117 a=6mgWUpd4vGE96FGw1JXD8A==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22
 a=b20fedWF67CaGdYoUt4Y:22 a=VwQbUJbxAAAA:8 a=z6gsHLkEAAAA:8
 a=S-K4s3RCtQN59Zfzh3IA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXwAny2qzqlYM7
 ktzvxjl/roYTPpSFPRiyUXvYBI3bGNNEsq25uIgPi6gaIhd8L2dgbvhUgXmwEHb1fPugWC502Me
 W8sC3q90ET63yl+oqNz01Zog/JQwxVW827JpcacHpqijvaEC8vXGaMaHVh/8iVSkEVvamygmRf6
 94yq2LQDTdb6OB9rihCA9fCZhiKS+3VIJShHUctPqcZTUY7ETJ9LU+0A91fcUMt167V91BBl+n+
 7PKzUZvkQF14hBTVpuHaqDmxlG5PnOD3TS6StOP+ToWy690VVqgSOJ3wZyDBN8Jr9Wa1vV1QtS6
 gbd84H5sd3Tvf6o8MfPVSPYfWgFXGyHpO6HGIAoiyJk27LSNVsDrLhsvi3jo6VUbfE++pMOCfrb
 iyeLPI8pQxsPU6rHbGwv8Mh6zdkXaqUGz6N4fI7Vih2dDUn2rXA15RNAtvVnqF3bhHHFM8henMI
 qfrIzb11LqRPUsSVT1Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX2uAdTe/wjTuu
 0Yi/BIbsqzSxOkITTcQwPqPFdbASrpWzmN66N5Z1VjWggf5+0Wbh6V29bFAeZMyi0JEtvuQqZhF
 UXhFmGJgzYS6A2+VofjlD4iUf2eVXJ7Sj3poKPM0dlxYOhm3YoXh
X-Proofpoint-GUID: y7WR89AqUTqMGUUVIHgZahFQZ6-ctSI2
X-Proofpoint-ORIG-GUID: y7WR89AqUTqMGUUVIHgZahFQZ6-ctSI2
X-Sony-Outbound-GUID: y7WR89AqUTqMGUUVIHgZahFQZ6-ctSI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01

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
 MAINTAINERS                                   |    5 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx908.c                    | 1168 +++++++++++++++++
 5 files changed, 1293 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
 create mode 100644 drivers/media/i2c/imx908.c

-- 
2.47.3

