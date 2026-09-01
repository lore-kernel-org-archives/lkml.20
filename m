Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9FB33D6E6
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 01:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788226477; cv=none; b=DFYta5dKpll+VyJ72bJ4yGdnO3R2JdHzZkuK719ObiFsn0DBQkabpAISujIBoL6BpSho0lM/bMMmA9y1mGvZx99cB2f/YTIjS7SnqQpFd9X8ujzDWGCxjDkUp6glwfPjkLI3B17zsjy3O7JtebaPS+SO82v7By+LETDQrsxnq/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788226477; c=relaxed/simple;
	bh=1mpcEHU+vXV7UJTachxrk+ovjYhZdLAWpZ3FoOglyek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oape4BDt0bDmDbmHBbZTMRGmEl48qb5jZe8JZ43rraJAJei5iEv3U8wRa+vZ22QHO3BWXMeNOjQT2f4dYk4wt8vLpYK1ITZAxbQs5M3AGU83AD3AzXIdMT2cW2BJOhfEDLAazjLZ2W1YvP2FNDe5F8BOBmUU1prV8JW+EIJmHms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bQmikC0c; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bQmikC0c"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1c7364550so4440778a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788226474; x=1788831274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbPmurZM++0R7ryOeZy8bjoqVFB9j6Ae9S7wxXumXEQ=;
        b=bQmikC0cT0uQc2qrvNK0NedWjMX2YKjeYuvWNa4/3jv1XTLpLRGNdqIz6ae4MA70FX
         LCaL+9XJt3pA9gzhDo4DgQfyPa/sxLH52zB3/ZM5SpmXt9WLZfwALnlaB5PMsr60sjh4
         vYZmtZEKpOO1pL29iyERrTYtnguJ/QEl6toNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788226474; x=1788831274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbPmurZM++0R7ryOeZy8bjoqVFB9j6Ae9S7wxXumXEQ=;
        b=aQx3kJkyGkmO5RU8KWj3ZPJsLHe2fr+KbPMu1H4iCaExWzpZp4HyI5Eo6NLGx4BWWq
         J8cOsEt4SONNUgQttdPwbN9rD75Jj0Qpw9HMuvme7YjCXLHr2O75Moi6og7VnOwRxgez
         rPMNZ+cLBoYzRixSHyI+XhmmUctvKOuBKZh5lTs1rK6YtnzUU8eAvkgHWMPxGRLoKMLy
         nauiULLbps5umxke7/TOMKXXDTZGB/w5t1pM5TBBVvJ6/taMnGphYwbuVxgNAVZlOrV0
         mN6XRR/QYHLUmgZW4ssIGqhQH2VPAzakJiPlR5H9a38NgJrZSJdqlm52nyvoqRPFCpfE
         TKdg==
X-Forwarded-Encrypted: i=1; AHgh+RoXbUYdVF0xalkIsTo470C0Ahh5TgfsnW6g8+l53J57oAVBmyuhUqYRZmu40NKzr5EXCVLIoTknRe8G7gU=@vger.kernel.org
X-Gm-Message-State: AFuF++nJLLpkCUlEys1o9AWnYjZNvgmyMezrTxesWBNQpYZqcHlNoojR
	nWYcHI4SUXfFzw9RNcEkh/nbZax0rgV9/DWO9pbCNVfuSFlCHDxiLBRyeBn7bO6w/g==
X-Gm-Gg: AR+sD12HxHSDjKD9QpfOK4WFs5gmJmcJyCIwwqjRFA9TCmw5bHOuJ/aGgQMQxFDEK5G
	pnWwQBdCnTqHNR2ovab+4xKMooV6wELuOrtZcUTJkM0cw2ewgFYrkJILB6UFKDec9IncyCahNSH
	/sFk2FmW4M76ZWVMpphyjY0ESAFH6PA3RQIbD2yVzcejLzlhM59AR8ULIvvXx3FDsUenDcyqUDO
	F+8Pld330gAq1izWfkjBjgj0mI/TUg6Xwtq5PrX4ZbIr9Zwa0b1KJJSWtDlrUAmsVv32b9rFMC9
	clSsjEdDWOvDMheAOTDL3Dbik5G7Pcf7MgNvrmVjgK+UWT4YEhPgjH9HxpgNnwqhwrDD/mqj8gY
	k7Pyuk6BJTnyEigPA9xASFLmOioc/aMH7UPNnKwnFr3jjnd4E4lhR8S4VgPpf56ECvid/Q4Wvx8
	3H1iYGH/l5y8iDYlZ3Bt2HVTpaIbV4gzIa8b1LKi13oeO8qdpG+GlNoX+OQgzWv/27Yt0cXfMhS
	Q3H7fSUJwKXoLVMIdZxRuoj1qGnTYGxuPD6Ng==
X-Received: by 2002:a05:6a21:3944:b0:3d3:aec2:4dcb with SMTP id adf61e73a8af0-3d7b075b26bmr8592474637.23.1788226473927;
        Mon, 31 Aug 2026 18:34:33 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:ab65:e5d8:860b:c20f])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-142e0d38207sm31017877c88.5.2026.08.31.18.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 18:34:33 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 2/2] PM: runtime: Add kunit test for supplier idle/suspend
