Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319E036DA14
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380226; cv=none; b=UPSfEtxDl1BjJVaxv82ws15YqT902IyOvWIG+2TvXMF8kiSnALB2Hh7VBfbt/p6vdRs3Wjza4a9C6ea9jZsqtqwuMS2UJGDmtc6yS5WDwt5x4UaszQTZR45hoOn5Hoe4m/GfVwRzkeiLq7eWrxfdaK5DaIscoQIdeMsOGoy2y1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380226; c=relaxed/simple;
	bh=cHMxNGmj/98vRoQHbpOwRpNqylCQwBoL0GeUiGdn0BU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O0hpH0HtPyTdWe2aNZ+oAU41O4f5XjH8NPs+0bwqXwhn7YA02vo/nBUoYEDakExPV+xJyGJ2u9g2YbVayzwNvaZEN4GaPRVNsxrnAriA7czUYNuHPsA7CLlL0+vRxLVIsKXE4bV9X5gTA6tAwiwJy0C2XgCNtpcvTkSQae4MRPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CvbVC+q9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qo/FwYg9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CvbVC+q9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qo/FwYg9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KH4eG2685637
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:17:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AzXtSV/WWty
	dTYO3EmejDkL+S0H/FVtNGv1YBW4SI2s=; b=CvbVC+q9kQRRtFSCnNcyzsAX5tj
	yTWXuwhhl+7w/PCwuugp+uPc+vbrzE7anfZtzqn3uf46kLo72QjQf86fmd1F4AHh
	YZz5UIP4/Sl0EbR391MOBU/DWnz+wNtMd2+J6UiEf06DeZJ9UcSFFesMDBHrLTuo
	nyo+CJtNOEw4++m2/oAxc2OmlDoocqY5bhZkHlq6VkXFFqQrcYA3RFW8MxWkdwy5
	u4Daiw3zhz6A0Wd1VQbtsPS+efAub9dHQaYctpfIgSP8G4jPWB0Umbn3Ul2wHZvW
	Cnp59SwGnFPZwPQ09iNce1ycNwr4B7tBac3ES/O25zXm9HWjJ9tn9m4Zt7w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8a82p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:17:03 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d7e0f3b4so2058273a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380221; x=1788985021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AzXtSV/WWtydTYO3EmejDkL+S0H/FVtNGv1YBW4SI2s=;
        b=Qo/FwYg9bQUk0sfCwhBLMfqhhgj5SO8gYChaJlfm5Ye4ka28plmA3TgLB0EiNhRvGa
         eAJfhFXfe2bLHWSc/cqkygObEUHsFPh0VcuZyOj4unssgEp9bbTn24TDo42DQxFwzEir
         FwPqifWz+3aQ/AfAlOl8D3n34KuHFi1bGItTFtWKXjmJbidvztjf7YDD25vwd1WVroqv
         dMa4B6PcWkiuxYiIwhhOnvm4YlmYl9PI1d0sA0qfBoj920jVfjUMYj9QNJ2kf2s0GYGx
         ahHT4HnqblBKC892Vc9yLeffN2jBHk1+aFuEVh/RPGOv0/6CsUyn6Pxc8wV6Q5d1jlBf
         fgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380221; x=1788985021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AzXtSV/WWtydTYO3EmejDkL+S0H/FVtNGv1YBW4SI2s=;
        b=MCSdK1+VZ2Q+22OVbJjzocBo6TEsi0gnjTs7hkBBYgRBRd/+zRCn80if8Jjdr9Avjj
         wfNBpzcDfJMq/vMwSZXb6mQOC7GZPzfGmSfImLmIblKvrHHeJCd2A/0FIVyvqQiio++d
         bZURv8mffmAEu5P7DtdIEXrriUUUIM+BuhWv/E2pUl+hwR3s3RIJTAEh+S9ZpPTNy+r8
         jH74kvkkYHt+WuzEeay9mU2lKkIisRrWIs2sUnEcNMTz/feNnRNOGD/NKZazLz0RqSBA
         JoAniX8aer/8H/ZGbwI3s1xLxSwuxwWotDerFQzTBNRA4f6QEI03XfCaIfEZyBi7ckL3
         ut/w==
X-Forwarded-Encrypted: i=1; AKwUvByU5mIK6KRSrkKAGHJ+Gga+eC5Y6dO/JmkMwfpV+fK3+EzhotzdNmtVoHbz5bFiv9ZFqfDf+h89xuiB6Us=@vger.kernel.org
X-Gm-Message-State: AFuF++mo0RaF0wgwNgSq5wh0W8REjkPw1y4AMso3EZ/khGPhDL3fIP+F
	GKvD8TlZ1J6ztyhCyFGJDXkAztTQj+Kh8kvutnP6YNEB8wYYYnwueRMpwxeh/eY+TaW7PGi472U
	Y3tK9cUm4HgTlq2mZMTUZr6ny3nK6eCOgGfBbf9CzJdCxpJMh4PhY/Pqi7xEf6z/8Oxg=
X-Gm-Gg: AYBFou08D2N7ZRtknXXh5VmHbxZr+5kWiZVp6ApkVmtMzsPPjQIv1SrxyWz5my3d6m2
	hYCn8Re1tL3W9T1jf0OpQmeHntlLWSCPeA0BRt4alFGwm+OIXQ2LKoQyTlvsD7S68+pG7/CI7Ij
	4QwY/yo5SZSUWj0WLdaOXuAs0Rc7F1N6zhsqidkUp94Ui/g0zr0/qAtXLhFqNJExan98XQOOZWn
	4hhsMARz/kfL6DJY6ZWa6YB5F8d+8bf5YAg/ayE1z5n4eX0+iSwPef3CyGEv3QHj4rNMd+YSINX
	CMiYVjdo7MX/jAQ2tpcOkpFuyrqBKOJBw0fmV+pzMzknsVhglDkOcnkN54B24CebEeKLAxqWjz6
	zVVSjjAv/b2z5prIw5dqGU7wJpEo=
