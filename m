Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720524;
	b=YVndfthPhtlCOl14tWUvZzA0XhxCga+raGrNu2x1f9Eu9KYL1TuodXOuOrSNvF+SfsxX
	 wg828GzZIG/zf+0wHDO0o+PZPUhZWShNuKN3nw8HeidbHMdoYL6qJZC7Gv94vxDxY/6Ih
	 Gb0vO8MQAsGW1yg2EW1CCubmzUr09ixa1kqaqtPBGs5KKoN2nLDWH0y70BeGB2QCeHB7j
	 pOzfVkFdvU20kp6y/I6W67fOqYn5kOSD3v8c64O6BJVMU9lEAGOa7NrjviHAL2FkJl9Yb
	 aiJd6Pz7KfW3DnadNVx272PRUntYhreGd60GZuAcGP807Kf7bcS+Xw1swmxI4jcHJxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=;
	b=OZhHEmGDCR1lC7dl1gh0bVbhQZbdn0sCAwSEytfyVzh9R4NUxBZ4JkAl0yzxaJ9xvT5v
	 XxaZ9dyllbxFFnJ1Bp2UtYbOmUjYguRjtSooxA7neScu9fsu1WlRrv3t5ajVY3UG159Lf
	 QcmbGKplFRKl+ANakDAHrqJ/v4IeM7w3pa4+FhieWmElLvlrW+WyghSXF5O+pdP6TXoj9
	 jpfDzf0708S15smjPlKZlsQGcIS9beNJkOXOJ/5IrxIjWGN/5mnQnkcRHdp8FHGsOwpxy
	 7QDVsSsBOGlYuhgdlrkJDSHOJa1m/qVdKzGgOm36cI4EYVLUfS3qMwvdrUNi2l/jM4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYWtzdo5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j7JwNDxX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B840606D807
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B840606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYWtzdo5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j7JwNDxX
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9xG54104440
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 15:42:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=; b=TYWtzdo5m+Wkafbd
	r7iRuI11kwmGXIeLRy0fD/CRCOkdOVI7KXngxO1AufAbA/yR+zURtnu8KW+bjNoY
	iblGYKm2zIlYWuochRQ0COJO7Yg14pJOgUu/9Y8GkwCGhnYMZj/N6oeeAIT9M3ki
	dLIgqZyL/mp0wNmvqd7z9bed/02qj0/7RXSWNnN7hdQT9sEGF3jD+QwKWSqAoDJ2
	WiEMmIQrWzp/LHrPoCKgs2Yu0KP5J99ULsPvPjDKDhr1PpLnXtXqn8h0YAD1IRhH
	bDQllzgTaPbxv5sdqTKHKPun7gOlokyVtg4FagsaL/9bo2WCYqyFd0SGsAO5fnL9
	51POXg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76daw1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:42:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c3c370b17so7055294eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720523; x=1794325323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=;
        b=j7JwNDxXNF+NQK7scVnvtXde63D/5vGblM5TQMjgp9EpLEIJtcGFXK+9xROQE6A638
         4gF/ubXHQNF02K6z4jS3EBgMiOYHFlNf+1T6uSp1tKNeZI7gGQnQHvE4mNrMGJBCmlt4
         ld/snuYlbQsZXzRDOKl6Nd/8NjNMOKL36kHf/PSavLR3P9s9XMaKDf3+S4oPoH+Eq95h
         T5eMDq6W47gVgaqoNPq7ntK7v7xBikxbDvrt0oDV2MQQFHHnh5LAdrhWNJLLV6BNL1Sb
         MznKZRW5Bm8Kn0TUVkioeXeZt6s3pGSlX6g93Z842aC0H62c0Y/5ZiZCFO0oWyut1KU0
         g1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720523; x=1794325323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=;
        b=WHG3oH2wdHcfmM9r/24H7aiGMQekgeYNwfPCNDrt/aLRXYrxt0lQjog4fwR7MW+EOP
         9bG/n+77O+/qizZx8xZOksx7F3GMIJP9zdHDatgGVWU0iZPrNk30uphPD+HCklz7LEHP
         oiNeXUmHWL0K3SdoLv+kuW4EDFYt6tDMpN+XDntzrESSfMTb9K2W8i4C8rVSIsMbrOCl
         KQNOi8HgFmzAGb4ftfBBCRzHgiWo9c6VEkdPUHQnSzAMtUVUnpfEW+SN4fmcDn3UMJEh
         SD6U2hruS8OdrDl1JOp5vc2WF5U/3j23CHrWi3l7N7uNDX4ca10KT81PBn9jRkOtd1tj
         Cndw==
