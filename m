Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649103D5C12
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529139; cv=none; b=jzEyqWq/JVizEudidFXh2j86m1wnxgumpRchwANu1c88BLLn8IqIBo0kctwjpEmovy335lU6H+SXsPZbBjJcZZnHq9wr4Jv1nUuPyM2CteFfJmbzZK+ug0tHLg3Swp+rJuk+EtpWY8XQlB2PWmV/6fAVJhV8uBJeAot9Kqjm/00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529139; c=relaxed/simple;
	bh=etezjtKq84RmKKFwlxvqbxkYNKXZRTfCGt9+9ybA+P0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U1DG1tnzCZXCWNzEstCQ9iDdMf/Qruc8x8oaUwcWuyBKoNFaX4zF5jhItoKik0mmaYUzf1pesy3j+PL5Skt4Xa1ObxoVVCXRDmnw1ME8jcWpaovzmgosOLd6CZqjc47Ub2xvj3haCMGMBOPB2IuIoHh0ygxG7red88/cnNZzoxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kBX3o8IQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ClwZRfk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kBX3o8IQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ClwZRfk+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HJmA451819
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 06:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KByrBfALr8GgfkLAO2yXCXT1aba1OS74wxtQzGISJs=; b=kBX3o8IQ8pZ+xswY
	AtjXBSemSpsNG9amdZkIbhvhsi1kOGVLwy4ZK5wMmZy48o646HpbCI/vJlMDfZ3M
	8NDfrCSz+aIZjjDOumgXgcT2d1fz0zwMAOoS6Y1cFq33lxYDfNqK/VDPXx8cyx84
	X1W8kpzPYPyHXyND6vKsMAjkXWakbr2tw0FU5MaTwzsvMs1gvWWCrMUHN/kP2Qsf
	MasXO+xQYzGKZ3EasKaVxykE0vxTlOyhAsyLDbNy1Y2rsmd/2+LLndnhEfT5+Saz
	afXeOVH+OC8XUk2m+HZ0692CzNVP5D45Ckw/nMzs82X7M7aRB+uawvk/ONj+NvQI
	b01JjA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6b9kkgnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:58:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cade6b71so1238854a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791529135; x=1792133935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7KByrBfALr8GgfkLAO2yXCXT1aba1OS74wxtQzGISJs=;
        b=ClwZRfk+pAgyo7C/VFVCxBYSTz2xmdbWIVy1Mh4EbW8pP/UUFmDQp/cJnlqHsCNdgE
         PR9CPK+SSCtKPUXPjL1T2zsqMEh9udlKmA8D681kPi/8mJ2SdedXhpLExClXn5bGu6Tk
         YcFLpsjWpF6oDuS6NumipugLnwZFViwv6vM/cQnxDz4yzb85Vs+DCQadxkhWXnG+Ukpy
         BYSxLGiidwcNC6FsHnj+h1eZZtBQK7cWMQ1FG3EMulYg9Xzkpmfiq84wAEli91vvPIDf
         JDNY/wXPvYKx86hzwn684gVMNE5xuG6ITHIfoPbUnqPjv0cIodNaSPNuKuySgbFhhbuS
         w+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529135; x=1792133935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KByrBfALr8GgfkLAO2yXCXT1aba1OS74wxtQzGISJs=;
        b=sCLR8oXCtXkwVhGcXGhNBd/yLn6bv40rZsvhP4wtAFseLJXVAym2YiY0/weovcnYnQ
         51wf1beUFymKkWh934Dx3ziFjp9CeofHNlGKQ7VAreDjGyKfapaAK73V6rfjJ8a03Uxo
         x0y/4/V4KidaCFBwGjfMQC5uM178cNjmBfAAz6vlq+c+z+L/B9VRhvkXBdrTADT/rpLw
         6Q7pBzoodU4NXTeS7mDS5AZACEXDMcMKVad0nSM78dPPFXl5NtzYZvFXLjJxJOc4+KBe
         WLXLNKuAn8QstnuLgpXUGO/jT73Gz3hmUNsbyaZqEEF/AahRrn3ldPaCIb+jpXSVUbRx
         GuPQ==
X-Forwarded-Encrypted: i=1; AKwUvBx82NZ/haplyB/+xnHV4BtGObMHD47Vb8ou4lvuFINt2HwdU5hvbrmll4SGi92cGvFVn7/5pigFo+sjJ6Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l0VoH7sABzaxnZsYN4E7jAxwBFEF4id4ZvhG2p3KFMtfFlpzSH
	tKjszSx+M9DeqARwXEZLybwYxRTPNNT5oWU0DL6z7jnI2Llt3LwTjOQggeAytcjhvRfzp/O0p7f
	Of9wk6fBGGr4YcidssCiQ5G0YkOgq47ucHtRsaNhUgvDyzitJgWzKmzqXF0aElidon6Q=
