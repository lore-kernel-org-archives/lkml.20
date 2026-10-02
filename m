Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF904E2F13
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 23:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790982454; cv=none; b=f9xtylrm3NLlwSamQ0ipzfso8p73Q5PZNwGy/ljpsvOooAOLpU2CVZffH8OsZCHB9xSxvdTpH1qNlaJwrmd8ffEFTQm24l86zHtK7ziZUFQBvNN+4Mi9+rSd+JzrZaQHt5yW4LEFrm/CAZZhYlLFN5LvrKugrsUPFl8W3VwDoE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790982454; c=relaxed/simple;
	bh=fG6QfTVVGZNR6nW59hafDfsSx91Y6whNu7CnVnXDnuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdzbGMX/feS8B9+LcpAyjp90j4gwXLmPKtkL6D15mdFWjA314Y6P/PpHQHzfj5Lr532x/JvzO8nhe4vbP93zPymjKF036rn+NJNj6miX/GcYUjcBR3t0jFKfXhVjkjLc4uBAOMEGJae+AE/5HO4lz7qmZVD0s3sGCo0yFqp1XoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k/ypKu1i; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k/ypKu1i"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14caa323519so77367c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 16:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790982449; x=1791587249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkKspYGARDVWPzoe67v9qdw1CJ7end45NsypUudMHS0=;
        b=k/ypKu1ihBMI/a/SP34XJBjVkkCpxYL3YsQYjHeWCMaou/wXq3gcbbig9UqAFKW4Ex
         VWts1xGkxuSAHOjlWUwvs4bYZqPxNK0SU7k9n1Mg4KyzjIYMubxiAnuzLT8941hEkO6V
         wOc8InMExgZ1+5d0kiFi4+0DdGZmnxcDfjPHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790982449; x=1791587249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OkKspYGARDVWPzoe67v9qdw1CJ7end45NsypUudMHS0=;
        b=cm1vRsSRvkclWajNzSTW3oS7DB41QhzB4IcJdjjfPRt8eKfhlCA7My8ufJOjkRPBbc
         +tI+FOGyBjuYIsUA9XR3YjPu0kFakRgyO/TcwSY8VngJqqKxx/JRVvwhv0Ob7ppELCbb
         p8l7K72rZ1c52gYbpe2ThMAVxlNOOnngfVDeLeKmg1fHKMh9WpWKXBzLqK81InR5nG8M
         /o/HdWvnKhF5Hovg+SHWZF/j+0/l8Bd61BKEoOXnUdTViAkSHd2oOhvQpc/7Hh29XCOL
         7L0mlE95kfy8PPopA9mLhJtAN9FHYE3g9SdOX22Gz0QUgB5k+ILy+esUuo4P3/1jAb29
         zghQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQdvmSQAGuAHmo+H378zBcMz8+uRtmoDv2rRCBPeGJ3ZctxmlhgnWCRR7zcSvq4Q+MDQz7UV1u37j7qDM=@vger.kernel.org
X-Gm-Message-State: AFuF++kNxTzmalSNVtvGATc28gdAi617x7v6TLNh3bxg4+5tfCUGg3oy
	4ks2TwMaQRvtPHIRrzVqAzzzEBYQkiSkE4i7Xb/jNPTxOlPvJnd/8P/0O2VCFEszoA==
X-Gm-Gg: AYBFou2e1SaZYoA3KGJeeV8FCMjNhNWBYNZ3Kip7Rp1YLjmrVYuyvw3uQIu0CJn9r7b
	UFPMR5pJWofUuFXVTRzRaU4UbLq6IV11ptGVwI6QlSLbp6T1432Qi5DtehtgtCV/TtVTGMPpcZp
	pB4YhF85OJb7suKZUSInM7wSIvt2I9V98yPNC4fEzYQvR2hYuw9MHaG+Iajr4Aeo9jvfDqUn1pe
	iROkzBFgkKWmkzZk9ruUQFom7MV7YxwQueSuKAcP+1qQJJGmlolKp/yWb2ImDNMl0NalEcDK9xm
	4j8hB4eIN8dSvP+5EYeFvG64Nw36htMxYvF1o4LrFwEhjPxFdGEt9CSkvIEglUZsm2men2g3j7w
	eerg1RdV9FTcNadigefcSTBcOAo5z1/pGvQN0pqMgKzitZ9WoRy4heLta8nf6IwD4aiubyVNiny
	X/WrNMpkjXbeA8NDED+UpQOSZU8RTq+duvhufeE68nlma0baB0HIWLdsJYKNBeujcvMoo9PY5u6
	JTZrVY8I0erPz3UZjK8PLaDU6jIkcJKYaf45Q==
X-Received: by 2002:a05:701b:458e:20b0:141:4a06:ad6f with SMTP id a92af1059eb24-151c32dd5cfmr996174c88.8.1790982448536;
        Fri, 02 Oct 2026 16:07:28 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:b0dc:e72e:e96b:3323])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-151fc39a6cbsm555611c88.5.2026.10.02.16.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 16:07:27 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-arm-kernel@lists.infradead.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 4/5] PM: runtime: Add tests for last_busy propagation
