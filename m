Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0CB4248A0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185678; cv=none; b=YxeqI4k9GkGGrESloUTn/8/6sPyouseTh+zstl4q2CwiQzWXRLuzN0fUlu5fuMgCvF2+icLH/YSjvoVC/wvqYKaTVHxMtJcXDDuc5+XPh6QPKeWja+7KOs61YxjqGKDGUvOf/JvIHhMK6599JNf/yMWu1zwIRx3ixyG0VdtBjMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185678; c=relaxed/simple;
	bh=ccdYWN4uO+fXp6GWBAaFVGwPrdESUwDVjL7T/+movy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PxUAWuHQufkOHIYpkAQ1vaYtBq/zZnn3cO9LTXcS2dqskqypUzbadWeFzhHnEcZqJKMrvp2tQKgatKaAEJN2BbivpT2cQ6wgiuzCO8fdNGNlK1a1CfRrCkKJY9+s52AuwtlI72/RhqtKxDCWAsjtOzSO4vUSPJTqZ5mAng2G4qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G6yUe4AJ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G6yUe4AJ"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34f01so783781a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790185675; x=1790790475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LcVXpdi1RtlLWtUvQyxzQWA8IBu8z+++v+33eMLlNCI=;
        b=G6yUe4AJWPgHHRcUvA5J6svDHAVjUGYfx9gl037ZKs+zo8VcH91ZgAbBYsBS42QZQD
         Qx4j87uYZXmUM+MugEsLszafaxYZCRKNSDDyQr0yd/j5L9vqd0GAKJvgxyY0eSRs2cou
         M7n4YpXQ+4MJkWUzyFzpJX7a6Gz6fnW7qbU+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185675; x=1790790475;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcVXpdi1RtlLWtUvQyxzQWA8IBu8z+++v+33eMLlNCI=;
        b=vaw5Aqin7bIsiS0DNX/USQu+Y9YbOk7CkhL8BMCvPPZc5CGrgDtnXyvB7OQkDGtQBu
         Xrnj8Ga2wXR0N0b5WOVdlD0zIbpX9lCpd7FHzjetDjWLN3flBtPXTXA/AvWc8tQOTgAm
         R+JXM+w+tgFs4wv5Zb+/rrIq0jhUg4AtStBcevsMxMGstsUoGTMpGufbTOUf/0BUz24U
         tqoh1S5rOOabjfY1j30xeCXYtIJ0n7LhYPvEMb+Ngzx/R+WGNcPajXKesGwcR/6MKkhw
         N6h+utAGQO29jtZOqa0EJpkGxqpJgiZklucdLSVxHpZpNO+Lc2fcg4jHGnBb1HOLPcZy
         Etkg==
X-Forwarded-Encrypted: i=1; AKwUvBywKGr8ZrOXC5STfK9QeurjqsPG9kWOSXHKxkFvaZYL963AWlZUsgpYDZCab87Dpko9Mtz6PxhObPUpkPc=@vger.kernel.org
X-Gm-Message-State: AFuF++nFqgcDySzmgjFEOuWKD/rwAVRcpjPxAI8XxAKnm2DJWlABEiRx
	yG9FffWvCSXpWpPmC1sE6BpO09SGuQ6BNd0NzgZnol1J8zP9uXr9TW7depED/ZXoag7aXTfWUel
	VFtw=
X-Gm-Gg: AYBFou3Gq2DCdMCAxUpzXbdF42ax3fN0m3YjF8/SPJGdqWpYitBWRcaJ4tCHJ/JQgOA
	MXBxQmia/yA2AYIlD7AdUClBSTL09vZzvEFMnkh2WwGvPqvMXj1k5//8fXhS1eBYhrC7QcpoXO4
	TzqZlM+9cA8KpMwO9qu5ZEqVnX2wGow/VLt3E1lj5lVHDbREc+tCM+FNzc1dFHynHCC+7+zm2mE
	F3cFIC0aXW9tMHU83GIFyGAbagcrdL2/BgjG6MZVGOwZ9REuiml1IGx+Y+/EWy3YC2bV0lS0bMW
	pxc8x77fI5Wwb//Wi0ZX4PgpH+vpzhezIeOkoqC2YlayjiqoHhl3/TpiQBGH0csCTCgZT8+X/8a
	Y3AAxdIJQCBb8rE2j/wjOc36nFIqCKoYsXF1I+GQPs2NgPOVC3RCjO3TRKj6bGnD80C0BUSwRZG
	n95kUjj/G5EYqhhgeEfVTxe+PFHgXnlJuIelWyRsljam8tBLNLpweLlO+Hm/b5qRaet9mlbYFrK
	tpNLoKy0nPjs04Fo8eT0AzJRMm5YE048VIc9w==
