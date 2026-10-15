Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C133C345D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043807; cv=none; b=Ss670C82Wc0MydyCGrTg4/JUhP/8lYftPU1cU3FOkDyLOvOKvPXb3yZcQHgfDN9J072jhdMz0Ak+zgO2K6JK+Nc3k0b+Kf3SQPM3FxuFB/X+8iLlfv6S9Lfg/YvPM5vDIgAPN2Yjc/+xaZXqYWOrvoiCrqvAwtqBrrIg2wuOH8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043807; c=relaxed/simple;
	bh=d5CKNaTVFgdrvAvPHsddfjYK7AzuQzPwzKoasTvuNGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZCg/506wRN+kIRiqUSVVzW0/gZJ17pxPFdseG5oiQtE9UDFa0hFlptsF8i8WHrtl3haBbu/9V0nalYcSqh/geeW/9Bi8Ej6g3/AyAfA+/xrslaTd8zjVW1T0GGh5byq2pdqMfGE3b/cEyJE24mH+74tsGusXtsDgj5dyx71h3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STrENOpI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aBQUILU1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STrENOpI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aBQUILU1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F00U9p2121588
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jrsY3XPFj8GSjsDdbzKWWy0apWlkyfSL5vlUr4cfgPs=; b=STrENOpIyz6anT/D
	LfpB4rSy58WPOnaCH9L0+RVBUh23vYcC3Z7fKsweeSvLry+7d81fl42HfEyrDhej
	jS3Xk/UlTnLOiPzWu1JjgmEduvpBR5ixOJzvEnhhKroWqV1vQ7UGenLWyvxOQ+2j
	EFoK13WQ+J6K2Wkd4bIlOf92O7se6FiISRiWfFUhVcOVhPyOk9kWU14dCMSX59l5
	S7BcF8+gIPn5EGesjVoLD6nCJjSswrGZieVJd2GfheDjkt5Uo8U+jkSTJnYHxaNy
	QXkCLmgA9m309m/XiMK2/QjsnKSxBUP5VQUo+6VNgXDAKhGuiKY44KDHExG8JNgo
	l03YHQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn130k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:56:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so13832103eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043804; x=1792648604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrsY3XPFj8GSjsDdbzKWWy0apWlkyfSL5vlUr4cfgPs=;
        b=aBQUILU1OS984UPR1cazYnLtZeD7kVmt30xUorA+LGAanPEhefldp0/34fOACw2bSV
         BGqHivgE9JJ4y9nF4mbisDKDhbqtOnFNRPZli1wBDd05bhiSrdnwUvXs10UWsgdAB00p
         +7o+13CTZ5AJFCQyfkxedBOfi3dY1sjACS6+c79ezJY11FmO/2kfBYjtxY49NTGe74Uk
         FJDYt5mEJhTEqtoXEztwFaM+DSILlTKumzCc9f8Qntj0H9KAEXLeYkCmwKIqEhPirgaM
         8XqL94MA/W9tuneZsGXGJABs9IxJ6lGtR89VNYzeanHjHTHTp8qyCvx2RS68jdeO/pii
         Ioiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043804; x=1792648604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrsY3XPFj8GSjsDdbzKWWy0apWlkyfSL5vlUr4cfgPs=;
        b=d0I6HcqvSkDJzx2vAr7/kw5vDrGPETb1UIa0jYvnpgWzd1QqnZPMt98YuB2b667v4N
         xfS9UehK+dl5/WRSMgOrWfIXdxUBA7uyBJ7IKTT0QmVPDXSFz//4u+9JPpyTQGph9ALg
         F/w6kGcLSD4zAKwqhbJgkFcd9W5/3WRqUTzGr2PxwfLxtgyWxzhLziyNxMxX2/M6lglx
         7Ddj6DtmWcpvohaynfM9C4Jx5wz03S1MJbKBb5/QO8uaXtfHVzXE5fu04umj4UUaYA22
         g3Q08SQe+xrsk058PyLAKyCQPX4uC1HaZ69jOQiK2yaIWj9SXRXJesZ2sQLCuydmsdEo
         hVuA==
X-Forwarded-Encrypted: i=1; AKwUvByZMhtKQJjhtYNJr4QZL6KbwvI98g5xvs3ltF2LjzFZM18zT3ga1oif8zMo2+3SMwB//S8sgENEvtnrlI8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKq1fVUXMuiLO93KdC9itnVPriPCXxWJCiKGILqD73sWzyNkw88
	nrbtk1UEhJ9tk11kRRP7Bgh53kIT5CC1c9lhBHtC2OuWX38HJsukOJZMaQCwB73NteqOITVy/6c
	uzY+ZvJ+ZGdNc79J2aCQjYCBAiKWp/vqticLIxg8VYysA92Kcxx7S2vksVuT3oR4DLjYa2OqQEd
	Q=
