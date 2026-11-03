Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744593;
	b=Kk/BWRqe4oJUwIp8vSmDMx9xQOQLwOMxssNkLjtqemXfDMuHk9jpZzmzWBmE7Sjx3ea1
	 ac3PvYw4ES00iaPrMIYXeZ+sR4oROvm/JkZ2CQIZZ+05U4j7ZkIehTdblKPGWMyO39klC
	 u7Uxwe4pN/BWRCrTAJ4HBtDy7Ro/EGPJDoZqxDV5SGYeqbDJ7j7UZFVRGEM4giSc7iRH8
	 74rmHhZeyQZxXieSB0Ryqvmw+xpT/98kYgrJ4wguAsN453XQpfEgsTaCLXS8uwVbhI56n
	 nwnW4mI+GNl3YfyARSI2n7uLHVLP6FcHPDc89m3ZcNe7kihuRZKQt46CSP3DnEoeY6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XO1aKAZ4c+Vq+VoVRfgfaXaALlLR0DAwRzH6Ig8e8vY=;
	b=uqVERPNQW9rxEMdaOnU4JF+J/IgBRf/BbuN+d4Y7Dybxq4s3pbwrRSDWM3iGbuGdDS7K
	 yT2/Y6zibhgqzCXiRguwMwf3/nhbyKnJ+rr2DNVz6d5D/fgkqTEZ0voGZkveuNzt/9K9U
	 SlR/93FmqoCEkNQE1EFp3pmrQqfQ2VWrNl3MbgSjgavmuInKtJ9IR3Vl4RmUv6YhVyint
	 gUNqZfIB0yOhf41Ei7OTToqW0rCSVFLiDvIVEWwTxeVQrCusEii05ZrbvLXmSRkmdT6m6
	 GpUInTUDtbLXaXTHsrC+FU4qKv8n2iJufXR2Uwc8zV6C35PcX8EaTEHk9+QxsMzHu+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HdnoY5B0;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12A6606A338
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C12A6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HdnoY5B0
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-14fc585291cso116451c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793744592; x=1794349392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XO1aKAZ4c+Vq+VoVRfgfaXaALlLR0DAwRzH6Ig8e8vY=;
        b=HdnoY5B0JDz42jRm5BlRDceYDJ3WSIB/CZYtTdZsB88fUFDrQusR1IqeZBhz0/Sf+Q
         OBnZ6robHUitpZ9nFtdWzxu5slg9n3V7y2LZoDjSLNujxGt2KAniP3ashQSN9SCCawKp
         9n5AMN2bKEj4blcjSY9EM2NbYdm4VFfg8PVd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744592; x=1794349392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XO1aKAZ4c+Vq+VoVRfgfaXaALlLR0DAwRzH6Ig8e8vY=;
        b=W767/hDsfgAsizzx6Ce9RXjE/QG9bUAnLVNwCkG1WrKIyzfFB0eOlqDUTVD0EbIOth
         Wrn5YqVYenaCbDFJuorTOYgqNWBXuXeloH/nDhsrxlyPq8CUiQNm/krpxk+TepZXfmDl
         PJ/xodtt1mr0lPdV/4gEZ6aposazGk+2LPMKguY1ffap21ShOBJc8e+sK9tJUvktmB4c
         ExYpWlcFlJ52vGBHcjPAgUXF2/VJEegCNwV5AdBtJiwWZS8ldM6kq44L33kE7A3Y4PQ3
         D7NgCtB7dWjqObDHXrIO4dpWu/byj/pKw6YSG8B0RDnH4iXRvYep+y0H4xFKaNHqGpbg
         ZnyA==
X-Forwarded-Encrypted: i=1; AKwUvBxhjLtVi80XsChQ1el497gX9nDCI6udgtgkzaI57b4sh9qEBONkqi1gD6B5LPoYNmEIv1acNamMkoQ8/Rc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PPO83lKX4MCYpPcfsmFmvkVFcjxuFmynWv+bILv5x1+Qi5l51
	XVqqMjcI9i9gvmoKYCOW7gCYX8HemSAyJT4xEhjMEtuyVXkk7eA9shspNDpmqIRQ/A==
