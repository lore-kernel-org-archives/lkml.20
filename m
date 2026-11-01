Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793555365;
	b=k6d0n2/7DOS00zidJRCQ/5Y1BYRdde53U8Kf4eki9HmeQejxMPL5MbP2cgf1VgZbpXmq
	 swJsWWAxTDyqTpXpMjkP513APl6n3bUS4G41CxpqoZDZEoGEhjdLFseCtjwYaytF1ZSaV
	 fwglNw7U7XEkNwIYTwEI2/+OM9WS/e6JOmTfLX3NkV2+0CxOukPDFwmAa9bwAsKPEwBhw
	 KJiYx42NHerOJaSGIEiiPFfp2FZeRCANYQSrweYyWwrZAEwF1USuEUyX7lhybxmfASUHI
	 6EyA4ePLKyXte8R5SAu+87aO41t/ezulToAXeojKrh56Y4ZjpmL0OxYBaGmgp3YC7nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793555365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PfKYqLgzZzmYKZpUbUyekzc0kmd71RSx1CMCJtY98mY=;
	b=LEomfeB8pTqBdRn/twKPnUZ9SFaYt8+SbADx7W9ZuYqewxbIJ1EvgvXpUA1nVeP9amuz
	 dbuZepzHGQ6sNcHlU5t7Y/xg+Ar8jYG1L8rBvtDPXtLf6vc6urd5VxJacTzXQ/NLt69kl
	 59k5smyF5tx2fAkGiyVE0W8dWVGywnu/VsmxMaygWltZKxm78hU0dLeQRmGJUuEgD7jHa
	 vFw5eXzNr5rMBvM3oxInPoiKBW5hQzQYQ3cxtuwt+bMiST1zyVBjA7VoRPiIGofw5atFq
	 PQc8s8sXI+LywJCMPZEYFtr3zZ3NK7JH70cTr4E2zLpIkEMupuyV2SqbEwPO6J8dHLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=chtUgxUh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ns0tYM9C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11D060A260A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 17:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D11D060A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=chtUgxUh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ns0tYM9C
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HQjxW1444979
	for <linux-kernel@vger.kernel.org>; Sun, 1 Nov 2026 17:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PfKYqLgzZzm
	YKZpUbUyekzc0kmd71RSx1CMCJtY98mY=; b=chtUgxUhfKLFu4EYyhY58yJJTJh
	NfS08mSF8ubxnpT5RrUk5TPrC63MrpBbf2mBqHndJSVS/AcmIy7EtrdNMXPL88eo
	0yixR1GcWGnktQv7DagFtfpTbxJXm32d+79ixb+7Fa7Sr9jQ8KBbFPj0+zAznRjy
	efJafFfOYMb9b9J8mwOUGyD11IXk4twtOpP+HianywROkdP9LcXP7bMhNIaXHM8/
	6vLHMEz6m6o5yzzC9DdDDMlV24Wx/dyIimumOsviYSaGaedkDrfpLj6p/Z0ohKi3
	sy9eG0pbctSRyUKt+poSJDwH9zFHiCeUaTaWw4nGH9/r+vyAb+Z+2M+VvmA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8dububs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 17:49:23 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac6795617aso1570140a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 09:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793555363; x=1794160163; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PfKYqLgzZzmYKZpUbUyekzc0kmd71RSx1CMCJtY98mY=;
        b=Ns0tYM9CULKTBopqrL2krgwAWVjHsc1t6NkUtr5J+syvpN/987MmjZQjG7OTMfRGzi
         U+K3TxIOnHLYoXgzveFlhH/gJYP1qjtlVavNVX2un0D07zuu/1CvXC5BY4ixDH5K4irX
         CFs7KKGhENTTw+HLY1qGs3kP3W36paNdCrDVXPtANx0hqllwIi6+bVR07vL+VaikZugK
         XfkdFqvukJ1bIto1eWyy5X+3yDKwNukw2WcGZQ29s8RFuxqMzm9K+dF98C39LNEbZP9m
         neKFVME2GDQsSIxOWzvgq+XQow2KFPniipo7+DmwhCZ4rVtOq3LxgC20cyK9FU4zt2/U
         pwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793555363; x=1794160163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PfKYqLgzZzmYKZpUbUyekzc0kmd71RSx1CMCJtY98mY=;
        b=ScdWnwUwGD7YoiyMa2T2HnQ2VbdM6w5h8aJRIQX+Qoiwgt9Z144HNgg/n5h3dgghVA
         Q++3TDwFfpxejHU4dzIYL4wIP7rFaG1jIKK23w7ohBhhHB5gTVV2XNzQ8B7pGql104an
         4fE//O0QjcD1LdAOJeurpp41e+ezIfXunaN9eSZkrk5kh18tsadPgoj0iGvFyrbUdSpA
         LxU1nqyFTOCusmlCUgAuiGwuP0AkWJgvlFIw4h7owKx/24AgaJcns/K1CCiaoUeoZx0f
         BWrNN1Bk6kniJ+CvKcDn1vF8lXzIVIqI9IlhkKp+iNcGOwFiifkmjlPIi2tDwii9aFrt
         udGQ==
