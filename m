Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FABD495518
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380267; cv=none; b=m1SLpO43jMnJtVJDAwdwb/bJMsGpD2gGCWwPoJPjiwH1FF98u6KNnk0SOOQq+I3scbaCk87MFyjOUZZNDd5cfGiqrQJ5Jk4j50EOsXMJ4O0oWX8K3rV5oKWB5xaUbApJXea0RrxyUekDUcfwQWhQrZ47ukCwl8sjANG5pAtT5YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380267; c=relaxed/simple;
	bh=PVLdiLQ5xZ8gc6uzI0Kh6sEv/ejbkD6L3+C7HSUUoCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5rIW8uA8Bk2BRH0ZrGsjRNltD30Au7vWqEeG5RSgK/eNNeNz1Ofcxkuo5g/C4z1juEeHZ4f19N1YnFs43cnxEuetrNKlVtv1aou1ANomNtkzn489HEcJIg4lltNBiOO5DowL72bi7X8HF0z+yq7GJAotmCmSsw6mO4ATi/9ivQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ow90BtAB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ml4MDGVc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ow90BtAB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ml4MDGVc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHSCx3045001
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OK2sFiDhiyR
	A3ApBDHP+/4IoRs1xWNu0WL+tMPWx2xw=; b=Ow90BtABdKWP8vEEbn7t954tODk
	ed5Gq2vRHg44uxceRgHe+MUJEVNrD99ap0s+2bZYF6XW4NoSCd8zgBNC5nAGSu4p
	BEjjuyFQtErp+hmYy3jBNHnfMce3vvAkcX+esB7Sb/tXiw2X9y4cjF6SKw3DLHZD
	LjpyC1/OTGudejH2Z3Clr5w1WRSCPAn61zsEKZHauIL3buq1FRd2S88QjK27Cv27
	QKMF5hjaKuQhKS+hftXVD8l5aYHH2MT/ANXSyoK6bRvttvI/SpMvtlbBDv7W1Df+
	7juJZTuSyv1yUuJ1cMkdiFnI+aJnGWEGzf5C9bKdKtLgWIthSu091fT0WCg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geguy2t7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:17:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968dfff779so361299a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380263; x=1788985063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OK2sFiDhiyRA3ApBDHP+/4IoRs1xWNu0WL+tMPWx2xw=;
        b=Ml4MDGVcey3kSAwV+iLm73dqFCUTUAbeAcVS7F+C2OAxPbhFdcxoLvPr/SpHtG1vKm
         fC4+q9Zqc/pMfvwMuMXCvVDIrPhF8A33U3ByI9YwAzJ7hKFmJlcAMtRRUXIqAAx2TVH7
         XV+8+TZTloYvVyadBj+CNxrBThjh9zy5eHZDJhdoAE0jeLPjkZGoIuaa188cHVEzRsFt
         IAij0V/QzTQelwtsAGZjCJnGOTp+ts1lBtb8NIbmO8fYpGZfTVADoxxUOnLiqG8u7Aty
         clET53gUkMmluFnY/03DVhmxjoSC+WryKqxRGJ9RHL+sMvDZhwA+ritAYolywkJ15r4m
         GelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380263; x=1788985063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OK2sFiDhiyRA3ApBDHP+/4IoRs1xWNu0WL+tMPWx2xw=;
        b=r+5PP7GKtr+trpRRMZxlbWyLtONfeKHmZqmmb4KxFHxtWSqiwCnxWv8FywLBipdyvX
         e/dZ5snp5b6MSxfPV1qrvBBmYLvfROm/mgYpL87tOAeAdhCxBPbiKSqXW6ZgyhtC9eQl
         keR9gtTQK94Ar62l95ri281MEfxRvv9cw1T4rLNhCmVJ5+j3XnlIEtuCa2SAX5bk4m73
         uSuOnEgUDqErTajKVof31A5XfOkgoPm6hIli++nUiHm5ijs6BVq5u7071rECAb27cd4g
         NKSKi1nxTNz+nBgupDxGV4EJ1oeCamgj4TUwFLNHVW0XTI1RaP4eoIyqAnSLJQEwoaKU
         kkyw==
X-Forwarded-Encrypted: i=1; AKwUvBx6H6btIAMKtTeP0ZnktX0Iu0Z/4IoizBDXNEWXV8RFdoSuEjomxCNsT9/4HM6Vxg24mqqb8sdEn7iVzaQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kBisbA/xm427kXnljCfAj23swePx2auZm9+GWAx1WQfNWXUwXP
	NfyGq319x9Bn6H/yzlegT7G53vT49Bf/690px1AEXU6c5BY+5AgavwX5jrANi5kV5HySKGgVeeg
	DXSsQDcM7GU/vnKvOKCyRR3EuzEBMGudxQf5TDMKTFaS5vtExj3AJKqSpEI8zlRqj7mQ=