Date: Fri,  2 Oct 2026 16:03:08 -0700
Message-ID: <20261002160309.4.I8ab8b7f662fe1921c7084a47d554535597cc2702@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261002230714.507921-1-briannorris@chromium.org>
References: <20261002230714.507921-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a regression test for the problem fixed in "PM: runtime:
Propagate last_busy from dependent to dependency".

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/base/power/runtime-test.c | 101 ++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/base/power/runtime-test.c b/drivers/base/power/runtime-test.c
index 24865ce844fc..4b507821912b 100644
--- a/drivers/base/power/runtime-test.c
+++ b/drivers/base/power/runtime-test.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <linux/workqueue.h>
 #include <kunit/device.h>
@@ -285,6 +286,104 @@ static void pm_runtime_supplier_suspend_test(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(norpm_supplier));
 }
 
+static void pm_runtime_parent_last_used_test(struct kunit *test)
+{
+	struct device *parent = kunit_device_register(test, DEVICE_NAME "_parent");
+	struct device *dev = kunit_device_register(test, DEVICE_NAME);
+	u64 expiry1, expiry2;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
+
+	put_device(dev->parent);
+	dev->parent = parent;
+	get_device(parent);
+
+	pm_runtime_set_active(parent);
+	pm_runtime_set_active(dev);
+	pm_runtime_use_autosuspend(parent);
+	pm_runtime_use_autosuspend(dev);
+
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	/* Effectively infinite delay (prevent finishing autosuspend during this test). */
+	pm_runtime_set_autosuspend_delay(parent, 200000);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_mark_last_busy(parent);
+
+	pm_runtime_get_noresume(dev);
+
+	pm_runtime_enable(parent);
+	pm_runtime_enable(dev);
+
+	expiry1 = pm_runtime_autosuspend_expiration(parent);
+	KUNIT_EXPECT_NE(test, 0, expiry1);
+
+	/* Make absolutely sure the clock advances. */
+	msleep(1);
+
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync_autosuspend(dev));
+
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+
+	/* Flush, in case any request was pending. */
+	flush_workqueue(pm_wq);
+	KUNIT_EXPECT_FALSE(test, pm_runtime_suspended(parent));
+
+	expiry2 = pm_runtime_autosuspend_expiration(parent);
+	KUNIT_EXPECT_NE(test, 0, expiry2);
+	/* The child's last_busy time should have bumped up the parent's expiration. */
+	KUNIT_EXPECT_GT(test, expiry2, expiry1);
+}
+
+static void pm_runtime_supplier_last_used_test(struct kunit *test)
+{
+	struct device *supplier = kunit_device_register(test, DEVICE_NAME "_supplier");
+	struct device *dev = kunit_device_register(test, DEVICE_NAME);
+	u64 expiry1, expiry2;
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supplier);
+
+	KUNIT_ASSERT_NOT_NULL(test, device_link_add(dev, supplier, DL_FLAG_PM_RUNTIME));
+
+	pm_runtime_set_active(supplier);
+	pm_runtime_set_active(dev);
+	pm_runtime_use_autosuspend(supplier);
+	pm_runtime_use_autosuspend(dev);
+
+	pm_runtime_set_autosuspend_delay(dev, 0);
+	/* Effectively infinite delay (prevent finishing autosuspend during this test). */
+	pm_runtime_set_autosuspend_delay(supplier, 200000);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_mark_last_busy(supplier);
+
+	pm_runtime_get_noresume(dev);
+
+	pm_runtime_enable(supplier);
+	pm_runtime_enable(dev);
+
+	expiry1 = pm_runtime_autosuspend_expiration(supplier);
+	KUNIT_EXPECT_NE(test, 0, expiry1);
+
+	/* Make absolutely sure the clock advances. */
+	msleep(1);
+
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync_autosuspend(dev));
+
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+
+	/* Flush, in case any request was pending. */
+	flush_workqueue(pm_wq);
+	KUNIT_EXPECT_FALSE(test, pm_runtime_suspended(supplier));
+
+	expiry2 = pm_runtime_autosuspend_expiration(supplier);
+	KUNIT_EXPECT_NE(test, 0, expiry2);
+	/* The consumer's last_busy time should have bumped up the supplier's expiration. */
+	KUNIT_EXPECT_GT(test, expiry2, expiry1);
+}
+
 static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_depth_test),
 	KUNIT_CASE(pm_runtime_already_suspended_test),
@@ -293,6 +392,8 @@ static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_error_test),
 	KUNIT_CASE(pm_runtime_probe_active_test),
 	KUNIT_CASE(pm_runtime_supplier_suspend_test),
+	KUNIT_CASE(pm_runtime_parent_last_used_test),
+	KUNIT_CASE(pm_runtime_supplier_last_used_test),
 	{}
 };
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

