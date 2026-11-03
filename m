Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747946;
	b=nCbkYS4dHKrf01SopXyweucoQUt8RGexnjYzp/x8KppcsAM+6BQFAnLNfY/JWq8lE2qS
	 KnYqZlQmbpLxhGF+5nVPp6rwIwpNSJGrU1/85yOapzEjNFB1skRHaOHlXUlYd/LQm4KyW
	 I4zNbfXEB1zmmLI0NTv6iW2UDe23df4B/1R03elGhNtv6dcSWq7CiJMcq5mEQLFlfiklq
	 X77rUuV3biD/qCP9iQrf/edwCncVFUa8uzgaF6YXeqi2JqK1lpoDdGSZQcc4kHatJwY7U
	 Joeufka9W3deQTjpw/SRDa5g0ldQjMjHq58zM8wbieEdybI2F6JMPWyjjFQswlKSHmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747946;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9R7AOWcFK2O6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=;
	b=gz+oRK8acJo6xmi8FOfsOEi5GpZ2Df3V4FZe2UeNLK47D7KeQMXkza7jcbgTPKreR9/m
	 bnpgYWq6ofy5B8sds2E9XYVnEb3ALmvVMttXobLVfBljMS4cshzRD7O5O7jCyq06+qp9c
	 VEu4qxguc9XjJWIg1Q4Yw56D9NiBR1jcNu3DO3TRSB3vwPj66gejNXKMhTaHG6R9DWCmK
	 tbbW9g1+PZW50AGE7fpHKI2bi/OxXc1NHAleujb1VhYFB1lY5x6bHgKjS4ZN2xTCxVn4I
	 SD7BCiDGCY0qiVRmG+dEYKJ6d42vlJ8sicz+IrgH+7TGHd6vple0sl27mV11jgYfqEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9TAGBP6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kbu/IQqd";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B19606D825
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B19606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T9TAGBP6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbu/IQqd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKXiI854589
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 23:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9R7AOWcFK2O
	6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=; b=T9TAGBP6FqUzBkYa2zuGXHBxadu
	1kuEq+X98ZVvrnGIbtfcoszOzUZPFMbmeOJaGBf8wWP3v0JC1qP9UqBglfqN2OVF
	diqLSGAIYxECWQ73tjgcevAnbsSdy/8/aiViGCbjq1B7redz+lOWK8b+EZmh2i7C
	ATHFeImO5Ty+SaX+NjltOPRzETNZqAU2lqCP3RGZiuh1dRmm+jKkD6rAtYeUVjD2
	TqDbMVKEtXeiPMY9P0DwBzrqM9eTthfikjHtPCfboUm617akvDeBpqwXWomAWGlZ
	v9x2C+Uehzzk9F/q17wWL0TkSaEgl16k03xCd3ZLjfPjeh3psvTMDMPkEhg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuv8fg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:19:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8862ed0539dso219566b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747945; x=1794352745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9R7AOWcFK2O6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=;
        b=kbu/IQqd8OSiWvBm42fEZa/eqGqg/HC28rrPRgYQMs549IRhRZQWxB5SH4gNJEhocM
         SubdBUPpDXrDd5bVYmw3j38CXMDBQ2xBOnSaHzigfyHQwtq/8h0ik4/3p7Ah8NwqRB61
         SF0VsbhYlifQ+IXM2+J5zoN5/L5iobhGBrR6hrpoyIZkqv2uTdya2LgyoxX8Wg6kCV8i
         nPfQEyP95/XBF0gBcqAqCsd6XDkSVAkTSv/LQOHQh84THR4FovzbPnW7X34AUvPdXoki
         sqfKz8FLKzY8zE037Zc00YEFnumNoZF9+VwvFJZ0DAOecAyo5vIwkA9a8iY5U7caDv5k
         BNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747945; x=1794352745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9R7AOWcFK2O6YBonVJ+x/oCpM5TEf6hYWJwCy2Nvgdg=;
        b=dB+v3GWQLB7fazUYkHP1LZeMOnOInlYSTd06mhOyFchFvfnuGci0DZbTLjJMMcWbIg
         8vUzYxZbQH/1Hc22VklIUPt5ZqsewUmqVPVCbLGX+TYAxLAqAg3s2P7iq7c/NT4ckoVj
         DjfxB2Am8a3IuPqPdUu65r0HgfxIyQlllpmEauYKy9jJJBIRfVLV04KrY17ITbiAG9x0
         x70bg4YmvZPoZwoxwRhwFfbwCeGTwpAIRQPMy30ui6o9K9HwF2Wm8UPZM7IJqqupYMBE
         VnrdXVu3GvE8B633iCsXWYkFaYI0bL4OkikLKwehNkvgsUpcJPTrDmIUgFJt0qiS5XeN
         AitQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAePswSEHcAWEgbZEqlxUTzD6lMa9vWe6rJ2DBgIgktk49TXfb5DasxbPfdbaoZCk3l+rPXRwKkRp8srY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Wnl8JJAYoWphQLGR9N8+YX4t5M0NyiTw7+uXj0djTwk0+/IZo
	bH0i0jdGWCUrZukV7BfFAWpObM5kczPmgz/5Yi/KKJ4Q3Ne7EJbIDS492op0t33XsJChcwXQOWR
	1ZZuqRMutdqIhZyig5L3pHRvdARJuo8SxRvNSa5JxslSF5hUsET2fCR3/A4+/rZzUqc4=
