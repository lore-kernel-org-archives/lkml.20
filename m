Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFC13C9895
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257237; cv=none; b=hrm+KCu14UdkowWlbFaxtH0+9vmKdkCq2a25oWYS1ZLIk94CrWBAb2lHPE6+P19z/fX1CTpRCCNHBsmzI0FzZMloctsuN7/jgf+mRCEueB9N0dtIrDOLVm0YLYwEyrL4Y12ammyVSPVKaH6HHhAoOD/Sop0qAcfxTV2+XIeapgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257237; c=relaxed/simple;
	bh=qb8oumom/2PvdHzndETk92xid5VBCe3skBrkXMR5kuk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BNeSrWWU4vARpX9jLfgfMOXCRdomEIGEIMmnSkeZSZpPam6dQbzLssnH+s15NewxEC2YvS5WCGUwxprERNbehSJ7KsFBciQymBJy8MstWvE5YEVNJgkqGnf0EkhegGc7ZdpgSbvCSGmKZWj+zDbabajE/9gogwjtNf/fLhhneDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKQN9chq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cBlYi89r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKQN9chq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cBlYi89r"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGA0Ib940537
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6r/UckFAEErFp1xd/71TZeckGQ6z2As9/Zh1h/yB9yw=; b=CKQN9chqQRxHZKyj
	JzCcWINtVC4GKdUDWx4qYSyI4c0WI5ayQxZ0H/v90RThEVhnf8CpSwtMnkJgf9Uq
	G24qti4LzcNbK458nEhf49yIfIbnkSoGdgs1kG4m3S6rwyS6wX/AjqW+nE2Opzdu
	WNAjsiLbDl9F6vtXtz+e6AzCzhy4r61tpszqBDDnDiiQRMaZtE7tfC2zYk4s6/eF
	4kPkSvKFDRgHo4VjrW171t9Dxs0eodlBogXnZUrG52q26QR+IqlMfm7KD4NAIjkz
	Nr7KSGUWvLxAWzQfjr7iX8atx/JSk27MT/Ln2qe//L4Hyc//L4k2QXTCMQ0JAa8Q
	nHlo6A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1se1b2a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 17:13:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so2641013eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792257235; x=1792862035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6r/UckFAEErFp1xd/71TZeckGQ6z2As9/Zh1h/yB9yw=;
        b=cBlYi89r+Q5YrYSqRuxu6AG+AaaY8DknrNCfuXc19rX7pMjcQt1oQwfJhWoumx6Ys6
         OjjR9XMMtMJ2XFYPXrOioXWHmL6d1DOeIvafWmwbfs56sm3hLQ2BfIy2VEjH80+rsNBG
         yWeHAjWQEHYcld/tHoloeYIqs2nmyLabvpnnMgx5JedR4Uh8zp1Z9s/imfpynAkR80HX
         qFAlg9NlMoTi6xJBhSjSA3sJTHj0HjtHaYX9T8yYkLG4H8oerxZIgPA2tnuUk/41/niq
         1WZXTC+HSVkFOPOUm4EWyro9rusFu2D1IEfOpZPxdr7EXS5URXPI72TCtvxermlq5xqK
         85dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257235; x=1792862035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6r/UckFAEErFp1xd/71TZeckGQ6z2As9/Zh1h/yB9yw=;
        b=pL8kb0kmkTCUJXyyV7qb6dBHyt5khPXxW19KUiu/DT5aQI5VxCnng5AtrlBQDqh2+T
         EZ32B/PWZf+RCh+XwGuFOf5I8jjn9+GOJKbR0ud/ui6zySBvrvWToOygXaTJPvS4xnPZ
         FBvO01/QqnbIdhUj0IbQBFZZtlbR6pPOJDj205L6CGPXhACkTIiSVBbelZ2pXEebZmeP
         ooT7pzkWJxGNW8fDoJphIsqQk5y2rwVH53RFUhI3gDx6Vog7LMDzODYPE8SBre+OB07r
         RP4b2o+uTcr4hWR56dfoFwhJHr80ItOysPB/msQN+CvWHZjq1jO+PfU0WFmykSZwbjK8
         fHsg==
X-Forwarded-Encrypted: i=1; AKwUvBxDy/97u4ho6c4AWIK3j0cao/fCWyapnNsO+kqanXV2ZfPi6Y45hQTGN3WDiGIz2X02G99g9DxRHd4pZSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIArCve4/nShXg5TPgl8Yz1PM4eoJd2CvxU+ZSABmlgFlSQ153d
	edYMGQoHfaDZvasq/r3QjwC09JN7Qq0glh1jlpd/QF5+8DPUdoo9UXa/CNll0/hKSJVlC2H+lKK
	W7f/zM/Z982U0tcAYE7R/l2rirfDdczJCVmn0moLew2r75rk7lA+mhDBai8rjn2UIQ+IfQQH0PN
	4=
X-Gm-Gg: AYBFou2CjnPEW10xocHBrNhWMFESmlkQ8Quokbwvs69v8xUjxmpYdhqb0uHTqUmnzKN
	/KjZaqOvKw1X7LVfAAldQ2mLIXgqsuH4TZHdAJky0+xeMmti38z6qtOeLbXeD3p+v2/cli+Fdrc
	5LuF8JTT3ysJcsUPskT2n0Hut6BEK+pmtUwuYXlz+8JvudZ7tHmVpnJorXRFZNuUykq3eNaJ+mw
	jvJNQz2PH7oXy6oAFqsgAAXi8sT8UYEKZxgL1ZmUuRMdRVfc5pAdBjENamo2s5insBQmoLYa9zS
	U/WWqoLRUrTHlkCSzRDSSsvj3ndfhABeuddSiViZ/FxkV0OpqWO3W17ZoLrfgWtBxpt85czxdyh
	nmgJ4I5tlMxXLZOPkav2/3i7jDwcRyg==
