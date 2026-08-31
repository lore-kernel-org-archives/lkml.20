Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861151A262D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788157514; cv=none; b=Lue97p92eZ2ST6b5Yc4ZN6S45xiVy1gf9Tjz/ocu+SdPZvbEtEZ/WGQ1Ch+X+41D8uWMZ0ZE7RF8ghgAYHI6SiKl2zBJOm7tdCR0Cc5VTD+Z9VxspyEQAnZb83a9JvZzVE3Sn3K79cfPcjDW4dtspVvDVxNv3VTXGuibxq6sar8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788157514; c=relaxed/simple;
	bh=eHaooIe9fijaq4d5eAGZknZQ4gx0GVbvuDkAdxFPZJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GqknV7msn2G0SRQK3FCtN7pKnEIVLIVvRuSwOIMEbKu1iPopf2NtiYA3RTTjV5VgCWM5IUtMCqanuch9FdQ9UhAhSDM8yFFTvFVh7WkryhGRBTLCN57piPGq5n97xPz0J70/xpr/RckPrgmv47Qq19S8W9rtGNaAUu7uAd0AVbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YjSUdQM4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O/kmaEkk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YjSUdQM4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O/kmaEkk"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52VIY2617702
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6juFQN7B89zvS8ijt0JeAa
	HNdtu+E0yqcKN77EHc6FA=; b=YjSUdQM4vCA96F6RyNPJZmnb5OgUX1VwtHf4Ie
	DLptRa9hhKKl77OVdL2AYWo2jrf1hrng3lG9pfBIuyT+dQOFZ3VS1SuM98V41Fee
	IZ5gkZcuQZvxPQAQEoB6Q14z54XSeyC43ciJSxh5zeA4wrhjRdo3hUArLJUpef66
	fn/o13UiN1DDnzUdsCC75I12YFkzIAmO1WAKrl22niUSOU+1RfS3RELbAQRsnKK1
	ivMey+Ws/FQFTEY/EFezEZvsozTNiFM5j4oop7WO/E/5eQ9OiQaNlVZhAbIUdNiD
	sEqsZbnw3UWgGvT65WyAjqKzq5V8OPxGRjMcJa/gT2JnPkzA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2mv92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:25:12 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfca8558d2so39984415ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788157512; x=1788762312; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6juFQN7B89zvS8ijt0JeAaHNdtu+E0yqcKN77EHc6FA=;
        b=O/kmaEkksiYdv3zAUGr5ldGb/a/hlFmmGyHsvDq3cb1xg4+/aC86atyTJoW6ef86Rx
         JKHHFaIwAilpLSAuFOs+LBSFy+NQMO988NtSVZfYeOn0t80N+VWDjerp22ybUpWSOMwD
         U5Bifqy/E3qGjFB3yA18KhpQyBL9cWxHSXW3COl5YSODjNqS+dS4HaN6Xahdo5TSQd7E
         kLZnUouo1rKwCo0tB0jUbiFbgBBU2UBG219ySvN/f4hwROr9iXWttT/V0m/ljf2DPTf4
         QkS3K5u/bLb3ZSRzXQjVsjywIJcu2OCxowfH1aJ+kUio31Ks//On13mlee6kpW9ow2Iz
         S5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788157512; x=1788762312;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6juFQN7B89zvS8ijt0JeAaHNdtu+E0yqcKN77EHc6FA=;
        b=clGz18CVfEpdPuHa2eyi3xSgFo2bnp9S9Dg+5aC/x+WogoZQLTprT+s0Dr5rMg1Mlq
         xbpRojd0YZIl3IeUOTlw2kwQw0fzLnK16I09vDZIJLf2Iq7oEwQsGfD2SamF/I/Xax+G
         KukoR0ZeHMA+5tQdhShpR0nxnK3ugv/FCzfJMZE1STj/3BFqfwCVYZaezpnrUrDc1AcH
         lNEf47CxkLC3xrNOICbharfNOmlX1v1i9GGPrm+xXOUH+WhZTl6VLUC+PastG1yE4xeU
         XZZK4h/OobP6Bb1f7WuIZodz3sQyvRAFqhEoDkJayX3ABu0uPSduX57HTmO52BjWMwUK
         J1eA==
