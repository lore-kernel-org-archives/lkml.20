Received: from mx07-001d1705.pphosted.com (mx07-001d1705.pphosted.com [185.132.183.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B823D091A;
	Fri, 28 Aug 2026 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.183.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787899765; cv=none; b=cADi+1HJYu9S+4j71ywQJOYexH5oe5hVjlC/dLQFFP2rQugWt//+aK8HohI+RepbsZ93fzadx9C6XoSBD44b3j5fFoqrKu7N3ir+sNGLagfBGU7sU3DpEye0mCLhdEr/Bu4rgbpP/lLXDo5LPbvYVtyNGPqlrjiZ+egPLrAJCpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787899765; c=relaxed/simple;
	bh=AfzNrjZNXaS03XpUg5u1BNBiMSo5HU62ts88+NZV17U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UEXa1Ti4WoEP++N7NTdOXRQNnxVGDCoj10SCw5eLdo1rQoyhXqECCbTz3zoPZ8149Mzq4E48ZjshnZDDGCar/qJfKnCHvQ0jFNIf/mlkbRN34iFqziQTYbcmTfVkILFft+0ARcwYy8RR/1cN8HSgpUqd0z3v7aLXRKbj3onAKQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=PRG1zl14; arc=none smtp.client-ip=185.132.183.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="PRG1zl14"
Received: from pps.filterd (m0209329.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66l5Y1794040;
	Fri, 28 Aug 2026 06:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=p1; bh=ctqwZs+DjyXTsAc59QIiOHkITK6ZzPrJsaI7cc76vM
	A=; b=PRG1zl14pBy+R9MDLfykfNwLKJoe62+L2pxrV4Ygo0Y5ttf+h+ZiARCbEt
	odoNNITnr/ET9BrkRVvIZWr073OAOVCmewodIDHzQ3Lln1pRHaybppJZDqSvVRCH
	yTuDBk/I0fUEGDR935LvZ1wXBZ4u5WbBMHd0wnXRRW9koL+M1wPHu+v7tNQUwBi6
	VYYgazK7vrW2PxOxn+5t8WBbnF/aIabbFbLtESjFWVCmACRlu4CBl3JShMJwbOq1
	4V7rLFF+lGE2hKiUSjO9CGNoFZV2EWFx1ZQNOV2lK4HzuASDZBc/XqAtCyamxfiv
	I9FKBwDMVE35b/GVlgvTOJRQ22Ow==
Received: from sgppsem01v.sg.gdce.sony.com.sg ([121.100.43.221])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4g72dy7fh0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 28 Aug 2026 06:49:01 +0000 (GMT)
Received: from pps.filterd (SGPPSEM01v.sg.gdce.sony.com.sg [127.0.0.1])
	by SGPPSEM01v.sg.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 67S65poi959602;
	Fri, 28 Aug 2026 06:48:59 GMT
Received: from sgppsba03v.s.gdce.sony.com.sg ([146.215.113.220])
	by SGPPSEM01v.sg.gdce.sony.com.sg (PPS) with ESMTPS id 4g9jrhu204-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 06:48:59 +0000 (GMT)
Received: from pps.filterd (SGPPSBA03v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBA03v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 67S661uf3766270;
	Fri, 28 Aug 2026 06:48:59 GMT
Received: from localhost.localdomain ([146.215.113.251])
	by SGPPSBA03v.s.gdce.sony.com.sg (PPS) with ESMTP id 4g7amfpntm-1;
	Fri, 28 Aug 2026 06:48:58 +0000 (GMT)
From: Lachlan Michael <lachlan.michael@sony.com>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil+cisco@kernel.org, laurent.pinchart@ideasonboard.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        kieran.bingham@ideasonboard.com, jai.luthra@ideasonboard.com,
        Ryuichi.Tadano@sony.com, Kengo.Hayasaka@sony.com, Tim.Bird@sony.com,
        Kazumi.A.Sato@sony.com, Yuji.John.Takahashi@sony.com,
        linux-kernel@vger.kernel.org,
        Lachlan Michael <lachlan.michael@sony.com>
Subject: [PATCH v3 0/2] Add bindings and driver for Sony IMX908
Date: Fri, 28 Aug 2026 15:48:41 +0900
Message-ID: <20260828064843.65047-1-lachlan.michael@sony.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: FHqI1NjQiCWpIy5D4tUss16OCTN26VVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Sony-EdgeRelay-GUID: 8GSZy33ouLCFMU_RsSmkfhUN8jSzFWcp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA1NiBTYWx0ZWRfXzt8ElVc/6PBL
 YK6YWoC4SY1s1eSDwmOFmzElhAzV9aHglh1Glyuz/oFsbM94XdclWarYC+YErjjr/BHqKet6xis
 rA7ceOnGaLd5TQo5hS8Ko28ygAquTIop60NybPdgt1VVhk/92gtNy4DjJjRV+2Gude686cJ1xI3
 F0SA9h9EuAoqrxpVNeMEoN4O85Oqnd8yMEkY+QkPiCt2Zjyn4dtsTf7M10mGZEz5ycMylTND3TT
 PCxf50iOdzRrbS3THs+x2lKJCMos+Wf1jXr6U3fE47lvVSbQ+Z+b6VkFU/8gTJGwiOh6B29v0SB
 xjvCDbAV2Lkij5UJ5galB8w+hbglWHtXLLZcOQ9PDMRXCr/ihUugxUNKOBPRCeMvA2GcErbb8Sn
 ZGU9W0dnHNr9O3PPSh+2u2KxtZNLHarO4KVqklqKTEGVh/vggu9Nwp/sgee+lK/ezdzJKmnkmtz
 rGoz1OH1VNiOXqZG55w==
X-Proofpoint-GUID: bwMAYTm45PaferXfF77XmZVzugn9mWXW
X-Proofpoint-ORIG-GUID: bwMAYTm45PaferXfF77XmZVzugn9mWXW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA1NiBTYWx0ZWRfX/7ViKdQN835y
 j2EApIHKhJ9xnA8ZwW6TyjcCK8NDM7d60wDMzuLZwAmtHoHZ3+sR21PCP0XjG+Mv+lNkb1mJ5YE
 a/v6iY6vr6DmhFVZv/SSu957v9WjzNtY/wznQAvWb6LqMJ0Vz+9b
X-Authority-Analysis: v=2.4 cv=S9fpBosP c=1 sm=1 tr=0 ts=6a912f5d cx=c_pps
 a=5iEaAFJ3UIynSlflvg1n/g==:117 a=5iEaAFJ3UIynSlflvg1n/g==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22
 a=pQehfwC0D4oxWvs5GOjV:22 a=VwQbUJbxAAAA:8 a=z6gsHLkEAAAA:8
 a=6QaAi6oYJ9h2ZkgG6q4A:9
X-Sony-Outbound-GUID: bwMAYTm45PaferXfF77XmZVzugn9mWXW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01

This series adds device tree bindings and a V4L2 sub-device driver for
the Sony IMX908 image sensor.

The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
output interface. The driver supports RAW10 and RAW12 output formats,
exposure and analogue gain controls, image flipping, blanking controls,
window cropping and test pattern generation.

HDR modes and RAW16 output are not currently supported.

The driver has been tested with libcamera on Raspberry Pi 5 based
hardware.

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
 drivers/media/i2c/imx908.c                    | 1367 +++++++++++++++++
 5 files changed, 1493 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
 create mode 100644 drivers/media/i2c/imx908.c

-- 
2.47.3

