Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747949;
	b=V7n4pYewQwxTDm/GMBdeg0V9NAwLe5RKejgGjKKqG2bO930q+1Ed7a+BITsEhkE5yuh6
	 i9NlLwvdi7IqZ2lVOBUTDx94QrjKKdaIYE2vT4noeSCntum3GxZvzJYSfG8iiH3cA8W0j
	 4qaKEHifVGCDy4oH+18INnE+IULFmgtaT6J6bLOWe/Xi+wWFeiLXKz9QEJR6hWtId60C/
	 3J5rwzXXGN2cm7AK/I2vve114tQQQ3HZrc/apF7dCiVBWK73BCpuuIE7t8QzS9pBYob/m
	 nLc+X2cCDomz000o/LOr/cQHWaiODqlU5sNVWyEXeqi3uvEpqj3U2OSMBI7gni1dqkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q9e5W7qSWUyRUqa8cuD0BBaWq/H42JlZYFTsfRPc5E4=;
	b=jtgo3KAmx4LKA6FzjVvwqFQezXgXEjg+Lm/YBbNK9BomBfQXyj+hPK99FyXsaP+jAgkH
	 BBcWC2Pi/vd6IONpuARTgW491YyjZhNntKQAgsqueM1QbQImBtyEW28PBHKYWqdAfkTuR
	 VuDyIvgaDqNUqYFck1OSYOvzkY+JPp3BajiWfXQrG/WFx6at95KOF9IqqmFrXga+xI/Mn
	 lMjZS9LebiywJuj6t00XStKHbmmfyM91Hc4eEYUjZxFABV1jyXSCRDUhMTgNoJlerTfLj
	 Ty8C3yfR1uECdHXUuPWYDZNILjAL/O20XSDJxwlm7jeH16Pb4qIaAb08VmKflyzf3gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ceUA+CcR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMs12bYw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BA1606EE87
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 23:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BA1606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ceUA+CcR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OMs12bYw
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LL7rf445914
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 23:19:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q9e5W7qSWUy
	RUqa8cuD0BBaWq/H42JlZYFTsfRPc5E4=; b=ceUA+CcRtaX3hNtwtUqQtfkv4bC
	CpcbX41vuEyT+DEo+RDEIb7ni23NCNcU3O+/j1FnjWT1jhaIdO5AlPf+iwfxrZPF
	D5x4+Qq57Gb56CxzKEALI0PZPZYbpogcV4+Zv2lNFa5G1/wEhFK6MbJqRjpbFS/o
	s6j0RfDSGDToLP4yVy9qsrfhDcP1v0Jie1qz7o5H7iLDOk8RnZ8B1FGUeSSxUhwD
	CfBdMc3rtRzioVNK37CxXkSMyxng5Gt3diaLwjKBSnnKE1rnD77Qq2avviviIYE5
	/5wMZZRpkJm5H6WeL7RSV57YdUgZigBomfHbnhQBSutXInEkfly/b4fYXVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8mruxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:19:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e987ec84afso781265ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 15:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793747947; x=1794352747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9e5W7qSWUyRUqa8cuD0BBaWq/H42JlZYFTsfRPc5E4=;
        b=OMs12bYwyr15w6p8z7zXc4xlkaPI1X8MX+KSoR7CoS/Y/Zk+RFSiadSaoNGaLZrltu
         QBsToRInapFuBSnzf4Kz6KzqX1R7azmpkGBOGI4JmzBjSrYCDIxkgf8Z2XE3v3qdpkNS
         PDd2Xh9xhyb2SkEnCqtM45sWzwBlbqkPv9E+C7rT02nHEMVZZCipAiEWXoZky7wr0ubK
         d6T3QpWT6ebLxPQuWequGwgtRj3ppbqCSSxc2DiJfo1dIE8LfULq6mqsSA0p9Sc/Z2Ks
         O50mtx8OuqIldBllRHqenIp+AkSwMwymn/y7Ce1vRpQWqGVbdNL4DNTC/AJt9eomm04B
         XTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747947; x=1794352747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q9e5W7qSWUyRUqa8cuD0BBaWq/H42JlZYFTsfRPc5E4=;
        b=JnfH5jPbUG7/QyONWiPoGl/r7txT2IWLNdPTDXZrxmUfDH4uEVN8D2Pd//9JPC993x
         8kZjSkws64+ot2OjTvefR2NJCfES1WR0jBGs64rHXxL1tfJ0dc9pscOZ819aHyjTiw+T
         G6BWKiQX+iDX5k1eo3f4NPJwmfpjY87AVswy6XeXs/gyNy2uH44fca+ItuNU5oMCdOBd
         otgVlYGjQZCOOyj6gvp4c3Pmad/Tg1N61ybrV92w1qTaxaWGCPgs7ib/YCIm878QO0g/
         +xWClAFVdR3q+umvtsGRcFXS2HHMBISNiUmRjOIE/EcENSOHqqXPtuzbnCbBoKNJS79R
         DC7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVl8g24LGp56tkLl4pcMangVkr8CSerET6eGDS3MWZYqx4pzfv9PH+p3y6iLQZWgecxbQYHd7IP7Ztx/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vn/rQqTGYa4R9Zna5T6q2en+YnHlE5cjgStJ039BM8q+8ggq/
	Ju+2LTRVWMzUzOi9V9ccs0ky8HnkpV7ciZRuVerpIFcTa9uuDZfs0YVY0lLEkSVFWnmAk0cuNDd
	9teda6O92Wpt64V95bLgJOeu3/DWNZvLJERfr5DDIN9pQ5jUsBnaKGy74lO08j/qLIWk=
