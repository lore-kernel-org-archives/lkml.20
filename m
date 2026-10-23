Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738950;
	b=1bU9UcZEzmjCtrdnYg+Y1BdrO8BuYGycBOX/Pdf4dN2Jph0mXEGl69Ueq3O5QUEV+g6s
	 csua8tFRDA+GTGE/ML4JTol4TAgMFXe+edD/wnd/s3wDp2Nb4iGtmh51Gp9B50JPvitV7
	 lGJw0TVEfudRDA9WJF7G0OuayL1q38Lmsk9sIvoJSTb/hyzmtjCjRP8WXybGw0PYSU8A+
	 nV0BbyUc9dq7tAjG/rr3vPKaE9/W4kX0vJqWZVz2j274U1U49WeERkiuDohW8CjRqXMBt
	 4h3JVXH+hYWXL90QnGTVA8fbh7kD7Gt1Fy5yDOhhMuNg/byKWtWN2JXGPl1Y6naf+qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=;
	b=1t3cXADscSw8SFMSa0q9DyyV7QBHCT63eWtTor5VWLa0z2Ybj6JdARyP+lSzfpqZ+zPE
	 a3EOnL6J0HaRoNeAICqMXFlCbb12d9YTngNqfA23s4otSnJn8jT5hGYwuNzU7WgA3tG/L
	 IJ4A+Q9Fp3WxvT5fdz3l9TAop8OrrxErK74JC6sifiVvM51KUADTqc0wURvZdTnA5Up67
	 TpRvPFTDwWB5B/q83CBD2kBPtf5E9NYt+SUghjx1wqemfx2FCKLFxXCgPvfPh/FJMPCrW
	 qFG6R4YJ04e4bGJLLw3kDmNYbfuhNoc/UWgbyhRvlWOzr7PcZdf9AYwamXZgzPQ54tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQYopkuj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uc5DWruR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8050606BD0B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8050606BD0B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IQYopkuj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Uc5DWruR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F9W11792128
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=; b=IQYopkujZvHpVxHY
	b1d4rQf0efoSQLNWgNV/ZRRuDpKpgm6K4s+f4hyEn5kMwRatTdJ53MDZWlxHus6r
	+mDBbR+VDPpH6wXC/UuSoDKc5NGMFmUNSE9/9EOdsYdRE7q0cIme9Vn66aw23j30
	mhm9h0wVOXKzyn5kxX5XJrHhr6SFGK5vhOWm5CiFWm78tYK/G637mXTeGWVTfS+9
	qdjotwmZURqGLLtlhZn+5kl5/VekGUQp8cR5XtzD+jj2Jo35Jdz7q+4vZz0/wp1Z
	IOy4M5ZV4XQqe8ScrYGf2MusHCqS1unN6My7L9n5JLKDSBHm2DPLXt+XC/WRH8C0
	3EsexQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0jwkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:02:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab67ff8ec3so517442a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792738947; x=1793343747; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=;
        b=Uc5DWruRU2/f3OrTSlCRRWVdCvVedeAeVTV7siI5d+Dnj/Duh49KeLkFqgKkUdh4lz
         dTATIEuvc8cbeCLn6cLusuA+oi38hjkzMC0tqKodJvbEV8OjFxHbD1KPF4Du7w5/42ZA
         NnINFvUejnuobAefKlOhWrRNCBcKYus+6uNwUCyQVUgYg1W2ExhypNTO7jXBPWOaCc+D
         G9esh5xxsZ84sYGuDsWSJEuO6lrpxY7aT3aPwuBnVRX0OUhlcIjQkzOPtZxaWp51uvcm
         4Enir6npudVrT2XEMO3QnvBvXdjZxowgVSdETUV17Qf+FtDyiRo60dkt8f0JgB+TN+ve
         vUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738947; x=1793343747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlYuG6WB38gIzmIC/YDa25c8nS2xNNSGEFoJZF8X6UA=;
        b=KW3+/3sptGp6xN4g7kfSMPopFi/kKY90z/a1TZyJecMVcRVu2L+P+VnWj7mEuXPIoo
         uJEtuLMOrpQuf7GXVL/NGIXpJyhhvOtBigIMbA2vTzgoXLC6CbP7sLCMScr4hzvixSwB
         G3H8w5XRD6SFXC0iaXqYtwcQW1dDZkQiYQp7HMM6BHXJmQA5Ng59P3YT5mp/XYP53CSV
         MzTbthcbLuTiSvNGUkTK3oFtUuQ29FFVBc0ThBZdK+Ba5DR3mNtCRI+PVZ6bipOUWBEB
         Byi1PURuFL3K8d0iCCs3YpmtsUXpRTLz1mY1d0vJjargbcN2OfogLHW2KJwnrP8ss8X9
         qO9g==
