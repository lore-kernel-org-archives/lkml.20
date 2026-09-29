Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C10559CB5
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707671; cv=none; b=taEInSQXGiE2gXFNlXNrOtqNBRLlcK/yTdwStCU4jg8n03Nxc1t7DXhmB9PXp96XcDsW0JJHb3lTQ4vIrcrcAgFj3FxMong9HraRcQp7WkaIDywaiP3MpIi4Fwf3CqY8/yaj3p1wChvX8dU6SwcNIGI9GbRhSCh5AA4aHJ0v+v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707671; c=relaxed/simple;
	bh=EfN4DRQ7RGeIckCzz0l9GMwp+1v5qtliTwAQlB4LR8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3SaMAj8p91JxarhneAjg3a33h4VkrJ+TCjeUSmsJ3G56+q4yWe50cKnBTVOE12qN7tybLP67SAPz5xxGf6zeXjrveyfn74Z9u9D/GZr+/dS4KZesWkyTGL+OPzqV3XyR5DulFCEj1w1mvP54debKYgCqKJ8ewIBIL6PDBEH9xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=guhqNydw; arc=none smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="guhqNydw"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144efd1ea76so2716838c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790707669; x=1791312469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nc0gE7Gombl2PMFQGXcyIkbha/LFCYb67kK5kCWn/0A=;
        b=guhqNydwZBBeh+DNGU+7czrZ1GEdDFWXps+BTuK/k3OOfIk55GJzgw349vYbAZS4/M
         8lgrwKRZhLlJwrvxvnVnlCQMsyQWIqtSUQjDMefEqgr/gY5EwmCQXeVztMC2fEO56vZQ
         kq9gaRNo+1nZGdQ8dD8mkyPgqL7koFN3cFJhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707669; x=1791312469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nc0gE7Gombl2PMFQGXcyIkbha/LFCYb67kK5kCWn/0A=;
        b=c9OMwH0x+NDkbuQulWUrHhZ/1i2IE1aI0seP8H1ykcQXmhU8rfJzC5bbGNUItxw46o
         8L93JAdsjQDgLiBwvaXWqG2K7AZggfgd+ENlUzuAFx+Km0kHpJ9X7aXvfPGIvHQVUuRy
         QtoNQf7uWOKLsXP6P8Jy7ilARSU5q6l4H2ouSHM4qH33J3vQsNPmUXQrw/fRqMjPbdA+
         wP1p4RY6vtBCJFpPYY13nkdH2yqXxsc/4H3NX25S1VolgOX39uBNYdSAg7l8WQP4eqm/
         Odq+XFCkAS4FuNZOd3CkYeXkLx4J3Xr+VRz7qesMwqbBzwplWgWcwcdnrnVLu50nENdb
         VMMg==
X-Forwarded-Encrypted: i=1; AKwUvBwCo0ACadD3p7wFBo0SgmMultgjXJI8w5Xjo6Ds4Agi/VQYxh7RZSwgAQPTnrMKBPxpuUz2Bjq3x3f7iT8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkYDd0saYGsNdylU1bk+YZhKEmyPF/ZyndQjhlIhC1CVnJp3F2
	1GIqj5bd00+dBCz2QlEwiNvg3KDnjzgP7Tq0wyNjKNxgoGuXJoe+9Bi6RNRZ9Fw+MQ==
X-Gm-Gg: AYBFou0Rf/396Fjb2HceES0CVHWOgUWNr251JJgrO4Ardt1oIx8qc6APWb/bugbcmma
	rwR8pHb2mQ0f95AIdLlZ6f1vDqpP8+7nhB85FMcuOItzhkEDCtCMchPB7ZqwXAG3R6Ooahv8pyO
	UNLYVK7JtUkxUwqNLX8A8fZs3WTP5cogR262bTylyzSGtHvyystqkE0RVr3nvtQBWxsFjql9AXY
	EbVdxlbShyXPbE2ABc2+bG96fwzH+eK2uDJzFEdhtxa02avqKeeqZAJPVuFOkcfUwrPQFoxBagz
	IUXTRyYpA8+JTO1gB5L7VMvzn1myxmt7Q7YlQz9/YHfYao4WSpzzG5FrAqvvEEsJZuJyAPojHPF
	xryTkahcZZkc/4VVqYEpjsZoeA2c/tqKuv+Ot3CiEj0HO0YKoYTTwoLfq1Z24gNzGviycSf52XK
	8bkzdwGdkCAjoZKccE9/+4vy8aG0youLOPo4yOFeeXRJ8dHMTT2HgA66925PsegGCgYVR5P+196
	3jHuvTl+yyLHm1mykbU7r/avlUGUVvqm2UeTvabtAZooXk=
