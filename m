Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.183.30.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250037;
	b=2GZjq0UjBGgZOTJ/o5uAP4D08YRKT31KlcceWmOZXKYRypzpIJoOoZKmzGRyKmJDhPiN
	 dxLeMT64/xcfoDnT3HPaFhTGyKksXIKX8H5DZD5bV68EEobDbP8qYvTi6hrxnnPRABF2W
	 QdcB6/fy34JbJuDMIwTDz/LJP0WC9KluRDoComiNgznblnHYP8GWszboRKmmdkoadxDEu
	 meeuwY+6pC5NgtDMU/zWMCNgaK3+Y5faqatoaqtMl7WMDAO5IiJGN1+5oyZ00vseoMCI8
	 ieulFwAgE/IvZe77NJhEJsVdQCfhDOSd9sR6ZQ2Je2d5V7lDgiSSCdiLecUFdVrtj/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250037;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-Proofpoint-Reinject:
	 X-Sony-BusinessRelay-GUID:X-Proofpoint-Virus-Version:
	 X-Sony-EdgeRelay-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Sony-Outbound-GUID:X-Proofpoint-Virus-Version;
	bh=KwgH78sy7KEegzPUIFdE8eox+j/ZYiN8MyfkzB299E8=;
	b=xXNvPlRGksTV3Bg95QNByTG47HUdFht3EqSLzjvVYFZG7AQw167ppN8LCdu3M+h5Etih
	 Yx3b7t4v2S0y39eE6bUMN1EZ4WnejvEaCCXPKXIFRQzfJTXExpCu1DppiSUmGOnO9YQrO
	 BnWOlHf/0m3aPUJXDOEkwBCz/IdaaMv1/EtZltu3T7LANtppqsFPLaSRnWpDV69uBPGpD
	 mSZAaf1crt7dzdCNVnqWCjBfGYW3782VH2+JDcuMcWOXOAqdFSArq3HJByuN2Hebq51uu
	 32AmbZg2NNnjBq5kYZvnC/Gu5IDzXf5Zpeff3QPE5lkLXN0G3eoPtzvxIqVXuRIdsPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sony.com;
	spf=pass smtp.mailfrom=sony.com;
	dkim=pass header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=p1 header.b=qGGzWyD9;
	arc=none smtp.remote-ip=185.183.30.70
