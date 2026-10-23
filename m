Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738919;
	b=j/2zJ5wOy+jBTfiwqkaDy3mgNlQx3mTpawBkGSGU9Vf5l9TzLKrJqz2R43rdl7I7jJjs
	 mEgjaF8il4xDy+7TPNN/mEJzxYq3kSN7+zSmeNnNwyypykwCHh/nXkbegm573nnm10eSa
	 zmiMcuSPsQkeF2ZgW4nBZMWkNssSNFbhXYphxTr8lmbeAEQ8MLlhldeq8pXJcxpTUxSkH
	 2ax3I8oTkqzmDaj6iYbVGXKNZYguI5vDYDO9ZGcRQ+L2jxhDpkoGSKcFaUeja4uTNK94C
	 F5Xe/XgDpyexIEFl6hXO731hTPY8XipEG+uMyTrqskQ5+N+tnI026qukgHSGo2wK2AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738919;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
	b=duclVjlPCDHENmlQ0Orkzp/8X/LRPjxfEWYBuB0VSxGgJCfj6lc9e+AIk0hRe1JLfPhx
	 XndUUggHCoOwgl0fur7Hye+IFe4RYRZvdimCls1qL2+ZlArUqa5EwmS/SIGN6AE6fuUYD
	 cPSYPd+iYHJxZqwQv7bTK9Fkv1olf6MtT1ESLyfm8TvZLiD6cqb0yIS4+NVv1Jhfc2qiQ
	 VEdjGtDYM3niq0nClzkuZBFPB71uieG3v4Lpq3XDB2dtkJ2NkIUF6wYtHjMoC+vhMnaZa
	 cOxuFEWxaj9LiNsupsIh/7B1taQblTpFGqF/90wfV0TqgpPJPvtE5JNuG44uUJqJl0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MeYDPFpE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="AswaVVA/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F27A607E960
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F27A607E960
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MeYDPFpE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AswaVVA/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FA2h1792141
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=; b=MeYDPFpEXJiuyK1R
	FTSVjmziSChxYcP1uDYdu/SfKzHsysXiahXiQcZGZx+kogUzpJkVUBK9oU5wcfMf
	zz/Dul4sEZIgZtPbuwJSlYP/mtJS2vUPxTBAJyRaLxFuRwUMGcBv8w1e0I6kE1TE
	PuiQVIa4mUyXCa9OBL7tbLutpw+Ve+2BjkwnnXeNin1xDsQxqVsC+hcEy5C2HB+E
	g2tWa+rptx26aWUXRPlqWIVclLmQ51nVlBrFw9ZExnjQlxgome0X24D6yPhdCRYN
	cBogC3s/3dDLKWyEx97klaXkZZh9pM5Rsj14fEkp1ou+LYYxmfbukvvjOJ1cFf5o
	HRyajQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0jwgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:01:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd8b299b0abso380754a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738917; x=1793343717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
        b=AswaVVA/cB44yLCWjLosmuHWPqX8DUKqoVEgXTxEdAWwKJtu1xopBu/sK3iTODHY6N
         tWywRucOpWtzvA7SzdDWe3MonEjWtSkhfApl9+/h9ISqlPE6z5/kFisQiWMJXtZEnbKV
         CdQXR/q0hCQ6lnuwnf53PnJuekoC2iypbWP2DwKGq1JTw/zeMEBs1H3nTN1g01bRwXEE
         J2dF/e6JfKe3IDFrYBiO70auEtjT7UmvZVjt3xYj/KAj9qBnrYsjZdbj2+iptNGYCe5j
         bMltld15CfctNOvY5rRelzV2vNXCRBKsTf5LhpRNylTl8pBmlmgT6K1BH/Zj4V+OszpE
         nBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738917; x=1793343717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
        b=teCMrBm1cMZZkV4jKvHyK1yipl98fHS9miTjLEHveJRS0VjFWSTS5+jF2K7F/88mll
         2Ypg0G+Fe/oJFr3hB6YC9DUB8xgfsyP4dsiRtIL1YyTgQ93XpKOTfgGW5/z0CgF7+FVK
         yCzbZCfUAXJjeUegL/0lFZqdcZrYrzKVDz2N9X7LWcMhDctDlwr9Mg2hRtRPhqOUv6Tt
         nqpLpC3DpjnbGiNCW/1J5K2QYPcKJ9Qp7/0LHCmtgcGWEUCPBSzCd2CdzLc+j87qZy2m
         h5BhZs9LKATesgR2tSzkz0VBfL2NpTcseh9PFzMZhrMmQ+fCTNm8wIqkHD6YDlk+2A9N
         hs+Q==
