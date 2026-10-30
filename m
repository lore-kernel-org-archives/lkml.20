Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357054;
	b=ZbnUQ4wgFLt8r4jwmYvphKpSWKkdCKXgtVX3ZgFkHCiqr3RRj0w+1xqI4U/zR3QMo5gi
	 8Ck/wOzfK4pH9MgIIjd26dcjwgpireQn03oy72k21agYm/26IVBXp2NT3ZNlhZXkL4EmD
	 efNU7yNp9iUYVjI+qZH0vZGHGVgxTujLy7VuClcsk/Gto7AyKslkmzttnr2hNlviwBacF
	 +ho8vS94bnt6VUvWrO50p6baR/5DUp1TuLlrZdppAcPFwbzMakWWchu9E6W4w6tEGHejw
	 w2IrT2y9a623Q99Zm6oY/pEIEOSMWdhbv6oUa/7aUB3E/pvRA6hTOAOHMSS5txSj1vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357054;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cn0+TvX9BXUQVDjeMpm9KWwaLbjp+F7HHjACe6s+iQo=;
	b=Y/c4ZbzzTV9nJ7B5ilWTz8WU4sw8blabSiEessJBvlDinLB2ziQJ+ZAwkQBOzJUh6AgU
	 usqvUmsQAaOWq0OCE7v7fEiZhkPhH6meGcl01qQlygLWTqOgV4G8Ks/uNAbLjyChaxm8o
	 82VoFmAd+ve+6QjXKMnnuanNT8rpzmy9X5ysjrKxB3lwA6umW5GP8g6xoRs7/nV9Ufka7
	 6cFKsI/HiK8iWesweLIpglINGu5aX0s4HgpW1b/Oi1prvLpoZQuqUDlKtSRD8N7bIdyW9
	 OVoNrIn2KCr5IfQEOevX7ihSexonGpz1WUsVGqFjPPtrb/maG+kd0NRWQth/Yv1lw+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEVaPfaq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CRYmdM8y;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41AB606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C41AB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEVaPfaq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CRYmdM8y
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FSL01663366
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cn0+TvX9BXUQVDjeMpm9KWwaLbjp+F7HHjA
	Ce6s+iQo=; b=mEVaPfaq0ZQ0PRhcz8til02k9WMOTx3PQoCpKYvXiJzV9mDAKdg
	9pizcuBqmyGdSjrtQySr2ay4r+RodCmsdD4JnSJ6+M7HI8AdsigtUF9HXuQx1exN
	n7J1obprpNHFRxdcBOspCog/JVnA/bWYz0hVvT1mXBfnoqwlDI3LOcMZ9QMGeNgL
	eg8yeXT80ebObsw80Nxp2DQJqQDlrRMOzQoTkkvMF3IhR9Hs9w7DQLeijdDW352N
	ABIFB8y4BUqGgqO93a7bDLy/PmBxKjqY6LVSFI/qkzIDvVJ3cSh9AegdvIyyP1ZJ
	430XgbDInJY/D8oIkOUhCK0cJXJtJUXAj5w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p2kbb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:44:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso1091347c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357051; x=1793961851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cn0+TvX9BXUQVDjeMpm9KWwaLbjp+F7HHjACe6s+iQo=;
        b=CRYmdM8yh+0QeMixcmSiYusRTf4pA7KMYqvaBdKNFI2bLUtRkmXoLBJIUDP0rsO7d+
         f++7fd/Oe/cGb8bQOiIB64MjRffA1ZVCbPfZ7XRLlkwLRvYzN+kPzxiWp6tGyQwMra03
         Uc+qrI21dDM+C7kmtnPEwgeOuEmiGgYMpgNjyHUA1WWRAmypsH8jYSjxS/ihR9Qjvt1C
         ig+8DS/At65MO/3UWq7cdDMSLCYiTd3275qIXT/aHpmXhSH2izds1/c9zlYsYdc6Gcbf
         UQb1kDWU5HCFpgnklKeUiV2tzZ9+1VsaLq1xtQuM3HgIkVXUciZ1NH1Hbjlppqz8WRLN
         phIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357051; x=1793961851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cn0+TvX9BXUQVDjeMpm9KWwaLbjp+F7HHjACe6s+iQo=;
        b=bJDjGtlDCu+D5zrF+8FvNPCbAcVsCOv84tng4/3EmJwELMitMDsecZ3LZmMsIbxupQ
         vH0ngs3iJ4PCadxyk8b9n6KvvFe1c6olj4UwdRePt6XK9O49WLxfIfqP9gkwDx25EP5I
         eQhVbZi1LbQrhZJ/sPYTJWv0/mDedGTTOS3MQZd0RmMpx1Opbyh6BoywKmdACQTGsN3v
         /fDhDmyOp2kj54SyH8zelKrWFEcUlYE4N+LueK6gmzz3QtYZJt+jFr+LaSUj5JKhiraR
         bVyY3t1HcceSOrEQNpGfjw3g8RWXzGPYVC85tqAnVyHvQ1EwLlBqECFaXpc35US/m4Ji
         dUDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7/3WFsDL6hK5ZZVvCl1CBro+LhZqCpnQ4sxprfKHN2OjYKik6QIAAney5meXGrLUZsh9bPaDj6d8r7/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLV3fj69UzhKJgYTbyNSAi0wJ2JEKQD13k0DPdQEvbu8GNMZgG
	om3VrM5UwJcTM4uT+/MQXB93Y/gX0iBqZ2NdIK1VMDd87X7IhOr9ZKHjejfpZNlSDChSdh9Ycd0
	yKFN42yHNQD2e5kzpD3oUs26/T1ms90qLt2gchbdnPDfwalNqtlwyNct2jheDgLqgHWO0SX5AN3
	Y=
