Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A67240DFA7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239704; cv=none; b=mPUEcx+TPhlc3kQnvCgda142aVGN/05B9Pk4PIho6zSUxgAzvctZmtW9a9syKoOQISb88MHsWXWSqskVwubdodPeSK6GkPu52P2cU9I6mQo6quu7xnfQlGVSZ0KrjmD8b4+M5kTQBRAPzYu4igj0spo4CfoOm06V/9YXt57Pplk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239704; c=relaxed/simple;
	bh=qQTBA9T9acUcQeEQ5gZ0JrvsdsBqFS8qpGvRE4+lzoA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B22+JQkJtFSqvsPc9r9YtcSB69pSdkR+GMYZiKBvjEbOZJNliLgRrg/fRDamXehcPy7/ai3oxzAcZS2lG9L775MEmJPx9G6Mi5ygesky99Rpn/dAcFhsn5JfmtFCYLiwk5cxhGgf+CQ0Xl9IL/vV8odRtLlhc8lLMwTzZXQsv/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TCxVMpWx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iXuESt+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TCxVMpWx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iXuESt+4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eEt92420961
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:48:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=I6WecNsFULJ5CHmJg2m+E9mwTurGwtQ1TSS
	iTg/FTTc=; b=TCxVMpWxTtRm07egiUS7KY8d9e/54BYxDCWt5R/y+OgHlgIJMAc
	fxoJg1/8yRywWiXu5fs/kEW2tyxmFoo4V34X5CXAl28fDHBcuR2Tny4xzHOGPmoj
	8GXG1nz4mfMbSHnlp06xSyrsB3hGjL81QGR+9jh9Z2GQ2tH7hfRyaujdNzDfmH1d
	QIJgLCGqEO+BT7Sk2Rr4gF/LYF7ZmcHBJYanOxt+L9B/2cTBLbCxRKfhGNyzKyHL
	92bkd7IEvQ6oBeLLRuuW4J3FpcK1uoYZRqY4Nyd4a7Xn0mt7v4yCg7MXndmn8ZIt
	WDrSFGv9VLNtKCN866GDQWFy/qYAeyx634Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuhkj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:48:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so1496081c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790239701; x=1790844501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I6WecNsFULJ5CHmJg2m+E9mwTurGwtQ1TSSiTg/FTTc=;
        b=iXuESt+478ssztXt88xyRyPEJjkQAgT88Turu43x17dkqkBHWE4pUOQs8dUC7WLohA
         I0DWXmXYfcM80HYTEJ7Mz8miVJNtZaEEsa1+tt/w4eOP45XZ3DS/R7XnTRo0qMQsL5Jf
         unxzI+ct3yPE0ykAV8EoiSjPKLldKMJ3PwEoyoK9mrZj8Gw3/kQhFehrghi0AjAOWDP2
         n/Qdxcbf5dFNgOmpyc4EiVI8wOJMhVeUtxwGND4aK1nbKqRZg0aEbIxolqfE4eQj9OwI
         bI2FID7d8FN8EF9RU6HvPNZthydf3lO7b9ruqa7SbbTeumkPCRwwfxjWKnf0WF4ReG1F
         MRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239701; x=1790844501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6WecNsFULJ5CHmJg2m+E9mwTurGwtQ1TSSiTg/FTTc=;
        b=aQkSYF386PZQMdWRtDBq6PGd2c1T2TZ96ix3pdwXFTH6VuE2666DqNhPxgZ7xZYwn7
         qPbvVYMsKJWxtRbAhNWAWRW+Y48vKHGZGUW2vWv7trlWPK50qvbS6qZRO3K9DIpMGcS8
         5GVHzFu5sY5+Z9IMvH1WNyRyJ/GztuEfXnLLnsCDD9JvQyo5jk8QByh8/deIzYt6oD6H
         sAD/unIUZbDJbB42timJBote8UBZMCiyee1163W7LctFOvRyYLjlnuYB1DHFvI1aVyJC
         ngvMIuU8DieH7ftTRC/7zP2aUeoMN5dO8eLxitUiauwC+/j7Y1ZGXFye5iSVe3J+YrNx
         17wA==
X-Forwarded-Encrypted: i=1; AKwUvByaMavGkE5qm/s41XBQPEZxnEXMk5FL3/D2+acXbvUnb0+jMyb6Thf+pwk4kNN+kxsI6LtzUvhctouR8vY=@vger.kernel.org
X-Gm-Message-State: AFuF++ns1gs1kyb1GbvAm/dE8wjBpKknSBJJ2Ss7d/bXnZKDl0uTI3J9
	+JFpI0hx0Ko9po4rQvg5X5vEvEN8W8pSEvQK08DltwMfl7dUWDB4VYN94ZiUxdeFhUeXIi/psIg
	wsOwBlwqrpbG+IlB+t8/lqafXYAjnNxDnBYC7y+kQHvy7ShHnhTdULAYRWSfkePnoYt0=
