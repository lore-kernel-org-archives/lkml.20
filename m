Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397925;
	b=NVCFbGtqy+aOwfODJ6Sycb176JrEwlM2h1SXB8TXQ/4bbGQMY3AdqKHq1Oqa9fMGmqIc
	 p/U5Xse03J8eJyRwsCJPnVQCbWI4kaXpHFEuEsbChHtoplW3rOERc0jnjLHm6JQ7kcxXv
	 TwDzcU50zKl/cwX4U7um7tW/t9TCKcXZmdLe+1zxAL+1JPv2af9692CByRIwIAuhjfjL7
	 JTRHjfimGqTuAQKGlB04CwoqepgM3gS5thb2G0+CVyAwMZRO3xlOjBOCoLKnllljKX76I
	 a9hzK7efKoY61wE4qJo80vgAhMeXc0kfvB9tQd5CkeQcXOgZ5q3HthEfWEJivvcQOpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=An7OiTnlc5rBNDs1sp5uq2115ZCBsqObQUTQud4yMUo=;
	b=A4gNpvo4mXWjibyLCjFM5ncaiRQMpGPLKBF1hzq4Kv1bhSx8d3ygK1FugUUpLpi48d6O
	 Mc0KGPyASZ9qZG4XLXC/bM3JaWWDMAmnn3hyFF5V4/0zo4pWOXQwnLUFfk8hgJ3lHLp+J
	 BznmRqO7rWTcxtuEh+pkAgp9V8nrenhUbH/zOehkEY70eO3cuqlktkB0ZTwgLV9b/hZh6
	 dDlnv7I/KZOg6a03HgpyratSvbL2Bf/AzwQ+xKITbwWn+b/Dq7XGj2deD1yTVj3zgT9f5
	 SiAZz0ms72SUStu8Ewl4oALU8QUV34vmqp2S+ciaC8X4g1poXpauez552kdSMqECycQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R57Jl92B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGe0w1Cu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27A560A260B
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:05:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C27A560A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R57Jl92B;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NGe0w1Cu
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtSD9925266
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	An7OiTnlc5rBNDs1sp5uq2115ZCBsqObQUTQud4yMUo=; b=R57Jl92B9rMbKq05
	z/298LSgaT9g4VoRCVs+DSDF6R7HUvAC62cd6WVRoVHbesIhBQQjBjA4F6DPY2xv
	MhYThqYSbgCS17mnuQXT+XokUrE4QL1/09vMDuL4ktLDfdawMlflCgkyHA/ywi8u
	nAql5LEF7E7AWoZPNlNadov1mQ+LtYBnrNIahKYg9f4/pwVe/SX0UCv/70uCQ4Xk
	YE3a3Ic/gOxd4eZU5qb3e7lMOBoBj3bdnakl/iC1cuqZN8ZsS2NN69MUPYqTL8ZU
	gbdZ5CLpXR0VZeGLMLyeNqaONFXKiTFeD7qKTnvTSTfJfPb31PJTRqF5Zd1CW5eD
	GMv1Qg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x087r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:05:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f559420f3so111175185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793397923; x=1794002723; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=An7OiTnlc5rBNDs1sp5uq2115ZCBsqObQUTQud4yMUo=;
        b=NGe0w1Cu0nHy01CHfg0o1SVcTxd+cEkSFMAm1HWqUJ48tQKWGJwA6qP1Lrdb7a0qPE
         vcq6sJQNAzGrr1pAP10/7s1ShGgZZszoiAtwIA5ls/bqCIapE1TtiwWH/tvNrG54p3r5
         3dKESOyaToSlbuqPccJBacjvFu+Gz0Ae4JITNyMcdKO05hjLHoq2xTTbinpbqsgxu78S
         LHQmayTL9g2KbzxztxDra2dzz4SDuWsX4Em5+U8K9eT0eFhJyAZjvmDOAcrMUj40rnov
         0wuZEXbrn2VVN6u69+Odv4HOXHzYNj9ZTxCoUZvkLRxbCI4e2JsdpnOEIpU9QhzDvBHy
         ym3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793397923; x=1794002723;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=An7OiTnlc5rBNDs1sp5uq2115ZCBsqObQUTQud4yMUo=;
        b=09D4NeGHQYGbIH1FBach2Po3vENspdRO62r5RlSZl+GPBhYg7swZL/H2v8x/UqX5Mn
         dhWZhvCvTuZEKrJBEPqln/OSpACu+HqKxTgSGazTw3838xIJN4peM6hayXiN+pqxjkON
         gURL0w7sRIxm/PHULWT7WwFnBw0AQvhOGNrObjx915SRZ1NtY75r/YmQD9LGeUqhe4lm
         wxI2+SIbiebPmwuYbPK3HFmPipiROwWdOzTYlcaYqkcCilKYCyErgtZkjmDFIZb0qeT0
         BZDRGbQz/glSI0Znuzj+jHrjG/S4T1sBeEmQHytJuy8eon9ETluUmRKhLZL3SkQUUv+G
         Ee8w==
