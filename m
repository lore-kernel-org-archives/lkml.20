Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA76E3D9672
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869911; cv=none; b=W4SZ4bvi2XTwUWosMunoeAamrt7d/K40ez9zwiBt12i5vWREuhiiQ0TFPnt3xwzyrubQjnZsjM2xHLFHcM7rQmRmheygEoi9fPe1bnUPiBL786qrTe0jPr6Q/C/ylJLiQjYVmppD+53dREWShifbKe2fg/WcO2031MNYlKArcTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869911; c=relaxed/simple;
	bh=DRuYS6nJzbisklEmG9VGpJMv7OLXZREiWlNAEOs4Cto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V4u7kTmDz8XqErr8HKD5AI4jJPbwQnW0ilSuqrCl5ynsvpjr8+avw6jKZf1oIq/DL8xaaXhr3Ne1T/4jE7s45oqd9sPtRE3p2L5YyuF4HuIxu9V4dqe+PLRwiklDxcJC3sSYRjIc/WetjMPGnP0Dllz2ea4CfJMPUPM5nbdzrLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oPMwj9/c; arc=none smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oPMwj9/c"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14d7cc24630so492796c88.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790869908; x=1791474708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sn8QPD06wSFfERXpwi+AgvKn9yQXziTJ5mHNKrwW3Nk=;
        b=oPMwj9/cuc1PfASFUw4gfLBobO4RJh5DAXCSXHXVC+HtFQurpL8ASvMvR7AigbT9CI
         vW0BXFJHe6F3XbUHfztrz/Ce7swiGajNMOiAONehloixBYzva3TSQqiPjjT1h7RnQXbs
         fxacdPVQ0Exe+TL7GZfLPqZoS00Tuv/+I+dWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869908; x=1791474708;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sn8QPD06wSFfERXpwi+AgvKn9yQXziTJ5mHNKrwW3Nk=;
        b=RG7e4K9wjUAzxVsmZA8U5W7H4HTTkJOdJNYHJhnJPI8YHZ5uqZv8r9nxHF/IKmqHDT
         9rnYXsfDDrSCw8DI507Vesx16UKjl+t7GNaFGhEeWfOZShK4WPgaqK2i0gc0KnKVby2F
         utSeRXhVHDxCQKJDQDCA1sDg4mG9erk/+zYfPWD8YP0B4w+Hq1nT+41kNRKuu2El2Om/
         GVIuJpeAS5+i1OyGUfdugpjjTWxNWVeL39AoMDPjcpvIWpreY/Ymo49tvYQt+ryGDvGp
         BCpGvCp7jgNFYPAIESD0H6oxeRbKik148PngBu/vUf1Rpf2jN6Jk7e44UNZj0JADtbra
         5hew==
X-Forwarded-Encrypted: i=1; AKwUvBwMDN0MRWaYhyp1NxitMHrobQ4VfsLUacnlKZMJFhseWzU4aJwU9f0lGjswiDr8y84f0gvEIPy1ss53UZY=@vger.kernel.org
X-Gm-Message-State: AFuF++kms5n4u/1sJRZlTyh40B3gB4xLRzJ5M9FotMk9c7VqcMGyVStZ
	AtKfty1eEb4YZxIUnZntdNUxErYmrEB/DxLOWLH1QjPq5zMMVNf+rNKKGGuqDnZ7aQ==
X-Gm-Gg: AYBFou1IOpsvD8FBXj3N2JzLkUoo5k5KxdiVvmWsIiapeWY8iJpnBYA8SU1oJAZq9CA
	9E+sQrGUjAwdvWI9B8/PeO8l4BSw9Y9w98fExZcl097tnqEwu8fO8L03TeBoUNZ/rmEIu+r/imY
	SAH4IVe5JgyhidZoZbUvrkwRbyaBmjXfUxsqQgBq0yzIFw1UdtxUJt6QKJIFntvXb2GQohYXEGj
	xSFTQTUxIGFcruyFQLTHqa15AHDBegdQLF7d91i5/0prdVnsqTlDcLxloAZ38PB0/zja1KFbAQe
	OxC5rh3C3HaN++9F7jfOxu+3pt1XOYKqCDE9uHFOno1yfUdcx2xgQdXZpgwSqL1MD7L5izjEk3W
	KEPLynlw5Yh74eOmNb0JFrIOp8zAtjGDnw9vQQnL5EQXrSnkECDq5ZGS9nPEjfdZCjTokV8ZFJV
	7OsZrySEfLJPfc/wubrKoHkmh+nh6Zz4mNlsd6Pets2nvEdTnKAaqNQrmtEmRoUqg17v1mpuEsu
	x3E4i1nblVIjtQdOvMpurjDRA83CAmCfu0QjIdGUG1+eAu/
X-Received: by 2002:a05:7022:7f03:b0:136:c443:80e5 with SMTP id a92af1059eb24-14d2f6ec4b9mr4842692c88.6.1790869907570;
        Thu, 01 Oct 2026 08:51:47 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:7cf1:ee59:f140:7be9])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-14f266d1156sm228201c88.6.2026.10.01.08.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:51:47 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	Len Brown <lenb@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v4 1/2] PM: runtime: Expand introduction with core concepts and structure
