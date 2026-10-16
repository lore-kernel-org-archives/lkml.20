Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88FF3B774D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120991; cv=none; b=Opu+dYJDpSEivpElbcHMfsJOXoXeVWMJfl7xUwOa8jf5rFTfGN75U0qxwKnzt74hZtxQKNFIES7IXyrl7GkHhTIm2eg6WE/FySUL2S1kgBS5C8oJyXEDpAck7s+Hboo2QJ26/ai7pZo+9+m53vBfO3vT30LOBKi0BiIgCAVldLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120991; c=relaxed/simple;
	bh=oSOCS0VBj3DNzjAR+TkGA03Y0EsosNVo9a1JHQfcHLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pHQ7LQp0zbDHQyq9v/m8RxB1xWvFzahESGQJnyDLoB2JUDeCqOnHKpbCqyj6HypECTNfigSWuAnvQGoszBj8gK7dSccawWIpXz1wTkx1ybqZqV0CigR7PTo0rxteZgtWEx6N8PMLMcVq9dRUnYaU72rgYLzvag2LiF2VIk2ystw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JWE75Mf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AdTUNc9N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JWE75Mf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AdTUNc9N"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FND6nq558197
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=; b=JWE75Mf3H5ggkTcH
	KL6JvNmkPzi5ayxxi8n675rcfS3aX3hLGdEo4WffSfbXiqA6q859/N0xixZYx3sM
	jPpPevJpqO9HglFL44Z+dcb3bDLK+q8z/6d2HbP3mCGRklU4ixQR5NtypDcmq3H2
	M1vW4bn9A4HADRXwrknJt4ydJ77L+aj/BGawS847xUPdk07ub/qjmKS5cP+V6XoR
	eWbwrJumyuopgyZpeCSmnFX/y6lCngfcVV0XXM8oRdCYX8mhU0Rpa8irBb3Hpaxu
	+ivcmQIp3WC6QRStiKbvffz74US5gUEoGl3Wv2RTneRyv69iQLZPkNidJ86sdqD0
	v/8hfQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8a88p98-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:23:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso12164293eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120987; x=1792725787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=;
        b=AdTUNc9NTUli/+e2DWGMRPagpYoUflhOm84GFz8WXNtl3cHXJ2Cdqu1szoFTYIKX6n
         RHB14HnN0o0Slj1NFERq2sKkFoRneG2LP04jz29sIOX4k/tmqWcW0vWRvreu0lfCKdax
         I1UlE7c/VtHeIFnEIuAHiFu72F3uk/LHWLOTZ/+EaQfE7AjtUzbtj+D9ms0XVHKWhcRR
         ygVPwpFOuZqe1L3uAO1bbSw+lP1x1tNZGU0stn8G7jaov12N3Z8AnwhApMjnLzKylzpC
         9F3Ca/7UzhUOo0+IbBnL/F/uZerVWxeCsOFiD3ytwnvtTJAMW3T84txEuByrlD+XEeJy
         dylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120987; x=1792725787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=;
        b=CudZVo/uVTpQM0nDFqZPixUjoCsXRogP9vurN2nbgdPbw5orkKpxuVugc3xjLLB543
         DmQ+EUik7EKDrOheCMda+lT8hEoSQx63BmPO9uEF9i1+YDCE9KBwvbCTvPbBmN36YFcs
         mIeLTKjHc2tpXWMJ5sWCvBq7RQbjy9euW54QiCJbRdYP6cfI7fci6phzn6HJAuaPVHt2
         pNA09sU+iboTWtF/MrtYXHGWLBuPukQK61YNeUv4ahVtK3lESEQ7iwwTiiHynkjcJ0WS
         JToqyWlTvJ6N2NukPlTkAnz6+jGZk61SQa/fjKQQoHOro0OB3GKResUPt7I8zaOvNCYh
         BnQw==
X-Forwarded-Encrypted: i=1; AKwUvBygQBphZOdslK6+/3AKzGq4+hj+ThW9ymwOKTtYwbU8kXA4RfiXRI4l9wndwqpRDaztt5jokWrERItcEOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLWR5Z/xX6i4Y2QKg67nDDpGeTqbJdrpLLkGE8mqoK5Df80DCH
	OSn+0uJ/E9sW5GkvJDFOc0Mr52lRs5sfxdV5jLqhJreSqLbDghDWbDrROsfz0k21FGWe6zJVSB4
	qgyPOT8YO6hG+iNdPeMsv4h/0vrN65LraQn8B4qxGaOiGIr29snLlIj8Jor22U9z/OLA=
X-Gm-Gg: AYBFou1wxmdd3Qg0P4psJcOXzPbyy2hg91hC895dygBPg7z7B+ZRbgrrMuyCxWtXEUJ
	IO9ZwhSQEAmtBcMQiA8lgq3MdhMGhS9hcEVQ/Dmath/pw55vdBmcaKI/QddSweKuC3YbttUeDj7
	rU2k849zHA8a3LETjtasi5XldzMTaAOHHksVpJOLYpUjx71oJf+bNd06lB4jiXr1Mck08ovMHMn
	djZpChaMygdtdKWAUNJ0ZBoiwF2R3uaY4tcJjUdG1TWsjf13SUP0EEsKt9Q76/FoQAtpSdKBA8N
	kDwXWBj0hdfKBwKILAJbRFyiFWIWesJP0zwQwBppiLRrZs1lcakKlxax1RXWFv2ZCGv/Ho2yeU3
	OqGVF/t9sXlfU3HXG+qCPq0Juatza1YR6hbYTmuHnLyv3YP5KvRXKIjK2xPVWUubyT5qgw2cF2i
	yOzykBVSV6f2A/6qobzOUYPw==
