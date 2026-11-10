Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286583;
	b=WwxnFpF6lCs1RJQQwc7hpxfSadp/StXiyJIfuOuBP+joOA60r34MBoufS/K7TStgF6Ml
	 xY+aF60GHeI72ZbffH3HeNULSIvvMI1UTiEfGsQTrsfFQEQhDBX8WgmYwyMeFS3GMgmjO
	 O/ZK/0YU9v9sqTiNFrYdHSFDedR4rjDBCSLopJ1p02/4iesxLGsqKQFq+KmZOTqqgcDVh
	 k3RZ8p4ISPd5NaunXs+sOXn0BmUpwUpbui+VEFW2I9kDVZsjuLHikKCPcp1PWOSgbVolN
	 hc1uN1mpMZJgOiyL5psFGT4hZXlWj4CQWWusneG//6MQWE7sDJlLW/LnHoj/+wFxoaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286583;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gNMAZ74nOlHBL+Q6uH6uEldYPzcE1yDEmKde5l1Npwk=;
	b=Ls6InEka9dTyGD+2Sz5T2I5BUCF8f1fZOa2RTQzDlIJRsyDTAycBa5+AaSwPQjZWR3nl
	 zpA+wQEhV7ODKtIkSzrB833IP/R0UJiTvH/WGJ3ZCTZw9FCpXdFvQoSiMoWhqhtD0rUpW
	 wJqEeLjkcnb5P6dryoO0GxrvH96r3bVbbyxf0/qb0P3MCRQLk0SOMGJYfgRzkllWFX0do
	 D3sjQmPm83w512z7tbLHVn80oKL9bAbHBQn6NlvrFI0GcbJyCfRTPXjxLzUZy9ao33LhX
	 N1qr1JYoyKWvKIShwaI095oDJPfygLXJoXQFiSencgGA3WpvIn3G9BS6rp/eY/xAaHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RzfuSFdh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YfbxIIQZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8A1606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B8A1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RzfuSFdh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YfbxIIQZ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4ALOb1208150
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNMAZ74nOlHBL+Q6uH6uEldYPzcE1yDEmKde5l1Npwk=; b=RzfuSFdhQ5952aXu
	cirCOYQZC7ICfSLnHOqeDszI1BIU7N4tKTMSJjegbhRBU9ZRGJO67Mon01ROKWXH
	mJMPJEL+4WMQYdbKxrujlKc8Yt8Vo03kmfdnR0ZGFvJb1umf2wDwa8WAuRVWy5gA
	8bHfrByiCMdL0B9WCh6+ePl5k9Ougt3Dg7XcfEP47g6K3aAXjjV43o3LFi3mmywJ
	yHeoeazc7mgIqXn6cfcSJrIo/XTQwc+4U66m/g2v8aReb2C2E+QKlOM1TikGJQYR
	lRstc6Q04cE6/zKZZ/mIiSkF4D0hZe77F2w7fUg42j4rJYN562Jyh7sokYJYdNCr
	yKFdCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hunwkhfb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:56:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so351606385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286581; x=1794891381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNMAZ74nOlHBL+Q6uH6uEldYPzcE1yDEmKde5l1Npwk=;
        b=YfbxIIQZx2qu308XhdFt1QOT9/eAtLx06gooIvSxS6Ol/PyFnJd/0Tv1HK7On2DWcJ
         KVguPElgqyQyudFNXE8siEKefvrVvCxHrXTshsBRmuX9QhDGxeDOrsGqQVX1budYzv47
         TNWCZriZvf9BhK+4Lr1WfLY/5sPlF3+SVwegEZ0peIoYImwfG8byF5fSsS67AJ6FB2WS
         54sCqq7z9kTr1qnmmKnZ3osJiv4hDT2GEXLmgdPEB+dW3ZpcGOKzaTiG8HT9zXK+4bdb
         Jvr01PG17s0KCxajV3kzLVSs/m4mQevZp0N1R/RuEa0pJBZDz9yw3ejqma9TbcdRet0k
         7r5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286581; x=1794891381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNMAZ74nOlHBL+Q6uH6uEldYPzcE1yDEmKde5l1Npwk=;
        b=XBFJNyCaHT3/lpEgp9bNrEjCMjY6rmEl4wcsiAgHe+1HzicRGD7WRSTjEP2rQjsjd2
         XKVJoq2rSi/1RmSt18q/7pCm3kndC6b206HJ3Tp8ifAtC+ywv2u+5o6EQtgsxmH9t8nC
         aJjF24l+dw9GzAadwAMMSefVcCU4TY7J/BJc1aO5TrRXEnxs583I5zZD8d3BUkD29J79
         PIKDua4vRQ0fp7bk1kY4uGN/eYTxbOghzZ1Y/qk9eRxtwCEfF2iaCTWvfcReyF+s+OvA
         AJw0xiHwbxapRPCqSEHGwhJFfCm06ZoeuIhQWmlTVas+Ipp9vPQ+QuJBrAbYR/0tZs6I
         PVxg==