Date: Thu,  1 Oct 2026 08:50:08 -0700
Message-ID: <20261001085009.v4.1.I45a794e4452e3df22419acdd8f11e2b788b3413f@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20261001155118.1750028-1-briannorris@chromium.org>
References: <20261001155118.1750028-1-briannorris@chromium.org>
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

Changes in v4:
 * Significantly overhaul introduction, based on Rafael's
   feedback/rewrite
 * Drop most implementation details (struct fields) and API names from
   intro
 * Expand the "in use" and dependencies concepts in the introduction

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

 Documentation/power/runtime_pm.rst | 114 ++++++++++++++++++++++++-----
 1 file changed, 95 insertions(+), 19 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 68903d93a3e7..e4407b687f8b 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -13,31 +13,107 @@ Runtime Power Management Framework for I/O Devices
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
+Runtime power management (or runtime PM, sometimes also referred to as RPM)
+allows individual I/O devices that are not in active use to be put into
+low-power states, in which they may not be operational or even accessible, and
+go back to the fully operational state as needed.  Power can be reduced this
+way without waiting for a transition into a system-wide sleep state.
+
+Core Concepts
+-------------
+
+Runtime PM operates around a few device-level concepts — whether a device is
+**active** or **suspended**; whether runtime PM is **enabled** or **disabled**;
+whether runtime PM is **allowed** or **forbidden**; and whether a device is
+**in use**.
+
+* **Active**: Runtime PM tracks whether or not devices are in active use, which
+  generally means that they are accessible and operational, and may be depended
+  on by something (for example, other devices or user space).  This is
+  represented by the **active** meta-state.  By contrast, the **suspended**
+  meta-state represents a promise that the given device will not be accessed.
+  This covers devices in low-power states, but it also may include devices that
+  are not fully operational.  There are also two transient meta-states,
+  **suspending** and **resuming**, representing transitions between **active**
+  and **suspended** often referred to as *runtime suspend* and *runtime
+  resume*, or just *suspend* and *resume*, respectively.  Every device handled
+  by runtime PM is in one of these four meta-states at any time, and its
+  meta-state is expected to reflect its actual physical configuration (that is,
+  for instance, if the device is not accessible, it must not be **active**).
+  The term "runtime PM status" used in what follows refers to the meta-states
+  described above.
+
+* **Enabled**: In order to track the runtime PM status and carry out
+  transitions between **active** and **suspended**, runtime PM needs to be
+  **enabled** for the given device.  If it is **disabled**, runtime PM
+  generally leaves the device alone.  This means in particular that the runtime
+  PM status of a device and its actual physical configuration may get out of
+  sync after disabling runtime PM for it.  Additionally, the runtime PM status
+  of a device may need to be explicitly adjusted to reflect its current
+  physical configuration before enabling runtime PM for it (e.g., during device
+  probe).  Once runtime PM is **enabled**, it begins managing PM status —
+  performing *runtime suspend* and *runtime resume* transitions based on its
+  understanding of whether a device is in use.
+
+  As a rule, all devices are initialized with runtime PM **disabled**, though
+  some bus types (such as PCI) manage some RPM initialization automatically,
+  and therefore probe devices in an **enabled** state.  For other devices,
+  drivers must enable runtime PM on their own to opt in.
+
+* **Allowed**: Runtime PM may be **forbidden** even though it has been enabled.
+  Doing so causes the given device to transition into the **active** meta-state
+  and prevents it from being suspended.  In other words, a device with
+  forbidden runtime PM remains **active** at least until runtime PM is
+  **allowed** for it again.  This mechanism can be managed by in-kernel APIs,
+  but more importantly, it is also available to user space via the
+  ``/sys/devices/.../power/control`` sysfs attribute of the given device.
+  Namely, writing ``on`` to that attribute forbids runtime PM, and writing
+  ``auto`` allows it.  User space may modify that attribute at any time, so the
+  ability to transition a device into the **suspended** meta-state via runtime
+  PM must not be relied on for correctness.
+
+* **In use**: Runtime PM determines whether a device should be transitioned to
+  an **active** state by its understanding of whether a device is in use.  The
+  first way a device is considered **in use** is by its own usage count — a
+  reference counter driven by a variety of get()/put() APIs.  Additionally, a
+  device may be considered **in use** by having active dependents — either
+  child devices, or device-linked consumers.  When a device is no longer in
+  use, runtime PM may choose to transition it to the **suspended** state.
+
+  Thus, when a device moves from **suspended** to **active**, it may also cause
+  its dependencies to resume, unless they are **active** already.  Conversely,
+  suspending a device may also cause its otherwise-unused dependencies to
+  suspend.
+
+* **Autosuspend**: Runtime PM also supports a feature called "autosuspend."
+  This is different than the ``control`` notion of "auto" (i.e., **allowed**).
+  Autosuspend is covered in `Section 9`_.
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
2.56.0.rc1.315.gc6ed9934b7-goog