X-Gm-Gg: AYBFou2BYJxxxSO2bFCmxGKDC+8QQrHYQs0flTp+OamTFOWV96IHJzGPdCRDgxVWil0
	z+nyAmC75LQi6ayLXrYu6vMeZV+TfEM0/OLpotbKiYpzZv3AEHlJZ2sPj+up7jsE5A8fyBkPamN
	gsmYhA70PmBr0AbOdczI7ppUjVrvX36IxOerp+rqi+MBQnrzNFgGN1fX6UUdH6yKG5NBlJ8biF5
	XzHZnyAsRhjbUaYqkWjaOQ1VyU5i8ikHXEQRiDNHoV19VQaTgnl5pGlYvyTUOUTSiZJ3x+Ao/PJ
	61VbG8Gbuo9NrmBR03a6adGy5rZaO5rgKTSHKrhNtZ56mNFdtPKPSj76b7lOJO20b7jKVfuwlmo
	CgczZM9aXgSPHo+z68aOm0w/Kb6K5BV2iRusqIHNDyGiW6LigO9R6emEJ5Cqd1QkCZcJGI6lsOo
	p5+Ww1sE3e+VI=
X-Received: by 2002:a05:7301:1c18:b0:35a:22a4:132 with SMTP id 5a478bee46e88-35a22a421c0mr15630578eec.34.1792043803880;
        Wed, 14 Oct 2026 22:56:43 -0700 (PDT)
X-Received: by 2002:a05:7301:1c18:b0:35a:22a4:132 with SMTP id 5a478bee46e88-35a22a421c0mr15630543eec.34.1792043803199;
        Wed, 14 Oct 2026 22:56:43 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm64791975eec.0.2026.10.14.22.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:56:42 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:25:51 +0530
Subject: [PATCH v2 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-oob-support-glymur-v2-3-715435f52dd7@oss.qualcomm.com>
References: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
In-Reply-To: <20261015-oob-support-glymur-v2-0-715435f52dd7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792043784; l=5776;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=d5CKNaTVFgdrvAvPHsddfjYK7AzuQzPwzKoasTvuNGI=;
 b=XeHUVgEYElpnLpWlM7K0h4VVkqFzRIOYnKRDW5guHRl3Mht3oXIlFjrMjbU8RxVuZBqB9X4Rj
 +snMoThJciwDLa+HYhXqUWGd6DshSusZPSL0g7Lrws+Ne+WKfbX1M8W
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX7JtZR+gaAGvD
 7cnzx8rTzgL8pXok4WfcWMLsIPjSKdh5zwrE3djTFKra8Cg1L9bWjX6VYkLnA8LlpnjjT3TiA2c
 c/5X5cB/hNAmGgN9dFYtj0vS7GdSiUTpKFYJ3nH74a2Tc5nLdXRj2M2ybY7X/v+2atEbFS91fqq
 14L9049+lX5rHntsTbY8Sf/bWn6iQTU51L3G/+Og0MEo4vs98r8aV79FAFoL/qF37B3nYmh9E/h
 8Fsbzx+c1saBa54bTmR7aGoaWziCdoPC7sP8op47kxJDkQsEcawpLD7cLbFOMeq1NMONw41ePWi
 mArx56XzWdawnnH8B3tQT4B+beZWAIl3HZlw+2DBGl7iXg0A42RKk55pxFaLt4pP4Py3QHsW5OY
 JWqnXKnNeIZpPQLVtTfmxpG/cgDOMrt+pxYa+yqKpY0wcDVGOECkXJ+tTZp9wM4golsqJG7KpsM
 wOHMilXlhCJNAoFRpmg==
X-Proofpoint-GUID: WfDHKHX6lBhif24R7nV1Tl4hbXHYiD4S
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXyRn/khlT2WVa
 9rPAt3CKWr5bDvALC1VCxdOifxAaNRRF0WUZDb6Gs9nBXIWqpMsWSAXelOW0EWlIGKe+/fhVS8b
 Uk8gOaw/vt72JqgTHj/sgl/DhsEii4U=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad06b1c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=2xi1agtghtcIHK6HCRgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: WfDHKHX6lBhif24R7nV1Tl4hbXHYiD4S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150023

Add coredump support for PAS remoteproc instances with a secondary
processor by registering fixed dump segments for both primary and
secondary carveouts at probe time and mapping them during collection.
The attached-state path is for debug dump collection and does not
provide operational device recovery.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 102 +++++++++++++++++++++++++++++++++----
 1 file changed, 91 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 0bce2f0d5b4a..374cafd04b62 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -117,6 +117,7 @@ struct qcom_pas {
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
 
 	void __iomem *mem_region;
+	void __iomem *secondary_mem_region;
 
 	size_t mem_size;
 	size_t dtb_mem_size;
@@ -162,6 +163,28 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
 	memcpy_fromio(dest, pas->mem_region + total_offset, size);
 }
 
+static bool qcom_pas_has_secondary(const struct qcom_pas *pas)
+{
+	return pas->secondary_pas_id && pas->secondary_dtb_pas_id;
+}
+
+static int qcom_pas_register_dump_segments(struct rproc *rproc,
+					   struct qcom_pas *pas)
+{
+	int ret;
+
+	ret = rproc_coredump_add_segment(rproc, pas->mem_phys, pas->mem_size);
+	if (ret)
+		return ret;
+
+	ret = rproc_coredump_add_segment(rproc, pas->secondary_mem_phys,
+					 pas->secondary_mem_size);
+	if (ret)
+		rproc_coredump_cleanup(rproc);
+
+	return ret;
+}
+
 static void qcom_pas_minidump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -577,16 +600,38 @@ static int qcom_pas_stop(struct rproc *rproc)
 static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int offset;
+	phys_addr_t base;
+	void __iomem *region;
+
+	if (da >= pas->mem_reloc && len <= pas->mem_size &&
+	    da - pas->mem_reloc <= pas->mem_size - len) {
+		base = pas->mem_reloc;
+		region = pas->mem_region;
+	} else if (da >= pas->mem_phys && len <= pas->mem_size &&
+		   da - pas->mem_phys <= pas->mem_size - len) {
+		base = pas->mem_phys;
+		region = pas->mem_region;
+	} else if (da >= pas->secondary_mem_reloc &&
+		   len <= pas->secondary_mem_size &&
+		   da - pas->secondary_mem_reloc <= pas->secondary_mem_size - len) {
+		base = pas->secondary_mem_reloc;
+		region = pas->secondary_mem_region;
+	} else if (da >= pas->secondary_mem_phys &&
+		   len <= pas->secondary_mem_size &&
+		   da - pas->secondary_mem_phys <= pas->secondary_mem_size - len) {
+		base = pas->secondary_mem_phys;
+		region = pas->secondary_mem_region;
+	} else {
+		return NULL;
+	}
 
-	offset = da - pas->mem_reloc;
-	if (offset < 0 || offset + len > pas->mem_size)
+	if (!region)
 		return NULL;
 
 	if (is_iomem)
 		*is_iomem = true;
 
-	return (__force void *)pas->mem_region + offset;
+	return (__force void *)region + (da - base);
 }
 
 static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
