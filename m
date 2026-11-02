Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646034;
	b=R8Oy+52qxrACS/5iUCM9SEC5UKbPx5Gq+syimlBqBlHO+/wlB6rEDUImPooQDjaF9AhM
	 M3HSY1a2Q6KbLiRpNb3Rh/IHpkpO1MIFlmkZUoa8WiG7ty75OSlWeu9C4WSXfbBnSTgxe
	 8030rJEKzJBAJdDNRCyJhSpfgKkTLaAlarlqwQNnWz0xWalmc1pbptptg2YP1BmcCwK/C
	 m00FrEm/bajBgO95swmGtcADVDag/pwmEVO9pI9f3/WsE7jFCMctGm4Lqh5dJ+3t5SECR
	 M/c87yr/OyYERJTD9NzMu13Vd9znLI7S9sSPqT3l2nj/XGbZAXXnmt5RNwGlygs63mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=F6H2yfL9HCI54AnjG5fFp4KvZiYwlVgCCRFJCHr/W4w=;
	b=EA8QUs3T61rVgfrOgw/fTze6gI/G7l4s+KVx2z+H4Z3IQl+1pB8TjSO+eqGyrwZnVIsX
	 Z0m2VKNJ+33dgrf0liqXx9wC2xmBHRQArH9hOOKdF8iFyuFQY0KHdUlsSE3u+wBKZsANd
	 yJWOTdeearOD9p/JAsil5nQpaQA1q1cvyfdzU+LYj16KZ5fwTNBaFj9vqy9xtCwrwRdhp
	 0KfvVxQL0y0Ywzvdc95WKe8yBJb0Z1GPzyQvZmgXkaCoRXUcwZ3tmdlzHbtQ5luEL/cyR
	 aMXo2NyFYcIKCeCh+fGCJhmGoydIPwYgiP+6WDufrUKIudgznX5YFYABmdFDqRbCpEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="QzAO+G4/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IKGZUWBd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A679B606D802
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A679B606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QzAO+G4/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IKGZUWBd
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2HP8hH366243
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 19:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F6H2yfL9HCI
	54AnjG5fFp4KvZiYwlVgCCRFJCHr/W4w=; b=QzAO+G4/5jBP6PJnzqPoOSD7AoG
	yxS2rHeSt4rH4pKRL7LHQ5uXBPObws+fmXeK8WEwCmKxDhDDjfhKBU3dGbm0FHh5
	ByK5DGthnJ7OWW+suhEh0u3ANYmEWkEdzE9PHASb+ceQW4DziUne2ywsb5DL18Oe
	shcGR0Y+I7iYMSo3de9BLCzWhtH0de3Kubb6QJDGrGVgiJF8A1CYcVCLutAhy8RE
	iwDz6wUufAawN096+P1fXie8kPA9gxHttWT4wqwalzFk94yzFuazSSkOcggYGZgt
	GpP7cCewfVrZ9nJiekv7RV8RFsB4jNQ2xEisdzHpsZB7mDHyAc7Ahw+2Oew==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpss5hwfn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:00:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88c768886a6so1873376b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793646021; x=1794250821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F6H2yfL9HCI54AnjG5fFp4KvZiYwlVgCCRFJCHr/W4w=;
        b=IKGZUWBdqYvR1efDqX6AgYEyfwcR6tDoJf9Wgx7Y2W0OdwGZCYQ4k4GC65R/UJvBiY
         yBF8Kgzk41TRCi6h4Ph+++0X+SdjXoceEH+QwapDRR8MaSDRvl6IXapwFJjv2botFNi7
         ELsxHev8QDIKulJSfvDGJzp/ir5bGnat0Q/9RXgP3Wdz/7XbeCuBKgfyA4v5pamUn41y
         sa4VugJTM98ZSTEIER5HuPqbg/sbrGjn7QR8uOclFcadEBG9Dh/bqAMxmV1+WejhvMW9
         rJTD5yXSfzX5vBO/kNaltHwKuy9m8/F9lRxG+EYCAVCnfw4aUs2oSX/VEPA9UdrxawYr
         f0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793646021; x=1794250821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F6H2yfL9HCI54AnjG5fFp4KvZiYwlVgCCRFJCHr/W4w=;
        b=KAuPl1cIAc9C46KOmp+qBA+DYkmQUme4DO7uTiqMnQCuTxptN+xt1J7enZr0omJ/6R
         7oSkt24AKLsA1yfGlovWIP7VrZ/2yIFXcV/+C8i/ojAufVDXdCqt3afNk0OnozH0yVf7
         2Tc57x3JdcGwQldmjkf6pXB0JV5wXLNc5Ae+2CWPn/UXuIUlPH+Q4A+tgzTCfO8XZ+oU
         8wDBlzuP0l+mrL9cW6JhYud47inhV8xdY452/Aw4c45m1ohrBQ2Arbv+sB3esDU3vG2S
         v1MbZhmeU6N1cT64I8ANTBMuO82Hs8gPBg9/yh+najqGwCFFWhEDPWLniezLJ1QLhS5t
         BHow==
