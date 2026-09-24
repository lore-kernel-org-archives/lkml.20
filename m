Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEC648641C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246848; cv=none; b=E9Q5JP8c60PCn2n28xE1C/DkAzV3Rbq1UGAwcf6SfWLzfrfV7QsckIQMT2rmXzkcjh6uX3MpHQ28Es6y+g3pCi8KrPdQaaL0CM+5DyIMDaKxLOJXefb4oEAsI+sDC4sMQXzxr0rMQf/cgX6Qg3jjXWwsIAyT/wV1sy+Jbpq/DpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246848; c=relaxed/simple;
	bh=gKyU1fLOaiHQA276aI+DVDij+aVR+s9R1/vpAdvruy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SLtATq510OcTyvzx/wPjaJ7AYJMzBFrskMcb+QF+jeCIXwEIcknrQqv8IseFYwoH6RyUO7ZZu9wrFc6JQNdV/uVqaIHcfSTA5JyooqDKfHtCKJnn6gTHwMIo2cYCa4Vq3iL/U5HX/J5F4C25wHEeCZkllvEiWU+MkstrVDMpWKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ph3BuZ4U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pti8Ykt6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ph3BuZ4U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pti8Ykt6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OA3YP5538624
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iGtt6oOPDflvCVTF/PzLEyT3/NUsOJSkR4n7ZpTv6F4=; b=ph3BuZ4UY3g4iV7W
	tCphTQ2JdfUJOe3gQLxweOpyEcJD+M64dfqSjIQA1II8okUvKUSs/hp0gTLKC5kF
	jumZNvKSKQxX9pfsSaCzM0FUtQZuXwj2E64LScFdWthhVIS0HiPOwDRb+VTw3TQu
	2PylJGUHskxw+DiHd6WGkh3nRZWvGWaPlasZzY4jxfGvNgD5Dm1J+t+Neto1t1Be
	4KhqgGBmT6jUN4hpjNoaSkFmdGTc62AQCuRtyFvwFI4RSTqL0nCllXAPVWswZY7Q
	DqxCY8VQC7odDeD3/0jPjmKkg6sVyPp/PwQ9T0cOzpgJkLuM7O9Z/VQfpvWhDphl
	3lOLuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8550-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:47:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939062ecda9so294018785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790246845; x=1790851645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iGtt6oOPDflvCVTF/PzLEyT3/NUsOJSkR4n7ZpTv6F4=;
        b=Pti8Ykt6J9Do/jgvhM0PjjMbXPwARXIRvQygAXTCXp0Jajustb5W6xljfuzGWvTppP
         TJ4PR8EKuFC9MkhT/tHBPKPmNcYFNClGT4dWTWlbji4I6dnLDPQv6lDW7IgMnfLshveT
         p/bimHFTnsb0DjBPmlqhlBBQfXFeBXC1UI89khoKJbYGP22q83NPrqyr+P8eJw5lqTHM
         7M23TNKoakFOngvBTzFPeB/serdYV73JxbqCga5RKtRvhjPUG5lOUu6+fNo6kgRAvRK5
         giteSEKJZFLFdBWYsxl0hlwFxZepMtTwMYWjkKDQ+VTJbcIo9R8yMu6x+/Ws99Yuf4mR
         VVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246845; x=1790851645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGtt6oOPDflvCVTF/PzLEyT3/NUsOJSkR4n7ZpTv6F4=;
        b=pMvcuDiVeatLgrveO5huU8X6Qm+7ubrv3oLGyKExQSs9V8IWMVjiYAtC6sClLPm8P9
         m7Hu9qIcm1ErVVoFhNs6p35Rz9ZCF7e9QvrpWmfwNBGSyIYoGat2lv9GKA/FJaFNKaP5
         eRiSu8K63opCV0p817X2dVwiPSKoGumWWJ6gy1fd+bEJXF2h2sG1YFMbRKRoSCknnXjk
         Qb3e/j4QcYlbHT7Dg0cCt/ehlAogheLknExhJfX4ZKForU3Hf4v3gH7sXnhjCUMQCTfl
         JS1ysUlPwVd8Shwu4rm5+2PqVnKbC/NhUiVPZXP7vZ8T3X2ipz5yiLFbCILpxpm5h3Y4
         DFLQ==
