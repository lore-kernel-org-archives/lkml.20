Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58BC4EE85C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 21:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556847; cv=none; b=r2u5HFJBN4nR8ZaZ5U/UW/5aW2hWMhTtjVfzhjQfj/5IJDvjNp6tGO83BZDkUVPJRvKWWiMYX0kftcRuXcf+zcfFGHFSz48WS6VBO02OpZbtBNBjHhPf8WCblnXmdywlbnJunHS9QslNPavlde3TjfkQOyscaRUtZJpN00nvaU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556847; c=relaxed/simple;
	bh=an4306lbd9gYljGt3gjoP2fU6r9hl/qCRg/3E2XP8aM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYEyZ9RYt2Dw6BCZWCfvbuYbGM/18aWIFZ2/J6rn5yamEdNyTfAcmLBSY99U2qIroVG0FrAskmfuHdpC/H0YXVRUKd5f2sCjuAd3UsyRKkv555gCAxbI9z+A+1S+aWOYLkmx6lJhnGoxF8JPD2sjdSVjgQSvMEhh9Lq7gSKULBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lEX7ZYam; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lEX7ZYam"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1465209a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 14:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788556845; x=1789161645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwLinra99aXycX9ldNYRzirNUG5NNrsETkODdowC3mE=;
        b=lEX7ZYam2EsQ3V+c8EAQCGlAj5aq9Dacm9zIYyPSv/yIKIeKMYUTcqx42AQMurbU3t
         odb7F26Cxjx50EEyinwFeuQr30SslbCd49p6wkrS5lOTz25GpMhJzKLgMk3isgtdU5BJ
         GBxJkMDwPTXjqilV6HXb0t0xe2ef7IcPGsmYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788556845; x=1789161645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bwLinra99aXycX9ldNYRzirNUG5NNrsETkODdowC3mE=;
        b=CsV9IQatdZLpXvJpZc+eLgOt3Dr8NYGPgHrtvsruCfzywPBHQZpy4lnoq57asglCdM
         n7aN7DLo1a84hz7xjlWLEK2HwSVxWPEe2Dg4pc52JpZ+xt3iOXufPQzhIacnx7aAaKCz
         He3JbfauWc9/GJpocAdcFJ3TfPd3EPPCiHsIvDeBSr0h8YRZCytm3qsSBMPmpHd1g0y8
         KxC9Y+ecBx2VJF/RJacymSA3g8qYqZUOMptYjAFju9x34AyxtbRo6urAyoAjSFCkQvRQ
         I7+v0dIYPWVsbdJDb4CSOF8goUX/XWLJ1ToKWET0N68UKJJNypT2nE/ay7+O8B2kDIWL
         22Wg==
X-Gm-Message-State: AFuF++ndCAtM7GaEeqY/h3j0oSHxInVhDcnQGQMSl2CD+72fVB8I91IA
	JsydtqXVOMej68RM9ZTgEQcJFDbhzhsEnbaitVhNSg3bKdS3Z7ooutAKCnUwuhjdFA==
X-Gm-Gg: AYBFou3RW15eVg+AEIq77ntOA04abSI/i0KOVLedmVT3I438fDCCzp2zlTqAgYLp8D5
	T5ansMONf8H7tJhYsynAnNef4X4yyysMnHp/MEfOus4qBlqws0FZF6enYLrwXLcnpTeCa84EWhR
	8tRgEu9ni+v8YBiBr4QpOu5X+dSqVl989G7Bg+H+Av/kjL9HQL6CCfgMC7i7uq1x69Rx/qZgYpH
	XsNpbXrZSB7mURpf7BaSCmpzlfnlTnwcFRRnmtUxL7KAbwYg8igTtZNGYAbyPSfBxf63pYpw1+d
	I6itrHz3OI5FXpiooHvGaW1/aFtF5Ost+wLHQ+Kzc7VdfeLJEozKWAKLgdeVCcLPRGpIQ6gU2VX
	K2gNCZm4v8e+IAQKkoKiSAXdyjS/j3dfGHia+Z9g8SnaWsDsFRKNiHcoWQ9c48NLxoC+93ztzKJ
	8HkOA6OP+HN+7y4lTC6tX/zVbwN1Gke0mq6fdG1AOfi8/Py4GJaodXaSlF8tFT9wOtR5NzBecUE
	syhk5N7a7a6mbwFjlFisBg7lQteZF1iKTO/ww==
X-Received: by 2002:a17:90b:280b:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39b261cfebdmr11555869a91.14.1788556841868;
        Fri, 04 Sep 2026 14:20:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5597:62ab:c321:4a7f])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3339bdf26c5sm8398706eec.27.2026.09.04.14.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 14:20:41 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Len Brown <lenb@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-pm@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH 09/11] PM: runtime: Misc improvements to runtime_pm.rst
Date: Fri,  4 Sep 2026 14:12:14 -0700
Message-ID: <20260904141215.9.I383681b22c12d7caee976cb91aa90d1a94d4a591@changeid>
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

