Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815185;
	b=FSlHTKihoYGC4Mo7xCRnjbKQ/1SHiU7702Ntx3YIUjvG0/d82yRpkfg9k1Jz4IUYlwzM
	 gK/fT6ryKYsEqGdftHLOtBSaDplwQScwS9XmUXrjAQ43j16OeEV5q2QhLbRXpVzw7K5CJ
	 G5g8AZHfZKUgxhhyBL7Jil3KcztVHAvW25VRVHwlkWQ/6mbS6JpG9gkwqiVN8nGJFB8Va
	 +GUckdFGgURJ14xEJZVEFVMKdwdlVPkgYFA+oqV/GQSR0aMdfG4pdVHig1ETVIOleDBnp
	 SlaSxLOiryaWXzNTtRJJmtProvIn1ZTa/Ff+ZnG3MUAx4Rbf943bKg/zw4Anal/5P+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Da7a6+qQq19Xl3Y3nz2zVJieAU0gyascrZ86Q+lA+L0=;
	b=GZKU208EQk+G2sERuvEUo/6BHYNAZLn/sqUJhNuPBu00sgixvTsyaHqxBgvqM27CY5mR
	 FIt/Qlfs7eDgs0jTAhwiydXClae/Y/E1ioQ+qblxYINMu5LXbxaX2OK+J5l8WTtCGh8PT
	 htIUOS7RPl5N9IgHEmbCzQpoPW0IEBJhQD73lTtfe9EQi+Q+OeUgvLMc6AN2a/WcQHCNt
	 w8tE3+Qg/0CNk3gNPS13QSBbG5sVLVyhEvethfv10GeAdoSt1SsdYTXNKdMg5vuiTqsf5
	 PBmx6yJNWktzvC8Q90UgF6eysXoz3xlNIEXPIfZO2GlVtA+nUpgKRSrnRBfdDXIdvCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3hvFHTV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dbdgv5GM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34D66073F4F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E34D66073F4F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L3hvFHTV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dbdgv5GM
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjASR3208829
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 17:59:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Da7a6+qQq19
	Xl3Y3nz2zVJieAU0gyascrZ86Q+lA+L0=; b=L3hvFHTV7Tp7RMiSHKqliC3kzxy
	Z1WbFvYJhax5wxBWUWzUe2AKIopJxDC3MvtAmcYUXppFp7RsBr44KaYZ8Z18n3f5
	DPih+qVQQnxWZjm3zgORWreA0cpWykmlYSt9kziczI/Osn5XJ39GSj4qAtGvbsvx
	KWgZwg7cgb9sjeXIgoCzhv7HFmkErn1gW5ZXbLIWpC4pPYDGoPXxTKpqA5f6lcsU
	pIvwZ0mrRKft8tevilf6LKeZhPK3a/RbhMJMVKm+4IC1cEQA6IhA2x3a5j/3YypG
	YGG2rcoyU6/wVWknLy/AWEGFaMUEFSS6HSAJk7c26kED2XZvGdABg61k/HA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bj0wvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:59:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08aee6b3eso1004587a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793815183; x=1794419983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Da7a6+qQq19Xl3Y3nz2zVJieAU0gyascrZ86Q+lA+L0=;
        b=dbdgv5GMmkzkkqJTCyW53ZWkdmHT2eyRO7KbebWJOMyxLIZmRxYXN9L1I8zzWTkhHg
         G6Rjdr8pKdr8rmyo9mQxCMx2Do+wzeK608GnecfDor49ym1WYRZL2lWoL/LuU6zO6wuM
         cac0bM6jCohBzl2iCNQXnw1tidDLZ8MAD4KFGGXhZyJOMJNto7Frd3m3EfyuHBhn+iL3
         E8EjTdZzxLq15/vgU1mREHrJFsgeFx2xO2h2kQxYBmECEKbzU19brYEsgR6aZlGCls9U
         37O98DLBMzf9GCT2ee6ty7/jfki8R7BsUAAQiCTE9vjOQ85+lnPOOZzxlK1S8ZOjziz5
         BUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815183; x=1794419983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Da7a6+qQq19Xl3Y3nz2zVJieAU0gyascrZ86Q+lA+L0=;
        b=QSFOWfVZQYzzq1606oD5JapCEI7JiYYNNEoh7KE6iT/NcqJUwO3cfC9OChikY38Awn
         /AtpwKf84o9rCkWU/1rXjqtkRB1VlVbSDSCQalBtKc0xuZJDMq+paem3jEFbmUrifqaZ
         ytWQFmgX3XtkpF1yPFE/RlD8WsnFfhsKaYjPl/otBWhkxYe25j2PtxCAeHG0Aq6bHKcO
         VUA8ei0B0+FsHVmMx3UwBQc4gfrCoUtN+aGg1XbeNWM1e0Dh2INUUCJimjh/2Tf1PAbq
         BFwXX1SONqk7TBfQBKio9xjfR62Cw3aeK+/Sr3/9WXVcgkmzz+MYqRiYNVA1RwO4N8aF
         z9HQ==
