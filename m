Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357723;
	b=3aZLLUrX1BM/UphOlaIhkNw0ET62HElDAMrBMyq5k7rtvkGdjXV0Eg7TZD38z6/mKhAC
	 YRXl/O+eUuRRtUoAi6CkcEr9vloiNk/B3wHAEdfTzjvBNKazSSOqxDBXbIOEV9BKiOJam
	 RBmKRT6mxOEX5qZeKONUkSv76jBwEQQNwUSxqGIoDmNn66m1N+XZlxc1g9QlrF2KsemCZ
	 Srr8W6oKuV0StjiTeiSB233BeOWTi4A9z39QH7PcubBSClOusFHz+nFfxXtREyLgcywQB
	 0D8qGx6Dl1dyVP+Ex/IEbRyZAQUaSuOYUxwAeEw+ERlJQQi2dP+De07lkDF6eTx3R4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357723;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5UNOqAv6CFpckuRjuO223jJQL5dzFe29ZKuFERbyP+k=;
	b=JbLf3E8wzS/QhkNEv4Cm2musTfZHxHr4lenGTgq66n7QN/h/93lER0SNJrQmvIgrEgii
	 p2SRnMYZzW25VMRSRt71RH4RnBRSCGG5jT0OcoAHXWYGqoke9dqe0IJ3fMqEHEWHvtZNL
	 GKzlpec6tjcDUuDujGpprlj+hJyjSDaU/GKAvThAmjAWWXGhZymFIk9MwJvDxqd/cTMF3
	 BgyGRc7Hi+t17Stfw9zY6lScHH8bNfnzgSape9mer0OP5GVKBaXkY/ZxPPdpAiIdgMalx
	 mwrduDt0aw9kUKUAXPp5jGcb4gH4UUTz/TmWWB9PbU7NjAniZGp/2pvh4cPQIdZIeLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Epkmx2KK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pp8l0OaL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A287606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A287606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Epkmx2KK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pp8l0OaL
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F29H1120522
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5UNOqAv6CFpckuRjuO223jJQL5dzFe29ZKu
	FERbyP+k=; b=Epkmx2KK+Px/nUuuIs6qLYT1MYchjvoiDSYzmRm8o7jthcIuq+R
	Uf1jlX74a8xGHuizIleP7oMIPQ6MlKEAbTnNOuR1cpBra/OZgnrWEZ/S2uKlVjAZ
	W5GM9ruphWs6ndjD2rN93D9094otCb5038jom1vxtmm9guLs6zlpoUlGjEK/TWtG
	Tw3D4VN8+Ve0/gtAPX+RQuq/a7LvkQwvjVlu2nGETOhkCa2fQ53tANf+TQJyZg1G
	CD6DpcqDrm9EieuJsEZiKAq4mp+K5A+w5M4dXxqVkp7qJtg7ii3pZR9NxetkMT/z
	3cMnW5oRcORoUlpgteK9rpNyMMPdJ6x9SJA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pjj68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:55:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2639537eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357722; x=1793962522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5UNOqAv6CFpckuRjuO223jJQL5dzFe29ZKuFERbyP+k=;
        b=Pp8l0OaLL9w5bE79gAJKROSACoc5O2EOGbev7ZZ/6CETefTq0Ierp+vOT6lgEzjTdv
         luq2wG+LJaHMBNMznU/IBX1IXk2YW03oCRPvRNZ1qDiK+qi/yGrRntbowgx4eE1e71SS
         pj65D5RwvE4yVVKTxeDwaxKSF7FTwBjwPKMmlZ9TFcbgjCLlwi0nedZSKNOqMljEEuqn
         8PMnXmExYRxNBxHLxZhJUIWqwLZlQ4f5D6MpKTSeaItYrLfp0woqvfZ7FaLYxXo/nkeB
         pfpDK3PeXlYBfzHXOxOfHdPxY4Neqnnu6qj8D78RV1Mjf79m/XRHNjUPycjq3MP58eBG
         L+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357722; x=1793962522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UNOqAv6CFpckuRjuO223jJQL5dzFe29ZKuFERbyP+k=;
        b=MEMTf+xgtpKcPUkmjV/Auz4gP0kTp9wNOXdkQjIv6FJqg0LJetuxt9wMaG9SI4Kcw7
         MYobE1PR4xOS4x5U9vw3zIWrM+VJn/jbdpCtLwYBtU9jVOyvDc81Cv+OtqkV7OqZCuHh
         OXX5bY69LTfgaR88VjOqApc+ao9g98CPV2b6Y1KqGrHrvq+6C7gm35DUBvAJw8Tt9OGn
         BYfB/OJT6RyRyrUKzUJYB1yHHdvhIU9pfI5xQ4NuJYEqKWB12/+WFExiK12qNmiA/n6A
         jOo1kCH+XBrXqlOWX95N7bfZvkSw0q1GZ7gxtQI2UVTUuP3dHrfWfYt1i2C+Au8H2g5N
         ZW1g==
X-Forwarded-Encrypted: i=1; AKwUvBz82xTPF+o6evB7htxpfEWWBn3C8i0f7I4WDwRtpsOhbVJG9Y9cco7PkT3QVGwyJcqN6nel5R9QtVdy2wY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIg7aR1wIz7jRvCTYwMvzcvoTDwoUrx3W9rkeD7rsPhuBtmQfKO
	0Q0sp4aBltnIUvMgchDT0mCmiOWiBCTWepeBzbhPYK+/MyokB42849jAafkllBQiAXY6HNgYrvT
	7ErpgDkQTIM+lIjJQC5jPJyktJvARRRocr9Yx1EyHtBLTo6FIHT9hMIcfSABfRmq1pKs=