X-Received: by 2002:a17:90a:d60c:b0:39e:6c69:9b8d with SMTP id 98e67ed59e1d1-3a07e690cecmr3110112a91.50.1790185675217;
        Wed, 23 Sep 2026 10:47:55 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:642b:a4c2:7ea5:5668])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3a09733f49asm205130a91.9.2026.09.23.10.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 10:47:52 -0700 (PDT)
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
Subject: [PATCH v2 7/8] PM: runtime: Expand introduction with core concepts and structure
Date: Wed, 23 Sep 2026 10:40:31 -0700
Message-ID: <20260923104031.v2.7.I45a794e4452e3df22419acdd8f11e2b788b3413f@changeid>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260923174711.1283986-1-briannorris@chromium.org>
References: <20260923174711.1283986-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I commonly see people have difficulty learning how runtime PM works
because of the following key points [*]:

 1) there are several boolean concepts in runtime PM, with somewhat
    similar meanings:

     enabled / disabled
     active / suspended
     allowed / forbidden

 2) if these concepts are documented at all, they're scattered across
    the kerneldoc or Documentation/

 3) the runtime_pm.rst docs don't make any attempt to ease a reader into
    understanding the concepts, and instead jump straight into how it's
    implemented (queues, 'struct device' fields, helpers).

Let's try to remedy this a bit by discussing the core concepts and
highlights at the top of the introduction, and introduce a few
sub-headings, so it's easier to navigate different aspects of the
introduction.

While shuffling the intro around, I also see that the existing text
largely mirrors the layout of the following sections (2, 3, and 4), but
does so out of order. Reorder those, and point to section numbers.

[*] In addition to API complexity. I count 61 pm_*() helpers, 7 of which
    are variations of put() and 8 of which are variations of get().

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
Address review feedback around descriptions of "enabled" and "active". I
know not every point of discussion was settled, but I hope this updated
version resolves many of them and provides a better basis for further
improvement.
 * Avoid calling enabled and active "orthogonal"
 * Describe more of their inter-relationship
 * Prioritize talking about "enabled" first, since that's the first
   concept a reader should know about
 * Brief mentions of parent/child and supplier/consumer, and dependency
   handling
 * Other tweaks

 Documentation/power/runtime_pm.rst | 103 +++++++++++++++++++++++------
 1 file changed, 84 insertions(+), 19 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index e0c20132dabd..7bb64d793cdd 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -13,31 +13,96 @@ Runtime Power Management Framework for I/O Devices
 1. Introduction
 ===============
 
