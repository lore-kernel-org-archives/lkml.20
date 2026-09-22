Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C1C552930
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087171; cv=none; b=jE8pJQXAiMS/06wm/Aj07rvjUBfuxa9Jh8JLDBLlIAAvT1TaVVarE9PkyXeAs3vSwjZSjiDe79dBKepWplxKg3WdOHLRi+AVJAU0OrmAWAfyvgBCbPyF9pws0/AxuoXnZJ+LJl+utplxCY/m/s/IJN7cOAjBeSmIP1tJ58aoZ4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087171; c=relaxed/simple;
	bh=co3KpfoXOkXb/GRzLv0HTKkjb6m7GSuIDVBu/y3ylZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rEWB72/WR/3idFjhqkRLCvATPm/oDZjjnZB2eMQx9UEXvU3OZCVU9aAkc476qKU0CYKNfEnie4Q90gNb3/PNjO/dt/QnuVknNM/j3EZz8r/l34L3Bv8f6Ke6mZG9oM0+ptUStGi2juzFgaQT33Q1YZyQXO9yMUhIhdKWW3KdIEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9TXE5IL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EbQ9PYDi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9TXE5IL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EbQ9PYDi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPrsu4078627
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3JmyIY24F8C8IjLYIdjk2C
	cyA3Gv3yLu4dprwtaTmUc=; b=L9TXE5ILrGfghJtT4xEjVDZ46ThrZG6E4LZKJz
	Qb111RfWQjBnUPu1kmmUBt8H+rSY27YEHBr6P3DQDl87g1khKR1btm4ffVHcjV1V
	2znmQ9mWEqHxP110CFao8fBrQlMWhp3fTDab5mHygGwsEUVpQTEx19DPLuQC8OZe
	koc2+2klIQ75MAbl0rMj0i1Y8WyRS/sXMa6NSFZauEwlxBPaU1NQEr5y1MsNawfo
	UpIfW9oe2PDG9IUi48OBeP7Gru+Bva854pKjcGqvvJD0WcnRUZlhN1HetxxUouiX
	QhmfB19BwKfz9wSzAMf9JOdTgcGGFZsUPzLzsPgG+QCj9O/Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqhhf1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:26:08 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c830ea02d3so3553034e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790087168; x=1790691968; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3JmyIY24F8C8IjLYIdjk2CcyA3Gv3yLu4dprwtaTmUc=;
        b=EbQ9PYDi5h/nXnnwVjfs78vHHtjx129fIKqvNGwGNdDD50aE3o4o67Y4Y71yEF4Wq2
         SPEngETQg7C+BfLIO1Am9nrW2gq/F98IbRdBaMmA+dHLvmwCSJ9itJ622iDavT7luW8y
         kuJ7ATHqHKTwhNXj/donF+Nug8aC6rawQvfyloCaPg/UtOeIzBK63UyDrngceU+UEPBY
         dsExdC0uy0WhPchM4DQtjMHGA+bsYq48PhGTETCjw53E94KbeT8AVwH8bhiVdcT5iGef
         HE6WojMhpmhlIRcaslpNv6g92/saUz9yp6TXh2ERWo3YsYEx7Q81qrI7bbIyziji4Pq5
         6bGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087168; x=1790691968;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3JmyIY24F8C8IjLYIdjk2CcyA3Gv3yLu4dprwtaTmUc=;
        b=JuWqpvcx6dS3pDCf4qxIMpbx25hYvwUSzzDiurjGpWtFcTLE3OobdEmg9oZ8w1BcQ7
         30d8/QoE2rmbBPJt6Hg0a5ssrDLv/O57zoRzRxWOwVkBP6yBLYKkFhnJKT1TXCPyCRMb
         rBuQ4ZhiAQmo3UDOzKaNpP5BFl/mlJ9nXdSYojdSQa1EHrxRdbmkX12VOd+fOoXT4KJn
         om+9Jq/ussbKj9IFcCMA5WzO961Ct7bMbV3c/XhaZvN0iPimkzF4Z7SQGTA8dGQdsNU/
         zod+YMwm6MureFFU6rXr662Dm0nYnxKf5asUZCAHxcrFBqzL1Ih2t8R8ALXB14/rbdpE
         7TYw==
X-Forwarded-Encrypted: i=1; AKwUvBw3Xj/bsmyg/KCuQeEuhBV7T2C9aon6ghddqCd5Fv3H7FcOlkAArtCvw6GJXtBrQEOHOU91b2oq2yW3Hfs=@vger.kernel.org
X-Gm-Message-State: AFuF++nkqFXb0kbAOQ1KMqaLKYtHRjJs5Bb2K0Ktn5BVk+xifv9a+MgI
	/RVKUdncKPHkHAzvyVeodoAIl9kdxbAEPxtZNzQwiqH8kMc2QUb6oEO2/+UJDfUlOtaIoMailsw
	4B77TfKqIe4kWa7YS8BfCZ+Lv+Y2orqyhjGFixFVDqH+GKQIH8zVYTV14HdbmHtR68G8=
