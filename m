Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22380466B17
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582148; cv=none; b=bYSYTNx35UW484/5Xo8FPHEoEW8s85cEq6QFJikQZIsltmUMHN9KA4A+wDuccCYsqhJU+jnSkSSzyzXSI0KGC4NkXMXl7pKu7sJZymDtBcdOjzy7oXN0J/SPYJplDjbcBJiocFlGal+39EbezMuD3KamviboFClVJ49MvjX3Hxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582148; c=relaxed/simple;
	bh=sToha8CJCLC5ewHFl2CwtyLlEuDbDp20jbqUYkChLGo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Sr7gKxEnJu+k23Ub5urRJliQiVg8WcYuVzfjyaYry6GA1ZZD1UmJQWNJXRyDBusjTOdbJwhKAhDsxoZycplvlFoe0W8/9KoHGxga6c9enwZ2H/afaYvK8MYHNQwJFt1uoj3kdIW6CuJjs/HhJP2dWZN2B3l3x8G+4A080inFvCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eoyZyIGP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b0K6Q11e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eoyZyIGP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b0K6Q11e"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1At0Z3455486
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Vng1mBez+uUndShx0kNptw
	vy53oyfpNkp7ZVS/Ep9DE=; b=eoyZyIGP4JEM9TCNrwXoEn8sck0RB5D2pec9W7
	HqA32YKE0XQSnGZUrS4XdwJVbthlH/JQXbW8W0HW62b6Btgzu3qtS48qUz94n5Dz
	OqlJ1qO+o/2RX9+7n8wVBiOrJy5Tdy7ZRfSNSHxFw2s+fTVGK6Q589AmGRLCt0SS
	T4uXCLG6RLES/dJD6bduAUxT/h+MxNQX3gDWr82LBjX9ORX+CN0D6tOQ2kw1jjz+
	fyWmElhIlNSqQTREpNdJIp8SUylwHVENQa9S9lEI0/FKNwwYd1QkRw/zrEMGd5xy
	50ubXXX0PUefkjN9klqlTZ+MA1FzthWdf1yy6cY+PdxF0ptA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq13vu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:55:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso654007785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790582145; x=1791186945; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Vng1mBez+uUndShx0kNptwvy53oyfpNkp7ZVS/Ep9DE=;
        b=b0K6Q11e3Idgi26PyxeqCADjPV3kEzT7hLMewmHjeSszOkPiODgNencqcRjJWq8pIF
         DEbTKl04PreYnwBRA6l5ove7Xq/To9ibfGMy3fuwC0PtwO+NByYllYKUq2aJqTIYLmvO
         ssLptH7+t2bZc+E9bmKQisJojlLOz36m5wv4rGwAedYsSw+/W2nYzw+5YU+jq8HucHRp
         sPtXHVvfJ2tOToFA3xs2Pi2KCUDU3tOdDhdtnHAl3b8T1V+SkjGMPsz7iKXMhBe3mdE/
         V52M2UfCcVLY3m2XaeK+XQWWltt1lqEMd2yIJGoSgijUTQ1qR09r78Cm11iJfPsv1XAo
         eHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790582145; x=1791186945;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vng1mBez+uUndShx0kNptwvy53oyfpNkp7ZVS/Ep9DE=;
        b=Bwbrxnth2l6tDqyLmI3HOUwreTO3NkfLbp1HgNf4V4Xf37mMIt7SSh8asIBY+nhQGw
         MOgYrXR5adApAT5YARu2dogqWjo8J2y9eoZQtHl3xi5jVzfAAm8vFmlvrYKBb+8WeP0q
         h/jlqA+I0ClkOTNLge/SkhqoRrwUFGmexi8yevUHVAhGdtHgn3h//whEGdCURub03JF1
         OJiAXhb37l1OT9yRK3sivdEQCRPMB+aHBpFb/di4v54stgF6rsibo6RUS3rixcTp1XHg
         LZZFo9pvZNm3flDdmKqLxAkXcP/o8nLdVLN/rFx3Ez1PTw5VmS3jmHqAUFm5htIUyyx8
         krcg==
X-Forwarded-Encrypted: i=1; AKwUvBwexN4EJmdZZ3ug7y+QgI3xbjLx+phSw02PuZ2473ftA/8uBeUDPXqSKdjLMxer7RywJW7H7NTcl2bVfW8=@vger.kernel.org
X-Gm-Message-State: AFuF++ntnDNaXPzr4gFs8i7HP1nZoux3a4+L2KnTHYLOJQXZw+qPWD2u
	kQRxEnPZXXtPseAaZgP0jaQzuTL60KaK9ZLVwmSnSQdTk2amMoHuWwsmnM0+V+N9fn5NT6QfHwq
	AU7jELwje3saXIKv6bTWR6O9vXcGJIDneYIqEqqfiTeo0QyYQQoka15F3QwYJUu9CrIA=
