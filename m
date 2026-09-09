Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60137579801
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965959; cv=none; b=EWHSgng5xgyq2wCmvlz133nTl6QbLv6BWfMTX04yFZ57+Z+hV/5LXYor80Yz/zP9aS/7A+PtqJUoSWUBC23PSrGrHQXrZyqWFvydStU0kUwecVYyBVsrWwggZ4utpUtAS1oEzoDb8+thqHt2tIdsKQPww/OF0T5el77Mx83XSqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965959; c=relaxed/simple;
	bh=h2XojM5tefCf9ICzxKvMGK1x/tP3acL7PRQ2mqf0kt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GHBsPbrQ6Tt8UjSbkyS4mFdQ5MkVe45XrUb8cvWdW4dds9ycTuv6QJR2RT0NdIiTGQUU8ZP1JX/XZR4kOWKfsTnebZcJa1mjpOKpxKAj5OhKrzr9iXJ7jc/Vnu1zCz8ZiFY4Gz/9JmUPK5V/x4QWRsGwsW3dwKrtAmS4aDL+nXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cG76sAtg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q/GtJnjT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cG76sAtg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q/GtJnjT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUCUq1183802
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W9fTRtJ5G9UzjN4GJu0Gi6NH567IxpYmlV8JOuz/pKA=; b=cG76sAtg904gnYo7
	8h/mIbiYmC5fPv3UpMdgj89vPmE+bUwtIZiML2rkSVfGPjPmpTnJbc22GtI2QxiA
	82AKxv0f9EbwNeUE7YfoeEI0oNGO0VvD/nc5393QzREtHt+oPnG3MyGMVEqOtQIv
	HnteATK2u8jVJwIZCy3Co6jtXZjzNG7JHC+kIeA4Y5FvGzMK5bI12GPMErLqm/yU
	fAAlsCzOyjCy9TaozQlXxFlD/mv7gbjN8Wsnmw10co5VW4gHtUfaQWFMn9r385kZ
	hA9SQ1lxFii7Gx1J0dUyqLmZnN/ex8lPm8UptFEE/OhSYkVO6riNojURfHA/wH/4
	uJ622g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559s8nn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:59:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so12540591a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965955; x=1789570755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W9fTRtJ5G9UzjN4GJu0Gi6NH567IxpYmlV8JOuz/pKA=;
        b=Q/GtJnjTrm+Sy4N/hDrrtn5tcSpdYtl4sMIcDMOaveaqSuKcRty9nUXFN+/uzFvcJx
         1j1/sDJ2niSI2TpjurYkmGTRd9cdq3kohYYvzcX8UrG3uDAp/M6xnqQYhRDochHBmUQR
         1OrGRDKmm6yeRFjMefDMgn8HCT3GGpc5VU41NUyLX1epbBiPF1PSHncq+yXS8nV/lfJt
         yc2FpFUFH9bajk5Y029iaPZntQi9wQ63aW5rZw+boynHSmzkRA225jWa4U5MhijQtmLc
         ajT8PUrQ+B4l95IVv9DWt4PhCtSsLPVLbHfDC2RRAmx3m1WSJp7oB6fOfvI/9Uq/+ozU
         cPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965955; x=1789570755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9fTRtJ5G9UzjN4GJu0Gi6NH567IxpYmlV8JOuz/pKA=;
        b=RM87TccWLmOFtMF2DKLrfqXmvEXuqNcVHXl/PWptU7/ZIsID/zAYvTBt24yTdwpBTn
         /+5NLZ1ojxRxDGcqtGByHdTy8ZfUauk3dBf6t4uilPb1k9gciHMCKY7xuRZPQIWc1htv
         rBnSS1EiWnE2KBkEO8ueeo8vFPX0vuCItLYHA59Zq1xYxMdQuIOT9QbRj50ZMYrLEnHD
         1LPdQZc/NyJlnU1rqj6/srywPV5vJEzN7TNotXMvYcc6My9rDUn8cl35Zzx5fnRqXmoH
         Ix1m0cSSGHnNuRpIsyzr93r4p3bHTJWdzNvti9dqX0gpt7572Djue6MlPDqnisA90/O8
         h10Q==
X-Forwarded-Encrypted: i=1; AKwUvBxH74J7DCdsXx7Y8cyCgwmklUGLkmg9XDW6DdRfsrMEVZf0Q5peKj7ocL6+B8ZHHZxyrre5kLyHy0fBy8Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mj3ERQE/fMUCO2+RiCPo9mB000KpFDA5BYrTtxgbZgXsspIktz
	3GtWZ8fuhfMsIuu+pJ4KT69bUE//nOy+7UxEdX+sQEiPm7KLicuHEOhAwLgqVMgzRCPEV9N6kqt
	S5d5EsOF7de2bKAMf4n/zJa7B4ZOhAVOSeArmuoBUvmqNinPLedmrv/xJAQq3DlrTqCg=