X-Forwarded-Encrypted: i=1; AL+hErEGV0JM/nlBBLTjgYJNKF6riAaen11pXD2Kgs1MhhWfi/E6UWAocYf00ADj+4cFPF95hAfiooGMyWo6uTg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Gtx6t8GkNlvlqnx3a2xrBJ/fH/s1IzOzy6s8fwjlAop7IzMEJ
	vpA1LkMi6PfafnH48MqcVAyBSUJKvsLig7BwaPU/53+YS5ZEEddxxn5pKaZT1jvRSdDT21lP7ZK
	AgMOcjd6JTgeqtLfTxjxquX935jewzGTek6ZMuNZC7gu3MgpSKrcREcQhb9TrOZhdQNk=
X-Gm-Gg: AYBFou214f6N+Xmpo2kfFumTjKGVatinP6rALdQURlht4nRYpkM1w/s4nNtJsPAqw7X
	lwKQG7plpDfj1zHqOsjS+LSHLp4ZD0XHCFLhcZ6AdJadEp2lmzReuZ5irmILwW++QS1A9EfDisi
	Sep1pQqCKAXAzhsLznKFL01US26jNCJ0zpClI4wi8Q+dUVRG8YHJrp4T4HFUUZUzEBAq06Gfb82
	yTHQahu14W3ke90z9BxYRDbozY8SC7v8ERlEfR4a0/FhqKww8beo4F1MjGCZIQKNmAw4hndxAe2
	I6vlxlOqDbxKf8D8faSlLNaHlIoaB0cmEAYA7cgboBr+jvrJDTtGCKZh9y6QsD0m6RQwE49bsc9
	UKJJNlPJUCJ56GoA8c/hVhsUYffiUJF5DqxMfk1eqJfpHubrVLHZHu+u5pxHkuOrjjK1jqTTmH/
	XlTTI1iOQZVpFb3qdISlQV6SgpjDx4pKR9832J
X-Received: by 2002:a05:620a:372c:b0:93b:d7a0:d9db with SMTP id af79cd13be357-9479f2e9e36mr260569085a.53.1794286581240;
        Mon, 09 Nov 2026 20:56:21 -0800 (PST)
X-Received: by 2002:a05:620a:372c:b0:93b:d7a0:d9db with SMTP id af79cd13be357-9479f2e9e36mr260567285a.53.1794286580766;
        Mon, 09 Nov 2026 20:56:20 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:56:20 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:43 +0800
Subject: [PATCH v8 22/29] drm/msm/dp: wire MST helpers into atomic check
 and commit paths
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-msm-dp-mst-v8-22-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=3343;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=AdBLBWWEc6vpplMBiBDW6FZCSILo6YakvdgN8c22ZTs=;
 b=+nn+fqbCq38uv/cS+G9pgRip4Cl6d61cANKpVXId41EtIwyNXBmAsnJKySqi7BCfV3ViaHji8
 TCoKQRmY/NwBREIn0KwYte9cpwjUevuOEEfyXYCiWfCR+Y1n4quKLbu
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: GEioiYVys2i-EbmnZvFhVN-8FT6mlg6d
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX9w0fzMfwtsgL
 /vrpNsQGw0Dd+RRUSFwNm0QLdJPdV+wSMiyEOhkuSAbsZD6Bsjbn1+5rf+Zk7u4TvuYIIj1eCER
 y16/9nGCNb/q7R1wldUsxjhU4CIWq/4=
