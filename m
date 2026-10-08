Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2A549B5C6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455109; cv=none; b=K1uhOqXJcVSsMl/lYNZr2NJ2HQ8Zx0eNM3g+WcdHaWXbOU38W3j3ewerpjZqTrityLzdcxtZzB7ggN7+FCE8yPJeIAZIdXzGSEewkhbLZ1hx9/YUXAAdsuGHbCJ2H2YsDkYbJyukfWCokutcY5H83gt+b0sP/avOPROyEK2hiE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455109; c=relaxed/simple;
	bh=jW/7UUDyL3HyaN/gTigzVghK+/J4tjjNR3AC6QLyfGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F1AbFVn9KF+M8+AIDeJ+V6QAocxHF/ii/cxjPuKWqO4Bm67upVTO208w3qGyLQ9jQ4oLua8BMet9lUylfB3uInQhQu5eM36KmhWjrMUURCXwMO+r83BvpjM3Mxk6b59IQQnxonU4zbre4mIwtK0t0q50iR6LSYCrPhYaqROpyc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p2b9QZDX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMH98Cb/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p2b9QZDX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMH98Cb/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987K4b22189845
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:25:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BPtAgPGyDX4LIJj5+VGGoUZSUG3Qs2DKqEGaZSXoIRo=; b=p2b9QZDXX7ZDbeFy
	ebmcmmol5rEQN0jZIN6IPEv9yA8H8+80VdrIUWyN25+DtpTjev10eLrDYUQEoliP
	rauE0BfamkHR7EwsaSn0i9678zjSz3MblSHFRv9japULJ3ouBZ3NGVWHlV4xkeY6
	gRPul9SpSzdWmrn5bj2xNufHRXLTpa5i/ky3IKOqawD5QsyBtMte+mYTr0xUKGEi
	bvACm8ZSCao3B7NhjnyT1vFon7myGfPxRsF4fdaPtyEYFbdbffjWep91jtDKsjYA
	Uy0w+1kQ5F557CvDrkUwHADtkplRK1gLB0AE1AB2YFCzR5exC23R+6iLRLvK6H78
	RtflbQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3adcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:25:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so49693875ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455107; x=1792059907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPtAgPGyDX4LIJj5+VGGoUZSUG3Qs2DKqEGaZSXoIRo=;
        b=jMH98Cb/cYWhS38i8bcz8t6d6lKovQTfx/K9WnV9I+1UaYqK4wQv9IW9DNf9WupA40
         yu3975h95DkYXX2xLZ0W7uOp+PZE4mStE286yonjC2P9wDbGa16g/m8oCaFEhFp0k4fb
         /2R/Q8lvGPbLhXUeh7t4cGuF0eEG81p8ZlWx6L4VhOxu3v0eNJ0nwfe28tc7y02v5ob2
         f/MXuAohJQi7pTd5md/RpqWu9E6VTrDWIqR4sHvWweh2GKTlVaujt1H5hezgA0jrj+WQ
         ELh0kxBSc0ATiN3xk+9mPu2HJ7TmE1LJTH7X4H13zb9MhsuwPRf6eMk2vC02uiL8qAXT
         S+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455107; x=1792059907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPtAgPGyDX4LIJj5+VGGoUZSUG3Qs2DKqEGaZSXoIRo=;
        b=1LtvTLZZo6fh9v3WDFeQAtgn4uH8iN77ujQPjNwO2DC3Mz5Mvc1HNwsGb+BeOt/bPy
         N9uF4uw8iN2vyRtweg/jMwLt+G5UABctvNeNKUNkx+JTHfxxTj2FK7KbCg9SaSVU94Dx
         qMB3Qv3X8igirPHrUhNlE1WFcPvJRUvNafcEH4qH1fSxPAIJKpdG8mFRDXCfTb6jVzYr
         lEESjvdh+y4KNC0zISzTtKceElgl7RdyPk7hJ02Juv4CmCzXrIBnLWp7tmIPfNOUPXGX
         sK+ilT2MGTdrvaexB2T/3BUOe6Y+TFxJhII7V+SbiSe9jod/EX1ERENFa3P/HOr0IqOC
         xSXg==
