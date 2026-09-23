Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231514218B6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185661; cv=none; b=EBCQjqb1wlvzo6uz9BZ1emK2ebVR3lH+H0fyeO98n4481gSIcbsvhQncpXluv+9JEvKFw9N9M6H/cZU6aMp9FpYJEIpR7W0MmtRWCov7sSXz59vLR/rjntpTbqXyFz4S8MhoL8EbeoXj13oU30JQ15PsqUrqCMJko6gprxyHFsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185661; c=relaxed/simple;
	bh=HNhAwhGiJI8XpQjGibl8SR8njJRmYfryO09H5BYfZ0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gyu+azwUKkBWC+6gIA97lcrntM+OxU+5mGLSkjI14cpBMOocIAH5QLgi6+tR22svoberxkIqiPzdh8WUZdOR20D+Ew7edoCpYO9xfUjVWcOBO54cRtRaK5vPa6AuEdXAlh/+4PBctbkHrPrljN8v3P+1x5MwvkoicLKxiR1slOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P0wM+/QW; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P0wM+/QW"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fdc579daso8405745ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790185658; x=1790790458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0FUTmKiKSraH2afuGbds8iMVikboWrVQOvL7iyG9Nc=;
        b=P0wM+/QWSeSzVyi+YQHCnDGANsNcwPJJsHTgEi4hdmql28QdXn9Kjr4zBZMvTkX8BE
         u28GTzBIkB9DHaRss7CGqt7LiKctj4yRuSdIiwaFMnKd4+Uis4AxvembmsniVYNlfJvm
         lOUPV676Yv/+nRPthUxAObnMIMjhTqfnk3qpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185658; x=1790790458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0FUTmKiKSraH2afuGbds8iMVikboWrVQOvL7iyG9Nc=;
        b=iHh50iG1+W+8xuBctw1ENxdGZsU6weU1mwK1wpyOtqxMBYNwFcNwVTueBQw6gtWj0z
         1EKFN4/Nc5Ta5+GyLIDZ7sYsv+S0or8/OgJQrMkv50MjuzIW5zSSkOn4Hg1r8ozC+9y/
         3wlg+0Jqj4Xjumxn7GvS29Wnhg6BsPi2QOVlrdhRVbiOEdhkPl0rqt+FojDje9/mq2Ca
         CjzE3rbjssm3+CGC1pjtPPR79gjGSA3Ym3kLeXxIQqrwuH1LlP2sIHZi8dpRXfR7g1ai
         Kcm0w59LynevP746Q76o4oBHUMcv3GMW1YEzeD9K23Xpij1ySouc/9fFK3zK2tEBCgKP
         FbIQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2fhbRFFRJqrRpp+K2U+D/G7Wkz1IyK7Nz5vhNsHDG25D8WVbXJeQ1d4/+w8+sS1dAZvWJ0KH5yBmGwY4=@vger.kernel.org
X-Gm-Message-State: AFuF++mCnxe1Wu6WEr4OPC369bgdtz8/tKA0WdxvZAbsQNhaNEmjkXu4
	z9q4I+OoaVHVHYWht3XzArQremfUnAoBd272SRtq3FI9XpyEFPBTI71SLM9x4QVs6w==
X-Gm-Gg: AYBFou1R2BelTLZ0vlXoiKV5G4SHMtkwgVvKEp2V1farmLtqK1cHwQ13zzQ0LLTK8So
	IpgKpaISdP2umj4HaIKQPpCd1+tkR+HT+6bsMc65zxzVWps+abVOyUUHNVFOf7Myk2d9x+RZURl
	KeFh+9I2sEwgvhz2dlbqC6FaCoZIQAC0d+hubYkARI0wnBlAK4b2NeUS2wdLwUXDaM7BzCb5gJt
	jEC9vDTqKRe7KkaPLikobUyTAuvbb7He+JMl55vhjdnb/60mIjMzOWBqjt5wibzDbaI9iP4s6Nz
	7HFy9S+nENwvbDNexX3rkKj1Kvw0VHitg1tvyvSnP9XpR8EXthRSYcQXd4KkMN16R2w5wr05fV8
	ZguMkVRKD/DdrSfwMSw+nmQbOIHvfyFuZhIRxsbiHAiLIZEan2ezfnqAiuYMOAUd7vsrTLmnO3M
	D92TSPKjJEAXw6pvEpuWXXWgFNqNsof9E9G0BhW0ZwBolr9oEquv7WPEpD6COyPzirabUb4rwNH
	MbUQtzheiZjV883w4VZvfQ/K2MrCpYjEB/6+84NIcI4rTSo
X-Received: by 2002:a17:902:ec81:b0:2dd:c100:3140 with SMTP id d9443c01a7336-2df69e015c9mr32107685ad.60.1790185658348;
        Wed, 23 Sep 2026 10:47:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:642b:a4c2:7ea5:5668])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2df6a60cc52sm15320815ad.83.2026.09.23.10.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 10:47:37 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 3/8] PM: runtime: Misc improvements to runtime_pm.rst
Date: Wed, 23 Sep 2026 10:40:27 -0700
Message-ID: <20260923104031.v2.3.I383681b22c12d7caee976cb91aa90d1a94d4a591@changeid>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260923174711.1283986-1-briannorris@chromium.org>
References: <20260923174711.1283986-1-briannorris@chromium.org>
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

