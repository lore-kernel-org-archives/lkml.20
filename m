Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CCB233929;
	Thu, 17 Sep 2026 08:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632397; cv=none; b=eKBZB2Y/7WirrV6PPz6bpvfoQaLscD/jSn4xJHGUxyVoFnRIllb6nuLAoQ/88dsDPlpkYz1pdzJd3G8NIRihyoE0O7+rWcPqXRcg0Lb7O14gSQuOGQHoWwKSwCFI1gWPbaX4lqrIL5+wvpnGi5mk4nXvVMqbWaL3aq1Fms3b7Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632397; c=relaxed/simple;
	bh=fqo8gm+019yK2fDOK8QTXcn7yDZrLVdxkB0gsooJVWU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Oc9+XG/nQpf4j4m5khmDb04VqAuFNC//iQlI/8fwRhQP+dCOFm/gGYt1zl/7DQoOnMfgLqdIoqsWljRG/MuvPOUvMytLzmrnDotdloC+VGTUxWwVWuL65VE2GwErgfGjx6twWbCuZvUdYb4Vc5QVb7l49Xib2p01fGYquKoZ1uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvtATqvS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvtATqvS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60sBa1031543;
	Thu, 17 Sep 2026 08:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mgyaIekK9JpKqTtbgFAM34v0fKjmoY4G4/4
	neLEAoRo=; b=DvtATqvSpEPfiQpWuyTQxntNpKK83RsLl8OnLhbRbuFzxnpVD35
	CgzJeusPZrFtIQTV9OBQn4mNUH2ZBJQWLDs38nJ7crPFz2oh/iCxN13VZPf7eV/f
	Q7RpKLpPST2r9Wx1WBgo7F57P7xDIXPbmuANpiTbHNrHmYDWT0xlX6dXH1tX3OA5
	UlfGtMo5N08/9rjzYhNCH3LlE+YPzOaEZMpM6K5Ni6fgA7Alwc5VqweyEFq47QEC
	cy3fgg7nYCJFd2/TBXdgKqzCXI8HMOyPgvai+JYSJ3ZBGXDBCBFFkVXnE3vjZ5qX
	c7tWm2WjUozo6tvCVVfWjgrWqOMLECZ3dng==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy7hb6jc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 08:06:29 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68H86Qfx1712615;
	Thu, 17 Sep 2026 08:06:26 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.101.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 68H86PKh1712602
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 08:06:25 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2342877)
	id D287B648; Thu, 17 Sep 2026 13:36:24 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: vkoul@kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, mani@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH V3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy: Add QMP UFS PHY compatible for Maili
Date: Thu, 17 Sep 2026 13:36:22 +0530
Message-Id: <20260917080622.824253-1-nitin.rawat@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEwOSBTYWx0ZWRfX2SEO/Py5hus7
 OD8PqQn7jjFdXN/ny09QWpQEzpCZGAFTmep0CscX/gKCwCbH/48zYDB7Ob3ljA5zydqgpovTW9v
 1bRFvP4SNXmYnZII5293O1mCk2c01K9np0+Lo2R0U//6G26RRByNO+9p6DmvpOEFXbRuvF41DC3
 ibdW3EVm13JB6Po+ETykikzFitgIj4urcf54Y/72hpg5voJ/sSwQJc/SVwwYdwjV1E32RRSh57L
 VxFrkur4ZfKnIlGKQoyz14jnBfGqOoKGK2d+35wwtjicXaKqJhN8vo3r+G5m4m9VSruBO4yX1xv
 L+TOz9Nw51QjLDP8m2Mu/L9oY0GbxdxFZdDO84HW0BvcFtBtg07llnw2D4FpzZx5Whg6g+2MxjM
 dCt4yZnBYytUV8jWjXzr888+w/130CTz+atA4yq79gHdX9SA9xYmRUAniu3vNFDWx93UQ2Bu7wk
 9WkBwdkvU7cxshNWgNg==
X-Authority-Analysis: v=2.4 cv=L8aI0OT8 c=1 sm=1 tr=0 ts=6aab9f85 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=UH2bE8EBJgXlDjawRugA:9
X-Proofpoint-GUID: Jl19jelWa-OXCnfRLrHGcCF5NJfZgXOJ
X-Proofpoint-ORIG-GUID: Jl19jelWa-OXCnfRLrHGcCF5NJfZgXOJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEwOSBTYWx0ZWRfX4KVBusxPfJGE
 lQIdht3yThQcZAwV/7bjbLX8IajC/VrnHDC2N62S5+BrKOgPe6zMwWehlfCrKelfaMtAfOSengt
 23ei5QiDe7zzFQU973vF8Eoqx9yBB9Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1011 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170109

Document the QMP UFS PHY compatible for Qualcomm Maili to support
physical layer functionality for UFS found on the SoC. Use fallback to
indicate the compatibility of the QMP UFS PHY on the Maili with that on
the Hawi.

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
---
Change from V2:
1. Addressed Mani's comment and dropped Jingyi's s-o-b tag.

Change from V1:
1. Fixed Signed-off-by chain order.
---
 .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
index 4efe40c0dc97..eb289c09906a 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
@@ -16,6 +16,10 @@ description:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - qcom,maili-qmp-ufs-phy
+          - const: qcom,hawi-qmp-ufs-phy
       - items:
           - enum:
               - qcom,qcs8300-qmp-ufs-phy
--
2.34.1

