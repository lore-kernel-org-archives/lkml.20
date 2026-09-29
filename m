Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5912B55C31C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707677; cv=none; b=FpBnLH6N4NShfdSu6tIE6M2G8tVUxYoIz7L52r14IPkO1yLzVOSltvVN169q7eXDtfO0wlkbaAoClOVROLrbIjGtKaox9PRThcIX3j51Q+zHfilV4XrbdyFNUAlI7kek7cRK5rcgJg8HHskkL5xnHRpTsrLyZU9fQ29lyGg/Ako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707677; c=relaxed/simple;
	bh=B6qbOjmpqkp6AYfuznV5ZV/bRpzVIzhR8xXfGh/yrVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V0Yn8C8ClkDNQqy5DZTnfRZ3KzpJZhoJllVLLW5RbJEPM5njV6lqpm8c9dldctRsg7poqlPAsoddxcJGGogC/sylmeyuT09erT27cEY00uBi+IYnnjjpOcqQNzUVJ5y6jvXVb3w7MXd8hpdjYNhbwQP+kvHzS0FroxX4dRDEnkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TgK4zVAZ; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TgK4zVAZ"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3428f70d7e7so2667667eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790707675; x=1791312475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMvjcukblw/bh9bT1wLHMpW+zvI8pIG9ZcORGBXggM8=;
        b=TgK4zVAZLm1AQn0qErY9WKihEfCrtbB+1ul2UT3Y2bPB3CP5Fb2TyUJWBO96z62z3z
         g9db2U8YcbmHEfNrtx8uRbMNIJr+yAlcPDeiSZl37e2zi0t9/LBjsDfhXsY5jCLGXEjk
         V9BMsZfKhwPWfWCqF1jocCysyCgzqYowBOuWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707675; x=1791312475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMvjcukblw/bh9bT1wLHMpW+zvI8pIG9ZcORGBXggM8=;
        b=IGq2VUAxLoftxQLQ+IYztdW6iu582zj/5s7DBx6753Qj+f6H8qi9PQW/mOtLeEZvN0
         BiWH4panWlWTvaMzMnIQF1hpi6De/sTq70FBDYZq+Sf4jw1AneizUZ3lRANJj/Gy2clA
         XFC4JWTdq1N24T4tS/XficIqYNq/rEdGYyQCfd9QKe7h+E7elhpTBZ5nkESJ4Wqz4GGy
         FMgIRGjqUCUAlQQT8fQwrWsH2BlDVgYh9a3bgCyHud4xvObTGckeXqFC/H/IRraMHw1F
         4Do2DmdlSZWggkrSOU0nMqs7hBsTSLwJA6nJx811LNoD2FoWpchHp6WrMkhf4N3C8xxP
         QDgg==
X-Forwarded-Encrypted: i=1; AKwUvBz4nnfhW0L0DbOndK0OfiiVJsxQ3JgGsCTYoW6QW2Kai/O37PvgYbQZfzv3L778Sph0fIOgLWwfprtDXqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYITcLjyQqUhBiRmXiO7NU66tAw/pZqI8Ggf7lGq0uq7SGNGGnLT
	E5Tv/Zm9Isic+s6jaXZsUP1PVJRo90sR9vwelTucgqQCBNzgJlyJXxKMxwrv9YcNwQ==
X-Gm-Gg: AYBFou1aYu8Y4WBM8GeOfc/kdGKDsF2XnwWBffI+jGgRoSOXJp50uhlFfluI/0qvbwQ
	bpNNjPJPGYy5CONKr1dZeu0IRJK+qtToPa1/ZpNzp0qZQIOpfCWgaKRVTcHc+PACjz51uZIt+pX
	lnt8fsTjN0t3Wykfq0FIeDDd/5IEw9NqYsdDz726aGplN7MF1fi35AOWTYai3x1kQJt1jZnBEX9
	YBhBdtZWMpfRConMJMOfTq60yJWhf3aC5lTE5jCJv2B6aTv1LVnf30TR53Dv2tX4HYqV7pgk6Sv
	uoqbWU++d1f+mGRM2X9lLpxEjzBu2Z7B6me6tKb+ldr07I4o4r6xuo+aB9u0GgtvXfQBztGwF2O
	ncMyQHi3nuZgyLzrLL/61mqOLuNhih681/SkmYTYuJJFRcd5rAYqtOiHxR22sDUzPHu+GsH7Mwb
	oNaDXPzJlwNWrdstFMW52mnzlYuUShaIvCuRYKM4o/penlrYnlshwzYDuMLjo9U8nfojsmXTcLg
	xztp7neGeO9K1IJvkWjZJz0LA2xjyaU6jX6
X-Received: by 2002:a05:7300:ea04:b0:346:d145:d6ba with SMTP id 5a478bee46e88-34c6312e1a5mr249274eec.18.1790707675274;
        Tue, 29 Sep 2026 11:47:55 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5f5a:aa9:d06d:b4a7])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34c391d97a0sm995834eec.29.2026.09.29.11.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 11:47:54 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-pm@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 5/5] PM: runtime: Add test for pending-autosuspend + teardown
Date: Tue, 29 Sep 2026 11:47:15 -0700
Message-ID: <20260929114714.5.Ida7b3291919b265af858b31bd680f5ac9940a0ac@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260929184729.2346769-1-briannorris@chromium.org>
References: <20260929184729.2346769-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit regression test for the behavior fixed by the previous patch
("PM: runtime: Synchronous suspend when updating autosuspend"). Note
that the old behavior was racy -- a pending RPM_REQ_AUTOSUSPEND *might*
quiesce, but it wasn't guaranteed. Now the behavior should be non-racy.

Example invocation:

  $ ./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_PM=y \
      'pm_runtime*'

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/base/power/runtime-test.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/base/power/runtime-test.c b/drivers/base/power/runtime-test.c
index 3487392e0afd..67d637550092 100644
--- a/drivers/base/power/runtime-test.c
+++ b/drivers/base/power/runtime-test.c
@@ -354,6 +354,32 @@ static void pm_runtime_autosuspend_rearm_test(struct kunit *test)
 	dev_set_drvdata(dev, NULL);
 }
 
+static void pm_runtime_pending_teardown_test(struct kunit *test)
+{
+	struct device *dev = kunit_device_register(test, DEVICE_NAME);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	pm_runtime_enable(dev);
+	pm_runtime_use_autosuspend(dev);
+
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
+
+	/* Queue a RPM_REQ_AUTOSUSPEND (immediately, as autosuspend_delay is 0) */
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_autosuspend(dev));
+
+	/*
+	 * This is expected to quiesce a pending auto-suspend. See especially
+	 * devm_pm_runtime_enable() -> pm_runtime_disable_action().
+	 */
+	pm_runtime_dont_use_autosuspend(dev);
+
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+}
+
 static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_depth_test),
 	KUNIT_CASE(pm_runtime_already_suspended_test),
@@ -363,6 +389,7 @@ static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_probe_active_test),
 	KUNIT_CASE(pm_runtime_supplier_suspend_test),
 	KUNIT_CASE(pm_runtime_autosuspend_rearm_test),
+	KUNIT_CASE(pm_runtime_pending_teardown_test),
 	{}
 };
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

