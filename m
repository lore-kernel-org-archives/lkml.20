Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792942865;
	b=ZDWccenMYZL45FdLLwtOhv0ebw02g3fE6LGkLGQPa6wFZa1GVf08a/Ixx7g9Tplhuwxa
	 MUSI366caUaxy/oHS0+qluJmeC4qlUZbJdw1SM6WLp5KQnaBlnkqxGjfelqqQs3vPMw4O
	 h1emFxYEKRUDXrSIOSxdMamkZ+4OJKm43Y/FEtEy2mS82OBSa3RKjHE/ZbC2TRIO9ukqD
	 dB3VzTwvxOvJHotT4b5u2VRDWvjhSbF81drOJ5aavcE/cDPoKaChNeFRuCAhtVlsUv1ib
	 zz+a/0lCrvv4AYA+/QSx6vCGIiSNA6dxMCfXqCye8wpIjX4rmO2JVoPfLN7MBXjlANQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792942865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2P9JdGvVOuabXAYBNZP9kGprHfBEphnCnz0cLxFDPGU=;
	b=LAuBUz7VNgU+chirz2g0YiheKDd89XTctQZ5+sZ5mUwYt/b/NoJWJaNGQ+z90GIai7qI
	 0xlbwXbDWubDW1/sHxvfVZt15ZyZej5Ggexq+OGqe9X9WXAtYKKqvB/0wj4/jF2x2DN8N
	 8utM1rZYLqkO6wgIph9Zj4ZcAWuZd7hTd0UM+ELkCe61VsW/udb9twKmBW06LGZDvedA5
	 swoCfk8qdw7n6pGbZ/Myd0dgaCJLi/y5jw5taPPJtFPO8KdXsv/tv0QZv2j2iD4Gnwc4S
	 CeJcWrpHEKIt5mC1pFt50eOZx+NZx1i9JqZo8l7twuQfciHAQZdvBM8S7k+ONti/lZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="p4r3B/ko";
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8367E606A328
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8367E606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p4r3B/ko
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e4831c028so624549f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792942863; x=1793547663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2P9JdGvVOuabXAYBNZP9kGprHfBEphnCnz0cLxFDPGU=;
        b=p4r3B/koZ/QpksCxFTSuqqPDQloue2b2pNN7nAJ0snbFLNvTAMdupQ4ARCBrbz5peL
         cFzsIaLFcmkvl4M7ALRN4FUEDF/7dOHGihQWCLBkDrDw1PkKmUYJGrPFBzjGUB2Ip2eq
         TWtQPK79BFXHvOK9aoup13Ie+lako5uGw+rA4OxU68PypfS2eiFEPWmEW/deaoHCd4WU
         dY5DKtgyg2fM1OqDxLUszXqdm39Ubxegv1iLSzMho2DWnayHCs+HtBoFMq2QBV1Ik0JP
         vsYQEqL+gfU4BhqZda0n3JRjlHtRreK1bKnn9GYNm/pwBf6s4cLSUyoMUoVaMOJdAJ0P
         3SXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792942863; x=1793547663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2P9JdGvVOuabXAYBNZP9kGprHfBEphnCnz0cLxFDPGU=;
        b=xInPxOSITM76qYcxGzCFzppQRsLYtL2cx1Oc+MfKS/HHXp/1O9LZp054x9eGhs+X91
         QHQ5dIKXHLpLvslJ0tU0w9d/qgZ+rxTcF0y9REw77P1no9jLt78bCRtrEEqT3nN65GSy
         SQfQHUw8dEccvhQf9g+qABKx6cUPKX43VJH49NzJ9dWH+LOtD9WwRLNhI19XOzY0HCJ7
         zjpBflx5Zea8Cq+5M+nYzZvORnzDwST4L1ptghwj4fftjAfCuNsSPXsTLM14hjplq7ij
         hIGhFAGXHnDFpShGruPFk/fwPTYVm1HK14Pc30OdQTtSKB0C6AiF3CYJTIV1731zyrw6
         nk8A==