X-Gm-Gg: AYBFou1wg5RQN5stm9u1gF5UYVMOkWLSWOZ8J8rTk4q30ju/aQ2odvWxexXbJSZOctC
	ZlsMIR2lhcgwdTwQXVLNTeueEiKTtpKlhFFiIu/+LhYgGQxjlXFJVKGAIFqiJTT5chymKRzeP9x
	6NQpmTtwzEA8VZyOLoZ9w7hc3WB6ICdfNRke+vDqImMrHUhsgRlaH4hGOqNR28GHo6fQS2KGJnt
	hOqJQ3bZm7fpxUQjmXvJT4f/BThI/oMApIbrdhqFWbxr4qceKELT+zNqcMiGQnkx5hp+WrqXqOO
	R4KcUZbIPrAwx8BFfnMujBUvP3/+B86gvp32cPcZFMvytkc4/fcK9nTAB6n4psg2E7QHFGK7sI+
	CYemzLcc1Vdc3wLWlCqfv
X-Received: by 2002:a05:6300:49c:b0:3e1:1d22:aafd with SMTP id adf61e73a8af0-3e164fcfdadmr966481637.32.1791529135218;
        Thu, 08 Oct 2026 23:58:55 -0700 (PDT)
X-Received: by 2002:a05:6300:49c:b0:3e1:1d22:aafd with SMTP id adf61e73a8af0-3e164fcfdadmr966472637.32.1791529134727;
        Thu, 08 Oct 2026 23:58:54 -0700 (PDT)
Received: from [10.213.103.163] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e088efsm499980a12.11.2026.10.08.23.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:58:54 -0700 (PDT)
From: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 12:27:53 +0530
Subject: [PATCH 1/4] dmaengine: qcom: gpi: Add UART transfer support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-add-gpi-dma-support-for-uart-v1-1-c69e728df686@oss.qualcomm.com>
References: <20261009-add-gpi-dma-support-for-uart-v1-0-c69e728df686@oss.qualcomm.com>
In-Reply-To: <20261009-add-gpi-dma-support-for-uart-v1-0-c69e728df686@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        praveen.talari@oss.qualcomm.com,
        Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791529122; l=6625;
 i=naresh.maramaina@oss.qualcomm.com; s=20260316; h=from:subject:message-id;
 bh=etezjtKq84RmKKFwlxvqbxkYNKXZRTfCGt9+9ybA+P0=;
 b=3csQ9vavv4D5uWJ1KcGZ22SjdsAEgSR63ad+u+Ca8yohioxZTT42A3yHIpN2oPhKAH0v7243+
 3Oay5hKaKHwDU+Y7V+TpigqylUzEcFVQQeTTQUQDsjozLJ4S9NDWf96
X-Developer-Key: i=naresh.maramaina@oss.qualcomm.com; a=ed25519;
 pk=j7iST9yrLbsgWcWrqdlUNIOWl2WBl4wV1q35/n9SCkg=
X-Proofpoint-ORIG-GUID: t7LgsSe0TewOYHwkXCFP7Zt4_t8rdYVA
X-Authority-Analysis: v=2.4 cv=U98Hnuru c=1 sm=1 tr=0 ts=6ac890b0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=q9FSIy8fX9HaZm_J2qEA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfXw/v6L9vMkY6+
 lmE21Ikmrl4lGAtmtiksuw0bZIfaUs6yxUtOkBW/FaXEO9GHbafn9znUpSbWk8Ieqv2iYZgh9Aj
 2ce8SIhwnTuv0QwborvjzmyS2EomNEc=
X-Proofpoint-GUID: t7LgsSe0TewOYHwkXCFP7Zt4_t8rdYVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAyNyBTYWx0ZWRfXw7A4lIWk7hNZ
 ccre4cynfA6bSD1SY7ussvrvygvVye5M+PxqWt2Gkn+1N5NCGX14/JwbqoJHc8tDItGhKwSN0SF
 a72PpmXHRtFGjNrbAfaQDHf+AZazwmx67P2Q+/22GOdQ2vM7SPL3PdPlUj/nUKQXLPAHD/HPjKF
 Yob7/MfxvcQ9rgHUh7SjlKVVH5ZfhOw7rhaI3VAOs0WXRc9wKRhtS5kdv/vuU2F6l959kuDGs30
 z1RsCCRlKqZ/6zdLsWDxmkXUH3GBAsll/fWEJtOSk7mpIGOORcDH7UA9fS7oMbns68OL0Jg3oXR
 30Po5b6uw7bG2RiQZd50LvChmLvBxEngpeQsnqv1FdFrhaEtgrLm78d9qNTkbmf1zu+PdHcdXoa
 mZrukdKgK3FAO4xb2j4E2wR6nAV0KRRulEpHj/BfNOMv/BT3g2O5tKSQb6lHN/0vlZAuDSqvysf
 v1QVf+d/gN2UZC6YDBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1011 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090027