X-Gm-Gg: AYBFou2SYmFdlvFdeJSo4jxVRO9nh7ju/V9Z0+vb7Zw1d1vx5jOordT9au1ViH/z33T
	OplEuEA0fSv340cwWCp+66tORtd3hApJlCbD+qamkIkau5MvkHeuGBAFtE/wn5tuzf/cAi6LVrS
	N7hnZ+7WmzPSA0PR47l+T9H66EGzysoq0ZpTtuhxSLCou8bWwaSF5wIYW8XRKwHZoteuFkRb3Or
	ZOnT21+s/PteZ++P4KGl7494yyG+B/OjJHdvoLA1X6rWw4bXQEoKmbBOmsOfoX2F0bFVqZmmusx
	lCGHN92w0H2RMG6hMhx2DnmU8hLqxU/+Me+XwfRlUYbYY7Ey8Wrl4D6OyereYbO9htGJ3UyPLBk
	RD0u8q+NqewPmhqRMz3ADpl67Eyk=
X-Received: by 2002:a17:90b:5804:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39b087e4c2fmr1678964a91.24.1788380262974;
        Wed, 02 Sep 2026 13:17:42 -0700 (PDT)
X-Received: by 2002:a17:90b:5804:b0:398:9beb:a2b6 with SMTP id 98e67ed59e1d1-39b087e4c2fmr1678920a91.24.1788380262507;
        Wed, 02 Sep 2026 13:17:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:42 -0700 (PDT)
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
Subject: [PATCH v2 6/11] drm: ingenic: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:35 +0530
Message-ID: <20260902201640.2024648-7-mukesh.ojha@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=UZthjqSN c=1 sm=1 tr=0 ts=6a988467 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=ER_8r6IbAAAA:8
 a=EUspDBNiAAAA:8 a=iWCwWg-Lr60CcT_aNAIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=9LHmKk7ezEChjTCyhBa9:22
X-Proofpoint-GUID: 3bB_Icm7nV9Q1VvatOLm8tXSqTP95Guz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX049Jy36Zj8wr
 igG3smOVdYl2kbF5lVVZvVlHIcr1xbSLbypK+6I0iHFUx9YTAdeKjXDULMsTmeUgQlWx+1G++WL
 HuXdFGkoHM19Be1eRdsM3foD16u0yLI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX7pdx2ZkAqxgu
 bbvLpyfWUWf3fDlxYKfwgTuD9toJOClUCPfyiq3WG766gij+Eg/LEav/FiFhocBNo95uxyFUibD
 iG0MdSCPbeNaY25yglu8heKL9qL36cm1G2zaeL0mEeKSM9bZzbuwnplqe6z8bxX2plNn2xB8mYe
 yrWcOfj08BA/FMmJyHWAtzmjsUp4rpvjjVEZOIbbnANko1viTXcn5QB2RYDTrW8PLTyVviOs5Ps
 smEsZFnFSO8WwM5HUyGxb0v+E4cGSfwlrViSeEeZGmYM5/WBAtZmoDY+3u60AkXT1nmrJMTKy4o
 6cLdoyn31stu9ab42qH82qQ/3ubetVcqHVUHB5GTVRlgdSGoHZDHS9te6QdvBsxgbYBP58BS7DU
 i/ePey2Eo/eH9AW4RV8JT8kpJUAxrY4lSqQMyDg1MHNJEwbEf4bB2z6iahpq638aMxZ4ToliiOE
 1aayoMAXfD+rh+YAe3w==
X-Proofpoint-ORIG-GUID: 3bB_Icm7nV9Q1VvatOLm8tXSqTP95Guz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020179

Replace the hand-rolled devm wrapper (ingenic_drm_release_rmem +
devm_add_action_or_reset) with the standard
devm_of_reserved_mem_device_init(), letting the device resource
manager handle cleanup automatically.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 738a80b2550f..2c4dd6ed2d41 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1060,11 +1060,6 @@ static void ingenic_drm_unbind_all(void *d)
 	component_unbind_all(priv->dev, &priv->drm);
 }
 
-static void __maybe_unused ingenic_drm_release_rmem(void *d)
-{
-	of_reserved_mem_device_release(d);
-}
-
 static void ingenic_drm_configure_hwdesc(struct ingenic_drm *priv,
 					 unsigned int hwdesc,
 					 unsigned int next_hwdesc, u32 id)
@@ -1127,16 +1122,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	}
 
 	if (IS_ENABLED(CONFIG_OF_RESERVED_MEM)) {
-		ret = of_reserved_mem_device_init(dev);
+		ret = devm_of_reserved_mem_device_init(dev);
 
 		if (ret && ret != -ENODEV)
 			dev_warn(dev, "Failed to get reserved memory: %d\n", ret);
-
-		if (!ret) {
-			ret = devm_add_action_or_reset(dev, ingenic_drm_release_rmem, dev);
-			if (ret)
-				return ret;
-		}
 	}
 
 	priv = devm_drm_dev_alloc(dev, &ingenic_drm_driver_data,
-- 
2.55.0

