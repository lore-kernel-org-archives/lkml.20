Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52483CEB84
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792207036; cv=none; b=iqy0dhLX2dCCiT6X1n2f7qCm1cRN3h+Oqas8HBt8TcuMOaiByKZgKX36+8ln7OediM6mrrYAyYOFOfDqXiy6OLTNIWDVmrrVDp5RfFacLKewlr7aj91lf22HtCzip72j01gwaBJWRe8Eq3Tn4YV7qpnsSS/Qgs6MxKUykr/BXGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792207036; c=relaxed/simple;
	bh=OYQMZJ4au6gfmi6/P8LwCt3iAJONz/e2288HxNvI0U8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QFapaad6PXNVskYGTiR+OSEaJxjs6jZB10xzMT0hMLtJttf5mbrYj4xUc746rnvUzrXE6vlpt4kGcoa0kOedGqhtTuKvn0oR28LNnajUhM59BLGfyzYJSNMJxyzA3FXyb5hALavnNJ5f+sWgncySztkb1niSpi1DlDETgUbqjnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kE6FSi/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKUwOZK9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kE6FSi/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKUwOZK9"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H30jwe3242891
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i8TdapB8D25ZNne6RzXRT88nnicJi6OUyrYWRSkLDSk=; b=kE6FSi/fvkSwtApF
	yw/BZbqCV8sE2jF7zviRCfSblQaNiODtOGclANl9MsgJ5jiqkfxx7Smy4nk0BhTV
	SWjd8a06En0o7a8EORDcuZTV1VhniONpeg0awDBPCv74VuV38Xb2z2q+AAqi+EuM
	9ry/LiczPe1u5/enT7IWROdFvf11u1GAwGnYRHIJj54fMcNvwCmOosF98FuP3u/f
	RlAkyjrpUslWwbMr9QivSe1mfdRiqi0MUceOeWvWbHlw7g3GeGxrpj5KbhgTGP4i
	GcvrMFJ7v7SK0fLkUZdSyjwxd14eXi3wRS0KzhBkfEXJvG1xhO+rqP0hcp6lW4/Y
	iTtEdg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v2xqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:17:10 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so1383822eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792207030; x=1792811830; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8TdapB8D25ZNne6RzXRT88nnicJi6OUyrYWRSkLDSk=;
        b=OKUwOZK9nOcgnkSqWxmTxdB9um/+K1xxYVZjSzS3et20nfQiL0+H8WnD2/Udyyu2kh
         3hzi9RL/qc2nMix0vkRPBvU+vXTWzB4uo6s3R8j0AWgWYPXyLfC5j29pwhBXLaRlCLi2
         JJCAsoiRvQvJsdkYV1fTXRgYzlE598EZoCHqvgqt7dHdxqhR1W3tsIBcrAF5uWrSJazE
         PC5Y28Zug6hIs8pzJHfGrJggulet1bT94VPpnloAY+/RYC1gKZpeI3bwZK7bINbMrZyO
         RoEadFDy+EgHxsBeVQF7l9Kon2UACax+kS6d7mCFxbgJK7Qae1sZlkRgGA1AtUli0D19
         gSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792207030; x=1792811830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i8TdapB8D25ZNne6RzXRT88nnicJi6OUyrYWRSkLDSk=;
        b=uUBWE6fApLSfCbRj3T6Sv0kcgbpe+L/D0Tv4wFPT5Oyx5x55w2xONWhZrFdygK6nf2
         jfG9/B1T+YkRpvPqJOLfN149Dl7cE/xgauZaGdDWKmzp7BdChDur2s5PZ10so7elObAr
         LpH3VK/AjnYkJP3Qkrxv1NWbh6xG+22hcWoD6ujqHYluiWJmWGFBEoBc/Vi8Y+vjGNVH
         EJJ5SFXgkxzm3/3VImtQ3+cnkqwtrYyB3U0QOIBQcgW1PtBY5Dkl87iADGNGeegIM8/b
         4Fle93y/ESNobA3ADwHO+0L5DvFGDKjHC9uQKiOcbXAVC6x2m3/8ISxFaI2nokXMrZz2
         hv/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxlSieHXAoYqiw+zNkI/KmIkFNnYgNoQC05B4RIiYszLwp1fEQ3khDZsyrBHLe7VVhBrjPL6y3xoIuqEIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs60u0SVdzLOfCt3TrD2J/KN7RkX1HPNJvUMQUR2QVliLJTrHs
	myUqy2tUbolz++Fftz8VtdHlt1SfYCdUkpo8YjlNnWPkoXhS9o9+tkGXNI48d/OY0bCq8anCwWG
	GJ6Px4rHIWi9VkZzGb3ID/Tc+E4KjK6W8jtmmP1te7M3Kkmo4iRzNxugdJ+hDDhbJ6cch7d5/7B
	M=
