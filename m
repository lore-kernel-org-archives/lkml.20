Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EEC48C8CA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380275; cv=none; b=ZiH+lxQroKNreESp4aOdIohe/OpqgDMzm3/MbhF1+nhsfIanPX2dckpVhK8E5jSkTSk93qA9pUkK3dPwsr5A6WeyUNqivVtOV47DzFE3tbrGQn7Bzmxj3Cq6/J2EZJ96suT5tZvB5J4WgThW66GoNY8EVjBZz8wc3GMdcP836xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380275; c=relaxed/simple;
	bh=R1ZISnQUY7zQ0PZsmMFsY+x1oAPmIiEBps5u+ab7lTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QCLSif6sscYjhQOh4/GnKJ+JN32V5IA4MHGSJw5ZqdoxxyeW6bbWCiiOh2mIeMRFs8nliC8rYRdOll7xOfmn5ctnTPF2wMQKKULNw1L6zuv29vMPPC+P7Kfm45cZbSftqEr4L5IAQ6Fh19n8Iws4NJ4Ms8nowVAzje77L8wOmBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZxmMMjj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXSRUI9E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZxmMMjj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXSRUI9E"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHBLm2796893
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8JDjRVYqzUw
	0COQ4lE1cK71GEKSAg7BunK0EkaeA4ZQ=; b=EZxmMMjjSUe4iDpYendft8KMQIW
	QkTF2YwCjO/T+sAA0lM05BjucwS8gz5p8R9Y3XJ8dt3UKkChO5FXcmzEgXUYh5LV
	0eUM6KrEuBBs5kxP0uzF9gj5GfWUkp6aC6hqAqGb4Rt++R/dXixxZqPa/dj3gjgG
	VIondF8saW5VVamYQkiL3C+emxDxq886FpIUTmNoJIWi8eb7UMiAGOZ2JQ+QMhfO
	/oD7yrZ9fucXcKp59nfpx2XTZ4N06MhaW5AEiuqcHir5eQFTJnqvpTT9lAiTGR8C
	8XHq+Nb3SFVzm1xP/WolzePIlW8KkPNlVss4gLm+VQ3dA98z+xxFZHo6Lww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9qd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:17:52 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca6bd8a190cso2287035a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380271; x=1788985071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8JDjRVYqzUw0COQ4lE1cK71GEKSAg7BunK0EkaeA4ZQ=;
        b=TXSRUI9EWwwAp7OklgN8ZbXjo/uxUae96GsSaz4vi3fFDa6P4V3jtyYBevXoA5CLth
         UeXLrY9+AwNg5i8lEltASTe45/WArI07ry2OtsKcn33TLWZzAgytLAO8CtscYVef2IP/
         fRRZU0IHso33u3DGyBBq037fYCD0EWRzVhlXj5xKlKUm2oHIfFlM0LHqDAmaxm07auM/
         kkhgUDMt+yMWf9CazWZHD9WpIX6V72rK6+X8059jlRVDvOTxzMD/Oyg6yjAYru/907fC
         q5z2fADz/A6JbSyRFkYuBZ08PP+DbvBDacpoaLk9ZYSTWbiXzlw7w27sZ9DoFISCmIuu
         qdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380271; x=1788985071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8JDjRVYqzUw0COQ4lE1cK71GEKSAg7BunK0EkaeA4ZQ=;
        b=grj8SEVHfiyRj+kR/DV/snPxMIb/ruXpvnRojoHlvYDfCmoYgdXlRvkuGRzUu4i35p
         8gGJ4ON/q3hRe8JjI64WOlM6UEPj2ojXcKsVrj8H1X9u4Hs4mnxPBdTFIhBUgNi8aokI
         KLVeAV/LMcXNQZi93iLIXeo8AiqrQ+e4Nitm3NP79zS7uDVruCBS5CPHpQkPn7Lla61R
         K8i9kIR1b9/zQcnPPgLcGHJsFDBRrtMNuikP+LzkfHwoqKZfI1PVdiNDhQozZrv/9QPT
         yb18+xWG+f7KV8YSv0rGJ0GxLwpW1UMwp6SG/XMuX1HiLo8/vCcOcCAL2rgRsm2vqwXs
         eX+g==
X-Forwarded-Encrypted: i=1; AKwUvBygoVUDF1bI+QnyCwcCU4YdjVRnhHf9p9IxKrFqRVCpqs5VDeqv5Dl3ETIRd44mRf2E14CMcISC/EiPxl4=@vger.kernel.org
X-Gm-Message-State: AFuF++nrairYbbEp0+Uay34ZqJXMNVKEG+P5bGnLJrKlW4prTVi6zny4
	DQvXu4pWuODyaI9vghXByr/MhJCHDuF7ngKXuUj4/4rceSTJWKo90ykKGv2+FKapeT20wwNNUW+
	UOZZTZuiz6CcAul+g1jepzvTTR+H9GvSsTpgK521koVXbxO0obM182GatBdA1eLAsg/0=