X-Forwarded-Encrypted: i=1; AKwUvByqS4Apt/z/8GmjxvwwHvXJwDs4wfAdizOEMPNcaaN+rlTQh/LkG2NRwmzPddt3gKgA+bTtQ8H8KYJqDp8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+le9zvfXHuDqwBnJwo8zgNm75XQk4o8ac+wDCzmDJ4E+MSGuU0
	YcoFn89q/IixwvS8oJpwzaSXm0OhflYk5MVqOKkbNNOBgMY66IUznFN+ldWahFvX9VXqGJ+0JMO
	eDSiJ/djglRjVj1YNr6vh11llKBhrD0WEsQmzQsEXS015/+ru2RWD1vL+BOAn4aX6LdM=
X-Gm-Gg: AYBFou3xn9WvQsvBlFFtGZ4Z1k3SKLQaIhyFDKehmspqJPHyu2Tqj3LBaZSR4Yr94pH
	UDJSoLXMsROjnhbx/TFS0uVU4ciN5TXCox7JhUZruM4u1FxfVMUvQzfNIBhj3OwFjf7bJUp2O16
	SgS0KZduplbHg793egkPbEm4gSruX9WIo6bTliEQlzDeU1WVgjDgFKnqZeh4y4sKT/FcNGMQmMw
	n31m0DMAUIAJFHaLgM+91MIQEK9Ku5vIN2r1SetO/M+JkZHZjUQXkK1jIlhfoLMI2RBvm/kKuia
	6Tz75RBDrQRzJlfAGTmFmJR4W5FG2yHge+yLd3yULRL9TiURukcHn7d+tX4j4yjiYYU6TRuvu3R
	UTMVcc+wOC6l044WNUQ8ysRWUP/WxhqGlxSdzle8UcQo7Xwzaz7aI3oej/7y3rJ/rBg4U0ihLIJ
	2dQrA9EGmxBHB+LYrTfyz6pABiY/HXef57mY81u5Y/ecgJleJCwuzVZd/zCw==
X-Received: by 2002:a17:90b:570c:b0:3ab:e588:c288 with SMTP id 98e67ed59e1d1-3ae897ccb52mr14991776a91.11.1793815183553;
        Wed, 04 Nov 2026 09:59:43 -0800 (PST)
X-Received: by 2002:a17:90b:570c:b0:3ab:e588:c288 with SMTP id 98e67ed59e1d1-3ae897ccb52mr14991749a91.11.1793815183032;
        Wed, 04 Nov 2026 09:59:43 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3163383sm48912a91.7.2026.11.04.09.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:59:42 -0800 (PST)
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
Subject: [PATCH v5 5/6] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Wed,  4 Nov 2026 09:59:25 -0800
Message-ID: <20261104175931.28475-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
References: <20261104175931.28475-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX1hVDpNjSr/AZ
 cLmJJU5teDGjljSyQv7ZHab1ep9aEDEnXw+WLIbJq1nM6TspqYcnsZVr7MqqnPU0mRuc0u8+JrF
 Y/u+eQzgxMGX6bni2r1gQIkQtYOEt0125uWmP/JEsXsET2OHkHMMfkL+MqS84EXTkWcyGs7b/Bm
 dDXZEP9zzp+KgGgSlWxT32M8+cqnVWL+eOtE04NHWdgxb3ULRDQbD7NKuNJkn+zaXT720/L7wXm
 CKGpNqmJoXqWVge45kqhQrG0Uz8q17Kk2f6Ynf3vYiBxMXPLAlUTsh8vzvH48jScvnzb6EY5yMs
 RKY1R9GqG+WgpEUCWAi6wJo5JM/n0aI1GseQ8gcYoP4laehopS/OjYeJmy+HyzkGBCsdOOLsu1z
 Qb1A3O2oPjQgYdh8AbQJmUshQA5NcNNTpkhCGfEfRHJxiIDwiUGoNWxiNHnvfUyKVUZAfS/RBHv
 +6qjAjF4j1saDu9iQ0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3MSBTYWx0ZWRfX8jX235r/rMAv
 lI8SUKr06G49tQigCPixiqPj+CT3JRIW82/A36ofVvjxOW2KaZtulUOBqpybT8NPjS70sKBElLK
 va4P01r/ru7P239VUsjVKx+1d2GxzmY=
X-Proofpoint-ORIG-GUID: JRyhMTPnnEHfg5A7aXsWBH097oQECzhE
X-Proofpoint-GUID: JRyhMTPnnEHfg5A7aXsWBH097oQECzhE
X-Authority-Analysis: v=2.4 cv=N/u8hG9B c=1 sm=1 tr=0 ts=6aeb7290 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=IYGNqqR_R4_3MQmAMmMA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040071

Use scoped_guard/etc to simplify the error paths.

Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reword, we are no longer reordering locking/runpm
---
 drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index f12701e286ec..136029025b80 100644
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

