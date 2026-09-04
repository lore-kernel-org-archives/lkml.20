Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D50C426438
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556847; cv=none; b=kpgW8qSGXhVsJckbZyHRcHv9AscxC7mQGZIN+jqnYvtS0eFtozWTJoaOAGo6LrKGQ2X96ZlOxAMO0MIvC6zNwEJup+5/azugWvRxc5D1Tyh4nm1AZTsGk3ijcOylumQHJhW5iMHkQ7jjbjNU/wSdpoHmt+iM60gOALd/Z0+MXyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556847; c=relaxed/simple;
	bh=zpAgL8P6FNbE1LYBSegFO2+80rMWZv3GX4lFHBkUF3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTUL1i+fqWB6fMUujlmpJGg93E4jkEPQbt+NKmEYWhcANaV2jwoYGap4DEJRZfjxJ6xDB9bXsZP5te0k0PcuYo7gWtlOl0PnnztecGnh2Ao4osFulnB3Nz6BVXDdhGAOz0TJBKsk0EgcL/hPV4yhj2KiD7vFtFMx6koZ5cic0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ys87HF7D; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ys87HF7D"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so1046941a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788556845; x=1789161645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STORd2EPPp/b+HJxfGtKajHr5QfBJeb7BJYUKdgcjIA=;
        b=Ys87HF7DoKzuC/yX9wkCp8BCD/RcuesWa6/ONUAVI9nQBtbC3mBoK41/5QB9YKvLGn
         FKk6rgc3D1lKiQzR7jRfiuDXhHh+wvMS3H4wj5TxwCIzC8bLxB912DtBCT4U2vKjvJI/
         r5X67pdS+vBw+sD1xBAgstEckAIdK9v3SWqbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788556845; x=1789161645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=STORd2EPPp/b+HJxfGtKajHr5QfBJeb7BJYUKdgcjIA=;
        b=JBT5G38tDXNhTNNP8aoLebRIfzutK+y//iPqe6v2XXHFbbuq4gQda8DLeD/hIqf4D5
         jHoghhYxHMXdzH/Q2odQbb9j/LipAWoEeOXsxzNKfZ/rMqk6WdD2nhJ66FhkVMKPlvFx
         I5iLWcUeWcXkHd9ztCukXP3tJUmbdp7hHOxGt3IIAyq1Fb2LV8ggPkDBU5x2sKz+uX+t
         RbrZpFYP4CM6iyVHfgieJa39BBHVqA20ToXvuCqfhaJffPV4sOdgdecTcm4ZbQhJqo7U
         9Z1a5gE1W7mvKS+w6xH3ZZKMCNYdvAyPHOANBOpXC4vc6h1WAFcNTl4YdEtaaFWk7l4A
         1ZOw==
X-Gm-Message-State: AFuF++kuWmRp8eV810B/cc+CPKzdHHlPqtY3YJ7e8JhfKvR4FpqT1LYz
	TokIhYIxZS4n+AQ3No8xtCGJY8n2iH0La34SyS6UUeXvR29D3WoGTS7jawwVD0zKIA==
X-Gm-Gg: AYBFou3K9IPORKkShtFRC7FIwcEcWDTWO/bjmqZ3INVz+b6dltlPtdbeZ/fYwkU/rf5
	RukpaGJQ2wpN2auuiCpykjGKMN5lfPcP4M7jWyHAy6aNLuRJOnoVn+jSyYhrBa6BC2VlOUWOnOr
	4NkXtG7X1x/z6fzx4eE8fIZ7cy9GbqwhbtQHvZLq1iva1A3XX0LnRYYtWTNEOM84CWY0TY+IN0E
	q/AOA6VHUsFZNnI6XQuIlJJCBGJMhTVsPMCzqWKimarvclg8zcIG5RZ5ZdHS/IrMcnLSLcftoaF
	wG3LNgiJw9VLrFIAdEzs835YpAaH4Ez6CrvpldtWoFQwm/Z3GngQgxxiSUyoQpP2D1epRu9OCtR
	5KVpW/ZVNrju8ycJ+Go5nQWri4q4n1OruFQyTlIVftvQb+Ssh/rsqba65A79U+7mm2rGlb/kKHj
	lezT1w6TTT8/VPPrGEpLm7EZmMRF4CIaF9SSTC9PTufgnqUuMu9AaL8vQOwyRlxpb54Sv0ZlRuD
	hkQ4uAIGb3wV0lLoHAbYclZtzg=
