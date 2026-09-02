Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C5236DA14
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 20:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788380234; cv=none; b=KJWJamqYquIay2kYjZ6YjLHyT87afpxo74tLirgtvMuPQbEXzd9TN4Jw+Y3DP85FUn6S/kiz65uuAfzSjryaiEf3JzGFrmW5DxGDyPGZiZcCAlmeViSwEtcLfe5/mWOuM9405dl66HQuTPr7qsEd4ypesLRm+UXVcQpRrJ7dUSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788380234; c=relaxed/simple;
	bh=X2JKT1rUwXBxTwGr+cj85lMsd/xn6QXY90i0q/UqNeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YZbBROlt3uDtw1TfAAGPp7Jr14Mcc4/JdYnwW5qCCV19IWinowkF0bz9Bz39UM9Rjq2rJqajMiShIKh3ChCtnX20ISU0hPCtca1QtmW1PhMQ1nC5qPXsSFBhz9D4NvbLrc1n3EpAY6aarCC2igtxQNE5r4vWLDIpoRtDq+Mr5qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YH71TVQX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NGhlfhhI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YH71TVQX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NGhlfhhI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682KHCsS2796910
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 20:17:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5pBRbhbzo1P
	cOFREec6Gs1n8ea1WgM8d8Z6/KvlnlrA=; b=YH71TVQXwSMcn3Fu/Uff9SK4nzC
	54IULE63yNKCuMTPEd49MGBUR9KKNNIN/QVTquPXtzIjMppcDurhMW02H3mw/HoK
	QpIWWpHShP1aC26/5Elx8gXqpOsaRWjvdKkLXCUSyLf1mZfjfZiZSS4H+mV1c8Id
	88ruhQ6RqKJIryjdqDsY4tS8gLQX3HTIOvazfZQQPjxVQiBY+Ozb/umbSbvelZan
	fwT6i3hl7FkpHSIJoP7vd8T9SpNtUG5AcXWPwBduK7YLtF34TKGVzNjoOtZ3ZMdN
	eB2EhtinE7Jy1HoAhoeMJRx0yJorifYNZ8msk5ykeSvB8lt2qUSCYqN0DjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemjh9q8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:17:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1870921a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788380231; x=1788985031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pBRbhbzo1PcOFREec6Gs1n8ea1WgM8d8Z6/KvlnlrA=;
        b=NGhlfhhIkfxPytweIqetPW3pciB7bfm58LkAPcWep6KeldejDIrvCmHl+sUYNlyXkR
         qEnklvO6GF+VH8+su37CXGaWCgV6GSc3bVsJoHoLxlMCzyuFfomXL9DxKDwaZDiiCTWT
         S2AyvxI9nCIOlr1gWgVrSnGiuz1bmNknGa+exE0hbaLkN3f6O0yVK84w/HpA0ZIPUTqj
         pacZV+LOxRkK7y+lbd9COVjiwnrTI3Mit4iY6i1JU+RIW48m8wv5I2wCrO/x760SzeO5
         UTg3DHfvBGHr8V7/nLHUDLIFKqR7WGnrXIv+a0BBt89D4yiP/A/eZOPJMYkks5sQ3Rgh
         5OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788380231; x=1788985031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pBRbhbzo1PcOFREec6Gs1n8ea1WgM8d8Z6/KvlnlrA=;
        b=ocufbMTBDJTTAW13uSVdPm3TCxHkniXWx7pjTMsvWetu7bxhcnLGZ5qtONWJEiOHhW
         gw9OnbIM0TQcu+WV+BIrWZJVJ6C2c/t4NNw7Wvz94vKuF8P5plJFYZPDNRx1VAAmgKXP
         S7iQWZRWc+WCH7IQQZe9C/C4jmR5otEj8lgbif+YyGbSH8pn+lLiLL7uBsh9qPxvkZAo
         M+nHjriqvpQWnPjvnfwYjYcMOCQLo+luz3E7Hzr9F31xJ0e192VwzZ5rW4VJf+DI6m0L
         3Tbhl//3BcFparZLlFqXTynnIkB/AlLflD18L3ZTsX4D5+bzQxEFfvnJvUSI7PyRk+zg
         9T8w==
X-Forwarded-Encrypted: i=1; AKwUvBxxi0q6Gj1+B3BtqAku17PQfRT3HGfn0cyBXLP3Zzz53vMcaCQUkF5ACuTPgGemsP5Q+OELu8YbSjI2yhQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lGfidPoewh2SotxM95Im4jDv2Wtnj4HmRW2fwyiQIIkvNS8ThF
	bx5Fp10ImPdvNTiD35GnyzEWt0c0NjGmAP7nTQ9Xuc2vZ1he5/iWABAcbsqQjtX4jBiXhyvMDRQ
	Xp9OdaaLwxI/MAo34HEUq4oYsJPPq0WRNmwH3FNXpKFxJGiJnoQb0WYFdhCiN8BTUZhg=
