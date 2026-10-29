Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266147;
	b=QHkkzLuBIG4lOi+qxI5whUJoFoFhvqeXOtazlD94kULZJm5gMyrpJ1PJLzxq0QSKMgc6
	 RJIoBReuunMR89/CRESj3uGB78TvPt4kai+B81U/06kSXz4XlTBq26x867IilUjAB8od1
	 4HCOUdT+SmGANjAtUDg9k20bTyxj68Dm23UMyfz2O64Ifizv1W7YaN1va4g5CKL1hXxQ7
	 O14vSQnYRz5kSXnwRgOog4Ds7v6rbOcSlXIzPDcM8nW9QyIfYBytm1zsHF5C8JCpLenXV
	 HePWyslFb7RuVdlc8gRTGUx4co7kWfNTDLUK8sRfnXqoUnFJwzVw5vR98jGccFUFcqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=iOvAEsHGi/OKdYCfp96Wu9o3kTx2kIMK84hU6EBJhgI=;
	b=vfJJD+5Zt960+Z2fnzMbSCYpQd5bHGKHslHqstTK258ew5rAvLnXLs5fsnsSizp+t+AY
	 UZyuWTso9JQw+bcged6CRSP9pt5AllBycGmOCfCCOvBc9Yg5dAuiGsV+0LXGbOenLalfn
	 5GwxMVvW18keOvBsOO2TbK3zHwAOceFyXCmiUFNb6WpaQksmEUMTBcbvPnJasbLUIGrRE
	 hqTw0oN/l4zdutQDjuVZNngAET03agSF1q6mDPD2EPyx3xuv+N5uq0yD/1xCSL/qWD6jg
	 nSXVT83SiD+E2hV/+Vc0sJSDCDs0RExyrf5hUyClMuXBL5Z5IjUUUbxa3REOLw9pYjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="BCS0j4S/";
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E167606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E167606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BCS0j4S/
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaae62796dso19973605ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266147; x=1793870947; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOvAEsHGi/OKdYCfp96Wu9o3kTx2kIMK84hU6EBJhgI=;
        b=BCS0j4S/4ETktpCumJQPMcPbSG4GTLNGY5as8t64AZSeVJ7mlusZXR3ypy5Sg9O4qO
         EPyIyDM//ipOlOU7vgPp8QcGF5gL+evGhRWmIgzKfn9F47Pv7WhTmI9qrryy0voF3SxJ
         l1H75aLyK6w7Zh6jUQs+j1tTS55pd9OchEVQ76FI2HYUGb4TrH1DMiuV/0oFmjief34A
         1CriYB9sirz3L7pcZBqCN272USth2Ky0by0BruXO0KLVacJawqKWPCv4Xxbt2POI3TsJ
         DdX7thAhSQwM+iNSY30+BlvRy/FEUi3Y+MT1j1N8xkXuqZWoVEHwt9VzGK1WzWmKSjU2
         O2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266147; x=1793870947;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iOvAEsHGi/OKdYCfp96Wu9o3kTx2kIMK84hU6EBJhgI=;
        b=Qg15rGItewUjgQlMgMu81LCMrrEz4npLH4rPKri2OuW7NVQL9effg4nlFnSSRw5qYr
         OEdYvu/UG9t3loQxrUlkGoeKIZCmpQERHN5ru5OYjkeHZdlncIFX4OpYIsFb2pUCsvzq
         F7NzMNEE8JjFfMsuM7Ik9Icgq9/aqB1bEhgLMyOs/UFZ7qLmUWq0tH7LAZ6bGflZPgfG
         +UpylmGaIxOywat/Xh8PnOx8eUKdOCSNMQOCMOfBSb1Vxkm3unlsDTPWgFmaYxYKHfqo
         K487cFJXKD4+ZvLG0+NKPzYZXxnHwOA4XOPEG18EYddQsumqor4ndHxLeANwKutrzjiJ
         aTsg==
X-Forwarded-Encrypted: i=1; AKwUvBzqFgEM21EHjoQD/A0rPmy6Dg60ZHjF5ToQIE57Tx/xh7lu7GNDFpfZHNWMHeILv6y+8HUInfrpeQoCF3M=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRZGb0NvoSi9+s84lUeBTwjTuScH0/biD3l4p9KIM2kz7yVP3v
	FLQ4dysL2II0Dbt4pfnB0WHXDY9nM6ryW6+GdkuINM3KELAqqwzRB+Ty7E10Fs3vaUNm9tJmL/S
	fXY4KC+WC/FsCQA==
X-Received: from plbml16.prod.google.com ([2002:a17:903:34d0:b0:2eb:162b:6e4])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d4d1:b0:2dd:ad73:5b68 with SMTP id d9443c01a7336-2eb003de992mr40153285ad.24.1793266146262;
 Thu, 29 Oct 2026 02:29:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:44 +0000
In-Reply-To: <20261029092846.1567475-1-sgsatyam@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029092846.1567475-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261029092846.1567475-6-sgsatyam@google.com>
Subject: [PATCH v6 5/7] platform/chrome: cros_ec_sensorhub: Reset TS filter on
 ODR or mode changes
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

When a sensor changes Output Data Rate (ODR), or switches between active
streaming and low-frequency batching, the interval between EC interrupts
changes abruptly. Slopes measured over very different intervals then get
mixed in the same median filter history.

Reset the timestamp filter history when the interval between interrupts
changes by more than 10x compared to the previous interval.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 46f44c6..cec33a7 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -304,6 +304,20 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	 */
 	m = clamp(m, -MAX_M, MAX_M);
 
+	/*
+	 * Detect ODR (Output Data Rate) or mode changes (e.g., transition from
+	 * active streaming to low-frequency batching). If the interval between
+	 * interrupts changes by more than 10x in either direction, reset the
+	 * filter history to avoid mixing slopes measured over very different
+	 * intervals.
+	 */
+	if (state->history_len > 1) {
+		s64 prev_dx = -state->x_history[1];
+
+		if (prev_dx > 0 && (-dx > 10 * prev_dx || prev_dx > 10 * -dx))
+			state->history_len = 0;
+	}
+
 	/* Empty filter if we haven't seen any action in a while. */
 	if (-dx > TS_HISTORY_BORED_US)
 		state->history_len = 0;
-- 
2.56.0.307.g5fe7bd680c-goog

