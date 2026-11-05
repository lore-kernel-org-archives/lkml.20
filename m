Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839754;
	b=XBFBDN5fU4gDXdXQxsaWZjuEy/2KJSbeYJ/5S4RpG9rVnOaQomBcFEq3CCjbp63hTlxo
	 a18YCtvWcBUx1w1FqclJVst4sXGhyaeSD3RYYx1ergPyHkbb5hzj4ZU2s3vr2iRxpwZhe
	 HF1pUb950gOLpIPFSbjTNxBeAMmVGnbj3N00TAWzGIQX1jzEmZ58Ri0l2Vh32e5DbzyWu
	 aAS3ZJ4oD363ajk1iwSTAcZqIZcWcUWz4f38lE+3JLE15S7n2Pae5B4BqoyCi7EqLfcI3
	 YelhzY8yRUpfN/9ysgxHSdLyjclLR9VQsJKySyFNAL8EqZz+F3LoZwEBz8CecIi0/tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MYen1YTQsDdR/9JTwR/ybtMw+fvAq2BkPeg4p2KLUP4=;
	b=CIPohMiwTCAJhtR4ZCHCCUX34iMoYbaJlIqTw0ioUF7NXMop1hjXzg97kcAqc7Qf22vX
	 PALdY1Lv6dEvsxcX9zWA2/JOyBqRujdmuemfM5k0jJ7RRDfDUrXfvI9W1nE3dcYcdW51K
	 aCTJe+zFgTrRzZhZR+N9e9utux3zSk37m+ji7r+6+1o0TWw0PTPZKDLQdJluq/Cx2s4VO
	 FI2E1j5pj9SUFm8zYyaDh3C1dxwuf86DivHa3ZioPvth/UO1M96SuZz64in3XH3Q2yvVN
	 qflWKEEvXULXEOi7nalRnncD3B6dqx7cHnzAmvLFtHkcAkNr2EGvIQLfVQNODnk+aFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I4p+bz4/";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C6E606D801
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79C6E606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I4p+bz4/
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so9507805e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793839753; x=1794444553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MYen1YTQsDdR/9JTwR/ybtMw+fvAq2BkPeg4p2KLUP4=;
        b=I4p+bz4/gtEkR+QrPBIILqzuan5ppgMtFSE8APUYLhuk8DqdE2/nTtc6Wq2E/h1DVX
         38J9DaCSUXElcHw8u+j2+m9S9ct00z5WTexOM+XLMb3Sk95f3VjVRzBWF84p66KR9ai9
         YHbRIyFzTSZrp7ehJfeOChGcZ4rOe+ZE0/TLw8E9VQVCP8n0eZc0wOH/Ryvvp3pDRwDI
         XDU5w6Rp1bpvB4HBpA8JElJl6S/FJUhJTRxztOIPWm8Q5DbSScgyNUDL/Ufdhd++5CvA
         SzwyyNZzH+V/FJ9MOx5JJq6aXTtgB0mfVmvyzxeevPW9GhDqEVioFPMPTjDZu4lKNQOZ
         v7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839753; x=1794444553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MYen1YTQsDdR/9JTwR/ybtMw+fvAq2BkPeg4p2KLUP4=;
        b=XSU/7AfigqUVNH219LWaW9SxM3JQ7HuNkxWD46ydnkeRqIrP6u5f0wgatroCza+zkh
         75lR7xuOTxymNQPoSqnAYDYejqzWxjZNubtnSHgeB0uPUvYBG++5ugDIu+OCpjWWPSVC
         dXHqFPvfMDP+nEringuln5358MoFtodo7ukzaGr6qv8A0a0yGuvUM3XKcB8cSVBUcKwd
         j/RHv+cD8zaRfZJKEWL99FmjvAPoaP7XnjuGhzmOiLaS/CR9EEQqbfZch8X6fahh/QmB
         KtzWLMRWdYWnIrVqbZCaEDoVBR6KR9rmFtCPE/uyh5w4XpmAwf9vAVEC7wRKbBeQZ2ki
         ulWA==
X-Forwarded-Encrypted: i=1; AKwUvBy1ax1cOQ26GWQC4ns5LmhUZlBrppwN20D/xj4/Oq2sCp29mxkFsJ0aREUZ3mFCxIk8ilGq1pbVGio01Sk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CCKQ1fBKZbRr6pbZm7wJ8R78eEBJAiP7Fy3xWlyFjSwg1H/g6
	UUS6lO089aT38tC35g3e9a3/J0y+0yHjKt0WK+B7wrvcxHj/U596+3DX
X-Gm-Gg: AYBFou1Lz1qhFER3czYxU+0uVktFBHUJfLrjO8yUWguonBdAeLJbZnKjO6r9PRmNug4
	oWEU2pb7lqN20q8k/pqAUIEoba2GnRly8xh3fzpHkiL56A9vjjvdBUWxD7PaMCTzuTUcVnVmAxQ
	34FRTxxvPCX8zgrD47zi8KN0z9uzuUU7xVZNfu2xu/ohZbmjjDzUSO4zxpuRr19H4xVJt6Xiz4F
	EXld1zs/vUzRJpDLi8WWBvtG9wuMgkcU29HzT7J8RE6IgZ7swXUkHORKxiZTWBC7Wme1FOMDI9s
	QjWreB1hVirtftEMQQyvIf7XnT3roDBQgPJjhCtKxcU6smSH/oIjTWwuiqPINYsCjAesFtrY5oV
	IL0UHNprKtdkOLWfud+3w03fR5xOAlGPFoxS0eB8UdMZ2qvaQXIFBRPOBad/Qjo5vrpda0YdN8P
	v89VcUdKhHWYt6HL8bACqSop0XHCpZflU0BQPpyaFBb2kAUqL4DiDzG4CAULsu1nSs8bjPETdxd
	y/iRd6ipi85fqgnvDX/TxmAO4Vf7OjYthtzjMySxow6UiDk+PuFXoWj5cOcfO6JMXIOnz4IEVT0
	CF6NgQOhh5wfYSg1OZ2B8eO907suehZkSmWne+ZXs3M1ocP9Hh4mxXThCzeGzWg=
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4ac17b2bc63mr400176825e9.10.1793839752477;
        Wed, 04 Nov 2026 16:49:12 -0800 (PST)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572bba0f3sm21341515e9.9.2026.11.04.16.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 16:49:11 -0800 (PST)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] media: i2c: vd55g1: Mark the AE lock and bias controls inactive in manual mode
Date: Thu,  5 Nov 2026 00:49:04 +0000
Message-ID: <20261105004907.150545-2-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105004907.150545-1-fernandorimoli11@gmail.com>
References: <20261105004907.150545-1-fernandorimoli11@gmail.com>
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