@@ -598,10 +643,21 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 	size_t table_sz;
 	int ret;
 
-	ret = qcom_register_dump_segments(rproc, fw);
-	if (ret) {
-		dev_err(pas->dev, "Error in registering dump segments\n");
-		return ret;
+	if (qcom_pas_has_secondary(pas)) {
+		if (list_empty(&rproc->dump_segments)) {
+			ret = qcom_pas_register_dump_segments(rproc, pas);
+			if (ret) {
+				dev_err(pas->dev,
+					"failed to register dump segments: %d\n", ret);
+				return ret;
+			}
+		}
+	} else {
+		ret = qcom_register_dump_segments(rproc, fw);
+		if (ret) {
+			dev_err(pas->dev, "Error in registering dump segments\n");
+			return ret;
+		}
 	}
 
 	if (!rproc->has_iommu)
@@ -716,13 +772,21 @@ static void qcom_pas_coredump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
 
-	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
+	if (!pas->mem_region)
+		pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
 	if (!pas->mem_region)
 		return;
 
+	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
+		pas->secondary_mem_region =
+			qcom_pas_ctx_map(pas->secondary_pas_ctx);
+		if (!pas->secondary_mem_region) {
+			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
+			return;
+		}
+	}
+
 	rproc_coredump(rproc);
-	iounmap(pas->mem_region);
-	pas->mem_region = NULL;
 }
 
 static const struct rproc_ops qcom_pas_ops = {
@@ -1133,6 +1197,12 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	if (desc->early_boot)
 		pas->rproc->state = RPROC_DETACHED;
 
+	if (qcom_pas_has_secondary(pas)) {
+		ret = qcom_pas_register_dump_segments(rproc, pas);
+		if (ret)
+			goto remove_ssr_sysmon;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;
@@ -1144,6 +1214,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	return 0;
 
 remove_ssr_sysmon:
+	rproc_coredump_cleanup(rproc);
 	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
 	qcom_remove_sysmon_subdev(pas->sysmon);
 deinit_remove_pdm_smd_glink:
@@ -1169,6 +1240,15 @@ static void qcom_pas_remove(struct platform_device *pdev)
 		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
 
 	rproc_del(pas->rproc);
+	rproc_coredump_cleanup(pas->rproc);
+	if (pas->secondary_mem_region) {
+		iounmap(pas->secondary_mem_region);
+		pas->secondary_mem_region = NULL;
+	}
+	if (pas->mem_region) {
+		iounmap(pas->mem_region);
+		pas->mem_region = NULL;
+	}
 
 	qcom_q6v5_deinit(&pas->q6v5);
 	qcom_pas_unassign_memory_region(pas);

-- 
2.34.1