Received: from mx08-001d1705.pphosted.com (mx08-001d1705.pphosted.com [185.183.30.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44570606A31C;
	Thu, 29 Oct 2026 05:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44570606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sony.com header.i=@sony.com header.a=rsa-sha256 header.s=p1 header.b=qGGzWyD9
Received: from pps.filterd (m0209321.ppops.net [127.0.0.1])
	by mx08-001d1705.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T3bfvJ936522;
	Thu, 29 Oct 2026 05:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=p1; bh=KwgH78sy7KEegzPUIFdE8eox+j/ZYiN8MyfkzB299E
	8=; b=qGGzWyD9wcDEPF+LUGUG+YNccnC9BZ+q8eR+Rlur0kT+GUbt3v7nN6hXit
	DKhGaNqOAy/OG4TbVNqbTvEbSyK+ruCwqQmHQDGJjJPvvXFvUp00/7l6n0hCmsmB
	kj5xVZldSvZxpNeX+Ym+vm19xRIig4yQTmZq0pGUvyJmSRCqm9z1fV9bvoCzcV97
	z7vZaQ8saOA9jYNHwOXpn3gNlgfjqPwE7IZMGmxs9xN187/Bx/X5mtb4cuVmDtq5
	pf9KUdgva4zfI9vv+AMlXRiRZOiysHPGtm/BAOyD8Su+w+Dbt7L/zEjnvkaHj6Lk
	tE4t8ChfLwRsh683n7HCsjGGmZEA==
Received: from usculxsnt02v.am.sony.com (usculxsnt02v.am.sony.com [160.33.194.233])
	by mx08-001d1705.pphosted.com (PPS) with ESMTPS id 4hkpu38gwh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Thu, 29 Oct 2026 05:00:11 +0000 (GMT)
Received: from pps.filterd (USCULXSNT02v.am.sony.com [127.0.0.1])
	by USCULXSNT02v.am.sony.com (8.18.1.11/8.18.1.11) with ESMTP id 69T4P2qT3508960;
	Thu, 29 Oct 2026 05:00:10 GMT
Received: from sgppsbm01v.s.gdce.sony.com.sg ([146.215.113.217])
	by USCULXSNT02v.am.sony.com (PPS) with ESMTPS id 4hgkxd0mk5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 29 Oct 2026 05:00:10 +0000 (GMT)
Received: from pps.filterd (SGPPSBM01v.s.gdce.sony.com.sg [127.0.0.1])
	by SGPPSBM01v.s.gdce.sony.com.sg (8.18.1.11/8.18.1.11) with ESMTP id 69T3VBc91070673;
	Thu, 29 Oct 2026 05:00:07 GMT
Received: from localhost.localdomain ([146.215.113.251])
	by SGPPSBM01v.s.gdce.sony.com.sg (PPS) with ESMTP id 4hgnrk1g2n-1;
	Thu, 29 Oct 2026 05:00:07 +0000 (GMT)
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
Subject: [PATCH v6 0/2] Add bindings and driver for Sony IMX908
Date: Thu, 29 Oct 2026 14:00:00 +0900
Message-ID: <20261029050002.3880-1-lachlan.michael@sony.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Sony-BusinessRelay-GUID: H2Rc75oGP9FX-dcs1C4BDAVG5bwIqHGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Sony-EdgeRelay-GUID: 0LP1rpzBVh_9LAySOuQ_FeXL-t3xm_G6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxOCBTYWx0ZWRfX2igtY9vgD1VO
 mCs0n9h6onhg3HwRpQcJ1uZUsyXxQ1xXA8DjzouB0OvDOEwm/76Fxz9VcU4Pt6oZ31SqHnDDGst
 cuxJGprPGpPUjIF0sFzRWs/p1SwGX6tS/0MNj9xPXxCeOEO4dweN
X-Proofpoint-GUID: hrs_WvOcaq_WEIGJH0pnCwA0R2WCYWnV
X-Proofpoint-ORIG-GUID: hrs_WvOcaq_WEIGJH0pnCwA0R2WCYWnV
X-Authority-Analysis: v=2.4 cv=BZtNQbt2 c=1 sm=1 tr=0 ts=6ae2d2db cx=c_pps
 a=z+s+ENbgstUlBMk8+ywv3Q==:117 a=z+s+ENbgstUlBMk8+ywv3Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=KAb5x4SsHD3PzxGk7EmX:22
 a=M2bq-ooH9SiLYa4vvubY:22 a=VwQbUJbxAAAA:8 a=z6gsHLkEAAAA:8
 a=bt04YS2g-htMHz2h_L8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxOCBTYWx0ZWRfX++Jm3hyKqRZS
 +YRPTYSpCHtWjhIysqhO96m77Ke11RbL5FkfWq8HikppJYub5Gu9s9lmyNPmRXZtrl/R+eXKvXr
 hnHRSQLgUxYMTQoRHmIPLVskc+4RBJwVm77slgzFfm+ApH95gd6b2fGOLicgULxoEv98dG/Fsqd
 ig+hiPSj9V7ZRG3EyihSoQAr591btZJXUasEOyrPwynz5xWwuI6OE92YLJPhbnzkjborXUPI2XE
 hxmP4Uc9Ql3X0CC6Lc1I1yds81iIP6DHxD4tGHVFwyrmn/z2729MEXpDjSoOo7VS4+g0a+1J1oU
 F8GWIbZTiVUqiQ8+bIdPxODT7q2lrpil2a+vBJIZmMdctmgJoHkDGke3WvRzgxF0r/pWIvaMmDR
 8unE/vbZb3xVzeyOqTju8sDy+mlDcu3szMB4bBGYIeQAKaJJ+hdbKdOfRrSUoup0CGT7dQY7bXD
 UCDvLyFi0k6FNrECjrQ==
X-Sony-Outbound-GUID: hrs_WvOcaq_WEIGJH0pnCwA0R2WCYWnV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01

This series adds device tree bindings and a V4L2 sub-device driver for
the Sony IMX908 image sensor.

The IMX908 is an 8.39 MP (3856x2176) CMOS image sensor with a MIPI CSI-2
output interface. The driver supports RAW10 and RAW12 output formats,
exposure and analogue gain controls, image flipping, blanking controls
and test pattern generation.

HDR modes and RAW16 output are not currently supported.

The driver has been tested with libcamera on Raspberry Pi 5 hardware.

Signed-off-by: Lachlan Michael <lachlan.michael@sony.com>
---
Changes in v6:
PATCH 1:
- Use unevaluatedProperties instead of additionalProperties to correctly
  handle properties evaluated by referenced schemas.

PATCH 2:
- Simplify runtime PM handling by removing the CONFIG_PM conditionals.
- Rework probe power sequencing to power the sensor explicitly before
  identification and enable runtime PM after initialization.
- Parse the firmware node earlier in probe, before hardware resource
  acquisition and sensor initialization.
- Minor whitespace cleanups.

Link to v5: https://lore.kernel.org/linux-media/20261019014720.2635-1-lachlan.michael@sony.com/

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

 .../bindings/media/i2c/sony,imx908.yaml       |  107 ++
 MAINTAINERS                                   |    6 +
 drivers/media/i2c/Kconfig                     |   11 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/imx908.c                    | 1158 +++++++++++++++++
 5 files changed, 1283 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx908.yaml
 create mode 100644 drivers/media/i2c/imx908.c

-- 
2.47.3

