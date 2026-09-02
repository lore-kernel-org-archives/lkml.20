Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C3825A645
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380241; cv=none; b=dOORDfoy4p3nsRZcKr2+Df/XU3mjpD57vDWnv+X3Xrxca4VJFEtMxGEpTW6zCzs2TYKw8AgacJWibhxsjti7uUCkqISwAuWqaR+RLHJQiyQeSX7eWooJ4jSEvuD/H35E7D3IAfnvDgQSIFDVdXesdL2JgyoQU8edODo2IcIL7S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380241; c=relaxed/simple;
	bh=J5fU6hQOqgYnobNq0y67Kn6rZ5FR9aF1CDB13ndNBPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FvyaXsjMFvufNt4FZ0jKoSxLMHobS+5/w9tr8fX/v6EoqltSa7xDiyL8csC1NsPAberQbpIwRhPP5p9otZCZkkX0Adm9jr5PmBk9AScrV15OukaDcHMY1NXNjnDkC88qPOPX8F1Vb4yTrwZnoyO+gng+TgixXRWxYw8a77nfUE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0sYz4CC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3uNsoIg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0sYz4CC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3uNsoIg"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHCtr2523731
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9lDnpS9AG8B
	MnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=; b=a0sYz4CCAZERJ5cvQgZ067dKOaN
	q3zsMGdWtgW4siEJGM7JhH5S27ck/eEvpze57SsRdLn6TIb6EYfN4QDUd0EgoQ47
	hCyZGr6sDbJ7x0sKo2J5FjWKamDlSx8J1AfHtG13YKSYWtdxi8lr8kdNCA37Mrn7
	ffVtMIw9RXL7cpU0LXHWe8Y2v1Hng0Cw8YAniRAajGPRp4mAkHO15m2C94aUICNL
	VtHZwWDy3QkuVzs9vQCqcXewaaRtyixuRjgqgrCtOI+jCbl0UhLpkfLp1PykMbjL
	qokITfmOkJByT5TuP8bH+8444POICdhc+B1vucMlN5DsaaxXwT4RQuCrmzQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5s4jp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:17:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc39363cc88so1328852a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380238; x=1788985038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9lDnpS9AG8BMnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=;
        b=a3uNsoIgMhp/hIUK4cdVb8mOzyu0SgHCWR72k86nnCnPzjDHZp3pxhUmYCF/9dgFBs
         xUwsz1y0Pv03JLs+siJubLx68nx9inYKC3ZWTWp7pFtzwwVgnPr4okvHMNHHmdRIwqFW
         mGyEJYnT5vTXeG01rGu8WOJzjaTOefun9CNcIG/diw3AkYHcmTX+NYZ6edULmc0olWDP
         XLiodG6IKnztnW+Yy0BCLcbgKbQeLJJX0ye/tm8bbQZTWvydVlDomE3MCeaHAPjJq8YA
         wakEksiSmN7jrDR857NkXEMjMwTrG+zSyEUHfMzFIsM0MQABBkN2Hx93OHGivhK9tLAa
         OBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380238; x=1788985038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9lDnpS9AG8BMnKFjVCsDrmYG+UZscdm8zFBOnLWOShw=;
        b=lr9eJWcigPpyIKkHX05z7yWKgZPpwsrKdNQ5UwVH/3u+ehRoRmGhnILHThRdfnjLcd
         Ah4BSaKUNX8UFGALyN+CHRB2SYVZz8P4EQklAwMK7JU9Ac+ImQgejF+lyrlApvYREw9T
         GfC0nrcDTCRFb38+QrUZQPAXjCHXf82ghC1752ECTIIIrf1aVr53LU4cCgXJpWCHVLLv
         2hMKmx1FOJwWwC8mYbHGEq5QenzO8Qm5bT6tiXL1AVzQ4Jse0EkPBLgycdXLBMLNW036
         qCJyHzfQKfxc569XIk8CcNzg9kti4pr6lWWnS46w1Xaz/qQqKkM9/MIfmLLMiYh80dQX
         AnmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEJ2z9x0T2U45zy0NdwvTUCgLoSloCWXAUcYBaEGm7ZvNMPATmZrhwV2viAaApDV1qe7FW/evpLKFqOWw=@vger.kernel.org
X-Gm-Message-State: AFuF++mKfts18b9T4/fl7Ahc/bXUULlXsqZB9FFlBC4seAbnq+a+ijM3
	h5K0caE087B5Iokvsn8p6vCwx+CWAvuOtF6bEIAB1tKlqv81pa0VK76d9qefoLX1OgRkVHZmsbc
	vxvbRXJGIU1WdDPOBRNQEgCbsiwoHFLv7X8uAy5KLBx/ZhiSfdsGeIu7q2UuMLqyqJP0=
