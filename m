Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB11243B3C9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455275; cv=none; b=OULnXGefrHS7MtU0foX6STv2kVu/0Ozd6mY4V0CVRtNxWxEMpJUZdbKm8utY+bWKhBfyxh3BISenhKhWmOetQnkR2M84aOVMPS0D5xgjJmcZtrWLa1IfdlsFtp3fUALvMkB8lUmfTi+y1YXfpAfrFRKYx47xRogM6eQFO3q3QC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455275; c=relaxed/simple;
	bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wm4GA+yvr23UIBhjERPTL1npHaEnS5Btbhq7Rni2GKjG86mwG7f0VWnFUqaHusuZFwQ2XY3hAX6NoW5/TWXa03yaCzkEJ1WBv18ZF+7OE39tV0BpbE3wyCiK5kiWvgjQuh59ekbohwX6+FTwUE4zRijGQyifp86yyHVvN7Vi1II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ULeruQoD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O71xCPM6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ULeruQoD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O71xCPM6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Ze3Y3126427
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=; b=ULeruQoD9wY29BiO
	WD6/vhW3GyLokxnJHP61EYljQs7Bsh7PXF3KlRCYZJklkUAe5V337F/w0EGNqHZk
	jux3cM6UI1/BaYKLa28PQzEezEj3I94pd+se1XocZlsNIuDrlwlZc/RDhkc2VZ5F
	sdCRtPRNhttKoGUx1667Z6rG0MMC3ppzbatFTbroeNJHX0gn4AFV4QL+brugUoI/
	8jIi7OzQnl/d2E8z3xKXhwin1V34vnD1yKkheWe2b9yBl92/yBZMwx3YDYbe/iZf
	GW9uKjvvzRrvJPK0jOoq1Y38WQuTHV76pR+fevR/Ffkutl/3fHa+vImXxJZSu5Yy
	nUOGGg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpmx9tx6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:54:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso3492476a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789455267; x=1790060067; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=O71xCPM605u9AlOfvbI2HOkH6vOjOZ3ZqA3oJ8HWCobuCRJWJWUzdIjpC05nTQ5FTy
         Ue/Cs3fAWdQBT7ux2h8GXNHe6pqOV/MlVxqKqORkV1XhIEbSXHD75BnquDjnXSRbmiud
         MrmqNPJHWP4jMuWxfR4yDGmf7UdSup2jMDVHgdxviQe7Gt3856fCmzEXE6/u2KlTsbnS
         SO4UdncAr3RpcFcIhgwKy4jn/zmqj70BFt9yfiX8/3q+uV0Jdk2u/ol2XoKQgSbJy1rk
         0iTRhQv5Ee/TH9xDrXymHHnaxdW1WMz/o+7UUlAAbp2wMfhKBOJfxvBdSqY3/245Ef8h
         J3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455267; x=1790060067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VgKDv1xcq0t3CD7zLa+LminS2DbKGmggIsaKAN93+/4=;
        b=Ob84C3DZqwvXYJ9xUJPVCd/8kaWbQAu4adUDcn1591UIUCo++yhamapBrNSL7ZK6gu
         GZymx8DDcG1tJgJ3oDB6H1OvXi8y7GStdYITICnnl6OuHXnTyD9/KL1t86kkBBt7uHS5
         PmrkqfJiwCcw0jj8WeKJlopfIgLY2m0HlkTOMaYN9uzBOC9wjNJtHlsV3LhbLgmk5pBx
         1iNP8RArMgzkb+VnpJplCpHXiHDZWlg4tcm1MfIzli99b93j83dbSh171NMdDdyCxhPl
         oD+h4rJ9HxLNYde7QUsldpxp1vIqVhRKMeVlYjHlK0gD/7ltg80zMGqwLIFjeKqfxHxM
         aARQ==
X-Forwarded-Encrypted: i=1; AKwUvBxW9hXkDocz2PLXlncE8w6NEeA5xTpa4qkMrkPrhFCrdbVnkejY78mcY1KMHxjLUIpWHG8gFmEgS9s0G4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mRptnjYOqzYflvcgHxR4QYJKb7MeGqYz8P4LMGZ92f92nGv4A5
	K80l0wa64pGJt1fGLmq0eiPQmhUi7AvI8ycov4w5Cnr32cRpAT8nKhF1e3aW7QHjkt367IBJbF2
	biLkHpg5W+iEbanzn1WiefZ4IEf5JxLUmqMZgKGpULhC7h3LfOymfGlGZ8xjorHwvvFM=
X-Gm-Gg: AYBFou39QVGfqQilp0RTLua3KFdfNVva8bCW6hQ0IiPuOzriOn6z5+9AZMfoSmTnG/O
	+pCHj0njqwrEcmxtaxc8Wwc1QHKP0K5TNib2kqw+de04WhIT77YusyKxFStZjDYCVzF3y/KkxKd
	jyX2q6t96LidIfnZ7pgWtt+bquM8e4uk0bh/93r75335px2IoDzJO/DVrU/lG/W5permhgYjdxO
	Rxb27nvegPNxjsX368pn5ZluAh5ZtYd29pJw+GYIKKPgVm/xmBAbREs8x0OlAYRrfT1vp3FuStE
	IQCKykBkcCjRbTgD89plR6SSRuDVAvt1V57US9yb/YRjs3dMsWDfjJuVjHcR9E3IyFMFLjSYWz+
	ly4kz4O4HZvHuMbH+aTTqO0/zv59zV6Hl
