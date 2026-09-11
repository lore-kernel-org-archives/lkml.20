Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF61456E1C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122609; cv=none; b=bTkQLBJ30BjIaA/u4SQyAoT97e2stOXM/J+UxlATU2G87pN5RwZ21OO2EU9CIqc9f00R/u4ISMpIz251sruO5DLpl0M+k1xzzGELELsqlQpUHH5pE40HqvSCgeMWovhyYjZzTiFWaByOnkiIb4t6G+qg4PjnCNgbpV3fE2knQ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122609; c=relaxed/simple;
	bh=OkF3pqNY5sBAsIguyZS7ydBERaknMe6JM23521127sE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p71N5JOEvdi6Org46H1BPKawdgRB2jMN1uTiooEAULOqyc2lbxxFBO2tOV3VxccFEjX2rBvF0vAhzecHAZuTgd95iPlRZv/x606gH0NQZSKSmkcHBEbxVBqxR/Ps8NATwRku7tYBAC3ZAJ445+Uk/Q2ZVBlg0CuCz2fYLM7wnkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3ZhNICD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HT7uK/zY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3ZhNICD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HT7uK/zY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7l16u3687109
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5bFar5H27cJqwd2WNphcoVppq++/ChGc+WspNucP9M=; b=K3ZhNICDVGGt3Ja4
	3PifMTjl3NR1UemPKIR1cwfgJ28JuWrRTLjE7qBPv2d/vZPTtvJI0zXX1MA7gfAR
	HaEXXKvOrNBp/XSKVEiiM0LkNubr2u2YwyZ2kaHDfX9hNvLIR4eij++P2f2e4t4A
	0kWvZ2PAzmO3ipSVHWMZVUGP5zqg9RKNLasi4KIrHCqhdenLcrGX309HBczozJaO
	bROvySyf7VMj9wPFOnbgKgVDKd2Cxtq56PoJbUwdOONC4msWlZpKJct3H9iTBJ6b
	H5Z2wnzqRTnEyIW1BOYuHLRSuggbNjqQI0+yyx4lmpmVgYfmPpYUA008iIGnn/nS
	2AD6uQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmapg1bqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93771aa0379so126072085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122605; x=1789727405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5bFar5H27cJqwd2WNphcoVppq++/ChGc+WspNucP9M=;
        b=HT7uK/zYsh+8N6Ikh4wSNx6TQR+v9znuOLezXPPmn1tsqLFyk8QgpbXMflAkrLcDgk
         oYscAW9yve30sazdQtSYOrtFJU+33OAw7H6io90O/sHQCKLuWuzwACi6sad6ud7JBKhG
         Zw1H9r8Zo25c+kJjeabkKC6j4mhRBB9VKC36PkazWJM48Nemy1afrzwnCOtco1yZIC5f
         5ha2CT0xCbMzvgknkLQdIZWrIyaID1T5KkyawnfwvOi27T6FoRRwBa0JgTsGDusGzWpM
         TR2SMRES152zALf2N5gO/CxuXMjsD5kA/hP/HoLBHElbmc/PfNX8HPa9B7bz9WP0Yap9
         9/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122605; x=1789727405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5bFar5H27cJqwd2WNphcoVppq++/ChGc+WspNucP9M=;
        b=lWK5fo06t+CyWD3ug6O7wtvvyoJNI9ayTdXcKn5cEcjv0bPJcAezFjUluYuNu1UJuH
         93xcrDK78W93P1dcYpMHg34Pa88a0yylHCmjeEsRKlZ02D/6LsjGz60iDlkmKClxOdpC
         doAfE3L9aPnxtiBiSjkSLRZlAFauXQhe87fSV/r/bf/66MaJH/3b5UNVNYAdRJ5tEKTG
         Z12l91iIWO5ub40yjImpm3EwF8g3GlXVeO/USqKfuMaMUONBObL5csL2tfL6EBHWFZYQ
         4SJZQjPThQ6mBUzzUE8DpjxarLmMCTd93cAu8TGFGSZoTFThtZ3rAsO8FK/FWqBc8S7l
         g1UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHB+3aYYZMIsYLlmW3dyZMwENMZTFMFiBfVxQDMgpdjl4wmccCVPID+1p6osgI3Ut9LAwiFe07kEpqVvk=@vger.kernel.org
X-Gm-Message-State: AFuF++nXmK3V8pEfBzhmVEf3hwcN/zYltHZYRxW40k92S4QrK9mkYyDL
	mPjkV83JMPfMB4sA1zT+x2RjevoJAK1VvR0IUEISsV2h6N6P26KWXTDeaTsWkf7FY+CyPBZrhpD
	vXTtKB73DOIaM3xgR0SubLSrpu+AtBPEk9A9b4JJ24RobzukOdcOsN8ZIYVr3B+gGl3E=
X-Gm-Gg: AYBFou3/7/puOWlwWchtTvOilPtpUuIVTI8Y0L5RGBGeidMgC9Og1NEnwJf0RZvQ+cL
	jrdw5N1xaLPHigjEbX2lRHyGayjKJwEpLUSyNXeaFjAgCuE8yfs4JTsrcRpG5iaIVePlWA6cwZl
	eSpf2II6z+6WGt5IJzFMKhsntSTCHoXwj9t78vLQXKUqInWcUmpUcdBcy2p73juQpEkxqDi1cKw
	wzg6jGFT/hVWJ64R0dO4lNEVvbuNQ/IuWlHBwJLJof1uTD4HJVm4T+CtaNDCEmf7Bo4moCGcc+x
	hSdWvZyWdQOxQ71xwdw9LJsvq35/KxJyY0jxYfaEQPzV4m3I0OkgPyj+kpiVgYb2InqN0j3fSUz
	EFDgih+PmhV29yXazo+JDbtk=
