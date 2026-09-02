Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2E135BDA8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313166; cv=none; b=bDQPGyY/NFvJKFVLFtRE+3F/jq+gkPZNxr+vQWIixtPL0WIQ20eIEGYN0+LmckCE6+X1VrEdJ5o91MeBPqUwhrLXf8pkMIrAu0FAkOb0nKR//0YFA50L3ZhMzExV/HVvUPDDq/Xg7Cbpzv6LqvOQjYLYKxYJYNP4Fhk/mvUJIzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313166; c=relaxed/simple;
	bh=srdvK2Pwqt7zMSazM4WQ5PLFrgZu5u3U9HplZRiS3wA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IMqghQSQnIoU34vBagFHIvYWlrjAPYZdVc/MVawIMN8UY6ivpAsxg14uyW4KPwKxdWaQVEPgE19h97/3ity6SXSbLIxSD3zc5GNOtal265Doo+mD3ZYoM0UIDhQfmqednQ/nJHdy0jboImUflh9pi1aMkI0MGHpcsUsPLjGc2f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hgdSUzTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dmsPQs+8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hgdSUzTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dmsPQs+8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KThu63485789
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 01:39:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33
	yjHOgIFA=; b=hgdSUzTVcHhP4DlNZmc7x23iUVor0r8ac9MbSBElB9ce0iZrqEL
	NHtZE6l4w/FiRcUCzkSl5CyC02k1v4K0xCBDg0HirNay7EwBdyv5IrX4nuzs3GJ/
	fRtIBBrdqYBPBVK16IGf5Bf1i8PVSw/gu9AP7a241AJHOHnSgQ5fuSOuDBJRIBRQ
	BrxQemgYCJMW7XBkWoOBQktuDrkLu5Y+t0G3ubEtDzwSE1ldl6jMpHfDOMhwK8w0
	kmoCoiuDRz/Sx/UJtTf2vnXz69wVZMNFyLiyb2Kx31LzSa+CSWn2yk2lhBsSoLJj
	AxOA1MLrAe17HHm3RkkOKn7OM/Pw4g2TwLQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435sa8x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:39:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398e1fafe17so734193a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 18:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788313150; x=1788917950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33yjHOgIFA=;
        b=dmsPQs+8tvSYr0kT3C0EIPjGgjew9U0HCTGLDQFk89uNJ9yJYETBWteNmPtJZ6qkVv
         P5Mg9JgTnmo+0RsrGNlhxHkr2OB4SZ8HosmfVNhNM5mI0ZvAHH9JnqcQ/QnubHnRMl0M
         Oywl7JdjzWRWRQXEhOxTPPqVAD9KiKPjM5P+/D2OY8rrs8tl76MPST2NTY1+FUIrL8Sz
         DYpaXU+aEyp/RzB+4AL/zw1o4/dC+Vak+QyCavhl3bY85da6HiG/fzhtfZ7Zx4KoLr2i
         1epMNRr9ajs2Wn7S58RR3iPimKAihIRU9v9i9+EfSsHNgwsiQzBu9SS8RbzCfLMyrpM2
         /Jzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788313150; x=1788917950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ejjnz4o5DXG5PxCUge09LoByTrK+FdXEL33yjHOgIFA=;
        b=TtMETReiKksuiDZwTXrkTyH1cQQCaF6xjHTJdFDvRXgAci31ZS7zqGwYdVVLLzxMkD
         gEEPbhm6oZylqx/aSCkQx4J75tmzs+g68MSQF6iCcOJygtGPD6MHxa3Z3AiL8Rcc/Tm6
         dwAPtYh36uTcBGOrNfdKp1gCJwNc5Cl00j0aaov2pS6jUk9n7NZYFhlar/wBnhAyzlkn
         S1Hy4/7qVQEipY4qe/7Ysf+4xWk7HYRjVmiZLYpj7pvffNWC5ndrGoUghbWuhWXaaEWM
         DCOqlivDa+Q6GSLfeOrr2g3dzktJ2LApRTk7UUyKxAi5h04AisYh6B+O+QrChKdenpXz
         zaDA==
X-Forwarded-Encrypted: i=1; AKwUvBy/f+hIuxZHPsWZD3yQ1xu37PQcM8dZk9QU84ZGUyEBE5rd9iQhIaAETczz2aEKAVVZ3bKJ3bphFO4sv20=@vger.kernel.org
X-Gm-Message-State: AFuF++muMz4dVeRxscT431+2U7LZQx1Z+Ststs784cJuvb5vU8IlKWN4
	Bhi7HyjD+EmRsPaxQWD0GooC3GpSnP6M0NE0PRqnk/BEnK1RFCSaC4pKBOyZ1fbIaI/HPBURNvw
	aoVYhooTNo3tFiQgard/W7Vmn1nnShFhuO6fNfOVDHJ06U+lVOPXfJ6EuiJ5L/bdkBwU=
