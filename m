Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB61494A18
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455083; cv=none; b=go8zXHMUh5d9zrgCJ1PqsVwY59usNoT/Uh+zLX4LORa16PVCyCbQ0kQrYFA836asHnu/av4FwwHKCx0VheTocT7yKWxaos2nUBAwXXaLT/kLfNdR148fYXC0+ZkRcLdN372QDZlRSfGO3bEU0MGwVdUNSQOJIUMWSq+2LUDAXqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455083; c=relaxed/simple;
	bh=OubOLUD+VK3Jfwsa8xr6CTu9hQMWiPmJmFku/RuEHVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aumeutCIvTUMuvKSNDfeaCrUImbxV2EnRuLCAGJXUOOT4i5xUGWYJ4+ZYLsE0osMDGMk8QSv9A/PYHUtgWVoF3FlHlFNU41T3jAaxOt1GbYaMJLqaFDY2fwqGWJSKFf5mUyj6pJmT5pa3qYLbi8T8q/PRKuEPcKJW7NOIwJ2qR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzhFO8oH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuS0KWVa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzhFO8oH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TuS0KWVa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K1Sx1341629
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:24:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q6OZXAYBOto1MDL0E50xAmraTgP3CUO6T9Fe2JVUsBE=; b=nzhFO8oHld4oRP7n
	/Qkdlr+F/JLuGYFmi5b60hcFPr06wC3vlgvEngOHZFP3NgPHb1VSs6PIj/bnxtbN
	avrWus8Sbl4Q9KZAGiYcLHqqg9WCNzSb4cnumnAdwrHuDS7m1DHgMwsU6oTwLaZx
	qn9xnrHKW4Nf761AwX/0ZDCKRhHByYuEjYhkWytvOieUbm74YZ6EFYVdHmmUbZmf
	A4DOSRaxqQ9rYOlmdwH98FyeYT/q8z8nkJDl55OCrKRb5w+6BvPiNk+WobHmFexi
	AnmsH2nM5JllceCw+hcVSI+3KC73absFVe+Al5EIJ5cuke5y2MCTGK5Wm4XocVNe
	eCvtEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2ten7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:24:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e80f7acc67so4647235ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455081; x=1792059881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q6OZXAYBOto1MDL0E50xAmraTgP3CUO6T9Fe2JVUsBE=;
        b=TuS0KWVaca1KdsFRFZj+hrNLpNjauWRXiDQ49i7Kf9reCLR8OFvx1Gp5nK/0AAlb38
         Le0DiBiA9Uv18/Mc3TkcpaMc1xe6H049/tadZuOoy+JKaRL5bVYmiRr+qVUaK0gQzOBO
         4yx9QwWbMo9BszGSAi1c+ICoOfzdeb3yyTZaiM4vYQXEO4/p1KU/9TU5aKxp30K7n0se
         2wK9NkXvMQbYqw9OjwQMyV//OmIuFSPp7TcO+6HlaO1kNR+hkHNFKGKaS5TFd+BUZ4pF
         AOtCFgl2+kz4MPkfmIcJkUj+bk7yRSkY6NS2Af+DMyku1NjWIruhD6ilBZi46G47uopv
         z71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455081; x=1792059881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6OZXAYBOto1MDL0E50xAmraTgP3CUO6T9Fe2JVUsBE=;
        b=byL4QJt613Q+vAK5sjqSs7D5/k4kU7yg/MshdOO6NIj20VFrxYBYC1pOpgQwBp/aF5
         htRT1mAiWvkhAAdTBASe73L8incP8vNjzZudr0HwKHFFyv4VRo36hdIyQSaHzdLWorYs
         gN0ghMeQbbGjHKUZrhkXbMsM+r82n0FAsv1/F6g9krponiRMnJWWan06qQVxVoHRGdRJ
         RDLoLQ3s/l3HR6Xarog95lmqrxxtXCS2yzpwE9HvNwmWEIccPo50gd2HJbZLLP/MUi3D
         52TS1p0Lk7LbxC8xf745Vo7Rvq53KMbo+w+9ug35wdqpxEfE3+6nRHCNLxSOW4ri0nT1
         UYNA==
X-Forwarded-Encrypted: i=1; AKwUvByBTDCoPWDnGaXgJkV2k8Yrj/oojPEweU/1Pk0IB9D/nj6P+MaAhoEl8tSJBTD8/qhO2eVb6AVWrrMFzt4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZYejWYDqPgE8sPFrf8kyuYhevag5uTXwrwF6rhfLTsKbHNQh+
	21LIGgntZ1phrpVHs9gYQR5EpGbAN3/U3CUeUm3pxy2lO833gLS5VXyPWJg3u0/yRypKnw6XjGm
	IjTAydMS6X+x1MPM13zuNcds0xgkjAaymiPHU6gleXNUEqmXGhbAKO3AiA79Ujk2lT2o=
