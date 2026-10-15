Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7B951599A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061739; cv=none; b=Pp3Bc+ey4+yKuPkWY4B+hO+7eDSoTzZ4R2StalEsyOQG71wumOUQHhoAqfRAAR1fxZHgnpgcqZC5Kq76OmNlUJSTibsvxU4HknpPHzdrwCNnShV3H7mGsMdiCnknTFfan3CujLiXRfgqIY7r52E7z7ajuz0ccrvfNbipwnBtv34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061739; c=relaxed/simple;
	bh=Zuj0Mp5Z80P5Xe4Uv2Evzpt8jsUT1HsihC1ZLba1Ap8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gZ8HtS7PWRQ04FmDtsKZ9J+hpU2GJ3VjCRdnvMNMvqPNnClZSuWDfgtmghdzFKlqIUSejVT0Yruf3pvo3rP2C+qY/+9wKTZBXxCrEVWsjWBZkfZLvVG7CvfKiZoZPX/pliAvb8hbZc1PrDrl03V8uKBswlVV6ZaWhX84j6nBOFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z0C7Z0My; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kfcUbHUn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0C7Z0My";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kfcUbHUn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kELS2999155
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JwyFlz/ChE0rMDIH1WU3Ms
	Q60a3WnORnoupBPMHI0Hk=; b=Z0C7Z0MyMyX8Q0oAR65iBflkULmBYpO2HVpLaR
	xHr/BSFLuyvIRn7UyyWhaT9JQsY6f33yD0dAmZoDuX4qwLbmMzuyGzer7ESxy3aq
	JSp2KcaV9oKBj5D4huMN4rpTZwJd/5PLqwtbUdM/ZY2psPotWktMtuhxNpB4hP6a
	/nvh9v998GfJxE9vE/2sYeaOPm53ijpSjPqEuFgmxciawzUA2u7Y+HUbQOFPzrsq
	IvQ6w7saU+nrixqTI8goanAfaa/NQmuPpCjNoQuZGq6+OVA+iwT1KsQT7uzlCppO
	fQMZVqfJpHvh99PrdY+AgxX47lkWWe0vRhDhVUXg9OhW1ogA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0hw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:55:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-156b5338d4bso1861403c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061737; x=1792666537; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JwyFlz/ChE0rMDIH1WU3MsQ60a3WnORnoupBPMHI0Hk=;
        b=kfcUbHUnXROwd9A3w594JyhXGc9wjlG47sljGEO9czhVcbSeqaioQcmH5oUF4ehRkV
         v6FlUfjfXFu5ZPhQfcK0gagNAivJG0cdqeeT61pUakO4nspq+OStEMKFhSg9OS5zMVuF
         nivRmvBQxnTt+5Iw+6qjJVljd1YdlL4x6Ob36iCTbPgMIZm9SmhomoDWv793UtHMJ/NF
         5Ba99vaI4TMbPyKIGTdHxxo44KwQlaCyerzGdfSVCZizm5L/HxoK5585NwlaP86MpTqL
         yzg2P9zYQ4sTioQ2cvPMwqXzfP6RlHWv3Xb9/bfRFiykwXyK8fKPxRKJOfEDQ0l5/RJR
         nTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061737; x=1792666537;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JwyFlz/ChE0rMDIH1WU3MsQ60a3WnORnoupBPMHI0Hk=;
        b=UuONHxKNeUIrkwtmyLSZnDyGOn/SybXeRkSCX6w5HGl96Iv1oRsBCSVuiT5Mxc8k6X
         zCxrbhBnj4S2bpb+NM929xWH7VBU8TUEp/pM1eYpPW/dH04CDc+t6zJ0WizYk/3LycRZ
         yZhYBrEYt8PkBdsiUxLQcFhQ2Q9zevoVNBagmtuT3ZQ0iW8l21HK1iuiQBM+NIGNrmZo
         zSpE+wFLebRje8kNA/PNSedu5OiODdnQfg+/g7L6wqPdNSSVVh9arLJqV87vzV8jWdyv
         2zsT/0F2jwuCer+olIfZDtDje/ZdqrBJu84pZL7r48IGD/JbhVbont9Dry4lxaIcjiyx
         u45w==
X-Forwarded-Encrypted: i=1; AKwUvBwZtcrO9z5K9SVShKDSdN/p3evXelrSgR9GWGsEFXEy8x0dE4h9+EU6w5Rmz0wXPIZdzVyIymvltw8oyFM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJcb09QymGmLm3amJfI9a0BgEmUQQwmxOcVDvVzneURa++RnNL0
	p0dnpDQcqrXs9Fnnf5GMbmvrhew3Het+axeRG2Nch+skyGcpj1dpoFVYC0OWFnbPy5AyUrYbWns
	UAEZy1/GPC8SI4kswURrYC/dIuqHiFBjd61zgSnMq96UITJ0saYh6ADKTtGeo6T3txqc=