X-Gm-Gg: AYBFou0AZih7w/9qOdQ7u2I4+UG3s0g5f6t+nhMbxYE4taYAa1nfLMLxEK+J5XhgEoa
	4nhuWO5jTSZjNQ/CJ7WeKJMgeKFJM1Fqi/EZ+BKrVObWEgfMMSZpS2zL055OqopDEcxUgHYM8Bx
	csCH/ysWKE8S7qaImltWKUcnd6pXqfrPDrwY/KCtBK2qHPZiN01GVAIvzuhVsW/y0nDw2+wdLfy
	E0+R3xkgc1Xdj0KNv6WwNQTllgTk8yvRaflDw0O0lLzhVHULimNlbPsrjWLwl+6zzmPBBR8tlJd
	4Wtf4JlVTjZIjAvGeCMYNC4bv8u0nfnCDG3/5E7M42thlXw/1jQL1qNeKEB6A1iM5WFjk1FtC6+
	0H2akVSANXA26mm8/ult+oQFNGHk=
X-Received: by 2002:a17:90b:1dc9:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39aee17a0ecmr11378963a91.25.1788380237658;
        Wed, 02 Sep 2026 13:17:17 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc9:b0:398:c794:ca26 with SMTP id 98e67ed59e1d1-39aee17a0ecmr11378858a91.25.1788380237159;
        Wed, 02 Sep 2026 13:17:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:16 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Paul Cercueil <paul@crapouillou.net>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Paul Kocialkowski <paulk@sys-base.io>,
        Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 3/11] drm: pl111: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:32 +0530
Message-ID: <20260902201640.2024648-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902201640.2024648-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a98844e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=cxSrDiPXJhrM2elx99wA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: JawKnVtFq5J86Lzin3VOopJDkDxsTAdS
X-Proofpoint-ORIG-GUID: JawKnVtFq5J86Lzin3VOopJDkDxsTAdS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX5Az/LUo60dcp
 C9a7B7NnQ8fcXOZc5k8HsjdZ9ETULbHtqH/v2cCTBbdz0U1DdjwG/2rhsllBJFnqfx49GgzElgE
 l9iZM569c85joMkvZJ04xHC0eWwR7l+ATySBJp87ag3BMZD35VoC1VwPNgXuYhbZSTb3GtVoGfk
 D+Q3jefeBpR/tyYLDrNg21AJV/zH2sHMKobGG3mdPp792tgU7+NxEwBMZQTpFyu7UbGqjdQg2KB
 0sBVK94Vmow/ITw/16nh0r+xN5cd3YcHmBq91MF8QLL56KFPG39Bq8Rb9dAG2eywvTpuJjM1q+2
 AgGq7vNkb6/XsSCyPjhst65VaRV9MG1/CGcCMqA9UnxeskW3m/qY4MBdKmZeWktuXJIHivTUOiE
 L9k0L+KY9r35xQdP40DOvx9ETzdnR81LpX1UZ+yKObbZKVIjfL2OXzQU2plO/IwcwEKJWwV90xD
 fj2ysk/G4h6Uj3IebOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXzJsu/SVFBz6q
 P7CL1xgrWx5Qc4a/J5bl6GCDu0hG0OGA9lzY93XcO+vfDzwyljA1a77INkN6qx4e8/5xIfNO3qu
 Dh1OvwonPJOQeJHMTxbttrjPQUhH1Oc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device removal.
Remove the explicit of_reserved_mem_device_release() calls in the
dev_put error path and pl111_amba_remove().

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/pl111/pl111_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 8ec659b3c08e..a07b17261961 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -255,7 +255,7 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	drm->dev_private = priv;
 	priv->variant = variant;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (!ret) {
 		drm_info(drm, "using device-specific reserved memory\n");
 		priv->use_device_memory = true;
@@ -314,7 +314,6 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 
 dev_put:
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 
 	return ret;
 }
@@ -330,7 +329,6 @@ static void pl111_amba_remove(struct amba_device *amba_dev)
 	if (priv->panel)
 		drm_panel_bridge_remove(priv->bridge);
 	drm_dev_put(drm);
-	of_reserved_mem_device_release(dev);
 }
 
 static void pl111_amba_shutdown(struct amba_device *amba_dev)
-- 
2.55.0