X-Gm-Gg: AYBFou2DVULx8MLUs0kLcS21oF5aEt2vM6/XbsP7Qw98n9H97ULjyPhlepM6JHBPdup
	b+x5KoXoX6XYxhXb93BgC/67z9/zyRhnvrYwYlXWCiGfmuLgZAIhkQLVEXjxXWvkWdPMfwIWy8N
	sCyy/2jI8kZMiDAA+lkRohMt3xHRU26/TpUwioE04lQ5PuXgTIUrBTvntM+qubINHi+5xIm10ej
	QlxaUWmfqWtJnWI4y4XcfBquUHl+/XsQ0nWQHaXWXB7noG0gx0PWhc975x9b72pUekLYq0HQSKZ
	/UNRHCntbtl3qylAORFH66pFkBa4P3mb0z1gEEs+grgfCYN6bRmIUbMf67DBpNBVnWtOPTWS/Ri
	45GSKhWYjp61cexVjFS9Dy33cp4A=
X-Received: by 2002:a05:6a20:1611:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d9ad9a7feamr11025924637.1.1788380271457;
        Wed, 02 Sep 2026 13:17:51 -0700 (PDT)
X-Received: by 2002:a05:6a20:1611:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d9ad9a7feamr11025843637.1.1788380270956;
        Wed, 02 Sep 2026 13:17:50 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:50 -0700 (PDT)
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
Subject: [PATCH v2 7/11] drm: kmb: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:36 +0530
Message-ID: <20260902201640.2024648-8-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: BbpT8nW_gLGzQTtQWAIphTRx18yiTTkf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX575rcLfOJUnQ
 KcdCBViuBRDukon7VjE9p0lbG3CasGg2n9rnGzdOB8sSF8xrEgCfCVeDh7NX1sSW9vjzL7piXvk
 2SmknzwLJ4mXtQ+HhViM+sm2EYXBXF8+fZiAUl2FZhAOef3q+xamwx3ORy+t3dU8CFhoCLGkh3/
 /qkNheNVJAir/SvwqwS04EDPlCw4mweo9uRyQiw9D9qMEv2m7DZYURw9iKxKi0zx4OHwyOyUXIB
 P0PJzj44D227BH8DcQr+UFAw4geKr35wxz+Lei9K2FvlJ277bh2/ZFuo+NmAws0pqaBuXro2o7S
 cwAr9dy3o/IN16f4AjFa15ERYt1ndfJ7Ssh6gxZqApRRFfykSwIzXFdjG4jUaY18mMXmxQrepG4
 V0rG4JlB+Q+qE9eHX/d8ToMdO4of7k0tLNeK5gbEnbUs2g1Vxy38LIPOrq/PT1gEssD9AMuu3vN
 hc5dKlrvkZ3nozRxOrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX/57mAb8oZoSP
 iPl0mVRm6U3iWqtgPMGMbfThKbh0UfGhkbbKxEpIFxZrmgD86bJ5B9HU6mEVDqK2CKOloMMW5aW
 djf9r1tDPTZ1jDOPIgr2no0DKlheUIY=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a988470 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=WgoW8aVLYYFOpEymBdMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: BbpT8nW_gLGzQTtQWAIphTRx18yiTTkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Use the devres-managed devm_of_reserved_mem_device_init() instead of
the manual of_reserved_mem_device_init()/of_reserved_mem_device_release()
pair, letting the device resource manager handle cleanup automatically.
Also simplify the IRQ error path since the release before init was a no-op.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/kmb/kmb_drv.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index 7c2eb1152fc2..88fe377940f3 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -140,13 +140,12 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	/* Allocate LCD interrupt resources */
 	irq_lcd = platform_get_irq(pdev, 0);
 	if (irq_lcd < 0) {
-		ret = irq_lcd;
 		drm_err(&kmb->drm, "irq_lcd not found");
-		goto setup_fail;
+		return irq_lcd;
 	}
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -155,11 +154,6 @@ static int kmb_hw_init(struct drm_device *drm, unsigned long flags)
 	kmb->irq_lcd = irq_lcd;
 
 	return 0;
-
- setup_fail:
-	of_reserved_mem_device_release(drm->dev);
-
-	return ret;
 }
 
 static const struct drm_mode_config_funcs kmb_mode_config_funcs = {
@@ -465,8 +459,6 @@ static void kmb_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(drm->dev);
 	pm_runtime_disable(drm->dev);
 
-	of_reserved_mem_device_release(drm->dev);
-
 	/* Release clks */
 	kmb_display_clk_disable(kmb);
 
-- 
2.55.0