X-Forwarded-Encrypted: i=1; AHgh+RpRuaz8NVrS/JyaZzer/W4LDTez/QsB0YKLB17df+2YD7E5ZcfI8tRFlgh3TskZW7RlmQxWeQHTkeV5IIc=@vger.kernel.org
X-Gm-Message-State: AFuF++l84fmkyWtaeYLrOOE5L3gLCysWsnBcOesKkN0u/W181A+UEmG5
	NGgy6Gd0W+hjDGbvWYPUbIFoQYSZcCWS2+2E+mLfcO0y10W8aJgFJhwapSr6lKPtSY7+hbtDzm4
	pRLSxfPpcs2TPajdo4NvADHcv+o3FWdMtegtlj/7dXHoQmMpCzYUN939rx4VTGAXgJSs=
X-Gm-Gg: AR+sD116PLDLavyfvq7xhrOczN2iEIjs6OdC1hZCBCq1ZuSO9TXnVUP6wBlITuokzPg
	QBkcveBuxV3aMZKd3fW0WKmNkpicW8eBsHYgz7qVUtN61cEdQvp7e5MaQ5jNmqg4Y5Q2xQbwhjU
	r0PfZlFqtAGNAq9GmmHsSiaTjPQ5Y9h05bKTMskDe4TRKDJrndxZwPtSV0t7NcTia7tXydZq/Xy
	2Ug8Om2NYZa1fTHP2jRuw1WGe8FkvEFIKr+RImEupp0QClNR5yxlq4EJZSfCbo6wRpJJdfOyFqD
	vucFVv06lnkVwx2xbvOoXuWSpk9sPYgUVZ4T0qU8MHooB24w/vZ/cylF68LXAoezl5+QHCVxzXs
	eEH54b/S/KWn4guLjI6cPiK41ks7NLCnETR/S2A==
X-Received: by 2002:a17:903:19e5:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2d93636d111mr30661095ad.15.1788157512230;
        Sun, 30 Aug 2026 23:25:12 -0700 (PDT)
X-Received: by 2002:a17:903:19e5:b0:2d9:3636:d01a with SMTP id d9443c01a7336-2d93636d111mr30660215ad.15.1788157511696;
        Sun, 30 Aug 2026 23:25:11 -0700 (PDT)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a160sm26745643eec.18.2026.08.30.23.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:25:11 -0700 (PDT)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 11:55:01 +0530
Subject: [PATCH v2] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add Maili
 PCIe PHY compatibles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-vdev_phy_next-20260828-v2-1-08fe5dcd4b86@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADwelWoC/yWMTQqAIBQGrxJvnVD2Q3SViDD7rLex0BAjuntSy
 xmYucnDMTz12U0OgT3vNoHMM9KbsisEL4lJFrItuqoUYUGYju2aLOIpfi07oQy0MnMDPdeU4sP
 BcPzGw/g8L3EblA9oAAAA
X-Change-ID: 20260831-vdev_phy_next-20260828-afecafb5ecb4
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788157507; l=2568;
 i=vivek.pernamitta@oss.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=eHaooIe9fijaq4d5eAGZknZQ4gx0GVbvuDkAdxFPZJ8=;
 b=BlNjYw6tI2YPK+8dyV1JS/ecPHek3XVMzy34tt3S0kuQdZO3C/RKtVepS51A6mNhriCcthGsk
 AYPBkMuNPe9D9ud8HYeUg1ELdm+VrpPyGcWvf/yiWemC1aDVdCEM7nG
