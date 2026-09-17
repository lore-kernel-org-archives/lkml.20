Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628034DD3CF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646100; cv=none; b=NqFg5sGYr3lCPImRwvOFOXuMp75DkDk79JjYd5WRtC0gc6L0GBeft2DjXx15ztLCI3WMY1hhnKhT+f+QdZ/5rEcILZwrCzF/U3jh2+lVxS98457dnH6J4YgajiwAHLmd8BQNHSDf0s41+wHQFhMVpzGF2RQo4qHZFGpbKhv6siQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646100; c=relaxed/simple;
	bh=PAXRXzls9pWtyh6XbNWJ//2jMSjeYQuXL8j0pgiVR5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QftqVDfGketbIvuI11gwDMl68QHQAiJWsNZ//9Y9fLnwXOE/xHX2++518v4OBDPh4tVoM3QSpQmmNMhdxrxQQTdeLlUDC9rN690St3P3/fFz7hHEctSRsaWiviWxFjAVammC6xTGPs3pBjN4v3s68YPQXFfwIfddZwkbBDTDtKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOyza4Wu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OWsqYqY1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOyza4Wu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OWsqYqY1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZsM24186761
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:54:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6RtNUfMgxoXfDzqtvXdPeO8LA/ihdenu1rUXtBUowK4=; b=gOyza4WufWIjVpw9
	wnosMDDlpqxrFEAIL/AI4NtoOUOxGfyTRd1f/HVsEt6phkgQfS43xjURITZ16zNS
	akrqYJjtPr0RauTuVeY1PKrwFdtAvVfBn8d3Z58zZV97rujDwAFRbPFRZibr8FyI
	4wdGcTif8jC9epSkdYB4swOXOt+Cj20/FXVvbhyiIZ/kQpMnI/8vDJ31IWrZOKrL
	7RoBgtRbH3RhSHtxIOXD4wDskggJ0+nnktw3G+eWpnOWHsFaSlwZLHPSb2whcnCO
	k3uzHqZ4gokrhll4EfkyoBsWGwsKLHIUXKoVUZe9eOFN76pMiMmFloH75czblan4
	sUxC3Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uca1q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:54:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39b6416441eso1493715a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789646089; x=1790250889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6RtNUfMgxoXfDzqtvXdPeO8LA/ihdenu1rUXtBUowK4=;
        b=OWsqYqY1nsoxYeIeXEQKJZRe1SXh0wFcVvz1kNvhUajclpT338QDgL3cqHBSsjT4bn
         6lPdGpgH0oA7GClBEhOpOi0vFw18gvCkOkoZS/LYUZax21aW/EJn5gAAghkFc9Ks8wiA
         3RcNhIRpq7nkcsgn1juMnyUvOGv87nWjW7cs7D/mL55+myWr/RJEz+aZi/+uFR2iSups
         7A8qLTM0jcDxPlLXwIj9GEjH4jaI8NaiLog5iy1sZn/ai+W6F6H+NXr5qaOiFDruUdsM
         bpkyaEVyaqRmu69M/YhKusLnCQkVVo6p/AZqGYg2GeIj6zcmf6mrdMIUjI9W3d6AhtSB
         NoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789646089; x=1790250889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6RtNUfMgxoXfDzqtvXdPeO8LA/ihdenu1rUXtBUowK4=;
        b=y3EO/me1A97ovwk63WB2CNyQK2tY3NcEbKN4rSeqv4edn8OrRKIeA9gXCFlTMd8HLu
         MFIwLhkuKbG48QdIpC1iXiyI00cKSW54N0a79AIC/iJEXINBFRv/c7M4/7dJaULmKkBr
         50VyhJjCONw8cXfocGVUMuOyK842hlm5KKCXPox32wFRTHEM0VcVzM4bhbBfH+6kSRfu
         u3J9DFnkS6RytO9TEKISEtKLk462a9giHGlonHKDVg+OBlZOGY37PPT5UPlAkM2C83tM
         j1yAsgMyS7M+nB+J/cjOxUIP/nOBMTbCXa9kTXwZoPkbiYqQbeDE7JsAKpwSBL8BkeLY
         VAOw==
X-Forwarded-Encrypted: i=1; AKwUvBzRV+upNHUinJbEx1JdAZglGj5XxFtrR2YeXF+MnmRhteWxkgjq+jNLSfVXlBNsIDctaPlVospA7Y4nado=@vger.kernel.org
X-Gm-Message-State: AFuF++mn00EAhrQyb/egqYqfpbVJDtwy6t3YPdH1MpsO5kKAfqOpUzy5
	MTOU4/8bjT5qbGgAVqwvqqPzUpBfHH2ue4CJngYG9U3rIXijzpVCzSnaEY7+M7Vqvj6sqpAr/vU
	2OSCRMDJMsleEvIbVfTQdSvjoQ/2b/VWbtdSVH/MgHU9hQxTJcxhnUHWRqUM3BNUVSPo=