X-Forwarded-Encrypted: i=1; AKwUvByaG3RDMlmoP3Yx4EH1nGrG9iSXlLljROrzML3evc8b7PtIv1noXTHscDEBPOs76Ca7ZisUaSTbyXbtAz4=@vger.kernel.org
X-Gm-Message-State: AFuF++maqWcCOQub77Of4UNO3Sf9TgWzm6hlb9Lcpk/k+rdfmt5EMVta
	7bQCWsGK956KF00N4K8flvgl74TEwA3K4Zv4Ze4HEaSnspCmvL+l/bCmIVZEwbZh8GP6NiTaZGa
	36Mg2oZkUfBebN45W0ekcny2mu1qLjX6AVvZLkvf6YUmtv55WFQEmtjXASc6nBwwM5pI=
X-Gm-Gg: AYBFou35HUnvk2t4XZCGO9mZXXsqQQhUHpZPDX+oF7kXYHFEcyBeejv3sILJ84bdtMT
	tmqmqUa0x/SA3TdZsUq+qSNHc+vfOy/Z6eCPvo9bbWGizTxIjzJR9lM/jeIu4+oUx+PAnfkpNcA
	t0XF0L9nRdp52+MtQQjisEvJ3W649lydKmvBr7ZsFnQPJJ06kkNcTmGNRPWrXmgKO03GtGcvfE2
	6fRfR3Kj8Gkpgg8E+QOAugIAnGllakJLdLmpg8A2RJSppjOJsiJOOwD4IcrYNuRuQDug1r+cc0B
	2mgdV+UUT8bz7h1NO+LYJAmJ0wWp8yXdvfm8MsQJaUmbBUMGY9vvaZlJ2BMRT+fse8JMOY+j6ml
	gPiJ2vqJU7wPpvw==
X-Received: by 2002:a05:620a:3912:b0:93a:13aa:1b6 with SMTP id af79cd13be357-93c36442b35mr224256185a.51.1790246844745;
        Thu, 24 Sep 2026 03:47:24 -0700 (PDT)
X-Received: by 2002:a05:620a:3912:b0:93a:13aa:1b6 with SMTP id af79cd13be357-93c36442b35mr224251985a.51.1790246844171;
        Thu, 24 Sep 2026 03:47:24 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5de4de4sm63615395e9.8.2026.09.24.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:47:23 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 12:47:02 +0200
Subject: [PATCH net-next v2 2/2] net: stmmac: align real_num_tx_queues to
 mqprio configuration
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-stmmac-mqprio-prio-offload-v2-2-fdd8b69efccf@oss.qualcomm.com>
References: <20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com>
In-Reply-To: <20260924-stmmac-mqprio-prio-offload-v2-0-fdd8b69efccf@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: xPw_UACwuQsIkQNV8lNbjEd5qUjQIZ0_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfXy2hypllGTZkA
 YDz7sxtU2JRS+ZtbgYBbyVgreG8buG0tbb5sG8Ej+c33V0FogWv3uTsTaZBvtbDzaLXdlGOPUFn
 mNaDPm54AX1ao90wWJwwqBMCmFvW9s0KDCcbyM6hQmfjSIYKLhR2KS/JGD2G8V8hcTuJAwdm+ra
 YVJN9uyvbxp/k4rEivuGWvi4Z6XLioIIDAWbLdLc/SWZSd8RuApjp3yWV31xnuT/pXXrn4J0IWk
 L+wIZ1uEze41aKR2nnNuVkr8sUMwuIPPzP07wOw9h7L1uEctEeSCTeF1xaJyyxmvuFYY5ATAIcV
 VmOHOCSwlFqfyGGfZ2LEhwe4ldP13y+T1/RKFUrX1e9yTvMFO7OMRbMBXXBZYzeOx586fYM1MFL
 7Zq/u5UNKA+7yCo7d28wc6rwPhavnCLmkepjz0+ZGGUaaLDTr1YeWdaD4nEJBbqhDm5cfYiufIA
 8YodSia2drP0P/mA1iA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NCBTYWx0ZWRfX5r+61G5aEM/3
 9j0szpFcigVax12HE8LTENNHlv3T73CmX9Pm8jhL8JwZVTUWaUOlGRzwQh/lfHaX4f50FAxRF1f
 c8H0QY/gkW+RjZXKeFXOLcuW/dCZCB8=