X-Received: by 2002:a05:7300:e9dc:10b0:35e:9c54:d41b with SMTP id 5a478bee46e88-35e9c54d579mr8417801eec.21.1792120987264;
        Thu, 15 Oct 2026 20:23:07 -0700 (PDT)
X-Received: by 2002:a05:7300:e9dc:10b0:35e:9c54:d41b with SMTP id 5a478bee46e88-35e9c54d579mr8417767eec.21.1792120986630;
        Thu, 15 Oct 2026 20:23:06 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:23:06 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:54 +0530
Subject: [PATCH ath-next v2 17/17] wifi: ath12k: Add QCN6432 AHB support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-17-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX8dDYQq2u4tc0
 sCuK8o8qojc02Ad35+b69lk/w1XOnBaUg8f16fvF+nu8Z5Kyyq4BLCUby2jTpmyc2P7hpLuaSOb
 yTK0o8v/X9244wtGjbxzDvUce+LmH44=
X-Proofpoint-ORIG-GUID: QPb2-d8QLEWDxXORBEu5JdFATAkpOU0a
X-Authority-Analysis: v=2.4 cv=GJadgeNK c=1 sm=1 tr=0 ts=6ad1989b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=R6GObu012cZLLkk_EdgA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX/kxAyrwrUobN
 9pM0ma33N8NO/FgQR968or/hhvrxZC8qjrJ4CISGvBk/emHB40GmhXCvyHQ6uDXF0yc4sJUxRai
 BVx887JW9QI/Azt+/bbFWrbmtLG+nG0Wsc9yRbC7A3njOzNnYN7ej0+zHubpwoTtPmp7QDosgk+
 pk8eUBZrXY+6HMDiVnX5dLfv0zvoZYcCgUUBmWF7beT0bF/BUKVRKNSdnYMmik4Ss6ueTyjRy8T
 BfMja6d7RoGl/kRV79fL+saLH/hQerBZCzT/eSImPlWkKIUumgu7yM2oVFs7Tq1gpRSRTd2rTco
 XYFlIvuKz+9fqHVL0rTBxp1pQNcPQlbl+rNUhPNsjQbNeRyjuUxLj7R5+j1vMectz3BGY5u7WWR
 IGLxVFu78eBg8NE2wMkWpOntuYSDnlNie5+xyle/42GRpsZthCx5xhpbtmCKezfVcZmKvgYYWDl
 SzfjM7IS8m6xE1d4zMg==
X-Proofpoint-GUID: QPb2-d8QLEWDxXORBEu5JdFATAkpOU0a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

Add AHB support for QCN6432 by adding its hardware descriptor and
device-tree compatible entry.

QCN6432 uses a hybrid bus where the CE memory is handled through the
PCI interface. Skip the CE remapping and cleanup in the AHB resource
initialization and deinitialization for hybrid bus devices.

Also add the UserPD mappings required for the QCN6432 devices.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c       |  9 ++++++++-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 11 +++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index cecafc12e8a8..b55590c64a2c 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -1233,6 +1233,9 @@ static int ath12k_ahb_resource_init(struct ath12k_base *ab)
 
 	ab->mem_len = resource_size(mem_res);
 
+	if (ab->hw_params->hybrid_bus_type)
+		return 0;
+
 	if (ab->hw_params->ce_remap) {
 		const struct ce_remap *ce_remap = ab->hw_params->ce_remap;
 		/* CE register space is moved out of WCSS and the space is not
@@ -1289,10 +1292,14 @@ static void ath12k_ahb_resource_deinit(struct ath12k_base *ab)
 	if (ab->mem)
 		devm_iounmap(ab->dev, ab->mem);
 
+	ab->mem = NULL;
+
+	if (ab->hw_params->hybrid_bus_type)
+		return;
+
 	if (ab->mem_ce)
 		iounmap(ab->mem_ce);
 
-	ab->mem = NULL;
 	ab->mem_ce = NULL;
 
 	clk_disable_unprepare(ab_ahb->xo_clk);
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
index 889361e637af..ae5380eb6f8f 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/ahb.c
@@ -18,6 +18,8 @@
 
 static const struct ath12k_ahb_userpd_map ath12k_wifi7_ahb_userpd_map[] = {
 	{ .io_start = 0x0c000000, .upd_id = ATH12K_AHB_USERPD_ID_0 },
+	{ .io_start = 0x21e00000, .upd_id = ATH12K_AHB_USERPD_ID_1 },
+	{ .io_start = 0x19e00000, .upd_id = ATH12K_AHB_USERPD_ID_2 },
 };
 
 static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
@@ -33,6 +35,12 @@ static const struct ath12k_ahb_desc ath12k_wifi7_ahb_desc[] = {
 		.ops = &ath12k_ahb_hif_ops,
 		.supports_multipd = false,
 	},
+	[ATH12K_HW_QCN6432_HW10] = {
+		.hw_rev = ATH12K_HW_QCN6432_HW10,
+		.auth_enabled = true,
+		.ops = &ath12k_ahb_hif_ops_qcn6432,
+		.supports_multipd = true,
+	},
 };
 
 static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
@@ -42,6 +50,9 @@ static const struct of_device_id ath12k_wifi7_ahb_of_match[] = {
 	{ .compatible = "qcom,ipq5424-wifi",
 	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_IPQ5424_HW10],
 	},
+	{ .compatible = "qcom,qcn6432",
+	  .data = (void *)&ath12k_wifi7_ahb_desc[ATH12K_HW_QCN6432_HW10],
+	},
 	{ }
 };
 

-- 
2.34.1