X-Received: by 2002:a05:6a21:6487:b0:3d4:52bd:b89d with SMTP id adf61e73a8af0-3da3a0b2671mr11819689637.23.1788556844604;
        Fri, 04 Sep 2026 14:20:44 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5597:62ab:c321:4a7f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3339a62be87sm8127527eec.6.2026.09.04.14.20.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 14:20:43 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Len Brown <lenb@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 10/11] PM: runtime: Add "Section" hyperlinks
Date: Fri,  4 Sep 2026 14:12:15 -0700
Message-ID: <20260904141215.10.I7666a5802ea59359afce4ff7d0b1af668e5f5292@changeid>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904212000.4167880-1-briannorris@chromium.org>
References: <20260904212000.4167880-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add reStructuredText targets for each section, and use them throughout
to make the generated HTML more navigable.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 Documentation/power/runtime_pm.rst | 56 ++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 19 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 8e4e03b7dbfe..d34f846ec822 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -8,6 +8,8 @@ Runtime Power Management Framework for I/O Devices
 
 (C) 2014 Intel Corp., Rafael J. Wysocki <rafael.j.wysocki@intel.com>
 
+.. _Section 1:
+
 1. Introduction
 ===============
 
@@ -58,7 +60,7 @@ complementary states that operate orthogonally: **active** / **suspended**,
 
 Notably, runtime PM also has a feature called "autosuspend." This is different
 than the ``control`` notion of "auto" (i.e., "allowed"). Autosuspend is
-described in more detail in Section 9.
+described in more detail in `Section 9`_.
 
 Implementation Structure
 ------------------------
@@ -67,17 +69,17 @@ Support for runtime power management is provided at the power management core
 (PM core) level by means of:
 
 * Three device runtime PM callbacks in 'struct dev_pm_ops' (defined in
-  include/linux/pm.h). See Section 2.
+  include/linux/pm.h). See `Section 2`_.
 
 * A number of runtime PM fields in the 'power' member of 'struct device' that
   can be used for synchronizing runtime PM operations with one another. These
-  are covered in Section 3.
+  are covered in `Section 3`_.
 
 * A set of helper functions defined in drivers/base/power/runtime.c that can be
   used for carrying out runtime PM operations in such a way that the
   synchronization between them is taken care of by the PM core. Bus types and
   device drivers are encouraged to use these functions. They are covered in
-  Section 4.
+  `Section 4`_.
 
 * The power management workqueue pm_wq in which bus types and device drivers can
   put their PM-related work items. It is strongly recommended that pm_wq be
@@ -86,6 +88,8 @@ Support for runtime power management is provided at the power management core
   hibernation and resume from system sleep states). pm_wq is declared in
   include/linux/pm_runtime.h and defined in kernel/power/main.c.
 
+.. _Section 2:
+
 2. Device Runtime PM Callbacks
 ==============================
 
@@ -137,8 +141,8 @@ the PM core that it is safe to run the ->runtime_suspend(), ->runtime_resume()
 and ->runtime_idle() callbacks for the given device in atomic context with
 interrupts disabled.  This implies that the callback routines in question must
 not block or sleep, but it also means that the synchronous helper functions
-listed at the end of Section 4 may be used for that device within an interrupt
-handler or generally in an atomic context.
+listed at the end of `Section 4`_ may be used for that device within an
+interrupt handler or generally in an atomic context.
 
 Callback Semantics
 ------------------
@@ -165,9 +169,9 @@ knows what to do to handle the device).
 
   * If the suspend callback returns an error code different from -EBUSY and
     -EAGAIN, the PM core regards this as a fatal error and will refuse to run
-    the helper functions described in Section 4 for the device until its status
-    is directly set to  either 'active', or 'suspended' (the PM core provides
-    special helper functions for this purpose).
+    the helper functions described in `Section 4`_ for the device until its
+    status is directly set to  either 'active', or 'suspended' (the PM core
+    provides special helper functions for this purpose).
 
 In particular, if the driver requires remote wakeup capability (i.e. hardware
 mechanism allowing the device to request a change of its power state, such as
@@ -192,10 +196,10 @@ what to do to handle the device).
     'active'.
 
   * If the resume callback returns an error code, the PM core regards this as a