X-Forwarded-Encrypted: i=1; AKwUvBxxn/OX8EBk0HMQAcQOpS7EqkpCCU5gKPPgFJc03QQlBB6wdw6Njv7hg5dcqpJY2lTe1bcXClpuxbB0vwI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9jmfUMbz5EhZbrb+ETbb53Nqv0kNlfVlO5n/p3F00j2oaAKqe
	1basBrT71VrmaPn5aEDrh7sY+DRunqHlmR+RsSmhOgtl8z/Qqs0Ar6QsUmcPoU6xz3F+5UHuXt0
	wnfO1HTSpodSkRuMER7GmUF40UDt9l8uGgbVWwiMUyiMd0AsWARKVofWH6IV+a8jQCcc=
X-Gm-Gg: AYBFou17bYuLMHmpPkWbytC/u6PZx9fDLDq0ei37jc9nZJAfF9zjTV908CzKIT4p+Jl
	YuaDrBw5kjGNb9w/L0zOfzoc2o04627S+tLQCXW9S49NUrLxL0eIDb6J9kzYRf6xWUjyD7XW2rO
	ioAzPFqyHaBZr8YOuEm0Dv1QKYA5MMTEmELPNKspAPpN0cJa6FkHfbqR54GLJ4Io2Az5cnHDuVM
	9rY4UKkR2chKE9CNbblW5960Y2lf5v/5Zhvnq+23ycYa8Xw4zEWowhxhJj1x3SovHc64rZ1mZsq
	Q3DfMMX01uj8jzcl/ewTaQiiqAAN40lRJ/0DvdoOh3zYH4cv1o2sescsIixsxJU4d4ucMKn5dZ1
	Q/jiBASPDr7k/ts+NToka/WdVyp3JAlUIm5YcJbecCztJ4ryVNiYJ1fnRNQW5awKKggTZDbYz9o
	GKvE5nulRZiSO6+JA8D2EQpA==
X-Received: by 2002:a17:903:4b24:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2e6003891d5mr41561935ad.24.1791455106989;
        Thu, 08 Oct 2026 03:25:06 -0700 (PDT)
X-Received: by 2002:a17:903:4b24:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2e6003891d5mr41561715ad.24.1791455106508;
        Thu, 08 Oct 2026 03:25:06 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:25:05 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:08 +0530
Subject: [PATCH ath-next 12/17] wifi: ath12k: Enable MSI interrupt support
 for DP interrupt
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-12-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ac76f83 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=3HAlypJ90nm0-WewFtkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX3lZECXuN7N5d
 9nz2Cl6YP58bLYz2DIZM1nDbbBJJv/sUYSsGeQ9/f6bhyU1Iqs4pomfuT3/PZGNEMxf7L5VIkQa
 GwRfln8Pbt5q8tKiPVXMaQWXV8KtWDQ=
X-Proofpoint-GUID: P8pbnfojPjb4tGUjof2S-dlwc4VTWRg0
X-Proofpoint-ORIG-GUID: P8pbnfojPjb4tGUjof2S-dlwc4VTWRg0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX/ce/G+/5ckKF
 sNMwf1lbJI3OBFrX7o8+Hv1MWnL5MvpIr8rSEFJbGC7kIs1n2EUzw9k0TJN2AQvhILVwjgsHEkf
 eb6H+SDb8UOrCDdOCkEj9cqU/amfSKcvb+CUPYvSpyYK4WYeE2iHu05htj/IxTamABywMbuEXYf
 /jA0wBCChk8F41e9MrHKtygOk+D30MOOppqD4TMy8w01gwSdo5/7w8v8G5KqdjkZBH0Ce7bxdDG
 1aNYwVDzxOZxQ2VfQR/Kj1N2l+v6quJIM8UEbxMPmm2M2CQOT1MuutJ2T6naRn8fx1Y1uddtsJt
 mdF7IWtb+X2JBQ6YxIRGbierEZrA5bVzZT694pAAjjLPEV6K3cpj37JagpnLdJBD/heU7XVr05R
 j5z/AsqeLyicL0pX4GKHl+4OmkMEv6tTC8YruB64RsTOvjCHtON2M8OTBslJzCcTcetqJNcWkQu
 vbVtqbqDfyQuhE1KYGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

Configure and request external MSI interrupts for DP ring groups on the
QCN6432 platform.
Create a NAPI context for each active external interrupt group and
disable the corresponding IRQs while NAPI polling is in progress.
Re-enable the IRQs after completing the NAPI poll.