X-Forwarded-Encrypted: i=1; AKwUvBw8M6dK6KbhGmpQnoXVYtaKTK51cNqguo6K6yc8lzJH1SLoJp1Zy8/UgieJT1QsuehDclExLHjptCtomok=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdFJcA2xLeHLXqpoImgA8dVYxfD+OewYxNeiWYJ0rIFiO7HBH4
	90Hz2mhQT6HOcuFUrDWqpWYUxwHRf0iUdSehl5G6qjsgZl9cfMwEv+4hnU1W6JJg7lSMvHAnfID
	e8egcF7VW/A1TkRL4vISKmj3X+xn77UuHUFxsztfrm2KJ2B03oIG2h/xtXFBbN/QaEyU=
X-Gm-Gg: AYBFou3cT4NO4a7SZqZFLSD4YRj3VG/W9nlP52lKRKItsrAsJPYTIKLfy5aTYrnXuxe
	dvkBoD1Qnnbzszt/te76xIYbpHClqs75SoCnPt613p1kDOx0Sy0FfY+AHYU0umdVz54n/VNWqSw
	fikVOirfEwZ/wNTJMDJsEF5cnkOdkIFWQfWvEA0teb+UE0RbKQ5FEj3d5S99aSXNnvCmDuAvCoS
	SkwV27IKj/oD6wR5ExVtM3GBnw8hazmyOS9M9uB/jG2sYvTxhnDwUcmaK/YDCxwbpGWTjSCYUB4
	7D2OQtWOg35G0rdZCgFfcda84LIenPQrPgKVNJMocVrFRkAyU+SxoUp3fjPOUgkRy/iOCqj/lv/
	FzZY+oGkwP8QahDSL3NXtvB98r6oaoi99Wq+G1/wq7Rkv3m9ce7hWBE/JYB8n9SFB1ypor9YbpC
	Bb7rD5GosRr50VzUAVYK9ZnA==
X-Received: by 2002:a17:90b:2887:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3adce5ee37dmr1056175a91.13.1792738946678;
        Fri, 23 Oct 2026 00:02:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2887:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3adce5ee37dmr1056152a91.13.1792738946137;
        Fri, 23 Oct 2026 00:02:26 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba8a6dcdsm399751a12.18.2026.10.23.00.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:02:25 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:31:20 +0530
Subject: [PATCH ath-next v3 17/17] wifi: ath12k: Add QCN6432 AHB support
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
Message-Id: <20261023-mpp-bringup-v3-17-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: gH_IpWLJsR5-Ae767nLUJVV8DKD9PHRD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX6iC20u9Sexw6
 Yo2E+P+W84dkGbTcIDPzZv+z5BGkzEfH2P6CUNmShKR7F+RV0z2M8haSFCszEX2W2InvXsf1AAS
 ZVarjAqmS2fDwEM4kPEBCPgkN5taVFZS6pCFU5/5Vi78p5Ju2qRZbUfjx8GTcsUYS7BE0zIisj/
 L59vX6wqSNC7PIeiEhQWWZg6gqibMLWWSUoataJVURQYZ983BuK43qmjKMHvf+B86IUukszJOIj
 G3HGAo3XI+irZbeKMgrwFRaZ+H8yHkQd2Ox/EHZFJint1hDiSgOKgPgaDy17IhhHvDJHTVsxegv
 TsP2ZTPecU676I06Enf2bopVyES+IX9gHedJr7hPPGqMQNvVkpnfOLi8RXdZh5G7x40kJyR8AdB
 rIZxU3kzauGV3k6IsEUJnwYQLyGmaBcx4ydp3zBkAZafVFnTUFyb5GwuJ8RU2ea2Y+iAlrE8msK
 okrc1bqMfdsus548YPw==
X-Proofpoint-GUID: gH_IpWLJsR5-Ae767nLUJVV8DKD9PHRD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyNyBTYWx0ZWRfX8Kj5KaZTaL9U
 mSc/2TMIvqOwfBLVao1sN5HaqydgNmAvJ36t4QObbg4tYGcgIvseiMTmbgWwgPqdQxYqjjPrylF
 +oVfHGTtZeOa6U3uXkRXCPOSRsJfs0g=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb0683 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=R6GObu012cZLLkk_EdgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230027

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