X-Developer-Key: i=vivek.pernamitta@oss.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-ORIG-GUID: PTorv0Bx_wB_hWKHZQisduDBsk86NOAX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA1MyBTYWx0ZWRfX70Ovf3VpTsrp
 Lw/atC4/pVGG/RQhDSBd3zrqP4KJ7HAVBy57uzLJU5DsO4OLuU9QZDRdVMEewU5b9vf+L8jgh3p
 6mEDtAN0nW5+WB5ZvvYms7x49CnSdRL9xmW/7FwAVnq+55nOawtU55QFKTYzVc/WWmpkB07JQGG
 1qXW1v3ZsEi3GJaziugABfIOEiGaca/6FbLhi2T00y8qC0HHIcwz8qyOmpRJrSSj1qNLJNTQ+Eh
 cSVjkWDDUNMeWVAON1PVRGAuaiuzJM7QwSjby6fthYqNa77tc2zEzOsoq5Ot5CaIlVfNFYAnq9k
 ouKyUMI7Ncf7Wqa8mkmAWiVTUO4V8LK0HpKP04xf8HnAfFrglW7Fj/Escq9JRJ2b0EB3X5JjxS+
 oUUZTfMyek6vmhiWWHoWRqf7yUXFn7YQTpSBicI6DPW++TPPL+xFlrDd+bEhh5whhCMo5c770P1
 K0StmcGLzbfD3I2wpXw==
X-Proofpoint-GUID: PTorv0Bx_wB_hWKHZQisduDBsk86NOAX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA1MyBTYWx0ZWRfXxGbhP5r41q8k
 E0SWvxFPEGKswS+oscR7m9qkr8wEbN5r2Jln0WMffXzGfy64Y2Fwq7Ewynv2CRwVr7gCIzPmbKV
 1t5LyEZ8SILgimUqKMZi2WUnpk851AQ=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a951e48 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IvnoF98jkOSEO0IU3sIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310053

Add qcom,maili-qmp-gen3x2-pcie-phy and qcom,maili-qmp-gen4x1-pcie-phy
compatible strings for the Maili SoC PCIe QMP PHY.

The Maili SoC is a derivative of Hawi and shares the same PCIe QMP PHY
architecture, allowing reuse of the existing Hawi PCIe PHY DT bindings.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
Changes in V2:
- Rebases to the latest code.
- PCIe controller dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe compatible
  change is already merged, so dropping change
V1 patch link: https://lore.kernel.org/all/e5516c61-44ea-4224-9da2-1694eac10fec@oss.qualcomm.com/
---

---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index b353b7bfb839ce9cc43ecd9ef96d174a7750b35b..701f0fc178220da5e3d2748330179c2193ff7418 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -23,6 +23,8 @@ properties:
       - qcom,hawi-qmp-gen3x2-pcie-phy
       - qcom,hawi-qmp-gen4x1-pcie-phy
       - qcom,kaanapali-qmp-gen3x2-pcie-phy
+      - qcom,maili-qmp-gen3x2-pcie-phy
+      - qcom,maili-qmp-gen4x1-pcie-phy
       - qcom,qcs615-qmp-gen3x1-pcie-phy
       - qcom,qcs8300-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
@@ -202,6 +204,8 @@ allOf:
               - qcom,glymur-qmp-gen5x4-pcie-phy
               - qcom,hawi-qmp-gen3x2-pcie-phy
               - qcom,hawi-qmp-gen4x1-pcie-phy
+              - qcom,maili-qmp-gen3x2-pcie-phy
+              - qcom,maili-qmp-gen4x1-pcie-phy
               - qcom,qcs8300-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
@@ -232,6 +236,8 @@ allOf:
               - qcom,hawi-qmp-gen3x2-pcie-phy
               - qcom,hawi-qmp-gen4x1-pcie-phy
               - qcom,kaanapali-qmp-gen3x2-pcie-phy
+              - qcom,maili-qmp-gen3x2-pcie-phy
+              - qcom,maili-qmp-gen4x1-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen4x2-pcie-phy
               - qcom,x1e80100-qmp-gen3x2-pcie-phy

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260831-vdev_phy_next-20260828-afecafb5ecb4

Best regards,
-- 
Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

