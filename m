Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769518;
	b=BsKEWnbOcs7OPRM/DoXKW3/zdmFHdKqsZcV3aDBe6ihwr4l7DbuOuZu08T6CyoHbBHsY
	 5dvyR1pf2XtMy9OXlua0mhoXZqr54PMwPMncLcB/GSqoxJ7LOvNFnP/J54laFFwshOjeA
	 lvCFnGmVhnI2f7szeIZh7zwbCT2JeX8KPJMWhJQaT2467EqlyBZk5KEA4NngqwAd4+Xhc
	 XU3DGUqSpzonUx8FBC5Lxfs5QEJpYA2E5FtYAdjSY4IuREC8LruZV3T0HTEZpJWhPMsKU
	 7oy/UuN1XPsKz7U8FGrMO4Yzxk/WSHuZkJ1YJRSD+Rb93ykEUOPBB1qYAsl9w+yb7fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769518;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X0RAPtvLQwr0f4zYSkwfWymS1oxVdn0ZzLk5Jnrs+0g=;
	b=pw8GMp/2g+AWDCdzsuOZyaRxHfY8E28gNM28YINGZvjK/mXHVd7nLs3HWNiCVWSt49lR
	 abh/mr4Gw8pv6uUi8IECgZZl0VZLrw9WbfYA5h2Gs9dP6bx0sKhFgSXY7jeaGj6E3oHG4
	 ly8WU7nnSmiG+Ep+1oATBLxoJHgt2BCI+I4PGzr3BSn5AYYft8i1KhThfhmmQuHmrifJ4
	 Y0QbjdtNOmUA/Lb6efEvetVo3cedKrUP5Nmo1Gl8+P6DWkGwwwJ4o472ZY8U2njhG0DGy
	 GRvQbZh9XdskfZR4VQ0ypUrRH/u7G1C9oeXnElLRiqGhJc3s35jvmx1ciX60JnP2pMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mYiHOJx7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ipOT7uei;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC30160A3804
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC30160A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mYiHOJx7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ipOT7uei
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE65UB1954963
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0RAPtvLQwr0f4zYSkwfWymS1oxVdn0ZzLk5Jnrs+0g=; b=mYiHOJx7nxAPfLHn
	b7ASTqQEyOGZjEi9FepmOGL274DHViQKxhFSCy8GbcxMcZS1U6N+40dgRZUmu3Z0
	Lf9GcwmjuoKGIDY3IZjMefGu7NZl7Mh4r3KSnSLYjh2m99d3BCtKAtMSWwuJg2rq
	+DlnJe4ioW6hhQ0A5wp1jA+k3uJxdYewYdcKi6TVnWj4O0tVtD1YmshNvAU5C19V
	BF93yH4v9B4LvnV7vPtbHMsvAh+P3EVs/K3EoX3o/C/7nrhAe1+Fdlu5QQbFJBUc
	qcB6tV9y0lMO9sOjBeztGpNZQKiMsfEyDld7ruLxXinz47kFXQ+p29dIC207x5An
	fOKX6Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbmbvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:31:56 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-988bc0ef0easo171904241.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769516; x=1793374316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0RAPtvLQwr0f4zYSkwfWymS1oxVdn0ZzLk5Jnrs+0g=;
        b=ipOT7ueiNkTL385BiH7bvXsxp4rvxHSHqLhqtSp1DE0+WWvyedKFwtJq6JzocGFAKl
         99dgN130dqW7fRWZDHHQTSuntGTDpFWiW94X7RDEVgi1L0YesoJxqwyzh25s/wQ0No/E
         e8EUMCidhLdmA8F2Vg3O/eSUFmRv/31awTFJwPoiGspURk0BPyZDZCnKda9HCqoHcAzu
         DFEiQ7aniJNIKaMMRj+IEVlR9ese2qJTO1vgc307W6YTnYzByYZePsS/rB8ODJvxKBV7
         SYrYKYPsplO+9/Xu10L/+16V9AVKrPTobtFYA/S20yRCFIwzHoyaoMuuwNS4MKli0HRb
         Vtsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769516; x=1793374316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0RAPtvLQwr0f4zYSkwfWymS1oxVdn0ZzLk5Jnrs+0g=;
        b=vdT/tFqjZe84WSuVjMZWt8Lqpkoahx9jE0ZrbT/IBR+KW5ZgbJ7RDl+2WXT+5VRSoV
         vjMisWIcirelnM5fhKC7SSC2i38u88Mq5skAudvEnAkVIyMZ9VBaiuINoagQLu/Dezsj
         27ExyxjSq8UrPF9QErnnJlr9wOQBmRiZGm6OimhtO68khBvMLiqizU2DQllfeXF5/AEV
         sUx/EZ/ssAV8vk3PT0uhqML7YkQoa12qwLkQN4fMPMvcH4YLSii2GPjCjoi4J68CKBc+
         ABxASrNK55dnScFf9Thp1vkdyhA5K2N/vqvipPvTZGfRP7s08VEJ9+LjuLx2Qq/Jbuoj
         Ztdw==