Handle allocation and cleanup of NAPI contexts and external IRQs during
configuration failure and driver removal. Also disable external DP
interrupts from the AHB IRQ disable path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Co-developed-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c  |   1 +
 drivers/net/wireless/ath/ath12k/core.h |   2 +
 drivers/net/wireless/ath/ath12k/pci.c  |   6 +-
 drivers/net/wireless/ath/ath12k/pcic.c | 121 +++++++++++++++++++++++++++++++++
 4 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 78367126f49f..892872f70b2f 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -558,6 +558,7 @@ static void ath12k_ahb_disable_irq(struct ath12k_base *ab)
 	}
 
 	ath12k_ahb_ce_irqs_disable(ab);
+	ath12k_ahb_ext_irq_disable(ab);
 }
 
 static void ath12k_ahb_ce_workqueue(struct work_struct *work)
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 21332aeb0c22..bbbde9f05ea9 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -165,6 +165,7 @@ enum ath12k_hw_rev {
 #define ATH12K_EXT_IRQ_NUM_MAX	16
 #define ATH12K_MAX_TCL_RING_NUM	3
 #define ATH12K_MAX_MSI_VECTOR	32
+#define ATH12K_EXT_IRQ_NAME_LEN	32
 
 struct ath12k_ext_irq_grp {
 	struct ath12k_base *ab;
@@ -175,6 +176,7 @@ struct ath12k_ext_irq_grp {
 	bool napi_enabled;
 	struct napi_struct napi;
 	struct net_device *napi_ndev;
+	char irq_name[ATH12K_EXT_IRQ_NAME_LEN];
 };
 
 enum ath12k_smbios_cc_type {
diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index a26fdb3c0ad2..4bb14a95aec9 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -348,11 +348,15 @@ void ath12k_pci_free_ext_irq(struct ath12k_base *ab, int num_ext_irq_grp)
 	for (i = 0; i < num_ext_irq_grp; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
+		if (!irq_grp->napi_ndev)
+			continue;
+
 		for (j = 0; j < irq_grp->num_irq; j++)
 			free_irq(ab->irq_num[irq_grp->irqs[j]], irq_grp);
 
 		netif_napi_del(&irq_grp->napi);
 		free_netdev(irq_grp->napi_ndev);
+		irq_grp->napi_ndev = NULL;
 	}
 }
 
@@ -1118,7 +1122,7 @@ void ath12k_pci_ext_irq_enable(struct ath12k_base *ab)
 	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
 		struct ath12k_ext_irq_grp *irq_grp = &ab->ext_irq_grp[i];
 
-		if (!irq_grp->napi_enabled) {
+		if (irq_grp->napi_ndev && !irq_grp->napi_enabled) {
 			napi_enable(&irq_grp->napi);
 			irq_grp->napi_enabled = true;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/pcic.c b/drivers/net/wireless/ath/ath12k/pcic.c
index fea284c3707b..06178b4f20d1 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -181,6 +181,112 @@ static irqreturn_t ath12k_pcic_ce_interrupt_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
+static void ath12k_pcic_ext_grp_enable(struct ath12k_ext_irq_grp *irq_grp)
+{
+	int i;
+
+	for (i = 0; i < irq_grp->num_irq; i++)
+		enable_irq(irq_grp->ab->irq_num[irq_grp->irqs[i]]);
+}
+
+static int ath12k_pcic_ext_grp_napi_poll(struct napi_struct *napi, int budget)
+{
+	struct ath12k_ext_irq_grp *irq_grp = container_of(napi,
+						struct ath12k_ext_irq_grp,
+						napi);
+	struct ath12k_base *ab = irq_grp->ab;
+	int work_done;
+
+	work_done = ath12k_dp_service_srng(ab->dp, irq_grp, budget);
+	if (work_done < budget) {
+		if (likely(napi_complete_done(napi, work_done)))
+			ath12k_pcic_ext_grp_enable(irq_grp);
+	}
+
+	if (work_done > budget)
+		work_done = budget;
+
+	return work_done;
+}
+
+static int ath12k_pcic_ext_irq_config(struct ath12k_base *ab,
+				      struct msi_desc **msi_desc, int num_msi)
+{
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
+	struct ath12k_ext_irq_grp *irq_grp;
+	int j, i, k, vec_idx = 0, ret = 0;
+	u8 userpd_id = ab_ahb->userpd_id;
+	u32 num_irq, base_idx;
+	struct msi_desc *desc;
+
+	base_idx = ATH12K_MSI_IRQ_CE0_OFFSET + CE_COUNT_MAX;
+
+	for (i = 0; i < ATH12K_EXT_IRQ_GRP_NUM_MAX; i++) {
+		num_irq = 0;
+		desc = msi_desc[vec_idx];
+		irq_grp = &ab->ext_irq_grp[i];
+		irq_grp->ab = ab;
+		irq_grp->grp_id = i;
+
+		if (ab->hw_params->ring_mask->tx[i] ||
+		    ab->hw_params->ring_mask->rx[i] ||
+		    ab->hw_params->ring_mask->rx_err[i] ||
+		    ab->hw_params->ring_mask->rx_wbm_rel[i] ||
+		    ab->hw_params->ring_mask->reo_status[i] ||
+		    ab->hw_params->ring_mask->host2rxdma[i] ||
+		    ab->hw_params->ring_mask->rx_mon_dest[i]) {
+			num_irq = 1;
+		}
+
+		if (!num_irq)
+			continue;
+
+		irq_grp->napi_ndev = alloc_netdev_dummy(0);
+		if (!irq_grp->napi_ndev) {
+			ret = -ENOMEM;
+			goto fail_allocate;
+		}
+
+		netif_napi_add(irq_grp->napi_ndev, &irq_grp->napi,
+			       ath12k_pcic_ext_grp_napi_poll);
+		irq_grp->num_irq = num_irq;
+		irq_grp->irqs[0] = base_idx + i;
+
+		for (j = 0; j < irq_grp->num_irq; j++) {
+			int irq_idx = irq_grp->irqs[j];
+
+			scnprintf(irq_grp->irq_name, sizeof(irq_grp->irq_name),
+				  "pcic%u_wlan_dp_%u", userpd_id, i);
+			irq_set_status_flags(desc->irq, IRQ_DISABLE_UNLAZY);
+			ret = request_irq(desc->irq, ath12k_pci_ext_interrupt_handler,
+					  IRQF_SHARED, irq_grp->irq_name, irq_grp);
+			if (ret) {
+				ath12k_err(ab, "failed request irq %d, for group %d : %d\n",
+					   desc->irq, irq_grp->grp_id, ret);
+
+				for (k = 0; k < j; k++)
+					free_irq(ab->irq_num[irq_grp->irqs[k]], irq_grp);
+
+				netif_napi_del(&irq_grp->napi);
+				free_netdev(irq_grp->napi_ndev);
+				irq_grp->napi_ndev = NULL;
+				goto fail_allocate;
+			}
+
+			ab->irq_num[irq_idx] = desc->irq;
+			disable_irq_nosync(ab->irq_num[irq_idx]);
+		}
+
+		vec_idx = (vec_idx + 1) % num_msi;
+	}
+
+	return 0;
+
+fail_allocate:
+	ath12k_pci_free_ext_irq(ab, i);
+	return ret;
+}
+
 static int ath12k_pcic_ce_irq_config(struct ath12k_base *ab,
 				     struct msi_desc **msi_desc, int num_msi)
 {
@@ -294,9 +400,23 @@ int ath12k_pcic_config_irq(struct ath12k_base *ab)
 		goto free_msi;
 	}
 
+	ret = ath12k_pci_get_user_msi_assignment(ab, "DP", &num_vectors,
+						 &user_base_data, &base_vector);
+	if (ret)
+		goto free_ce_irq;
+
+	ret = ath12k_pcic_request_msi_irqs(ab, base_vector, num_vectors,
+					   ath12k_pcic_ext_irq_config);
+	if (ret) {
+		ath12k_err(ab, "failed to config DP irq\n");
+		goto free_ce_irq;
+	}
+
 	set_bit(ATH12K_FLAG_MULTI_MSI_VECTORS, &ab->dev_flags);
 	return 0;
 
+free_ce_irq:
+	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
 free_msi:
 	platform_device_msi_free_irqs_all(&pdev->dev);
 	return ret;
@@ -307,5 +427,6 @@ void ath12k_pcic_free_irq(struct ath12k_base *ab)
 	struct platform_device *pdev = ab->pdev;
 
 	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
+	ath12k_pci_free_ext_irq(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
 	platform_device_msi_free_irqs_all(&pdev->dev);
 }

-- 
2.34.1

