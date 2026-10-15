Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FBE49DBA8
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102342; cv=none; b=Gqj+zrzdnhDxLdlc83Qemkp8sh2NzIqyRVrfbbYUM2SNqyRNJyBVbTXv3RaVvuLfNJ0gXdPmJzg28OVKpFb5936bKM+pmKhYLjYKCzoaGHQTRe5BU9VF2Df07+1qLTyx9jeR9+YWAok7pY1pP7jMQBIROVjG8wmMPsGHmWydJd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102342; c=relaxed/simple;
	bh=DvMqCe52Q1uypV32+mlM7klXZcT+Fok14dEqD0/lBBs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jUovBk3yEf/qKVCPoaEsuRx8ZYwgRzl2ex9UBvbbGZJG6FA0NYiQh4KzlywFr+w+NeKujIbsyEs9SCp1saElu3WqeTYY+5JUWWfcobscibZTIoNL8mejiLVXNxMRiTLKMpai/gEsrXuljZJw3dm3Gz5A4ArhQQdeN3WdxlGhdlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6I/SeBL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUThNyl+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6I/SeBL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUThNyl+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FKZ0J23462803
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u91t8PE5PNM5uF0C/lBcc+9N4yzpNajRaYi
	6mYstLnU=; b=G6I/SeBLHeLwIHth7W092RYE7L1QUYlqEuJmyHtVKHMqbL/00ia
	esdHU7vX1BUoDW5ejTzl/ouqW1ce9bCYI91Tb/ja4PWECTxbn4tncSjGaP/SrkqD
	J7ymX6gzRbTEPpyBoKteUVarrJo8P9m1jcOGd8E5BCw/XNR9tkDmAgjBKw2S36MG
	pVUBeSwCbqYbeoW1AtCrFggHlxfJJcuIHXZWRytT2RK2NbmB744donNB2pE5CZPk
	oZKR+CxbLKzvCJOsETdTpCwICawJy9D5dWSYAh38eZHEJbPHCdnMTF3wc/XmLSdV
	VwspqVRAVMcjalQkE9IQJOzEKf4ATpVfgbw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu6a3b7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:12:19 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3510d0baf63so7642550eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792102339; x=1792707139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u91t8PE5PNM5uF0C/lBcc+9N4yzpNajRaYi6mYstLnU=;
        b=BUThNyl+xHsrqWBfyIywdclfy0uUUcIW3hZGakze8q9Dev15pR+wEKFBXLMXEqF2e4
         ULagAYZOiz82RipECxwB26PMuyY4jgO9zzlFPCry08iYH7Ub196xv47zkesSyya9Fudd
         mE9Sqybh7pZX3TD/9DFzjR3iW2YUpcJhVJLOK642bS4cp4Yd4MaAAMWR8Vl9GnM4D7e2
         c1qKy1E+AWVqz5HsXjH7aIadM1VUjtbwrI52Lt1/qK4ZJjZal6ZwVQzcfptrGxpLaG0Q
         K+cmSPo+h8VO/zM3D6160hFh4hL/30KhrDLQ5edQG3E2f/0Ay67sZiJl+3H6yaVJW5id
         6CFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102339; x=1792707139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u91t8PE5PNM5uF0C/lBcc+9N4yzpNajRaYi6mYstLnU=;
        b=SRoG5iNsRK6jyjtV43kJxB+rU8fjjcD3cBtW4FYBCQ/+XRyBwbGqqCi0ZPbVtgBoen
         dYQ1qarhDpqxsc9MNcCxhdqNX+fCwLGhVDDNhmf1F9FErHhcryYULS+m125fmS2jizcB
         wi45s5OXsbOahzECo2qoZJ7JHygiz1nqkf7xQTas5bO3g+8JTUQNntxyujDK5NhGjMMO
         cqrW4fYIOt3rUloLXzrkeaLuUio5MNJNvcffbNOQAzJnYUfJ+nPs1YeM8kJwsxmydNlm
         i9gBLDLNddl23TM4v1oeO/UB4Xi8/KN67Td1PdHCvQBGt64UPSL0lz1FqK261wCgtTW0
         mptQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyiht9e5gzPJmOQuvHpuGa7B1Fii7Ye3YAvtwPNFh9BGuNX1glIRPVo2laCCigIQrpwvk1h0MQis1+RhQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFrk4VAzbWhY9hRE5PMaqfgKQE2AXBqRoirpUvsOgXkxv0znfU
	R0nPGMuFjSmx/+POMLHW8LH/ItGQSQGy3Sfc4xQ+suvi/AKeouo+ALDnEuSjjAlJ2bTABBMjk00
	DQb9h3rofn50blwyZIc+Y0wAMVrnvsemR7oZuTV44a2glKscSu9V5rwgbdw40g0SWO4c=