X-Received: by 2002:a17:90b:3bc5:b0:39d:f259:3363 with SMTP id 98e67ed59e1d1-39df25936c1mr10712050a91.12.1789455266947;
        Mon, 14 Sep 2026 23:54:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3bc5:b0:39d:f259:3363 with SMTP id 98e67ed59e1d1-39df25936c1mr10711949a91.12.1789455266021;
        Mon, 14 Sep 2026 23:54:26 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfda39eb4sm3249725a91.8.2026.09.14.23.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:54:25 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 14:54:12 +0800
Subject: [PATCH v7 1/3] dt-bindings: media: i2c: og0ve1b: Add OmniVision
 OG0VA1B camera sensor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-og0va1b-v7-1-3a4b6d7360ec@oss.qualcomm.com>
References: <20260915-og0va1b-v7-0-3a4b6d7360ec@oss.qualcomm.com>
In-Reply-To: <20260915-og0va1b-v7-0-3a4b6d7360ec@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789455258; l=2177;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=TcAXQjm3y4bxY72fFI+XTJk2M6ZXHTIsdSnWHX2Ufxk=;
 b=Gj8CFjJjQ++eeq8C5oAIN/m8Xam3tLFgV29USjOmkdC84ujQ2hXs7aR/MuWjO+zQaL6acipuS
 w7u+2MsaIHvBpCKgnWUsrq9NBjLYmxFCEQVLrdvS7j0j1N2/zqZ1kJQ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=G+KJgNk5 c=1 sm=1 tr=0 ts=6aa8eba8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=XYAwZIGsAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=M65GHGH_L51Dv4RaLaoA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA5NyBTYWx0ZWRfX5/4u1tLwHE9g
 FePYRnJl/SB+2s2iXv65cc203MRONzprxNfhdq4W/V0FgpLnXTdkAlbLe54/fsIjZdNkLCPk1g1
 aVnAGAmPBGfPLXcfxDLwBOmBMy7XI1m89K+ZhZkxIqcVE2pm8jLwh8lsshnSq36BSXxBc1ecmCF
 zBVQv8UHcX6DODJ6Z3zCTsfUJbTU9XAbVyEMSUIk++XhgIGd/emHqNj3Zuz/c09ATa1GP/od3mF
 xbZxfPfnmiWBqZ1dbnpnA3X43HKp+kc0BiQdn5/ZRrf0IGae5ZfIrkB58pPgqWgh8by42K++2M7
 Pmu30MtyZfXzifr7rEKkaMV2QnPLR+o2sK7lTg4q2R8WcP+2N1IrKnxVGW0URk0BJeXc4Jqh0yJ
 SSoCq4zSX6B+BPxqbMs7ePU4ZqV2wAXmooIfbDjHN7t83g3+naqBLxRcZ5LWHcPVogUtK/n72Lf
 4YhMr75topWTG8gwjvg==
X-Proofpoint-GUID: or63nal9Iaz9NviDAx8m6wqf9EWf98io
X-Proofpoint-ORIG-GUID: or63nal9Iaz9NviDAx8m6wqf9EWf98io
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA5NyBTYWx0ZWRfXzKGR+VuUOZY9
 WmMnOWy2q8CsCWsBncTFIN7Rvangb6lzwr3LYPimmLktLzfdDsFUVFBF+kTpn20ZTQpOD5seWyw
 Vx4X4sNUzNR3u1q79HgLgVhok5DLaVs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150097

The OmniVision OG0VA1B is a monochrome image sensor closely related to
the already supported OG0VE1B. It shares the same SCCB control
interface, power supplies and MIPI D-PHY description, but differs in
its chip ID, register programming and output format.

Generalise the binding title and description to cover both sensors.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 .../devicetree/bindings/media/i2c/ovti,og0ve1b.yaml       | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
index bd2f1ae23e6547032361924a6953000bab1129df..b6fa9645c7c6cb3fa907478684d02b01d916fea1 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
@@ -4,14 +4,13 @@
 $id: http://devicetree.org/schemas/media/i2c/ovti,og0ve1b.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: OmniVision OG0VE1B Image Sensor
+title: OmniVision OG0VA1B and OG0VE1B Image Sensors
 
 description:
-  OmniVision OG0VE1B image sensor is a low power consuming monochrome
-  image sensor. The sensor is controlled over a serial camera control
-  bus protocol (SCCB), the widest supported image size is 640x480 at
-  120 frames per second rate, data output format is 8/10-bit RAW
-  transferred over one-lane MIPI D-PHY at up to 800 Mbps.
+  OmniVision OG0VA1B and OG0VE1B are low power consuming monochrome image
+  sensors. The sensors are controlled over a serial camera control bus
+  protocol (SCCB), the widest supported image size is 640x480, data output
+  format is 8/10-bit RAW transferred over one-lane MIPI D-PHY.
 
 maintainers:
   - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
@@ -21,7 +20,9 @@ allOf:
 
 properties:
   compatible:
-    const: ovti,og0ve1b
+    enum:
+      - ovti,og0va1b
+      - ovti,og0ve1b
 
   reg:
     maxItems: 1

-- 
2.34.1

