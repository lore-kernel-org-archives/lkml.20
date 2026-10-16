Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539943B27DF
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792132136; cv=none; b=kPg2WiOZA0BqczUGfLA0F1uXr0K45/RuI3UKekPoRJDAvIppeAFkSeVD7We+PiRZSlsPE1PySsUMo2za/HPOw51JZRkmhOg+Zh5nrpEGEsDMlR/BLa4FqHgc75Lt0SvZK/lImT7TQ+giVJdtjLmEBUiPpIY5Weuiz8XTP0S9zrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792132136; c=relaxed/simple;
	bh=I5REzZ/WFiqd/PwWnEJ8yf3X+m91kZhkF2ZuNWQosgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DSkMg5vdIKgcWZXmZeqYEmABy5FDKsn2JCtM9pUS0M9Odt+n40xbBXblueyue3R8HCpCQFZ+rsUXVgr7O5u/YgrcFeHXshJhW72Ap/VEYEfioJ6XSuSUQZlK2Ge/BqFCKD+qX92rXHL5ZCpIgEUmNUfW7PbLLMd8ib63ZmScdJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PyjG8TfG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OTyQIOuZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PyjG8TfG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OTyQIOuZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1BvE91890484
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=YXJ6nT4HdJEIzEtGoCtJaU
	VRrkJ7BX5U4CPOy6uCn+w=; b=PyjG8TfGJute18KCdlaaJtqAtvBZ+ojqO8qdKv
	TIEe29vopDrnvucua1QxaUVkfpTMT8yBme8+SPGdobEAzLRe6x4ywq0uvZe+DV/m
	21wzqGJmUkzJ2/QgdcOIh0Ip2wj5D0F9GT1RiKX8cEwmsnX1EBKiX1ltc5Yw9C6l
	fMwA6fdrH1ql+H4j1IREuBLSX0GdkMIrUaSUGO/B8l4+Fn0KKhQJPAtDEEDcKKnz
	9hS9V0FKcmOvIwi4cC4v00U72DXj1IhPL7F3faS2wPo4CFZH6mEGznsCVBKwhWmz
	AeXHpShNaOOydOEDtJrrpIAPujOJceRpuGha4sPaTquthTYQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba260xfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:28:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so5446619a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792132132; x=1792736932; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YXJ6nT4HdJEIzEtGoCtJaUVRrkJ7BX5U4CPOy6uCn+w=;
        b=OTyQIOuZQ9jf8J2nDmLdFVLXR8Y6HJhpzgOY9D0vL1CssdMzqg4a3EN9nR9wi7hqJn
         CkU4H+viB5fiwRvpSv/tO579jpRRJsO8nBqvL5iSLzpJK5kzXxGdJxKYsM4KyZovzT4F
         rokBS2Kzu0nYqG+DrRM1ZFcb/CEe3MCISokf7poy/KTQGB5cXS5LYG5WztA2RxYigzHB
         kSaMQyV/di+y2zG9Jd9D9ifbnYjg8b5ppZhHyPRbOugHn9QNQep77UhicylBSpxdbK8a
         rOicI42NhLPEcjhsV9rZ7qmpC/15geBvGXhLApEA/36uxW8pP1Oy5P0dSeL1ZG7HKipR
         YheA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792132132; x=1792736932;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=YXJ6nT4HdJEIzEtGoCtJaUVRrkJ7BX5U4CPOy6uCn+w=;
        b=XBAASkLSuioVylmjo8wij6Y68dCCa3EikfLPRkoZO3bwJNFD4WIe1jwnABvR+Q2n+8
         sWfNL/61M6RB2FaBimLHwfYSwYBgE2Wy5CHpaBU5qug5OOlNW0Hdq0TGvN7HDborAL00
         Q4FBcviTrI/g6ymgmh/pzyBIChZeH/saVwEBm3063S7e/ZVBwJr+QFzcWno4O5PyYGJL
         y0OqQNuQIEo6hWAxzba/RMjbfidME5NLZmNctykj9V26AFBOdEhuOMPJwo1TnB01ArM6
         nOIGZtAaFw1Igq00i7dO+rTc9eLyTjFrzam/v4xGYnMSrQjs9FK+h3pbnSzHYm8zrvJ1
         HZiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgYzB2WkaQZSFk30LQ+8+6DcaQtnKjJN3DpgvUhvIY2o9yVB5otEOONQnZVxLVQg6BH9ZRLn0Kt+DZcJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLp0bPNrtiHkmPCymeGiiCIFXOXCqo2UKseXwoU0KjlX6nJMbbx
	T6vp+93X1Rar4faoWO6P0KUrO1nff+6KCc3bdhNbHBddlRmE0JErWICDVHRw8RpxFz818giSTBb
	eoWNnMVYFPESzrIeneJUCfwmGZ0SaXZh9/NxJqZvbO8eR63dt0xPeMPwdMCLANg7RhS8=
