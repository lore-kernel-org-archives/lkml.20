Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744588;
	b=ZzaMHAdi9HTXTtTxwTUKnpG8Qk4GI0/aaIK97DO5XdgEqCJMEgkMQyUiv9wDsvB+FjpS
	 GKNZQXCa3KS472O+4bgHAA35sEomywWCTpor/MONddg055R5Ykc967/eIrHe+Oy4+0cYa
	 IAn/xI1p9mkrthSMhOngOq1b2Yhn3DqQ8of+54h3Ab/VTO2q77ylRGYliF2B8s1WoKO5q
	 ectqIOuR20bcC1pFm7y8AhF7RaOMaDWU95rSeciD/NGYyeaa1uLXR7DYNKgWR24n1Ynxk
	 bLGT0uUoN8zkZaN1ld+3G0tYJ9s4xL1jsS0TK5VYNGID6sTmJq8f5JJMWOLyvxrK8bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f/GjwPB9R1GefsC7sb/ZiS61uSaQkMOnfI2lEQvw+YY=;
	b=3R58PqpTYD63RIYWofBNqcFGiGzmG017E+DdBVwlcM9KsSENg2/Xa+nbu6TVHVMyGyIC
	 q4y8ZStteEM+Fxtpnmhk7TQGd3xrmTenEfxnoxkfcIcL7rmqapeUVCcfPgFt8HwnIy5mH
	 KxPMKnJANNYAvYcH6W2+Dh6fS/7ZPn+OPnB/LNJtpSPgulyxiUXq0jXuk3sg66xXDl3j7
	 dYb1WNzMizbZw1vHcoMHtfVuqIoc6sEw41d4UYi6lA3bVdMkC49OSKyYVb+18BQgPO7AF
	 JfQ7MD3oJ0vb4OskPHXmARSXjbgrHvnp9sComputpRzxGVel62NMPHm95tQ0qHIUnxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WZ159z0d;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93CE606A31B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E93CE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WZ159z0d
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae18eb9b69so138894c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793744587; x=1794349387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/GjwPB9R1GefsC7sb/ZiS61uSaQkMOnfI2lEQvw+YY=;
        b=WZ159z0d3cdyU5ZVhyL5x/B4/1Ju2qWuATdw6DxScbh0z6/a1Qj4iPmHsaGHAmRD20
         XBK/glreKqfgoKH2lJatjUxFnN942Ieb84oy4GbFNnqldIrenK8Yo0S5eBsKLefsKiO3
         qSK33XMlfPyP5N7vavJ78UHFBeM4n3HQ6+7qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744587; x=1794349387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f/GjwPB9R1GefsC7sb/ZiS61uSaQkMOnfI2lEQvw+YY=;
        b=iG9QJCikasj0qUjtkumw1uMYhuTWgl3+bV8A9KYTVMlqRazV0XA74jijVavORMXM20
         6UqnDLVRP6PPlI/9u48Q5G68FooglRqhtYbVh1OR92q4zLpMgERR6ALKSUYhVMrEWST8
         8k3C5trXOG3hArhi4jmi90LRT1zK/qlwJcQQmTw7v21c1TPHA6K9OVXnIZt7u2lVLUyI
         zGOeBriDMf+rRBgvFYfCAYQtG1aRb8PLBisg8tcOFqXOaryTdS+ytha1DhXQwcZWFcJN
         JhOLnQTRgkCjhZejI2Svvq40oQAuOsHRbTdTCTRzsBCq3o32cAxnXFOyRopRFtPawcwS
         pW4w==
X-Forwarded-Encrypted: i=1; AKwUvBy8EJBQiEK90EKvbYT9nSPdPUylNe8EtrOfl4cEB7oNPGoQgfCL9cBCijAqouIgDCcJGdlQxOjv8hQXCFs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nlyv8w1QLWdtsnDPER/4+w417WghDY/ywR2XammSePSjBov5Y
	AVWceE8hWJrJ6y03wo3ago5ZsJJ/KK7AHAvbqTjgXghCREc7nkJB0QZWZC3q+/aAVg==
