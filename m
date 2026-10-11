Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797B4466B00
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791723801; cv=none; b=uD/NB4e7l6H5nKCfIjBDSsXZIRGr5TDjhKsRfcx/5aEZQB9MGou50R7Otod5cBLDfoJy0EIEAMTrIE3i40I3hec1IZ9V1RGvrH6BbfqhGoxoyit6izj7vgBNzOBPKOeWWEOsH3Wr1jTJKz3GhsCrFrW87zAm54wSt4MpEBdB4EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791723801; c=relaxed/simple;
	bh=LzCeZKAeElMBbG8oBfifGKwuQthMLr/SjPcbOKrExas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VaswwRmuDiUpuoQBpN5Seq0+iqkR/UlftZ750OQ+y83twLQ3jFgULXFRETdra8sQTfbaaaR/FsQnpgiATdPVD0zfxZ8MExq85hoVQtt1TPlHcn1bOvyoXt2Nr6w94zcunHv9hHGR7UK+hv19CBS9wTeSrcluTj1Q38PfcGq4PUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dGusLiar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MuXWHvoF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dGusLiar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MuXWHvoF"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B85HOG1512990
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JA88v3vumURA0GFtGxz7qCl1Btjc9JmdyDTd4mqbKEU=; b=dGusLiar0Ue7izgs
	i815W2s1nJZ80Xa5A+hNqJSNHIKXJkcShsdhuPyxRIADlDMpzIzGctEDusDZaVrL
	HO6o3r4ra8p1BBeDD2VSmaHE6NQ2D8hrUyRXZ/y2iGFwBgLruJoez56I8NToY0zo
	vuME+7wV6G9hqM+cAxr5yX71LKUrNLvjpxNIMya8ihvBSzwH78a357EY2ooVEcyw
	/OZ+lVDIVk91OaSB3YDVfbmTI6KMLf4bdWBEn3ax3M+ghrpmFFBTmO306XDegVGt
	s35J7YVDooj/xCYaIOm39adShOJE7fEX+mB8lUmA4jovq+uxTRPrjIEEXeJ4WXaj
	zvzO5Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7ehjjx15-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 13:03:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-358856e5105so6355990eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791723797; x=1792328597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JA88v3vumURA0GFtGxz7qCl1Btjc9JmdyDTd4mqbKEU=;
        b=MuXWHvoFWYpMpajv/2ECiD/CusAQOA5ptnY2cvL6Hx4wOIHbqVSM9sPewt4ztqQOEB
         W4356NpzgCmnGKsKZ9aV5+NgUzr+Pzwfoik5rqMWqWGEfy6bxRwbc4XpfJsuI6DDmaQ4
         6r7bY9Zwe8gq4P6k/Oc5w4nWpcaLY/E8B6OgY6Zk5KWesJx5d0R4tmoOlKexn62cUwB7
         6tE/yR4N9adpb/8lj+SRF5me4ehSCTxEYxctO4Ctc6k2IkFzhB3UR3V4QJGtXdkPYO9N
         uGhYFOT9IwwrjWml0abuU4ymgV8IABdWZnfhJYV0LeaJVrjbr9T0eR5km5/7I/WwrClC
         Q92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791723797; x=1792328597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JA88v3vumURA0GFtGxz7qCl1Btjc9JmdyDTd4mqbKEU=;
        b=geuLwxje1PT/4gBfKfwNYZWCJLGWVSEL3zFEcmVKDHVAnJhvjVMFVTg3w5dVojLF0k
         d3KM5yijirYLUp0NNTUdKv2kBvZ4wv9uQ7nIiMOqKqDdFaI3e+7i0jaB4YqfzNCDiPnn
         u0HHRRcbMinORc4AaJPn1I+3qDrSsM3aa9pxs2HSOB5NVABMoNF0a1ui8eGCxiJPWeg2
         twzRcbq1vPk10jdJCrUL5b6ZRmxHYr+gSjitAqlBAaSlprNOGmzhuwA1Ep2RarXbGR7y
         X4kC405jB71EIINYumb/VzSNIgdIzBsY90Sxx1f226f2MkbF5NheoxeYUkm5luCTZkeI
         nHkw==
X-Forwarded-Encrypted: i=1; AKwUvBwPe0f+XGbKMzLgB+PgzZhNaVFjC9+GdfqYBbbyutZE5dJuf1JNp8ZR6sokpkvE3JrHPGVChK1Y5Kkphbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqLmKEj/1LlijZBKaUG1Xa5oKVv2eEc8HeG6SsGWiOTnrevOKr
	mq21y0ydDZsrlD1XNBYMb0DrgvcjbgIx2Nz77r+njs6LSs53BkT3s1FScezLnmJQYIAEsXhVq95
	35NXBO42BQohpwipYKO9CcHidkN7rgA6U37GEx6f/hajCXoDdtO0lGxvwkV3l38+gF4M=
