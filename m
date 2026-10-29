Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266143;
	b=LgmUgvnVSiWoKYCDRDfcEO50cnFKjtS4jIzxkFmLbC+TDhyjH2nr4EzI7y0UN3KGRlXi
	 sDvip4s1sEX5pKiCIDXJvxbfAGZFoGzlpzBTG1zVqE5ACSBmk6bXbqQbr4NDeXwiJsNSg
	 QRER20xj08hDdM9xBgHL84T1y22GVA8v/nNqAQ+KKGTyRCDFZx6Bw//CTjqOMKglF8gEH
	 dnqi0XDsTykLxSeyKhrdMy3Tw/fwe28EXf6WDYOmXvmc9tp30TCKGEesvp9GMhFOjkDaK
	 /ND1Y8eNZRE8LGTFmaDOkVrbow0sfRJOxb/hVFF+bGyXMLRjAfyehPeff7I4Zb4zsyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Jb3EUq4KlbjY0bhSkBco4tRa1Qo54N/IBnyYXHi22sQ=;
	b=yAR1ryLjkJ0Ts3eO4OzwgZsmukiY30e++4ub+/3FBcs2/vwKcUWOSloL61Y+0uCHueXr
	 6SjxtwaWjqN6cccbjW2naVb8m/+20bqEWib2446DKpBAIIqJOoUP+QYKGc1PC3dA/kpFK
	 V3wHA1iBuXHgL8WHmkzTk5O8EHl30dYuWmHMnimOyiSGeEeaN9OldotQHy8IefmRwKqzh
	 zBl7jkIqcWf0vTzXmJDaZRD9bJx/JjP7OydjHZCUcgfMWYeZzVVW9G86XxBtRzrGJgWyT
	 3BJPMN14i0zjctk359Ynpr6Ur/7SV63ZeuOB/vw6mj0zdZmrunqiORgOcQ3tawsX50Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o4JIOSJg;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E61606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E61606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o4JIOSJg
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a01ea9e318so2616994b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266143; x=1793870943; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jb3EUq4KlbjY0bhSkBco4tRa1Qo54N/IBnyYXHi22sQ=;
        b=o4JIOSJgkFEFIRvHkvnv1q1zpw4VfKChqjxZeP+sh4CynZg8zoLYiS/ViOcXmCCOmP
         ZoZzQP9V3gGW+tmhHgNiRqdLHjB8VW1y6ZdKEQ2RvnhSdYu6aHUicZJvvlyhk1MQY5JL
         Cbw3NywYV933g5Ve7wkvMmKP9NfFbilZt0T5Vt3kNfqavCF7TxSIYrr8S6Mqp4YxG+Bj
         R41ByFraLlV6SIYktLJu6eCplEAWnvfGVHKxYQ+DGl1yD5XNNYsuI17B9CIHCi4VNn/p
         BGPip0d3wNyHDd+Utw/cHP6kJQMPFxyu/Erhlsp7RHZtu9AsKK04jucAmAXUKWsHzYdP
         OvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266143; x=1793870943;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jb3EUq4KlbjY0bhSkBco4tRa1Qo54N/IBnyYXHi22sQ=;
        b=Xp+DM2qTlzYAkm8yLM/8suf7JXZ6acitdeXDWdMIUk46K2gJ/2kbifPgQRG1gqkXcS
         ENBb2R+wSVGrmtUD1qogm0fRbjtef6T7tYpDBPfdTDcJ6+Fe3SGq4l0OX6uFkgjtYH9n
         Qq7xLl9n1+GcM15xtJEvPh15dI7RY8ZHe/Fc5WJ6gDc9I+1IGVlH5Dv0dHwwDRYj9Kx0
         /v3f4UwDqDujO+j76B4Peo2FsHifCN6RIT799itAWAYdnfKq3V/yRdwHnHc08XLjLp4W
         hURNvF3FXyn8NHi4iwF5/bHeMV1brJAWoX2Em30i3ge4iNSN/dhF7WM6FNalle8IizDa
         oCug==
X-Forwarded-Encrypted: i=1; AKwUvBy1FpdRLpHELWsUmcFXaS/yVgctBPm7Fv1XjpP6kxB3i24h7//UXYB69RdnzXUjU0D/be/55aBd7RFzweU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg7B9z5Lcp4jCqBsPQNb3Qp+AntkJTXDaD7DpgE4/dvjQut7gq
	fdafUbv13BlWAllXCcg6lyMbaTyZP0d7kgnbK/xr6czzxxufH+X0t3GfKpzTM5YUlOeduvvJhRR
	YrrXLU2eZq9NufA==
X-Received: from pfbbt8.prod.google.com ([2002:a05:6a00:4388:b0:887:5ba8:7334])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4f95:b0:881:b7d0:8dd5 with SMTP id d2e1a72fcca58-8a6e7acee1fmr4165007b3a.32.1793266142425;
 Thu, 29 Oct 2026 02:29:02 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:43 +0000
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
Message-ID: <20261029092846.1567475-5-sgsatyam@google.com>
Subject: [PATCH v6 4/7] platform/chrome: cros_ec_sensorhub: Clamp clock drift
 slope to MAX_DRIFT_PPM
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

Interrupt jitter can produce slopes between consecutive IRQ timestamp
pairs that are far larger than any real clock drift between the EC and
the AP. When such outliers dominate the history, they corrupt the median
filter used to convert EC timestamps to the AP timebase and lead to Out
Of Order (OOO) sensor events.

Clamp the slope to +/- MAX_DRIFT_PPM Parts Per Million (PPM). The slope
is computed from a time delta in ns over a time delta in us, so it is
1000 times the unitless drift; take that into account when converting
the limit to fixed point.

Set the limit to 5000 PPM. The drift measured between the AP and the
sensor hub is about 16 PPM on a device with sensors behind the Intel ISH,
but about 2900 PPM on a MediaTek-based device with sensors behind a
standalone EC.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index c5331d9..46f44c6 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -23,6 +23,14 @@
 /* Precision of fixed point for the m values from the filter */
 #define M_PRECISION BIT(23)
 
+/*
+ * Maximum clock drift between the EC and the AP, in Parts Per Million
+ * (PPM). m is computed from a time delta in ns over a time delta in us,
+ * so it is 1000 times the unitless drift: 1 PPM is M_PRECISION / 1000.
+ */
+#define MAX_DRIFT_PPM 5000LL
+#define MAX_M ((s64)(MAX_DRIFT_PPM * M_PRECISION / 1000))
+
 /* Only activate the filter once we have at least this many elements. */
 #define TS_HISTORY_THRESHOLD 8
 
@@ -289,6 +297,12 @@ cros_ec_sensor_ring_ts_filter_update(struct cros_ec_sensors_ts_filter_state
 		return; /* we already have this irq in the history */
 	dy = (state->y_history[0] + state->y_offset) - y;
 	m = div64_s64(dy * M_PRECISION, dx);
+	/*
+	 * Clamp the slope to the maximum expected clock drift. Interrupt
+	 * jitter can produce slopes much larger than any real clock drift,
+	 * which would otherwise corrupt the median filter history.
+	 */
+	m = clamp(m, -MAX_M, MAX_M);
 
 	/* Empty filter if we haven't seen any action in a while. */
 	if (-dx > TS_HISTORY_BORED_US)
-- 
2.56.0.307.g5fe7bd680c-goog