X-Forwarded-Encrypted: i=1; AKwUvByuiC6S8gMsFiNCL38QIxZaxyfFUEiwSmwXISuQzkk5CKARYK8eU+sXl5n+yazV3XxxQYz2HBdO//fb3Tk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLx6Xnl7+pQP6How50He2bYhsn+4iLbIIePP6cdWmqsfzGty+F
	velBrxr94pIySLc94ITe6ZBkKdQ5wFyPYl9dmAAWAmTQ4/MG0Jbt959CfJtVjK4LYVCcRg/ixT1
	l7oosFnsXAIszrEek1ztbs4t/2EKbsGS4FCzFEvvV+k/M4lVFQpAFIx1XGtHBJNor3SE=
X-Gm-Gg: AYBFou3Iwjj6kDt9JCWT9aSb9Fs2s0e2LIgCt7/OsgIJPequd9bwo+cILP0Qbs5jj6U
	6++3Ryp7H7S/F02sCg5rxL3aERmUYCxMWAuWy7lBc+d3Fp19hcpuvpMpHMtq9MYwYl4fZkXgc7j
	W1Ls3tdhKG79gWyiUcILjE5XEFuuOTRCGnVpkIPyHqLcefo/60RxKR/IgFCU/hQCSFUfruggubQ
	uBoeL7FXfoBw7v1HZcW04JZ/2TwQEfSaMMerupd0XZNbwTLdCpOHe8NUVyfX43twoY07xttTZZk
	IvkOyKVgsSXkHZR3msn48kXuohdI5u2dISohKZa9xYN3EB26iKmBd/ZGLo97DG5QQ/m8j8vNrka
	fkyn4x4rdeX0CSNWmKvS59/IbCd6C6ZSouAg/dAQ3vwsN4LdruTNIpGkREjiu48bxNbT9ivoVPt
	vERTtu9uNYSAD08xs8Hr4/bA==
X-Received: by 2002:a17:90a:dfc3:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3adce02eabfmr1018333a91.31.1792738916968;
        Fri, 23 Oct 2026 00:01:56 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc3:b0:3ac:9772:8da3 with SMTP id 98e67ed59e1d1-3adce02eabfmr1018315a91.31.1792738916469;
        Fri, 23 Oct 2026 00:01:56 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:01:55 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:13 +0530
Subject: [PATCH ath-next v3 10/17] wifi: ath12k: move MSI config to pci.c
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
Message-Id: <20261023-mpp-bringup-v3-10-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: 9X_ZEpDjdFzOpVtQ1NgrYv5azleAbiFK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX1HJsjWTRpqVp
 MgkILL38P0SVe+suEcuNTE4za3NhWMfwqAPy1pwdqY3bA89VtfQDX4v7po22wrmVhLrEPYXFyk9
 ULZhGV/I4BkiBx2o4lw1ZTYyKKHSuHAOsAEn1obIY3U6VCEYoujI0YXPa74QPCtuJ6xi7dsU/kv
 u5ky10ctCwEKm8LwEER7E9PrXT05bYrF4r3XMY7Edp9t2C2fcaO2bYqa+7ULK8nUGaJoi0W4a89
 LMcqTJH6528wRKihg6SigqUJf7c0D2Io9uGeYnOZBF8gj2Npe/ia1BJfseBS/GXG+FJX9wPuBlk
 pM+8F6ASf1CISG5oTVheyLILN93e/cZ3GdTxSpSh6HNgQmNl9v5Zx45+hRCqzI+L5KdbUqP4gPq
 +/A3SC9ubJvMdEn/7iAdw44nmoet9TNvaFr/rTnY1KjijNXDP6yT7zZBm1wc1pL7igibSXOuz/6
 C1VLXLH7SEVusWP3zhg==
X-Proofpoint-GUID: 9X_ZEpDjdFzOpVtQ1NgrYv5azleAbiFK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX2/8Pnqwo+Zt1
 d2AAyBLfbarJ1vgSeeBzTjq7/knd8hUy+WthUGBVfGq/h3G+MayGC0nRAjavUQOu/bCbxq2JlFb
 Uz6sdRF4HHE38CSMO/6mEWRS9C4gEPM=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb0666 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qUmDSaCxm7SoV8805q0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

