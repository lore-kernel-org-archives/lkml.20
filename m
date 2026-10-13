Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B337153F6A0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919684; cv=none; b=qMyz9FmdE8QKOLaywhZQujIUMsdZGeUdwIuvfiSMZOoLhi8eI1AqkxFemoKsTxlVKUcZWcoE+1ox0AHpVmneKHCGEQKvTMtfA2NC+1LqQ9GmYPpuSOHneLX9lR3+EjY8ALugFBdrvs2P+y0pcn/SkuM6ICDKt+ch+1VUJ8TX0Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919684; c=relaxed/simple;
	bh=xucrSKdY7RHaRI/nkBngy1nF3VmGw5oHTLPPGDCeYIg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=u5uqtrDXfrKD84dQqDD6kKZIMrcHE++nQM6D+o1Tl01p1yiSfhgfebnVwiPGmNNlCCM6A/eNmvhqk1Jrnp4bqK8NR+iVVGYj+Qs0kw+4paP36VrZSvcNcbLtCleS0mJMUNYOHIEPWQXxg/aXumq9K5zo0JzV4JN+0yQOkV91wMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jqi3ZzIA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R5zOEO2T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jqi3ZzIA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R5zOEO2T"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DHkcJt3000877
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:28:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2+k4ctYw0tM7rWPRbxKyU42iiDXNk6+I0nc
	8Mj/rlXA=; b=jqi3ZzIAx1kO09gO94XLKJ/BnI0sCk2YdIqPZu74a7GkhcLKnqt
	wVml33XvSLmoqwMCCjtKWT9fIR9mdsVTDRJihJgFsOBU7lAZ8tdFiXh7rNsLx9GU
	G9zEPU+8HprJ4zMNJI+6GP6m86SwdkoW5aLonjTQZJhSIdSWDzeZBoP2Kzmy+lkA
	B4bfjDkvE9YKbbWR5YJbYjQ21bX/KU5gjEl2Jw0ArUzCNb18dfr7jpoe0B9wnVVq
	shqJe42mEGJxwSTMOQGN0vGon/yaakxcie8XmBDNPNy7gOhMIshQOz0rSb0bQGhM
	FmY0fdJpv5FU+h/qK6jqKGpv4mW6Zz/y/jA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sberfun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:28:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35a4d2e39acso641993eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791919681; x=1792524481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+k4ctYw0tM7rWPRbxKyU42iiDXNk6+I0nc8Mj/rlXA=;
        b=R5zOEO2TfHpqmke88kU5Y3A0XVccUT+WeQ+Ifx2FjJ+gWwDqjswjIDMrt3VBUs6Fli
         y8K/gdNhPtLmvyA5FMz8jZ2ZBQmlzk8rQgH/KMFxXd1hm6DmQZcmB7y7JuTmxA1zwyus
         zX/Iok8CWDqJTDDZfZ9My07DfvfIef4wazchBgYZck5tPYJDvmrDfGbrbsF0/4g+k4Ct
         ZDfOrjHvdnn6E7rcDlfEumVnFO/Rbg7ZcUak7m5gBJtB8Jl3GEPk0RrQzA7nlJswXiD0
         YYptSAvjY2BsVxQiGNgpBREfaGRWpFFgAQJsazGs0GtUStuvE7B57bTmPq6ucfIk8KIA
         ZsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919681; x=1792524481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+k4ctYw0tM7rWPRbxKyU42iiDXNk6+I0nc8Mj/rlXA=;
        b=vmaU3Z3FfLgcSIzM9Oj0lZ3udimwhWr2MHfLnetHP1oCVhzUfkzfTYCI3Lp245Fiy7
         cvS8vYF2pYh2g7uFjkTDBBNtg2erge6uPK10tmzV9Ag8aJr6wzBPGHqkEByKQkg/YaQn
         gYmMnbHPwKKOydg0Yjf4WFsAqvYCpM7wsRQXv/iFeQpxY3vKx5G9hdXtwlWblFZEWKBl
         AY5oUyxWVj7BqCb0mL7UWWCFNVV7REOCKsZwKrLYsokYk65VF9UFpUop/qDnSPNb0qb9
         5vTIBLZqxmVJpLSKivpXE3IalJRwdLurM61RIEegq4WHOANgibVeZ1QGPNThwsI1+az3
         v9Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxyYl9/THYn0XeLZ8d6OVGXR5FqEl+REnNd/SJd06j8GEQlDNifrWkOTx51e9x8z96VDYtxyWpz7Y8zdyg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY8ZzulQ2d9+BcRqI41AGSIgB0ryaKObuxgUaw0CQMpbkpYkoi
	oEPEOGoGi0CwKhpDd1x4NPpkVvoa/+ValQdKydwa38Gywb8+DX/yrWG63+mf2ZwTxoetRRwVjg9
	SjwbHLyOntrTWQgBn3uqXS7cM7+hxu/aeUc7atMVnN5bIx9IGqwhK/WVsM5LDu6CbfJo=
