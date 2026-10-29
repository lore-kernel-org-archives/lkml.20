Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266139;
	b=e6Po8LTPwd0QlpbH3YT5aqbEjSVPWxd8xywo7Z9fgNHD1uhjRGMaS1utXwrJq66qzUyf
	 OXVfCeOXCSWBgVp2oGgExVpk0rUr2VnW+gEpiaAsmpnlYXmBRfiiNrmeUehp0KogEuvOP
	 Kh6iAiwaBku7xfVfMrTqu1WrhqkqaSe2sB+kOB87VENnjSg5dRxvUs+4gOnpSmhatii3B
	 HK2LXL5Z9Ak8vt6AkjVw5vcMvGV9Lkfq10E4UPqpPvxoUpe/UDvemXz7S/1vbsqN3hqe/
	 O8tioEd3fW9S5q8jfa6i7mHQ3Ui5IhwdLJ+/9EtfImUcZmY3T94Mj+Ew9t/78X/6rWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=DyYlx7RzolSrqUFoSHL9Wz3/RMfVWdxjcPwX2TXBXFE=;
	b=QeCJslqdDwD0sX0mdNvCBG+IU8LcH0YO4VsmiwUY/5NAavfG6rV+vA/oXVtEhE9nUgzX
	 akeYv+LRsV78/eWLerPIsVikjqEi2PEDMf9p7z0r3C+Gu1YLz+YdNq9YVHlBsl7hTR2Bk
	 nyiWpcW64w8g0TKML6yXe3LfmXcm0KuCpiBkpbpV/Ut357tOHNu3Z5MXe3guo61RE0xP/
	 gBmldem3sXq89yzW6DCYmJ7NlSxc0cJUMcp4qfo2/bHrsrll/LJOjzaL+ByPYlDkIpkoI
	 B9dfmpwCFTvGE7Nx+e0Yf6XZYP3OPhhB5wHq728fEVNtp4RKHT6LtOejhcwngXveMAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fp3jU+ZX;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC47606A325
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC47606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fp3jU+ZX
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05bfa6af5so1596152b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266138; x=1793870938; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyYlx7RzolSrqUFoSHL9Wz3/RMfVWdxjcPwX2TXBXFE=;
        b=Fp3jU+ZXDe5xQ9gU6Y0878wffA+jwkfzH2VksIjkPgeu58rrapbh3xF3+LqbZ415nt
         IPLxPILwZuKnQjOfoWrveQHN/uYUdiGWEVoRbVE9mPtQPxYATVCeq+vW3S4vaZ10t+Gt
         WVxqx51RapwZDZ7KabsME9jo4ngXvoc9G1h8Pviti4D/eaQLk0wsGlxkV9JjK/NyWTt8
         k/aNVRiT4HcIkAc4bAVSK5WAXUqpmoT/CvBXd+aRr/isSrID85GE1INY3t4ybnBLkU1L
         kFVb/bj2Dwv209F88QQEFUoKlT9wHoB0w8I/3/Q4u+0U0L+hU/R4x+8CejyG2UMFIC/S
         0+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266138; x=1793870938;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyYlx7RzolSrqUFoSHL9Wz3/RMfVWdxjcPwX2TXBXFE=;
        b=HzpDAiY0i+xJ3zANlmZEqG3KU3XLRCvw5rORgecvfoL6F/9UFhsR+fHXFlymOtMpI4
         tTKJ/14hERqscmsePIjd/xmLBgLLjUGH4z2lSd7LPXEFPGAz0rQmlGJqyJmL6vOvlhH7
         mv0AHoCZ5QipMjRbrqaYcsq5luwryNs6wRzAPt1Pi+FwdObnPu8j4EeWul4Aob7d+PGa
         mO+OFENr4gofpYxLoY3CWzYcLIqCNrbjxdXes8LHmV02XhwyYrlfAT01/fR+ls4u1u5Q
         GDSb+Z4nxJ8gpUOdkYnpOPgNTT98PPGEFBS8ruoRnMDEWbiVLLp9uGcRRgz1au4oIniU
         Go8A==
X-Forwarded-Encrypted: i=1; AKwUvBy6nFgibH6Y+kut5zpgq0/y7pOxaXHEwXaQJPxzGgUIDtueVRfVDUW8h54aF0EpIfDxWu3madJuQy88/wQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYID8Fd4ZLTeFPW+nhMCD4HsRA4CE9VHhEBZT5TqJwIjMeUgz0/f
	PSPR86hZWNiz54kyPHHcmzfaYaY0rYeabZ7F3y6z0PO+FYwAx2Ib1F59T3pfxt/DFM63iep8qq8
	4GHPUEI+JSzE1nA==
X-Received: from pffk11.prod.google.com ([2002:aa7:88cb:0:b0:89e:65fd:e92])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3a0d:b0:882:94ab:20ea with SMTP id d2e1a72fcca58-8a6e78cfe1dmr3662107b3a.39.1793266137875;
 Thu, 29 Oct 2026 02:28:57 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:41 +0000
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
Message-ID: <20261029092846.1567475-3-sgsatyam@google.com>
Subject: [PATCH v6 2/7] platform/chrome: cros_ec_sensorhub: Reset TS filter on
 EC/AP time mismatch
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

The timestamp filter history is only emptied when no interrupt happened
for TS_HISTORY_BORED_US of EC time. After a long gap without events, for
instance across suspend, b may be unwrapped to the wrong overflow period
and appear to have advanced very little, while the AP time advanced by
the whole gap. The filter then keeps a history that no longer matches
the offset between the EC and the AP, and predicts timestamps off by up
to an overflow period until that history is replaced.

Also empty the filter when the EC time and the AP time elapsed between
two interrupts differ by more than TS_HISTORY_BORED_US.

Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index 7eb8841..076a65a 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -294,6 +294,14 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 	if (-dx > TS_HISTORY_BORED_US)
 		state->history_len = 0;
 
+	/*
+	 * Also empty it if the EC and the AP disagree on the elapsed time
+	 * (dy, in ns), for instance when b was unwrapped to the wrong
+	 * overflow period after a long gap without events.
+	 */
+	if (abs(dy) > TS_HISTORY_BORED_US * NSEC_PER_USEC)
+		state->history_len = 0;
+
 	/* Move everything over, also update offset to all absolute coords .*/
 	for (i = state->history_len - 1; i >= 1; i--) {
 		state->x_history[i] = state->x_history[i - 1] + dx;
-- 
2.56.0.307.g5fe7bd680c-goog

