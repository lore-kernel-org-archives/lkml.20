Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731666;
	b=iygPNSGZPsCXUOxYLp3h8U1b+UMrJ13l+MrtCNzTz7pvxJosuDn+Gx/mbAtM+dRj5osh
	 pxRXN9iO2eicQKt4N5M6wKtplwaCV7cga/eqaQCYxv65O81z0Bz1AfopbI3TvKP29do/Z
	 QbnUm3nyk06vHojl6OO1ijsei7PCyvrRJw1ECZMbFtK0zHfw3ixknBnBzmzUztqY6WaE7
	 aLX4zpsiXBN+RsfA7hi7HiVPU7TZQmejtaFoR3Qbs0oeVQ6m0N5k/s8Y6AQwXmoKgGYGQ
	 SlKFG5HrAxgYEWRmzO3sl/DxmtxOKhGtqJCoFnXMBuUqd6/2rXfm5JVOVij464G6KkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9R7AOWcFK2O6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=;
	b=hBnQFQBIbolTYVDLAKMMz8gunzecGuLml3GarRi0+Tl4NE770qV/9GqGFUQySX+2QggL
	 E3eVT53Fdt1HuOut3TB6s2atR6jK7LaCKDX5XSuEBSHI+P5FbmLraZ4Oni8YC+ODfXtT0
	 xaIfH5iikxBTIYFzXeMl+sPdrfoJNAb2cfW5APM3kGD5QZy57GB9AG9+F4kU+Eftg0qvu
	 WLwFF9WvADDGUc5OIhytiJPcXajHxu7bUMkzSjAgmcWjcFA45M91j+twJYv2ITlpBXRue
	 HSp3cmpmmMpcW/yWDA4+LBVjBxmLJv2t6qVmVCPqw+rbpYnUxrLuGgjInbPU6St7o4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PVWQkSSZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WGSBekiB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1730606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1730606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PVWQkSSZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WGSBekiB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3IZ9SS3666384
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 18:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9R7AOWcFK2O
	6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=; b=PVWQkSSZJC/z/n6VAMha+F5P5v2
	erT/O5hJQqURWiLGhRQk8VDBQv0dt8HHZ+RYzBYDmYqSAx2IRX0SHBUEnJCXalal
	ufJp5Rsy8yV23iLQGE/yrjSe1BcFm26MyPazDhrduGi1EmGBR7SCCBMmKLijVsgs
	tFRuUnXBZTtPQf8JqWhu6wDducHPrm+9QZ1GGiw2YMMaWFBEmAB9oct3aVs30qjr
	xtBnXYwsx5Xcu0rOK58p7Dft16GRojHfj7dtI4IuuZOk5McR178zEFitaW1NhH9M
	tKVUzezFSKRQPvFSXeKuslkCtR1NyfNgatOsI/alDbQyn1LNfY7mh7KHpRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqjubgrre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:47:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2eaf3f829b3so45193205ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:47:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793731663; x=1794336463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R7AOWcFK2O6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=;
        b=WGSBekiBTdx/fz/vKMkp68TWFVACKl4qIS8JFs5OCgynAZHlDg7HNWIwKDRDGSLuT0
         ROWcxM5Y5YvYe00A2iTN/e2w/6jK7vjQbpFsfvzo0wHCKOEFUTayWqG6WjETTm/vQsgm
         rNp/dNtWAk0eggIWb7pEYbZfUyO6V00OiRNnApfOeMmkuZa5lbpoxJlRzEGXG4m4dcem
         OQOXovAraw2IMCo7aiRtTUv2eEXsLatCHWNSqyAH9uM6T4MBNY5nVkOl0KyOCjvLI6+n
         +WccuK5gvgkewOVI7GSW0L7T66KNj1Kq5M45VNkQ7tVZ/ZWbnTyAfGMFZQMeGKi1IMEb
         H07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731663; x=1794336463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9R7AOWcFK2O6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=;
        b=teBNlZZOods2N+sG+o9TiZnaLWhvhoaKW4tIl1wshz/cRJcjyAMWq6Y12nDhjklfy2
         1+Hl425JF7kz4Qwl58hywgj6/mXXKW6BcnlaeI91Xew70GkXk8pqX4l/DhBWK8a7ccyO
         RTb5oocCnLWQqyEgx0fVJt3NJ9qx3EE+yaQWApYAP6bt7Z81Q5Rfigm+PwYk0TL/36cP
         uB2WmleenizN0nrz2rqrNmv6iHRSwn1NcyqFMAIWy3exV0N7eQHJHEaLqUevYjt0/di8
         UGLNLBSdIwTc4Ga31WYzLnv/hv5bWxlY3iPvis60FR1Y9GCblLLBwIEixvtsJkTYAbYd
         Z7ZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxm+48At6kqg3IzmBqwSf8chReLvvz82bfhJuYZQ+A+655NrgdWgjrSmEXtNWr6q+Ru9ZAPTWwaulhOiyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z80Fta6BVaE4TXqPQM1mh1RCw10oDWH9rre98r1lfSKpIyHGX4C
	DhW3rJUrJldE5avCOD96Aeqa57f4BkWovaUbMPQkjv5cooaRkqf32MjYBXXSiv2Vs1k5lRk9uC/
	8I2UAVqddHFwnVCUbRQjjhsNONDi7xTZp4dMw2/3PYM9vfqW0MJ5SzXUe8raGHrGVFsU=
