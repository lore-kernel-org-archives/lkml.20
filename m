Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792797609;
	b=g4Bmsc3twkQdhGt10UeG5fFdB4zP9MXHxNjhFhxh/uBMO9A2+f55YEJeL5qkQx2S/paM
	 4FVAMHPuDZVoM/NWBRJzoH7jl2kw5N2m9tWxnj6n8wqa/QTEt0BvXT+TvtALtlf0hOMdr
	 S5tK/kh9q4aSqdKQjV/FnSbK6RXP7zrWV5D3lJANqwQIhOFC6oBh/GbvihtQPM9Yci0oc
	 1QeF2mRMcCehajww9marvy5fXygMLCKTuFWrg6hHHXTJE3UjLs+1CFWSRd7DwzLQTTu1k
	 scxuBH4V+2sZRwNC5rQt9fSGQzYemv1kWZ+D8oFxdlOI+3XUK64x+2yxC0jB5CIXorw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792797609;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZAcouakyejRyGfq2Cqhm0mLaJYsny6pKnH0rzfdwlss=;
	b=0nD0dkqJ3j3K5na9DHOWEmTtiP0jkKyXJmgHF8rF8aGthpyYfW3zOTiZ6xK0SOy+wJmG
	 LKmEG0ktAvI4MAe+ODYPcyrN6y9WpieYuggNYMuFgrgYHItxGINaNCvamjZbDtbB89Irk
	 eg/ORUZH2lvJ500FYzWGnoeYVeyjhKpDROlGWh2Z6CyeqstmzIo1cP6qBmQI90Q2z0nZ3
	 JEK4ECIYG2GMKhLnWwjOyGwaAS7WlLpPDilZpzmUhY54nWTbnjauSrRdI94yRT4nWmg2Y
	 fxD3ZdcEA8fy/iDajYv0fPeLfcCe3tinZ4FpiiE7ABateucqE0R/2uVOKd5nlXfnAaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="B6BiMhq/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kQ88RdqK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C3D606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C3D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B6BiMhq/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kQ88RdqK
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLut9v3115340
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAcouakyejRyGfq2Cqhm0mLaJYsny6pKnH0rzfdwlss=; b=B6BiMhq/hBnywIxV
	Qaory4HVBJSyQH18QJEnyxRknEv7Uw90iL2qCDcNcSF4SpxzoMlZbEOXNfixVEVi
	acYiH213IzGrzlCd7RHybJd6yBX60HpqAOyajblYg4AaDHjmw9gSvIQj4sMyOY3o
	k+nLg23Ay9SNk9/ZvtNrs+tLHvj7DSFrriQb19P8RvRZtaCuxWi4gM4KdKo0MOOs
	9OLscWvHdzaVFmoE/VJWgirijvMR21ORY2ibNaYMb0r3v4Oh4u4VFaEmkIrOhMEf
	3Em5qanNHuUT9FYYi9hmBSfsF2gzsaWVwYpIdcU4l79xSpDxpmTbQImqFUhfU4Y3
	CW9Jdw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrt8uv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:20:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91be1227fdeso32504466d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792797607; x=1793402407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAcouakyejRyGfq2Cqhm0mLaJYsny6pKnH0rzfdwlss=;
        b=kQ88RdqKNx7ziTzZk9c8fgXQFyGSKKhTiPIOynGV0MEeC6H1w5y9RAKEBCLJaFGg/g
         aD6CEem/LPcmanYx9IkVbNRbV1pKfPWHL2WBOR2KcFvJQTUFjxWXf5YQyfBr7/dbBKTh
         g4PqO8WjJVqSsaldXPTe8SuPSq0pnOgFM9gYj3M/OECjygo8O41tBq9uUkyvBmAAZgui
         LqUvBzS5tchKMaEhAvqE9X+t6h0SY8TODptX6YzrsSYXNgnwhH9ZTZiMFxxRXlqNQP+f
         GxGq0XnBm9fNv85eX8cQWNHvh5VcBNpilJ+hkUGXQxOUcaETTtKCsUTRwZfpaBSbFFg7
         4VdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792797607; x=1793402407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAcouakyejRyGfq2Cqhm0mLaJYsny6pKnH0rzfdwlss=;
        b=xORnPlifMQ1n6Uz7i1aKyJwGqvi34/wtO/7p5plJzVUBsD3VeJu1RMOPp+ZB+Ecr9e
         lsgtOAnsijV/Q3ZpxYNx9knjN8D+8prCW//Ejb9PZuElmeQacuREmV46dqCSAWNJKjYh
         oPF6nzbdkZ4Jai+yX1MCAGcS5GDDLdCq/WQq6wq9tGBA7npMng0tafxmwffK5fWYdi3J
         DTTXPP4Zw6yUQqp8Udq99NgmP0DlXkpmOlsFv40gP4mw/IDE4wfggCr8EiAhQNlhKKcH
         /ixRnd99QlOXyLFylcKDY1eVO2iOSh/cy9Mz8X5TPtyMD4hfQf+UE4+MB+LBOCHDp/GD
         M0Sg==