X-Received: by 2002:a05:7301:6447:b0:35e:2c6:d46e with SMTP id 5a478bee46e88-361a312a4a0mr5991262eec.41.1792257234710;
        Sat, 17 Oct 2026 10:13:54 -0700 (PDT)
X-Received: by 2002:a05:7301:6447:b0:35e:2c6:d46e with SMTP id 5a478bee46e88-361a312a4a0mr5991237eec.41.1792257234186;
        Sat, 17 Oct 2026 10:13:54 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17893966eec.7.2026.10.17.10.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:13:53 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 22:43:13 +0530
Subject: [PATCH RFC 6/6] phy: qcom: mipi-csi2: Add lane mask calculation
 for C-PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261017-cphy_support-v1-6-8b0e1237ce95@oss.qualcomm.com>
References: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
In-Reply-To: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792257199; l=2691;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=qb8oumom/2PvdHzndETk92xid5VBCe3skBrkXMR5kuk=;
 b=5Z4ib2LnjfubTXuDJJ7kiwx/2IhiPqctYmRM+7eplTS5rb59j7to+uW3kA1nvHLdH7YdpY7Bb
 dvgIQioOe4fC/FtdKCYSWiYENddLBE5VezRTXKnQVSj06hsRhKqO3Xk
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-ORIG-GUID: 5q7pDS7PSqxsohTG4S9-hly7zc24I2xH
X-Authority-Analysis: v=2.4 cv=A4z5rKWG c=1 sm=1 tr=0 ts=6ad3acd3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=32Ig6A5ggYWErfKYfvQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 5q7pDS7PSqxsohTG4S9-hly7zc24I2xH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX1zUHnZgzZ0gf
 Es/9Y6bUhTeduhIjSHwIOfiKuxn+ek83klHGeH9OTLdZuKdiLIqPUmEea9XyyGn8ia47N9VA9EU
 DQcYb+1rONAzIqvWLlJzLp1e7qEG1nk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX0+wpn/yYuGiU
 HfjZAa69Fwa0A17wNru6H7k34M4wuNwbkEuqzxLbn4VsZDUkABJd07oOYo3w5bQHu7nhWFvntCe
 j1vferGEBOGRlILVwNf3e3fKyDN1xrD3au1873htNNEi2kgCAMMPr+MG6kCxEzH3RqZlK4VyOUd
 z31ASvPqOnd1a3YDc3kk5OI3JGDNB4DOYT0y1MhO1O217gq9APbhUu8jf2QGhSZ0w4+28QtKypc
 BmTkT0BN0SLT9vcMu5uHtyWCOmiGqX4AlPUxK3VwNDeMjcgm94ANS0hmkAsTHsHlQVGBRdXo7e1
 jfleHlQqaSdFxHQxVKOXiKr61p4j1TIWhSxCJxp6CZDa+BlJ4wOJoop9v7+sVvFzuXI/innZ9vu
 ds//Vef0lzvE7rnZxdvqE8UmSbTQFf5nfn5e68IjXiLedmTIq2SnaaWfEDnEYKXAGcJgw1kqAOB
 Fh5EoA0EFbQIsB6Mqaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610170068

C-PHY uses trio lanes instead of D-PHY data+clock lanes. The existing
lane power-up mask hard-codes D-PHY bit positions and cannot represent
C-PHY trios.

Extract csiphy_get_lane_mask() and select the correct bit pattern based
on the configured PHY mode. For C-PHY, data lane bits are shifted by one
to target trio positions [1,3,5]; for D-PHY, the clock lane bit and
even-numbered data bits [0,2,4,6] are set as before.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 40 ++++++++++++++++------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index d93fd9845b50bd7e5623013aecd6db42dd491dca..5e7036cb7205d75c988a281eced60658b45c73c3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -322,6 +322,35 @@ static u8 phy_qcom_cphy_settle_cnt(struct mipi_csi2phy_stream_cfg *cfg,
 	return settle_cnt;
 }
 
+static u8 csiphy_get_lane_mask(struct mipi_csi2phy_lanes_cfg *lane_cfg,
+			       enum phy_mode mode, u8 num_data)
+{
+	u8 lane_mask = 0;
+	u8 offset = 0;
+
+	switch (mode) {
+	case PHY_MODE_MIPI_CPHY:
+		offset = 1;
+		break;
+	case PHY_MODE_MIPI_DPHY:
+		lane_mask = BIT(lane_cfg->clk.pos);
+		break;
+	default:
+		break;
+	}
+
+	/*
+	 * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
+	 * - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
+	 * - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
+	 * - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
+	 */
+	for (int i = 0; i < num_data; i++)
+		lane_mask |= BIT((lane_cfg->data[i].pos * 2) + offset);
+
+	return lane_mask;
+}
+
 static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 					   struct mipi_csi2phy_stream_cfg *cfg)
 {
@@ -351,16 +380,7 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 	if (!settle_cnt)
 		return -ENODEV;
 
-	/*
-	 * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
-	 * - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
-	 * - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
-	 * - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
-	 */
-	val = BIT(lane_cfg->clk.pos);
-	for (i = 0; i < cfg->num_data_lanes; i++)
-		val |= BIT(lane_cfg->data[i].pos * 2);
-
+	val = csiphy_get_lane_mask(lane_cfg, csi2phy->phy_mode, cfg->num_data_lanes);
 	writel(val, csi2phy->base +
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
 

-- 
2.34.1