X-Gm-Gg: AYBFou3tun57XN0DyP82oqncWsGlJVSoBqZv/Yxm396aqC9cdEvSzynLQMc1h0FD/vB
	isAu+rLkGO74x6RP1cksg3D5C/a147UMjr5gL7VcPyGxjk9AfI6E+4uu22lhU3nTe77Dp3dqtJD
	zY1+ZeI0hoCRP80lfRJu0tnkdlqk1ZO4cLvBKaRbnAMU9wjFkOL0p2jl/dg1LDAkd5basFo8PHJ
	94bNxy7Sgw5CTFBljgg3cVmaup2+DKgEPYa3WJNJUtIKTI9WRxrQtYiqi4Ns/TrsexgpDGBaPGs
	eFNE4gQwcaItg3QzEh+CepoG5twp0NrEQgSRn9UWB+tZ9mft2k4Q1EDO4fSQ2+gSDclF2pvNun3
	ZK3jCeDG7f4my6DXwBPl8Utj76+6JPqKhhudOhzlrWk92pDjxpC3d3xK0+dFGsqlHkwuD9IjeLb
	c4cBOxQWP1YIjv8ngH4CkSAVvOHMFjsk7/FhG9o6L54Hu0tGQNK88WjHl/3ZJUNxpr6Nx2sIa6P
	RfrIfXevfYRx+23MMgkxosQPSBhL7DOtK7rfkO8n0inqGBHB6hgbtOt6zryk/XsaNG3hAmfPGwa
	bY4El+UOGQxNdt8bWsWDxhJbXyrQFV7YhvdUQ6V7D4mN20EnRx8f7tHMMJCjU80b74gb
X-Received: by 2002:a05:7022:fc0b:b0:176:2095:1ac4 with SMTP id a92af1059eb24-1ac5cfe584emr17460446c88.18.1793744591842;
        Tue, 03 Nov 2026 14:23:11 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b245c2d69asm1650085c88.11.2026.11.03.14.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:23:11 -0800 (PST)
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
Subject: [PATCH v2 4/5] PM: runtime: Add tests for last_busy propagation
Date: Tue,  3 Nov 2026 14:14:42 -0800
Message-ID: <20261103141442.v2.4.I8ab8b7f662fe1921c7084a47d554535597cc2702@changeid>
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

This is a regression test for the problem fixed in "PM: runtime:
Propagate last_busy from dependent to dependency".

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Use device_move() instead of manual re-parenting
 * fsleep() instead of msleep()

 drivers/base/power/runtime-test.c | 99 +++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/drivers/base/power/runtime-test.c b/drivers/base/power/runtime-test.c
index 24865ce844fc..00ca3b10543a 100644
--- a/drivers/base/power/runtime-test.c
+++ b/drivers/base/power/runtime-test.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/pm_runtime.h>
 #include <linux/workqueue.h>
 #include <kunit/device.h>
@@ -285,6 +286,102 @@ static void pm_runtime_supplier_suspend_test(struct kunit *test)
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
+	KUNIT_ASSERT_EQ(test, 0, device_move(dev, parent, DPM_ORDER_NONE));
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
+	fsleep(1000);
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
+	fsleep(1000);
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
@@ -293,6 +390,8 @@ static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_error_test),
 	KUNIT_CASE(pm_runtime_probe_active_test),
 	KUNIT_CASE(pm_runtime_supplier_suspend_test),
+	KUNIT_CASE(pm_runtime_parent_last_used_test),
+	KUNIT_CASE(pm_runtime_supplier_last_used_test),
 	{}
 };
 
-- 
2.56.0.398.g882cbad275-goog