X-Gm-Gg: AYBFou3rAY9Cug062Nv8TBuZDqXBl6lexq5YSg1KjROBqAFpbrLuRK5I3hw+g9so5F/
	iONcEtB6IcDZb/cvSA9CrHzk7qFVBZeXMge9SG/ZS3cLOFDhgMaNHnuAHyjbOPMhZJ8xxMxjApO
	Y9DbVvFFIUxBiMij0iFw4Vtm9gqO1St+jfd4JAg4+2KtgjVFRWlZXibzPqj4LQDeasHeAQbvA3V
	+z5Clhe0frNk4Es3FbMXc9gQPPPycUCosucsX16NXNDcO9v80r2dwLHskQUyzdIVUyqgOs0Evi4
	rpmjTY3xQv4OKo9qJ2S3xDbcQVePQthM46bUtro4qXng3r2jZPRchXYSzMGUHHFgjxoy4coPC+l
	q9O/ex4fayfyzM8N4mrtjdni8pko4DOAijQ==
X-Received: by 2002:a05:7301:da84:b0:35d:3370:d8e7 with SMTP id 5a478bee46e88-3619ed12158mr2398650eec.2.1792207030095;
        Fri, 16 Oct 2026 20:17:10 -0700 (PDT)
X-Received: by 2002:a05:7301:da84:b0:35d:3370:d8e7 with SMTP id 5a478bee46e88-3619ed12158mr2398633eec.2.1792207029588;
        Fri, 16 Oct 2026 20:17:09 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm10969995eec.4.2026.10.16.20.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 20:17:09 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 08:46:19 +0530
Subject: [PATCH 3/3] media: iris: Fix use-after-free on unbind with open
 sessions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-iris-handle-unbind-v1-3-7809148eb90f@oss.qualcomm.com>
References: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
In-Reply-To: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792207006; l=4471;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=OYQMZJ4au6gfmi6/P8LwCt3iAJONz/e2288HxNvI0U8=;
 b=usT2uUP0d7gwok/WPw+UQLdyzrCHrG4/odwM0HCXAZlkDANRWSNCZNXM8lQ5gES1wuZhoeEFq
 n2gshReHGz/BTMmBZQKZEtlXveNOxthJzpSBLUdY7iQJ9/0Xy3c4QFs
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 38wU1VapQ_BUmJT1nnd1_vJHbRhq7VIp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAxMiBTYWx0ZWRfX1t4RZBbHmT2I
 tjqXcySJvoE3qy44hY/AiovicHCLzGeyke6Vjj2N6s5zlz/RX6obValBGJUjTVaOU3qoxP/KlzU
 1y6NG8vPGC/I2yx/SzESoNXLuxl9XW4=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad2e8b6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wKmruQRo9p3JesIawloA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAxMiBTYWx0ZWRfX0PLU6Jd/VcOm
 CSylB+NWmI4yvEZWEiCpaxHY1S58D3OaW3W8jfpFR25z3CDyxjyxZxtt0Gu7/Q28d8cLTbB7BDX
 BjprN3ZGLBIwGz1K6XqjVaRkPf6bl2Zj1wQbv/0FRo+B+/tNcwWb8tGcF+O9MeR40Xcwm8ALsCL
 q63VbArCruFA68r33liXt4CFR1e4WAwnxs9B3jBiPBXo1apMIfsNPzduHa23asb/RixDrwjpaa8
 R7/9oebapcBR33olE5E3Hwh6DiZkx6/XC0Lr7dELJCkkbemf7eoOFJwu7Ohyzckl1PCufIUiVEi
 3nZiqlPxVhi+gldO47WymBhfaVcHEuZjX/DzzvTfNJeXlpfuKHzoLKYAkfJJwnyc/yvYuRsc3yM
 hrPWV5ZL6uvRz/lLeiQKRJUztoyNYXUPWzcqnIM62DKIEVmpWoCHt0Qqw4rPZ90clCHkcOriLPH
 kFFinWpdHr1oSn3GeqA==