Move the ath12k_wifi7_msi_config array from wifi7/pci.c to pci.c
so it can be shared between QCN9274 and QCN6432 devices. Rename it to
ath12k_msi_config.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/pci.c       | 14 ++++++++++++++
 drivers/net/wireless/ath/ath12k/pci.h       |  2 ++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c | 19 +++----------------
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
index e6fe891e58b1..fe0939ca890c 100644
--- a/drivers/net/wireless/ath/ath12k/pci.c
+++ b/drivers/net/wireless/ath/ath12k/pci.c
@@ -40,6 +40,20 @@ static const struct ath12k_msi_config msi_config_one_msi = {
 	},
 };
 
+/* TODO: revisit IRQ mapping for new SRNGs */
+const struct ath12k_msi_config ath12k_msi_config[] = {
+	{
+		.total_vectors = 16,
+		.total_users = 3,
+		.users = (const struct ath12k_msi_user[]) {
+			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
+			{ .name = "CE", .num_vectors = 5, .base_vector = 3 },
+			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
+		},
+	},
+};
+EXPORT_SYMBOL(ath12k_msi_config);
+
 static const char *irq_name[ATH12K_IRQ_NUM_MAX] = {
 	"bhi",
 	"mhi-er0",
diff --git a/drivers/net/wireless/ath/ath12k/pci.h b/drivers/net/wireless/ath/ath12k/pci.h
index 3097afb03432..55cc875f9ce0 100644
--- a/drivers/net/wireless/ath/ath12k/pci.h
+++ b/drivers/net/wireless/ath/ath12k/pci.h
@@ -96,6 +96,8 @@ struct ath12k_msi_config {
 	const struct ath12k_msi_user *users;
 };
 
+extern const struct ath12k_msi_config ath12k_msi_config[];
+
 enum ath12k_pci_flags {
 	ATH12K_PCI_FLAG_INIT_DONE,
 	ATH12K_PCI_FLAG_IS_MSI_64,
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/pci.c b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
index bb617bb6b71a..783c5d020f07 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/pci.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/pci.c
@@ -37,19 +37,6 @@ static const struct pci_device_id ath12k_wifi7_pci_id_table[] = {
 
 MODULE_DEVICE_TABLE(pci, ath12k_wifi7_pci_id_table);
 
-/* TODO: revisit IRQ mapping for new SRNG's */
-static const struct ath12k_msi_config ath12k_wifi7_msi_config[] = {
-	{
-		.total_vectors = 16,
-		.total_users = 3,
-		.users = (struct ath12k_msi_user[]) {
-			{ .name = "MHI", .num_vectors = 3, .base_vector = 0 },
-			{ .name = "CE", .num_vectors = 5, .base_vector = 3 },
-			{ .name = "DP", .num_vectors = 8, .base_vector = 8 },
-		},
-	},
-};
-
 static const struct ath12k_pci_ops ath12k_wifi7_pci_ops_qcn9274 = {
 	.wakeup = NULL,
 	.release = NULL,
@@ -103,7 +90,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 
 	switch (pci_dev->device) {
 	case QCN9274_DEVICE_ID:
-		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = true;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_qcn9274;
 		/*
@@ -130,7 +117,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		break;
 	case WCN7850_DEVICE_ID:
 		ab->id.bdf_search = ATH12K_BDF_SEARCH_BUS_AND_BOARD;
-		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
 		/*
@@ -154,7 +141,7 @@ static int ath12k_wifi7_pci_probe(struct pci_dev *pdev,
 		break;
 	case QCC2072_DEVICE_ID:
 		ab->id.bdf_search = ATH12K_BDF_SEARCH_BUS_AND_BOARD;
-		ab->msi.config = &ath12k_wifi7_msi_config[ATH12K_MSI_CONFIG_PCI];
+		ab->msi.config = &ath12k_msi_config[ATH12K_MSI_CONFIG_PCI];
 		ab->static_window_map = false;
 		ab_pci->pci_ops = &ath12k_wifi7_pci_ops_wcn7850;
 		ab_pci->window_reg_addr = WINDOW_REG_ADDRESS_QCC2072;

-- 
2.34.1

