Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3953AD50D
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325406; cv=none; b=oucAG3EACQrffyUsQDxd/fhVwGXfGicxl/NCg3vsCwh6mZLJdx6K+aUp4jFjHI8S7cK3oPorbJcP18cvGKIPIlXPrfAw6Gj6sQHTgmPyJRXrIGCtWrRxByaE/MPrCn0joNF4YF0Af9ldK2o3wDsvjiUMDa0ikJfd79PRXG9tNKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325406; c=relaxed/simple;
	bh=qp0eeFSkW9qr12mPAr9R15JuDe58PZTGuiwGGGcfu88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gVx/Z5lTELh//rICNC87QrWc/fpOZDWb+n/i6gi4uzIcxryV6qQfZfolBvBVYkLI7DHuoXw8ic8oBYebogWLADYTWOdlN3qELQUYIyx8F2tEBcMaKLNExFDBTYVf9bTpnQWir/WjD2T5qgEml2ZzK2Y9N1wyg7b9wXhQYIqaNRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2UDWIFh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYu3bKP4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2UDWIFh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYu3bKP4"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI45vF2982338
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	782d8vA5qKhzXjsmtq848zNPg/gGyTeOCElg/IKXtGs=; b=m2UDWIFhOjm+Id5+
	2aKWySIYLUdIGILBkxQu9OVYcryJbSWq2gLhzcCWIzgkFo7qz2OQxmg39wn/u4Xg
	V0gpbpSmC1ov/qeiM+Ih1g5Y+deCzCcw4TD+5dF8S9s8FUB2BnxkhCIU4vqnp/Rk
	Ife+WiOTstQFzn+yHv1W82kJuzejZvhqP/PvtMg6AsJxJ1ElA5Wjl98zlHiHGUJn
	YnDc4T4FNsZRbpGmZuvUQnb02QPVG6/MkuaO/tKA1Gos2S+sZj5qW4sXjeYwveuf
	+Kz53DzdBUvhQekUvPoMnh+iRje8zDhsq81bBCS4APoJTLEgH2VAECY2Ds1xC8wz
	5cbFiw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dkxee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:50:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso5173921a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325402; x=1789930202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=782d8vA5qKhzXjsmtq848zNPg/gGyTeOCElg/IKXtGs=;
        b=LYu3bKP4y++/pibnEF+TqGVojZG/AKKygb33KACLBgabiTzBbvlOiVAmQBIRQy/Ijy
         mWJG4pJmtk1m6PoAM2+UcQ41r7xr7HbF1jK1+NroyaQSz90m439xgdYzAVycYpHPl2nH
         PlQHE1CElBmXUltRUU6gX9XPf38kY+Kzrlqazm05Gp0EAaQ7cyjx4eg9KYt5YOhe5zYQ
         ut38xUAejq7eUHFthkr/7Pxm6ipri+YhzmZIlzJbKhgFZZ+hRsWqAU4NUuN8OEOWCFlv
         0KBxgqNK0rT70B/EdpYhiVy+htG+4A/WKv1fWT5Za3A5KiXr0NdnH7CrI/wgqsZk/nXK
         k9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325402; x=1789930202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=782d8vA5qKhzXjsmtq848zNPg/gGyTeOCElg/IKXtGs=;
        b=kw2DsDaihDtUzJ38gkECZPqD2dCwmlOnI6uvDEr1HZ8Ds3CCiOLN/zkGqS1q9y+PXB
         BfXZ+Ynxqf18YQsmtIpurhvKqGIfQ8p3WpJZOUfy/IgPiILr6cUexL/BqtTP5w8u8TRX
         m0Lv6BYK+lit7gh+yVXUIyV0qgjr7upRYKrAklaqnA9xxh/BS49sGj+mqqkFwMIVlpmv
         o+qqqbYuzipX91ZNcSE3WzlCv+hq2IFsORRmc9+1fte0977bdG1iKxWCwukDAipO3Ffe
         xubOs0oEJjsrqXKJphbrKqbXoYltl3+25RLmsVtYu9UMrdsXcpM9qYzAByoU32mr7Mw5
         H6wA==
X-Forwarded-Encrypted: i=1; AKwUvBxhVtfSz0tAt8kcvIQHB2RSbTgopW9o+0fCxRQFTufqFpV00Rczt9E2YlSrzAGZtUl8+9LCdIrlXulFnU4=@vger.kernel.org
X-Gm-Message-State: AFuF++mFqaJXBf8b1w2g4gS7M38XE2qTgf4Dm20sIzcEh36V/u7vM3TO
	6M/MIOro1uP3TlPAbddV+gnS11+Wg+neR1dC+YPVve26xSza99YHD/tAHzbdzVQ282ipcPIqtTw
	IZpg8wsIku2FPKlKG5d5pLBIXkhuQvqPe4cvNdQmjcf5AuFLLq8vZNJTF0hgy6NDJXow=
