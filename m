Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7FC446C0B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791398351; cv=none; b=u8cdCQVvcBvijsjl/b4IUpRZV/XnfWPeX9RD1nxAQa76U5LZj/VeZRxrYQdmfwcw7BlagjoxFsSNkp+uUWQRk5PX1wXchC0Cbba/TTZmph53ns8O7i7z/7iuDfdAo1MJJh+rLmV4z00gOUMXSf+ERA4bAiIazUwxTV+kWMeqDH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791398351; c=relaxed/simple;
	bh=D2ZtgQBWKQ5Iud3OZOgKL0eZGpuLy8bWlw4qlcJDpU0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jWMFeoJTQt1BmTERFDQ4y6tY4fPMFIIbAue8ba2/9aVnlrVJA5OYcaqpkaJDH2V/JRofEmDt03H0N11N7HbbXVnhB6Ef6oPMZFQMRKiSGR3MyEpUKnFyObuoeE3Y9xCcDIZRkwSs1vXhDTxtaAsUv4T+dnq0UUFvf8TSQgUkYqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mPPZ1+pn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMMem1i8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPPZ1+pn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMMem1i8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697IBFJU991659
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 18:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=HORHFDrmI/BPkmzKwb7d3T8boR+07sV7F6A
	aiYBuxXs=; b=mPPZ1+pnO/DRbWx2a/GGFz+B9YxyfdzSVwmRQekU8pvjx2cmVCT
	MhSSrVJTxnFswZJyBO7MeHKUT1YQyP9GjiA7KKFlbJikQpYun5ZfKiMcsvRGUQu4
	iKgA68wvAPxVPlsDuF7RO+JsXLQyDGZGBc0u+tHeITZBOpQRrg6O6LVLlpEt7VnF
	8nCJGQHFgk08PnDd11JWlD5L/TrRSVohe7flmydpIMxiSU8AUpV7rzaJO691cIJ+
	PYSV60xg8ECFPRxHBOsIa0ppbiJEH1WvCoXreH05fp50bkUAf4kJ5/E5+jM+rHXB
	+2JqsNTPmnwN9zOb25aO2t5l6A4FmUUtdSQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrtqrb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 18:39:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35158d674e1so5054113eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791398348; x=1792003148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HORHFDrmI/BPkmzKwb7d3T8boR+07sV7F6AaiYBuxXs=;
        b=gMMem1i8dR9iOYqPdLGB8fS8sf1uFmWrQdUAel1IKd6lsdTO9AFdeAiPDMVlWCVHk7
         qH/bco8+VahziY9cI0Re5ad/+BOEAZm0afuCVaUpCrIZ85iNASQeB02SO7XZBEpHBk/F
         6jPJXCjvJU0uS/2IXhb7qRrx6NwGu3WrT6WvlvzK+tvV26Lxd8GcYjaqP5u0E2YtB121
         ezr3dOf29I9FWVw9weo0wuWb91/iUJSK7B4WpWiprMXvAvFNQKkOayGvbLOOWBct2743
         qch1LnadOQa/bcopbbhN8uZV8fp26H3xe4JSH2UEL0LLDVo/kE6FpjkUUDRLgElFtk2z
         Ry7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791398348; x=1792003148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HORHFDrmI/BPkmzKwb7d3T8boR+07sV7F6AaiYBuxXs=;
        b=f7al3JzmcSV/ptDGDzztrig1lnTejvnnaxWO1aAbpC1urUYE9HAIfprjJKlQnouWSB
         RgvLivXgFZd2n7d3MFddHVzgvFT3fzh2m4LdcWKVHwd5DYq5OwkjhxS4VqMFFG2FDd91
         Vy3unvUu1xnHJCkEQSFphd6xPF3GrUoF/6CSwsjQHq8ZWaMftL2kxlaNJqbpxs3C3FzB
         JaRp6TyPGHhs96szV4lm04e8pqO+6KGZ3GJlgo5nK3rl47W/hjg/v8NxzKE39yZPsjrn
         928uVwWimQfWz9tohlAIT4N1Xu9BV4Nu6he8uX0UNEdDb8SAN6epZuh3igoIl5KUPJX+
         BK1Q==
X-Forwarded-Encrypted: i=1; AKwUvBx6YXTZs06uDSlR8QKx1pIzAXPV7AA+hrJyVuqeMu6gOcJFpvv6hl0xqamu4gWhq1Kh9RoEgzKGmKE3XwE=@vger.kernel.org
X-Gm-Message-State: AFuF++mt0/X4BfLIBCFHdPaOnuvrEuPWm9Duf5NYVJPQ5TZmJhZWhIEX
	u1+E6/XEVTR+TnrY/+UQSJRTif+MjfAVD6RkDVrSF3Qpyb6d2vpSSt6TY37dv0+4IWp7KBAJQs8
	ZhQ+3/QkLC2+7FYfr4eqdDuI5LBCKR9OsDR8dYdIDUsUkUcqSPRTcSkQuboPlN4U6tGw=
