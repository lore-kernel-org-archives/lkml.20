Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738928;
	b=JxHmJWw4WX5QHtaU/pWn7TXa9tNlTDAUSNa1rzh2Wfd2HZKTWb76ysPB2LoWjMT5yRlV
	 EvQhiXb7oj2flV12q9Tjvfkja352I5QF10UjcJ1FjQD5R2JKj37w6DkCvh58xvJIAHHSs
	 PzsKKrFZpnyC7KL4ZBkiHpxmDkwscqTYP8mMpQQt9+HCg+SFaQifdAQGP1IZzxBPsCEkg
	 2UF03l9C23/Ch5sysY3e2FSLOPqyb8YnZdI3t5O/EiBb4kzmtAWg5vOqpml0WKr9qynS/
	 hG7Pi2l6ZCZoeC6ci8fgS/rGI+no2YDswwXCuzZEeLDnrSKtRMzZvDkkmRjLB3zyyxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738928;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=;
	b=mf30MH+gSKgLVXkPxCLAWmx7wSY0NkysehGlM+3IIfT/kJ61UYXmeJn2yagjw/0sHQKp
	 omza5BukNU1UMnO5fLditoMgEOqvlpJwkwQavAmvrfB2U82gEzAf3sjj4X8/WgId+bbxn
	 L0VdIC7GDLhup/Q3vo1jH9NTFnQJF2K4Oi/bLMWMNtdtHPAnqhZLW4mS5802BXqeUUy/B
	 LygKlUQcUgD9BU2epLY70Nwvon3QDw6N6cDQWcaWhsAw+kVK8rnEj4zUQIH0Um65eItiy
	 EkY4FXOpIDPE2CqwsJd7HNbGHxBH8VMWSvT1Fhk5WiyOzPMvVVvyh7hrgCXUtmSMkdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGFGrkJ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGuiP765;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB71607E969
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CB71607E969
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VGFGrkJ7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGuiP765
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FExL1869549
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=; b=VGFGrkJ7xeQ+67/z
	R3vFM3CO2/u/UmZZBdtQ9qBUCZdEwHGNRXTRPvtKc+fbhUrUdVVaMLvwQmOn6xSK
	uepKeRKHDf+/XKeQMZzyKN4uZrjvW4bR4jc2asmFQ37rFEKTMpy+S7GAxsNy1l6h
	NJVEPVyUX7M1Isk69Q8ci3zjhH2jGzCCkZxJpg3X7lC5/lWzDMnAVkMn1khoYDCB
	wQzBUcMOhjkGXp/0xM1ZFEOzUYx2s98ry5WltbgrRm2ga8mABoiMLVAwlPwxxlqo
	9jgTYB71ip3Wjy8iwNMUV/U/xpd2hk7UKlWzsvkJk7UCLi6WwE6auINayS7lr8+4
	GopuRA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjad9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so434550a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738926; x=1793343726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=;
        b=NGuiP765vKLFJzwGTxmWFuycJJyYrHTHWlJwSx8NcFpooBYcrjeaespDwZovfCKnkU
         bjMbFRTROFEmJAaDdXdtB0sTojl4RrA2NBVfUBdTSL+43cqq5XsqzDSbcjUnBJWAZI7R
         6HquCqaNXxLTvoEbIFIejTcy0EfiZNzcTRUcjv3rSC8SOUegCVQRdwbceZ3eorENltUE
         IHR83/a9HZJI0l7tiViqfVg3nTPlatZFIrJuEtgOZPyKE75nLwGyCBGq7NtAW1+lx124
         Mmfi3A2oS/xyvYsi52YTtzLDJzSkdSlx8+bxf/oMlENGwz5Q1cXxAhJbXggljt8VYn8x
         jXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738926; x=1793343726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wp0RCDsMhT3bPJrXj+baRIvNKxXxFWOrsPt+1Rjd8Wo=;
        b=DjwtUuHhDvbK8ZDyczu5ibb3hjbP/9b5HU0xDAZVXgWRyW5Fenmdi5hfl4j3lJMqXp
         sBXpKv0Wwb70yIuxGxKhblb8m6gbk6kNSlXNopmqe5aGv11LOr3IY7gWYaKmMVHZnmJQ
         p8D0aNPS1HqZuWXHpwGhKpPBg6d9qvcvhw9zJqnbxSpOzRdkg6RqvnUqO2V4f4UnzNxU
         tlXoLTev7ctkVcaYHodt6kaFzBVDMk+ib1PAmV7wfP91cXCO8BEoPTTGLfyJ1vTsZJRz
         PSAD1Hl0Rnd8bC5thimDil/7Y7A+4pYHk010ExoD8dQ1cdOrlTFqBqiigDAKAsU4tVus
         KanA==
X-Forwarded-Encrypted: i=1; AKwUvByg4mKKzIM+qfuh9RTjrr0Qeb5W3X4n4Uqvv+UERzgNbDZFbPJLnktInnsGgh7hhGTwvNWRdV4ySv8gVzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLptOBKEY0toDBOqKUybHAva9b6wO7M5ZCgepLUlCfL7IbqRJ2j
	spNJEoORELECk1RaSutKGssbEZnYmD0eLIhG38Hjpyl78HEwjr8buhUKQ1elLua8VmQLWTM2Fhr
	WKu0hcpChM+thG7ZJEy5sFtmdQKzjViaBzHEOsBBvzGu1JUlmSUHFypULcLYWDu0z8oQ=