X-Gm-Gg: AYBFou1nwSS95zWJ5KQi94IjmUpMcs8ikryNbu74D6pfkYWITLUw8edJUyVUtTMiV9m
	X9WlkyZvXmJov1FgEV4x9P2b4yXveBkLseEM6E4Km8vL2Sp3Uv3XZ/libp+ESSHzH1iF5+SM24l
	tM6+FVAlSY6moC+NuJm+IR4r9GRBxbsQSth+FRM8qJceIoP2eHY1KaK8Jbf7l4dsCHzXGJgl8XG
	ZgYN21hm2EwhtDfvR5urc9quTqIZEhaQjRC2hCZJSCsBpqR4RkOsV03tHDfN5pO/Bzwp8wxLKWz
	rEHRwh7lXEI1kIN4X06OP0QJs6CdM/4O6JBRbEzGiZ39rPxjKLy1GEErAPG8a+QpP6TW4PtC5BD
	8oIZB1o71oeu4Ra5GGVv32YNfnnY=
X-Received: by 2002:a05:6122:54d:b0:5c9:c60e:5cf6 with SMTP id 71dfb90a1353d-5c9c60e60e2mr7043213e0c.20.1790087167827;
        Tue, 22 Sep 2026 07:26:07 -0700 (PDT)
X-Received: by 2002:a05:6122:54d:b0:5c9:c60e:5cf6 with SMTP id 71dfb90a1353d-5c9c60e60e2mr7043154e0c.20.1790087167349;
        Tue, 22 Sep 2026 07:26:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d688asm614388e87.41.2026.09.22.07.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:26:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:25:55 +0200
Subject: [PATCH] drm/xe/i2c: use device_create_managed_software_node()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-xe-i2c-reapply-swnode-unreg-v1-1-1bdda5d44701@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPKPsmoC/x3MywqDMBBG4VeRWTuggynaVyku1PzagRLDhHpBf
 PeGLr+zOBclmCLRs7jIsGnSNWTUZUHTewgLWH02SSWPqhPhIxeZ2DDE+Dk57WH14G8wLNyibkf
 XiGu6mfIhGmY9/vdXf98/XF2JlG0AAAA=
X-Change-ID: 20260922-xe-i2c-reapply-swnode-unreg-8e18b542549f
To: Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        brgl@kernel.org
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3382;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=co3KpfoXOkXb/GRzLv0HTKkjb6m7GSuIDVBu/y3ylZs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqso/3M9Q1bwkAONX0kl1pQtLkBocI0y7XUIR+s
 JeDqG1uqXWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarKP9wAKCRAFnS7L/zaE
 w8kRD/4w51oJV/PMNpaz/cY99CqRk6WnZW/zyXjeHh3A+QbmnwZ3iRJjyrxrCo5GaN1HUHbcmg3
 ncI1ahrXVIKpzsnyheuO3Je6kurUYMjhWTVrSmbsECulli8banZTbxwXVlPqsw3azIQaQazKpX5
 PBtOYC4fqXsiLJJw6UqSDw1uTt5b4WY/7F9zqyzVN5mt/KwNZfIrp6xqVrs41Ua9968RNi71KoC
 Yfjufhegd0zskwkOoMy8UEDeqJVRya4l91kxnaYdJCJFnavE4+G30cHGVh4vbPWnHzwKN7ooM5K
 ZUPkiYWJjmC5J+ckMFvc+tXMFnBGAGZFjzEKZCKK5GlQ74CgdDFKtzdyYUsWMy9JtZoETgPmKNY
 L0thHzQ5+QC56u4OVnVXpnv+muWWaXMG/wkOW4VxwtGNOXL57g7tAHpuIMpj+3JDVps7y0aKtnZ
 VH3hvoTWM2UonrN0rGW/f0xugJHc3lIvhq2jDUsKmj9MGm87My27zN+5a/VXq0fUzuepvo6dtzb
 sDk7fi05AewueXZh8DxYlX3AS3mroloCBRUtJ/QL/9E82YiIZa/YX7dgWap+SetEDOugWPwEh7X
 OlKp1K07+V/02gX03ulPC5iGGtj4ddea4zgqKL0P4FNSYzGQUO9D5/s0GE0Eq6uaFf2X8WYwvwr
 PKjY17MBC8f3bxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxMCBTYWx0ZWRfX6TC/ypS1o8qz
 3xndzAZFWdqCBWXzVC3chzcJpbluHKCLXt5VyVAC1EXCnKHeu+NxeNR7jCpZWPWvvjqrVpzpHLB
 qG6XwidsQ8d2IBJFmAeisHUrgEJPCOBl+XX035+kOv5Br5coxclFqapv58kCKKIvY8ywEcIHFCF
 v4ajmOgTHfYiap5D9rSjLZmRwip0OF80iEzz/WsHaTbWYy760VsikElKMEVt0ENUlFUouHRI8lw
 WgYHkQteWASG74ANNHxIWdQfRUVp1YCSTqM388pWJi08Dhl+LLJTeBXSkis9sFDstvWKSEchxS2
 jNy9vCieYpvtJ9fVBBWXsQWsDKt1nejfxqYmygQcuNgPL7X8BMIlMEMNpim8HLqZIUXLYnGL5nd
 uRR+1sqieSoox72+ZouG3qu7ZW9BUPmBuNSGPPCQUvbM2QwzOnvWrao5Sj5BRS09++kFGubzLY2
 BXGvgSq8TZez1KxUpfA==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab29000 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=cHgwpQrU5eHkzXlFMnEA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: WCFjrLhMYPxa9_N66GMj5gpuTSorVRY-