X-Forwarded-Encrypted: i=1; AKwUvBzXlH0DBoAZCgJ39lG1NEXjyb6RqQBOLFbPCuS5tApwPU0hqdDrH0Tins0+TTsEyrCgj+rIj5WiGwgPboU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+PNRy4rGfR6YcQJGXzksjbM8lyv3McS+Bn0AGojwer5Rld2s8
	zGGS1RT9j41r1fQWI5QqO4NOUB4SWRlJKeWmWNTrngtriGKe1FUNEhfNeNs593TJEnDLQ0D7x9Z
	N5mN8sSio8iUct6XIjbEj3aXlBLr5SX6Xntur1JxHmurqXNpj8nXY30PdNEs8+QBaITc=
X-Gm-Gg: AYBFou0C/8BKs0eoKRSl+LYpSqm1hS+y4peADXxHCVklDXm3oO6ZWHcJVzV/ljNjCwp
	wAug4DyLYf8tBKZSAtzOFFm+lUzmXnegy1cpkuiLj87ZEBt54gDovKgtXvxseVFsBKYFCdJden7
	oimt13/rcmf13QlThOeFeyBjGRjyxXt5vQ4NwG4I4ziSfIh5hUtazPHEspyhDOghWH71LyqBZ2H
	Bh34yCBmdF0B6DrPcq526xriJ94uEs7ORGKnUnDjk2RexxGGTP/pqhtB2uNXUdFCHnPhPw6HQTL
	s2NJLq6swl3epl2sUgD/PetIvhwuKWVgCGL2jZM6gZCW4otQfTnJ/T1HDKDNUIh8x9L9towzMI3
	E2FVjBqShwolvh7J9wErB/KPVivJ2tgRR4FErLrqPoQQ3uvsTzPaghGd6o+1+Z7x0JlISxn75Ta
	kIaQDqflU1Uq38
X-Received: by 2002:a05:620a:40d5:b0:93b:d7a3:45d4 with SMTP id af79cd13be357-940ef9802e9mr88928885a.61.1792797606817;
        Fri, 23 Oct 2026 16:20:06 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:93b:d7a3:45d4 with SMTP id af79cd13be357-940ef9802e9mr88924085a.61.1792797606253;
        Fri, 23 Oct 2026 16:20:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3a58sm863811fa.24.2026.10.23.16.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:20:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 02:19:36 +0300