X-Gm-Gg: AYBFou2XmiOrYsoLN6FJxl1Ft9VwsbwCHoflTS5zy8gIP598I29ngOwXvsiN3WEZnXS
	oBSyJBY7bTYIlm4/GxTqMhavQ5s2sgAVjKG7mSqhAgkOCy3N40BC0FDjx2YshBqZCht3K3Rsu7+
	dl7GuaH1jFQ+rolXcra/4NWn26TOzQ2hQ5bWF0ATMCxYKvs+tUozYcKn7n9GxB/KtjjTlWaX6LB
	TMIk9ZisHFn6IgXvJe5vpt2RPsBn+pl0ue26vHYLoOGkKJGVLiWmLXl5DCQXOxTE+omEcGzN8nb
	bZXPKKiPzSx2c8xIAjHtJFwUi1A12mX9ChK6IXNWcjevEq9dfyr98Ux6eut/NtRrNBZzbfdRRLO
	9BTi06PRoEIkjqcu8Z9jZoYOrV8I=
X-Received: by 2002:a17:90b:2785:b0:396:5cdc:4bea with SMTP id 98e67ed59e1d1-39aedeb83e0mr11608235a91.5.1788380230690;
        Wed, 02 Sep 2026 13:17:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2785:b0:396:5cdc:4bea with SMTP id 98e67ed59e1d1-39aedeb83e0mr11607901a91.5.1788380228811;
        Wed, 02 Sep 2026 13:17:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33256414c60sm497205eec.24.2026.09.02.13.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 13:17:08 -0700 (PDT)
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
Subject: [PATCH v2 2/11] drm: hdlcd: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:46:31 +0530
Message-ID: <20260902201640.2024648-3-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-GUID: 9CKLh7LLqNw4UH0tGhqAluY2e5GlrPzN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX09kzV+a8iPWw
 p3ilGt2u8hKjBY0jH2Gbkv0BigHe480fY9dUSg+yEJuKVlZxLAYuVjMqnUMZqdMV+WBrDR7ALjc
 W61CUeD07IyJq2end6VQkyPzcRGJ38daVyF5kfurPHW/iFTk4McMgNPxyDAjYN7dAAcWPu/40Zb
 3VG9+pu3aBXQ1g4TAF3EWlhB55PuxxMglQaTpR5qneuOhR6Py2ymOAWqvfn3uRHSptS5eNiNYpn
 qXk6zFbx9rtV349JSlTuppxjfcG/2pWE5EkBCW9b4r6IMwtdYssT8Kwy6bTfaaVO9VopuVb5KSv
 2Q34ZgyAs6wsLRtbOmTFp7JQpswTs/WwpQ5MKYksQGGxsRakPyeIz5cvXm+6iV0BOi1Ya0pd0fh
 s1zP+klTjF72TqPn/juYF7f4icf4DXrxzNVtT7jeQSSlfk8xWzfnMcK4/vcrlPH6SOMUN2sZXd3
 nGj25Vj63d0TQKwY+wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3OSBTYWx0ZWRfX9F6A8/IKGQa5
 ye9Byf/NQKwPn6tndGpwu230fmYagJXCUl4e7e43YFp1L69P8enTIrQqKnKmir2ujndBOw0Ao/j
 UwXRdYISXmsEpaqj1RtiSerSUsyMnYk=
X-Authority-Analysis: v=2.4 cv=ErHiaycA c=1 sm=1 tr=0 ts=6a988447 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=zu8Q1U5i7KxegdXecekA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 9CKLh7LLqNw4UH0tGhqAluY2e5GlrPzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_05,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020179

Switch to devm_of_reserved_mem_device_init() so the reserved memory
region is released automatically on probe failure or device unbind.
Remove the three explicit of_reserved_mem_device_release() calls in
the setup_fail error path, the bind error path, and hdlcd_drm_unbind().

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 81d45f2dd6a7..67466fd441d5 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -134,7 +134,7 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 		version & HDLCD_VERSION_MINOR_MASK);
 
 	/* Get the optional framebuffer memory resource */
-	ret = of_reserved_mem_device_init(drm->dev);
+	ret = devm_of_reserved_mem_device_init(drm->dev);
 	if (ret && ret != -ENODEV)
 		return ret;
 
@@ -164,8 +164,6 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 irq_fail:
 	drm_crtc_cleanup(&hdlcd->crtc);
 setup_fail:
-	of_reserved_mem_device_release(drm->dev);
-
 	return ret;
 }
 
@@ -316,7 +314,6 @@ static int hdlcd_drm_bind(struct device *dev)
 	of_node_put(hdlcd->crtc.port);
 	hdlcd->crtc.port = NULL;
 	hdlcd_irq_uninstall(hdlcd);
-	of_reserved_mem_device_release(drm->dev);
 err_free:
 	dev_set_drvdata(dev, NULL);
 	return ret;
@@ -338,7 +335,6 @@ static void hdlcd_drm_unbind(struct device *dev)
 	pm_runtime_put(dev);
 	if (pm_runtime_enabled(dev))
 		pm_runtime_disable(dev);
-	of_reserved_mem_device_release(dev);
 	dev_set_drvdata(dev, NULL);
 }
 
-- 
2.55.0