X-Gm-Gg: AYBFou2JdnYI4S0Zle5qm8kE3yTMRzXXVmaa4PJNXm87uRXPH9Z78vq/lFoZI9lhMSe
	GamkExBVnxAnw9oDDPPUDM6sWwwJxnx3l/ykYnw38PA43TJ+U+klngXyeUqWbj7vxX/zuUfTl6N
	vS2RWnl/78pKPap+xfFj9rJ4ZI81yadIRNC3yD7QyjvBYQLDWJzjTMoVxpEqjqJddpkP0sY222W
	moUY1MBVxOhCNla6hXwXZ7e7oyxW0k4erMocqddPiTkPivnX1TSwGP78xYtXh5rINT2HlNKI97n
	sxG2n1fQV9QvgZqc+xhTNSeGGswkISuPXKaiz6uFalM249s4eyzM5oqrzYUqwEm8iQFOdb7Jw3d
	WNZqx2DZ9d5YdGsTPD6FUlf8gAL9EXOFuv0JvmA+kTakqknN6camx1y5iwyWVuJw=
X-Received: by 2002:a05:7022:7e0d:b0:144:eb46:c3f with SMTP id a92af1059eb24-161fd7106admr3845791c88.2.1791398347594;
        Wed, 07 Oct 2026 11:39:07 -0700 (PDT)
X-Received: by 2002:a05:7022:7e0d:b0:144:eb46:c3f with SMTP id a92af1059eb24-161fd7106admr3845740c88.2.1791398347007;
        Wed, 07 Oct 2026 11:39:07 -0700 (PDT)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-161684ba3fdsm8156055c88.12.2026.10.07.11.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 11:39:06 -0700 (PDT)
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
Subject: [PATCH net-next v2] net: stmmac: dwxgmac2: enable L2 split header support
Date: Wed,  7 Oct 2026 11:39:05 -0700
Message-Id: <20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac691cc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4efHNOip1X5BxVcu0mkA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: kPNACnFYJAYjjreNuy19wFO_1Lp-vud9
X-Proofpoint-GUID: kPNACnFYJAYjjreNuy19wFO_1Lp-vud9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3NCBTYWx0ZWRfXy0C02OD67BEd
 gbG+Ae2cANhqThcAzRv5XD+1CwmL8BiSagS8LkUSkZix7QP7Z2PD6jzEiad9p7qIQUCIkvDqgYC
 URmdloL+kGm3wh+O2RW2KFLbw3MblntQQnDxmhCj5CY84owSif/qlkNVvxqUBc2jDGKNHudCI15
 h4QbFHqkBD+y8AmrDRFI+XDV/ZG7kQGZWHb+2bNbvrj9xOpzLoSDrRXdXxPoaj/cZFLA/1Mdm+x
 rdTugcXgd9mdWF38MmPJdaCu4ozZB6BV3oLX2Fuuy1tUThvNju+ZJxTjoDoLLWCWNNtF2uo8g10
 NWqam2I1530DPwSJtQxL5PJYNC1mcyNbmgKfPH27al9peEUHKugTWN6X2vRem8/BTCLPSwVAbD2
 UQaz5VLyuBfDCL67c774xe29JC7FUmBiP7LlTskJdMCIoHjLgaCHNnLIgOVRrJKEntpovIlElcF
 Ike3ol9I9v0bP6H0ZZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3NCBTYWx0ZWRfX1RJeh9US8/xT
 Kuyq1rIiMPc9hMxgNkatJ8O4o4PVbOfwTn5L/DdtQ1szB46jc76QM5/xtmj6H03ASc6/txZbCa3
 Oghvuopbx32vRHmUsYTvewESWeEc41A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_06,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070074

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
v2:
  - Add XGMAC_CONFIG1_SPLM_MASK and use it in XGMAC_CONFIG1_SPLM()
v1: https://lore.kernel.org/netdev/20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com/

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  8 ++++++++
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 12 +++++++++++-
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
 3 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..fb29dd489714 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -167,6 +167,12 @@
 #define XGMAC_HW_FEATURE4		0x0000012c
 #define XGMAC_HWFEAT_EASP		BIT(4)
 #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
+#define XGMAC_EXT_CFG0			0x140
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