X-Gm-Gg: AYBFou3+du/cCXCLvHUIw5QJK3FJfLisnz0oJaGEb4+ElcSBXU8nXLO0knvJgCoa4Ac
	U0g7l5qlviUgde9H9oAReH5eBekfgj1QJi6nU6nJgTi18WNFPB9los5daV82EC2y20bzQPqHV6c
	zCFPDJ2UZdvRsbL6deQssrWq8mXinj+y3PwEdrBLrV2/3noOxKuWGis2F8kFy4LdtYdyUbCOKcV
	CUrAdBF5kO0R+AM3lEn933HxveZTn5RcMzHBYkqir5W1mZcm1CU61sJyeByx/sWQGeZ6gy+u5uh
	Ob/eDLrS7AtRig9W2NlpT+msbL5mnSO4Tvw5PFpmadNfOb+ZhswCAFY/ovNZhNNhZ2Wdv/dBWpF
	5e8hdBu8MCWQA6UK34i7N9E4ouEQz4LSg4dM0BHK40IOuKCUI5zQbTC6FRlbFRo10GnVVzVPadW
	XSfOg=
X-Received: by 2002:a05:701b:2050:10b0:152:92c6:8b58 with SMTP id a92af1059eb24-1ac5c555078mr2865689c88.35.1793357721639;
        Fri, 30 Oct 2026 03:55:21 -0700 (PDT)
X-Received: by 2002:a05:701b:2050:10b0:152:92c6:8b58 with SMTP id a92af1059eb24-1ac5c555078mr2865661c88.35.1793357721067;
        Fri, 30 Oct 2026 03:55:21 -0700 (PDT)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1a9e2ed3sm6017266c88.19.2026.10.30.03.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:55:20 -0700 (PDT)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Tapas Rana <tapas.rana@oss.qualcomm.com>
Subject: [PATCH v2] phy: qcom: qmp-combo: update offsets table for x1e80100
Date: Fri, 30 Oct 2026 16:24:24 +0530
Message-ID: <20261030105515.1948430-1-tapas.rana@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfXwu3mHJpsghUr
 fcRGEFi/ZmPkwwcLDx6VVddFtob40OBnecSIBed7BI1YcYWZUHIZc2dxdrbGhjLo820jzYivmHw
 koWqN1apXSQ3IjFkjogGAy3werNiopkHo77zm09ZJdIZc57x9sgVul1cH/sZVT9Co6YWibeJ3iV
 IX8eZzLXWvFjCYKXr5mbalcw/cKBM1auyXBhmvdCB72UROOG/T2ouyH8pjhFvPujTrNuprZQBdG
 idaK1SVYkoRgjO5RVzoK2GkCZ8bxuoW2bHs4s7FkFIO+4JeZbmBlG0KppsgdywdgzkqogSfhxhZ
 7hkmh1E1DF3BGAmY4rpbKv9YagYwPSW1sKOnTb48yslgCwuBOIzlVu7UJX2RRlObr28EeP5E+2Q
 SLWUW4G5QY2h3LpBcp7IMioRtcDp6I4MgWG8inM3+Mhqp7oPIKmnePYZkjuEMXG0TVT959Q9YdQ
 cdmp3mElkznO1nIrXiQ==
X-Proofpoint-ORIG-GUID: o5eArzZS0gePPc9xoDi_cnTYlD4_b1pw
X-Proofpoint-GUID: o5eArzZS0gePPc9xoDi_cnTYlD4_b1pw
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4779a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=WK3x7LZNRzmlshLj7x4A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MyBTYWx0ZWRfX+FTB04Eby8WP
 7+sbxBGdp7gaVCvCM0TZj2KJHvHCXZ4bq5bCYXLtkp3CJZjleeKmjpBwFV9xyrnuX0+Wtlvsd2U
 9QnILt7DX7oiU/g0PriXJvb+ZXK2SkM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300043

x1e80100_usb3dpphy_cfg uses qmp_v6_n4_usb3phy_regs_layout, which
places QPHY_PCS_CLAMP_ENABLE in the PCS_AON register space. However,
it uses qmp_combo_offsets_v5 currently, which does not define the
usb3_pcs_aon region. As a result, qmp->pcs_aon is not mapped and
autonomous mode falls back to pcs_misc for clamp control.

Add a dedicated USB3+DP V6 offsets table with usb3_pcs_aon included
and use it for x1e80100_usb3dpphy_cfg so clamp control is performed
through the correct PCS_AON register space.

Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>
---
Changes in v2:
 - Updated the mail address in SOB tag.

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 187f0cd11f6c..aa9dc9716574 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2762,6 +2762,21 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v10 = {
 	.dp_dp_phy	= 0x3c00,
 };
 
+static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v6 = {
+	.com		= 0x0000,
+	.txa		= 0x0400,
+	.rxa		= 0x0600,
+	.txb		= 0x0a00,
+	.rxb		= 0x0c00,
+	.usb3_serdes	= 0x1000,
+	.usb3_pcs_misc	= 0x1200,
+	.usb3_pcs	= 0x1400,
+	.usb3_pcs_aon	= 0x0100,
+	.usb3_pcs_usb	= 0x1700,
+	.dp_serdes	= 0x2000,
+	.dp_dp_phy	= 0x2200,
+};
+
 static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v8 = {
 	.com		= 0x0000,
 	.usb3_pcs_aon	= 0x0100,
@@ -3003,7 +3018,7 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 };
 
 static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
-	.offsets		= &qmp_combo_offsets_v5,
+	.offsets		= &qmp_combo_usb43dp_offsets_v6,
 
 	.serdes_tbl		= x1e80100_usb43dp_serdes_tbl,
 	.serdes_tbl_num		= ARRAY_SIZE(x1e80100_usb43dp_serdes_tbl),
-- 
2.43.0