X-Forwarded-Encrypted: i=1; AKwUvBw0srz1bDnSNH1yWQVjQG4fvqpIONJfK9CPgK3YuHL4Yi8COjKztR0kEqNmeqw0iR44144qQ5Y8wxLPtg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pUuqTQCMyn4XOVJsIz9kFy0qBU5i++wrpTSi7lV5Zuo7IRSyQ
	v6w5lNfYxxDc85sgNL4JBLCGqZOVCSDePAZ7TAFkNB9kf+S69pIsU0dSXNAtcSwngb2/AXk6qUY
	baFfqQONUBfwDvrTFzgwd0PkyCA1zV1Q4HJ7Mvz+pqK28JARQJu4JQ+5+8eG5dE/xt9iUDSjjT7
	Q=
X-Gm-Gg: AYBFou11aFDhcKqO7lQjfnvSFJ1Gz8marWoghHXygf/xNFh7Exrlx6D6ghU0WB/Odoj
	gmw3ZwjyeOJxEHxlO1XghgLaEC8ET2ZbD/PsDwhkTZ+SqxBI0xSd4WD0h+z+9UQMSHm6aXsVMpU
	KeAslSjDQoZgtQ+GXx7CezwQXxACG2/FlLCYH8yUmuiAJYSbIty+o4h4+6wZ9tByJlEhQZmXxVs
	ViGnYmlcXkmOAY0WXLZZMKc7784EWtdeAV3QBEgkkPwJZyYnKUfhVdQLvg+hRC8M3nkECrW9tWm
	PQ6wmdFrwM8MJfUgMA+2T07HBWUzR736tdEuBLchP3HospBtvHm7KnrD1lCLpFgxC+OlbTevlLC
	vC3+XSeTQhFCyp1mwIkKAJJKe7P0x25mvX81lUQi1tJNs7LMILF/YBnYKCGDtjwrKQ9pUTtPsDK
	fCbpTwP1qN
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr18969002c88.26.1793720522924;
        Tue, 03 Nov 2026 07:42:02 -0800 (PST)
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr18968954c88.26.1793720522366;
        Tue, 03 Nov 2026 07:42:02 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:42:01 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:39 +0530
Subject: [PATCH v6 08/12] arm64: dts: qcom: sm8550: Add Iris context bank
 subnodes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-vpu_iommu_iova_handling-v6-8-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=3423;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=TvEDrATTFZXUolN4JLbo1FGUxxzhhCTU57S+Iqt+3XY=;
 b=muFvx6SokZrG9kmmwt+swXlq6Pep9sBfIm6Gi1ogj72KnIwO+GykcNHOcHvSEVqOAMjXT4aoX
 5Uicd+B20epCY24mY45OXKuoyScn5B5KHddSxmm1oTUiusm1jt5oCAk
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6aea00cb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX94pKmHIvzJ/g
 o6aOUWwBWUtOIJe5eBF5iXjqlH5IL+G8q6XB8DJ7y80ZOW6Gu3u0iCR7q2/yZ4MgXPhV40DWKx/
 XqlapTmO2z2qrBGmsVtfw8ORPVXj+ng=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX6ZbTKDahwWzm
 ORLAQ6Uh9ARww5CcXfiAKgdVu5UA2buWW3o3sTGpxHSA0pC8BMRg29vR5mwLpkauqxWTtndPMDh
 2Qc4kBX1OGL9ZUgY5H9rJ7pyUC7I2qVcjJRqMtqolTp9keqjPvoeB5+ga5nrAQHLk3/uQdd8KDV
 SwSbwRuntswIdZhPBs6urvLg/nLt7198D+aOnvlqVSJ/w5zn93LbEwAPJygyIg++VROKd2xybEw
 Sl1bn5cX/tyJb/NG/h4Nv24ai9upFYI0OygJ/8Q4ewKteXEJdwGTm7vgGuxAfx7YiXlurfP1Loq
 4Tg/XY0Z19O4jfQBd0VhzzblUa/lqIR3cd2wdaiJujAFfmOiRmMXLOROuxRm+cSNqx+cF8xE8SL
 0V78QyRh+pzDCfTtRi9VQJj2BKp543cqrQfL440X8jRf0QZpjMkkc11KkAi7KyyLFVhjryjc+fW
 avJT4Bo0Wk5c18X/Qgw==
X-Proofpoint-GUID: 2-sJIAN9_oC98IxqXaRjikf0IpSXt50w
X-Proofpoint-ORIG-GUID: 2-sJIAN9_oC98IxqXaRjikf0IpSXt50w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030062

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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 03f6d40edea71821bd763ade144707bf8971b65b..f98f1c705fb3380f1d5f94ade217c0c0538ead0f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3707,8 +3707,6 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
 			/*
@@ -3718,6 +3716,19 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
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