Date: Mon, 31 Aug 2026 18:23:23 -0700
Message-ID: <20260901013341.1417232-2-briannorris@chromium.org>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
In-Reply-To: <20260901013341.1417232-1-briannorris@chromium.org>
References: <20260901013341.1417232-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a unit test that covers the bugfix/optimization in the previous
patch, "PM: runtime: Only queue an idle check for RPM-linked suppliers".

This test ensures:

1) device links with DL_FLAG_PM_RUNTIME can RPM-resume/suspend properly;
   and

2) device links without DL_FLAG_PM_RUNTIME are not accidentally
   resumed/suspended along with the consumer.

Notably, without patch 1 ("PM: runtime: Only queue an idle check for
RPM-linked suppliers"), the no-RPM supplier will fail 2 of its last 3
test expectations:

  $ tools/testing/kunit/kunit.py run --kconfig_add CONFIG_PM=y 'pm_runtime*'

  ...

  ## Fails because rpm_suspend_suppliers() suspended the wrong links
  [17:01:44] # pm_runtime_supplier_suspend_test: EXPECTATION FAILED at drivers/base/power/runtime-test.c:279
  [17:01:44] Expected pm_runtime_active(norpm_supplier) to be true, but is false

  ## Fails because the no-RPM supplier is already suspended unexpectedly
  [17:01:44] # pm_runtime_supplier_suspend_test: EXPECTATION FAILED at drivers/base/power/runtime-test.c:282
  [17:01:44] Expected 0 == pm_runtime_suspend(norpm_supplier), but
  [17:01:44]     pm_runtime_suspend(norpm_supplier) == 1 (0x1)
  ...

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
In my opinion, this patch is slightly better as a proof for my patch 1
fix, rather than a proper unit test, mainly because it:

1) tests a somewhat arcane set of particular sequences and

2) lightly depends on the behavior of pm_wq.

But it should be a reliable regression test still, if it's deemed
valuable.

 drivers/base/power/runtime-test.c | 57 +++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/base/power/runtime-test.c b/drivers/base/power/runtime-test.c
index 1535ad2b0264..24865ce844fc 100644
--- a/drivers/base/power/runtime-test.c
+++ b/drivers/base/power/runtime-test.c
@@ -5,6 +5,7 @@
 
 #include <linux/cleanup.h>
 #include <linux/pm_runtime.h>
+#include <linux/workqueue.h>
 #include <kunit/device.h>
 #include <kunit/test.h>
 
@@ -229,6 +230,61 @@ static void pm_runtime_probe_active_test(struct kunit *test)
 	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
 }
 
+static void pm_runtime_supplier_suspend_test(struct kunit *test)
+{
+	struct device *dev = kunit_device_register(test, DEVICE_NAME);
+	struct device *supplier = kunit_device_register(test, DEVICE_NAME "_supplier");
+	struct device *norpm_supplier = kunit_device_register(test, DEVICE_NAME "_norpm_supplier");
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supplier);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, norpm_supplier);
+
+	KUNIT_ASSERT_NOT_NULL(test, device_link_add(dev, supplier, DL_FLAG_PM_RUNTIME));
+	KUNIT_ASSERT_NOT_NULL(test, device_link_add(dev, norpm_supplier, 0));
+
+	pm_runtime_enable(dev);
+	pm_runtime_enable(supplier);
+	pm_runtime_enable(norpm_supplier);
+
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(supplier));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(norpm_supplier));
+
+	/*
+	 * Resume the device and RPM-linked supplier; non-RPM-linked supplier
+	 * stays suspended.
+	 */
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(dev));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_active(dev));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_active(supplier));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(norpm_supplier));
+
+	/* Also resume the non-RPM-linked supplier. */
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_get_sync(norpm_supplier));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_active(norpm_supplier));
+
+	pm_runtime_put_noidle(norpm_supplier);
+	KUNIT_EXPECT_TRUE(test, pm_runtime_active(norpm_supplier));
+
+	/*
+	 * Suspend device. This should only suspend the device and its
+	 * RPM-linked supplier, not the non-RPM-linked supplier.
+	 */
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync(dev));
+	/* Note: supplier suspend is async, so we have to flush the queue. */
+	flush_workqueue(pm_wq);
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(supplier));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_active(norpm_supplier));
+
+	/* Now suspend non-RPM-linked supplier. */
+	KUNIT_EXPECT_EQ(test, 0, pm_runtime_suspend(norpm_supplier));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(supplier));
+	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(norpm_supplier));
+}
+
 static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_depth_test),
 	KUNIT_CASE(pm_runtime_already_suspended_test),
@@ -236,6 +292,7 @@ static struct kunit_case pm_runtime_test_cases[] = {
 	KUNIT_CASE(pm_runtime_disabled_test),
 	KUNIT_CASE(pm_runtime_error_test),
 	KUNIT_CASE(pm_runtime_probe_active_test),
+	KUNIT_CASE(pm_runtime_supplier_suspend_test),
 	{}
 };
 
-- 
2.55.0.970.g62bdec98f9-goog

