Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395197;
	b=4X4k6Vbg9EmLE4o/dmPAbSSIh5C1FyVsI9eg92aQAOmf5WrICvyZpepH4MJ7OgE6hhc5
	 fwAl7zPxlNTfDYSqdr2fnJU8vqwgPH4jcL4aSDOF/XPoDijAfHhMNBjV4I8DvZBGfvNc5
	 55pZ3sr1OKeaK9kUHiL/T7JkavXMUdUpVb0LZGRkz+v4T3VrWRpFN8cHl5lUP7ScUHa/Y
	 XT2kOVkkqH6wwKdHnolFQKMUCdk6Yq62vdE5YMx/QDG3EfUjZVXIJ6yC2/KiXhb5gZxut
	 o3grpduPZX+owRAaiNKsHmqJv0mH5uLpKbW/vHGJ2wcbbfjAw0J6SNqD57wcHjIrE4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395197;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Y/GyDAzpwZImWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=;
	b=L/v2sX+Epr/YnzUaNM44PJEbT9IdQeUMb229h8jFeJ5ot/f+yAXZeW159Vn20dzlUxDD
	 zaZHQDhJqepCRP4cc7NJ0Ah/PXz6dRm4MkuQ3Vkr5oricuPaFrIOEZzznn9GanPH3Ow7E
	 /NbtWh0m8HcQlqlMaNfVR/MTHXp4JfsIbDLk9KcnEo3VGiygsDPBQ42v3l1tprFpyMv3z
	 Tf6AxZqt6qRFAigYjf0OD+b4ExGeFUSptmGxD1x4TYO6VQi2Blylx4YLTOHxUFj/NqqQc
	 oYZR30p21ILRqh1e2zhs1PcrqnzchipkUsEKzIRzeUreBsjW3mq48hPDAreMRGqHtiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kHePRQzT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C2xkWlOk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC05760A6F41
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC05760A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kHePRQzT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C2xkWlOk
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULJqBf267039
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y/GyDAzpwZI
	mWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=; b=kHePRQzTFqk8wzeqqTO5gwSq388
	17kiUznM/dIB9i6P2K/lKZxWNNyvdlc+wY3NfoVgSZVBHAO1XII2KBGGSqbhNzWj
	UVsSpB06hUhzPpO8Se4h7uC9dc+y/wBAV7mt2bd5SCtLTwRBEU93iWtqWX7hsjCV
	b/M5C1dt0/U6YF7kfnoVsx/z0XYDB73ZCH+g+GY0KMGeh8Fb6nj0ZlXyxkMBJvAv
	c5xzEDWBMAn3kbL7y5B7ZKcqjLxAhDGYzoywkeISgmeQl/idblnJV/9pQOc5C7vp
	epWGu9YVOgXa75KOovCLaKgK7QzU6o9DKjhRLpKaJPsGGNKxpzJ5vxUogqw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x0g1d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:19:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdac8b7169eso518316a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793395195; x=1793999995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/GyDAzpwZImWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=;
        b=C2xkWlOkgGLP6II5tFhA1t1EliYBeX52wm8r5Bg5MoPN3ZkT+BdMgeBK56Y3R41WVv
         9Ck1M/q9Z13abc0qDfpc6VGJ/0Jx/r3K6N/CNcqFtjzytzH5MDdbpSMWqTcNnA1otKa1
         RnYHn/BIL+n8YY63RQTPnmAy2lAUGDCY9sBTYIiBv3oDoylD0z5vdCtv8DROG2i94sxx
         y30Nwx2k6PthDTRP9bN+d84KiyMtO9w1DFp4+xkbtzCcKNpC6Xw810n1Or2a0za2GS7R
         rIAE85u/NSmv68SpYSNdJGHjfmLomrGXIfrmQp3zMQlM6A6MoY/BfX1LMt0hsCF5iQgW
         Tqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395195; x=1793999995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/GyDAzpwZImWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=;
        b=JBsymw0vv3NrsEQxARtijDfTMd1SfJnSwlDdpVvz1Ei68ywSQD++Oxw8sYm/nzD/4f
         RxI8tzm89e2AAINJ+2dhcgMjsngVTQ8vZ7bz6A2F1kH19R4lSdEqA7NZrgtKAd/35OMl
         9DvT2jbOpV1y3ZUxyUJM6//L2yfszuP/HcUHS0JkpPJi7Pk/9ziq67gv0Yz9L2Nhxjnk
         6Yq02GEHInmzUkHkhPF3LP4DQ/CHMo77Zz5Plb/bdmH+XSndbYvTgyem09ivgHGhaVQj
         w5JAH2KRRKQcwzE6IH/bXejzC+reL4KH58zMGfMRdPWGbWaA6ZrptGZErDuigHtFar8I
         iozA==
