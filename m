Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E99A3F4DD9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790656122; cv=none; b=VwIQtQEpnOwE5COpqOgkP1Sv5Vbeopk+Bhmenn9aDeng1IVI6EXrZkyvCuFtvWzg84j3xmjqKslO+xdie88PU0Mq5lcNzK0//CeQGdOXA6VZq6esGzh2VSyqDd1GEWEPIA+Jqh0+qgUFFESaY6ujQNom6QP6srmbNMbocPUk2yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790656122; c=relaxed/simple;
	bh=2WHp6E6UvESdA7e8Ig6s/rlLlhgWELEP8B79xKxaQpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n1XlLaMcnH4VadcdgO+iI5CREkfxXd3EckktR3kg1KXjB2evqnSUqLurhLy08X/hxu5ydRSK+h9eUJuQpC9eiOx08c+sFiO7i4XfD6LrkRk8DX2iMJfj/bSXSSdC/pUbCsnyIZfFdLGMOXJZ+9F501/fIHproz79SuFxyqKvjeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QldwBsbK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Py3tLnho; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QldwBsbK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Py3tLnho"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T474tQ2686131
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ucAewFEOicvP/KWQ2feDjZcwzUKPmoTcok5VDj8TTs=; b=QldwBsbKXBs2hZlC
	SxtxMDzP67Vm5+9P730PvE2bIQhDjqbYe1kwVSAyg0qK2XoUnC58uHi0p3v6vN8Q
	7h+yF3GTgXLT5DYXgKv/pXXKytbjRXrMivp6+/FwD5aOtcyv7BaG9PVIlx5P7rO2
	6Z0M0tSiNHE0Kb0mmDoNiHYjbA5KJOPfnK0xZJ8wK2OF6ZW0ACUM0/HN+ZaYdn6k
	Z6tRFj2ctz55L+qEnV7NQ4Cjv9HzbVThvlmMZw780lce6VUiDBI0uk95P/Z4WZL7
	RWmSTjfIFdspKQ/IsK4okk6nY5DMJKFIxZZVqsGqHpjpmWcbyYe/FwXWXBjX3x+2
	d3v7jg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjgr75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:28:39 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91789a9107fso5211356d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790656119; x=1791260919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ucAewFEOicvP/KWQ2feDjZcwzUKPmoTcok5VDj8TTs=;
        b=Py3tLnhojaBeglPUXdatj6a9iszP0uGp/5qUk1nqcSSPntv+pBnC7tfkA1XV3Rx0AI
         QNhfSoi1bnDSBhMY0CV9YKfn3oz+qRo3O++U6aXYhWe+fUrxDNN120j7fbhniWyUqSnI
         1XeQNYrjAYxuPjCGSzAoRmjnzivFnjAVhv358rNPRWceQDZdFUODpjdNu03GujN94dcZ
         fQ0JNizaODsJmM3V9vBO6q3TvxqyHaYcFUOaFjcwSnDmtl8+q3ICv8fwUIJ07X1qDuft
         zY21GlOZKB8KKfP9o4j+DfdF18jlsdhngS9gcK0cU6SSN1LlpcPMf8aqAvXo+c3dHXzR
         Mp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790656119; x=1791260919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ucAewFEOicvP/KWQ2feDjZcwzUKPmoTcok5VDj8TTs=;
        b=K84ZE9jQdwiupkPFCbogVovIl7/BGqd/8KibgAK+JG5Amz4FVvCXWwnngyTFssjcAD
         iMNqaEUGmeJIKPUYkRFB+FWP1RMIyndSlpN2wf2N2i813fMpoj2u7zxgpvYa9W65myii
         xEe8njkygAUDDaySmFBvbhNq76Uc9Shkxixo2BianweJieBDnRfUur4fLA44MsiaP5bh
         MYI0C4qMkrWC5Omb9hfrqGfa2et1Qg0ehrzHaY/plOkZ4oowLH9qIyBOfqKO0RRY7Qgo
         pV6P/ylR+HCheUZJZ/lfM+i76CJX5sg4hD9z7r6v753IdYgPAyf6hYrIHdVk0iXSDHFn
         kSMA==
X-Forwarded-Encrypted: i=1; AKwUvBw9ZKFWQ6J4b1JVyV3/epSe+0FNTkIrw6PjJf7SM9ooOVgyH/O6JM2gVxuM/wgHvQFVeJ0TOnf5cVvTc1o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaNDhRcOx1DqWJM9TRfiIlUrHsStrBzTYXi4KncXDbdcYtZTeH
	JvBrVIbRDmtPAoNJBf6OOH4kCGDLqnbMRTZtTl/WWT8NnFRBOkVkuTl27f7vokMmXFrM23rIeB3
	TO2zfoPA17w/U9yoSdfXY+HZ7VPUrclJvdgcu31Lu5L+Oi7JYfI+dbcj4LX2zQACMy+o=
