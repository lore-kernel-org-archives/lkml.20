Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555224;
	b=iEKkwyRAkLp5L9wWUhwxw7Xa7BmxtXI/DwDXAu59neDRbxBrGaxuhTu2NUGlu6TgxhNM
	 jfXb2DjRGDZ3QLpsAa+4dZg1x58nRoYVPtLm+68izFepz5KeGdUvB7TdHNDdlX+TD5zjV
	 5oJpB4hze67HspPUvQwC2G4tet8t2FEZJCSkhpWQAPPfaGVP9IAEL3wZwtNHqRVfOOja3
	 CbKwC3SPv2BtQYXfCDXGbXHIU41Pv0SrmlbwkXZ97i49mpFafgKjYTqLM9iOsju/ztdLy
	 F1FJV9GLLpQEhys1M0GjcsQkOrMRHBfz5mVgskiy8+kBqzxOLaboBrippzx3bn5XHpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555224;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y/GyDAzpwZImWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=;
	b=0SjCN8lLyNLJQAxLZKwN2kcou8znQECbeTJhE3faJmDI35yUarmkI+pKGvkvC5lQKNY2
	 nVEWP+Vq05Igb8Wsjssqox/uBxkj+G6NcRk8prQflWaAAntLPoepCjOYp8wBHEgmBN+nH
	 RI8pzM+RO5jE0dE4q8WI3Ooc5R+3cfA+DXScxCH6E1owB9UaMSPw4sG3la9a0iPw2mKEl
	 oGBZ96kEsPz76xqtRS3i5ESsu5B8xX6gH+xFfX3P97e3Sqj3auKQeEt0uESIxS1vot6M+
	 +kZY/TbHzDDWWvHaqFW1U8qLD1QdTpktl90KvP2i4nJYWVkhZrtShIZyyPp8PwZldoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HWjjGqhU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XiFqojQh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58967606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58967606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HWjjGqhU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XiFqojQh
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQHPK4030368
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 17:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y/GyDAzpwZI
	mWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=; b=HWjjGqhU/tdTaoFLQJoSOgX7VfN
	eOPHX2/z5V2QOy+Hoye0D+/QRqBhxKc0+/tsKNlP2yrnhDt+7jzvxMCNdGYDwq14
	1lRXL93op2SBIOBnkJf+mqR7YC9ovWPThnvgap+JoZ3IbMEaRJtfhWtNeYYFaehe
	ewsYSiCLNUZbtuM6iQRwi55ZcEKWvjN1lFrDTM9DW+Y3+gT6A87waOslZDN31qvK
	zY3jS7AZL+5WBhJyfKzAkl9zPWJmaOfzG/ToUoRDOP63n8wyQ+dSHvDQyhMAWlhv
	t0PYs9aAtjiv5GCwGGJQtgnT68uoJN14ivbLTwSDGasBQi2QEt9zLXGjdlg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9gk3n9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 17:46:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ac76132001so1628341a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555218; x=1794160018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y/GyDAzpwZImWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=;
        b=XiFqojQhgD7SantUsy0Q63K8B6m2uyA7/ZYiQCRJIwot4Dy9+6NrFov7axpiDatu/y
         9NI5nbfatSMKHnH+Q57s9VOYVxY8ogqf90pg6LDycYUBeA6IPWd9+O1VFihijzAhSxMP
         YSzgKr9HAoawJIE7+Mn3wsdWlFwAqElzwXs5nbSZNuLnEXDToOWJpnwX3LSsiyviL/w/
         0W8tGyXPZK+8+Tf2vZLAQe8+1GjJranGLPx7Z+rhlD/LbjoqFm3K0KdAXkCdb6yJOQLO
         FKM15Oy37RLPA/nidwgDbO3E1xcsDuKebfyFMPZfUwRoEBbzPkXG2p0s5lHVrxPDQxf4
         bmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555218; x=1794160018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y/GyDAzpwZImWFuqQSsjq6uv+RPz8GtxfDN21Tjamqw=;
        b=vqqjWGQ9VqKfpSGW/z+BjR5fgrCh0ZCGfX/uHWe+m0tNV6/RC6wPHKbY6scUMOCI14
         Wti/ZIsNh+oD95Vq/t2kILH+5FoJ6kB4jGHqJwVhyr7IYDdh8Fbb65wkC91ke24I9znW
         G0lQwmPPsKKNpd1n9s8jwwiL2TVJpM4EN9DraR4CuHNQfSRDuh5cSyj1qDV1vEUjxX05
         CA6bwnnjhgZnTOY6h+H8VInv3GaIBSKzXEDBi1DUMThWSdrJiQ8sD1xBuA7oasDyrarX
         /x3j4/7FUkzfAcNXnJmRB6QGRo7E7Eh0imVBdN+iPpARAIGHkJ7CHwzJQ07yYIBW//kV
         W8eg==