Subject: [PATCH v3 03/14] drm/msm: unwind msm_drm_kms_init() on failure
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
Message-Id: <20261024-msm-kms-destroy-fixes-v3-3-66a30120a5ea@oss.qualcomm.com>
References: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
In-Reply-To: <20261024-msm-kms-destroy-fixes-v3-0-66a30120a5ea@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5574;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=coiPc4C0940VKA04JsEvpFMf7jlgO3eT5zzOhxeuIrQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2+uPUU4eXC3ASovgu5IK7Gc7YHyELW8wTJ5BP
 a2Uei6hHgWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatvrjwAKCRCLPIo+Aiko
 1e7sB/9TcrMuiE+5XpRGqbSTd0g4q6l3AaYylDuvL2y6uUA33bFwulQQLYUHmOubzYsLa9TTVfz
 cYTx52lm2yaiNJFgb5ThcqMx9ogSpF9UKvet6wodD93NkHzJb5V2LfrO8VgM8gIvtsDMEQoC6br
 sYZHMGbTIRMDYdyHcKSFwZGf8AtZ2ulfeRYoLCbDNWtQF8zti58yen2MEO9RJ/E9asuQ5m+/j22
 3oqwgLuqiSq1n+klO+VqASpuBjfTh4uglzzccN8YGLSiTxZZBw7nAuHP1nTfgxaYbV2Qv+cEBLD
 cL9OtyxxL+sEcil6/vdnd5Orl0Fg06wVnHrHrqXyRgaN32nZ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXzzwh4Tlodap/
 Grt6hBTEf7mUAByw7Bq6VZxeLfuQUqBWcvOyfu2Iw6qCKBpaBKLqY8g3PhKyJO+Zi4Y2zFz4j5B
 YnP/rhP7P85lk55eIawN/c3+fG5LNTw=
X-Proofpoint-ORIG-GUID: cPBEthescy7Ksw9xdaVVht2LBEdVute8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA5MiBTYWx0ZWRfXyzJ/vFfYs3hr
 s6gSJhtVSD1ymVL9HtiAXQvpJzH5V61jdt3xEEWeZABkAjzwMG/JV5/fBtqaqOMpxNWSmqNG4xe
 vGJepjuHG+d7ooCFCaD5Wem/xAAqV5mU4XeZTpc9GqrxK3zCw2mWkD2ywt8MhrY35iP0FUR+tPS
 X4KmL6iNI+BflJz1kTDi2Mi0hqxKd89buAk3rEenQw0wGpG//QH9GGKMT6sTGLJXHmrjS5imrDj
 4H8aDcF67QWWFqhONvR4gP7kI0sYrOqqTd8Py4u/YrnDgFJ94DM9Je/v89uT1Rcb2FhGdQfolj5
 4/xlOW/uiZA2KTGE39LhJsnHD5nHgDWzqvHXyaozrBCN3lHsY53HMvksbMRV2j7TY/wrLPNM4wp
 znVNYkCu0SPJykZKPC4/SFR/uuY7nEX+ruhwM3SyjhD3mnA7LVy0apxTIBTnKFIOzjQm2fa2Pn8
 mPAB5/hQ2MdUsmVt8/w==
X-Authority-Analysis: v=2.4 cv=E7lYNqdl c=1 sm=1 tr=0 ts=6adbeba7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=_ChxW0iHWOZRcJAqfHkA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: cPBEthescy7Ksw9xdaVVht2LBEdVute8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230092

msm_drm_kms_init() leaves behind whatever it has already set up when it
fails and lets the caller sort it out: msm_drm_init() jumps to
msm_drm_uninit(), which runs msm_drm_kms_uninit() for every device which
has a kms.  That is the teardown of a fully initialised KMS -- it flushes
kms->wq, calls ->irq_uninstall() and frees the IRQ, none of which exist
yet when the failure happened early.

The kms driver's own init is the first step which can fail, and since
commit a409b78fcdf7 ("drm/msm: move wq handling to KMS code") the
workqueue is created by msm_kms_init() rather than by msm_drm_init(), so a
failure there leaves a NULL kms->wq for flush_workqueue().

Undo the steps which have completed instead, and let msm_drm_init() unwind
its own error paths rather than calling the full teardown.

