Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6655736F419
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 02:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790736677; cv=none; b=aiiUZHbAbiesGlUp3Q1lBnaR8bbCUr6EIoagCfm+4CJfo2jr8QRwnaAU3t9CpnyiM3xNLk2a09fl/+gwA0pBs1RVrHtitbwmnOUkHB1CGqWSr7m9tOPEpjgIbU52qJFx+BAYNe7QOM4V766x9vuRRBKvcezWK4aE/Od5VkUYBJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790736677; c=relaxed/simple;
	bh=ZMMEMT1gSfAS7Nee1++mpY+C4dGdTxKp2OPexx1WNGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxOq/aZZ1zHDDoNzOvRSLH9T37TCh7H/Ea8cUwJ18wkh/F6Erw4dDnJp5GTTOa9M+UmUDlFW2iGlv46Coa/j7JKnPJ5Vv5UzFD09YGtGMgireAz8UCwycEuv34BL5xmhAqpBi9k2jLm52gmfzBTfCESpyDF74E0demi1vmkBgKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BQv+x6Hf; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BQv+x6Hf"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-34c4a0868b6so462721eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 19:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790736671; x=1791341471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfn3iqbanXvXOFT32vX6Dc04K6HLrOlSkRom8tqs9h4=;
        b=BQv+x6Hfxt72WEZEn/tI4g3bChu8t4Lrs4uc/POWjSysh//oFCvuPyvPBXb9KGHHxX
         sckUOJg2jlnyCPd8IrJfRyc/2KFgj/BrXCBCrBkRK78W93ZvLeuz1RxZLzi8RjUxP7OH
         M0CgcfmCvTpkSEkSnq0gpfqTojliMVHW4dhIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790736671; x=1791341471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nfn3iqbanXvXOFT32vX6Dc04K6HLrOlSkRom8tqs9h4=;
        b=kQ1XyE8bvPXNsmzS9oi87+PY9zhgypqyTmTLdBxWl21zrK8ulYugem8ubv0Ibmsl6J
         STFNYYP2wkVzquUdlFHiaXtJ3XDsPelVcDODOltQTyAYfhKButIx8hoAO2G7IHxUlwS6
         Bo5oLVmwGjKWpoo4Z5QSKclBp44WcPc8KE9wsFjAkEMwIiJYsZPJzg+uB6FmQTYA/5ov
         FT4oPNkosHpah07NeIqmXm+GUt3WZBlakzMSM6EKcg0fdXiEN6LYT4vdmonlKpz/srj+
         HoAFe4R93sF7eRIrSj4TgJJL8gQ+RsvUPm5tdTTfzPFj9iBKa0OjNjJk1DlHgSxnrHyN
         HN+g==
X-Forwarded-Encrypted: i=1; AKwUvBzpkGtkcqZstWLOEgV1yQBWMYwdvvzBQjut1mVzLuQKJvSTTRughRLGuGQDZdPPA+V/dtNLaWMyz0s7fKM=@vger.kernel.org
X-Gm-Message-State: AFuF++n+Yo48+fg+qLNV8MFPSUzm4z09pGgcZNTumSXkcizCmkrJYLrJ
	Cdtv4ztswm8QuhwHt05rh78IwAeT2/j4Gz8ezldhPHieZenwpjxoKqCk/FhEgBeSTPGlhh2ZVsB
	iRsg=
X-Gm-Gg: AYBFou2/CPGhq4b7dIlco6TfgEsOzawbG8MowqOwLg5fQVhponwtlojFQS4Wk2DV8yO
	N8eFxpZtybcrrBUO8vN3a3WxlACj51GQE+1f6s1c5kDGnTZMLc8CDQnGedm2sKJPKlI/26pLrSM
	Itw6LFXeokA0pCbq2/xzf1euseCpKO3PFV2+49NXJITtYrGy8HMSXZrFpIqj6ETk+CXYrtpzYIf
	4jmV/KQRN/7fhI513J+NIgj17pjr9EkodLBbGm3O/O2l+cLftROtiyo04RFFjm1AVJrG5RNvq4d
	033YBKo6mO15qR+sUI5Z4YfffadY9NjCbbg+vXcmqIRxUN797Q/C686QfZ6Z3/weR0r6claoF6Z
	W9Ttf5rtbaCI0S07JGhRKwuSqVPV+gPlSU19MDkTiw22AF9kHNrj7ZGiSt+OT/GBee7S8oU90oS
	p6h305qcA1f53ztA+7VPXExKtdYAVZHe5ic0xnLPRmMnIYUINs9LD35nC4ZH/jgJVWicQ0It330
	IpaZCpNPnB9VH6UfpmWQknN2tqc37mQqZYM
X-Received: by 2002:a05:7022:1219:b0:143:1bb1:3305 with SMTP id a92af1059eb24-14b2ea054f6mr4452149c88.22.1790736670985;
        Tue, 29 Sep 2026 19:51:10 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5f5a:aa9:d06d:b4a7])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-34cf4a651desm851eec.9.2026.09.29.19.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 19:51:10 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v3 4/8] PM: runtime: Add "Section" hyperlinks