X-Gm-Gg: AYBFou3oGlOCvu1jhwNh6jCwE0tfgxQfBBR2Hj1Vn0gOBLX4K5lFgABUlWE0tOheJbj
	/0a1fXWiNKvgwL74ahQbrqMeJzyqmYCj+k3CuRxFR2Tr/nvmHg0Ixrr/HCnIBmbYok+5H4xzCMW
	Fhh+PwFzG31NMaoEfNHcxi+6EMNNdBRdPQmgiobr6pEWkpo3I/zajczqXpzoZkzQW2LK0F+W3cU
	VnyTH4li2wccNnzW0iOk8Fh4hcniv5s3tNusBoihdNMUQhelSjUhIHCi1I5MU0X5yYAK3JX81DJ
	v6uiAN6SteUq4LHRHLfbb+81Y0zFh83X+QYGCpYwGlBD4lFQjqYilCXVEwTR3Ws3Lbh/3mbm5Xl
	RPY1DJW3aJfc1xtnJs2axMegQec3wQq/BbjBHGAK2D+2eEbP7lavWwebLsvrPewVWX25BQmr3r3
	BSFGjND+smI774cKD1KXvJ3A==
X-Received: by 2002:a05:6a21:3b90:b0:3e2:e6c:7d4 with SMTP id adf61e73a8af0-3e3693547edmr981105637.23.1792738925927;
        Fri, 23 Oct 2026 00:02:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:3b90:b0:3e2:e6c:7d4 with SMTP id adf61e73a8af0-3e3693547edmr981084637.23.1792738925376;
        Fri, 23 Oct 2026 00:02:05 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:04 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:15 +0530
Subject: [PATCH ath-next v3 12/17] wifi: ath12k: Enable MSI interrupt
 support for DP interrupt
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-mpp-bringup-v3-12-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 4IJmAXOu7b9igfsWGu94kCkdyVHAVUNq
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb066e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=BHcOcFGZyyTdvy3InMAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX0s9lG5uwrDmo
 GuwnUtTdsI09g8bEVyn9FoXtg82LbCcUQSLqa8dwlLIQaHR2tJewPp7x6U2BNcD06qo01KvB7yU
 sPFogx5kqsOXn4xoiWRRDbXOesMrllU=
X-Proofpoint-ORIG-GUID: 4IJmAXOu7b9igfsWGu94kCkdyVHAVUNq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfXwK+7XHJZ0Kyw
 MhYoakAqhbsUXDt0WRafz9gQBb1MtoufOtUoaySG8EplrZ0dG85x/n2e3S/F/pl3FwikkYPaDnY
 xkgQCIM4D/gIMbZi/nSGdspMgqXJQTp0YORVY7HuhbMAjAUgo4xjvXczc9kBDsInm23jiEHVfFV
 rz2m8RmOd9yU2u1ALT+WxiH3kgC5ZoYcQJyd7+wLMnTFTYaIBsU/N91Is7Gh8sbVvyIq8DtIu0a
 lg6fIGDnJk3vTd7OawYFRO+OOBqsPLHlPO9OfIrVpKxjSAUN/fpkDqC0EWP7CQ6v+/xgPN2RnIy
 UNrs611aRXQ0aAZ8iySpcdKW5CagOtByFzC8rQc0eNrPJy5/VyZ0y266gMI9yyHtzyNCoQccqbp
 PV+baN8S164xW1QCiPuExbevvVkeeo9JGWIYK824TyrZMSxUTw+e3gM+UDCHZjE6W+67op3/FVv
 Nsk7CALH0gAhIWW4OTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

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
 drivers/net/wireless/ath/ath12k/core.h |   2 +
 drivers/net/wireless/ath/ath12k/pci.c  |   6 +-
 drivers/net/wireless/ath/ath12k/pcic.c | 122 +++++++++++++++++++++++++++++++++
 3 files changed, 129 insertions(+), 1 deletion(-)

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
index fea284c3707b..13097cdf2794 100644
--- a/drivers/net/wireless/ath/ath12k/pcic.c
+++ b/drivers/net/wireless/ath/ath12k/pcic.c
@@ -181,6 +181,113 @@ static irqreturn_t ath12k_pcic_ce_interrupt_handler(int irq, void *arg)
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
+		desc = msi_desc[vec_idx];
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
@@ -294,9 +401,23 @@ int ath12k_pcic_config_irq(struct ath12k_base *ab)
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
@@ -307,5 +428,6 @@ void ath12k_pcic_free_irq(struct ath12k_base *ab)
 	struct platform_device *pdev = ab->pdev;
 
 	ath12k_pci_free_ce_irq(ab, ab->hw_params->ce_count);
+	ath12k_pci_free_ext_irq(ab, ATH12K_EXT_IRQ_GRP_NUM_MAX);
 	platform_device_msi_free_irqs_all(&pdev->dev);
 }

-- 
2.34.1