X-Gm-Gg: AYBFou3eqNCigsfUwk0eb3bz8+8eZncrXPKREHrJasZbEQmxrK0pn3ERkLyRSl8/Z/Y
	V/RqKtvDNjt6ZhmD72SQhVNDuqdKw7raqFuCoaieX3ndIW+dc7tl0rtzgzfzfi5URtHmcoXmc1m
	iLCSL+0Tj++O0vgMobtZklz3Hp84ZPGC+LLA0ieM7VDN3jXhawALfcHD+L5CZkV1CzRGibatT0U
	3287bddiVjBEdU7+RdXB7134Lqto/vWbqWjJMAVdIy/C9LijpBvEu+45kAM07you/IRs8zgpZYn
	CXNYusYPQBTI29fZiQrx8mXjqbN6aRFpYOXhuoRWEotkPIBIw47786jIio+ThUxzrdOfBzVAxIU
	udu6gCup617VvWnnWX2KAlo4Uh/M04iU=
X-Received: by 2002:a17:90b:4fc4:b0:3ac:c90a:10bf with SMTP id 98e67ed59e1d1-3acc90a1ce0mr1238588a91.17.1792132131568;
        Thu, 15 Oct 2026 23:28:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc4:b0:3ac:c90a:10bf with SMTP id 98e67ed59e1d1-3acc90a1ce0mr1238578a91.17.1792132130958;
        Thu, 15 Oct 2026 23:28:50 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947dfa00sm7654274a91.17.2026.10.15.23.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:28:50 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:58:44 +0530
Subject: [PATCH] clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB
 GDSCs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABvE0WoC/x3MTQ5AMBBA4avIrE3SCg2uIhZ+Rk1CyRQhjbtrL
 L/FewE8CZOHOgkgdLHnzUXoNIFh7pwl5DEaMpUZrbRBuzzrKXj6HoUO3BxqUmWh+srkxQSx24U
 mvv9n077vBwh9Bk1jAAAA
X-Change-ID: 20261016-glymur-usb-ret-on-1e0850b9645f
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad1c424 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SxwTXxdCfPWGaMH8rwEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAyNSBTYWx0ZWRfX9WOKflajGPu2
 oDBkMsb3sjMfdMtUpxMfQE4wAlWhKlbpqvbYmbBLIzCLLZ+4ChBY0jxwUnVB6R+Y1PFaFHa/4yq
 LK7Gdb0OFLnyQokBA2rkjVQaYW0ffdLtoKu6y3RooyOOQM0WQrvXTMFHLW8bJ7pJ5RS13Swa0Cp
 NNumzgapKvyvdHN2ZvAFY2/4LQ6HTQuRmbNw12pygtYbJrRajLfArb4nyBP4FGG4qDRx5zn924X
 smWpuNcs7msZxsIirfj1+uRZa9aW38jdmJnk6WsULu3X9RxKD4wxsUGB9C2GoEQMwe6wS0Hiz38
 QNEOAdpOQGsRZApCK4sKqcEM8MLd1TWOaYj/5fUlrhNSbw2VPs5I3tYbTaDGBiELRCIaFYDZGPT
 0GTHoUYy65SiEFeBQTMDURaIx3aEvlEfUZi4z7J8nhh70VOzF8J5Zx5rgHPB3dP2XMzzj6CW8+o
 91u8kR7G2WV8XJZ1ttQ==
X-Proofpoint-ORIG-GUID: TtqQeb8Ictj-3aUz8piNa8kiWQuGrjr5
X-Proofpoint-GUID: TtqQeb8Ictj-3aUz8piNa8kiWQuGrjr5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAyNSBTYWx0ZWRfXyk4eqS9Fyceu
 8dwbjq7bW/qkOpAgKToBRMmbyn6xiRXWLrtGBPreACzyGCuk8/ftUhlo9h9tKCWppMaTUEtvXQo
 XHXpkO7tNeLWHsRGeqUOpSeu/U/JBTc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160025

The USB GDSCs on Glymur are currently configured with PWRSTS_OFF_ON,
which allows the GDSC framework to fully collapse these power domains
during gdsc_disable(). When these GDSCs collapse, the corresponding USB
configurations are not retained in USB host mode use-cases and this breaks
the resume of USB controller from suspend.

To avoid this, configure the USB GDSC power states to PWRSTS_RET_ON. This
prevents the GDSC from powering off during gdsc_disable(), and allows
hardware to retain the USB configurations across USB host mode use-cases.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index be18a555fe314a41e5335ce8cc100ae8ed226ccb..857596210f719b8d9b177ba30edf80264973b6e8 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -7752,7 +7752,7 @@ static struct gdsc gcc_usb20_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb20_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7764,7 +7764,7 @@ static struct gdsc gcc_usb30_mp_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_mp_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7776,7 +7776,7 @@ static struct gdsc gcc_usb30_prim_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7788,7 +7788,7 @@ static struct gdsc gcc_usb30_sec_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_sec_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7800,7 +7800,7 @@ static struct gdsc gcc_usb30_tert_gdsc = {
 	.pd = {
 		.name = "gcc_usb30_tert_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7812,7 +7812,7 @@ static struct gdsc gcc_usb3_mp_ss0_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb3_mp_ss0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7824,7 +7824,7 @@ static struct gdsc gcc_usb3_mp_ss1_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb3_mp_ss1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7872,7 +7872,7 @@ static struct gdsc gcc_usb_0_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb_0_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7884,7 +7884,7 @@ static struct gdsc gcc_usb_1_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb_1_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -7896,7 +7896,7 @@ static struct gdsc gcc_usb_2_phy_gdsc = {
 	.pd = {
 		.name = "gcc_usb_2_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20261016-glymur-usb-ret-on-1e0850b9645f

Best regards,
-- 
Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