X-Gm-Gg: AYBFou1tB1mFjgzKEkcix4pyJlr395i9avfFlMT+FXBOfeGQnwrykxTzuxY0iXxr99Q
	rUvm8OoG4H244pPuJEOZngu9lvd7ONdVco8ZilUcbkyXVjnskoZDxqKPxWczamIjEc1KnXkWevB
	l08F+kBlb+gik0IIJWV83xAcIiDYky+p9A7A355BJ+g5NOfkbu2yXgiNrsvaTFjgNWiUw3VG1T3
	3xKz/EBB1ftnpVWXlJlcvkGKLEwI23i0a0TZ6ow4xfbOH9MXL/IRqMyqJxxVvTJF4S8ukC0xBxy
	jYwW2ZTRwZPF5Tl3IW50stljTr0pGG03uFlKiJlBJbD7kO/6Kz6tnhHpYpI46O0OVKcvmPmltZ2
	ZxuQYwjtA3MeZX9Epru4h+AoTw8vTfbiLnmoneQrLLZhnUdBe3TJO36r76smLlw==
X-Received: by 2002:a05:7300:da15:b0:359:6382:5e52 with SMTP id 5a478bee46e88-359638267cfmr13096823eec.17.1791919681018;
        Tue, 13 Oct 2026 12:28:01 -0700 (PDT)
X-Received: by 2002:a05:7300:da15:b0:359:6382:5e52 with SMTP id 5a478bee46e88-359638267cfmr13096776eec.17.1791919680365;
        Tue, 13 Oct 2026 12:28:00 -0700 (PDT)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm60000008eec.9.2026.10.13.12.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:27:59 -0700 (PDT)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: [PATCH net-next v3] net: stmmac: dwxgmac2: enable L2 split header support
Date: Tue, 13 Oct 2026 12:27:59 -0700
Message-Id: <20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KWE4uh1vPsNTeX5aXv6zCub2S4bqV4bt
X-Proofpoint-GUID: KWE4uh1vPsNTeX5aXv6zCub2S4bqV4bt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfX+vEk32X61rsj
 jn6Dt1HcfVRekbtWZnCOynpb9z9aa8hsNscnnr1vtTGHfNOJdcOTL3fZmwZrUQfOrBjKyrcJuQk
 NACcdXtNSxcgpIrrjh43yywyuSd54zLHCfuUPVgJtJkwPho7TS/qnnzprB//JeATRXvSi0Meya6
 QozgR0Lwppngcq+zfF8PiQxSXOuQPwcEBY8HVBpVn1ZjVFFnjSkY2MluQPsrIBEw9tUrE5RleRc
 nlujLKt06vifEuaMAG8ZIzNz//gPfs0lqqD7IOidhj9QlkzvDllzB/VjPcnaAvvXDRLUkF+qJ9d
 d2S8eqwD1PPoQQaWOfJ0QnXPC8AuLU5D1LrqmkwRArEnlwPO7MJOVUXxwCulqQnc6hgMpXMA3kC
 ein0IeoFWefQm+VfOyQdH3B2lCcrlTet9oGpSGcEWligtA9GLbvS0GUsxT9WnFxFajzEpC+arG/
 kAFiG9dGJVEYrFTch8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfXxhMCYyfmuJ5z
 12LerDQYsy5otQmBqKCGLv/6iwd2tmizrTwtEZEM7zji70je7EkzXiGyyGAy+W0I9kxPEJb2UAT
 MCHwIV97tLpuhTEynWd4lbNE1t7RC3o=
X-Authority-Analysis: v=2.4 cv=U7AHnuru c=1 sm=1 tr=0 ts=6ace8641 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4efHNOip1X5BxVcu0mkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130077