X-Gm-Gg: AYBFou1yRG9jy7sqIH5e2yaiDIbSAWeoD/ORnR/KWKwQpiICrBjEM/d4AAnb5qgco1h
	mE0dvtsuLPNWz0o6NYz2kd7SmKXmtH2lbK5BO5HQc7Cd2VVKJ56xk0KPm8Hn3cMpx/LATEmzbze
	vJ2kq2rnSgiJokkXGk/ih+0dOJ/WNC0oNhGGk9Xm1pDaFiTGt50ufkimgEFxB2AGFYfoAh7mncB
	w2Sj3Jb8jaCQMLz582n/uv/yOfvPKdhOoZRmGPRrPqBvw8iw9bhKhSUqLQLcAzQSWDFaicRUbfV
	htpA98cDsjfgu/M77EGMS/756S3JgjV+Xva8KNRmGV71pfBpw7gVaQ/SZluis4pvcc6DPHFqKZT
	sYFFI05Y9mPEiiHhQbZLexwzRSqxpIeLmAlj7P/nM3j1aTyRcxXmS4LJFwkbPdfeworw=
X-Received: by 2002:a05:620a:8088:b0:939:36f3:fea8 with SMTP id af79cd13be357-93c43bf95a8mr1861251985a.25.1790582145174;
        Mon, 28 Sep 2026 00:55:45 -0700 (PDT)
X-Received: by 2002:a05:620a:8088:b0:939:36f3:fea8 with SMTP id af79cd13be357-93c43bf95a8mr1861249785a.25.1790582144694;
        Mon, 28 Sep 2026 00:55:44 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c815a47a6sm87940585a.47.2026.09.28.00.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:55:44 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v5 0/2] media: i2c: Add Samsung S5KJN5 image sensor
Date: Mon, 28 Sep 2026 15:55:15 +0800
Message-Id: <20260928-sk5jn5-v5-0-19aa0a0a68eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGMdumoC/3XOyw7CIBAF0F9pWIvh1QKu/A/jgsdU8dFqUaIx/
 XexSa0LuyG5ZM6deaEIXYCIVsULdZBCDG2TQ7kokNubZgc4+JwRI6wiklY4HstDU2ILgjPrtDZ
 aoTx86aAOj6Fos815H+Kt7Z5Db6Kf37FCjhWJYoK9qSjxsvZCi3Ub4/J6NyfXns/L/KBPU2I/m
 omvZlkrST232jAQckbzSSvyPT/xrInlxlEwvlZmRotJazrtFllzVYESrrbM8j+67/s3q/M0010
 BAAA=
X-Change-ID: 20260716-sk5jn5-be432bc99a98
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        vladimir.zapolskiy@linaro.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790582140; l=3854;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=sToha8CJCLC5ewHFl2CwtyLlEuDbDp20jbqUYkChLGo=;
 b=tIhh8Arz5NEe+WofJZp2D2JhCYLjGcAqojNcWu5J3BY4jGAjILVOVQC1GmCrd5BArREpq1OFy
 kIIsulGeZqtClPARPEG44oQXwMgPS9aClLaPk9vTJqotVIULCpPTqo2
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 6lQefoL5kBug979TeogizwCiW5J78g17
X-Proofpoint-GUID: 6lQefoL5kBug979TeogizwCiW5J78g17
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX4xNevF8gr8wU
 wHnMIke5ayUWTVg794xGaO0S+X/dP8fuF3wEcK9vRu3ZH/ZXhgyea8vRje+ycOlf63AszsbDtxg
 J809lGRG9JA2vQZl4YbALpd1Lrr709U=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba1d82 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y_Jm3pi-UkWrk6VzsO0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMSBTYWx0ZWRfX7bFdwOIR8kyB
 B57WCn/yHcvRpLMyOZZ0bQy+TyFNwQMJVbkc6Ydc9zhzRLPevoSF+m5+bBowPYlM8tOthuKeXe4
 mOQDc1ew9QgnPIDlIe+tqZFuip+0gdH0fGB6MtXijsETQPE9r8aOihHPbv1s5C0vsinzponToRc
 2SZ0s1DPhQryXIyYunhDb+U+reGMa2NEP8OS9u7XMl2P4Rml6ZZ7+EFKLwga12lo/y+HR65Kg9n
 E5rLw7azIkN++PrYnI6sfRKJkogocRsddOxmyFpMWxRhv9yPOQQMwsoX31O+EQzFMWVo6ziRbRn
 qKgvmlv5GfujiseeB6G2sB8hFuNhrHhzKIErHJxF5ZCNHFoTvNC9t6um7SDnfQihC+Ir5FNSC45
 jEIhn/QDJId1c6RrT1AYOqMMyuaslikPHtBCuFqCe0B8ZLtCZdsSEsz21DPp2UYuwbHtmrEIkPQ
 T10o4GVhYsI7nLP8rUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280031