X-Gm-Gg: AYBFou1HYCufMS7oRFmHLBO2yJCvbQo7IxCIeHL67ApQOYVGWDl3zduvAyhY6uSa4D4
	Bv1hnVavLTqzCs12y5I6IOCkqW14fis1O65pEn/3mqS+yRnzGbzXiXhmBykMd2aU3ne8UC1n2rD
	Y2rtsEKf3ovjrIcUD5B0zINV+oAlfWrFZy851Dl+FXks9WIW84RCM5AIvxEJ2VmfdTTeXjcivQk
	WhbL2oulCmpwkucj2F7uZCt8p4SsVNmHo0rorZ+6KUsgtdYnWqVNu1+ttl4UoZr7s4BOKne8mdx
	bnvdMOgMwM0C0LNOZXzGHhsuknwkeZ7m/cFcBDOUyBPoWLeWZ36ptmpAkIE77aJzYy39omZACxC
	M4GPJESLDMc8FF5AwyNlnW0b1QXAzoP8i3AVE5Jz2cyN6D30Cl8neeVN63p8PKlRKK7PqiLfHdc
	8hOGjGVN4i/Yg/VORF2iOnguojry2ucax04F47Ke1AAxoq+ckTz6hFzCrTaw==
X-Received: by 2002:a17:903:1b47:b0:2e9:6788:9381 with SMTP id d9443c01a7336-2eb36396895mr125207595ad.7.1793731663356;
        Tue, 03 Nov 2026 10:47:43 -0800 (PST)
X-Received: by 2002:a17:903:1b47:b0:2e9:6788:9381 with SMTP id d9443c01a7336-2eb36396895mr125207415ad.7.1793731662914;
        Tue, 03 Nov 2026 10:47:42 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3922f5fesm44626145ad.21.2026.11.03.10.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:47:42 -0800 (PST)
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
Subject: [PATCH v3 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Tue,  3 Nov 2026 10:47:09 -0800
Message-ID: <20261103184713.29664-4-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX5U4W1JIzmhDE
 WlfGo6iy8ghWYcOldXmytuO/2tk5VvYLcSlQ1HnfyLIpAqpRAz0BjzFf18DDeAJF0xIzjuNQcCT
 7Z25muWUHWo/SZGiqSX3fyJwj4XUp0g=
X-Authority-Analysis: v=2.4 cv=JeUpPkKV c=1 sm=1 tr=0 ts=6aea2c50 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: E_vaHdwhOz0J7or2w1KcTwt8aIyV4uzk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3NCBTYWx0ZWRfX3m/7rKJZQSVb
 vq3oRDgi+yLH7g/HYSr4SZq5t5AjhTepvyrP7r2LY0VEJUDB6/DxmhBFnVxEsRAgDi6w0u8gPT+
 +6ByNv2r2Wq6IBwigxWV2vFVc9FhdR5V06+bTtgUhDuhNGgiCv3jp6xv4mGyuxwjjVCFcheYAxP
 F6OPPzE2bbWtp49Jy8ooMKqZGTA6Y8USsGPcL3OwUq9I5QNRHrVyd5qZBloVMuaq7HTuLH0dtgs
 ZfJ3K1uPaWyUcqX7QzeEGHRRYgLMs+wjRuOUkChII3sN6V9bj0BWSlrJGHEBeBesbkRz/KI6zoD
 yqEIT+oL9twQ6p4c5cOXT/flvL3s1PGlccp/WqNAwT8htaQGQAREOWdCMGbS4tD9EZ+Yn9iN1OH
 xAUB26GDTJ2beNwUrx3IDA8fszN3zpy3RVTDrCUfQvpDTJ04nMEA+nOxYvFO9zF0X+P5ifDlqN6
 f6+x28J7l2kj+tH3+OA==
X-Proofpoint-ORIG-GUID: E_vaHdwhOz0J7or2w1KcTwt8aIyV4uzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030074

We need to move the gpu lock around a bit for the next patch.  Use
scoped_guard/etc so we don't have to make the error path handling more
complicated.

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index f12701e286ec..aa59b28a3392 100644
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
+	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
+		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
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