X-Gm-Gg: AYBFou2JvZMCVLJ1LWrG7rxcljKl2NBI8Hyk5PSU27rWY4AsFRNfc50GJrbxfSGT4Pq
	WymdNYz/jkaFqNfcUN2BO+cba88KNTQuJisLFdHKmfzi8vUTYjJEMpheH7UhvfTSpgLZUzqvQTK
	ZcRJSmOUqlqBw43y3C3jzmCG1zsjJ4+hf0R0HqC69Jm3T0WxSw+x5RXl6f9bc1FbOC4RQgs0UCv
	PJFwQfzBcPbXCy0rOs59pwnXoWptxVdVHFkKJANKFd9ZloJ44hyi3bIbRLzLnsxBnlHBxPbpRMd
	dVP8/aJyQ5fg8WMKoxZoqFUE1L6aweBEpeGXr1PyAgq0XBjtMaY51FjZDiu9T0n3eRJOGOmwJm1
	iLak8aFV31rqfK9BflheWJerpdu0OwheQtzuw3r7769INK9awMNSgUnbVmAo=
X-Received: by 2002:a05:701b:2303:b0:145:7d6:6b4c with SMTP id a92af1059eb24-14507d67594mr461258c88.16.1790239700486;
        Thu, 24 Sep 2026 01:48:20 -0700 (PDT)
X-Received: by 2002:a05:701b:2303:b0:145:7d6:6b4c with SMTP id a92af1059eb24-14507d67594mr461231c88.16.1790239699621;
        Thu, 24 Sep 2026 01:48:19 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f949e51asm12512271c88.1.2026.09.24.01.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:48:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: nord: Add adreno SMMU nodes
Date: Thu, 24 Sep 2026 16:48:05 +0800
Message-ID: <20260924084805.1021758-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfXyjAGYKpMAFck
 kjKsjFzmFAHYWgmOIWwKdRQaty/qdAMGc0oZGPd3IXVLISSvOMl4rAL5ibBQDLxJfzBAso6v3+C
 djgKhx1vAwXk+sCbXdQBfWa7a1Myc7k=
X-Proofpoint-ORIG-GUID: FvqTnPO0PyZND1zGchBYVjO3rMCEzTtT
X-Proofpoint-GUID: FvqTnPO0PyZND1zGchBYVjO3rMCEzTtT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNiBTYWx0ZWRfX5ULF16gOrD0G
 gyKkimK6v+JukWCDhVmQ2KNIOG3LUVc/NVoR4vwzrTIejR10mW2ULnnOInQPtmrQmyFPjXXibqf
 u48XEuVrlHG/SVWaFQC4MgCiONpLoe4Gs4q4EwkWGJGK4rWmN/Ylfth1flSzXdZ4QFZ2dQ7Qpji
 HsT4hujsn+omZGJERX/QtRZEQvHU+W13MAVL3ybGLeD+Feu6dsX7xu/lCUf2jXcdQABAo67+HYw
 eSELTYX/Lz02NRTPqf7bd43sISXLXysBAa/CiGNtn8/LC37aaktcYRRgZbqmQQDo451RkwqlwFd
 bCZy+PCfteZB9yx9H8r95G4bGnhdF75VDXY5Wcz2WvAxouH5UMXPXJVqrqnXkme7OjCRG9jI0Fq
 cc4VNe6Cpt7lHRsGLR4qD/Bstk2qGR3Wjnrf2M48H740LDg4wWXQCVU5S9i4beZ+pDh+uTTwiIV
 h+1MpHCXe/rMZ22hnwA==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4e3d5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=isRZrch4oIImFiWRdXcA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240036

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU SMMMUs (MMU-500) for both GPU instances.

Wire up the gpucc clock and power domain on both adreno SMMU nodes in
nord-embedded.dtsi for embedded Nord variants where gpucc is available.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Dependencies:
- SMMU binding: https://lore.kernel.org/all/20260902013858.130887-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Fix adreno_smmu_0 interrupts, 673 -> 674 (Thanks Konrad!)
- Link to v1: https://lore.kernel.org/all/20260922111354.533902-1-shengchao.guo@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/nord.dtsi | 74 ++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index e0496fd40c30..376ae1604175 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1518,6 +1518,80 @@ tcsr: syscon@1f60000 {
 			reg = <0x0 0x01f60000 0x0 0xa0000>;
 		};
 
+		adreno_smmu_0: iommu@3da0000 {
+			compatible = "qcom,nord-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x03da0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
+		};
+
+		adreno_smmu_1: iommu@98a0000 {
+			compatible = "qcom,nord-smmu-500",
+				     "qcom,adreno-smmu",
+				     "qcom,smmu-500",
+				     "arm,mmu-500";
+			reg = <0x0 0x098a0000 0x0 0x40000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+			interrupts = <GIC_SPI 932 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 936 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 937 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 938 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 939 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 940 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 941 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 942 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 924 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 925 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 926 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 927 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 928 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 920 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 852 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 853 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 854 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 855 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 858 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 859 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0