Fixes: a409b78fcdf7 ("drm/msm: move wq handling to KMS code")
Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 29 ++++++++++++++++++++---------
 drivers/gpu/drm/msm/msm_kms.c | 36 ++++++++++++++++++++++++------------
 2 files changed, 44 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5e8f3ce26b32..1e89fdaf0eea 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -230,35 +230,46 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 
 	ret = msm_gem_shrinker_init(ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_unbind;
 
 	msm_gem_thp_init(ddev);
 
 	if (priv->kms_init) {
 		ret = msm_drm_kms_init(dev, drv);
 		if (ret)
-			goto err_msm_uninit;
+			goto err_shrinker_cleanup;
 	}
 
 	ret = drm_dev_register(ddev, 0);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_kms_uninit;
 
 	ret = msm_debugfs_late_init(ddev);
 	if (ret)
-		goto err_msm_uninit;
+		goto err_unregister;
 
 	if (priv->kms_init)
 		msm_drm_kms_post_init(dev);
 
 	return 0;
 
-err_msm_uninit:
-	msm_drm_uninit(dev, gpu_ops);
-
-	return ret;
-
+err_unregister:
+	drm_dev_unregister(ddev);
+	if (priv->kms_init)
+		msm_drm_kms_unregister(dev);
+	msm_rd_debugfs_cleanup(priv);
+err_kms_uninit:
+	if (priv->kms_init)
+		msm_drm_kms_uninit(dev);
+err_shrinker_cleanup:
+	msm_gem_shrinker_cleanup(ddev);
+err_unbind:
+	if (gpu_ops)
+		gpu_ops->unbind(dev, dev, NULL);
+	else
+		component_unbind_all(dev, ddev);
 err_put_dev:
+	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea629448..f3e39c3907a9 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -225,13 +225,23 @@ void msm_drm_kms_unregister(struct device *dev)
 	drm_atomic_helper_shutdown(ddev);
 }
 
+static void msm_drm_kms_destroy_event_threads(struct msm_kms *kms)
+{
+	int i;
+
+	for (i = 0; i < MAX_CRTCS; i++) {
+		if (kms->event_thread[i].worker)
+			kthread_destroy_worker(kms->event_thread[i].worker);
+		kms->event_thread[i].worker = NULL;
+	}
+}
+
 void msm_drm_kms_uninit(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
 	struct drm_device *ddev = priv->dev;
 	struct msm_kms *kms = priv->kms;
-	int i;
 
 	BUG_ON(!kms);
 
@@ -242,11 +252,7 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	flush_workqueue(kms->wq);
 
-	/* clean up event worker threads */
-	for (i = 0; i < MAX_CRTCS; i++) {
-		if (kms->event_thread[i].worker)
-			kthread_destroy_worker(kms->event_thread[i].worker);
-	}
+	msm_drm_kms_destroy_event_threads(kms);
 
 	drm_kms_helper_poll_fini(ddev);
 
@@ -282,7 +288,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = priv->kms_init(ddev);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		goto err_msm_uninit;
+		goto err_destroy_kms;
 	}
 
 	/* Enable normalization of plane zpos */
@@ -295,7 +301,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = kms->funcs->hw_init(kms);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
-		goto err_msm_uninit;
+		goto err_destroy_kms;
 	}
 
 	drm_helper_move_panel_connectors_to_head(ddev);
@@ -311,7 +317,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 			ret = PTR_ERR(ev_thread->worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
 			ev_thread->worker = NULL;
-			goto err_msm_uninit;
+			goto err_destroy_event_threads;
 		}
 
 		sched_set_fifo(ev_thread->worker->task);
@@ -320,7 +326,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ret = drm_vblank_init(ddev, ddev->mode_config.num_crtc);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to initialize vblank\n");
-		goto err_msm_uninit;
+		goto err_destroy_event_threads;
 	}
 
 	pm_runtime_get_sync(dev);
@@ -328,14 +334,20 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	pm_runtime_put_sync(dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dev, "failed to install IRQ handler\n");
-		goto err_msm_uninit;
+		goto err_destroy_event_threads;
 	}
 
 	drm_mode_config_reset(ddev);
 
 	return 0;
 
-err_msm_uninit:
+err_destroy_event_threads:
+	msm_drm_kms_destroy_event_threads(kms);
+err_destroy_kms:
+	msm_disp_snapshot_destroy(ddev);
+	if (kms->funcs)
+		kms->funcs->destroy(kms);
+
 	return ret;
 }
 

-- 
2.47.3