X-Proofpoint-ORIG-GUID: xPw_UACwuQsIkQNV8lNbjEd5qUjQIZ0_
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab4ffbd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Td2Y5uhiG6mrzya5eswA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240044

stmmac_hw_setup() unconditionally sets the number of real TX queues to
plat->tx_queues_to_use on every device open. When a tc-mqprio qdisc is
offloaded the driver reduces netif_set_real_num_tx_queues() to the number
of queues enabled by the offload, but the next device open reverts it to
the devicetree value while the netdev TC map is still the one programmed
by the qdisc, leaving the two inconsistent.

Store the number of TX queues enabled by the current qdisc configuration
in the per-qdisc state (priv->xmit_qdisc.num_tx_queues) and use it in
stmmac_hw_setup() in place of the devicetree value.

The field defaults to plat->tx_queues_to_use at probe time and is restored
to it when the mqprio qdisc is destroyed or its setup fails, so a device
without an active mqprio offload keeps the devicetree configured queue
count across reopens.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 3 +++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 69b400e9b138..a8f06192d696 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -302,6 +302,7 @@ struct stmmac_priv {
 
 	struct {
 		u32 prio[MTL_MAX_TX_QUEUES];
+		u32 num_tx_queues;
 		u8 algo;
 	} xmit_qdisc;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0c9083f8846e..ad6be5166b95 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3772,7 +3772,7 @@ static int stmmac_hw_setup(struct net_device *dev)
 
 	/* Configure real RX and TX queues */
 	netif_set_real_num_rx_queues(dev, priv->plat->rx_queues_to_use);
-	netif_set_real_num_tx_queues(dev, priv->plat->tx_queues_to_use);
+	netif_set_real_num_tx_queues(dev, priv->xmit_qdisc.num_tx_queues);
 
 	/* Start the ball rolling... */
 	stmmac_start_all_dma(priv);
@@ -7923,6 +7923,7 @@ static int __stmmac_dvr_probe(struct device *device,
 		priv->xmit_qdisc.prio[i] = priv->plat->tx_queues_cfg[i].prio;
 	}
 	priv->xmit_qdisc.algo = priv->plat->tx_sched_algorithm;
+	priv->xmit_qdisc.num_tx_queues = priv->plat->tx_queues_to_use;
 
 	if (priv->plat->flags & STMMAC_FLAG_MULTI_MSI_EN) {
 		ret = stmmac_msi_init(priv, res);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 54242461a860..1accc8e962d9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -1285,6 +1285,7 @@ static int stmmac_reset_tc_mqprio(struct net_device *ndev,
 	stmmac_prog_mtl_tx_algorithms(priv, priv->hw,
 				      priv->plat->tx_sched_algorithm);
 	priv->xmit_qdisc.algo = priv->plat->tx_sched_algorithm;
+	priv->xmit_qdisc.num_tx_queues = priv->plat->tx_queues_to_use;
 
 	netdev_reset_tc(ndev);
 	netif_set_real_num_tx_queues(ndev, priv->plat->tx_queues_to_use);
@@ -1427,6 +1428,8 @@ static int tc_setup_dwmac510_mqprio(struct stmmac_priv *priv,
 	if (mode == TC_MQPRIO_MODE_CHANNEL)
 		tc_mqprio_config_queue_prio(priv, qopt);
 
+	priv->xmit_qdisc.num_tx_queues = num_tx_queues;
+
 	return 0;
 
 error_reset_num_tx_queues:

-- 
2.55.0