X-Forwarded-Encrypted: i=1; AKwUvBwFFegNPYj27KKGF2FHtzrQ2VbbZ3FCAN8tH1nTZI6j5OuRb4CC0GW+N0TAo5bhdr3j5bVB/b9/oMAzqm4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeHrfCknSzBr0xPOnY2mnFeU5b0+eNOOrMItfJsdfv2lkA6qfG
	P7i9zupgPzLP7QNYV7MfC74Uwj0ffhDg1IwTBIwLwQNw4GPOFqgc8r3W5vQ3NNYM8rN1o0XeBOz
	waI2GsJZAvzVoHsh5FU/n8jevebD01OSF2GXRB9NT3P5KA4/LhA6cROKy7eij/05c3Lw=
X-Gm-Gg: AYBFou1EdHUfJ08fOBaOMy6zCBtK0ubjuGZkFRTwM4Ea0oS24d4PFLna+UwSHhzHNJ+
	6PfuQtCHuQ4HitxFEdtRfF9CzEVUg7RklpR7vLcRK9XlVC4aardT/skIz53nFjjNNHykYz3RcAm
	oVKJoIYpuerin3K0e94lVRZrrwgywkmPlZvpZzHEwcGjMMQGErlZkSIccCZv4xCP/Y8QFjC8hKe
	nZFPef/J3uOvreUWnL24k/bQKyuT/lq4nDz+UosyNDwF/UI4WO7ards9pUgLfor7qE233+y6hrV
	WcfmQukXzz/rhBRJkSWK2JmK2olealweiJtAkvvtUPIgi5wCppRWeC2l4LNjQ/copgjwu1Y88I/
	8bqwZhbQMP5vT45KrUVGHQXKBmrd7lndFi42MdxfTClo/UKvyfA6d18J1fM3rbioocbB/ZRTeZv
	mmIzpOtumZRWWCI6aPqt3sNbM=
X-Received: by 2002:a17:90a:ec8e:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3ae8980ede9mr2465113a91.37.1793395195205;
        Fri, 30 Oct 2026 14:19:55 -0700 (PDT)
X-Received: by 2002:a17:90a:ec8e:b0:3ac:a203:e0a1 with SMTP id 98e67ed59e1d1-3ae8980ede9mr2465097a91.37.1793395194778;
        Fri, 30 Oct 2026 14:19:54 -0700 (PDT)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845d5e62sm5619069a91.13.2026.10.30.14.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 14:19:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 11/19] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Fri, 30 Oct 2026 14:18:13 -0700
Message-ID: <20261030211928.45761-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
References: <20261030211928.45761-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: srRVvfPfts4j8CYvDsBtlao7XqTddorq
X-Authority-Analysis: v=2.4 cv=No9E4MdJ c=1 sm=1 tr=0 ts=6ae509fc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=isCY8TonHXl0-fnU9HAA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfX8piKC6pJScpI
 GS13wDNAthhMmG7lJc2oLC9JLobL2Bc334lANpv/FOOSMHwsJx87+TI854H8W56dcq+BsSpwOZs
 LmlQjfgJzJbkhf4LSql/BfN/VSaYgPeq/5U0SFz14VWNvkh3wY4lJuGSwhHhYqkF9LgrFe5mMok
 zt+uaWIKHiaJcC+6hTulLYC/n8YHA8+ECxHkcx6/EMg1/Dd+I5BWJYFS6KnZ9vIFYv6sWPhz3L0
 jeKHapO7O2G2ai+v8yN0kPZD8oMzoJ/ork+3TMit5jxZ2ALVOZd84kytO1sBjck4wYLR4lJt3Bs
 e0opDE6Rs1BYp2qi5nS0SWeRbpL/hpiUa9Siza8OunoBpdpygAdf78YL2nr+ByG+JjiKFjNWsaA
 YDJ6IyDSebzarbLuy2RNGOmSNN3WcA==
X-Proofpoint-ORIG-GUID: srRVvfPfts4j8CYvDsBtlao7XqTddorq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA4NCBTYWx0ZWRfXye5E4DWhjpf7
 BSM343/u+YQRQ8kB+n8v3FmPfthquGpwfJOcwciBtz1KXM4+fgPEz2KFcPmppwHklmWggzt09tp
 +liiGnDbKr4mLYSWUuG+nFehU5H495k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2610300084

We need to move the gpu lock around a bit for the next patch.  Use
scoped_guard/etc so we don't have to make the error path handling more
complicated.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 31 ++++++++++++-------------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index f12701e286ec..b0ddc02f67b5 100644
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
+		scoped_cond_guard (mutex_intr, return PTR_ERR(scope.lock), &gpu->lock) {
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

