Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6918749B45F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791455101; cv=none; b=cdWRlmG9kYuXBJfShnmgLgdIt9sC5O0Cgt2cMRcn+tRDUqiJMZ9JoLEmOZ+n5osUjlUqmCnCcee7S7vnZVksuWBYnOXAN8Ff2TS6eVvBHpUJJ5C3p5J1SlWSH0DRBcDCrjpm7WBU5YmaA6wIkaesMzT+hQTEVx/gNNnQTZpklQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791455101; c=relaxed/simple;
	bh=0QRbdJf2wr23jgxU8aOFYqXhwWKN+nfRv5rDGTDGjwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q90W2ck6CwIVt7Ef+HIXr+fEqaO+A/SXsC0MlkjC9FXReEq2bHTX4Ip+ctYnJfDfOJBXtG3lx81LDyfNxXb3rmW79PURVsNpu9S+g28GtIGGXIIASmOvBLgqnb1+BBdu+kwIjmAYqCC4j2OVwA8yprasmtueUWW+YK328L0TZ2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMjrj6v8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EXHO9Fjj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMjrj6v8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EXHO9Fjj"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6987KZiT730823
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 10:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=; b=UMjrj6v8hNX7CWat
	WiTLVS5mNV8efyUwlvmvzdcz/YL1iP9+pSaAwsfXotPoh9V7eJRffcYBT7tzC4F7
	8lK4nXymRYzSl1UjhtQDpnVXhr4z5Na9J0yKUcJlpuflu6GecNvN0Pp8Pp+WCLmR
	OmFq4wOosynl9yJbO/PpqugU20Cdi15KGT7a7vknQlhEHIb2cDgPviQf7fsn7ie5
	M8w0OaapkK8Nt+4kDSa6r6VZ27ZRfix1EV/rn6b9dfo1PAfLgCF77ZfQxykbyMAl
	mrpgB97y916qSDxCsfFf5JOW46xAm100Z0nOpZod019ereT/VnIIxXHHm/s7GGmd
	sjTvZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32cv7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 10:24:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dfb24dfedfso46827215ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791455098; x=1792059898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
        b=EXHO9FjjVy6/DJ3HbsXNNNgin+Ghxksrg3XO5brVaOMLqBJBck9NQYKtXdg2E0DRRP
         /Oycd1JtVr9ZD+4+DfID9sxNA5O2iCl+DxrnnoJWh27o883tVZiB8npbOYHG5hyuRA40
         QILYbjVJ/zenr5Y/A+3ZPiXOiXrPS1WJQIngTNMNwiZCNEDPkSnhpoiqsKGxEBbJOhAl
         Q1T0S03SWcTOpme5G/1hh0d97qU/Xsq9nrq3NDn6DtL4evYi02iOMy80uX7ynKijPCe1
         NUuxFzcN0pFA4fylVUTp2j9vLYY5nG8vQdqsf2351ub5aEC9jHLsaugpphnjNn1/TP63
         MGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791455098; x=1792059898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QPZlqB6JbLBBQy1E+Vaf4lakspSDZfLvql5vmZjMlk=;
        b=P8Q7qdMcBqLPNtdNUun4J7IomE5N9plfQsX+NAuKVmjkg9HTNKHQdekpncgBL64nFy
         F++p0gubgXRBapPZeudK3vPXAdnIEtI9WkjTBC18tkDpaPVRSEYIhXjnZvuDYqI5jrLe
         fK1Xb86BZk4CePsOmkex5MneQRkd53JmK6jNLB1Je+8fvpmrvzA8dhDF0M5rtmtyotI1
         WlZI0yahrd1YHIftlSxhfKltrwwwE/AbWSoD2vhynqaBktuUoEkWUaHXuKTTZsqQp21z
         c1XwpKXeHjmbWmn4G36fqhU6cLJa/bUDqCmkyRwaiEy4aTrWVycXGbW7bqqafFkxPyYv
         686w==