X-Gm-Gg: AYBFou0vdvd+uuK6legfOnN0mSxrsYo8a/YyI2YZ62AwlP0404zbuYoWBcwCizHICdA
	/UywTrk57iSdOCkff2Qneuc9v8akAiOBGQC2Jv9021Mfqyx/F45e5LsYkEhARfXwdISgU2PaYtW
	YN7ZumO2jN42fSW/wHWQM9wJwNMqYnuLnLc7g5VkUie2tJ+pspsvsgv661NoVQ1ri8Cy17/V17h
	WDFiY5bYIWymdCtywIJo36R8ErXEpWTTdNGiywAKvMoN0jOCDTl1JcGsNareyEQr53J3sDIU6/+
	I6R3bnOmLPnEtBHD5XbAEMQ6+4Ad2yH09G6JeETBLCdvJEfbZ2WERYW+15RNR2QuPMDG3NId3W7
	+Z0L0sjy0OHNBuhlh0pQ5Uei785AU/gMVxnuqHMjrQns=
X-Received: by 2002:a05:693c:42c9:b0:359:9e84:dc99 with SMTP id 5a478bee46e88-3599e84ea9bmr2044971eec.0.1791723796722;
        Sun, 11 Oct 2026 06:03:16 -0700 (PDT)
X-Received: by 2002:a05:693c:42c9:b0:359:9e84:dc99 with SMTP id 5a478bee46e88-3599e84ea9bmr2044921eec.0.1791723796028;
        Sun, 11 Oct 2026 06:03:16 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm27009074eec.3.2026.10.11.06.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 06:03:15 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 06:02:16 -0700
Subject: [PATCH net-next v2 10/11] net: ethernet: qualcomm: ppe: Add
 IPQ5424 service code configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-qcom_ipq5424_ppe-v2-10-8c7b057e2c43@oss.qualcomm.com>
References: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
In-Reply-To: <20261011-qcom_ipq5424_ppe-v2-0-8c7b057e2c43@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791723782; l=4414;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=LzCeZKAeElMBbG8oBfifGKwuQthMLr/SjPcbOKrExas=;
 b=UHaWfD89K43dF0HYRi+s0BJbuVYm+46yBytCocMNZG5gd5avuOpM3r43s3zFqsRCfdbLr53kK
 sn4ZPH5ShjKD0Daf7SSs+PAB9gadWgjhDgGsRCpl/klk/Bf3qN2bq92
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX+LMSNVaEixn6
 6KYPM5Gl+jKvKIN0xwK50fT7V5+xNnwQ9XunNwDcE0ovK58ShkZgMZnDUDnrW398y6//7J8qxYa
 uvoCsB3vJ9zqwLcDk9ZM7vxrmKFGFdjD7C4457vPG+W01aIvkghjXaN0vkQqj83al/eojmmSmeL
 3aWClKSrNPqXFulriq55vftWA2OmxU6ddkv6/XpJueHQjQh9wgx4pCKRusDsqQ659EfPYInp63r
 SGOfz84/xY5H/i0nsFqvXt5YiVkEm3RGj8MLhyY430T6YjXyoZCSNDvXgSyu3kaO0exsWYHPBNq
 JpfhBIHwqvjgz80WdJ2IiegoLJi6EZQrLkrspwDIhhJK/SIP8+mF4pQ9zhI8/lYBAHODoAdzoZd
 uAxxuj7LBgOG8HxCG4Stjs8W7Fpy/nfj8VIZtPq4BXeH+PKDMkoBVtyjnvQoNLlBLT/uWMLeq+w
 tKhiTcTJGYJ7RfO5+9g==
X-Proofpoint-ORIG-GUID: OJ54PtYbF7gr5TX4kUgKzE7eLmBlMLOI
X-Authority-Analysis: v=2.4 cv=MpTHeGae c=1 sm=1 tr=0 ts=6acb8915 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Pd_C_hmTYow6CwTwDaoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: OJ54PtYbF7gr5TX4kUgKzE7eLmBlMLOI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1MSBTYWx0ZWRfX+D6ERVKbsYE4
 JCy4dNJcac+/r2DG27XPmFmUx/EmNOhAF/8yYFG/M9IQJ/iTGJQx/GRsz0unXXo/BhOp1PPO/hb
 5A/nCUD3xSuOsVJxwPqu2ESvmfbla8k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610110051

The entries of the L2 service code table are 0x20 apart on IPQ5424, instead
of 0x10 on IPQ9574. Each IPQ5424 entry also has a second word holding the
extended egress bypass bitmap, which adds the bypass of the source MAC
multicast drop, L2 flooding and tunnel exception counter control. Add the
L2 service code table stride and the extended egress bypass bitmap for
IPQ5424.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.c | 13 ++++++++++---
 drivers/net/ethernet/qualcomm/ppe/ppe_config.h |  4 ++++
 drivers/net/ethernet/qualcomm/ppe/ppe_regs.h   | 12 +++++++++++-
 3 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