X-Forwarded-Encrypted: i=1; AKwUvBxtr1jO+wNdqmgXQPsPGbWBRfSpNK8YcwXea77ukXYuGXyOT2CohqWDkiHurUEPGRLtP973/VOG9YeYsH8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+URrkINeujXcd/AF/L6LOcVfAgqpqsokkHGoSuiuSGZR7wg4Nc
	U0M/v7PggFy9l6ZWVuvjhYCfCDiTAmKMP+DrqpYlUdJBXyHwADRIU5C5Vc93aromJB//xzmVysY
	nW3hrHIrby/1/ziVTkOHf23aiZxIhqy4+ARsaInkbHt9UqlVMbYybFa6Dxa4rbRY/sXE=
X-Gm-Gg: AYBFou1fmXSmKmMpIvqyQjCPF0pKb5Pd9LtCqQYAUhaMvXSAJPT2Vz2IScEb2NYUfFs
	uOo979TNttWpXFQNeH6FYrr7lMEgVUF49u/SPwIWKzjxyqRkkhVsUxLqquc869Ukv63KIohT9DR
	CyTRf4C4t7uU/KMK+dPyWAsdMabLT52Fuc1WgtfdaUMNz7CTO7xEDqVryC1RrQnYxvH8rVfJq51
	RD8vZwceb8xltQ+oOc4lSpGZJ/5IDyQtbzmhM8K9MoEnBvmXKNAMkepMbGFrUjSKFFZcLHLDQ4O
	B53et5gVAhgvy/SNxd+DYIUdY6vo8lPo56SB4wIFvJYQEZx/M98XFQKUjEfDfGbuliAtNuUloCy
	8UFTujk4Chlliur9C2ZdSvUHI19nAI7xraSG17gh63GtqS9xCvhngWzlMtmJDYwDg0+4k7hImvM
	7ipZyZSLSLWYjWW3N9MuNVlQ==
X-Received: by 2002:a17:90b:3882:b0:3ad:6090:a17b with SMTP id 98e67ed59e1d1-3ae89776869mr5880103a91.17.1793555217948;
        Sun, 01 Nov 2026 09:46:57 -0800 (PST)
X-Received: by 2002:a17:90b:3882:b0:3ad:6090:a17b with SMTP id 98e67ed59e1d1-3ae89776869mr5880092a91.17.1793555217545;
        Sun, 01 Nov 2026 09:46:57 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9db612sm15164277a91.17.2026.11.01.09.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:46:56 -0800 (PST)
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
Subject: [PATCH 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Sun,  1 Nov 2026 09:46:27 -0800
Message-ID: <20261101174631.23637-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
References: <20261101174631.23637-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: 9vdpBJWQwPesdpknBLrD7jc4pER-G2ca
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX5LXptrZ+pTOX
 y7ieiKF02km/X74xOE3DbokH8drqkuNK+hhOoprWWw8wWbs3BUJfa3dfMOBd6ujhWgI6mnE55mO
 pc8eumLypUizxORqxSytVHAVUHI5DyVRGB0+ZhTg2pctk3VCrtiw6zir5KxnBleSt2dGHVYTwMw
 0yJA+4CktrTHVxEQMj2CfDaTrNABDbwfGAcOc2VR3do262hreqyaptdzlqX5UaqkAE+qjgKNAAF
 RQDH6GIUdP/fCzN5vGYaBLN90Yg5jKRrVqp9Nhj59HET6hf9AF5l1ZM28gZOUMi+ZwWHUzdbovO
 rRydvR46YrXg269Oe8CS1J7bW4mk9nROqiLyv0m/0PrX29fn18Z4YBE3bDSYksAYcHFuAdbgnDy
 DWYTcBCgRY8EgJviHDDeluGeLiEoFs7+iHfLJuGPFg2u4LEehIgL1P7YQljYslew6qpUIOgeUZx
 hMhK8qwACXsw4U/KOJA==
X-Authority-Analysis: v=2.4 cv=HNBWhYtv c=1 sm=1 tr=0 ts=6ae77b12 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=isCY8TonHXl0-fnU9HAA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX3AmFz15Dqhr9
 4tgqhtyeth0wNpgs5n8o0kvCzvJ6N51og9tf3Zznr3S5chk0O3xEpGCqMkZmmQ9Duv1AlORAfOF
 LsIYWEPB1trFBemAwi78ruknSR37r3o=
X-Proofpoint-ORIG-GUID: 9vdpBJWQwPesdpknBLrD7jc4pER-G2ca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

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

