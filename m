Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D18469854
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247888; cv=none; b=BCoorkHize6AnN6qx+EBRKhPkXusdeTkbe3h7y30iDwO1/r7DSTIzlhnTnAQRmHwjDdqyOp9ffuHFQf+WtpKLVf6RHyOfIsEg8pFKFsoZu8YFnyVHK1nPqzP5HqQcfxGu7fY1m1qvvM5z4a5Vtm6131nSJdybSlLUetYw++1JZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247888; c=relaxed/simple;
	bh=uBZdxUSbidPUR8s5YEFI7Jz6Erg/CEjfOa412pkfNDI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t5CwUXNMbdNHYSdDKsKHRGO+Lp04Vb7wmyIN7xSoE2LSuzcFSQg/NROlxY8WDyR725WKf3rKd3RnqT0gkvdY2fO9LQO2B/Uebz7Q4h0CTXs7pa3/HEg3n9Yi42EFOyTS7gX5Hq55Ci3OCHwsuuPJjeyiiw8T9Z40YGz/CRcOb7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NdpSuVJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PpQnoJKH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NdpSuVJ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PpQnoJKH"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681797gq1211403
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 07:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+90YvACKrGhNGFC3jO9C3x
	PTwtrUvuxLMFSNd/WpkuE=; b=NdpSuVJ2EiNSRzoZ1SCLzjYVDWdxG2epxubq0j
	jP0FEfsGdv/2NilHpXcS/jVao88tLjKg+vNQj5nnVUrBNl0tELSxjv4xfag6qRQL
	XR5mMmWC5vnsWxsq9zewPJbkm5bZu4HpnLOX8pCAMUFMK4lFqyln9rZ7FEgn30O7
	TjBBssE/KkU+fwMmaXQA1sp/SzO5h88NVfaL2RyoBNExKrkz8wTm6bg8nWSOuePj
	DBftsJwXcHRCcfLTTtKQLoc7aZty7T899G/yBm43UG3DjHONwyv4HbOWiDqfoUYh
	7ufefRqDwLG4AdeaSGh3zkwbveQrqATGewKFNLtapX2aO6Cw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8s8x9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:31:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so126721685a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247885; x=1788852685; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+90YvACKrGhNGFC3jO9C3xPTwtrUvuxLMFSNd/WpkuE=;
        b=PpQnoJKHSZEDbEfKDZrkTyPiXD/9GCq3L7jDbWl0zzfHMUKTNDCweazpsJ1JnaNrS6
         qUR9qth9m7NYZVCz1GxoEkl1DIimvN7O3Fi2HOIAObyWskkFEWYI9VFaIubRrx7S0bM1
         CdYyEHvYj1ocwqgT4FxK+jHu43qPWT8LuSMfnt4lpIaNEUOHoBctuDjqZdi7t0vzny71
         SqqeBSFsX/n9LZXP6fM45fhYBoh+lVQLeiiQ3UO+JNe6s7BLMK3PkquHCdDFGqJSGH57
         N+Vg13lg3LrHf0iMFBooS1MUFuP7fLfOnjfvvqBRQFD97MYV0FvS7hOXyzXK2cmWRBKk
         Vabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247885; x=1788852685;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+90YvACKrGhNGFC3jO9C3xPTwtrUvuxLMFSNd/WpkuE=;
        b=KSPeBXfakL3rcduRpkfC+iidDZwOXxDZtbwxJdNcW4K0IMntyTO3+oh0cgcX061dxC
         Xr7ybKbyV46hZx7YqrxBbJmpbzY5xO7yevowujp4cKCOKWmAkw3gRgH14XIIA2zSG2ug
         1qB47V9130e6q3qmqwmZvDIk3AOJNPG5TqESIG0gA6FMymaHsG6rfYv8YBIe9IqnLOB2
         4uNF6ZmpHVSj4XLfOxD4shNp45nXDdZk/j9MZcNtMv0xlm38Cbflszam+AD6BDxdkzqI
         WSGncsVg39RTC7Cp+NpSv+HKJG6JMkh7JGLrMU6QSg+UEozLulNOThFeVKZOoGN3ypvy
         nQ0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rok2s1HLT5fec8sV07/VQx652LP1oZjY/UBPXHMHzCkhKR02fuhh/P27UvPk9i6C3FmfXkUH5SXDD8GlL4=@vger.kernel.org
X-Gm-Message-State: AFuF++kp9vgYVkM83xODMxb0J4pDU5MRdAYm20PPM6XohEmX1SCvYc9S
	MmGRY53JL4XDwXoSN5UEBXq08xLGIU6bjPcSpy4gErQLZG5LJNvY2/tjqS4ScS09e2AJMB8zpGt
	Fgtpo++tH5zYsy+avHRj+PcHvOFnK5hIS8AU997GiqC4tXT677B2T+Y3k3toel5eMm2c=
X-Gm-Gg: AR+sD11r2hWNbOFR7PAjKidTJOvGGp4os+dx9peFq66iKkQY9sb6da5q/zcMSagyXeB
	/bnD7LlpAfe5EGS6BmoLTnfN6JGLze5nhpAWkmxpJa03eiHaRswv0+p83t1F8CNjLYdOjtIOGwG
	YxZo+gkVLHai3QRqx2YnsWnAI4AMDirbfo6y4aq5fP1r33wORGejGPjR8BsRWZ/gcwvDozdvd9+
	egqwvCITsQQKajuO+ppKdgV8aITX1xkLm/WpyJoXzgjnR+CU95JGrnycjYvfksRuTp0TX8WtEiv
	pWfZMrl2D1PBryj4G3LPqcE0KRZBM7TY6QFHFPTN9VhKx8v9ixbLEquho8fBC9bioDccd6E3+KU
	3iZSFYBO/aT945T3fEGplLbtlU3DMsdpmh7OCfpf1AVFrkgwhymU4IEQDgEUr0/Dzmkkw