index 017d2e834251..3dc1bcc8949e 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.c
@@ -1476,7 +1476,7 @@ int ppe_port_resource_get(struct ppe_device *ppe_dev, int port,
  */
 int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc, struct ppe_sc_cfg cfg)
 {
-	u32 val, reg, servcode_val[2] = {};
+	u32 val, reg, servcode_val[2] = {}, in_l2_val[2] = {};
 	unsigned long bitmap_value;
 	int ret;
 
@@ -1490,9 +1490,16 @@ int ppe_sc_config_set(struct ppe_device *ppe_dev, int sc, struct ppe_sc_cfg cfg)
 			  test_bit(PPE_SC_BYPASS_COUNTER_RX, cfg.bitmaps.counter));
 	val |= FIELD_PREP(PPE_IN_L2_SERVICE_TBL_TX_CNT_EN,
 			  test_bit(PPE_SC_BYPASS_COUNTER_TX, cfg.bitmaps.counter));
-	reg = PPE_IN_L2_SERVICE_TBL_ADDR + PPE_IN_L2_SERVICE_TBL_INC * sc;
+	reg = PPE_IN_L2_SERVICE_TBL_ADDR + PPE_IN_L2_SERVICE_TBL_INC(ppe_dev) * sc;
 
-	ret = regmap_write(ppe_dev->regmap, reg, val);
+	in_l2_val[0] = val;
+
+	bitmap_value = bitmap_read(cfg.bitmaps.egress, PPE_SC_BYPASS_EGRESS_SMAC_MC_DROP,
+				   PPE_SC_BYPASS_EGRESS_SIZE - PPE_SC_BYPASS_EGRESS_SMAC_MC_DROP);
+	in_l2_val[1] = FIELD_PREP(PPE_IN_L2_SERVICE_TBL_W1_BYPASS_BITMAP_EXT, bitmap_value);
+
+	ret = regmap_bulk_write(ppe_dev->regmap, reg, in_l2_val,
+				PPE_IN_L2_SERVICE_TBL_WORDS(ppe_dev));
 	if (ret)
 		return ret;
 
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
index 60493e51e0a4..e7cdab9d963a 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_config.h
@@ -163,6 +163,10 @@ enum ppe_sc_egress_type {
 	PPE_SC_BYPASS_EGRESS_FAKE_MAC_DROP = 21,
 	PPE_SC_BYPASS_EGRESS_TUNL_CONTEXT = 22,
 	PPE_SC_BYPASS_EGRESS_FLOW_POLICER = 23,
+	/* Values 24-26 are only supported by IPQ5424. */
+	PPE_SC_BYPASS_EGRESS_SMAC_MC_DROP = 24,
+	PPE_SC_BYPASS_EGRESS_L2_FLOODING = 25,
+	PPE_SC_BYPASS_EGRESS_TUNNEL_EXP_CNT_CTRL = 26,
 	/* This must be last as it determines the size of the BITMAP. */
 	PPE_SC_BYPASS_EGRESS_SIZE,
 };
diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
index 441e8e04a80b..089aa34b7732 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe_regs.h
@@ -223,13 +223,23 @@
 /* PPE service code configuration for destination port and counter. */
 #define PPE_IN_L2_SERVICE_TBL_ADDR		0x66000
 #define PPE_IN_L2_SERVICE_TBL_ENTRIES		256
-#define PPE_IN_L2_SERVICE_TBL_INC		0x10
+#define PPE_IN_L2_SERVICE_TBL_IPQ9574_INC	0x10
+#define PPE_IN_L2_SERVICE_TBL_IPQ5424_INC	0x20
+#define PPE_IN_L2_SERVICE_TBL_INC(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_IN_L2_SERVICE_TBL_IPQ5424_INC :	\
+					  PPE_IN_L2_SERVICE_TBL_IPQ9574_INC)
+#define PPE_IN_L2_SERVICE_TBL_IPQ9574_WORDS	1
+#define PPE_IN_L2_SERVICE_TBL_IPQ5424_WORDS	2
+#define PPE_IN_L2_SERVICE_TBL_WORDS(ppe_dev)					\
+	((ppe_dev)->type == IPQ5424_PPE ? PPE_IN_L2_SERVICE_TBL_IPQ5424_WORDS :	\
+					  PPE_IN_L2_SERVICE_TBL_IPQ9574_WORDS)
 #define PPE_IN_L2_SERVICE_TBL_DST_PORT_ID_VALID	BIT(0)
 #define PPE_IN_L2_SERVICE_TBL_DST_PORT_ID	GENMASK(4, 1)
 #define PPE_IN_L2_SERVICE_TBL_DST_DIRECTION	BIT(5)
 #define PPE_IN_L2_SERVICE_TBL_DST_BYPASS_BITMAP	GENMASK(29, 6)
 #define PPE_IN_L2_SERVICE_TBL_RX_CNT_EN		BIT(30)
 #define PPE_IN_L2_SERVICE_TBL_TX_CNT_EN		BIT(31)
+#define PPE_IN_L2_SERVICE_TBL_W1_BYPASS_BITMAP_EXT	GENMASK(7, 0)
 
 /* L2 Port configurations */
 #define PPE_L2_VP_PORT_TBL_ADDR			0x98000

-- 
2.43.0