X-Forwarded-Encrypted: i=1; AKwUvBzZ0/+eda0rRPzNsXIWK6xZa002wiE4nsbPSHW7F7qGSfYC3BqNtSACDZIYp5YpoBOexn/FBHp9hv/dyxw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwSZI731tUoG/1Lsyvtm8W8sTit+G3wmrydui9NgRjF4AZ8VLU
	f94WAHY7F3r9kX+KdAeSCoFmw932wYB8ui4C3/sws7sZnqqEDmVDvpLxqXqMU8+j
X-Gm-Gg: AYBFou0k473Kkl+1l0fkFg5uEa8qIy/ARXmW15XpirGVi2/9jCU51malqRTNUJzi/n5
	axuB/p8qGGg7eqFW7DyA8sb/x4vUaSb8n6CGFy8WvU8w1H4koyzPSCrEkfCzK7KkFpguUpFjBF1
	Gh/xz4fnO3QXxTqymKnzrqtmgoJwAZwUi4XonsDgtAWf9N0H+8cAPF2lu0b3qquocuwqvsKkcMy
	OFOa+czksMSuVjfKZx51ra1HJT5B03m9Qc8hjmHkCv2ehe0ezEOGOe3zurEuThgLH8M/nBEv09O
	u6u18VIqwdZDiPLZ0q3vFKVT+3UPm5qXq74bCgYiDrmAjOYEvEWWYKF25eN0nHJMsQh5Xjq3JpM
	wwFvoau4mQc5wQZguJaBv7SPcTF0J/kcu9lYP0+MEb0QHGRDVInteTzd5IhxcUb25OSHmPwj+Fb
	d/c+teYZhHyMtB7/An/gc/9Xad7metlXknzp5S7l7nb/mi+MbyIFh2Fe2f6LFLWcz2qFowQxU4x
	raVx8BNChnwnXo3/4R8kEANMkoacrx/0tM1mWgKOOF4dp0L4ZsOVyIW76vUygskROo2WX5/8jJK
	HMxoqHlxPD0Ghg==
X-Received: by 2002:a05:6000:2404:b0:48e:314:f9f2 with SMTP id ffacd0b85a97d-48e3eb2bdcdmr7358163f8f.8.1792942862861;
        Sun, 25 Oct 2026 08:41:02 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm10487861f8f.16.2026.10.25.08.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:41:01 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: i2c: vd55g1: Mark the AE lock and bias controls inactive in manual mode
Date: Sun, 25 Oct 2026 15:40:25 +0000
Message-ID: <20261025154031.27083-2-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025154031.27083-1-fernandorimoli11@gmail.com>
References: <20261025154031.27083-1-fernandorimoli11@gmail.com>
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

In manual exposure mode the auto exposure lock and bias controls have
no effect, and the driver marks them grabbed. The grabbed flag means a
control is temporarily locked, for instance while streaming, so
v4l2-compliance fails on it while the sensor is idle:

  fail: v4l2-test-controls.cpp(134): GRABBED flag set
  test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: FAIL
  test VIDIOC_QUERYCTRL: FAIL

A control that does not apply to the current configuration is what the
inactive flag is for. Use v4l2_ctrl_activate() instead.

Setting the controls in manual mode now stores the value rather than
returning -EBUSY. That has no effect on the sensor:
vd55g1_lock_exposure() writes only in auto mode, and the bias sets the
auto exposure target, which the sensor uses only once auto exposure
resumes.

Fixes: e56616d7b23c ("media: i2c: Add driver for ST VD55G1 camera sensor")
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
 drivers/media/i2c/vd55g1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index e3939bb..69ffb3a 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1503,8 +1503,8 @@ static int vd55g1_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_EXPOSURE_AUTO:
 		is_auto = (ctrl->val == V4L2_EXPOSURE_AUTO);
-		__v4l2_ctrl_grab(sensor->ae_lock_ctrl, !is_auto);
-		__v4l2_ctrl_grab(sensor->ae_bias_ctrl, !is_auto);
+		v4l2_ctrl_activate(sensor->ae_lock_ctrl, is_auto);
+		v4l2_ctrl_activate(sensor->ae_bias_ctrl, is_auto);
 		break;
 	case V4L2_CID_HDR_SENSOR_MODE:
 		/* Discriminate if the userspace changed the control value */
-- 
2.43.0