X-Gm-Gg: AYBFou12ch5DUFqlx7vbg2O7oIBlSUvQLpOISLIwwS6weZJUw4VtfcM7sOXGKUs8w8h
	Ow84h83UyoaoXzCoJWF6v+ozaATdhXGpuwvmKvDQ6zN1hFt+jkaGaJiQtuGKZFNZLlCp6+tRtj/
	cgGDaSYtILVoi/hz0hEX1rxapvPA+eYpq5bcuAd9MhvK8pBEXwMRHjU+fq1ND2fdBAqFHu9g5GZ
	M/MCOVBcjZHtsMKlOI1DgWWxzdJa6vkhPjue+8F98O0QWgcl/LPV/pzEumE4SrgTLenE70fko2N
	Aax37X8Cg0s1WVxfmy2BqfRxkMP+iAFqxYLNuT7HzfZth355gDmImACvfNkwbG5ZL+0eqrsmZeU
	sJFmuDdanKGkcY6BAiBBmvONK6EcCbpj1IA==
X-Received: by 2002:a17:90b:1a8f:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39e1e42497cmr14246410a91.16.1789646088733;
        Thu, 17 Sep 2026 04:54:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8f:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39e1e42497cmr14246361a91.16.1789646088282;
        Thu, 17 Sep 2026 04:54:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf596e1f6sm18249500eec.1.2026.09.17.04.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:54:47 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:24:11 +0530
Subject: [PATCH v2 03/18] arm64: dts: qcom: sdm845: Fix PCIe WAKE# GPIO
 polarity
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port-v2-3-0d627d0856d5@oss.qualcomm.com>
References: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
In-Reply-To: <20260917-root_port-v2-0-0d627d0856d5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789646072; l=970;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=PAXRXzls9pWtyh6XbNWJ//2jMSjeYQuXL8j0pgiVR5w=;
 b=d9oaK7UuoXWrqG3D8odo6LNc9cIGMxSw/aNGvWKzf8Jt4scyKMJ5ceFXvnhD0bnezYlYWTn7z
 1E/SkOVYraECQqsqSke3I/IAhJ/JOKG0scVSinHfiMbGDV5EsT/ydBZ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX54X+7FoDvXU0
 vkFoc4sdDsgXnc6L68yvcX9cxthrlCGiU8MnkgGW7Nbi422Y/mcVnpVgWUINeO8bgQDYQRO34Ga
 rneW0X6p6ULLxYZmA0lV3dxl0DYm+AXNCCLlRcy0YYRiqY16jRr5UOEM+GEkIU2mVh41MNao6WZ
 jJEWVkBLTPALasn7KA8t3MGDSvoejw6jGSTDwIgcQvOvXasOnXUtFzEI409S3Yf3ee+QfE6gxE8
 BK1yxybebSIIhMGCBENjjUSEE39NXYG5r3XtPpaZ7eGHOqldDgSzuAC3EcCw0jjMfEmYBKazn0t
 2d4Ze9Sd6OVt7ja8TTsWjYjuFucgrCptb/feabl+eAxqvB4UPi17Q8jxAvgliqV+hOgJjIHT60h
 vMBUvWw6l9yx2eDqt13lYw4yeHbIzS43QHFss2yXIIrJ1cs6uQ/cGyAdUSXot2PreYE7zwZUsb6
 m6jLJOvx6Ln3582gAQQ==
X-Proofpoint-GUID: 7aXNhNGb-lGwDOQGacK7te2JIpHt3Wu-
X-Proofpoint-ORIG-GUID: 7aXNhNGb-lGwDOQGacK7te2JIpHt3Wu-
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aabd509 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=bu6UjZ7a5GH_BZZocUYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2NiBTYWx0ZWRfX9UWsw1aCYrYs
 KY7Uv5JkEf7kHRHoCo+m4aStKnavPYt4WdSu6SPyDeYdO/DD0ExW/rrIbUVMgJewzPsOKSsI6zr
 o1QsgzFeuPZ/KGtPoJ1VbTFuwdxdp6k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170166

The PCIe WAKE# signal is active-low as defined in the PCIe Base
Specification. Fix the wake-gpios polarity by using GPIO_ACTIVE_LOW
instead of GPIO_ACTIVE_HIGH.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index 846138149b2c..3e636926231d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -619,7 +619,7 @@ &mss_pil {
 &pcie0 {
 	status = "okay";
 	perst-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 134 GPIO_ACTIVE_HIGH>;
+	wake-gpios = <&tlmm 134 GPIO_ACTIVE_LOW>;
 
 	vddpe-3v3-supply = <&pcie0_3p3v_dual>;
 

-- 
2.34.1