X-Gm-Gg: AYBFou22mGQeyMBDx81v0ifg5Z3hWXqLNvCpiOmW2Eptq/XHy20vhBWFZbWi3He6vOl
	Ct4N366A2VZRFE3+52YmjELPPkRO6fT4lSxMb4ZUpwu6rptfTBKPn2v01JAOXot7O3p2LClqpMb
	rlXfMiZ4XidpV5bOrI/bHXouM07My4efqYJVY6C06u/2wAzWqJcXj9GKM/RcSXtZV13lZfBzNaI
	zGbWCRmfFbrZrHrMIy0LoZW8Ll6JAGxbZlDiqpVVhCPH8M2HNsg4doFV4fls7gtDbDOjimhir/l
	Kztban/fJE08v+UDtHjF6wHrN2Or92gc5DSLCNb8l5BV/9BopHGdgVBDahSrW0QB5blGDclyOp8
	54rGUWh6eyuTRel/uQbMM/TyNZPPhh5gpeIn7o4vXj9rq9T8XfddgV+cxJw/KB+7yIA7ONjDEyy
	cR8tsOMaC0hBjAjrq45Zv7hfKTOeXUcoQY78Y0gi0D8Z8V9J3RGJUdYQQDX5kkpH6lGYAaI40Ho
	hjVj2iGNLbm+238Zlav8nAmCDJpW2/YE+ZNCPZLLr4REgRyx2MoNuxV6I1fPij5dGb0N0xXuoxB
	Kiio3cOpr1opBlajZfLphlTBXyGBwoja+gsG54TLQ5JSJ4gzoWEoeq74r6IHnn8Lwye+
X-Received: by 2002:a05:7022:7f17:b0:168:3243:c937 with SMTP id a92af1059eb24-1ac5cb1c8b3mr24793689c88.16.1793744586621;
        Tue, 03 Nov 2026 14:23:06 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-36ca390df28sm1162364eec.18.2026.11.03.14.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:23:05 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 2/5] PM: runtime: Convert last_busy to atomic64_t
Date: Tue,  3 Nov 2026 14:14:40 -0800
Message-ID: <20261103141442.v2.2.I998d26c0d635b80496ad12daa33b8de602030eb6@changeid>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261103221717.3840215-1-briannorris@chromium.org>
References: <20261103221717.3840215-1-briannorris@chromium.org>
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

I want to use the atomic64 compare/exchange helpers. There are no
similar 32-bit-portable helpers for non-atomic64_t.

As a side effect, this also should avoid some minor load/store tearing
corner cases on 32-bit architectures.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Add <linux/atomic.h> to pm_runtime.h too

 drivers/base/power/runtime.c | 4 +++-
 include/linux/pm.h           | 3 ++-
 include/linux/pm_runtime.h   | 3 ++-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 9d3508d9b4a2..2a117d6a776f 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -5,6 +5,8 @@
  * Copyright (c) 2009 Rafael J. Wysocki <rjw@sisk.pl>, Novell Inc.
  * Copyright (C) 2010 Alan Stern <stern@rowland.harvard.edu>
  */
+
+#include <linux/atomic.h>
 #include <linux/sched/mm.h>
 #include <linux/ktime.h>
 #include <linux/hrtimer.h>
@@ -186,7 +188,7 @@ u64 pm_runtime_autosuspend_expiration(struct device *dev)
 	if (autosuspend_delay < 0)
 		return 0;
 
-	expires  = READ_ONCE(dev->power.last_busy);
+	expires = atomic64_read(&dev->power.last_busy);
 	expires += (u64)autosuspend_delay * NSEC_PER_MSEC;
 	if (expires > ktime_get_mono_fast_ns())
 		return expires;	/* Expires in the future */
diff --git a/include/linux/pm.h b/include/linux/pm.h
index ef3f1310e749..531e46ff878e 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -8,6 +8,7 @@
 #ifndef _LINUX_PM_H
 #define _LINUX_PM_H
 
+#include <linux/atomic.h>
 #include <linux/completion.h>
 #include <linux/export.h>
 #include <linux/hrtimer_types.h>
@@ -812,7 +813,7 @@ struct dev_pm_info {
 	enum rpm_status		last_status;
 	int			runtime_error;
 	int			autosuspend_delay;
-	u64			last_busy;
+	atomic64_t		last_busy;
 	u64			active_time;
 	u64			suspended_time;
 	u64			accounting_timestamp;
diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
index ae68a9dc7fc5..da537be94732 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -8,6 +8,7 @@
 #ifndef _LINUX_PM_RUNTIME_H
 #define _LINUX_PM_RUNTIME_H
 
+#include <linux/atomic.h>
 #include <linux/device.h>
 #include <linux/notifier.h>
 #include <linux/pm.h>
@@ -242,7 +243,7 @@ static inline bool pm_runtime_has_no_callbacks(struct device *dev)
  */
 static inline void pm_runtime_mark_last_busy(struct device *dev)
 {
-	WRITE_ONCE(dev->power.last_busy, ktime_get_mono_fast_ns());
+	atomic64_set(&dev->power.last_busy, ktime_get_mono_fast_ns());
 }
 
 /**
-- 
2.56.0.398.g882cbad275-goog