X-Received: by 2002:a05:620a:271c:b0:934:a1e4:cfee with SMTP id af79cd13be357-9394bc5bb71mr504583385a.11.1788247885388;
        Tue, 01 Sep 2026 00:31:25 -0700 (PDT)
X-Received: by 2002:a05:620a:271c:b0:934:a1e4:cfee with SMTP id af79cd13be357-9394bc5bb71mr504578085a.11.1788247884811;
        Tue, 01 Sep 2026 00:31:24 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93918b0f825sm946766785a.40.2026.09.01.00.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:31:24 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH RESEND v5 0/4] media: i2c: Add OmniVision OG0VA1B camera
 sensor driver
Date: Tue, 01 Sep 2026 15:31:03 +0800
Message-Id: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788247879; l=2311;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=uBZdxUSbidPUR8s5YEFI7Jz6Erg/CEjfOa412pkfNDI=;
 b=AI7/A32JN3z+3EknhLhlMjgy6xq8H3c1YDlpW3OSJz6woengqrE5NVzrUH667rNmiu2R+yth+
 dE6RsoKI6ALDGPUDCDUem7rNjl8i5B6oiiyx6J826phjGFCCR/i0oED
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a967f4e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jfyOTsDdjuaVfMw2EzIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX5gONW3i625uZ
 Zi4Tug9xs7o+rRW/YXr0VDsh+46Bn3vxidMG40mmIh8r9z+lpfxvjKTW2nOH2oH1iGdd4VtI9SX
 KOZdIt+Ltj7A5HPsiBTriNhPfoA17GlteYgyUcGik1Pd0lFc1kQocOS0S2McQHN5R3QdvQ4oVYT
 htsoXjeMnmtnNttavOcpAivv7RnB668+V/oxIVmOqtUQDUOEzhIKMWp8eM0/b3l/3zkbjNZawfk
 kgoGU8qtSMzTfo2/68QcKpu3Kg8yU+3cZufCaKyyvZZl1yGZsNQrz9OEgb+qldD9Gxvb2va4uhw
 Z4/oZUhbth8I1n5lmK6RGCjqkVgRIPACv+7+A6B8WkSqTrQAV6Ylou0KSNqJMIr/FP94rWtqLmc
 irTKx5vaK3ptmDoqVCo8c6ECPzqK8RrrihPJ/6llpUizmnOnu3brFhovXANw9KwEfvmoi9ENTvA
 rA1qOIXlxH9fGgt8gpQ==
X-Proofpoint-ORIG-GUID: 12FPCHhaiegfoAC63krZsWwUO9sReoZ2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX3GZ+NMnMexTu
 2ATGafBe3M2WVnTz94NH+QObxd7iv8CU9hIXie4xAQjCdwCHwwifiXN+F8y3bJf2KSTSicuYpJP
 TK65tisnSu1iJbmWj8Qy+zaF+Q0SxjQ=
X-Proofpoint-GUID: 12FPCHhaiegfoAC63krZsWwUO9sReoZ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010066

Add OmniVision OG0VA1B driver support. The OmniVision OG0VA1B is a
1/10-inch monochrome CMOS VGA image sensor. It outputs 10-bit raw (Y10)
frames at up to 640x480 resolution over a single-lane MIPI CSI-2
interface and is controlled via an I2C-compatible SCCB bus.

This driver has been verified(include tpg) on the Purwa EVK.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
Changes in v5:
- Use div_u64() for pixel rate calculation to avoid 64-bit division
helpers on 32-bit architectures. -- sashiko-bot, kernel test robot
- Link to v4: https://lore.kernel.org/r/20260729-og0va1b-v4-0-ec7e7ed87b2b@oss.qualcomm.com

Changes in v4:
- Rename the OG0VA1B and OG0VE1B test pattern menu entries to make them
more accurate. -- Vladimir
- Link to v3: https://lore.kernel.org/r/20260708-og0va1b-v3-0-de8e44455a42@oss.qualcomm.com

Changes in v3:
- Generalise the binding title and description for both sensors. -- Vladimir
- Keep the cached pre_isp read so the OG0VE1B test pattern still works,
select it via a per-sensor callback. -- Bryan, Vladimir
- Rename the "sensor" field to "data", drop bpp (derive from code) and
add og0ve1b_pixel_rate(). -- Vladimir
- Sort defines, rename the shared CHIP_ID reg to OG0V_ and order
og0va1b_data first. -- Vladimir
- Expose all four OG0VA1B test patterns instead of one.
- Link to v2: https://lore.kernel.org/r/20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com

Changes in v2:
- Integrate OG0VA1B into the existing og0ve1b driver and binding
instead. -- Vladimir
- Link to v1: https://lore.kernel.org/r/20260618-og0va1b-v1-0-dda71bb83009@oss.qualcomm.com

---
Wenmeng Liu (4):
      dt-bindings: media: i2c: og0ve1b: Add OmniVision OG0VA1B camera sensor
      media: i2c: og0ve1b: Use monochrome-appropriate test pattern name
      media: i2c: og0ve1b: Introduce per-sensor data structure
      media: i2c: og0ve1b: Add support for OmniVision OG0VA1B

 .../bindings/media/i2c/ovti,og0ve1b.yaml           |  15 +-
 drivers/media/i2c/og0ve1b.c                        | 378 ++++++++++++++++++---
 2 files changed, 346 insertions(+), 47 deletions(-)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260618-og0va1b-55bbf3cabb0e

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