X-Gm-Gg: AYBFou3S+s0tGEEEtTEp/OkOLcyO/Zc7f3UVk4TSW7UUxZtHKJ2Z8mGMtSiapBshPzs
	TXL7KkgCQp7/bh6PoiRzrjS36Lfz5UfDxmIbyzDB6wqBdoEIUoOwA9GO/IaZMdH8y9aEFsd+h/L
	/g+gSHi//djgR08u9mSSFQFGPXffz2V2oaPOHotEunKNxE5zh4WKgG+3B6mbPjzfna5E3jmjU9P
	BcgOxfxFTcH2ZxGJiCZ8YgRIL4dhHL2aqs1PJNkyGguieVA0wF4g0UkkOjvA/i4tag7NS9e+00W
	cM4dC9sia4/OLBPBUDlIRvkQ72zSfYA79B1lUmidufqlxdM1+7CFuKhFSiaUe2GPqrrOCWbLkZP
	w4Yjqa5yp8IDoZ5zwt+CIGDThh4MZHPMc97Y=
X-Received: by 2002:a17:90b:57e8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39d9c22762emr29007933a91.20.1789325401476;
        Sun, 13 Sep 2026 11:50:01 -0700 (PDT)
X-Received: by 2002:a17:90b:57e8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39d9c22762emr29007860a91.20.1789325401043;
        Sun, 13 Sep 2026 11:50:01 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:00 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:19 +0530
Subject: [PATCH v4 02/13] dt-bindings: media: qcom,sm8550-iris: Add context
 bank subnodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-2-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
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
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3706;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=qp0eeFSkW9qr12mPAr9R15JuDe58PZTGuiwGGGcfu88=;
 b=e3q/gARLkobKSIVL8IEYb1/H4SLP6nioe3uupeM+r9vAHJmujI9Vmw1i4Pn5seRY2EcbvlGKO
 0wrG7qrDmuoCw/T0vRWi1Szt39vWGCTfHJi+9qp4upYz8V7+goTvEiN
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: mGcWz7r0giylF5ICabmsNXJFVUz0xOI8
X-Proofpoint-ORIG-GUID: mGcWz7r0giylF5ICabmsNXJFVUz0xOI8
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa6f05a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX09MFyxyKFjul
 lNtDljzHep52SNVZupIg+sCECF3d2P99j+s1McGx2BZQLbw6ceNCS8IQ+xFOwBo1bEqE0rpo2/T
 QvWC6oFjyMSIbryvZ6FvU82Q/wsx2a8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX+Rgv+4Dlwz7b
 T74LhaC5iybZav48SBexeUPb85RgE8A03xff6KohfwYSQ690eyVHLBGDYATuHD2FuVpjN8JOevE
 gg1HaCdwH5gkATJDKt6vmmyo3dbg2EB3YpdvsYAdo+5vaCm1lIKhmWy2VSSCDcFtGgYWniozM0R
 oWcQFoMQDVrGjizE7iS54fO4ikM7LdybWIzI+WaH7HBZ1PuD7/5ZK9TJ5ZaSUzHSDwfRT03MOug
 aClxRxC7fsDIucEpZWzmuwEAOJYoVcR1yybVD9bt3Eje28QTX2Ea6IBMZwCIlLmiKIH89er1zFH
 UkCOk7HJquMhxrKAGLmSersxO8GOE4DduQCzboGDq7Fb2zA9qL7PVGVawXoBCD0AgFeBZWwXyrd
 3d1eUS7BH77KvNf4E7JeKKmJaaEPxZyQxpmrkLTT5AalMWPKrQ6nFBDfXjF92lgBjvHop2FDrda
 rpnA2VdtCTkirIJhd7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130267

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
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8550-iris.yaml     | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..6ee9d23554cffb30c92017ef99de15c2493455ac 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -98,10 +98,10 @@ required:
   - interconnect-names
   - resets
   - reset-names
-  - iommus
   - dma-coherent
 
 allOf:
+  - $ref: qcom,venus-common.yaml#
   - if:
       properties:
         compatible:
@@ -177,12 +177,23 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
         reset-names = "bus";
 
-        iommus = <&apps_smmu 0x1940 0x0000>,
-                 <&apps_smmu 0x1947 0x0000>;
         dma-coherent;
 
         operating-points-v2 = <&iris_opp_table>;
 
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xe0000000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0>;
+            iommu-ranges = <0x25800000 0xba800000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1947 0x0>;
+        };
+
         iris_opp_table: opp-table {
             compatible = "operating-points-v2";
 

-- 
2.34.1