-    fatal error and will refuse to run the helper functions described in Section
-    4 for the device, until its status is directly set to either 'active', or
-    'suspended' (by means of special helper functions provided by the PM core
-    for this purpose).
+    fatal error and will refuse to run the helper functions described in
+    `Section 4`_ for the device, until its status is directly set to either
+    'active', or 'suspended' (by means of special helper functions provided by
+    the PM core for this purpose).
 
 The idle callback (a subsystem-level one, if present, or the driver one) is
 executed by the PM core whenever the device appears to be idle, which is
@@ -226,9 +230,9 @@ simply stops the PM core from suspending the device.
 Core Guarantees and Synchronization Rules
 -----------------------------------------
 
-The helper functions provided by the PM core, described in Section 4, guarantee
-that the following constraints are met with respect to runtime PM callbacks for
-one device:
+The helper functions provided by the PM core, described in `Section 4`_,
+guarantee that the following constraints are met with respect to runtime PM
+callbacks for one device:
 
 (1) The callbacks are mutually exclusive (e.g. it is forbidden to execute
     ->runtime_suspend() in parallel with ->runtime_resume() or with another
@@ -268,6 +272,8 @@ rules:
     scheduled requests to execute the other callbacks for the same device,
     except for scheduled autosuspends.
 
+.. _Section 3:
+
 3. Runtime PM Device Fields
 ===========================
 
@@ -278,6 +284,8 @@ state.
 .. kernel-doc:: include/linux/pm.h
    :identifiers: dev_pm_info
 
+.. _Section 4:
+
 4. Runtime PM Device Helper Functions
 =====================================
 
@@ -325,12 +333,14 @@ functions may also be used in interrupt context:
 - pm_runtime_put_sync_suspend()
 - pm_runtime_put_sync_autosuspend()
 
+.. _Section 5:
+
 5. Runtime PM Initialization, Device Probing and Removal
 ========================================================
 
 Initially, the runtime PM is disabled for all devices, which means that the
-majority of the runtime PM helper functions described in Section 4 will return
--EACCES until pm_runtime_enable() is called for the device.
+majority of the runtime PM helper functions described in `Section 4`_ will
+return -EACCES until pm_runtime_enable() is called for the device.
 
 In addition to that, the initial runtime PM status of all devices is
 'suspended', but it need not reflect the actual physical state of the device.
@@ -353,7 +363,7 @@ pm_runtime_set_suspended().
 If the default initial runtime PM status of the device (i.e. 'suspended')
 reflects the actual state of the device, its bus type's or its driver's
 ->probe() callback will likely need to wake it up using one of the PM core's
-helper functions described in Section 4.  In that case, pm_runtime_resume()
+helper functions described in `Section 4`_.  In that case, pm_runtime_resume()
 should be used.  Of course, for this purpose the device's runtime PM has to be
 enabled earlier by calling pm_runtime_enable().
 
@@ -404,6 +414,8 @@ value of /sys/devices/.../power/control to "auto" to allow the driver to power
 manage the device at run time, the driver may confuse it by using
 pm_runtime_forbid() this way.
 
+.. _Section 6:
+
 6. Runtime PM and System Sleep
 ==============================
 
@@ -496,6 +508,8 @@ out the following operations:
     callback and right after executing the subsystem-level .complete() callback
     for it, respectively.
 
+.. _Section 7:
+
 7. Generic subsystem callbacks
 ==============================
 
@@ -519,6 +533,8 @@ restore, and runtime resume, can achieve similar behaviour with the help of the
 DEFINE_RUNTIME_DEV_PM_OPS() macro defined in include/linux/pm_runtime.h
 (possibly setting its last argument to NULL).
 
+.. _Section 8:
+
 8. "No-Callback" Devices
 ========================
 
@@ -555,6 +571,8 @@ in subsystems/drivers, the PM core allows runtime PM callbacks to be
 unassigned. More precisely, if a callback pointer is NULL, the PM core will act
 as though there was a callback and it returned 0.
 
+.. _Section 9:
+
 9. Autosuspend, or automatically-delayed suspends
 =================================================
 
-- 
2.55.0.979.g7e5102b832-goog