(no changes since v1)

 Documentation/power/runtime_pm.rst | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 39fdeeda7a1e..352cdaf0650d 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -238,6 +238,9 @@ It is safe to execute the following helper functions from interrupt context:
 - pm_runtime_set_active()
 - pm_runtime_set_suspended()
 - pm_runtime_suspended()
+- pm_runtime_active()
+- pm_runtime_status_suspended()
+- pm_runtime_enabled()
 - pm_runtime_mark_last_busy()
 - pm_runtime_autosuspend_expiration()
 
@@ -249,6 +252,7 @@ functions may also be used in interrupt context:
 - pm_runtime_autosuspend()
 - pm_runtime_resume()
 - pm_runtime_get_sync()
+- pm_runtime_resume_and_get()
 - pm_runtime_put_sync()
 - pm_runtime_put_sync_suspend()
 - pm_runtime_put_sync_autosuspend()
@@ -258,7 +262,7 @@ functions may also be used in interrupt context:
 
 Initially, the runtime PM is disabled for all devices, which means that the
 majority of the runtime PM helper functions described in Section 4 will return
--EAGAIN until pm_runtime_enable() is called for the device.
+-EACCES until pm_runtime_enable() is called for the device.
 
 In addition to that, the initial runtime PM status of all devices is
 'suspended', but it need not reflect the actual physical state of the device.
@@ -287,7 +291,7 @@ enabled earlier by calling pm_runtime_enable().
 
 Note, if the device may execute pm_runtime calls during the probe (such as
 if it is registered with a subsystem that may call back in) then the
-pm_runtime_get_sync() call paired with a pm_runtime_put() call will be
+pm_runtime_resume_and_get() call paired with a pm_runtime_put() call will be
 appropriate to ensure that the device is not put back to sleep during the
 probe. This can happen with systems such as the network device layer.
 
@@ -315,7 +319,10 @@ removal of their drivers.
 
 Drivers in ->remove() callback should undo the runtime PM changes done
 in ->probe(). Usually this means calling pm_runtime_disable(),
-pm_runtime_dont_use_autosuspend() etc.
+pm_runtime_dont_use_autosuspend() etc. Alternatively, drivers can use
+devm_pm_runtime_enable() during probe, which automatically takes care of
+calling pm_runtime_disable() and pm_runtime_dont_use_autosuspend() upon driver
+detachment.
 
 The user space can effectively disallow the driver of the device to power manage
 it at run time by changing the value of its /sys/devices/.../power/control
@@ -426,7 +433,7 @@ out the following operations:
 
 Subsystems may wish to conserve code space by using the set of generic power
 management callbacks provided by the PM core, defined in
-driver/base/power/generic_ops.c:
+drivers/base/power/generic_ops.c:
 
 .. kernel-doc:: drivers/base/power/generic_ops.c
    :export:
@@ -441,8 +448,8 @@ subsystem-level dev_pm_ops structure.
 Device drivers that wish to use the same function as a system suspend, freeze,
 poweroff and runtime suspend callback, and similarly for system resume, thaw,
 restore, and runtime resume, can achieve similar behaviour with the help of the
-DEFINE_RUNTIME_DEV_PM_OPS() defined in include/linux/pm_runtime.h (possibly setting its
-last argument to NULL).
+DEFINE_RUNTIME_DEV_PM_OPS() macro defined in include/linux/pm_runtime.h
+(possibly setting its last argument to NULL).
 
 8. "No-Callback" Devices
 ========================
@@ -505,7 +512,7 @@ registration the length should be controlled by user space, using the
 
 In order to use autosuspend, subsystems or drivers must call
 pm_runtime_use_autosuspend() (preferably before registering the device), and
-thereafter they should use the various `*_autosuspend()` helper functions
+thereafter they should use the various \*_autosuspend() helper functions
 instead of the non-autosuspend counterparts::
 
 	Instead of: pm_runtime_suspend    use: pm_runtime_autosuspend;
@@ -515,7 +522,7 @@ instead of the non-autosuspend counterparts::
 
 Drivers may also continue to use the non-autosuspend helper functions; they
 will behave normally, which means sometimes taking the autosuspend delay into
-account (see pm_runtime_idle). The autosuspend variants of the functions also
+account (see pm_runtime_idle()). The autosuspend variants of the functions also
 call pm_runtime_mark_last_busy().
 
 Under some circumstances a driver or subsystem may want to prevent a device
@@ -558,7 +565,7 @@ Here is a schematic pseudo-code example::
 
 	int foo_runtime_suspend(struct device *dev)
 	{
-		struct foo_priv foo = container_of(dev, ...);
+		struct foo_priv *foo = container_of(dev, ...);
 		int ret = 0;
 
 		lock(&foo->private_lock);
@@ -574,7 +581,7 @@ Here is a schematic pseudo-code example::
 
 	int foo_runtime_resume(struct device *dev)
 	{
-		struct foo_priv foo = container_of(dev, ...);
+		struct foo_priv *foo = container_of(dev, ...);
 
 		lock(&foo->private_lock);
 		/* ... resume the device ... */
-- 
2.56.0.rc1.310.g51773c2048-goog

