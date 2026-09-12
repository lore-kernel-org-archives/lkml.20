Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7B931F9B4
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789225170; cv=none; b=iPZyjYWMLFfo71q+lQEFvWxwipNhwRqCfr1f60J9A50AtPv4bRQqIU8t/3cM+3we5jh4oFfKjBPmKhmhZhKeSbegnxS31XtedkL6ekAl6fV61HPdIiMHJw0qWotdQqJSoFAyYQtKaNCa4UnBr0FWfnIUuz0XKvAV4r3ZhOPJyTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789225170; c=relaxed/simple;
	bh=tvVXDuXlzGcCF4tgr6Bl7jyYmuKhrlgigotSutrml0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZIA0+P+ToXjVk2iGLzrW89L1v8pFMlFIwImvy5cib1Sm1hRt0Jv22CAAoXwb1iMPKPNdEHwPQWGNq1txm9yekkCmfCXVi1LxwQldeVC8u2ztmZRbk9f36EV6oNP4fsHY2V6KLhVfFSBEyh+4rEZFdnOYKS6dcZZ2QPTM3emw0GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YILSQAJj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oq8JdsJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YILSQAJj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oq8JdsJ8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdij93250011
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qdbegSn+POyj07QfBSr0FKovBmkNgYaXeVZ
	djxMNseQ=; b=YILSQAJjhaRhnkh9oigecfm4D30TXO1xLJUmGjV5EM+L1dn38Ye
	hGmsvHcD1E6UIpWUoG0LydleLJp2ZD+DWX1VmQREv/VHGOINu6CdPgtnlQP46Uhh
	140UeWYI6C4rsaLnDTmNkiI/YLLTlr6nYVkAWpy5im4cFeKu75kFE26Nr0u12DUm
	8vWRmbcZiI0NSMiNmUjrstPb8iHZcgg2WC+owQRmv53UzlmdW7VGLRU17h6iAlzA
	eyrODTs9o6wb8BCYq2fKmuDvg9nzbv1KLpCRKVzOyRiUWliAkSXf2Aq4bBMBrGgc
	rBlYiN3eB2BI4NIjqFuONSuHy2MUzXCsDEQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c16dh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 14:59:26 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396b9ef3070so3337760a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 07:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789225166; x=1789829966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qdbegSn+POyj07QfBSr0FKovBmkNgYaXeVZdjxMNseQ=;
        b=Oq8JdsJ8TlQBK9MJ35u+WoyCheKZbr1t2bsCcRD7XpEiAMbcMUJixvU+1qukilU/c3
         /mA9bLjAEJaHA3Okr+2oHWhP/i3SLls6PJg9GesdbSbcdpPFEk3UyuBKzhyP2BZWkle8
         V14TV1iSQMUb76pDCvMCgeswsHmPSNG1cP15VZeTBOAH1BPJen4RZGSUFrrvomlfhtGg
         CdsxOLzFpk0G0vJgKhHt17SqGx0/3l5AP73eAGPkHmuHA/EHhnZRfsWxb+XE6RX5NpGM
         YGjir0MwG3ofkxdMmkR31a0mpMNowyLCm6y9Ao0n0DY0ehgVwiaz/EY7q1az5oSbQcyH
         gMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789225166; x=1789829966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdbegSn+POyj07QfBSr0FKovBmkNgYaXeVZdjxMNseQ=;
        b=NZXfXjoZ4YAuhJyN87PRjarE0xaBWZp08Ahl/CnTIOWNVg6jYQKrPUtEir4Cq+gWE3
         +hpaYr8jl4vJ+0+bKln1hW2JXB1kdPIDdXMo0wgCadzthhaXCyj0pv535g2D3vusXJu3
         5dyU5XtNaIacERnM8g5wkNboQEZ85/i+E7sFDRTBzDQkssRQBXzLtGTHWnOYimz6oWXQ
         wVksQTclIE6+7rAENpJ1akx5t+Gl56Fc83u6iuuey8X1RILcL2peOG32jh/IFQtL5N68
         CKMwSxWK12uFA1sGeeZPG5PZbQ6VqcCA1kI1tM7d7W4/Tvh0qVkm5228vqSX2htlSi6s
         VU9A==
X-Forwarded-Encrypted: i=1; AKwUvBxn7CP5uUXm01oLEFzgfax252Pjty/NrnpzFhWCZsuFXBGSsltq1oZ5GNzKDWDXLIV41pTiWSqWM1WWyVg=@vger.kernel.org
X-Gm-Message-State: AFuF++nDuvevh9dNXP2uuZ3I8PijSbzzQhzbsD7Gq6hrsoGv0iImysY7
	y2cBdXmEL+mabzJ5whReYQA0SllIJYvTnuIohtehoSwrnpOwhkMwGqVqtxAdKFaglZF57iigi+7
	B+nOoNObPuMNuZYN5ti4kpeFUdmSKQCZZMqPYEBPRUtEGdDKMRSe59494NfaWK2V0B7g=