X-Received: by 2002:a05:7301:4882:b0:34b:f279:2c29 with SMTP id 5a478bee46e88-34c65a742damr266421eec.13.1790707668531;
        Tue, 29 Sep 2026 11:47:48 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5f5a:aa9:d06d:b4a7])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34c388c76c1sm1004071eec.19.2026.09.29.11.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 11:47:47 -0700 (PDT)
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
Subject: [PATCH 3/5] PM: runtime: Add test for autosuspend-rearm
Date: Tue, 29 Sep 2026 11:47:13 -0700
Message-ID: <20260929114714.3.I7104ceb30c7a54ada598a7a37806432997216cce@changeid>
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

If runtime_suspend() fails with a transient error (e.g., -EBUSY) +
pm_runtime_mark_last_busy(), we intend to rearm/retry autosuspend. Add a
test for it.

This is a regression test for the bug fixed in "PM: runtime: Avoid racy
clock checks for autosuspend-retry".

Example invocation:

  $ ./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_PM=y \
      'pm_runtime*'

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/base/power/runtime-test.c | 70 +++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/base/power/runtime-test.c b/drivers/base/power/runtime-test.c
index 24865ce844fc..3487392e0afd 100644
--- a/drivers/base/power/runtime-test.c
+++ b/drivers/base/power/runtime-test.c
@@ -285,6 +285,75 @@ static void pm_runtime_supplier_suspend_test(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(norpm_supplier));
 }
 
+struct pm_runtime_test_data {
+	int pm_counter;
+};
+
+static int pm_runtime_rearm_test_suspend(struct device *dev)
+{
+	struct pm_runtime_test_data *data = dev_get_drvdata(dev);
+
+	/* Say we're busy the first time. */
+	if (data->pm_counter) {
+		data->pm_counter--;
+		pm_runtime_mark_last_busy(dev);
+
+		/*
+		 * We could also purposely slow this down, to potentially lose
+		 * more races:
+		 *   msleep(1000);
+		 */
+
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static int pm_runtime_rearm_test_resume(struct device *dev)
+{
+	struct pm_runtime_test_data *data = dev_get_drvdata(dev);
+
+	data->pm_counter++;
+	return 0;
+}
+
+static const struct dev_pm_ops pm_runtime_rearm_test_ops = {
+	RUNTIME_PM_OPS(pm_runtime_rearm_test_suspend, pm_runtime_rearm_test_resume, NULL)
+};
+
+static void pm_runtime_autosuspend_rearm_test(struct kunit *test)
+{
+	struct device *dev = kunit_device_register(test, DEVICE_NAME);
+	struct pm_runtime_test_data data = {
+		.pm_counter = 1,
+	};
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+
+	dev_set_drvdata(dev, &data);
+	dev->driver->pm = &pm_runtime_rearm_test_ops;
+
+	pm_runtime_set_active(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_enable(dev);
+
+	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
+
+	/*
+	 * .runtime_suspend() should return -EBUSY once, but retry due to
+	 * pm_runtime_mark_last_busy().
+	 */
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_autosuspend(dev));
+
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+	KUNIT_EXPECT_EQ(test, 0, data.pm_counter);
+
+	/* Don't let on-stack drvdata escape this context. */
+	dev->driver->pm = NULL;
+	dev_set_drvdata(dev, NULL);
+}
+
 static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_depth_test),
 	KUNIT_CASE(pm_runtime_already_suspended_test),
@@ -293,6 +362,7 @@ static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_error_test),
 	KUNIT_CASE(pm_runtime_probe_active_test),
 	KUNIT_CASE(pm_runtime_supplier_suspend_test),
+	KUNIT_CASE(pm_runtime_autosuspend_rearm_test),
 	{}
 };
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