X-Gm-Gg: AYBFou10fvHEIbtym39/Gbm/4Hp+zz43Jz1OEaJRTn6CtdefH3AkMYykMD7q430HE9G
	OugFmXZ8zNtR7vVxfr/mDw2wF6es7k1Oel/3cQ+WVRoa05rzFiVV2rxq2Bl8axAJvdEMgFQkuoX
	J8invvZ5LXlXXt4DZqCjv1sScyLbdSTt2KNa8q4LjU1EPjeUKFykXRKB9v/RaJ3mG6jkAQSoLlg
	bups4k+Cn3jBzeWUn9K3rRprfgewJcIOIeIdYfMzgwFhufgNVGAuXfDfQ6aGai03hq6gdDPtqJf
	/R+gmuCcnFYGAnmSCb9mkReBRz0zY9NS7lZviyaW+xbCmgvdViHjHrn26tquzKst60ZsFMjCfM/
	8tA6wB8uY9ZpM0gqDSULso+zcubhKtqYbcbxYpQ35XdQUFmnaWIDDFSV8URSs5A==
X-Received: by 2002:a05:7300:8a1d:b0:351:35b3:c5b6 with SMTP id 5a478bee46e88-3537e0fbed7mr31113785eec.27.1792102338208;
        Thu, 15 Oct 2026 15:12:18 -0700 (PDT)
X-Received: by 2002:a05:7300:8a1d:b0:351:35b3:c5b6 with SMTP id 5a478bee46e88-3537e0fbed7mr31113711eec.27.1792102337152;
        Thu, 15 Oct 2026 15:12:17 -0700 (PDT)
Received: from hu-scheluve-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081bafa7asm810987eec.14.2026.10.15.15.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 15:12:16 -0700 (PDT)
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
To: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        lorenzo.bianconi@oss.qualcomm.com, hongmei.xu@oss.qualcomm.com,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: [PATCH net-next v4] net: stmmac: dwxgmac2: enable L2 split header support
Date: Thu, 15 Oct 2026 15:12:15 -0700
Message-Id: <20261015221215.1714047-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Bzx-prdJEBSrC2MbJCmKrRw-gelRyvUo
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad14fc3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4efHNOip1X5BxVcu0mkA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: Bzx-prdJEBSrC2MbJCmKrRw-gelRyvUo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA4OCBTYWx0ZWRfX9tSMPk3Xth4b
 6gqY/w21CzuCa/ZDdyLn8Q2i+MAh23k7y4LEhHJtCFYvmLkE1MYnmDkYGFjIrUs0menf/UR4DJs
 EEVzOM5nzRJ9ewX+ETUPNbzezc3jsR2HmHN6sShYtmOe+szuYAYEcx6lzv4rO3wIwlO0z9MSsM3
 apE+52bVqYivlxQDjnIs19pMbQ1dcxJUQBtJ8qR52ZpuaLJ88BQEGIfbFoyBQbkYPU8xfGxFhlH
 0OGj0H0j3zuJm6rcKThHTy6CBjJVCL/AfeiTkNsngQpy9wpF+F1mzWYOcDtLPy4MX4nWqih1/Q2
 YsY2T+G5pWchumowvVgVdxAPvVr4TegQ/MMU8nuysUbPuwd/oPcc0bL3btzGMHwLde64du8rK1T
 BagiYZUbN5POoC/LfR4Aq4laiQrMzwgDo6hu9/92QeJDc0Eh9ROEVENNUR1Dus/dDRyNB8Gj/Rv
 stMsqHfUcLpxtPVGAAA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA4OCBTYWx0ZWRfX0sh7vAzv7Rc/
 3h23ZfaP1uNWxBLsD7yo4QkPvl2nbRgFSM0mXz63vUTLAU7W1UBJQAGc5OKI+rJyCeB3QvUGzOh
 Kr8jv7VmIhQGxgaIybUpHdQXrL/9BE4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150088