X-Forwarded-Encrypted: i=1; AKwUvByQe4QJP++wnmdqQoxPJ4Q3xo1iXxu5DcZsgn86FgaH9jK3kqVSbmiTdIXuREfPZxyXiDqFqLNbxaqKISA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HDlc6uv2yzy4E8uQT8OTV3p1hoYPn5lbqrS9wRAKYNGIpF6GK
	9NWqlSiTT6GesK1z6dKERjGlfbDhrdVi5Jccyt49wBsZlLoUPC3ssnH/bJVW+PU+W4u73AEPJV/
	SjTUEFw84Vi8yjI1KL9Ku26Y56xvRfbzrpET0zd3JXyfvGO8g12/KqQp2KfuX0268qQA=
X-Gm-Gg: AYBFou0q3jMbJ22YxnWhkRDYUVXFQ7dv7d5c1NhfK9VumVlLLj5xBVGJ/1ARKyFVcyr
	/Yuu3MDmsK1iVOCdsOPVIZazx6V2TUa+8imBeyMOsa642TarDPnq1mTINmP0Gw4r2G+wn7rsCQ0
	D6lTvVTn8owuZ1j5FSIubsX2+3/XgP3SyrgWZP/XPBKlJM0Dr224Ax98swCtK7eIMzfb16em9M0
	mRnNB5vuZ7RrAN/R5wU2SxXjddI4J4ignjw1hgRk1hynk2rNewUPUZ6kA2gyWZLWxEYa762NWCv
	Wq9vvBrZYVV2ko59zhPLolAGm7la67wpA5nE1lje+kivaHSL3BuHmUpZoqlje9woekIzoCfmw5/
	PXtkOfOwzomGysVE2UXFJzvRu11E7U3rSRHNni/+CAu7xg1l82gyC6XDFFDnQK4Vp+rO+ck19pI
	WIynazwFDemLRi+RPCfkrBCvs=
X-Received: by 2002:a17:90b:3d88:b0:3ad:370f:46be with SMTP id 98e67ed59e1d1-3ae8980ee00mr6291776a91.36.1793555362852;
        Sun, 01 Nov 2026 09:49:22 -0800 (PST)
X-Received: by 2002:a17:90b:3d88:b0:3ad:370f:46be with SMTP id 98e67ed59e1d1-3ae8980ee00mr6291756a91.36.1793555362395;
        Sun, 01 Nov 2026 09:49:22 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f3e087sm6386285a91.1.2026.11.01.09.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:49:21 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm/gem: Disallow nr_bos for VM_BIND contexts
Date: Sun,  1 Nov 2026 09:49:10 -0800
Message-ID: <20261101174911.25184-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
References: <20261101174911.25184-1-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae77ba3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=5-JVGYL1QLZbPSRHqMAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: Dnq-SzRQofQaCscFHZ1WVZGbNSqW5fBr
X-Proofpoint-GUID: Dnq-SzRQofQaCscFHZ1WVZGbNSqW5fBr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfX9MC/hT4DJkh/
 bfsFrFqJ0TpacK1sQOryy89WzVPMg7IOPDwrI2P0dOkRNO0Hx/i0qbSZW7blI9D33KfVRzmdeSd
 1pNpj5n19j8k4RQDrbWUpJ3hycsKPq02jZb1wVdxyDvHFFi0tenovflX2cwcS+l7lBA2RVrDrzG
 dLG238d350tVP1yP6JiJM1x07UlL7BZBUnRzFW7S7ZNgzTG1UiJfgx0LwEdajnCG/Z132P5TF8v
 VW1BE3KzW8BVMoG0zRHEm7IlLDpQSXSufS6Q7uO0wYSgduef510xLMvbEaROfPri++tuw1itnfU
 aU8HXbAarxnMVdlB1p4nxCFpIGqp3VAbqn15h1sc9Cv7Z8qAUrwMrlTLcoiviCISn1BrYwMstM+
 uhl5SS1Db3+/J6bD/Uf6mM89naZJukpNjgpXO5L7T946xGmO8RotFE/qmRHhcI603BZctnSdiO6
 XbRoFh0Ob4Yun/z1YbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3MCBTYWx0ZWRfXyzVs6muhGVav
 zi/gCZNFzRce3sIKIxnzGAsm8v2UbxWwaOKFs+tq8gJXfzXdUBciLPMJCWTsLpGcs6w5qJEgh42
 e0OABfbXgJmSTJehwK2GgRgJJdfX2yE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010070

If using VM_BIND, it is invalid to attach BOs to a GEM_SUBMIT ioctl.
Only the VM_BIND ioctl should be used for binding objects.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index ff6cf39587c9..b558d07ed2b6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -272,7 +272,7 @@ static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
 	struct drm_exec *exec = &submit->exec;
 	int ret = 0;
 
-	drm_exec_init(&submit->exec, flags, submit->nr_bos);
+	drm_exec_init(&submit->exec, flags, 0);
 	submit->has_exec = true;
 
 	drm_exec_until_all_locked (&submit->exec) {
@@ -589,6 +589,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
+	if (msm_context_is_vmbind(ctx) && args->nr_bos)
+		return UERR(EINVAL, dev, "invalid nr_bos, must be zero for VM_BIND contexts");
+
 	queue = msm_submitqueue_get(ctx, args->queueid);
 	if (!queue)
 		return -ENOENT;
-- 
2.56.0

