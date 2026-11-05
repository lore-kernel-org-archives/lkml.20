Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896932;
	b=XxFgjJ1McrXyDMO63w7GygKkQK4eDtoJXSzMAjsRPtUSKhhHp5vnn/z/YBK1w38muhy7
	 MfSBV+HKecI/Fwy6rQZEjDNDyOJxr500bvDl8inD7D1BKB5SJLqcTxe6n9ohWeNqfgLtr
	 15SQQqXCpYbqBlXEWO1aNSZTxgrzumb6Hxgz5Kv+qc3HIzzRBWg/698ANE1L86FkAXUWJ
	 iJCFgCDamTxXgNEvyRVjceT0W4uyA5PJQQ7HIqeirF86ByO0Ka+J6Uzwwa1d1iE1GO+0M
	 +csLMxlw3IRsDtXOu71mVyJfcLtAxJWG2KemUj1LzAey4t9/IZtI4K0k24eo2BmJrNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h1E34adikNaIe65XlAHTCNCokzVVPjH+sMqHX//xLDE=;
	b=3idfJNbV/Wny4SBJSHb9z3SjlcNP315a+M+RXuloxQme87pY4kn5gxvdHIOijPfq9o/I
	 hpGnKe3q7GmxN0kXSkvcyTxU4oY8rUO8BBvRx9vwEq9wRuSReImcAE6rODhbtF2fJq7Qz
	 j+HNUodHiopt1s2cLr7OP3ACypQZFgfBkOAZu5NIvLbvsZXtabFk+mhFIOa538w1JnXWG
	 63EuMoPdhnJfTURnZeJB5gGkozi+NXf3qS65j7lJXHGQ+jDlsKpBW7dYBLj1/kdKPnUMO
	 2guq7dKWtvIphzzgDk9G0GI7cambqiaL6ZZKIm9UBUINRXGIhm/yInTQt5d+K42p+tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fa4ezJoo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cG0MEJxT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E4606EE95
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 810E4606EE95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fa4ezJoo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cG0MEJxT
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ8fd094480
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 16:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h1E34adikNa
	Ie65XlAHTCNCokzVVPjH+sMqHX//xLDE=; b=Fa4ezJoofXYv4uwrpbYcnxjMvVU
	TUmebyWvk6cx+TREqzIKnFIMyhSZJ5tq8xf0CHoMus/ND4DG+EJB/qV/kuo2ncXa
	vAPcTQLtXXfKViNrmJklKJKacPStrxmqBvos81TSKuw7OMjEqQNaPwRoQKzTuGOb
	PKRYLlYBkPIPsTUo6zpeYKQjxP6/I2h38QANjgoSzEYWJGOcdapRZ3d0dd9gLL/X
	Mmk7uCPxh3tP0XaQuoMmIf8dd7J8XrP911CEYxRTd7SvrEcLUqQKc1Ar81I7VDSg
	+IP7YMAuaSvEOKoIz6Z1Evu6Ydru+tohtFhOouLTQYlJqLe8v1mubbA510g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43k5hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:42:11 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdaf3f2a58aso615511a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793896931; x=1794501731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1E34adikNaIe65XlAHTCNCokzVVPjH+sMqHX//xLDE=;
        b=cG0MEJxTpnOQSZ+Q/Cx4v1Rngq8ZGqCfFSAU0/PaRzvgP7RPMVonoE3KEjCJIllNXA
         ueLDM/q+EncPfU4zQBHjP/PMJKaa7Fm4wbhhaLpqqclcVH8Ien/a7/lQMLLp3ol+EF73
         IPldYda9kFhiOp/AZtDl07RkmihN9h98uP/0DmYvi6WySafIvRbvGq6Ia+HiHfvYQ14a
         E/VDmQhuxtdKMONRRThCYtkP1se0tsWICVtr56HM5YeHuDT65JGKYNz6+6L5eFb2oAqm
         04eVkZ9hzFOp+/uXWodPogwjEnQ6bdFtMU2FgQYgUJ26yRNN1rNp5dt6zfxRqFIyt/PN
         6IAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896931; x=1794501731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1E34adikNaIe65XlAHTCNCokzVVPjH+sMqHX//xLDE=;
        b=DzJ+H5dXgS30D804J1rZW8MOi9LTGfTxcATaaN6xionrdp7N4VehJH+y7SYplgDskS
         A6XgQa/p1n7hYdaXkG0vnkwXze6YGRUUzDISCvd4Aj9N9O1P5yHJ/6drPMRGTvSWIpji
         UR8Atxco+pXIoP2gnCaifdYrES8dUCkgRCWQQ6NidB++WcgWMkY56b1+V8xIwASfA1fU
         dK1qkkB51GZyeqqr6OiCt8bux8HR4hJAYy42MPCetsMnIxyu2krYS+eS07f058rQuDmm
         EnjOYCiQeiCVHjkcYZa/UHTaCWSrXD/kNOmihQ9Goo7wDihfZn5NTZM9fkoYQgG7rbdv
         nQwA==
X-Forwarded-Encrypted: i=1; AKwUvByPZV6jk/NXVeW9MXl+9L3yET+2t2WGaLe69qhecjnDM8Mw8GMQgjljdLLM3Q9ecLwCwQtc3LvSLRxhHW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RP3UPRKpgS/P5pON7veuOVqpwU2HupclYKQSYFtNE5gHHTlLa
	EQarvszqqwGteVwl5yNmO2fer72LXc3RSZxw9/NL8qoIvfuDkA282VojGGvdRmgR847cUTsaL/B
	WDsBw8nZd6dgeEVI5HJHDfN9uGfExKn/fufUXXjPBH0Eo6ifq12Cv+qfx99wXH1iBRe4=