X-Gm-Gg: AYBFou2iK9CTvrNV3AV3Mc7yEN67Odz1kkyXmy8bakrnP93NqAM7BOas0Gu0vGBNLqL
	m8/IGrOxat4F9UUdDNS0ZubgrKZUSslQ/hFTQEvzQJyw644wC8bSQEpS2jwtU7hmI+GB8Pbnxuq
	vHOvLOFe9GAHK2IKfKNCqZ92D9WxU243LJYu97qwkB5AKFNbP4YReWtJBD6hDCs4wj2LC1ezrHg
	LXwCNqWGXUkRW2h0ZCUujGZN1hrWr/VUTP08ffU8NtUZOmcp5dD2IdXPkgpRWkJAfM2zce42LAE
	/4uUnV38gpyY71oy8Gj8/WFJZqTY8bJHxg1HRsrQ4l9KLkvF1/LZqlMvp9O/JaPkMy7aZlOMGxY
	BoDg1lZ5IBA/kYt3BxOEjbC0RdDl1EvB8fwJN68kxivllAEHPEAUbRqrG8WwZ
X-Received: by 2002:a17:90b:2705:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39aee084cd1mr1958097a91.13.1788313149613;
        Tue, 01 Sep 2026 18:39:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2705:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39aee084cd1mr1958006a91.13.1788313149121;
        Tue, 01 Sep 2026 18:39:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430e8c6fcbsm3140404c88.0.2026.09.01.18.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:39:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: Document Adreno SMMU for Nord SoC
Date: Wed,  2 Sep 2026 09:38:58 +0800
Message-ID: <20260902013858.130887-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAxMSBTYWx0ZWRfXwb26j1ZGL36U
 SdIXYq2AVdZaV+MZF4UXzsCL0u3qx9qnG9mVODDPeBjgz8OiUEpLqmQAXw759KbHRM+zTQEqkxw
 Vyune8zst+2MZyVsCtaWlMGwJRjEZak3CvXJAG6A/Pk6BnU+3WfJKjg6BFuBrRaRDipldYZD1WO
 erpBQ9VoVj6yLoIDswaKVhI+81aNeZ27zRzC/H5t2SFAFbWStTO/p4KmPR+u9anQJ/IxP87V/3W
 wyCGsg61eFX9PHjIXGe98S3DEfK1GUCJXvTWgg5+sD0vNskZERWfhW0GwE4OHdcC5PSxzRdjEbe
 Psm85s8sPHdGPxZJOLn0MUe1qqeTeaCgItzW1SU58Yd5d9KJkWOc/MvWDfZskp5gyl+0yRvqn0l
 e61IFWZLziTI9D0cdkSL91chlKvVfcsi9GnrKpCexFLVLHDpMNQ/SLhERi0qju1vZSY3fs4x3l+
 fflqQNmHNvHuRiWIFGQ==
X-Proofpoint-GUID: Pg-KCgxSKg4fLY1h6LHcs0cI80qInJKf
X-Proofpoint-ORIG-GUID: Pg-KCgxSKg4fLY1h6LHcs0cI80qInJKf
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a977e3e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAxMSBTYWx0ZWRfX6JM6udVqJjs2
 uUMhRgInhinu7nDlnUEshNPEPs9xsX1sS/wZStsW9/8mxYcdA/1FmK7Mi4u63tOMQKPdWYYXMGM
 miwcQtCovZ4PEAm3/h/1V3htlZoQmKU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020011

Add specific compatible string to document the GPU SMMU present on
Nord SoC, and constrain it to the single HLOS vote clock.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Add the missing HLOS vote clock constraint
- Link to v1: https://lore.kernel.org/all/20260901140816.74200-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ffa33b7f4a96..214a9c051588 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -102,6 +102,7 @@ properties:
               - qcom,hawi-smmu-500
               - qcom,kaanapali-smmu-500
               - qcom,milos-smmu-500
+              - qcom,nord-smmu-500
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
               - qcom,qcs8300-smmu-500
@@ -579,6 +580,7 @@ allOf:
                 - qcom,glymur-smmu-500
                 - qcom,hawi-smmu-500
                 - qcom,kaanapali-smmu-500
+                - qcom,nord-smmu-500
                 - qcom,sm8750-smmu-500
             - const: qcom,adreno-smmu
             - const: qcom,smmu-500
-- 
2.43.0