X-Forwarded-Encrypted: i=1; AKwUvBzP1RhrnEECM3R9lGsgsld3SUQCwQkDCZkl6kAe5kKbGe2B+jCX6Dixdf70FTTQzmabdpVsmQyYAd4BzXQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbptac/0qKANpaTq6/0OGacCHlc3488GGoWepIeFYMvqh5q2eI
	YjI4WCy5QNfwWKigQifKSV5Hkm4ci5BawcGn0nWmql6JiORshNnvVDKFH8kyQCDoeTLUA4/DsQ6
	HRiPnVNqNYxguBW95YRsp3ZEemrDJwvlDtsE+icBkpazdGjV6/LXUbczxlCzwlqK7LmE=
X-Gm-Gg: AYBFou2WJOAthxkBl2L9NDropPQHcmu0LyHJjdo2tPpkooFC0EUiGSwxCJF4y0bNhY6
	I3fPfF9m7VJs2EVkvjmio0RBvEf14v0E08w5WmRtMaUIc7uFRtFGb8NuQRowBOsD4LEuiDpmlAZ
	F+QSWC3afVd+PtAnyPHZKsBCnsif4RnrF7Rcu0PIbhZEoAhlyu+FA6KnvMeuX6Lfj5rNLQtf4pp
	q3zy85diQSo+uXHYByEaXBioFBzl1nuJOVH4RAlKIOYuCuZJcqSuz75mVeOfaxCNvg26iYKHnjR
	OKIpl7lNoYDh34Sg79TzwczQRYF2vbHhkHD/r+fabzrC6GKd4WDPmWWtpEaqtSZtSd0ZiLmuYXb
	eoPejNRy7M2i/jAzEUG+8KWQAQTmDNmNECfJb4NGruH/QVTtkB3n/7++X/gJEZCHHzkEOC3BHvI
	GbVXaHL385SCKf
X-Received: by 2002:a05:6102:6445:b0:7cc:5c9d:7e07 with SMTP id ada2fe7eead31-7ccc333f2b9mr842407137.11.1792769516168;
        Fri, 23 Oct 2026 08:31:56 -0700 (PDT)
X-Received: by 2002:a05:6102:6445:b0:7cc:5c9d:7e07 with SMTP id ada2fe7eead31-7ccc333f2b9mr842373137.11.1792769515588;
        Fri, 23 Oct 2026 08:31:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb0288806sm478062e87.55.2026.10.23.08.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:31:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 18:31:21 +0300
Subject: [PATCH v2 06/14] drm/msm: let the kms drivers clean up a failed
 kms_init()
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
Message-Id: <20261023-msm-kms-destroy-fixes-v2-6-83727c122de7@oss.qualcomm.com>
References: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
In-Reply-To: <20261023-msm-kms-destroy-fixes-v2-0-83727c122de7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3336;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HoBk7ONYzI5BFZMtAgm7hFiVZaXXxP5N1D12n+PHNRw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq233UKjB0AzguQYF20e8Xuq63PgYz6kHfXh5gE
 5kPH91raPaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatt91AAKCRCLPIo+Aiko
 1X6mB/0bHqsjhDghFWjXfNU0zQc5MkIGyr/gkhtFldPT4yz9VXOSKp9Bi45NVW76zBAGw8SYl8E
 LZhfWnxdEXhD1/hXnvN/0kB/iqC5CYBT9CoE+ArNeokZBFGLsD95p+3+dXLqsLrUo2bh3Aqv72N
 F+alAWrDDcP3Ht0jATqtiJS2U09LleaU4jzM1PmJW/4+yMA2PoJ1Z/yeaAcctTujmnGK0i+e9rN
 Oj+ydwq7GmKVAPtE8L7qhlYkdYfEWjWizmgryPYMTlsdgNQVu4V83jCgqyvrSM/l8MbBjcWzqzi
 izqnB9e7PpvdV37vfcqtJQqDTXWUtaWE2jSTySSVxgiY39P8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXyAu+ZE5sqeIl
 0aoVZKmTvs9GLC4fc18Bi/P0a0YYqPbuSFhoemcH/ttzHXwtEFh6PirRYJJjfE8N0L6YiXlhLHD
 JR9V4u9qG1DsjWXGio4tS+s8z80WyvM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfXxr8YExoGVEfl
 6Xc0kU0IoiULoV4UtiPhnMGFpxbU58Btvcx9Oarbyvm1dclbKKxcGTCXqHdgCcqE+fc7dTbTNXO
 /sBfst4igK7NqAholOzm40gOQsGz0C1W0oKxHexvOVHWn9H5sCwlscSo24BIQVUyW2SfkHFCJwv
 nkTXgJVTD43gnVL6m990Q+H3TGw1p4goNnH0T12U5Gvk7WrzqUDVc/xu+ceGXH4LJuwXnL4r+Dk
 40CjKeHJN6pN77RXuk0Zcie16PA/MXPobEjvQBBIqPVtTquk1v4Y8EmKCUwqH+xxZrcvZ1rwUb5
 CTN7Airp90TdaDqZIP9OmqY9TQLmzg73yvbSVWSVx0XMEyLUJLX/tT993XFNFHPnLVRpNr8umy1
 5mDo5vjoyA1PUhg9nV13otok2Ms4ST0A9jhKv9O7OBKsc/oPB29Ez1adhowlYGMDZc2vxwEijth
 N7Cp4IZcGqanCBwcuCQ==
