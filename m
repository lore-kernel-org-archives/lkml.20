Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226CB440A3D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384249; cv=none; b=EdlBdxTK5ilqGyzdRjTwubcNaAtaH5PnhngoeHpfcPKB1nSBamv0O3VOC51l9BkESWXFr7QM+Dyb6MHxrVlCSeqkXbkjQv2HMET/psRT/cMCiBXJCmJIgK8phYCXKjKuXePvrnjwa7r2gTbJzlI4j/MizH3h5OLe5rqKdM4u8vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384249; c=relaxed/simple;
	bh=AmdoA3r24dHAajQOXdZSVXOQ/7zFOK7uEZvjLzLavQM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J5Tjnnz4h685RX15fJJtBgNnUtvMUGss6xiCQkBjluVJNql1QygtIB5dsPDOuT2QYtkcpdSAzewTfGomvCJlajOtetWYhT5E232XABM18ZLQdBY+NMxHzJMkVnaym38PiwyC9O1gqFNeHuTAWDt875NgRc6pJT6EPXWS9UX+1b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTui/J2S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsPpSbVC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTui/J2S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsPpSbVC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwr91460505
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9q9U2IK1L+GKlvlEos9Svn
	w0EMZHyBDz+3wHlJtnOwc=; b=oTui/J2SWbhnEEXK6LCpyDEplg5BhJN2N/1ygS
	YSER5nGm1nTSGGQPANsxWAKljD1GdEtafI5rv0/rYfiPXc71paj2+Fr2GPCHwV0V
	k+xrw7UvhkO6CVA2rHnZyXu3XGj+e1SM4+0ZxDJMWyR8xZXHGgquh+80rLWjp0PQ
	YwP9kb8xLMmY7aEjOVTtVCyWwCBZP+6WW/O0cFiGEXuvYqoD26I2ruVl797mbRLn
	V95qSNNXFBYk145wBKFvHa+Q1aa3Ual6zcw9oI2KYXmP67nbdNrstdfJrtfNxak/
	LDGI/K0RwIebQHGV/zY9oqfSl6k4jEtbBTUsre9+VkvhOvSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8cp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:10:45 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530e89b584cso39460191cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789384245; x=1789989045; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9q9U2IK1L+GKlvlEos9Svnw0EMZHyBDz+3wHlJtnOwc=;
        b=BsPpSbVCQI6Mto14/j98es8Hnxxr6B1liOaI+SUCwkjThYA591YACFcB+y/z/f4/xJ
         bSaZ3uOBPuX7e19wlxkbv1cCz4+g31BVJiss8N5Q8lFfgFG1mosAw9VCya5oNBHoM90H
         8pUkI4T5/FfK+JnNUZadlwKdfQlbdPOFVpFgT6MjGS3r1/TpDlEulO0EknmkKwL6blhB
         xgiSCLyUX/owftrop8KXH319kkQfkeFkfA25ie+HPbuukVKRQrOfDi+ppelsQnQ7lKzx
         sxHtmGSK2cyb5X/B2qtvxofNFcBXq8mri7SgPRSjOY73lF8h9PHnHducIu+Gpjdt+fEe
         JTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384245; x=1789989045;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9q9U2IK1L+GKlvlEos9Svnw0EMZHyBDz+3wHlJtnOwc=;
        b=SRhWFzuDFWS4e79Lx/5HJOrW1fSAopJCRM7CGtOaSU9Kkl71Iud9PLB5NdA+J4kRDs
         w7gLwe+sDbwtnPHBQgbMq+ACo/GrIoEKpuyuJjeEaE477Ytv7K4gGBgaVlnAG6dqZdH9
         YHEu11mfBiGxatzWmG1qprM4o4u8ion9BlkIz0NiEg5eeQB5pv/n6qtK9f74kzjFnTr9
         u2eDusiDVvDLBYB6MnohLujlEQRw34M/cS3lM089Rb9HuiFP1cnjcD9IAGa2v8qbrICw
         K/zYTdklAeINjrY4nOcMNegZJtDMZBloB0NFaOly60GaSMg5JN2zAaWEL+u9rhkByhLQ
         Pgmg==
X-Forwarded-Encrypted: i=1; AKwUvBxzpJ6gY1TZcW7YUJof+ue9CThRHL/Qnvg942DZ51swyEghLNm1XGoTEHBL66TNwZm4DTz1WyGBBGG7YNM=@vger.kernel.org
X-Gm-Message-State: AFuF++lz1Cvem3O+JzZHSi4ARtuJRr6S5JZZkpVooCx4juJQFwHBTir3
	aiiUr3anM3rFMyKQsJv00JAS9ebFVoNsQdeIFzTPBKBJQTRx9pfOd2H7ka7u68chYgoLWrJ+L/e
	VTgk4Py08w9GYmiw8X7v7BjtUwiI7OXGrN/iMBEbpLjQWeotqaOy7lfzcQKxTsRJv6m4=