X-Gm-Gg: AYBFou0fZuIVGoduX+ro1h/FqvgzVUD/SzBuC0MV9mSzEXQmV0DxBxz5tCsVJESCzha
	VaI8V79w6EqofDjSYAkn24/JYbpc7ofFa+I5yuzQTjfcK7WO2hXBjxjbzcipCThoFI7Pu4DjI1o
	9YosebyHfZUcFD+21grwjle/MzvifE+nYZ4TvmSOUzWlqZZHni19DMwcWcNlX7DmInWYXsnSTT2
	HhWgKglRO9n7srYcKekybWJiipPh2XN5ELp/z8jKeLNFLg6TCt3BEZvvQLfgX49ONVMpF7d0d+y
	kRBY/wmoy4f90eqTloqefnjKgfX/cfQu4+vuctWkjypQ0YgAXVO+VG5Z5QeQ5y/JylaD6PNq3r4
	98M9UQjmWwn3RwofZ7SJ4TXcGMS2Xi6aSVTXjASLV3batgVZz5q47tu9MGowUlXU=
X-Received: by 2002:a05:6214:459b:b0:917:8d49:6c7c with SMTP id 6a1803df08f44-9178d496ddamr2990786d6.46.1790656119137;
        Mon, 28 Sep 2026 21:28:39 -0700 (PDT)
X-Received: by 2002:a05:6214:459b:b0:917:8d49:6c7c with SMTP id 6a1803df08f44-9178d496ddamr2990576d6.46.1790656118695;
        Mon, 28 Sep 2026 21:28:38 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d34d4ccsm1717206d6.30.2026.09.28.21.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:28:38 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:25:52 +0800
Subject: [PATCH v7 28/35] drm/msm/dp: wire MST helpers into atomic check
 and commit paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-msm-dp-mst-v7-28-4b81473185e7@oss.qualcomm.com>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
In-Reply-To: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790655983; l=3337;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=2WHp6E6UvESdA7e8Ig6s/rlLlhgWELEP8B79xKxaQpA=;
 b=9kqodMK9gej/xEASxTZeg8YusSLAl+3+lV+PTCAXF6M+K7dTYM/3ZsFb9VLUgeqoNr7eITh/X
 hi6sFSkx/fmAWRJ8AgO62FkJ+gy1rEEvvqCAo6OcEI0ndspLFQYGYjp
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX7v6LRWNhU/pa
 eYfHbtTbDE1tuAWaQyl3Cv4w3+MyDVfVwTH0+7SLPy+gpbdubGEf9gmggiXWM55CBXE/hTQ0Fy0
 dIhUrc16Tr5sk2V5XcnuHqq0TmdjFjHQi864A/9Ja26x9bHGDF0lk7IOc72SH6q/tnHXEfrmwHN
 /YfUWkZLAv9ziai7UXlRm+2V02IB8z2+iJg3a7vlTzd5YyZAp5nxfJRxKW9CnmLJt9k360D16/f
 9/5gdjsBj6t4J1eVSflHYGN8bRXudFQ9l2qFqGo/eTupYxwW4Payx7mpDEdy0I6uyJVsP3KbP12
 CU2ODARkCxQwmO0OGyms/sux5JUOXtNciv22jqm6i65VQm3/RUouy06oNmRERT+VBV0AD/lqBJY
 3bKBfSUxww4677cNESTrVVr6cpb/RoPj0wmD+zF/CDRSa4m3/+Kq9C9Dhvt1HHjYUOna4zTLjJ/
 4T8OuTDekwYTHj/rOoA==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb3e77 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=rXwVWE6-aGP_zC5-gXEA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNyBTYWx0ZWRfX7rv6bRO0lm9g
 7ZW/g9rfzjgwoLwYoKMg/4NOjJo84rLw1lx/1jnCNDR0yLJofi7mh/WGXYmvO4tkTM+47XMJ8Si
 nmpuP4bC8LWvGmSAtTyNcMv0Rt4lbGI=
X-Proofpoint-ORIG-GUID: 6vGiAXZWtQAfyzKkbeAE01KabirBvEoa
X-Proofpoint-GUID: 6vGiAXZWtQAfyzKkbeAE01KabirBvEoa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290017

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
index a8babf1dbe0d..e70e5088cfe5 100644
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
index 9d67425fecee..6d8a6779b4b3 100644
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
index e5d0ea629448..33ab30300e16 100644
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