The GPI DMA driver currently supports TRE construction for SPI and I2C
clients, but not for UART clients. Add the UART CONFIG0 and GO TRE
definitions and expose a UART peripheral configuration structure so
UART clients can describe their transfer parameters.

Build the TRE sequence needed for UART transfers. Emit a CONFIG0 TRE
when a configuration update is requested, followed by a GO TRE and
a DMA TRE for the transfer buffer.

Add the UART case to the TRE construction path in gpi_prep_slave_sg().

Signed-off-by: Naresh Maramaina <naresh.maramaina@oss.qualcomm.com>
---
 drivers/dma/qcom/gpi.c           | 101 +++++++++++++++++++++++++++++++++++++--
 include/linux/dma/qcom-gpi-dma.h |  33 +++++++++++++
 2 files changed, 131 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index c41bfac65ddf..fb26a286e5df 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -30,6 +30,21 @@
 #define TRE_FLAGS_LINK		BIT(11)
 #define TRE_FLAGS_TYPE		GENMASK(23, 16)
 
+/* UART CONFIG0 WD0 */
+#define TRE_UART_C0_CHAR_SZ		GENMASK(2, 0)
+#define TRE_UART_C0_STOP_BIT_LEN	GENMASK(4, 3)
+#define TRE_UART_C0_PARITY		GENMASK(7, 5)
+#define TRE_UART_C0_LOOPBACK		BIT(8)
+#define TRE_UART_C0_HW_FLOW_CTRL_EN	BIT(10)
+#define TRE_UART_C0_PACKING		BIT(24)
+
+/* UART CONFIG0 WD1 */
+#define TRE_UART_C0_RX_STALE_TIMEOUT	GENMASK(23, 0)
+#define TRE_UART_C0_RX_RFR_LEVEL	GENMASK(29, 24)
+
+/* UART GO WD0 */
+#define TRE_UART_GO_CMD		GENMASK(4, 0)
+
 /* SPI CONFIG0 WD0 */
 #define TRE_SPI_C0_WORD_SZ	GENMASK(4, 0)
 #define TRE_SPI_C0_LOOPBACK	BIT(8)
@@ -1793,6 +1808,80 @@ static int gpi_create_spi_tre(struct gchan *chan, struct gpi_desc *desc,
 	return tre_idx;
 }
 