X-Authority-Analysis: v=2.4 cv=TOrQ2Fla c=1 sm=1 tr=0 ts=6af2a3f6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=rXwVWE6-aGP_zC5-gXEA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GEioiYVys2i-EbmnZvFhVN-8FT6mlg6d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX5dav0hOhSZKi
 XbJCOoi297ZIaK7jS/553CEyvuj+YAWm105g8SeJFSLbJZNvLvfILwjnUMcMb1GLHB3CqGJRy5O
 BUB9ZFiFSBx6uykxzkicsp4Uhr+0uS0V9kMhVjW1UHOS4Lcr8+UOiFvyxN5BqstnhON6fqokGny
 Yl+zqGuiaBig1aFBf2Z0gA85mIfhK2aUBtIjz8ZrbApo/CBQPF1xQbmbXJvrPmO5G2t3YIaFX2x
 YcvF3948Kh1jtlgkdlKaU6QL8ccnwkUgnFYLw+TROR5kPLHhqjE8HuOxFp5/q1RbQp9XcfDPcXU
 ZtV8zm7ketL4mLJGZQ8ZUkevZcbGG7WWEBwbpJ1GperrSS5DWfZo5QSP6kPSf7MgJsd+Q7iduJh
 4W0GgxlledFXulP6TGGEQ0xsLnMIPWxgCtG4P6fUj9w1pjLzGpW+jTlLBC/GYMwSaWbbcU5Q/5X
 90oDsGuo0Gm0I2TxPug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

Call drm_dp_mst_atomic_check() from msm_atomic_check() so MST-specific
state, such as connector and topology changes, is validated as part of
the atomic check.

Hook the MST helpers into atomic_commit_setup() and
atomic_commit_tail() to support non-blocking atomic commits for
DisplayPort MST, and ensure MST commits properly wait for dependencies.

For SST, non-blocking commits are already handled via commit_tail(),
which waits for dependencies in the DRM core.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 14 +++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h    |  1 +
 drivers/gpu/drm/msm/msm_kms.c    |  1 +
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a8babf1dbe0d3..e70e5088cfe53 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_dp_mst_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_vblank.h>
 
@@ -207,7 +208,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
 	if (ret)
 		return ret;
 
-	return drm_atomic_helper_check(dev, state);
+	ret = drm_atomic_helper_check(dev, state);
+	if (ret)
+		return ret;
+
+	return drm_dp_mst_atomic_check(state);
 }
 
 void msm_atomic_commit_tail(struct drm_atomic_commit *state)
@@ -221,6 +226,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
 
 	trace_msm_atomic_commit_tail_start(async, crtc_mask);
 
+	drm_dp_mst_atomic_wait_for_dependencies(state);
+
 	kms->funcs->enable_commit(kms);
 
 	/*
@@ -322,3 +329,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
 
 	trace_msm_atomic_commit_tail_finish(async, crtc_mask);
 }
+
+int msm_atomic_commit_setup(struct drm_atomic_commit *state)
+{
+	return drm_dp_mst_atomic_setup_commit(state);
+}
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 597728ec6f3b5..ebbc138935c43 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -211,6 +211,7 @@ int msm_atomic_init_pending_timer(struct msm_pending_timer *timer,
 		struct msm_kms *kms, int crtc_idx);
 void msm_atomic_destroy_pending_timer(struct msm_pending_timer *timer);
 void msm_atomic_commit_tail(struct drm_atomic_commit *state);
+int msm_atomic_commit_setup(struct drm_atomic_commit *state);
 int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state);
 struct drm_atomic_commit *msm_atomic_state_alloc(struct drm_device *dev);
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index e5d0ea6294484..33ab30300e16d 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -29,6 +29,7 @@ static const struct drm_mode_config_funcs mode_config_funcs = {
 
 static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
+	.atomic_commit_setup = msm_atomic_commit_setup,
 };
 
 static irqreturn_t msm_irq(int irq, void *arg)

-- 
2.43.0