X-Gm-Gg: AYBFou1E8p8oEZYZCyW3dJBXKEK+HEO45cMzjOqrW/GvIdYRTAMEW3Kdk4U0qUKRqI9
	0vjiysiYgcw4capmAy8SrxF6t9XGiT3XbjhbLFxWnsX6pp5d2OiVL28ewA3jI5AoEVEToTeBwn3
	WHmgfCo+rAmsY/6Tvb++FNDCwNv1sojxzYs2dNZCqBL6Q3WC48SOLajceM/Tq3KOneQr15QdsHm
	33uJnLXwYpvAYs7zWTUy1R2rYTklZCOpF1VdYOEX99ILEznZ8JOGXG9ZXfrcsT7ZVT2bF9toGWO
	GY1JJx3GCsGbmEoC0NEHNF5gcULMl7c7C7r29im51EUws+25KpfEEe4NCvD53Z+BY4rFaxiHNOE
	chYc21XK5R7P4J+kepilrej3rAx+I0JSdwVrjNoIAm1AIbxkqmKXOuWxrykjtY6tPpToQuuOP4i
	FW7Q==
X-Received: by 2002:a05:7022:2606:b0:1a3:65d7:efae with SMTP id a92af1059eb24-1ac5d0da4a1mr2844798c88.21.1793357051015;
        Fri, 30 Oct 2026 03:44:11 -0700 (PDT)
X-Received: by 2002:a05:7022:2606:b0:1a3:65d7:efae with SMTP id a92af1059eb24-1ac5d0da4a1mr2844763c88.21.1793357050267;
        Fri, 30 Oct 2026 03:44:10 -0700 (PDT)
Received: from hu-taparana-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19c6b969sm6097035c88.14.2026.10.30.03.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:44:09 -0700 (PDT)
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Tapas Rana <taparana@qti.qualcomm.com>
Subject: [PATCH] phy: qcom: qmp-combo: update offsets table for x1e80100
Date: Fri, 30 Oct 2026 16:13:55 +0530
Message-ID: <20261030104404.1945160-1-tapas.rana@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfX3snxgMMkQEoQ
 /GVxUVK5WmQhpskE/yeG+hdirDJEb15S64EU3foaY75HX+TExOs7BrhGkuM6N6vqLHtDfUHIvEO
 YnjI46C/77vQfP/DiseSIWUvXq3xGIXSOWz2+R4vPeXbGWfNYXnHlGm+ESkr3WjRt6Z+3UTT15O
 emKiZZ3vvuwUYLV7LkJ52DWDzZYllLsCs7Vr/7YTLjgazhzoI/Mix1rewWm8q8dr98PkgJDayl2
 k7RmY30OcWhhhzOd/MmUfje/la4Viq+Hn0IvA+i6GQzUUZSTonjkSbe1Qt55sJazoaBLfZFHT15
 FxyH2vf9LPSSHJb1o2R2+8yRVYy6d4g1aunwG42BKs2D+JDkiYxzuYNFvursa4fv/mdDNqMjYP/
 +eBygxwndQJ/qlJqrAYUngQn4i3wmMA3n5eyTGFKKXFVSUUQ5k+tjNLtKKuU78V4TH54Ikhfygc
 0PlsyfPKCJYNbRSH6sw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfX3xuiBn87u/SU
 swrzgYrZ+abzc5CGYyfBleLznk1vbJEUS6XW7PSl5Y3qCQ6DLXiEmeWlTJXD3z9Cy1cKYigLUMM
 4TCvWVV1cxuLnPKM5I49HCK/7vqckqA=
X-Proofpoint-ORIG-GUID: DJT9cdACjYY1CXgtJ33vR3D95TeJvi3w
X-Proofpoint-GUID: DJT9cdACjYY1CXgtJ33vR3D95TeJvi3w
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae474fc cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=WK3x7LZNRzmlshLj7x4A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300042

x1e80100_usb3dpphy_cfg uses qmp_v6_n4_usb3phy_regs_layout, which
places QPHY_PCS_CLAMP_ENABLE in the PCS_AON register space. However,
it uses qmp_combo_offsets_v5 currently, which does not define the
usb3_pcs_aon region. As a result, qmp->pcs_aon is not mapped and
autonomous mode falls back to pcs_misc for clamp control.

Add a dedicated USB3+DP V6 offsets table with usb3_pcs_aon included
and use it for x1e80100_usb3dpphy_cfg so clamp control is performed
through the correct PCS_AON register space.

Signed-off-by: Tapas Rana <taparana@qti.qualcomm.com>
---
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