X-Gm-Gg: AYBFou2jQj4cy9OaafeJ5IjXwjGVYfv4YYZoDvk0hhA/O59DY0DIjU/K2HasRs93pZZ
	y2ysnW6OtBpB1mlkn2eWoSNgcdpBE5vBNwqnXJQqVRvvaa2eILVAI3WwcsrV5fnY26FOCuukVWM
	PF0WnXtRbWMhVAnPD2d3eFUOcAS0qLmes6cat60RQV2oyCGH3Ojx5ZUiNNsjg4lh46YWGcRGW1b
	bqB+afsB+jHSoAP3121hxruCK9375DzDVMfq6l7UOkd5Q8StZOdeT5lOFF6jdcoO6QhnJlWhFvJ
	i0g4Rs7nCnRMDuHsZd1I4xkM7LhjGjG7d1qhWU1ypuFqqeyUHigER9U2mLWcVjDi0ACXCBr6cK7
	9PSWzM9QJ8oeu5ldSzBmGJq1XwUqQwhEMgtYm7rFxpkKlmH7cB0baHgz6eOkZjsJvH0k4sDO63L
	jisDGtDCXNIRYIxfOaW7fnu8KnCqqWtoofzwWADWtDqqd/3lClVaKBAGQ/SA==
X-Received: by 2002:a05:6a00:2d96:b0:89a:19ae:10ed with SMTP id d2e1a72fcca58-8a9bc8321d9mr11305838b3a.31.1793747944906;
        Tue, 03 Nov 2026 15:19:04 -0800 (PST)
X-Received: by 2002:a05:6a00:2d96:b0:89a:19ae:10ed with SMTP id d2e1a72fcca58-8a9bc8321d9mr11305804b3a.31.1793747944436;
        Tue, 03 Nov 2026 15:19:04 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bd3ad6fsm146353b3a.55.2026.11.03.15.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:19:03 -0800 (PST)
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
Subject: [PATCH v4 5/6] drm/msm/debugfs: Use cleanup.h for gpu state dump
Date: Tue,  3 Nov 2026 15:18:44 -0800
Message-ID: <20261103231850.17493-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
References: <20261103231850.17493-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aea6be9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=isCY8TonHXl0-fnU9HAA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: iO-WSQER82OT9vJT9JSgnZSsB7OEUvNd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX/I888eUqoPa7
 TXA50tAo1LknHZfa2QOZz1aBb6zCdTBIcii7K6IrwrkO8jkj0B6rRnUyOqhNvNhs0TX7MR21H9L
 30ElFal/YsF88auRiy0xxRFgKLl20ro=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX57yUYuijCRFM
 7GkVpTgNawkAaskDClRmmLTkpTq6TtOCLw4CmmBlAYwli9KZJB7MMvr++E0CywM7MzI7U/GeluR
 IPxiGFDAhZnaH87fPMIYPLuv/NChBRrjMsoviOkDzEWEgqomUTItkiNhb13DEyJEgqOhv6mq5G9
 7FvbDGJoGqglVXtoHlFcZOYBm2hk6gy/v486hSwWEu9c99TrI4dS8uxu+baH+3o9/idQ63nPCbD
 X8WBBrz5fyZZvP4A0/4ml7ir/rmnua/Jgwqi2oilBD33BBFwsG8AhydzY3mxQkNQQeyq9dGGAiU
 fcM0Bb5vLAN2dBbmWmNHeU3Ur4UJTOZgXUBHveYFpSPq9eHa1+rNfQvlwC/LFBr4iC/Xk77hlvC
 X1UJ7cdFDzayoNe/MSUFzPOBXWs3b03Gwj2QHu/Mz2PwlQzSta2e3f3OKG1QQEbpI85y4x361Ei
 qPGyeYZBfaWaV0CLtMw==
X-Proofpoint-GUID: iO-WSQER82OT9vJT9JSgnZSsB7OEUvNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030092

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

