Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9487C48125E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331211; cv=none; b=L6Wse1JEbC9ivdZwH7jxTdstCXb/n8SNqiOp4fU5DkZXHQlwyUDLBjh8eGHakuzLx2sKaxaaJ89thqykO10NmxEQpF/LL+KhSLVWVe5JkDgnbpwJ2IlSmgLasUedKLdCC78RZJipp3T1LuYhz1LrgQaDLOZsXPqmCrlkjXmfSNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331211; c=relaxed/simple;
	bh=R/SsOYmPy9HIqKkbR9zrUAvXo4Tbtsa1kVdP2ariWZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fMXRUYBK8+YD0tAF4S7qiPWN5XIBEdahhsx0VxMF8R6HYggoH5Mr7OYPt3/AsO7Ujj0shSnjP2XwsoVJYEhyQkL4SomUGeLXnqtwnXNpsslKLDTpuMvSZZnTQJTva0oT6TmXmQT+aXcVLBrULuPK6j8JgaJN0SDYYhfptolJJYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kaa1S9Cc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gH/6s8VY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kaa1S9Cc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gH/6s8VY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Ya6k3532114
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rYeGZrOFSjD
	CzSXx5yrak0U9HEggd13SLHLFp0Wefl8=; b=Kaa1S9CcZDbBPwO+Y2BDE9K7/WH
	jA4oo7kWAKHtZfgm7jHkhhCSURaxDiJcUZHDkfknp4a1ruEYm5nCo1qrORACPnco
	adbfa0SNMyEbNE6YVrpTzaIfj9rRvd0FkgTS+UH34YuWO4EW9XQjVv2kIfE70Fbg
	k6jYPAUh6PNWxZ5vkL8GTPkofJcGT0d9ZrUu2zmy7UTyGLSMPafGV9XOCihy8SBZ
	yKKXASibdftZJhKGikIqlzRDBIJ9dZXJ989VKD45jyA9t/K2WxoYCoq4XyCINfCG
	p9dJ8U4G5PogWC1oxCpIPJGCLbxmZdg21bzZAlAxlycuEs8K+07ehIXJP8Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kaqm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:13:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313d1015161so2486192eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331209; x=1790936009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rYeGZrOFSjDCzSXx5yrak0U9HEggd13SLHLFp0Wefl8=;
        b=gH/6s8VY+1ufKJp5C0YK7J7VT1CaCtf+QLA/bSXchx4G0gcuv4F9oBN5mMCIfqhVqQ
         pXsYPx0nWXUaGBP3lUvPqv3DDGGxlJ+UMj42iFBO8CG+Wk5BEbGGG4u1km8JCHjNwoWr
         a20xpNj4HeMPfz8VjN+pb2LnoWMUpL7iXoMfdikmmsN5S2lKCdb7ieKBTsb9VzzSx0cb
         m/IrOycBdvMJQK2if81ZcBBIW3U8ZJpUvMY13Qv7yArBIV5mLEv1Rliy8GPkLL/lEp5x
         GstLzjSITrP++2HI/nqUdsbu1FbkCl8FLj4kPoosgMve84dxNUbUU5CLFnmjdTAThunB
         /QrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331209; x=1790936009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rYeGZrOFSjDCzSXx5yrak0U9HEggd13SLHLFp0Wefl8=;
        b=fJKqarYQx5nQt/SRfsud3sBNY/QDaqLl+hVW85zVK6JnYNiqBOkQgTFhz+j1ocUE2J
         wMOnDWBXMjzSXu9kBwPeeRfng6x1qbXD8NP3f0anqagqyMSaUPPLz1CWcwloevxGizeX
         GjjKz0EkOYgvFB9ZPRXFNpUt87qhGTUjO3E2aYBwQRP/7k5IDxQuUG3nLrIyd6QPp1/h
         xOJqyn5OtWgVFAwrJ6pT1CeGub3pg4Krp75OZ6ZhFoLu81OAc7pHB3GySdcTdBMNRTTR
         PozqFsRUit+dQzsKhQUoC13/nc2ziyn1EQUC55cYvZpOSsgsoPHH0xu+kWhUmU4fjmAD
         GkoA==
X-Forwarded-Encrypted: i=1; AKwUvBz0z7fRw7ebLXi18V7RuhpeI16rr30NiY24ryzhGvP0RTdt8TcnEaGFBieCOHSm7uxLGwHNYRq+S78oGho=@vger.kernel.org
X-Gm-Message-State: AFuF++mKT71K+fDdKQDBrHDzXNBBsYY0n008yKUyWYUpP9zRieIWqy64
	wze7AhdGPTbToksMZGA2CD/u+kmGRZIOiDBURALRAIXOULujE9DsjE4YBN39vjxF/oAA6F1nmns
	kKaoSQ5iPgrkzdTR2yUX5fHLPUUuZ8eYtLhviTJpLEnSCSdzscvlZnSPEJG8Gl590KKw=
