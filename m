Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9EC49B465
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963819; cv=none; b=EGQ0h7sDpkZJuP8L1hMDNN9k7EtWmX8irBy/7cgpfeFSs9cV9ao0ZI1iNf/JmpFRYbvQkg1UfXMjDNW0ZM3CtFNSn33jzlslUF6Rk3Fp0VWv319iJQhgNnyyqfyGXhlIzh5ca8B3wyZcFnvMRv8M4XS4tGH9jBb4dNx0SqRgnCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963819; c=relaxed/simple;
	bh=AQufZVavRTbYJYN2f6gGGWx6gsk/fIdF/5LI84j40lQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=T/rCYe8K0K0aibe1lKoS2WtMFU/L1VQz6bmpfz6qTGkH8QiAhA3CU0p4CTp7YH/kQtgPj4z3JlhkP3B89+3dgVZb9vObdmMyfluQB0omidR616IpUiJw+3gF5CVAIMar9JbXSp8SQ4xRjQe6K8SLL3ZAnMkNKKRNkLdvFMlX0FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T2MOvhAW; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T2MOvhAW"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso2395668a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963807; x=1792568607; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxvAeDOOTPRLx7Cf6b44fOAyQ4LJCEO6jlOtNXuHCIA=;
        b=T2MOvhAW9/aHBWhTAB5c7ryaezUyC2fAm+gwcaNPL1t2UT9FIFdUQMHKyn4lMyVJo3
         tTxuqa/3yFz9+oHID3+x14rLlVPdqmSr6kNYA1zgvXla1RodI4p0lD2u1YQtWOA8A5/f
         N3nBisYOsDNWVPp181L3XB+PwAED+GEw3sdGPrK7T649n4CQgOzX5NQ/tC84/EF0Dq69
         SMB/qqukUeXwCh4fY0kloL2e3jWa71flCe8iQl8XjwJQ8ZLBwtKf1kX4otpgYVZ7RV2n
         BFOHtNdWQv47c54B8u034Dt1AuyoNKkB8HLoGVR1o8EOKRm/Ele0biZ29gvKkqgVGM5/
         tT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963807; x=1792568607;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cxvAeDOOTPRLx7Cf6b44fOAyQ4LJCEO6jlOtNXuHCIA=;
        b=Ljssirswgcx6rPiqJfVu/ZQ/X00kW1nriVxRjQeVtluKmxwKq1mXGBKFPop1qSjCxL
         gX0Nr7thpLY+EsVQqYsdZZNyRacCqaMu5zs423Ga9kSKkfxHHIiU6c1HyXrLl5ipLf3h
         N4qEtqf1L4xUbh0zrfLwVwGGDST/jGIGSZhCwJvrc7FhbgQLZHH5HFM52DzwJHMoyzQ0
         GQLRLZXqzbu0nAr7OrPQlGTaanOYZ5WYSSnLcr9Xlu5mWU8VDbe5U154+mvmHRYLDhzx
         UuSBb7UCNBub2ZeUef1htxeMxGm6XL3+sYJyl2YrG4lUSuyj6aNWTkZnSz2eA91wN/eo
         Wjcg==
X-Forwarded-Encrypted: i=1; AKwUvBwMCF7zucAdAfHgoLrL1ajiz8Pjy2fdhuzhXBy03P3vlfRUCqivGEn5oouVhqQnyaksWlOvafpoadNgz5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRWhgNGni1YSPd1cbQJuGcGm5HABMf+Ql4ka57zOkm49m8cr29
	bl8w4yTQFk2d7QX94xLxtGbV8v9WJievTYTMtQwsPjwQk5gJKcUdeWs7qC1xhZlX2c3ssMZM85W
	YTfhmQkL34vNO0Q==
X-Received: from pgww24.prod.google.com ([2002:a05:6a02:2c98:b0:ccb:62e:3f27])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:e70c:b0:39e:6a7e:ee1b with SMTP id 98e67ed59e1d1-3ab3ad2b1admr11297561a91.39.1791963806944;
 Wed, 14 Oct 2026 00:43:26 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:43:05 +0000
In-Reply-To: <20261014074306.2500909-1-sgsatyam@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261014074306.2500909-1-sgsatyam@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074306.2500909-6-sgsatyam@google.com>
Subject: [PATCH v5 5/6] platform/chrome: cros_ec_sensorhub: Increase
 TS_HISTORY_BORED_US to 2s
From: Satyam Gupta <sgsatyam@google.com>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Guenter Roeck <groeck@chromium.org>, Gwendal Grignou <gwendal@chromium.org>, 
	Scott Collyer <scollyer@google.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Satyam Gupta <sgsatyam@google.com>
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
index 4d814e2d7297..7740bb42b1df 100644
--- a/drivers/platform/chrome/cros_ec_sensorhub_ring.c
+++ b/drivers/platform/chrome/cros_ec_sensorhub_ring.c
@@ -30,9 +30,13 @@
 
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
2.56.0.385.gd3acb90ef8-goog