X-Forwarded-Encrypted: i=1; AKwUvBxftTX2qfpxGZSAtOC6i/ql6+NSgi7w5fyclWJgacE5ZUB/sfgCtXFk83aLvlATGM1NIlvuqwKHAmbea9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZeBx/9xy/XahGDWoU5l+eQ1ZV4k8S11qD2+InWUfbcDxQPYky
	9DVhO6n795ASfycVZT6eB3CMAMRekxffGBr/6wE+ShgiSf5qP77IxlB8CyEABHebsCvOfGy2STA
	zPMK+MVRIjR+wJL9qUmVCYR+eSJWtnxFswl410Gy9TJdBQvIGlfGOFI2zFd+tds9oyL8=
X-Gm-Gg: AYBFou2TrEvH6hLFOqjU8Yw/0gQwEGYwgX3KZpKlTKs2Fk5NyphMiUaDLMIr2y0Coi7
	A8/IomSIvux2jXQh0wXohb6m92N2VDdo3EwvZJ1jzA1fIKaVTZtIk5zSzAZkzqvZr9F3ItHAwWc
	EwY/2W4LRRTgwqV7m1juOiimrsPPgWBtY/5Tp3Qb/f8LSTNem0vB3OJYPv/BuPrwetoF3hDYViZ
	voJFBdPHFcz2fxvx4V2kxPunl36PTBZGIB7JylySaBIZiafMa2ZvlELCTjFtll2s8z968oIdv00
	l7HPAteQYcY5PSqfnUoMFvEsSZ5h/JKVAQuxPYdseULho0Fui7WA7iWz0Z/GQIiXxZYPUFXZ1PV
	MaMN1cCh/7vwDDkVJz//P5KI76fisgHyjza/piteFOyDZaA+6e9uKDz/QvUjnJLLk9nAiRL4aGx
	xACOPABSsJBlNClDwPtofJ6ZkVWq+eZDFnnOUwc0Kx2xxZ+aNVRzfmwxJ2SieW6g==
X-Received: by 2002:a05:620a:170a:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-94421541cddmr602237085a.12.1793397923027;
        Fri, 30 Oct 2026 15:05:23 -0700 (PDT)
X-Received: by 2002:a05:620a:170a:b0:93c:62c4:e2e2 with SMTP id af79cd13be357-94421541cddmr602233685a.12.1793397922535;
        Fri, 30 Oct 2026 15:05:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd7dsm243930e87.6.2026.10.30.15.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:05:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 00:04:58 +0200
Subject: [PATCH 2/3] iommu/qcom: Use identity default domains for the MSM
 GPU and display
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
Message-Id: <20261031-msm-smmu-identity-v1-2-a2a70580eebd@oss.qualcomm.com>
References: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
In-Reply-To: <20261031-msm-smmu-identity-v1-0-a2a70580eebd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2040;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=hIUS4OCCIduN5c9WA/I6hlxnzxJqYrD6RjEBkMJ6o8s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq5RSYzsCzXM1EEMZVjFupenR1Egu10IvqTfPn3
 5AyWZ2VVEqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCauUUmAAKCRCLPIo+Aiko
 1RapCACKPnyD1GJeL8YSN6rJSnnQyuOTq1+5XOsKmmvnSGcAS/w/BfGCNi6I7J0TFUvkzTOFkJw
 Ss8qVwVjoHb+cBnAlRT+18w3DWvrfUEA9kZkdZjYbXfwFREvR0iN1kLqj5OOlQUCNQmtp95Wcf8
 nLwfJz/gg4KEDKueKS9zV/aL5weYMgDq3mYZf9iu+n9hOWVBpBpR9AhPV4uUXhWYWOERaAuT1qV
 SkBFbC4AJJ2pWCZdMVVXgHlFRkItKZ66MTePBiU7foVnOnoCdfwKlVOfkZMNBLS4cYRlVK2q76v
 Qd2ff3PfoZTdZEIK4BXm5Xkb3zQld3i/b2hspp4U2STey+xc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: R6hv7rfPB3Fvz66_LHtP1fuDLX9XWcL_