-Support for runtime power management (runtime PM) of I/O devices is provided
-at the power management core (PM core) level by means of:
-
-* The power management workqueue pm_wq in which bus types and device drivers can
-  put their PM-related work items.  It is strongly recommended that pm_wq be
-  used for queuing all work items related to runtime PM, because this allows
-  them to be synchronized with system-wide power transitions (suspend to RAM,
-  hibernation and resume from system sleep states).  pm_wq is declared in
-  include/linux/pm_runtime.h and defined in kernel/power/main.c.
-
-* A number of runtime PM fields in the 'power' member of 'struct device' (which
-  is of the type 'struct dev_pm_info', defined in include/linux/pm.h) that can
-  be used for synchronizing runtime PM operations with one another.
+Runtime power management (or runtime PM, sometimes shortened to RPM) allows
+individual I/O devices to transition between high and low-power states
+dynamically while the system is running, conserving power without waiting for a
+system-wide sleep state.
+
+Core Concepts
+-------------
+
+Understanding runtime PM requires distinguishing between several pairs of
+related but distinct concepts that apply to each device: **enabled** /
+**disabled**, **active** / **suspended**, and **allowed** / **forbidden**.
+
+* **Enabled**: To use runtime PM to manage a device's power states, it must
+  first be **enabled**. If RPM is never enabled for a device, it generally
+  stays inactive from an RPM perspective, and the PM core will ignore it.
+  If it is enabled, the PM core can manage the device status (see **Active**
+  below) according to its understanding of whether the device is in use, and
+  perform state transitions via the appropriate PM callbacks
+  (->runtime_suspend(), ->runtime_resume()).
+
+  Each device has an internal disable counter (``disable_depth``) which
+  determines whether runtime PM is currently enabled. Devices are initially
+  registered with runtime PM disabled (``disable_depth == 1``), though some bus
+  types (such as PCI) may enable it before driver probe.
+
+  To opt into runtime PM, a driver first ensures that the device's recorded
+  status matches its actual physical state (for example, by calling
+  pm_runtime_set_active() if the device was powered on at probe) and then calls
+  pm_runtime_enable(), decrementing ``disable_depth`` to zero (i.e.,
+  **enabled**). Runtime PM may be disabled again explicitly via
+  pm_runtime_disable() or temporarily during system sleep transitions.
+
+* **Active**: The PM core tracks a device's runtime status as either **active**
+  (the device is operational, having completed its resume callback or otherwise
+  marked active) or **suspended** (the device is idle or in a low-power state,
+  having completed its suspend callback or otherwise marked suspended), along
+  with transitional **suspending** and **resuming** phases. When runtime PM is
+  **enabled**, state transitions are primarily driven by reference counting:
+  drivers call pm_runtime_resume_and_get() (or related variants) before using
+  the hardware, to ensure the device is active; and pm_runtime_put() (or
+  related variants) once work completes. When a device's usage counter drops to
+  zero and its dependencies (children or consumers) are suspended, the PM core
+  can suspend the device immediately or after an autosuspend delay.
+
+  Besides driving the state of the device in question, a device's runtime
+  status also affects those of its dependencies — its parent (if the parent's
+  ``power.ignore_children`` is false) and its linked supplier device(s) (for
+  links with the ``DL_FLAG_PM_RUNTIME`` flag). An **active** device holds
+  reference counts on its dependencies, preventing them from suspending.
+
+* **Allowed**: System policy and user space govern whether dynamic suspension
+  is permitted through the concepts of **allowed** and **forbidden**,
+  manipulated in-kernel via pm_runtime_allow() and pm_runtime_forbid() and
+  exposed to user space through the ``/sys/devices/.../power/control``
+  attribute. When runtime PM is forbidden (``control`` set to ``on``), the PM
+  core increments the device's usage counter, forcing the device to remain
+  active regardless of whether the driver is idle. When runtime PM is allowed
+  (``control`` set to ``auto``), this reference is dropped, permitting the PM
+  core to automatically suspend the device whenever its driver and child
+  devices are no longer using it.
+
+Notably, runtime PM also has a feature called "autosuspend." This is different
+than the ``control`` notion of "auto" (i.e., "allowed"). Autosuspend is
+described in more detail in `Section 9`_.
+
+Implementation Structure
+------------------------
+
+Support for runtime power management is provided at the power management core
+(PM core) level by means of:
 
 * Three device runtime PM callbacks in 'struct dev_pm_ops' (defined in
-  include/linux/pm.h).
+  include/linux/pm.h). See `Section 2`_.
+
+* A number of runtime PM fields in the 'power' member of 'struct device' that
+  can be used for synchronizing runtime PM operations with one another. These
+  are covered in `Section 3`_.
 
 * A set of helper functions defined in drivers/base/power/runtime.c that can be
   used for carrying out runtime PM operations in such a way that the
-  synchronization between them is taken care of by the PM core.  Bus types and
-  device drivers are encouraged to use these functions.
+  synchronization between them is taken care of by the PM core. Bus types and
+  device drivers are encouraged to use these functions. They are covered in
+  `Section 4`_.
 
-The runtime PM callbacks present in 'struct dev_pm_ops', the device runtime PM
-fields of 'struct dev_pm_info' and the core helper functions provided for
-runtime PM are described below.
+* The power management workqueue pm_wq in which bus types and device drivers can
+  put their PM-related work items. It is strongly recommended that pm_wq be
+  used for queuing all work items related to runtime PM, because this allows
+  them to be synchronized with system-wide power transitions (suspend to RAM,
+  hibernation and resume from system sleep states). pm_wq is declared in
+  include/linux/pm_runtime.h and defined in kernel/power/main.c.
 
 .. _Section 2:
 
-- 
2.56.0.rc1.310.g51773c2048-goog

