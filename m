Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0723F3AEF51
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132631; cv=none; b=hqH4BMDjVDFwKYZVp/qPoO2kJlCWukGxIkBFsSmI/YBjx1GdeZiH+lce1iBA0DtTcLFed1i0EWDT0d0/fT8DR48kJQMwOzcTDWnVALRCB8WQdDJYFz336JUw3EZ4yioockuxyJEWJQwTg67T4erzQJ9ltowNcsj/z1wbCs6M4ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132631; c=relaxed/simple;
	bh=5Pr03qQhNLRXOGv0RgI7lxb2r0c4i7mfLQhNHQv8TV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7ohgnWJ1i2XEvlKIhcrvHvfJfTsOa+AqqZoj14aw5he/cH6kBNwU44u7njUxP5QAl/WyT3Z6IvftgCRuP8wdi/NSaSHEM0sxxy9vRolPTbc0HJIaNTA9rd+hWus70Ju2ayE2rMyhtPSfSbxAuB4f3/rcsOjixRPwc0Zmrlk56M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHwzbViM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jULG/hLv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHwzbViM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jULG/hLv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G2NaVJ405986
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MH0X6BkiKawAmL+k5dJ4f3ue5wUkyRRRhMdlkV8hsII=; b=ZHwzbViM9nGhb4R1
	Ueos5vlT0Cdsl1AYOAT3XhOIycKZCyzer1zLBAufSu6A+VyVJySERpS9EWv33l8I
	W5Wyt2aYei8VZkJUAu0T84n/My/Rbw3LsVpVfAI0L/13M6eQRnrTqt8rD0Z9IHxX
	TDBWv2ddO09w1PpmRDWGRbd5cSnap3R2j4souLREqhTQRHNewMs/NkULqwUG9D+i
	zLtSfxJtV2vy+TDHQmYQBX/xJ56ZqkrdK9m+vWEiUKcAa0RGiYwYRg/pn+IsKQ3U
	2wcfxHqEd49T4jNTOUBn0Ah3WuGtEi24KhOVFKk7abRmbZHaS0Yo5jXQHQd4K21u
	+7r3BA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3sa2cru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:37:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a46f0f158dso1002000a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792132628; x=1792737428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MH0X6BkiKawAmL+k5dJ4f3ue5wUkyRRRhMdlkV8hsII=;
        b=jULG/hLvEC4fcToh1C/3iD8EV5nXf/KcP6YyuKvHzUP9lhz6m7k1R4xxIOBn1xr9Jg
         ZKmHeeFYGFHi+WhVhTaObxxdE+05REDzYkYOFJ9oe2FFkmemwm33ATymVjKMt98pyJav
         juxikfSqO3fhp+SpdUOcqOQBv8XrzM1QXFbQHZxlFYN+t0iqeDxWtXRDa0hur0JtyCet
         0+Jq3bPi73Krr76FB/Q4N4vCgnzY6J6Vg7OBt8/Cqp91pOp7Hg8OJ4UPz88aFpmzI62K
         EIzXeDmEI24QPmivsrOiS+QjBHf5DY6AW/YamOMn71z6zXbVo1o4rk0xI5dlW7oPPY3g
         +2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132628; x=1792737428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MH0X6BkiKawAmL+k5dJ4f3ue5wUkyRRRhMdlkV8hsII=;
        b=buEkJJ1Qv2v280pW9mLdtY/MGSFV5sEJ2BzThRlH/FCDsfT5kEthIxB+ZqMIoWjHia
         COymmoxbr7PPqIm87bA1ITlUcT+83BKySP3v/C7Hdbapitjp9+ginsIN5pdnvI3qRAt3
         M8aN6Z/j+OA0Kl1m2I1LHuZKIFG7FZhXRuajA9mD1dHbShUcai4EKSkl7eZKusec/jM8
         vhXpkChYeGwceg9VVqRH83xNjxlgtl5zHrwILMi5rCsfxG6Ta2ckteuHkLsJPoNZJflu
         IRZqqwTi9FkyoxrGtkZtH78mH0G+NyN0078oKwhoQKMTsN7ntT3MKqa2uXf+wtpz8q8a
         JoSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGoMyFOSNtMZCWGMlILOWvI7Z02mAQSP5CwFxlNVxoSK+15JVNWpytYyb342xSuY8RCofz0CU4oW5P3Cg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkBiIUT+t3J1K/MVzb0CgEX2Xr635711T6hIYRqWmFQwGrSHNy
	iZH5XY7aT3R0s5ljIjh/ntKrG2J3oyvEfLG/QBJGJcIdBJsI8KqqjWiOIiPdxDbOFK0XrjFkjwP
	cPc2PdcnNCeb+/hJH3W7z8Clq3wifvUhzhVMK76K2nbJrMLmWMKJ4k1tvkstf9TwOS1I=