X-Authority-Analysis: v=2.4 cv=Z6N5j3RA c=1 sm=1 tr=0 ts=6ae514a3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=9k9QU7PkdAG4pGQKEAsA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfX7JhVYXwunaEp
 iO9347k//k3Jkvoei9KEQTfm198AhRJzOo3RTWJ8jPkU2w8S5Qq5rR+gRsboS6AkrW15f/i7yOj
 jvTLIY5E8maO7IQSGn6QdNeS9T1qfDN/ihMS0MTtZwYfGYxK3QaGr49Z8HC34R8yehfnhUGpGNy
 Qz/wwZquqv23GXX2+n7QCryX0F30urxb23SYOS5v9FhTmJySUQ5sx5Uk6NuFOeIzJqAwRkVCjnP
 1X9ykamb+grQ1x4ic28c6iX8JjeJOoDJ8Razl+kguivfNs7thafLyswKPaoDUY/CXzq6lift7Z9
 LUfAwM4d9QoLXGb2U29ZfHAMnvVYDu7mEcI9uY7c6GPtbI7RF4IngUwNH0tsZYtEnY6vQdPEFhT
 1xvWFgbzG9N5f5TcxnJRnJcrXbNNLQ82T8ETSmJfSkloEY39wnECC9Netj0tXmIESKlkGarfgxL
 VP3rU35557R0xqfmySA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4OCBTYWx0ZWRfX6bdP844QDAIH
 AtBPwlyYdk4Az/6335G5lNTS6v/YbRHZJUs9mE+1h1e8LzsketOuuzwg2a4TwSnGtBJeQpU1uQf
 p0TGRJi+T6dynJdEiiP2M477Etxmz+U=
X-Proofpoint-ORIG-GUID: R6hv7rfPB3Fvz66_LHtP1fuDLX9XWcL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300088

drm/msm writes the addresses dma_map_sgtable() returns for the DRM
device into its own page tables, so they have to be physical addresses,
i.e. the device must not use iommu-dma. qcom_iommu has no
def_domain_type, so the MDP5 and Adreno devices do get iommu-dma, the
buffers end up mapped at IOVAs of the unused default domain and the
db410c GPU fails to start.

Use identity default domains for these devices, as arm-smmu-qcom does.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 54130c32056a..4a9c4cf63724 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -22,6 +22,7 @@
 #include <linux/init.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
@@ -531,6 +532,18 @@ static bool qcom_iommu_capable(struct device *dev, enum iommu_cap cap)
 	}
 }
 
+static const struct of_device_id qcom_iommu_client_of_match[] = {
+	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,mdp5" },
+	{ }
+};
+
+static int qcom_iommu_def_domain_type(struct device *dev)
+{
+	return of_match_device(qcom_iommu_client_of_match, dev) ?
+		IOMMU_DOMAIN_IDENTITY : 0;
+}
+
 static struct iommu_device *qcom_iommu_probe_device(struct device *dev)
 {
 	struct qcom_iommu_dev *qcom_iommu = dev_iommu_priv_get(dev);
@@ -602,6 +615,7 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.capable	= qcom_iommu_capable,
 	.domain_alloc_paging = qcom_iommu_domain_alloc_paging,
 	.probe_device	= qcom_iommu_probe_device,
+	.def_domain_type = qcom_iommu_def_domain_type,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
 	.default_domain_ops = &(const struct iommu_domain_ops) {

-- 
2.47.3