X-Gm-Gg: AYBFou2ezNRBUtVnoUOnGvr057hM4+xzntwIvbbdTBrBJBQl6+uSzsCL/ogTPWuxitw
	udU7mdaksrtr3wjPbnPAmvz9pDf7xq6fbazDeg4lhDldgJRVW+vzPHu3r5AoOivCMKKfoy8ikFW
	PIAnokn45OQ84RK2rhkLVFph9YQKe+yuHqTgNIblNfgCJ8DsKHBiIfLXcNkgK/tNDe0IppjTUW0
	mfIMu4aTzlzUOPezXaMqo+ceFrIgdymA2NEoe8dSavjfHFrtOzxTAqqy38K3TRsAWTHjT455l7T
	9lNJk8f6F692aUgM6OKp1rxehkj1WnwRTfGIulJpEAR8lbuqcowTlvXMwabr18e4jv2gGSr6dFb
	u/0YxGU5LZFrgIOuodgSLgrt8ygAQnBhLkdd4IZ34tn3AI0eg8vT00JM7P0DjtuHY2auw
X-Received: by 2002:a05:622a:1807:b0:531:181:d6b6 with SMTP id d75a77b69052e-5310d02f2cdmr27308511cf.37.1789384244741;
        Mon, 14 Sep 2026 04:10:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1807:b0:531:181:d6b6 with SMTP id d75a77b69052e-5310d02f2cdmr27308001cf.37.1789384244341;
        Mon, 14 Sep 2026 04:10:44 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4787eesm91720226d6.21.2026.09.14.04.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:10:43 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v4 0/2] media: i2c: Add Samsung S5KJN5 image sensor
Date: Mon, 14 Sep 2026 19:10:23 +0800
Message-Id: <20260914-sk5jn5-v4-0-386e84cfb2b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB/Wp2oC/3WOSw6CMBBAr0K6tqQ/aOvKexgXpS1SFapUGw3h7
 hYS0IVuJnmTeS8zgGB7ZwPYZgPobXTB+S4B22RAN6o7WuhMYkAQKRHHJQzn4tQVsLKMkkpLqaQ
 A6fja29o959D+kLhx4e7719yNeNouCb4kIoYIGlViZHhtmGQ7H0J+e6iL9m2bpwGmUiRfNmGrT
 ZItODa0kopYxv/Y9GMLtL4fabJRRZXGVplaqB/2OI5vF57SBh8BAAA=
X-Change-ID: 20260716-sk5jn5-be432bc99a98
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789384240; l=3562;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=AmdoA3r24dHAajQOXdZSVXOQ/7zFOK7uEZvjLzLavQM=;
 b=Z+B78ICpw+MIyNgCjf0vvNax3X7oL3rCd042Ro3MVr6yAno/QRX5RSR5HzNDPHgnEiBTRQVdP
 lQb7Lc8/BqVBLXP9Wx69iT63GYkbeBy/YzrXNDmRzH6DpNoBQMPaxYw
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1OCBTYWx0ZWRfXwWCdzXxmgAoa
 tg6b4ZOlbj+IgSUR/U0U3BAvQxqeAqCRxVyYrrTvtdyAh+olVy5KbqNwuLWs7T2lcQBHHWBasM4
 nj2nfRaglkguohhYRwGbPhH84CqPf42S0x7twAd0FIrx8rt+48BihMid2Tp5DOPRLaxD5BDLy8o
 ClzPZI/CQvC8GftvkePB5Snx2iryiHHsvC3aZ3brl4rjO4Hu+RYlwI794y6fJKIpbZn0nhG2cG8
 oyv/hYoefUCrTtbme11RoUOJ0mDneVrMG9qfzP22SZ4b6D0Eh0yEQGFHW/zfwF4bZ/LU6Ifh1U8
 IJO/B/ywytFlvSk0kmHbKh8LVZxadOTFOBgYnTWsCRLf/eI+62I69czZVx9NuJDqh///FdmXLGz
 L0WYfO6sdP/+AKY6EKDB7qnTKVpJz+rwru02gNAH9PwYdugGmvUiuCSvKMm2RX81olsdx/q82CQ
 A1uMh9CfdYdT/Ov0RgA==
X-Proofpoint-GUID: YHdU2lSkabqLNeGWhOdTk80Sz1xChb4K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1OCBTYWx0ZWRfXxhLSCP7+WIYt
 tH/hYyDi/aVtxuACPxHPg1JvYGGw1OSnLUUJRD/EGx4Dj3YGxOrDf+9HZZk9ekZae1Yl+b0nzR4
 rJSfMSed/UTNc9Wyl3LBI6R0M6W8IWE=
X-Proofpoint-ORIG-GUID: YHdU2lSkabqLNeGWhOdTk80Sz1xChb4K
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7d635 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=y_Jm3pi-UkWrk6VzsO0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140158

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
 drivers/media/i2c/s5kjn5.c                         | 2861 ++++++++++++++++++++
 5 files changed, 2997 insertions(+)
---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260716-sk5jn5-be432bc99a98

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