X-Gm-Gg: AYBFou31EIoolQlM9x6pJFc2TBaCbljlgCURJAp6viTqWSJtgB8Cob1yZyspLwAK02y
	yADwPVtmZWZ13YHxfvFYT09zKrn/8zeWARUZfEugjRangt61ttiaiXg1d5UwZvW3qG/jARcPTAb
	aKTmn/DhHTuTLPZm+MUV6tcI51NGl2WaJ3p/IjiCpCWtodAj2lnp13iQ5YAAkgqVHg2bdgm9ZlW
	2KvlQlW2TVDpN1QOe2ZjwoVpz/F4JHIf1dSU2uxSUgz6kFWxtDZjICVwqL5Uh6Nq59/aNhmbNSK
	F0KMU6J/Krsxx6jBU2hT4Ly1CyPFs88XoPn8oKmVgScVoJA8Xwa7mlrFomu2YBjy6mZgVavFWls
	lYg+KejrEAxza99zATZH9INXLqq6JQkx0NpNG5cJuihNJvhV/Ob0ZGdECmX36vjbo+KaXR6UNym
	ihjU6s0KN3F0JUYl7QsnyUTSuAFG3dp/YQ6JvaKuiqIUF1gPRbYzm59taYWg==
X-Received: by 2002:a17:903:1b2b:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2eb36426f0fmr133796795ad.20.1793747946883;
        Tue, 03 Nov 2026 15:19:06 -0800 (PST)
X-Received: by 2002:a17:903:1b2b:b0:2e5:54b9:6b5c with SMTP id d9443c01a7336-2eb36426f0fmr133796555ad.20.1793747946394;
        Tue, 03 Nov 2026 15:19:06 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091723easm329635ad.58.2026.11.03.15.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:19:05 -0800 (PST)
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
Subject: [PATCH v4 6/6] drm/msm: Inhibit IFPC for state snapshot
Date: Tue,  3 Nov 2026 15:18:45 -0800
Message-ID: <20261103231850.17493-7-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: EjXasyLFMqYxYq3AucELcJ5YQIQQ6dWj
X-Proofpoint-ORIG-GUID: EjXasyLFMqYxYq3AucELcJ5YQIQQ6dWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX0Kgc52KCUOaS
 av8kR+UchU6uc+M9RDwUaKFXmBRzspe5z6wfNpwZVtO6v6DJ6lNfToXtBgiNB2b6jDCT0piqU8/
 26F/6yQF6PXm5FdQ74xq0qf34B4370CG9qboxJbmN7ZkRcG2hd9JN2T3PDZYcEHnvIZRGCBcVWD
 IsQLMzGKwfIiDVNjm5HpBsx54i1wYddeNAbOOhnC4ARp7QOJ8tuGrdKz9yEcQMKCwSKkNYsCQ1z
 IOPe8hmxfnROPo2J58YQEAxQt2hlwfimIKQ0h7PxpqVJDH/uIr7MwO6qS02uwjJrUWJdXnLrKMQ
 pD53h6aboOPRPN40H1aWYM1B1gBrDvlmYZuR4gWtGrgduzGpp4Yzg9C6jGdK2ykzpzLC/bmov7V
 bXLgc65eJoUJsXuDGFt4W4Kwy2q4Kk0advGYeIqD0Z6xycmzvGCrQxM/kbJqvKFHDr4FQrVX62d
 1+gQx4WezojAdN8Vs5A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA5MiBTYWx0ZWRfX8kwdweSAre2t
 wlVrgadv2lgKPYDpLlES0iPwL8UzSsBOg0UY4kaCNfISyRg0oyX0gYjyz0WEVMgKrZnMK7/xpYz
 XMEf43NPtTuA51klRQouvrdfUgviWdE=
X-Authority-Analysis: v=2.4 cv=HbWB3SE8 c=1 sm=1 tr=0 ts=6aea6beb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=eWlSUfSnBrBg5eVjM6UA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030092

We need the GPU to stay awake for this.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index aa59b28a3392..45df35d3cf90 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -83,6 +83,7 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 	scoped_guard (pm_runtime_active, &gpu->pdev->dev) {
 		scoped_cond_guard (mutex_intr, return -EINTR, &gpu->lock) {
 			msm_gpu_hw_init(gpu);
+			guard(ifpc_disable)(gpu);
 			show_priv->state = gpu->funcs->gpu_state_get(gpu);
 		}
 	}
-- 
2.56.0

