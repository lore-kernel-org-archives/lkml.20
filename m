Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266150;
	b=WjEAUkv4Gr0qSePXC7FoNcPOBm65zQtv2F6sIkiVRuUy7ulJvCdyc9MYa5VcW8cq7muZ
	 fEYnrJsajOHR5lU2nIK00nuB/TVKZgpA6wgkYla845aKVNKQbGEgB9KFeGi9nDaB9Kzad
	 tV9+WBPHoj3LlQ52EOAIa065lQEElUjScF7tm163z4TU2/xb61yb1V97sVMY24dqtrRCq
	 ExKiOeb2ghCPmNHM3gGSf5cWn5u/Smxx57beDACxj1t+3wgI62rXyDNXcPnQpsaOmTEEx
	 VSlaN0ZSYGlwrlhdGGS8jCKPcavPpmkk1IE7qsJhgARtNTlsWAtiCZITukKOpzkgsig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ycqENo9iFn1fB3/PbhnzHQ31SR6DjuNYTFe+/vKTYzI=;
	b=ZND9xpUSjMuS3cpjiTCmPTDms1R1pmrIgl2TjEJzEMqiR7e3741IzBbmcMPkQKmolQfw
	 tqa3Z76NID+6CYvVKHRNNT7xVzp5mXcmubQdslyDfcboO600gAHuSi7V+aNJcrWwOEIuz
	 JYyJ4ByOUjyGZiX+Jsx9Rf8Yz3iJkvfmKfH++CpyhcfYy9Qhw8SJ3bOUYK0lZ8bE7IjYm
	 7mVpmIke/uZcbf7NJejjzinW3MGdyAHXNWMhScjMwiuVYK7NrvUFZ7U2VG15bfNqYvEB7
	 rR0SVFhvbZ0p478u1b9RTsQTIvYP5zcjaH1oYJBuDiNWZ787lHghTxZwaEZ9JbPwHvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J6gaEA4G;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72682606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72682606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=J6gaEA4G
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd633da24f8so2403239a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793266150; x=1793870950; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ycqENo9iFn1fB3/PbhnzHQ31SR6DjuNYTFe+/vKTYzI=;
        b=J6gaEA4GFjtpbHsnvcxFfH6CJf+9Lyp0tI1pRwSFpeb3O+M3YDdd8eV5H5YGktib1E
         8amBexMv1KE1uzK76z2wDSf4rXidcagP0/hA2IzkEpFIDXEevDK1+3phtFiiKrHhv34f
         oDzrHOiw3CCbW0itVNy44XjAzCZvXk4xmPJV91P+N7qxhAwcUNU4KBcjnd3RjM8KYH+9
         OLhWApgImH8npOAaC2j74xX5Lr9yOBMjep3Z8vswRE8pWUpm15L7Vi+/5H447N+vAXlj
         5WX4/2V+LGraPHIywCXiUjiHInVdnIVtzOJNcYE3ROXpjBKPkynhV37Tens7wxIbjU2s
         bkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266150; x=1793870950;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycqENo9iFn1fB3/PbhnzHQ31SR6DjuNYTFe+/vKTYzI=;
        b=n30tVJgSgZE6VEBOtXpNGOHEWjzFl+FrJEKS/7D7q5ra9NyzHmFspn2WjNWPmXt/qo
         MJTGCX1bBvJiU52sTJyL8fREmglG+iPreJeYNP5Yly6KKYtKwixAyz4ABGQcMxmG48hf
         91r5FnwM3fFLc4120lZfJldVXF0MrgLlTf9bGxOEILJkFJmLL2SMJYtZ0H1URrv/r+6X
         cHIuNV+OqHImUU8k+IVCekk+HHgW6vg86VFOkTPT2tQRIhYHfwELAFBT6BzHmnhPdD6I
         jYze7dS9JpWqOtnd5k2/khaBH1MlUqgYnePIJhIhXLUHQAQsAK2ZpboA18PJBHGhGRvW
         amBw==
X-Forwarded-Encrypted: i=1; AKwUvByQHz3DgCAhPXne8j8cxW/i0Gydoti25Hn4mgDEFluvJwrddFaLMNZbc5xGpq17pYjLhQQt6Shs53dU5wI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1aYUzBuIsPn0NoTyYhArfKCl+QeTkgwurY1/mQ0nfmaMlgG46
	Ihitz3Kk/vTWKTa55FzR1PaUnIXkQ1fQxMGaUZtColPDVE3w7aorOUBJ519enHYk27hnffzm6ei
	ar+9qMvnZKPxfHA==
X-Received: from pgbx22-n1.prod.google.com ([2002:a05:6a02:63d6:10b0:cd8:5a84:95f])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d2c6:b0:3a4:f75d:d1a3 with SMTP id 98e67ed59e1d1-3ae5809fe31mr3556717a91.32.1793266149676;
 Thu, 29 Oct 2026 02:29:09 -0700 (PDT)
Date: Thu, 29 Oct 2026 09:28:45 +0000
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
Message-ID: <20261029092846.1567475-7-sgsatyam@google.com>
Subject: [PATCH v6 6/7] platform/chrome: cros_ec_sensorhub: Increase
 TS_HISTORY_BORED_US to 2s
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Scott Collyer <scollyer@google.com>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Scott Collyer <scollyer@google.com>

Increase the TS_HISTORY_BORED_US gap threshold from 0.5 seconds
(500,000 us) to 2.0 seconds (2,000,000 us) to accommodate normal sensor
batching flush intervals (which can be 1 to 2 seconds long) without
repeatedly tearing down the timestamp filter, while still resetting the
filter across actual long idle gaps or suspend.

Signed-off-by: Scott Collyer <scollyer@google.com>
Signed-off-by: Satyam Gupta <sgsatyam@google.com>
---
 drivers/platform/chrome/cros_ec_sensorhub_ring.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_sensorhub_ring.c b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
index cec33a7..ef20aac 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -36,9 +36,13 @@
 
 /*
  * If we don't have any history entries for this long, empty the filter to
- * make sure there are no big discontinuities.
+ * make sure there are no big discontinuities (e.g. after suspend or long idle).
+ *
+ * This is set to 2 seconds to accommodate normal batching flush intervals
+ * (which can be up to 1-2 seconds) without constantly resetting the filter,
+ * while still ensuring a reset occurs during actual long gaps or suspend.
  */
-#define TS_HISTORY_BORED_US 500000
+#define TS_HISTORY_BORED_US 2000000
 
 /* To measure by how much the filter is overshooting, if it happens. */
 #define FUTURE_TS_ANALYTICS_COUNT_MAX 100
-- 
2.56.0.307.g5fe7bd680c-goog