Date: Tue, 29 Sep 2026 19:49:52 -0700
Message-ID: <20260929194956.v3.4.I7666a5802ea59359afce4ff7d0b1af668e5f5292@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930025044.104824-1-briannorris@chromium.org>
References: <20260930025044.104824-1-briannorris@chromium.org>
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

(no changes since v2)

Changes in v2:
 * Rebase to put this earlier in the series

 Documentation/power/runtime_pm.rst | 48 ++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 15 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 59b634fd6829..8e93766bdf99 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -8,6 +8,8 @@ Runtime Power Management Framework for I/O Devices
 
 (C) 2014 Intel Corp., Rafael J. Wysocki <rafael.j.wysocki@intel.com>
 
+.. _Section 1:
+
 1. Introduction
 ===============
 
@@ -37,6 +39,8 @@ The runtime PM callbacks present in 'struct dev_pm_ops', the device runtime PM
 fields of 'struct dev_pm_info' and the core helper functions provided for
 runtime PM are described below.
 
+.. _Section 2:
+
 2. Device Runtime PM Callbacks
 ==============================
 
@@ -80,8 +84,8 @@ the PM core that it is safe to run the ->runtime_suspend(), ->runtime_resume()
 and ->runtime_idle() callbacks for the given device in atomic context with
 interrupts disabled.  This implies that the callback routines in question must
 not block or sleep, but it also means that the synchronous helper functions
-listed at the end of Section 4 may be used for that device within an interrupt
-handler or generally in an atomic context.
+listed at the end of `Section 4`_ may be used for that device within an
+interrupt handler or generally in an atomic context.
 
 The subsystem-level suspend callback, if present, is _entirely_ _responsible_
 for handling the suspend of the device as appropriate, which may, but need not
@@ -105,9 +109,9 @@ knows what to do to handle the device).
 
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
@@ -132,10 +136,10 @@ what to do to handle the device).
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
@@ -158,9 +162,9 @@ call to pm_runtime_autosuspend(). To prevent this (for example, if the callback
 routine has started a delayed suspend), the routine must return a non-zero
 value.  Negative error return codes are ignored by the PM core.
 
-The helper functions provided by the PM core, described in Section 4, guarantee
-that the following constraints are met with respect to runtime PM callbacks for
-one device:
+The helper functions provided by the PM core, described in `Section 4`_,
+guarantee that the following constraints are met with respect to runtime PM
+callbacks for one device:
 
 (1) The callbacks are mutually exclusive (e.g. it is forbidden to execute
     ->runtime_suspend() in parallel with ->runtime_resume() or with another
@@ -200,6 +204,8 @@ rules:
     scheduled requests to execute the other callbacks for the same device,
     except for scheduled autosuspends.
 
+.. _Section 3:
+
 3. Runtime PM Device Fields
 ===========================
 
@@ -210,6 +216,8 @@ state.
 .. kernel-doc:: include/linux/pm.h
    :identifiers: dev_pm_info
 
+.. _Section 4:
+
 4. Runtime PM Device Helper Functions
 =====================================
 
@@ -259,12 +267,14 @@ functions may also be used in interrupt context:
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
@@ -287,7 +297,7 @@ pm_runtime_set_suspended().
 If the default initial runtime PM status of the device (i.e. 'suspended')
 reflects the actual state of the device, its bus type's or its driver's
 ->probe() callback will likely need to wake it up using one of the PM core's
-helper functions described in Section 4.  In that case, pm_runtime_resume()
+helper functions described in `Section 4`_.  In that case, pm_runtime_resume()
 should be used.  Of course, for this purpose the device's runtime PM has to be
 enabled earlier by calling pm_runtime_enable().
 
@@ -338,6 +348,8 @@ value of /sys/devices/.../power/control to "auto" to allow the driver to power
 manage the device at run time, the driver may confuse it by using
 pm_runtime_forbid() this way.
 
+.. _Section 6:
+
 6. Runtime PM and System Sleep
 ==============================
 
@@ -430,6 +442,8 @@ out the following operations:
     callback and right after executing the subsystem-level .complete() callback
     for it, respectively.
 
+.. _Section 7:
+
 7. Generic subsystem callbacks
 ==============================
 
@@ -453,6 +467,8 @@ restore, and runtime resume, can achieve similar behaviour with the help of the
 DEFINE_RUNTIME_DEV_PM_OPS() macro defined in include/linux/pm_runtime.h
 (possibly setting its last argument to NULL).
 
+.. _Section 8:
+
 8. "No-Callback" Devices
 ========================
 
@@ -489,6 +505,8 @@ in subsystems/drivers, the PM core allows runtime PM callbacks to be
 unassigned. More precisely, if a callback pointer is NULL, the PM core will act
 as though there was a callback and it returned 0.
 
+.. _Section 9:
+
 9. Autosuspend, or automatically-delayed suspends
 =================================================
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