X-Proofpoint-GUID: WCFjrLhMYPxa9_N66GMj5gpuTSorVRY-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxMCBTYWx0ZWRfXye9O/yb3UHTZ
 xhZeQ65htiZzj8ulWDba5vKo74jtFG8i7ks6svdNtZJkpVR1YDs6UxhDVmaVUyjHFg+0JDiL4Ru
 QQku1v3vC+dKSPjplZHY/O8Xaerml+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220210

This driver intentionally uses the fine-grained approach to creating
platform devices. It assigns a software node as the primary firmware
node of the device it creates. Ahead of improving the reference counting
of platform device software nodes, switch to using
device_create_managed_software_node(). This way, we create a dynamic
software node whose life-time is tied to the device to which it's
assigned.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
This patch exists in mainline as commit fc90ce2d ("drm/xe/i2c: use
device_create_managed_software_node()") but the code got silently
overwritten by merge commit cc467969646b ("Merge drm/drm-next into
drm-xe-next"). It should be reapplied.
---
 drivers/gpu/drm/xe/xe_i2c.c | 22 ++++++++--------------
 drivers/gpu/drm/xe/xe_i2c.h |  1 -
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 51ca9fb73b708317c5dd8613d0ba060b8dc2028e..f4f3819882897f7f19a7bd3043a936e3c7eec553 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -111,14 +111,9 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 {
 	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
 	struct platform_device *pdev;
-	struct fwnode_handle *fwnode;
 	int ret;
 	u32 id;
 
-	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
-	if (IS_ERR(fwnode))
-		return PTR_ERR(fwnode);
-
 	id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
 
 	/*
@@ -128,14 +123,16 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	 * platform_device_register_full() is done.
 	 */
 	pdev = platform_device_alloc(adapter_name, id);
-	if (!pdev) {
-		ret = -ENOMEM;
-		goto err_fwnode_remove;
-	}
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = device_create_managed_software_node(&pdev->dev,
+						  xe_i2c_adapter_properties,
+						  NULL);
+	if (ret)
+		goto err_pdev_put;
 
 	pdev->dev.parent = i2c->drm_dev;
-	pdev->dev.fwnode = fwnode;
-	i2c->adapter_node = fwnode;
 	i2c->pdev = pdev;
 
 	ret = platform_device_add(pdev);
@@ -146,8 +143,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 
 err_pdev_put:
 	platform_device_put(pdev);
-err_fwnode_remove:
-	fwnode_remove_software_node(fwnode);
 
 	return ret;
 }
@@ -155,7 +150,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
 {
 	platform_device_unregister(i2c->pdev);
-	fwnode_remove_software_node(i2c->adapter_node);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
index d63adacfefe71b3ae695987f104f978959a7e2c5..5969054a6b6b3f184857defd4ad3f6489f05aca0 100644
--- a/drivers/gpu/drm/xe/xe_i2c.h
+++ b/drivers/gpu/drm/xe/xe_i2c.h
@@ -33,7 +33,6 @@ struct xe_i2c_endpoint {
 };
 
 struct xe_i2c {
-	struct fwnode_handle *adapter_node;
 	struct platform_device *pdev;
 	struct i2c_adapter *adapter;
 	struct i2c_client *client[XE_I2C_MAX_CLIENTS];

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
change-id: 20260922-xe-i2c-reapply-swnode-unreg-8e18b542549f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