X-Forwarded-Encrypted: i=1; AKwUvBzcGdtw4/tupvsR4MfXND58NIq5Kd5W0Xr1GGx0bZVL1XkMb+r7stTrvbQQtfLg+oNzkCgOkdxbWr0JkKQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fZvY1yiMk4+OHxBV+yljjJpaCuc810INuENh8yBQQpNjkbDwV
	mReBqf9UUzl1/sPCeT9cRtl1TX6iwtEuBa0pyjZ/hSHWftCxBIfPItRqtZE9/SNvXjn8KN4mlTE
	/NZ2QhSubVLgHEZqTt8PWL4BAQg+0XFC4eseWSFg7rRxb1X4nM4aCNsJouwTEb18d990=
X-Gm-Gg: AYBFou2lE+e8FtsSgWUJaL/EI17Nb+63Q11wabVaDa/xgepb3e92pC8c3v3jZc1LSP5
	skGx/mP0KLrIqSE/2gwrbvIAmIZIk8OO/kynHLv4RXSLX6VAwJSyEBux5YbRLGpknHxVPBFomx/
	R4kTrrdBKIqhhlnam7JHl+fuHDi4paBD2Zs0dKvpMRoZxRL714ljQLfdM7OulN8zVTjbdeJokNp
	ZkiFQND7bQ2RWxFjnqPGoxBymSjfuUKpHEtlPEKrxj3a5gXUDUqVyTbiqbixAGNLFC5hEV0nolZ
	zQCpdcmswJGbqVME7qnxMPJIC2cyPB9xKsuinXG7Sf8AhWsPNr1nRoi1Lnem+85yp5/k1GzRjPY
	vTf2vEOtJ+ll0IkXF9l82ahvyh0nW5conH8BOXviX3Ujupr5aaxDnpD9S9WbTVkoVFqpVRY+g4X
	qq9MFaSxEK8SrwkmgYp7BCCuQ=
X-Received: by 2002:a05:6a00:4c1c:b0:89e:43ee:654d with SMTP id d2e1a72fcca58-8a9ba703936mr8590806b3a.5.1793646020771;
        Mon, 02 Nov 2026 11:00:20 -0800 (PST)
X-Received: by 2002:a05:6a00:4c1c:b0:89e:43ee:654d with SMTP id d2e1a72fcca58-8a9ba703936mr8590770b3a.5.1793646020264;
        Mon, 02 Nov 2026 11:00:20 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada9ae39esm2379711b3a.52.2026.11.02.11.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:00:19 -0800 (PST)
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
Subject: [PATCH v2 3/4] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Mon,  2 Nov 2026 11:00:06 -0800
Message-ID: <20261102190010.720443-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
References: <20261102190010.720443-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=VORIDNPX c=1 sm=1 tr=0 ts=6ae8ddc5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=isCY8TonHXl0-fnU9HAA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 6ifX-TNN6Cp62skoXvYbv2WlUxoQ-Gs8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfX8JJv+fvYhxuE
 KUymyIgG6O5VTlQyulixjx3Yrw3aLa+SXxOORebuL3TH5b2AG/yRP/pUUvIMp6yZmQf9rKTUPdj
 nfMHJfnaqbvwiNq58BQKZkCfYy/KYdzFynVoL/+I/+7mQGWO2yNglAJ4GE0X2Bxp5ZWyCle7jnH
 sNURKr5Xy7oN+Ge1uYaFylXFeWgGWpvWka7O63N7j2wqJIjKDn1j/CxM+JDzca4olQx+8r8USOn
 JbeWmkcXuj9FEb6YcLpfHiYiYfvWN0bLBf5zUNum3JENEyAvUZFM4ORJzKZJVnCqDZ71BgN++5H
 IoulXR4sWsBgRyKvjPISGo9Y1VFkZmtoKHRMDUj27XelxynL7rXrBvo9CrlPXTzNW/ap6DaS+gF
 C98UsNpzrz9acxTVgoXFQcdlq1+fxW2HqIJqmm9yDOK0m8+PApG2s2DmkiXfAJ58xAlRs/rSyv7
 KJW5xBNpov/fnM2b67A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA3NSBTYWx0ZWRfXzvY4xWqCP/zp
 ebvoWfvCpyh2njEMPI4ujBiGqhEJ4FSczLRRogKtTE3eaJMT09oc+oWImYT6eg1kfMWMCR1G1kQ
 PRtgy7MEhh6CIJMptTdoiA3s7NyD+8Y=
X-Proofpoint-GUID: 6ifX-TNN6Cp62skoXvYbv2WlUxoQ-Gs8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_05,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020075

We need to move the gpu lock around a bit for the next patch.  Use
scoped_guard/etc so we don't have to make the error path handling more
complicated.

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