X-Proofpoint-ORIG-GUID: 9h8L2gfXblYTNkJg81o99YMKLoDCN3sh
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb7dec cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=DqDluaqBKgvBNGcJzpYA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 9h8L2gfXblYTNkJg81o99YMKLoDCN3sh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060

A failed priv->kms_init() or ->hw_init() is cleaned up by the ->destroy()
callback, which makes ->destroy() responsible for tearing down a KMS in
any state between "not initialised at all" and "fully initialised". The
kernel convention is the opposite: a function which fails undoes its own
steps, and the teardown only ever sees a fully set up object.

Let the kms drivers switch to that convention one at a time: skip
->destroy() after a failed kms_init() of a driver which sets
init_unwinds, and let the drivers fold their hardware setup into
kms_init() and drop ->hw_init(). Set up the mode config before calling
kms_init(), so that it is already in place for the hardware setup.

While at it, tear the snapshot worker down after the KMS, in the reverse
order of its setup. Nothing queues a snapshot until msm_drm_kms_init()
has succeeded, so no dump can be pending when the KMS goes away.

The flag and the optional ->hw_init() go away once all the drivers have
been converted.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_kms.c | 23 ++++++++++++++---------
 drivers/gpu/drm/msm/msm_kms.h |  3 +++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index a94d2888a21e..e4d61935a6df 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -283,12 +283,6 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		return ret;
 	}
 
-	ret = priv->kms_init(ddev);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "failed to load kms\n");
-		goto err_destroy_kms;
-	}
-
 	/* Enable normalization of plane zpos */
 	ddev->mode_config.normalize_zpos = true;
 
@@ -296,12 +290,22 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 	ddev->mode_config.helper_private = &mode_config_helper_funcs;
 
 	kms->dev = ddev;
-	ret = kms->funcs->hw_init(kms);
+	ret = priv->kms_init(ddev);
 	if (ret) {
-		DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
+		DRM_DEV_ERROR(dev, "failed to load kms\n");
+		if (kms->init_unwinds)
+			goto err_destroy_snapshot;
 		goto err_destroy_kms;
 	}
 
+	if (kms->funcs->hw_init) {
+		ret = kms->funcs->hw_init(kms);
+		if (ret) {
+			DRM_DEV_ERROR(dev, "kms hw init failed: %d\n", ret);
+			goto err_destroy_kms;
+		}
+	}
+
 	drm_helper_move_panel_connectors_to_head(ddev);
 
 	drm_for_each_crtc(crtc, ddev) {
@@ -344,9 +348,10 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 err_destroy_event_threads:
 	msm_drm_kms_destroy_event_threads(kms);
 err_destroy_kms:
-	msm_disp_snapshot_destroy(ddev);
 	if (kms->funcs)
 		kms->funcs->destroy(kms);
+err_destroy_snapshot:
+	msm_disp_snapshot_destroy(ddev);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index ee98393b9855..2f097e23e2e9 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -149,6 +149,9 @@ struct msm_kms {
 	int irq;
 	bool irq_requested;
 
+	/* set by the kms drivers whose kms_init() undoes its own failures */
+	bool init_unwinds;
+
 	/* rate limit the snapshot capture to once per attach */
 	atomic_t fault_snapshot_capture;
 

-- 
2.47.3