+static int
+gpi_create_serial_tre(struct gchan *chan, struct gpi_desc *desc,
+		      struct scatterlist *sgl, enum dma_transfer_direction direction)
+{
+	struct gpi_serial_config *serial = chan->config;
+	struct device *dev = chan->gpii->gpi_dev->dev;
+	struct gpi_tre *tre;
+	dma_addr_t address;
+	unsigned int tre_idx = 0;
+	unsigned int i;
+	bool set_config = (direction == DMA_DEV_TO_MEM) ?
+			   serial->set_rx_config :
+			   serial->set_tx_config;
+
+	/* create config tre if applicable */
+	if (set_config) {
+		tre = &desc->tre[tre_idx];
+		tre_idx++;
+		tre->dword[0] = u32_encode_bits(serial->char_size, TRE_UART_C0_CHAR_SZ);
+		tre->dword[0] |= u32_encode_bits(serial->stop_bit_len, TRE_UART_C0_STOP_BIT_LEN);
+		tre->dword[0] |= u32_encode_bits(serial->parity, TRE_UART_C0_PARITY);
+		tre->dword[0] |= u32_encode_bits(serial->loopback_en, TRE_UART_C0_LOOPBACK);
+		tre->dword[0] |= u32_encode_bits(serial->hw_flow_ctrl_en,
+						 TRE_UART_C0_HW_FLOW_CTRL_EN);
+		tre->dword[0] |= u32_encode_bits(serial->packing, TRE_UART_C0_PACKING);
+		if (direction == DMA_MEM_TO_DEV) {
+			/* No configuration for dword1 of TX channel */
+			tre->dword[1] = 0;
+		} else if (direction == DMA_DEV_TO_MEM) {
+			tre->dword[1] = u32_encode_bits(serial->rx_stale_timeout,
+							TRE_UART_C0_RX_STALE_TIMEOUT);
+			tre->dword[1] |= u32_encode_bits(serial->rfr_level,
+							 TRE_UART_C0_RX_RFR_LEVEL);
+			serial->set_rx_config = false;
+		}
+
+		tre->dword[2] = u32_encode_bits(serial->clk_div, TRE_C0_CLK_DIV);
+		tre->dword[2] |= u32_encode_bits(serial->clk_src, TRE_C0_CLK_SRC);
+
+		tre->dword[3] = u32_encode_bits(TRE_TYPE_CONFIG0, TRE_FLAGS_TYPE);
+		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
+	}
+
+	/* create the GO tre */
+	tre = &desc->tre[tre_idx];
+	tre_idx++;
+
+	tre->dword[0] = u32_encode_bits(serial->opcode, TRE_UART_GO_CMD);
+	tre->dword[1] = 0;
+	tre->dword[2] = 0;
+	tre->dword[3] = u32_encode_bits(TRE_TYPE_GO, TRE_FLAGS_TYPE);
+	tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
+
+	/* create the dma tre */
+	tre = &desc->tre[tre_idx];
+	tre_idx++;
+
+	address = sg_dma_address(sgl);
+	tre->dword[0] = lower_32_bits(address);
+	tre->dword[1] = upper_32_bits(address);
+	tre->dword[2] = u32_encode_bits(sg_dma_len(sgl), TRE_DMA_LEN);
+	tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
+	if (direction == DMA_MEM_TO_DEV)
+		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
+	else if (direction == DMA_DEV_TO_MEM)
+		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOB);
+
+	for (i = 0; i < tre_idx; i++)
+		dev_dbg(dev, "TRE:%d %x:%x:%x:%x\n", i, desc->tre[i].dword[0],
+			desc->tre[i].dword[1], desc->tre[i].dword[2], desc->tre[i].dword[3]);
+
+	return tre_idx;
+}
+
 /* copy tre into transfer ring */
 static struct dma_async_tx_descriptor *
 gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
@@ -1841,11 +1930,17 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		return NULL;
 
 	/* create TREs for xfer */
-	if (gchan->protocol == QCOM_GPI_SPI) {
+	switch (gchan->protocol) {
+	case QCOM_GPI_SPI:
 		i = gpi_create_spi_tre(gchan, gpi_desc, sgl, direction);
-	} else if (gchan->protocol == QCOM_GPI_I2C) {
+		break;
+	case QCOM_GPI_I2C:
 		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction, flags);
-	} else {
+		break;
+	case QCOM_GPI_UART:
+		i = gpi_create_serial_tre(gchan, gpi_desc, sgl, direction);
+		break;
+	default:
 		dev_err(dev, "invalid peripheral: %d\n", gchan->protocol);
 		kfree(gpi_desc);
 		return NULL;
diff --git a/include/linux/dma/qcom-gpi-dma.h b/include/linux/dma/qcom-gpi-dma.h
index 332be28427e4..ba42e8383391 100644
--- a/include/linux/dma/qcom-gpi-dma.h
+++ b/include/linux/dma/qcom-gpi-dma.h
@@ -83,4 +83,37 @@ struct gpi_i2c_config {
 	bool multi_msg;
 };
 
+/**
+ * struct gpi_serial_config - serial config for peripheral
+ *
+ * @rx_stale_timeout: serial rx stale timeout
+ * @clk_div: source clock divider
+ * @clk_src: serial clock
+ * @stop_bit_len: stop bit length
+ * @char_size: UART character size
+ * @rfr_level: auto rfr level for FIFO threshold
+ * @parity: set parity type
+ * @opcode: go TRE opcode for tx and rx
+ * @hw_flow_ctrl_en: hardware flow control enable when set
+ * @set_tx_config: set tx channel peripheral config
+ * @set_rx_config: set rx channel peripheral config
+ * @packing: set packing config
+ * @loopback_en: serial loopback enable when set
+ */
+struct gpi_serial_config {
+	u32 rx_stale_timeout;
+	u32 clk_div;
+	u32 clk_src;
+	u8 stop_bit_len;
+	u8 char_size;
+	u8 rfr_level;
+	u8 parity;
+	u8 opcode;
+	bool hw_flow_ctrl_en;
+	bool set_tx_config;
+	bool set_rx_config;
+	bool packing;
+	bool loopback_en;
+};
+
 #endif /* QCOM_GPI_DMA_H */

-- 
2.34.1

