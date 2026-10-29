Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793309033;
	b=HpRNbI6J02kEsaPGXdfApuaGofWA8eT1YrnPX8vPZUz1Tm4gdxi/4jqxMTUEyvrFsdno
	 8k/ApAin0LDI0nRG0+CEeORlXlB0vrw0vCq0cWRmYtW0lxWr05rVvZmdpbFXue+Herho5
	 +2fjizZOU8Mua9y67aU0bD0BFoQbvOa9jnHx4ewpupEDAjszUgTIFtLRHY6U+8xhNt+3f
	 bjVRcRFrhXngB3Y5+FPhozv6mOD/cwWX8p8iJOQbxWizMz8aY9rIuWljiMnEombpY5w66
	 LLRRR4pcL97kUzp7jr0aOCaktsA/miv2HW2hf9R6CVCFFeX4PUMCBYstEn01lriS1nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TzzXFuNiq+DOToFpekJQ4MBDEjsWCEdNN/aJK57pRJ4=;
	b=hqjH5gxgcWMKCVXCbLhN5JEK79FtFLJmX6y1+RlFgYYVVD/1ZCLZ9fdOH7cIj0OzNpBK
	 pvgjG2kLqH7StXsgFVQ0V+DPXa/3vKZ1UkFaI2ILfsv/Ql6BhXwvvuiGJ3C7A5wG/FIrf
	 /39hlXimmCpjLtHjQZLed2inm1N8WHhS1h/zjqr1ZvdPMAb1CmoeP2F4088KB+WHadskW
	 P6yfhVN8R0wCH14cX6ILbVQ3pQpitQLI/yCafpR3fm/pKyUkJ//p0CBmUycNfI4jyWFEn
	 8KyKhTA392hKYxnN6xxJPe4Ns8QzBo0643MtW1lbG2Ivd6rmGU5c0tYfunS2GQl7dtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJCZg4Pz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ALOwedWJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA33606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEA33606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TJCZg4Pz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ALOwedWJ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TJk2bN062485
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TzzXFuNiq+D
	OToFpekJQ4MBDEjsWCEdNN/aJK57pRJ4=; b=TJCZg4Pzwyuj+Fp2/ydS72faFti
	vP3k7bkoejYpzXKZpeGpYDqEV4YMyXzaaKVT86aBPvF35VGulkxcpcMEB5UwKxEg
	v87XtV9m78Vj2ruauEckOTuF4xWrSax0/sG43AyBEhSH6hdlW5xatfGpSnL15t4k
	51m7V5nt9RqDjGSRsoqXZLsFcXDSDgMOPN2JJHtUYK2mY2oy7WqWvjTbckkBcMaK
	sBdhNG7YJkszATsByXuaYbQdH67t1yrhnsyllTN/Rz+6X5TRUql/hUWHnNiNNDeT
	wyks8KMLfBOl8FsI+xy6A/+KVKmPpT2EwZ2XjraoQda5vDmT5469CjodvAA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hmby38hvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:23:50 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd652c0385bso7927a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793309030; x=1793913830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzzXFuNiq+DOToFpekJQ4MBDEjsWCEdNN/aJK57pRJ4=;
        b=ALOwedWJ49/CaS9GccvgiYciIBz5VUB+E7Hn3qn+0moKNghZYkRsa53hrJNAKNEUOa
         awGCPJibipV028iSVi8w4QGqRh2khM/TUVZjJQFZ4wVx1cXYt9VecdF0yACxIcqnd5ak
         9Ev2/ZVkfqETzc3qOhbKTioFbT5taEwREjDHXKVnb5mKTulQZSn16Z47JVtZS9ZObuPK
         oTR14mIyKRhCvOPp1iFzRFnCZts2Ml5YpuMl49ty9AcRMIyruqqK3YdjA3NoKGRXU87n
         oYFRzN7nkO0EEcY7gX2HZQvZ7LfrDwDV1b6Ypi998e8WW2Y24SL/yv9VNaU6LtbRfnUQ
         LBVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309030; x=1793913830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TzzXFuNiq+DOToFpekJQ4MBDEjsWCEdNN/aJK57pRJ4=;
        b=sxun6HDSVphuCRifF9gmP8HSliSmpqW7KzBi4t2Bs11oniozQNI11SoAjCO67nlEMY
         X/Ttln/n2AYlFJMuv0KSIFaK9yj9CSDGnaF9zAlgDEpcNgijwWbmd267PaPdRS0pSxgX
         SeLLr7uemxR4UgT7UyHfKY3E4SoVj4FzbUWxTD9cp9xke+Kr5e1UFVtLsC9803djF1XM
         LLPGeHVgzIuM4/822EahCUag7L0/zjDbiynw2l+4u3ttVTCJKCAmvG64kOT0hCIRxsC8
         ujv4w233cwZI4iDqDTL9T9xH2e57p+fm2cGpJTskfeuH6m8VcWvxK2v+aKqBybvu9eze
         D5vQ==
X-Forwarded-Encrypted: i=1; AKwUvByFn3seUQtEi8EMJ9nm7x/iYUp9xbHosMA8dZf+845LgECSJlay95i+/IS5zuW9N1tt5bzdzN49w/0spXw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2pdYdYu6VxJq4ufun/fis4i6BcuZE8ucWGYZdKF+JmefvFcBV
	fVeQoKUmjAeEzgoL5FC8DAYn+x+oMYlfZRmVe7ZGEnrtgNI6kZWzELWvnSsNsSpSmr+dwu+7AIo
	ndO3zkf/tt5X4dmoqZbds9Yp/7QCaZrDNZ1ABZ8THqsVGQTm92QXmZlmdTlzCF0KzZYA=