X-Gm-Gg: AYBFou0SkSyRFOHzpEpiJEmZtXR5upAiNuwmEGqYs6cOk7rvNRD31FFpDpwd5SBZv3H
	yVuUOXdWJtsHPyVdFKP0IfB0sxlAc90yvm+PxXUpP2wdrUSMcUroADGiRw79fwfbHJNTyaHuSSY
	gaQZUGbtpvJ8n5wrGEd4gHUvmapRZlJ8ZgJxJ0KTMAkTX5uMhUu3abd9sdFG1gVSXBgRzYHu67P
	/1ZX+oQzRtHfruJ1rGuipXjfQFNbvx/q5FOiDSWKzA3PWDcP+lYF5ecVS4fCaaGfQKbNdd20LJn
	cOD/ukFlFl5m/PlIx1RG9xtixj6q4N4cQ05s1z90p2fB+uEgYOIjs9MgJbHBmfYjZpP9l4/Rf2Y
	9P+vRw7UkzIu/0UtSqunMZY9A3A==
X-Received: by 2002:a05:7301:2829:b0:33c:1f44:81dc with SMTP id 5a478bee46e88-34004592b2emr4265461eec.6.1790331209079;
        Fri, 25 Sep 2026 03:13:29 -0700 (PDT)
X-Received: by 2002:a05:7301:2829:b0:33c:1f44:81dc with SMTP id 5a478bee46e88-34004592b2emr4265411eec.6.1790331208035;
        Fri, 25 Sep 2026 03:13:28 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5397961eec.0.2026.09.25.03.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 03:13:26 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 3/4] arm64: dts: qcom: hawi: Enable SoCCP by default
Date: Fri, 25 Sep 2026 15:43:07 +0530
Message-ID: <20260925101309.3826038-3-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
References: <20260925101309.3826038-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab64949 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=5nHZ2-PuNKrVBJgNaKUA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 6ZVHNK3siReR18oGVWwHYMpQvvgzXwGM
X-Proofpoint-ORIG-GUID: 6ZVHNK3siReR18oGVWwHYMpQvvgzXwGM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX0M8c2JIysSoo
 2Eiy8nCpCvChCYz6KxyQSE7jg2Gt95ylJVcJFO2k1fIGUBKOdNWsEFb8a+K2K9LkBy5x55DvnJJ
 J9Dl6Ou+yn+vh+Imbv4I6IZ7bZz3iwyN/WFh/bGIY6c8x2YxHpmcINlPjt3xXTNdTFCVTDG2b25
 wmSsNjXt2/isJZrc2N0oyKkHB6TtMoaANkHhJSvp4WbQQlC6MMwwNt3SMYmQvklyoww4LvMehcN
 HSwOIQ8tbsqcJUxitpsJiT4dIsJLAtCkooNbYYzctwiDuHs2HwNyiTdjnd3xTWV7dRbF/x8nTff
 Pjpnwn5kKgRIX18wF4MWnZwVuHLgZG418U6AATqoVgYiLAx9huHvgjsFxhV0BK5F5cBd74iUTTx
 6G+NdjLsRKLXGFf3bgOfCgr+GGeI/IuymHzDHM7MoeW994FL+YYCn6fvUXr6Oqbv9bvonwQ7nsP
 UDaX3PZ08KVPGwSShRA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MCBTYWx0ZWRfX9fjDhTrin9VP
 2QTVgachYvH//KYzweQU8nkrZh9cDKEVi4nT4roY9kJPWRD7f/2KEroAUaXuZr1qv0Nd+ntOqFM
 phSZaNBF/cQA2jC0zMGPuO6wodBJz5E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250040

SoCCP remoteproc is marked disabled in the hawi dtsi and enabled in
hawi-mtp.dts, but that is not the right approach, as it should be enabled
by default. For Hawi, like a few other targets such as Kaanapali and
Glymur, SoCCP boots up in early stages of the boot chain before the OS
takes over. So, it is default on.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 2 --
 arch/arm64/boot/dts/qcom/hawi.dtsi    | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index 7709582491f9..88e0afa791b3 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -910,8 +910,6 @@ &remoteproc_mpss {
 &remoteproc_soccp {
 	firmware-name = "qcom/hawi/soccp.mbn",
 			"qcom/hawi/soccp_dtb.mbn";
-
-	status = "okay";
 };
 
 &sdhc_2 {
diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index 89bf0f59304d..d47440791479 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -1859,8 +1859,6 @@ remoteproc_soccp: remoteproc@d00000 {
 			qcom,smem-state-names = "stop",
 						"ping";
 
-			status = "disabled";
-
 			glink-edge {
 				interrupts-extended = <&ipcc IPCC_MPROC_SOCCP
 							     IPCC_MPROC_SIGNAL_GLINK_QMP
-- 
2.55.0