X-Received: by 2002:a05:620a:288b:b0:939:6de6:9517 with SMTP id af79cd13be357-939ea2bf754mr384621785a.46.1789122604962;
        Fri, 11 Sep 2026 03:30:04 -0700 (PDT)
X-Received: by 2002:a05:620a:288b:b0:939:6de6:9517 with SMTP id af79cd13be357-939ea2bf754mr384617385a.46.1789122604515;
        Fri, 11 Sep 2026 03:30:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:30:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:40 +0200
Subject: [PATCH v4 7/7] dt-bindings: display/msm: hdmi: Correct name of
 disallowed supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-7-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OkF3pqNY5sBAsIguyZS7ydBERaknMe6JM23521127sE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gVrcZu/TMDuP1i7PORWJEkHVwIonipCvxhL
 qXzj3ig7OWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYFQAKCRDBN2bmhouD
 15DsD/oC+uEKgZ7M5J4X4LpAk/JlszlMZ2civ+kPChZIYdG2ZJ9RYC5bHey27wDiMIrv7YSLK38
 u4C9MfRPd9xqE6nuH5qayj/jAjOfUVqttQkyzZFqAVtU0vXFY8DatvN/oYC1OiIga0wRc3yzw8c
 KeypBp3vOhR7QiSQDpqCnEZJE8T/G01setUm1hmNMZoVahF++feF233o4tKWGPqppFdC7vufVEh
 a78a4ytiNRAh3h9FkC7Io3M1FM7gqZfIWykCIW0RrKHkAAZ/+OnsmCGgW+9701J99atgPBwuxPf
 dBEjN8cvEnVghDl5nLpoR+4s9GGS8jYF4BVPpJEBxYRN2F8xAtA4NmwxONUahJLMO2Qggb0d5Ah
 ZZxCRoQ4Oi3uH0FbcViqkHJ7nbLOMPmlvKhgQE5YclDTV4rCfPkpOh7ej3V6LhU0iWtUpGPU57z
 Wh/i3zYgt6HAFC13buF5fu2bK1IeUXsQeX0klMXEbCrYlOQBKmU/r0cQhVDFWmd7r+npJmKii9V
 wcgpfBjCtWr6x2GrRE66WTujzwBUBSnBfxv++aJqeWB81Amu955ZP3lWdkYwRnzLIrmRMGqZBlO
 ljhkeeX+ggqnEyAl7gcZMa+JRgjZJIaJOqb1y6yIZiHHegNp7pYYp9Rp1Pbsd/98Yb24Vo7Ckeh
 NVptqF+TywOqi3w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 5n6B1cLh0r5_i0LlsQxo9K4aeDo17VAY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX5YBMSoki/4Aj
 7RpyQ7jyaGfhzi+zmjSS/VRqS7V+OsG7XEP7PYlBZyet/Nn9wB1L4VFvtcva9g0MTKmGP8OJ42W
 ughrar8LhViKKs9bvw/84rcWH2ik0iA=
X-Proofpoint-GUID: 5n6B1cLh0r5_i0LlsQxo9K4aeDo17VAY
X-Authority-Analysis: v=2.4 cv=DLoacCNb c=1 sm=1 tr=0 ts=6aa3d82d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=XYAwZIGsAAAA:8 a=EUspDBNiAAAA:8 a=LSMMCDwwRte7x3nqQVUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX/K0Gr4amhdx8
 1auEhfv7lqsQscuH+WcptRo4m3x+HmAM2QMhvUFbm5HzmfPpzTajoXxyZCVklGyzqY11dgoWE8T
 EcIzpZj+LD/2XZJPMg9Ct9bqP8QO9MShw0G59nzf/ngSnH3ZeukyNndym1VWyIIdX7rqxTcVBPG
 59z1HvWkSZSk64h7/EPjFqwWYSvKkimeESY34wKdYjqAoT8X/s6i74rrCzlMm/YKKY1q5mwBa6n
 99ZCPTg9/NK1eqoJxm++Wyui9f548y7tEniT/BwQNl4CofyeO/d/Huk4OxgRtHJCRnHUCMkVBr6
 8q3/O5wCeG4OD2EI9VLoLTuEbE+FTgjXioI3Qnt5Cxqxm1KgnLddMPMSIFpuq++HSl1GWrPj6WX
 THAG6McYNwoK4sw+RCiiB83x1eF7zEUN3JR2WGa3g9E7Op7aMqUIksKMMuAL3Zx1RsR4m5MlOrZ
 Br2eG6+Zs+OIXZeN8Mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110146

There are no properties in DTS or Linux drivers called
"core-vcc-supplies" or "hdmi-mux-supplies", so the binding probably
wanted "-supply" properties instead (which are defined in the top-level
properties of the binding).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/hdmi.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
index dfec6c3480f3..02d27ccad024 100644
--- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
@@ -113,7 +113,7 @@ allOf:
             - const: core
             - const: master_iface
             - const: slave_iface
-        core-vcc-supplies: false
+        core-vcc-supply: false
 
   - if:
       properties:
@@ -136,7 +136,7 @@ allOf:
             - const: core
             - const: alt_iface
             - const: extp
-        hdmi-mux-supplies: false
+        hdmi-mux-supply: false
 
   - if:
       properties:

-- 
2.53.0