X-Gm-Gg: AYBFou0PMWdRdYjSdKEn0QSo9dpLAEM9qdDg5YG0Zo1GSLRk2JM16qkiCqW+/xBvj1V
	KQ22WEw4tYhuObF+LVEBBO42eC+5BowkJvOlRk+xS6M8FhXGJZdqjNInb3qkM5/AmXxG96yrBuO
	wi9DBhuZVWh22kcR7j4dnliM4U23+71i4qxpTvGVhAPkE/Btt616XMgB4UpOn8H5CjaWIlC/KYm
	fflQEagvZpn/N0bPlxv4NIGTmYLxvvIMtlo/x2/uVgCx7AREwQ2hRe9r0Bd2f1uv7zB4QV2z8Kb
	2+2r61rnf1dPHKcYGCDF/NXoum6g8368OTLK1MlVS6CSAo1YjInYS3MoUWQgstj0650GjllEdJ5
	jed2pnancU4bqkA7DFsdChE39JHQEXfrr8Hk=
X-Received: by 2002:a17:90a:d647:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39b261074camr51452922a91.6.1788965955143;
        Wed, 09 Sep 2026 07:59:15 -0700 (PDT)
X-Received: by 2002:a17:90a:d647:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-39b261074camr51452855a91.6.1788965954599;
        Wed, 09 Sep 2026 07:59:14 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b608409sm51270766eec.21.2026.09.09.07.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:59:14 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 20:27:20 +0530
Subject: [PATCH v3 13/13] arm64: dts: qcom: sm8750: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-vpu_iommu_iova_handling-v3-13-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788965841; l=3606;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=h2XojM5tefCf9ICzxKvMGK1x/tP3acL7PRQ2mqf0kt0=;
 b=Kizq253lj7QjfHJcnZ7zy9OA4yO8Dh9a8KxZYx/V9gYA4sy2zQ1areBnDS5fsCu8+pwV2uVEA
 PJpTNoIXdMQAujK3uD8kMmy+UpOgKipk6Oe/Z7QuEv3nHDcQBS/VIZK
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa17444 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: DpuaDoga9pIiZlxWT0H3kvChIvekSdp_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX6vfY+dumK6eX
 yElfFzjT6ZzLklzD+GeKD6sR7twKj/IVb3/80HHD5MQ0ytKjBgdTNM+R6VHp8ixF04p5x5oS4BH
 mm/0r7jWdqQwmQZgupbUj7nnvRv4qTI=
X-Proofpoint-GUID: DpuaDoga9pIiZlxWT0H3kvChIvekSdp_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX83j4FvWAeXe1
 csoxQ+DuD+SbmYzMnT34jOXFLkUwSvEa55jYcvDyeVcqCQgtreXo0Utg+jwJMuUxfFoXFEPgsUr
 Lk8c0qu76sJAOSIBv0UYmQBZuJEuWe7bGN/7dSm7V/rJ2pzVWmspM/RYJTSwmijNLJ5Ei/TNw+u
 dBXsYKmje6qFelu1953XWezUy419EDdXqS4w/E05mlRVjsocFXVauRlO2reN6XLSwB//tohOAqj
 nJbS5R7mrVDOncEqTnSJppPJnsXxU79FCm/6ZI9BppmTX5EC/99VEq2ihr4x4DNyw4R2Pc/i03k
 euwEHbGL7VJIZKzkChYUqtrMUChhNPpU5pKDF04iZFIZ/oJ2pvfCh4dN0aKLgr54CLB52iWOfN+
 kMArFG0DB8VklFhrbpkf3c8/sFNKuIzm1Ht6O52Y2Jv7VU+R6GKkKAnVG2oJPRUcJzWRwBWyhtt
 ztJah3P0Ab73dw7md/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index eb3a6990ec30ba3ca1c3fe468ffdb4e9df00174d..206ac22cab2c0dfabc1ca5f619f598e4823776de 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3026,8 +3026,6 @@ iris: video-codec@aa00000 {
 				      "vcodec0_core_freerun";
 
 			dma-coherent;
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
@@ -3060,6 +3058,10 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "core",
 				      "vcodec0_core";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable in boards where the proper signed firmware
@@ -3067,6 +3069,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