X-Forwarded-Encrypted: i=1; AKwUvBwbAV28AcK3BgX53smrcEQJyDRJIAB8ZJ9SHGvNhgvIEDsl0RokwNbHeq7vgmDCuljKUQcDysuNdxN7m/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNpBOwSHWSKEVfwkQjd5nMaKMolnQqor7sYabJPInmRVAtMT3A
	7DTkIqja1vZZsAp9Lefr1TGvMsf0GOk2bcEbVqLmJfB2UmBm5nxy5YJF+IUpTBYOASEU/30Xn+O
	qg2FAppWfeoZgRwWZi8UCltBmhE+BtYlhsraMscK0KabJ0tGZG3kh67ot5F6+kuR0tR0=
X-Gm-Gg: AYBFou0cUOyVYp1rmaeD1b93B2lNKXtM9RjTmWx5GDwTRx/0UFHBAWrRYRBnJBnEoNa
	tfmgojx35txLQxk4badNj+ux6XGQnczPh4+G08dcksryKHczOK5v7IE+W1PlsJ/LHXDVKPJkb5q
	S+nxKVQw/1p2qjOw+7t4sj2+iow0GbKa5d2FGORiyGbQhInJ10dC3Pkjp0ntlhWs3JirDD4a6fb
	hd5x9Sww195c/o0pwQDqZEinbbT1DwxQrF4OtT5qYesGIoTRmZEIJNbqqWavhIdUwY8GxTRuEYZ
	W2CH0aoxUWq8akzX5HOUK+9u/u/me388dw9G/FkMJS5dxw6IrdU6mIMWHDPBGDeC8gcOhqh4O5r
	9jQkSlK1bldzVTh+91/m8nn0qx/LKGnO6GlWOHxMr0spuxo8QnddmZnk4pG086erYCHtBD9Vf+q
	bC5/YgOfcN0Y+WS2tB3DisWg==
X-Received: by 2002:a17:903:acc:b0:2e4:beef:9039 with SMTP id d9443c01a7336-2e5ffabe9femr40299665ad.1.1791455097897;
        Thu, 08 Oct 2026 03:24:57 -0700 (PDT)
X-Received: by 2002:a17:903:acc:b0:2e4:beef:9039 with SMTP id d9443c01a7336-2e5ffabe9femr40299505ad.1.1791455097428;
        Thu, 08 Oct 2026 03:24:57 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e6046fe39csm22081655ad.16.2026.10.08.03.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 03:24:56 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 15:54:06 +0530
Subject: [PATCH ath-next 10/17] wifi: ath12k: move MSI config to pci.c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpp_bringup-v1-10-2c5797b5e4ac@oss.qualcomm.com>
References: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
In-Reply-To: <20261008-mpp_bringup-v1-0-2c5797b5e4ac@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX/sOJUi/TOV0L
 CHhyKexAHYcvIvFO11pkDjoqXL+K7IzJP7tKCpBeWg/MHvmL4MOxcM14UnUs6SReRtZ5SZXZAtC
 I+kUbSr71wQsgplhLcA0t/fNyx9zXV+PdD6FoPvPvw6UXGmehzy1Xpd3kPGTkuj2GPJ0kZz2Ha6
 TxHg0C6KU1vQF6XlOaX3tkEFCFq1ktAMhz0iP8+UCIeKGUyg8N48hKAz23G2TH3022Z6BQURI+Z
 nB6gXbcuSUicg4Wo+OXxS1409/hILdkQoJhh2RqWNyRzWnQEBjqV9B1LdQspOv4spFrLAp7brju
 luzMePes9Mx1Qvh/cXX8Gx67CwH1hRBl6h32TXEMY4f/QjDW2j984Lo0r+CfcQ62nu1tlSFpPU+
 aX3K7z6APTN/jKhBI4QXoNUDyJBysDTNrMmP1rBdTQPYAeCBON7JRuIQLfz61nhuEgXw1q+ktkf
 lIozgOhiKkAe28UEsaw==
X-Proofpoint-ORIG-GUID: q7tYGJ1hKIg26Todh7KkJwuohVOCGCSu
X-Proofpoint-GUID: q7tYGJ1hKIg26Todh7KkJwuohVOCGCSu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0MSBTYWx0ZWRfX+JmIm+ZBQe4y
 DkDyFW4RuGd5rPYoyo6YjBVgKYGcHTloks2I5FTOS4ryrBjRp1DukKUP92OOPvgo2c5yqXAcl2T
 WN4JMAyQJ0SyWY0/CnTcRWoeZo2Xf5Y=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac76f7a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qUmDSaCxm7SoV8805q0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080041

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