X-Proofpoint-ORIG-GUID: 38wU1VapQ_BUmJT1nnd1_vJHbRhq7VIp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170012

The driver unbind can be triggered through sysfs while a client has a
video session running. The devm resources will be freed when the unbind
completes. That leads to use after free for the running sessions.

Keep the memory of the core and its device allocated until the last
file descriptor is closed. Stop new sessions as soon as the removal
starts. Make sure the interrupt thread cannot run on the core after it
is freed.

Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 56 +++++++++++++++++++--------
 1 file changed, 40 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 4cb678bd56f0..25876957381b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -243,6 +243,15 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
 	return ret;
 }
 
+static void iris_core_release(struct v4l2_device *v4l2_dev)
+{
+	struct iris_core *core = container_of(v4l2_dev, struct iris_core, v4l2_dev);
+
+	mutex_destroy(&core->lock);
+	put_device(core->dev);
+	kfree(core);
+}
+
 static void iris_remove(struct platform_device *pdev)
 {
 	struct iris_core *core;
@@ -251,18 +260,20 @@ static void iris_remove(struct platform_device *pdev)
 	if (!core)
 		return;
 
+	video_unregister_device(core->vdev_dec);
+	video_unregister_device(core->vdev_enc);
+
 	disable_delayed_work_sync(&core->sys_error_handler);
 
 	iris_core_deinit(core);
 
-	video_unregister_device(core->vdev_dec);
-	video_unregister_device(core->vdev_enc);
+	devm_free_irq(core->dev, core->irq, core);
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
 	iris_unreserve_iova_region(core->dev, core->iova_state);
 
-	mutex_destroy(&core->lock);
+	v4l2_device_put(&core->v4l2_dev);
 }
 
 static void iris_sys_error_handler(struct work_struct *work)
@@ -281,53 +292,64 @@ static int iris_probe(struct platform_device *pdev)
 	u64 dma_mask;
 	int ret;
 
-	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	core = kzalloc_obj(*core);
 	if (!core)
 		return -ENOMEM;
-	core->dev = dev;
+	core->dev = get_device(dev);
+
+	core->v4l2_dev.release = iris_core_release;
+	kref_init(&core->v4l2_dev.ref);
 
 	core->state = IRIS_CORE_DEINIT;
 	mutex_init(&core->lock);
 	init_completion(&core->core_init_done);
 
 	core->response_packet = devm_kzalloc(core->dev, IFACEQ_CORE_PKT_SIZE, GFP_KERNEL);
-	if (!core->response_packet)
-		return -ENOMEM;
+	if (!core->response_packet) {
+		ret = -ENOMEM;
+		goto err_put_core;
+	}
 
 	INIT_LIST_HEAD(&core->instances);
 	INIT_DELAYED_WORK(&core->sys_error_handler, iris_sys_error_handler);
 
 	core->reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(core->reg_base))
-		return PTR_ERR(core->reg_base);
+	if (IS_ERR(core->reg_base)) {
+		ret = PTR_ERR(core->reg_base);
+		goto err_put_core;
+	}
 
 	core->irq = platform_get_irq(pdev, 0);
-	if (core->irq < 0)
-		return core->irq;
+	if (core->irq < 0) {
+		ret = core->irq;
+		goto err_put_core;
+	}
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 
 	core->ubwc_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(core->ubwc_cfg))
-		return PTR_ERR(core->ubwc_cfg);
+	if (IS_ERR(core->ubwc_cfg)) {
+		ret = PTR_ERR(core->ubwc_cfg);
+		goto err_put_core;
+	}
 
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
 					iris_hfi_isr_handler,
 					IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 					"iris", core);
 	if (ret)
-		return ret;
+		goto err_put_core;
 
 	iris_init_ops(core);
 
 	ret = iris_init_resources(core);
 	if (ret)
-		return ret;
+		goto err_put_core;
 
 	ret = iris_reserve_iova_region(dev, &core->iova_state, IRIS_NP_RESERVE_IOVA_START,
 				       IRIS_NP_RESERVE_IOVA_SIZE);
 	if (ret)
-		return ret;
+		goto err_put_core;
 
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
@@ -368,6 +390,8 @@ static int iris_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&core->v4l2_dev);
 err_unresv_iova_region:
 	iris_unreserve_iova_region(dev, core->iova_state);
+err_put_core:
+	v4l2_device_put(&core->v4l2_dev);
 
 	return ret;
 }

-- 
2.34.1