XGMAC2 doesn't program the MAC extended configuration registers
needed for L2 header splitting when split-header mode is enabled,
so tagged AV packets can't use the split-header path. Configure
split mode (SPLM) and header saving (SAVE_EN) in XGMAC_EXT_CFG1,
extending the dwmac4 sequence added by commit d10f1a4e44c3 ("net:
stmmac: Programming sequence for VLAN packets with split header")
to XGMAC2.

Also fix the RX header-length calculation for split-header
descriptors. Per the XGMAC2 descriptor format, RDES3's L34T and
L2T fields are only valid on the last descriptor (LD set); on a
non-last descriptor they can hold stale write-back data from a
previous packet. Read the header length from RDES2[9:0] directly
for non-last descriptors, and only consult L34T/L2T on the last
descriptor: RDES2[9:0] for IP packets (L34T set) and RDES2[9:2]
for non-IP packets (L2T set).

Finally, disable the variable-length preamble when L2 splitting
is enabled. A variable-length preamble shifts the position of the
Ethernet header, making the L2 split offset non-deterministic.

Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
v3:
  - Use zero-padded 0x00000140 for XGMAC_EXT_CFG0
v2: https://lore.kernel.org/netdev/20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com/
  - Add XGMAC_CONFIG1_SPLM_MASK and use it in XGMAC_CONFIG1_SPLM()
v1: https://lore.kernel.org/netdev/20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com/

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 12 +++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..7d1a7802a131 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -167,6 +167,12 @@
 #define XGMAC_HW_FEATURE4		0x0000012c
 #define XGMAC_HWFEAT_EASP		BIT(4)
 #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
+#define XGMAC_EXT_CFG0			0x00000140
+#define XGMAC_EXT_CFG0_VPRE		BIT(8)
+#define XGMAC_EXT_CFG1			0x00000144
+#define XGMAC_CONFIG1_SAVE_EN		BIT(24)
+#define XGMAC_CONFIG1_SPLM_MASK		GENMASK(9, 8)
+#define XGMAC_CONFIG1_SPLM(v)		FIELD_PREP(XGMAC_CONFIG1_SPLM_MASK, v)
 #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
 #define XGMAC_MAC_FSM_CONTROL		0x00000158
 #define XGMAC_PRTYEN			BIT(1)
@@ -434,6 +440,7 @@
 #define XGMAC_RDES2_L4FM		BIT(28)
 #define XGMAC_RDES2_L3FM		BIT(27)
 #define XGMAC_RDES2_HL			GENMASK(9, 0)
+#define XGMAC_RDES2_NONIPHL		GENMASK(9, 2)
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
@@ -441,6 +448,7 @@
 #define XGMAC_RDES3_CDA			BIT(27)
 #define XGMAC_RDES3_RSV			BIT(26)
 #define XGMAC_RDES3_L34T		GENMASK(23, 20)
+#define XGMAC_RDES3_L2T			GENMASK(19, 16)
 #define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
 #define XGMAC_L34T_IP4TCP		0x1
 #define XGMAC_L34T_IP4UDP		0x2
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..65ac5403ec58 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -292,8 +292,18 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
 
 static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
 {
-	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
+	u32 rdes3 = le32_to_cpu(p->des3);
+
+	/* when FD=1 and LD=0, HL is RDES2[9:0] */
+	if (!(rdes3 & XGMAC_RDES3_LD)) {
+		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
+		return;
+	}
+
+	if (rdes3 & XGMAC_RDES3_L34T)
 		*len = le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
+	else if (rdes3 & XGMAC_RDES3_L2T)
+		*len = (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;
 }
 
 static void dwxgmac2_set_sec_addr(struct dma_desc *p, dma_addr_t addr, bool is_valid)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index ff83858ebc1f..0a9c787305a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -561,6 +561,16 @@ static void dwxgmac2_enable_sph(struct stmmac_priv *priv, void __iomem *ioaddr,
 	value |= XGMAC_CONFIG_HDSMS_256; /* Segment max 256 bytes */
 	writel(value, ioaddr + XGMAC_RX_CONFIG);
 
+	value = readl(ioaddr + XGMAC_EXT_CFG1);
+	value |= XGMAC_CONFIG1_SPLM(1);
+	value |= XGMAC_CONFIG1_SAVE_EN;
+	writel(value, ioaddr + XGMAC_EXT_CFG1);
+
+	/* Disable variable preambles to keep the L2 split offset deterministic. */
+	value = readl(ioaddr + XGMAC_EXT_CFG0);
+	value &= ~XGMAC_EXT_CFG0_VPRE;
+	writel(value, ioaddr + XGMAC_EXT_CFG0);
+
 	value = readl(ioaddr + XGMAC_DMA_CH_CONTROL(chan));
 	if (en)
 		value |= XGMAC_SPH;
-- 
2.34.1