X-Gm-Gg: AYBFou12M7zNU9tI/1QAKo5tFg7zy4hD5U5Ze4gKQaCjCpcsTwck0ZmqPzdYfNTRNJE
	VM1YpmqrEaH5c9Etp9mhLwOiXioyMpyT+iAiBfqslVYs6zmGe16wospx4hJMSSeHf36rc0x7pJL
	gNCG9PWDw1vwRIGQ7/ZWYerPWlA8q3XsnXmP2r1InLRm1WxMXgIqfsA/qW/Q6trvSdNI39gdk37
	wDE1qS3mW99QsXg1lZ0HR5SRL5QnOc1PHizpN9G3EtKG9h1UgJA2rMAF+LH+D8r/+wdNem0lXQ1
	zJ/8RKkmUxjt13nIq19FBQVUd2mp7jIyMnXtZ0s5Lge8wXpT7tJhbeZkaeYfusb63Ho0YjVc8hr
	ZD0MkUoSOdFJS204EZ9nRJLP0HitXgxtVJ8Sod3rJbyTh98o=
X-Received: by 2002:a17:90b:1a90:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39d9c2346c6mr16000760a91.12.1789225165662;
        Sat, 12 Sep 2026 07:59:25 -0700 (PDT)
X-Received: by 2002:a17:90b:1a90:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39d9c2346c6mr16000726a91.12.1789225165245;
        Sat, 12 Sep 2026 07:59:25 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95092c06sm11060515a91.4.2026.09.12.07.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 07:59:24 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/msm: Enable THP for GEM buffers
Date: Sat, 12 Sep 2026 07:59:21 -0700
Message-ID: <20260912145922.24115-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A0hVr6EQZnFeEt9igUM7XVTAwTSY8IV8
X-Proofpoint-GUID: A0hVr6EQZnFeEt9igUM7XVTAwTSY8IV8
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa568ce cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=bo7bELecpVJEBXAwH0gA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIxNyBTYWx0ZWRfXyKwdDyoIfBQP
 kN6PpPgJMT0EsCU1174fZ3vpLdR3kUiMNnxn96pOtQFUCKPPZMtWpnxaVQXaFdD1h8+v7NXGVcX
 y+zLprJtCxc2yto4vIPbBsyNoKIp6jS0FCJF1Xl1zPKZXVjqWOEY5wDVL/L64pSRMVekgEulzEM
 PXifvv+PBfNUNCCIcTMarEbiMCeCFaMfzz+U4clYzmedlm/ijJD8W7GlpiasT3IXL2t+Qelkc6Z
 qCQLzwyn21b0Upj8uahQfWRVbgdw4tydkq4WojDxrbKmTKLdgg5l0tpwkp7MawNi4maBpxOAsKU
 JVLTIujzym7Z/ZUbODNiHK2q7CIp35EYgdB34AxferKVVyMzlfY5W8qthH7tIHKI5KvvRJRe8OL
 T9vDEnDcoSu5LlTcP6AG/CwIersbxRVIwkLlzdvm0vphdIemfUrY7aZQ5bhG3rDZ3J/4NWz42Ng
 QHbydBGAHzYQhRWU6FQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIxNyBTYWx0ZWRfX1Jxp7OEokohh
 z8SmSuL4MjwOoCBc+ypY3zCknClRZEARLxpEdDkK4yOEO96AuVsKsuSuJLB4n0a5PP+vu1n6VqT
 +KnfxMEcPwnR9bYSUoIA7kM3i6Eob0s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120217

More than 2x speedup on darktable benchmark which was bottlenecked on
page allocation/pinning.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
v2: Initialize THP earlier
 drivers/gpu/drm/msm/msm_drv.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 73d99bde26f1..581903ccd5e6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -58,9 +58,31 @@ static bool separate_gpu_kms;
 MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_kms, bool, 0400);
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static bool transparent_hugepage = true;
+module_param(transparent_hugepage, bool, 0400);
+MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount point with Transparent Hugepage enabled (true = default)");
+#else
+#define transparent_hugepage false
+#endif
+
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
+static void msm_gem_thp_init(struct drm_device *dev)
+{
+	int err;
+
+	if (!transparent_hugepage)
+		return;
+
+	err = drm_gem_huge_mnt_create(dev, "within_size");
+	if (drm_gem_get_huge_mnt(dev))
+		drm_info(dev, "Using Transparent Hugepage\n");
+	else if (err)
+		drm_warn(dev, "Can't use Transparent Hugepage (%d)\n", err);
+}
+
 bool msm_gpu_no_components(void)
 {
 	return separate_gpu_kms;
@@ -161,6 +183,8 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 	if (ret)
 		goto err_msm_uninit;
 
+	msm_gem_thp_init(ddev);
+
 	if (priv->kms_init) {
 		ret = msm_drm_kms_init(dev, drv);
 		if (ret)
-- 
2.55.0

