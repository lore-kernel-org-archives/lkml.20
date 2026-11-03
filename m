Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731668;
	b=5IXviIwFCSI55Rvfu6wuFZq7g3jrtNE17llZoEbTUbEV3Uf+a8EFgFFC5BOHIi1EpcD4
	 BEtL/j1Ymm0NUqJW6iSd22s83npXm+QF9SFzZxt/iq7wa7X76WNtXyPbayBTRxO1OgK89
	 Unj/Xa9RLbzwDdjFpIijUizd81Wkw7K9aDP9eWhT49Tnd/gfU88FkJfpNPjry6AFmVUVg
	 E9T0iBeTLf9fhiLwavYfsKLATfncG6y0preoEkAr2wV02t3BNoTgFxgv/e+yHbuHKX2LL
	 Nh0qqZgx7MwxXCMlC7pskePWYjyjT7fz/ODqaa7mQcsxaDfU4oMr+hyjTgr6hd1qU2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731668;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ETmQNPch7+VQUvY9eYBohTQWDTkaLoeqazZ+zWLafZY=;
	b=ZT9//s964Jwi6LW/G9ZQrHX+k0t0f6YW2zktnsynabqJyf05ZwPW5hbWrWWewNTGD+Gt
	 QB2ltnsqGcrKk+XZtxi8V42tWndeiiEhg1FD6jWVR2le6qVjYv4PSUgrHHYIEWBPH1FbL
	 dalfHtUTu/wQdSicQx9+PpZDcw8lgueMzHTcsAkinjtIadP5IW8x4O8ZiO6B3udKtCVH9
	 b3JwxJCOWuf4RHpuoG5Cadg6zjRZCZupeexKn1HbNS7EZehvRABmNfUc27nSHiFhVTxoL
	 2DVi75iNqXvwo9kijCh6Zlhiv5NC/EhRunqy4d8hN8sQt4i8OsuYeYCNBQ/po2ON12A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YympX1Jt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TrIl1uom;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FB6606D801
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09FB6606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YympX1Jt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TrIl1uom
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ9SY3666384
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 18:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ETmQNPch7+V
	QUvY9eYBohTQWDTkaLoeqazZ+zWLafZY=; b=YympX1JtIHjTisLKAIaPwt3NtsD
	GZkWySP6Wo8WdY9HBznBmtgThLM8nlXh2JOtGyqvs00xHe43WXj6W63h/i++BRU7
	G0emyhDbQBI4nGcEHlUa+8LPa99MkKxDJWCgZCkNywbmx8MJTDIZUbNjj5KeaI73
	rWdwy/2e5gar1ph3t87b9E4qhlffyklB6YGJFIzcEP1PafGEk9MDQ607W7NnUieV
	xmjFH5xbe2uVKdpY/FJZuCtDFvaKacs4e3WMaOOvBQB7kOt8hTY73x5coOEnDGED
	VB9B1NQnnKipgswVjjHLqnfRJ2dVvXcIJ0rmQyLeztn2uGGiV6d/hs63MIA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubgrrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:47:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e818ca61bfso44967385ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793731665; x=1794336465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETmQNPch7+VQUvY9eYBohTQWDTkaLoeqazZ+zWLafZY=;
        b=TrIl1uomY2cLyYulq6LK59u5nY2DXKj4Afg++IALpQ8TBvBDZv+bm1xoxeyloe36yW
         vXxPxk0ReF3+0fyal2X+qwmHdxutvDO+vlISJ10luyZ5I9oWKGxMeAGytH+0u/QrDigR
         R2goBWHcirlDa+zcx6cH4oIsEzf8XLsqg+EC6lag0uyYmVYc/iQRfJSPTHcqvbbIOrsk
         E12/AhBruWRP1UqOaZWGTqxpuW3hfMNJCBuzY22fYPrAYG2qxakcyN5jNgpB/gPwgXfx
         dReyHNu+zseK49ngytUrp8lHtVUyjJA0lLV4s3HN4IP/X9v312Ftaqie8s3YVpOJAUon
         Nt4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731665; x=1794336465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ETmQNPch7+VQUvY9eYBohTQWDTkaLoeqazZ+zWLafZY=;
        b=0RnDa3uU0nQXjgcY2DXg8oIHuBq7lv2jO4rDhh9kpRu2ah/Gk31HXd/8pLA6/nKPhc
         3+df0Q2ZXqiluwxnHVO62QZPX8f1Nnja4ik37n6yYucD/dGjz9XBgdkJIuahlS4L11cT
         TW1rKivD69WlR4NJIjvzUyzVUvLNde0uswnXM66rcgsNnp1pHb1GBKCBxCKtXYmtVLK3
         CBe/2IiBg+87auenFrt7xTXsSylAh8tuBEjn6uamMm021e2IbpKflxkPrykaKiI0U9Po
         gdNIhNCKKz46HmmuXi47FZxf0lX/mlTgr+Yfq7Gr0v8Zo0Vdvh6Rb6+2Oh3u/bBwrWzJ
         vJ2A==