X-Gm-Gg: AYBFou0fuTq/eIb08QEg1ZQGoUfYlhhVLS2uKey6ixuOFv+sYbd/7c4g4SR70gs7XmQ
	RmTwANpFWXXOMuKDWTX9+38rIO0dPceVupz1q/RGrPUwuOXYnqxvyWwt2lzn0LI5+OnOgptNTJ6
	3qvD+hTq/fk2BTDWYXexMXkwiDuDIDtsTib24YQ4RXSGLdsIaot38Sog+GxJkT7dPk0RK3OII/d
	MmznuLg4fFvuPXVIF8fOH6Wh73/GLy/diltJCQXRjSWmGzFlrHcs86LiNERdUAYfexwN/BgZcAf
	aZ8KUL6KRpiACgULvYFC67jOEZbBvzW3mF5SODVaxLGybd2YADTpC7fHsq7SvXM+8XU7MXkCNDZ
	bqBJuqFI5tgXP3r0ntA2w6Gg9EkJ6rC8=
X-Received: by 2002:a17:90b:4a85:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3acbb68a0a3mr1547628a91.3.1792132627847;
        Thu, 15 Oct 2026 23:37:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4a85:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3acbb68a0a3mr1547604a91.3.1792132627331;
        Thu, 15 Oct 2026 23:37:07 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc43a1e1esm2703298a91.1.2026.10.15.23.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:37:06 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 12:06:47 +0530
Subject: [PATCH v5 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-glymur-dtfix-v5-2-f56a8b94b4a9@oss.qualcomm.com>
References: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
In-Reply-To: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792132608; l=2068;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=5Pr03qQhNLRXOGv0RgI7lxb2r0c4i7mfLQhNHQv8TV4=;
 b=+vLCPCBS0d1y6CQkVqsFNpndDW6h1mukkd/toByoy/9Bikzv3H3HxDQRWVRkdR503Pzqy44xr
 B/gOI6UVYh5BPaXNooWPIWVZfr4aiXGAjuOJkAwKG9ch35xzCooswlp
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfXwaLIghm1JqcR
 mnfRcsU3l+OG9M3CIPfOmiDca59nYVUPxOVGDB83OwIAM44nv+n4vmyFNLA3hjvdwF1Ag7HvxpU
 3dO4065idJJP/SHjM6KSOslQcZnCgec=
X-Proofpoint-ORIG-GUID: QDAasYPvrKDjMiV6rxZbLiCOWuRePDE8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNiBTYWx0ZWRfX+UFefAtLFxrC
 AsTO5AC8bZNJfRGEmuRY2m8WDf25ZB9OGaThdXmolLHROvRZ/oOr+MgEkB+fvwzXO07LrWKN9h3
 B+Q9icG1G2sEDxaRo7Xoy2oTe8HeHU72oD0I2E8SS+rMV2OXsCZAGMHOx9Y5xHpFnI5+lAU/hxq
 1C2saqYQlA8iXZr8PJfxUeEPbpxgNRQRQi5ssnZO9zNrc/HWWVCyCexmpud8cLoZ/pPyT+Ob6KK
 lHuy6hXLPnHxgtK80OI2tO1VJ3NOq7jt+Vqes3pMcocppqH4XSNRSQa7ojm4J6cyncBWrrWKsI9
 uocMmcVkZaK23rLMzBTLVGLNLBCAvhjtW9HjasMcaZ7iDN+T10cII7S4CvoOtQZXOMDoHIbZYy3
 gzk2WkmxsfWz73YZH7BzgH6jI++vOUTSfVBR8cXspmRfacdxC2VwYFSxHiWrDoJ6SgMN+Q4kWM1
 EZ3Lr/BDPINpMzg8kog==
X-Proofpoint-GUID: QDAasYPvrKDjMiV6rxZbLiCOWuRePDE8
X-Authority-Analysis: v=2.4 cv=AN0XGc5Z c=1 sm=1 tr=0 ts=6ad1c614 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=50Dod7zhrM_yUD2Akn8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160026

The reg value of a compute-cb node must match the SID (the lower
nibble of its IOMMU stream ID) it is associated with. In the cdsp
fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
mistakenly given reg values of 10, 11 and 12 instead of 0xc, 0xd and
0xe, which don't match their SIDs and leads to SMMU translation errors.
Fix the reg values, and rename the nodes accordingly.

Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index de7c395d9c35..42d9ba3d3cb6 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8471,9 +8471,9 @@ compute-cb@8 {
 
 					/* note: compute-cb@9 is secure */
 
-					compute-cb@10 {
+					compute-cb@c {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
+						reg = <0xc>;
 
 						iommus = <&apps_smmu 0x240c 0x440>,
 							 <&apps_smmu 0x196c 0x0>,
@@ -8481,9 +8481,9 @@ compute-cb@10 {
 						dma-coherent;
 					};
 
-					compute-cb@11 {
+					compute-cb@d {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <11>;
+						reg = <0xd>;
 
 						iommus = <&apps_smmu 0x240d 0x440>,
 							 <&apps_smmu 0x196d 0x0>,
@@ -8491,9 +8491,9 @@ compute-cb@11 {
 						dma-coherent;
 					};
 
-					compute-cb@12 {
+					compute-cb@e {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <0xe>;
 
 						iommus = <&apps_smmu 0x240e 0x440>,
 							 <&apps_smmu 0x196e 0x0>,

-- 
2.34.1