X-Gm-Gg: AYBFou2AXbKwqs2BGybAdm51hLLEOGElvWaVnoIJ0eu71Q6FxN7sNr95MEKWzl1BMyD
	cYqM/BR/DcVgPvsQ1V6ksVhlJaF7rmZCIv+gZi3b62PaRfx+nvPWjxiLQNeOPTUwz6jGVAKVFgV
	IjRrljAHr5XtUvbwCCx0Jk/6/TAedvFFu0/geVibbDye/JTBAadKV0QjrsIBbmDFA8VhrewV8F5
	8/tYY1gW3j2yA8XxzfDnznXB9uL4cyXIBmr08MrNX2mDkmw2MViHlifu/GR1h74nZxm+tC80B43
	JgckTLNyMcmuknlbME1sgAxLTJXOK2taCWGnpid4/VMhfoqOmcOJo87tPVqsEBYk2LfhCO3RWcz
	GXONIKp+YrIBNDs/n1qI2mI3GmmXBTtnSxecrRrWIsu0vasYqL1Fx4nAVBnXhoGaNSGloMtGEsn
	aAdj8xggmA1buYfUFh4CspuGAwQf0E
X-Received: by 2002:a05:701b:4503:10b0:158:7ea9:4a5c with SMTP id a92af1059eb24-16a60066981mr25230149c88.27.1792061736461;
        Thu, 15 Oct 2026 03:55:36 -0700 (PDT)
X-Received: by 2002:a05:701b:4503:10b0:158:7ea9:4a5c with SMTP id a92af1059eb24-16a60066981mr25230128c88.27.1792061735948;
        Thu, 15 Oct 2026 03:55:35 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm72352996eec.14.2026.10.15.03.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:55:35 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:25:28 +0530
Subject: [PATCH] dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB+x0GoC/y3MwQrCMBCE4VcJe3ahKUa0ryI9pHGie2gSk1QKp
 e9usB7/Yfg2KsiCQoPaKOMjRWJooU+K3MuGJ1geranv+ovutOGYEl+9MYB2t8l6as+U4WX9Kff
 x6Iz30rB6jDTZAnZxnqUOKmCt/AfPNO77Fxa+wcaGAAAA
X-Change-ID: 20261015-opp-8f55ee1c9baf
To: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: PjiyBapQB8Kef-Ejzr-WqEuL-jwP27e7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX45xC1ThV8XAM
 khhmPn5M7rs8RsbgoiT3liGpH2L9xkTttG2JIoJWAvtUTrIovVz0vODQZ+4zdMrurn/cSYMDkVt
 ZDW12sfHKkEwT6s3JQNLqTMuV9eAR5I28laH+M+pOOjKxtZPnnpO5odtfNpXn15LrqvcpigwX0r
 43zgYtvY6rLKD8EsVC7Gf4ACC/IC+rFjkqnyzUMoMOih4aDE1/FFjYMNIOfOmoe1gf047Nq2a6x
 Yym0YOIJJr6Wla++BI9vAxZOrTjgCWfe+nVYBraFUSVCSV4XZQkhROXygim7t60Woc/oRHdxJ+W
 h30ChOiaQg8Unhtk9ZgbfiOJhjty/CPzkDIrWsLAAXqsg71/BUUcMXJRwVtKcTJa8aiaXNfr3wl
 qhzq5lJ5kL1rU19Z1cWcTPR8ihLMerIIScntfVUoWy/6Dd8wFgz2lLGUaHsPG/9zZrkImUOb9PJ
 5rH58RmAQA4uUmDOlEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX4UcSsYmV/jVP
 7xRJ5t6nky3Wv1MnPuKaxpRjEdSuzcRH/qRcOi7zpEXL4Sha9FbkecFn1R1xNSwVhQP+sJTsSVH
 YrZETSKJFbVG8gCfoE5Hjv5Sbi4yPc8=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0b129 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hxkfFdRD5dxKw9vi-7wA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: PjiyBapQB8Kef-Ejzr-WqEuL-jwP27e7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

The OPP table node-name pattern also matches peripheral OPP tables on
supported SoCs. However, it only handles Qualcomm CPU and level OPP
compatibles, causing unevaluatedProperties errors for generic
operating-points-v2 tables.

Reference the generic OPP binding when compatible is operating-points-v2
so these tables are validated against the appropriate schema.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index 547265b8b118..fa9330cb3223 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -60,6 +60,13 @@ patternProperties:
         then:
           $ref: /schemas/opp/opp-v2-qcom-level.yaml#
 
+      - if:
+          properties:
+            compatible:
+              const: operating-points-v2
+        then:
+          $ref: /schemas/opp/opp-v2.yaml#
+
     unevaluatedProperties: false
 
 allOf:

---
base-commit: ab8eada9868faeee95f25d81d3d6fed0d1c98b78
change-id: 20261015-opp-8f55ee1c9baf

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