X-Forwarded-Encrypted: i=1; AKwUvBzBjhpuG0whnrnW4faNpo9FBeMGd9BDWne38swllpa0pB6x1RPTca952uMkBxPwQquDarqM/GZ0BCTYxeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TJ7IxHrm82XLK4nVEpHOYDuhcNyqECD5yMd1WGVdRlbCdbhd0
	bMZS7bM5Q9HIqHeD4N1EbUw64zYiSS79k88yzNfOAzhxprLN0FXDDfWkXwlp/XlE9rbfsrsU17e
	mJH5ov59laBKNLGsQjnwvnR+D7i7TuF8Fxj1byEv0cyVkDxICHcwRWz+Yi9Oc84j83Vg=
X-Gm-Gg: AYBFou2F0S7PuhmsJE4ZmFjL2N1k3qEwYFOAnM5ggs7weIxDPDj8JBD65KXXF22OJuV
	mUTmxcukIBmho1qIytk3YTrOZmaVBPHpP0X4l5ECvaFB0RFoN62DT5DnFMc2G78NSUbxrQ0JLzM
	NDwWXWumAIfIoCVo4mAhzte3bKS49ChgIfUOrApQgVB0OH7X7/+sjnqWj72iwWR7Ev794FB7xzZ
	2VRc2KCoTe3DEi6zn4/qiqxA62bhvy8okPtl+2bxSaraNS2mg83fmiJwwrVN1KQslD0O4nqRqTv
	5oKeAG8ecA8qbyl7OMLSyWGkR6PLOypZFtZ3MqGCijZurnRVWldJek5yfYm5N3dX69lniMvZfp5
	83Fo4585zjnzWtoUYAqvSnQheHfqycP8eoF+ZR53vnTz0cyv7HcupDPV1uKb3Jq8MKGAxgiEwtn
	2aE65S7P8TLY0m7R6FCvUJwVnp8pEjCLwNw0r3nW0MiPlYmuiB2NpEjr0nwi0=
X-Received: by 2002:a17:902:ce8f:b0:2e9:3a86:b987 with SMTP id d9443c01a7336-2eb364e7ad5mr118513405ad.51.1793731664956;
        Tue, 03 Nov 2026 10:47:44 -0800 (PST)
X-Received: by 2002:a17:902:ce8f:b0:2e9:3a86:b987 with SMTP id d9443c01a7336-2eb364e7ad5mr118513285ad.51.1793731664539;
        Tue, 03 Nov 2026 10:47:44 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392aa7bcsm44746595ad.67.2026.11.03.10.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:47:44 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 4/4] drm/msm: Inhibit IFPC for state snapshot
Date: Tue,  3 Nov 2026 10:47:10 -0800
Message-ID: <20261103184713.29664-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103184713.29664-1-robin.clark@oss.qualcomm.com>
References: <20261103184713.29664-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX/tiOsGG8stpg
 pU1F9vIl4yoG6tdi7Zh84GpSFHFw2TaU+Ah1RcQLScn0SCkH/m7iBon5g0DHkNj1X2EZW08o80O
 spGFQIcHf5SQSmUyYVmzgBNrhQnG/gs=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea2c51 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=jgQnFmZX3A3noQDnNKkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: urZU1zdW5PzVjTf8mu1Uf8dHqwqv9a2o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX23DZMWt3nfx6
 U1nVsBanPqcAFCjZYh4dZRz7T/vnhXMVSt2+UntAkryFOwGUTTO7PYtGlR8oHfpZGGjaJQLCXNA
 E48Jfp+136dREUhiGG9qokuJyUo6DhChj+tXVIpg/ltSjshCyGrY5SANfJqz7WMQWeS9ljfs7R4
 yUvTlzuPL8h8vnyFBJmgrdZPXqzHZvCWcQ+tCwzolnm2yNO7BrfAPjSHEHXABJlaoPtJ783YYAp
 q1L3CImPNeyRlkQwdj5DLd+thWJNDs6uEgBQbpSHRfvoAJv9oCTtbq363dKzH30YnDUI+m0v+xm
 ukabpkGM0h8XImGQLS1qRMkHEIPW/Md/rdajqjEN9RAKYZ7t39kG1FWfF+9X6VWiiiZ4KPflOXU
 jofNvmU6FbyyjtdgiuLBuslvAnwdxxdTGcm53bh+Ua5aiqFXFTlKNLUlkFjn2av8q33kOqoCt1k
 3S5QFZAMpYZZc9rNmww==
X-Proofpoint-ORIG-GUID: urZU1zdW5PzVjTf8mu1Uf8dHqwqv9a2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030074

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index aa59b28a3392..29209c23fcfa 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -81,6 +81,8 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 		return -ENOMEM;
 
 	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		guard(ifpc_disable)(gpu);
+
 		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
 			msm_gpu_hw_init(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
-- 
2.56.0