X-Gm-Gg: AYBFou3xZrbQh9lz6CWSSpQWfyxmnpJ4JMVWOq6tHNKOgXHhY6c47t9sB7KcEdl2uX7
	xebjgbLp6OXPT+NaBwsley+0SnuVjJJMJIzH6va7OcDhet52ft6rJfIM9CtLNIkbp8p276ZEwNI
	0zY3YW5r83f21ThT52oFASPLh5DQerivzq1p7v5C1pnH5BIq7thaM4YCBpQvRf9DQ3MaCzVgx5O
	zKuTB1iwmjKEfgvc3vOulMchKrFpfeJ1qH39AT6Ceo1n6yULF+OCCPoX4nlbRgqWoIIz0xxJW08
	uyAknTgKcV0kbYL1QSD8ENuBWtnCVHmZDOlTEjBMhbQzyQkfQVecHsbhwUhrJApUNC33jxbrKOq
	DV7+aGWtwalxyhMBzGF302XWAoCpERinpRhjI8NJNUyQ4t386rSWqW/E8brzJUGwIyQ3GyGUucY
	Z6p8t+vz5clQiaZWURGgk3cQ==
X-Received: by 2002:a17:90b:57cb:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3ae89744ca2mr193135a91.25.1793309029955;
        Thu, 29 Oct 2026 14:23:49 -0700 (PDT)
X-Received: by 2002:a17:90b:57cb:b0:3a8:c0cd:57f9 with SMTP id 98e67ed59e1d1-3ae89744ca2mr193115a91.25.1793309029488;
        Thu, 29 Oct 2026 14:23:49 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845aa27esm1054544a91.11.2026.10.29.14.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:23:49 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: iommu@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] iommu/qcom: Use identity domain for GPU and display
Date: Thu, 29 Oct 2026 14:23:42 -0700
Message-ID: <20261029212344.346069-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
References: <20261029212344.346069-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX2wstkNTPMYAs
 9V1b2b82badhpE1pY+Hzi4lbWSJE8nxPPugY7vtiYdG9NVnQQpyjQrzP6ZVefwKve67RJ4lHjoa
 Rf95XgoAoORfZBRd1noS7jIPPVan2CY=
X-Authority-Analysis: v=2.4 cv=ZvN4uN7G c=1 sm=1 tr=0 ts=6ae3b966 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=554yuftmPdPD4gaTNL8A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA4NCBTYWx0ZWRfX19QwwQ2e+DqF
 sAuYTRVWIBCHoskIDpYUUKnX6FLzR8CBofr4H62byPH7zsbg8GHHM2MBPM6D+1fIN/O2q82qtWF
 bOCX8f3mQjdenHYUI1Xubf+Af9umVGVxzZ+Op7N19Hbz0/8osDp5LfYTPyh9/ovGwH4Xwg/X4Cw
 d7R0pRABMK1+ODFd8mrTLXqpKrLwxuBxeFEJ5mQPl5heMhAfCNe8dRoYzxCCHjysnJ6r+KuGB4j
 RcHX0ntqj3o5M+/KK89ghWa3eFfW0LAGRaX5wUPMXLLuINDlzOFPwtSEuQL/YRcMqjz2wtBmkw1
 4it+1gQM0QWnyUEckxpzTimYZPknrsEL2E0kVHgg2kSTYC8AE4swLVm+SlmvJTxOLTjY4/FrM/W
 F6PnHuwkQoxC0+lFVLx+FZZm1w8qWFDrdpzgEGNRYtVC+Utn1fzV4v7VEE7v3M181WtwKHT3Alh
 SR4sT0un5WY7ZSSWajw==
X-Proofpoint-ORIG-GUID: pdsssoJQhUddOn0B1khvWbdVKawwaD3W
X-Proofpoint-GUID: pdsssoJQhUddOn0B1khvWbdVKawwaD3W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290084

Similar to commit 0e764a01015d ("iommu/arm-smmu: Allow client devices to
select direct mapping") for arm-smmu-qcom, match GPU and display compat
strings to pick identity domain time.

The drm/msm driver attaches it's own domain, which it manages directly,
so we don't want an iommu managed domain interfering.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 21d18ce67b98..5b10feb419d8 100644
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
@@ -589,6 +590,22 @@ static int qcom_iommu_of_xlate(struct device *dev,
 	return iommu_fwspec_add_ids(dev, &asid, 1);
 }
 
+static const struct of_device_id qcom_iommu_client_of_match[] = {
+	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,mdp4" },
+	{ .compatible = "qcom,mdp5" },
+	{ .compatible = "qcom,mdss" },
+	{ }
+};
+
+static int qcom_iommu_def_domain_type(struct device *dev)
+{
+	const struct of_device_id *match =
+		of_match_device(qcom_iommu_client_of_match, dev);
+
+	return match ? IOMMU_DOMAIN_IDENTITY : 0;
+}
+
 static const struct iommu_ops qcom_iommu_ops = {
 	.identity_domain = &qcom_iommu_identity_domain,
 	.capable	= qcom_iommu_capable,
@@ -596,6 +613,7 @@ static const struct iommu_ops qcom_iommu_ops = {
 	.probe_device	= qcom_iommu_probe_device,
 	.device_group	= generic_device_group,
 	.of_xlate	= qcom_iommu_of_xlate,
+	.def_domain_type = qcom_iommu_def_domain_type,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
 		.attach_dev	= qcom_iommu_attach_dev,
 		.map_pages	= qcom_iommu_map,
-- 
2.56.0