There are several small errors and omissions, as well as new updates
(pm_runtime_resume_and_get(), devm_pm_runtime_enable()) we should
incorporate.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 Documentation/power/runtime_pm.rst | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 571a2f29851b..8e4e03b7dbfe 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -306,6 +306,9 @@ It is safe to execute the following helper functions from interrupt context:
 - pm_runtime_set_active()
 - pm_runtime_set_suspended()
 - pm_runtime_suspended()
+- pm_runtime_active()
+- pm_runtime_status_suspended()
+- pm_runtime_enabled()
 - pm_runtime_mark_last_busy()
 - pm_runtime_autosuspend_expiration()
 
@@ -317,6 +320,7 @@ functions may also be used in interrupt context:
 - pm_runtime_autosuspend()
 - pm_runtime_resume()
 - pm_runtime_get_sync()
+- pm_runtime_resume_and_get()
 - pm_runtime_put_sync()
 - pm_runtime_put_sync_suspend()
 - pm_runtime_put_sync_autosuspend()
@@ -326,7 +330,7 @@ functions may also be used in interrupt context:
 
 Initially, the runtime PM is disabled for all devices, which means that the
 majority of the runtime PM helper functions described in Section 4 will return
--EAGAIN until pm_runtime_enable() is called for the device.
+-EACCES until pm_runtime_enable() is called for the device.
 
 In addition to that, the initial runtime PM status of all devices is
 'suspended', but it need not reflect the actual physical state of the device.
@@ -355,7 +359,7 @@ enabled earlier by calling pm_runtime_enable().
 
 Note, if the device may execute pm_runtime calls during the probe (such as
 if it is registered with a subsystem that may call back in) then the
-pm_runtime_get_sync() call paired with a pm_runtime_put() call will be
+pm_runtime_resume_and_get() call paired with a pm_runtime_put() call will be
 appropriate to ensure that the device is not put back to sleep during the
 probe. This can happen with systems such as the network device layer.
 
@@ -383,7 +387,10 @@ removal of their drivers.
 
 Drivers in ->remove() callback should undo the runtime PM changes done
 in ->probe(). Usually this means calling pm_runtime_disable(),
-pm_runtime_dont_use_autosuspend() etc.
+pm_runtime_dont_use_autosuspend() etc. Alternatively, drivers can use
+devm_pm_runtime_enable() during probe, which automatically takes care of
+calling pm_runtime_disable() and pm_runtime_dont_use_autosuspend() upon driver
+detachment.
 
 The user space can effectively disallow the driver of the device to power manage
 it at run time by changing the value of its /sys/devices/.../power/control
@@ -494,7 +501,7 @@ out the following operations:
 
 Subsystems may wish to conserve code space by using the set of generic power
 management callbacks provided by the PM core, defined in
-driver/base/power/generic_ops.c:
+drivers/base/power/generic_ops.c:
 
 .. kernel-doc:: drivers/base/power/generic_ops.c
    :export:
@@ -509,8 +516,8 @@ subsystem-level dev_pm_ops structure.
 Device drivers that wish to use the same function as a system suspend, freeze,
 poweroff and runtime suspend callback, and similarly for system resume, thaw,
 restore, and runtime resume, can achieve similar behaviour with the help of the
-DEFINE_RUNTIME_DEV_PM_OPS() defined in include/linux/pm_runtime.h (possibly setting its
-last argument to NULL).
+DEFINE_RUNTIME_DEV_PM_OPS() macro defined in include/linux/pm_runtime.h
+(possibly setting its last argument to NULL).
 
 8. "No-Callback" Devices
 ========================
@@ -573,7 +580,7 @@ registration the length should be controlled by user space, using the
 
 In order to use autosuspend, subsystems or drivers must call
 pm_runtime_use_autosuspend() (preferably before registering the device), and
-thereafter they should use the various `*_autosuspend()` helper functions
+thereafter they should use the various \*_autosuspend() helper functions
 instead of the non-autosuspend counterparts::
 
 	Instead of: pm_runtime_suspend    use: pm_runtime_autosuspend;
@@ -583,7 +590,7 @@ instead of the non-autosuspend counterparts::
 
 Drivers may also continue to use the non-autosuspend helper functions; they
 will behave normally, which means sometimes taking the autosuspend delay into
-account (see pm_runtime_idle). The autosuspend variants of the functions also
+account (see pm_runtime_idle()). The autosuspend variants of the functions also
 call pm_runtime_mark_last_busy().
 
 Under some circumstances a driver or subsystem may want to prevent a device
@@ -626,7 +633,7 @@ Here is a schematic pseudo-code example::
 
 	int foo_runtime_suspend(struct device *dev)
 	{
-		struct foo_priv foo = container_of(dev, ...);
+		struct foo_priv *foo = container_of(dev, ...);
 		int ret = 0;
 
 		lock(&foo->private_lock);
@@ -642,7 +649,7 @@ Here is a schematic pseudo-code example::
 
 	int foo_runtime_resume(struct device *dev)
 	{
-		struct foo_priv foo = container_of(dev, ...);
+		struct foo_priv *foo = container_of(dev, ...);
 
 		lock(&foo->private_lock);
 		/* ... resume the device ... */
-- 
2.55.0.979.g7e5102b832-goog