XGMAC2 doesn't program the MAC extended configuration registers
needed for L2 header splitting when split-header mode is enabled,
so tagged AV packets can't use the split-header path. Configure
split mode (SPLM) and header saving (SAVE_EN) in XGMAC_EXT_CFG1,
extending the dwmac4 sequence added by commit d10f1a4e44c3 ("net:
stmmac: Programming sequence for VLAN packets with split header")
to XGMAC2.

Also fix the RX header-length calculation for split-header
descriptors. Per the XGMAC2 descriptor format, the header
length is only defined on the first descriptor (FD set), and RDES3's
L34T and L2T fields are only valid on the last descriptor (LD set);
on a non-last descriptor they can hold stale write-back data from a
previous packet. Read the header length only on the first descriptor:
from RDES2[9:0] directly for non-last descriptors, and via L34T/L2T
on the last descriptor: RDES2[9:0] for IP packets (L34T set) and
RDES2[9:2] for non-IP packets (L2T set).

Finally, disable the variable-length preamble when L2 splitting
is enabled. A variable-length preamble shifts the position of the
Ethernet header, making the L2 split offset non-deterministic.

Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
---
v4:
  - Only read the header length on the first descriptor (FD=1)
v3: https://lore.kernel.org/netdev/20261013192759.776537-1-sagar.cheluvegowda@oss.qualcomm.com/
  - Use zero-padded 0x00000140 for XGMAC_EXT_CFG0
v2: https://lore.kernel.org/netdev/20261007183905.2582759-1-sagar.cheluvegowda@oss.qualcomm.com/
  - Add XGMAC_CONFIG1_SPLM_MASK and use it in XGMAC_CONFIG1_SPLM()
v1: https://lore.kernel.org/netdev/20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com/

 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h   |  9 +++++++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 16 +++++++++++++++-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index f8ab347f7b5b..7f43a0b17083 100644
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
@@ -434,13 +440,16 @@
 #define XGMAC_RDES2_L4FM		BIT(28)
 #define XGMAC_RDES2_L3FM		BIT(27)
 #define XGMAC_RDES2_HL			GENMASK(9, 0)
+#define XGMAC_RDES2_NONIPHL		GENMASK(9, 2)
 #define XGMAC_RDES3_OWN			BIT(31)
 #define XGMAC_RDES3_CTXT		BIT(30)
 #define XGMAC_RDES3_IOC			BIT(30)
+#define XGMAC_RDES3_FD			BIT(29)
 #define XGMAC_RDES3_LD			BIT(28)
 #define XGMAC_RDES3_CDA			BIT(27)
 #define XGMAC_RDES3_RSV			BIT(26)
 #define XGMAC_RDES3_L34T		GENMASK(23, 20)
+#define XGMAC_RDES3_L2T			GENMASK(19, 16)
 #define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
 #define XGMAC_L34T_IP4TCP		0x1
 #define XGMAC_L34T_IP4UDP		0x2
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395b..b28aa39f9947 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -292,8 +292,22 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, u32 *hash,
 
 static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int *len)
 {
-	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
+	u32 rdes3 = le32_to_cpu(p->des3);
+
+	/* HL is only defined on the first descriptor */
+	if (!(rdes3 & XGMAC_RDES3_FD))
+		return;
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