X-Gm-Gg: AYBFou3lM2XU9QPVACRcv+AUz/Ap0RVJ+pEkRgLCOQhAq09R5+ACqNlJHOmuB4wEhi4
	6YLGHjhYQowOE3alCs8K19N6dBTyjEaAp4Crcsq1qjw/WNSB6E8spc+AEogiCHgzs5quuq/KVPB
	naq425gJvcbvaw+c5uT+FKWj0svbDHAF56CAmvSSq9jOOAzIQI2ixzqgFu4UhMQs3bFlT/osyWn
	RRXJnYvpi/XnQxP7fMH89/Ek3U1aavolo7wl7CQNiH9WLpNRNMe2sxAyEXzJhUSYW83J2x5OstM
	cpBlOl+Mbk2rSwb5x2xpl0/1BkDojcwZbz4fhnnmDTV3Ngcn5uNA7ASea8A5d/cTr7iZSHIu/SZ
	MxOOrguHTumfGHRM45YuUGNo8B4kkdwVsHrgMWbiDQ7FedILlnHRiHaIlLSH26NFICTBsupTYBL
	PxxkKe7aG0Y0RDML2hzN6rFg==
X-Received: by 2002:a17:903:906:b0:2d9:520c:38e7 with SMTP id d9443c01a7336-2e5ffaa4eacmr41921515ad.1.1791455081309;
        Thu, 08 Oct 2026 03:24:41 -0700 (PDT)
X-Received: by 2002:a17:903:906:b0:2d9:520c:38e7 with SMTP id d9443c01a7336-2e5ffaa4eacmr41920475ad.1.1791455077540;
        Thu, 08 Oct 2026 03:24:37 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:37 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:03 +0530
Subject: [PATCH ath-next 07/17] wifi: ath12k: Add hybrid_bus_type in
 ath12k_hw_params
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-7-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX/k4S8zYVoy1m
 vN9cTxWmGldNh8j/7Y8dOgcryj7wilau+A7rZ9rQN1t9e0f3A4jQt860/Vwt3CRlB9JMOY+Gdc3
 GG4Nv99/G6Dunp1c89VjkaN0mBWhafc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX3eLTgnS4e00L
 hlKPWay8ELBi2wjpcYypIokFxXf4fPlvi9tPYSWwPlufRwEcwG+aL6wEIzAc1v6/T6x9d+jWAEW
 KyMo5xb9A8+qCDw5QLa5XTx5QDOD7SeyYMIX5E8ceBu5krbnby0mZ5T2CKHzdFJ7wZJhooptEDO
 0ZinOuVwcDViQbD3NJPNr2LlC8Vs03PCAMr0In32T9SAQ3tiabf6d5VISLmsLi8RaqJvrleqDNu
 VbvGc6tWSH33n7pV4Xyc6YlVUM64mB5sjLuX8/eOXJYNdhbnyKMnGXk5FAfoNKYMV52MkPx/89l
 ZLm3XwpXizQlJ8ZNS5cgQH5lJ9vHBN9uxYjRBVLJ3Lom5PFFBaxA6Y7MAlQSHbqAoE+/tcrhkKB
 z19SMG1hb27v01PJnpuAXdcetnLX878YIEP9Y4b4XZcBWTWcZLUBXswz1clcl5LBQf+S3L7RvOI
 Zckmj7sIGOv0B9v5gpA==
X-Proofpoint-ORIG-GUID: b10ArhbPdM2z9GhCFUqeT4TOCn_K4gQu
X-Proofpoint-GUID: b10ArhbPdM2z9GhCFUqeT4TOCn_K4gQu
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac76f69 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pcKkHHuJ4FrcyiHCkkIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

QCN6432 is a PCIe-based device attached to the WCSS Q6 processor,
but it is registered as a platform (AHB) device. It uses AHB APIs
for probe and boot. Because of this hybrid nature, it is called as
a hybrid bus device.

Introduce a hybrid_bus_type field in ath12k_hw_params to indicate the
hybrid nature of the device.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/hw.h       | 6 ++++++
 drivers/net/wireless/ath/ath12k/wifi7/hw.c | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/hw.h b/drivers/net/wireless/ath/ath12k/hw.h
index 2e585a42dd9b..84b9440b2c16 100644
--- a/drivers/net/wireless/ath/ath12k/hw.h
+++ b/drivers/net/wireless/ath/ath12k/hw.h
@@ -239,6 +239,12 @@ struct ath12k_hw_params {
 	} client;
 
 	bool host_alloc_ml_id;
+	/*
+	 * True for devices with PCIe hardware registered as AHB platform devices.
+	 * Such devices use AHB APIs for probe/boot but PCIe APIs for operation.
+	 * Example: QCN6432 (PCIe device attached to Q6, registered as AHB).
+	 */
+	bool hybrid_bus_type;
 };
 
 struct ath12k_hw_ops {
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
index 408844024dd6..f91279477a20 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
@@ -497,6 +497,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "wcn7850 hw2.0",
@@ -592,6 +593,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn9274 hw2.0",
@@ -683,6 +685,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5332 hw1.0",
@@ -768,6 +771,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcc2072 hw1.0",
@@ -864,6 +868,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = false,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "ipq5424 hw1.0",
@@ -952,6 +957,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = false,
 	},
 	{
 		.name = "qcn6432 hw1.0",
@@ -1036,6 +1042,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
 		},
 
 		.host_alloc_ml_id = true,
+		.hybrid_bus_type = true,
 	},
 };
 

-- 
2.34.1