X-Gm-Gg: AYBFou02vRAsEbFEE40jogXeZT1h8/efowBU9/JzPqAK7MlRA4ADnRYXGTaVgJz6SsO
	DH9YE5N8PK0yjTy8zcoCLy7j4pXVCbaQB8U+hpiIsQu4KMF6Kb1yHOQJF5lxM2X4hPKe6WVRzjf
	KDcNu5ZnhYjiu8ZGhGcFh8gLB0eN7bkMd/jAtpIFcj9vJpBNkw9wuyqzAwiMzGRQXRlCHm1QjgK
	i+glPQ7Imi6uJ8/T1NDVQ/JEI/Ln3WEQz4s26fk794z6W83Uu1HYI5aMx4bytTGws3X5shYY7sb
	kkxIHPIPT2vnvgCX7z4Y9hOZO/gnbUsd3JkF+M0STAL4kKazJyvgx8u94rmbA9s3ZTwl1z5Y+L6
	SBHP6rUzD78uFK1rEnF5ArkzqElcUI+JmnMX8/whD4dcJdYwCQ67QEUVP3sAG5uoYc1aB6oEH9W
	5i7rsUAzogEMPSRWOz5wjQLspkKJxH/enGFQAUezNlVO89B4Du+duQ6kU39+J5
X-Received: by 2002:a17:90b:388a:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b0afd9a13cmr1869219a91.43.1793896931124;
        Thu, 05 Nov 2026 08:42:11 -0800 (PST)
X-Received: by 2002:a17:90b:388a:b0:3b0:a413:dd8e with SMTP id 98e67ed59e1d1-3b0afd9a13cmr1869182a91.43.1793896930563;
        Thu, 05 Nov 2026 08:42:10 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094ce9f65sm5088572a91.1.2026.11.05.08.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:42:10 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 5/6] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Thu,  5 Nov 2026 08:41:52 -0800
Message-ID: <20261105164158.23263-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
References: <20261105164158.23263-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: fgbut9i2Yz_R6InWdnZsIHkxnGXLdKa5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfX7gvxxJOS/ZFY
 a4J7yIMATMzO9Dlgx9N7UWZ5jIxTn5PQ493v7vvMPAt4q1kmo7onIxSOv6DO6O6z8B3JP3W5Q72
 VOnS9zWX9NgVBNZLsd7d11oIchVyuHkOZTK9BdMFJby2OO2NRDiPCs/lMDC9J26S2++bZk2cVL1
 kSx1DJQqeqmQVLazIu6FPt5tuAfzX7uL3qos/IAAbkW67pGI6tI/p6OyyRLjC5xXheXyq32cK6q
 Je3WenjqhuIEsuWNzHwIU9b+l7PuhzhmXzfSmMD9SE8tBUTnbIqJnFkKvwjhEbQoATgqL8VhLPc
 V1QqE7jlFPWU4X6DvHbIOFo+eoRm0eKy4H/AjW4CcO4fbOPCJa8JedMR4asWRgQctqrN/JBw+As
 SdStuMZEQRVqQH1Ira6qArjhfbVfGx9QKIaH6b7LP0NufypTTuPHwldiRQU9hcGE8DW6+LSOfCS
 WnmEq8vayIXShLbGL6g==
X-Proofpoint-GUID: fgbut9i2Yz_R6InWdnZsIHkxnGXLdKa5
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aecb1e3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2NiBTYWx0ZWRfXztQNWBTM85ei
 D6VMgTu6lN5nnrpnk+KPJjz+tyLBLgRLMNzG/y5F7dmlHZGTWtRSDqjElBkU7M5gk8Dbe/n1lrH
 3LqGDV27+t74IR6w1FKZHWZy4Cv2l54=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050066

Use scoped_guard/etc to simplify the error paths.

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index d05307bfa123..98f67b7aab66 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -70,43 +70,36 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	struct drm_device *dev = inode->i_private;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct msm_gpu *gpu = priv->gpu;
-	struct msm_gpu_show_priv *show_priv;
 	int ret;
 
 	if (!gpu || !gpu->funcs->gpu_state_get)
 		return -ENODEV;
 
-	show_priv = kmalloc_obj(*show_priv);
+	struct msm_gpu_show_priv *show_priv __free(kfree)
+		= kmalloc_obj(*show_priv);
 	if (!show_priv)
 		return -ENOMEM;
 
-	ret = mutex_lock_interruptible(&gpu->lock);
-	if (ret)
-		goto free_priv;
-
-	pm_runtime_get_sync(&gpu->pdev->dev);
-	msm_gpu_hw_init(gpu);
-	show_priv->state = gpu->funcs->gpu_state_get(gpu);
-	pm_runtime_put_sync(&gpu->pdev->dev);
-
-	mutex_unlock(&gpu->lock);
+	scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
+		scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+			msm_gpu_hw_init(gpu);
+			show_priv->state = gpu->funcs->gpu_state_get(gpu);
+		}
+	}
 
 	if (IS_ERR(show_priv->state)) {
-		ret = PTR_ERR(show_priv->state);
-		goto free_priv;
+		return PTR_ERR(show_priv->state);
 	}
 
 	show_priv->dev = dev;
 
 	ret = single_open(file, msm_gpu_show, show_priv);
 	if (ret)
-		goto free_priv;
+		return ret;
 
-	return 0;
+	retain_and_null_ptr(show_priv);
 
-free_priv:
-	kfree(show_priv);
-	return ret;
+	return 0;
 }
 
 static const struct file_operations msm_gpu_fops = {
-- 
2.56.0