This series adds support for the Samsung S5KJN5, a 50 MP 10-bit RAW MIPI
CSI-2 image sensor.

This is implemented as a separate driver rather than extending the existing
s5kjn1 driver. Although both sensors belong to the same family, they are
different parts with different register maps and power supplies.
Combining support for both devices in a single driver would result in very
little shared code while introducing separate initialization and control
paths, so keeping them as independent drivers is cleaner.

Power Supplies:
| Power Rail | S5KJN5 | S5KJN1 |
|------------|--------|--------|
| VDDD       | 1.0 V  | 1.0 V  |
| VDDA       | 2.2 V  | 2.8 V  |
| VDDIO      | 1.8 V  | 1.8 V  |
| VDDIO1p2   | 1.2 V  | -      |
| VDDM       | 1.0 V  | -      |

Tested on the Qualcomm Hawi qrd board.

---
Changes in v5:
- Fix build against linux-next: s5kjn5_set_fmt() and s5kjn5_get_selection()
  now take the const struct v4l2_subdev_client_info *ci parameter. -- Nihal
- Rebased on next-20260925
- Link to v4: https://lore.kernel.org/r/20260914-sk5jn5-v4-0-386e84cfb2b3@oss.qualcomm.com

Changes in v4:
- Removed AGAIN/DGAIN _DEFAULT and _STEP macros, inlined min/step=1.
- Removed S5KJN5_NUM_SUPPLIES, use ARRAY_SIZE(s5kjn5_supply_names).
- Reordered struct s5kjn5_init_op to save padding.
- power_on(): removed goto, single error path handled inline.
- s_ctrl(): checked __v4l2_ctrl_modify_range() return; removed the two
obvious comments.
- init_controls(): moved v4l2_fwnode_device_parse() before the handler
init; return hdlr->error directly.
- Removed the redundant single-subdev .link_validate media entity op.
- dev_info() -> dev_dbg() for the detection message.
- Added blank lines before the probe() error labels.
- Added get_selection (CROP / CROP_DEFAULT / CROP_BOUNDS / NATIVE_SIZE)
reporting the full 8192x6144 pixel array, per the libcamera sensor
driver requirements.
- Link to v3: https://lore.kernel.org/r/20260806-sk5jn5-v3-0-0b3ac1eadf8a@oss.qualcomm.com

Changes in v3:
- Add vddm-supply to the regulator list.
- Drop GBRG from Kconfig, file header and MODULE_DESCRIPTION. -- Vladimir
- Compute pixel_rate at runtime from the link frequency instead of
  storing it in the mode. -- Vladimir
- Split the init sequence into two tables around the 5 ms delay and
  drop the .delay_us field/handling. -- Vladimir
- Remove unused v4l2_ctrl pointers and the unused <media/v4l2-device.h>.
  -- Vladimir
- Move all control flag setting to the end of s5kjn5_init_controls(). -- Vladimir
- Fix s_ctrl() to apply controls when CONFIG_PM is disabled
  (pm_runtime_get_if_active() returns -EINVAL).
- Use S5KJN5_CHIP_ID in the init sequence; reword the clock-rate error;
  minor style fixes (reverse x-mas tree, ret init).
- Link to v2: https://lore.kernel.org/r/20260724-sk5jn5-v2-0-871d3b9a2e47@oss.qualcomm.com

Changes in v2:
- dt-bindings: drop the "T:" MAINTAINERS entry -- Krzysztof
- Rename vdda2 -> vddio1p2; fix supply descriptions (vddio = 1.8 V VDD18,
  vddio1p2 = 1.2 V VDDIO12) -- Wenmeng
- Link to v1: https://lore.kernel.org/r/20260717-sk5jn5-v1-0-da610d7fd494@oss.qualcomm.com

---
Wenmeng Liu (2):
      dt-bindings: media: i2c: Add Samsung S5KJN5 image sensor
      media: i2c: Add Samsung S5KJN5 image sensor driver

 .../bindings/media/i2c/samsung,s5kjn5.yaml         |  117 +
 MAINTAINERS                                        |    7 +
 drivers/media/i2c/Kconfig                          |   11 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/s5kjn5.c                         | 2863 ++++++++++++++++++++
 5 files changed, 2999 insertions(+)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260716-sk5jn5-be432bc99a98

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