X-Received: by 2002:a17:90b:3907:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-39aee066e04mr8860741a91.14.1788380220857;
        Wed, 02 Sep 2026 13:17:00 -0700 (PDT)
X-Received: by 2002:a17:90b:3907:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-39aee066e04mr8860691a91.14.1788380220414;
        Wed, 02 Sep 2026 13:17:00 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:16:59 -0700 (PDT)
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
Subject: [PATCH v2 1/11] drm: logicvc: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:30 +0530
Message-ID: <20260902201640.2024648-2-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: 0fWHhfPP6GbJaKHK_uOpppl3ATMtXlvQ
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a98843f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ReI0EElcLHst8dYcsfAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX0MTF2NZjAxbS
 Euw2Us/FVBsWgro+qxfNZHuWJrvzfvsnOmi4Hoyhrg7vH1Qo8uHAycBSsu3dmJ79sFhybgnGyAG
 HPbLdHMCqz486Usk9taHin/I3SR30ks5l6tT+NY1mEpd349PIHIK0qF31sbJRKdnh9zTAliCQ0L
 ljOj8qdoZuBq63Qx0L7tg7FoamWjVxZjP4ayX0g2p1qc9sMt8pLZS6yJ3cxcF8WvlWylDkCg+Dl
 Wr/s+R5EZa7XtQ8ToZZExVf0jkjI1j28ziHAwgG4ixxVzEN4PfjgkUV7msbYOEgvoxAV5FmBNIC
 aNodjFzb1pZ6bbL8bMcn/4KBN5Wuq0qsTxjMzgYkowopgfqBEBf6I85xMWQz/Oz35Mpr5XJTNml
 Jm/sO3WOttfCs4osdK2nCxqQ5oIRNYy4WQbFzxNsQ3+0j0ePhjn3z4OjonB3gMW8GWniupdPSY5
 p8/sCcvCMLNbx/t9tZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfXxhl2IbWOLR01
 86vh4zr7S29YE1cnreU/s5QX7ebcviBh7R4N4e2u4n8lUmDaT8pao2o0pkpygSY5seqLMSJHSCY
 EPDsKnOsRXADjm95ai0/SU4+iaccTW8=
X-Proofpoint-ORIG-GUID: 0fWHhfPP6GbJaKHK_uOpppl3ATMtXlvQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device unbind.
Replace all error paths that jumped to error_reserved_mem: with
error_early: since the manual cleanup label is no longer needed, and
remove the explicit of_reserved_mem_device_release() call in the remove
function.

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>
Acked-by: Paul Kocialkowski <paulk@sys-base.io>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/logicvc/logicvc_drm.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/logicvc/logicvc_drm.c b/drivers/gpu/drm/logicvc/logicvc_drm.c
index bbebf4fc7f51..d6dbe52ff0a9 100644
--- a/drivers/gpu/drm/logicvc/logicvc_drm.c
+++ b/drivers/gpu/drm/logicvc/logicvc_drm.c
@@ -306,7 +306,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	int irq;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev, "Failed to init memory region\n");
 		goto error_early;
@@ -327,14 +327,14 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		ret = of_address_to_resource(of_node, 0, &res);
 		if (ret) {
 			dev_err(dev, "Failed to get resource from address\n");
-			goto error_reserved_mem;
+			goto error_early;
 		}
 
 		base = devm_ioremap_resource(dev, &res);
 		if (IS_ERR(base)) {
 			dev_err(dev, "Failed to map I/O base\n");
 			ret = PTR_ERR(base);
-			goto error_reserved_mem;
+			goto error_early;
 		}
 
 		logicvc_drm_regmap_config.max_register = resource_size(&res) -
@@ -345,21 +345,21 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 		if (IS_ERR(regmap)) {
 			dev_err(dev, "Failed to create regmap for I/O\n");
 			ret = PTR_ERR(regmap);
-			goto error_reserved_mem;
+			goto error_early;
 		}
 	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0) {
 		ret = -ENODEV;
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	logicvc = devm_drm_dev_alloc(dev, &logicvc_drm_driver,
 				     struct logicvc_drm, drm_dev);
 	if (IS_ERR(logicvc)) {
 		ret = PTR_ERR(logicvc);
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	platform_set_drvdata(pdev, logicvc);
@@ -371,7 +371,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	caps = logicvc_drm_caps_match(logicvc);
 	if (!caps) {
 		ret = -EINVAL;
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	logicvc->caps = caps;
@@ -382,7 +382,7 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 	ret = logicvc_clocks_prepare(logicvc);
 	if (ret) {
 		drm_err(drm_dev, "Failed to prepare clocks\n");
-		goto error_reserved_mem;
+		goto error_early;
 	}
 
 	ret = devm_request_irq(dev, irq, logicvc_drm_irq_handler, 0,
@@ -450,9 +450,6 @@ static int logicvc_drm_probe(struct platform_device *pdev)
 error_clocks:
 	logicvc_clocks_unprepare(logicvc);
 
-error_reserved_mem:
-	of_reserved_mem_device_release(dev);
-
 error_early:
 	return ret;
 }
@@ -469,8 +466,6 @@ static void logicvc_drm_remove(struct platform_device *pdev)
 	logicvc_mode_fini(logicvc);
 
 	logicvc_clocks_unprepare(logicvc);
-
-	of_reserved_mem_device_release(dev);
 }
 
 static void logicvc_drm_shutdown(struct platform_device *pdev)
-- 
2.55.0

