Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269454E9C00
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 15:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791560374; cv=none; b=HVTd/UrCRInFXfLQ74W87DBNTGPyjj2YbfMfqomG6LSoi3KRCzb1WtbkARRbK7m89KQIFLAozpoCuN3WijaAL0JhbYJHAGHjNQFg7GPryNDhff/5cRCxWFkwpI7su5jsCglA7WqVMtY26fPGwPq/aDjpNBK47fLTZ+SQ4HZux/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791560374; c=relaxed/simple;
	bh=GbihQDT60TkSUyG8sRpe6wSrJ+mv6j+gTgXLREuoT34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpwzLYf2J07sxJo0cACObqxl3pBNdJK4cJvM9bDcFN2qXnysmIL06ihuvX+HfRDiD6vYUqi7H2120w0jBbe5UN4tehE59dNAXoQJf/eu6INgbBG4WyJwBXy/88+q+W+ruBxKPJV13ljMytduJY01x9xfLJywxXTaHRLbiOu1+FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFOlrWbV; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFOlrWbV"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso4515372a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791560370; x=1792165170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oc43EGm7NUZeK/eRaBYRasWqtzt/BRe/LMfh582Cs/s=;
        b=gFOlrWbVchPXW7Fv1lrAWM7LwrJzN6r4LFXrTby/IRpy2rTuTYO4/E0iVyV8m92wWV
         fzzFTFSI2cCRmzkblMtob7vTQLRW3rRuS25RAPWXFoa5mqRD97SGCNV0WP4THCJMLvhM
         aMxRlvGLV2W2JuwHVhsHJcbyw978meTN4JbPTjj/u/E9RsP5JkOKdBu3zJ/2tf4mer3v
         OFiZdGBUwjgTvyC8K+YAlBdOJ6+6W1QaMJOC8bL4ue1eU+0gsQfwwIrtUjCdLQ503jPH
         V3IlyjfKfwtLsavmygJA43G4vrXhYr6QNzEFgVOqROopUemQPCxhY5pxFsg6K85XqDn3
         qvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791560370; x=1792165170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oc43EGm7NUZeK/eRaBYRasWqtzt/BRe/LMfh582Cs/s=;
        b=I0HgjevUEAzzQ91ctpOFeMq/M97IqklcTHJ2BB2oW4tyVbKjMHzTeD2ALgpV/meHN9
         oI37YlXGkibJtVoHk1i7eRQpRC7ykmxmDOWqYRRjki0c/zD8Eem7KNgduUj5XAgaaLJB
         UIhlNPKliuFF6X4J4woetRtLYpBhw4QiO+dPQo2h7xi0izQcPKAxqJ7F/s/OaSVmHfhB
         wbKRvIuwpwToDe5wE9Ol6XHRProhSd12ScSpNHUP2Liamdggj9c/msMXhiLCRGqgvt4N
         Ji/PjKaSA2vlObNhGZXBY4cwd+lPEmUoEHzIoXAl+HVhEAUXw/tzVWiXtXBSGhlmEh4M
         01Lw==
X-Forwarded-Encrypted: i=1; AKwUvBxmVLaflA3V7163qTAcls9/LecI8vi7pVOXxl7YMyuNODTd/lHE69SNTwm35oH/afwtZgNgAa1WkWjje8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnSM2py/Uf5tKByjwK8XYEysaHJLNZvRPgr+u+0D7b9tyQMVr+
	oC8iY7ATdO4gSbQQfgGRT3XKCJZ6XQIgiaoDszYODplbcdX70DZGgAwq
X-Gm-Gg: AYBFou0c6OocIsktysWHGK/sNzAuDfbOsCm5m1DZP2DfhEwNdGU+ZHvDhsSaV5CnUrj
	dtsnMbShDgDve9YxkCtk2DMb4kyew2HHUzXkQt/ampVtfJfEO/6j4CBTZuJ1DMsbzLs0s2MMIaB
	iSDCIsMLQEry9wDbDLsnzJWdSsqn03JZNco2DlsHyTGRlpAm6K0lt+em3h4LVgguZUYRN4QXVtS
	9jCGaWJ9txQ8cBrfi1oL0rgn9XiK2QSGgjjc/LY3GqWGIoaToiDATgNrQDg3GFT1de3Avb1C7H6
	ktjefdW6z2sADjB8O04VcSsWfylGdlm869RAeSdtxiZ3ye3vkRxAq8l7saUfHxQU0D8CGfXFElt
	O6WpjW58JS56vM05H4kYRS7pahqb1VJ6GC+Q6CjT7AxQtAE9HBn2TfoUjL4ZdTXNivGlTdDAIEx
	edlyvLichp7SYC9g9mAvAdImf6HmKjLrNiXKh+EBQBcx3dzv8TfkSGzsdSm64NaTsYnAen3JA1P
	TsjdlA=
X-Received: by 2002:a17:902:d50a:b0:2e3:1bb4:610d with SMTP id d9443c01a7336-2e842f31562mr21457435ad.50.1791560370363;
        Fri, 09 Oct 2026 08:39:30 -0700 (PDT)
Received: from mincom1 ([14.67.155.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421ae999sm11847705ad.31.2026.10.09.08.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 08:39:29 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] docs: hwmon: Document the uhwmon userspace interface
Date: Sat, 10 Oct 2026 00:38:44 +0900
Message-ID: <c02aeee5b7e7a5d159d4df5baabe925e16814e94.1791559095.git.hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1791531025.git.hurryman2212@gmail.com>
References: <cover.1791531025.git.hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the uhwmon UAPI for developers implementing userspace hwmon
drivers. Cover device registration, request handling, notifications
and device lifetime.

Assisted-by: Codex:gpt-6-astra
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 Documentation/hwmon/index.rst  |   1 +
 Documentation/hwmon/uhwmon.rst | 141 +++++++++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)
 create mode 100644 Documentation/hwmon/uhwmon.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 9955a525436a..88c6388e7c5c 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -12,6 +12,7 @@ Hardware Monitoring
    submitting-patches
    sysfs-interface
    userspace-tools
+   uhwmon
 
 Hardware Monitoring Kernel Drivers
 ==================================
diff --git a/Documentation/hwmon/uhwmon.rst b/Documentation/hwmon/uhwmon.rst
new file mode 100644
index 000000000000..155f1a965d16
--- /dev/null
+++ b/Documentation/hwmon/uhwmon.rst
@@ -0,0 +1,141 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Userspace hardware monitoring
+=============================
+
+Copyright (C) 2026 Jihong Min <hurryman2212@gmail.com>
+
+``uhwmon`` connects userspace drivers to ``hwmon_ops`` through the control
+device ``/dev/uhwmon``. The hwmon core creates and formats sysfs attributes.
+The daemon supplies values in the units defined by :doc:`sysfs-interface`.
+
+Enable ``CONFIG_HWMON`` and ``CONFIG_SENSORS_UHWMON`` and load ``uhwmon``.
+Include ``<linux/uhwmon.h>``.
+
+Register a device
+-----------------
+
+Open ``/dev/uhwmon`` with ``O_RDWR`` for each device. Zero-initialize all
+UAPI structures.
+
+Call ``UHWMON_CREATE`` with the NUL-terminated chip name, attribute array and
+its count in ``struct uhwmon_create``. Each ``struct uhwmon_attribute`` contains:
+
+* ``type``, ``attr``: hwmon enum IDs, not ``HWMON_*`` bitmasks.
+* ``channel``: zero-based index; zero for chip attributes.
+* ``mode``: nonzero permissions using only bits from 0644.
+* ``flags``: zero, or ``UHWMON_ATTR_CONSTANT`` for read-only constants.
+* ``value``: a constant number, otherwise zero.
+* ``text``: pointer to a constant label, otherwise zero.
+* ``size``: NUL-inclusive label capacity from 1 to ``PAGE_SIZE``; zero
+  for numbers.
+
+Labels are read-only, NUL-terminated and omit the trailing newline.
+
+Handle requests
+---------------
+
+Read a ``struct uhwmon_request`` and write a ``struct uhwmon_reply`` on the
+owning file. Request and reply headers are 24 bytes. Only successful label
+replies append ``size`` bytes of text. Buffers smaller than the message are
+rejected with ``EINVAL``.
+
+``struct uhwmon_request``:
+
+* ``id``: request identifier; copy it into the reply.
+* ``attr``: index in the registered attribute array.
+* ``op``: ``UHWMON_READ`` or ``UHWMON_WRITE``.
+* ``value``: number to apply for a write; zero for a read.
+
+``struct uhwmon_reply``:
+
+* ``id``: the request's identifier.
+* ``status``: zero on success or a negative errno; use ``-ENODATA`` for
+  unavailable or stale readings. Return ``-EINTR`` only before applying a write.
+* ``reserved``: zero.
+* ``value``: successful numeric read result; ignored otherwise.
+* ``text``: NUL-terminated result of a successful label read; absent otherwise.
+
+Numbers use signed 64-bit fields and must fit the kernel's ``long``,
+except for energy64 reads.
+Discard replies rejected with ``ESTALE`` (canceled request).
+
+This example registers ``temp1_input`` and ``temp1_enable`` and reports
+42000 millidegrees Celsius while enabled:
+
+.. code-block:: c
+
+	struct uhwmon_attribute attrs[] = {
+		{ .type = hwmon_temp, .attr = hwmon_temp_input, .mode = 0444 },
+		{ .type = hwmon_temp, .attr = hwmon_temp_enable, .mode = 0644 },
+	};
+	struct uhwmon_create create = {
+		.name = (uintptr_t)"example",
+		.attrs = (uintptr_t)attrs,
+		.num_attrs = 2,
+	};
+	struct uhwmon_request req;
+	struct uhwmon_reply reply = {};
+	int enabled = 1;
+
+	if (ioctl(fd, UHWMON_CREATE, &create) < 0)
+		return;
+
+	for (;;) {
+		if (read(fd, &req, sizeof(req)) < 0) {
+			if (errno == EINTR)
+				continue;
+			break;
+		}
+		reply.id = req.id;
+		reply.status = -EINVAL;
+		if (req.attr == 0 && req.op == UHWMON_READ) {
+			reply.value = 42000;
+			reply.status = enabled ? 0 : -ENODATA;
+		} else if (req.attr == 1 && req.op == UHWMON_READ) {
+			reply.value = enabled;
+			reply.status = 0;
+		} else if (req.attr == 1 && req.op == UHWMON_WRITE &&
+			   (req.value == 0 || req.value == 1)) {
+			enabled = req.value;
+			reply.status = 0;
+		}
+		if (write(fd, &reply, sizeof(reply)) < 0 && errno != ESTALE)
+			break; // Fatal error.
+	}
+
+Disconnect and reconnect
+------------------------
+
+Sysfs requests can be interrupted or restarted before delivery to the daemon.
+After delivery, they wait for a reply or disconnection; only fatal signals
+can interrupt this wait. Completed replies take precedence over signals.
+
+Releasing the last control file reference disconnects the daemon: dynamic
+reads return ``ENODATA``, writes return ``ENODEV``, and constants remain readable.
+Closing an fd does not cancel I/O in another thread; duplicated fds retain
+ownership. Interrupt blocked control reads or use ``UHWMON_DESTROY``.
+
+The device persists after disconnection. To reconnect, open a new control fd
+and register the same name and attribute array, including constant values.
+
+``UHWMON_DESTROY`` removes the device. Close and reopen the control file
+before registering another device.
+
+Notify changes
+--------------
+
+The kernel cannot detect changes to values held by the daemon. After changing
+a value, call ``UHWMON_NOTIFY`` with its 32-bit attribute index. This wakes
+sysfs pollers waiting for ``POLLPRI`` and sends a ``KOBJ_CHANGE`` uevent with
+``NAME=<attribute>``. Applications read the attribute again from offset 0 to
+get the new value. The notification carries no value and does not replace a
+read reply.
+
+For example, after changing ``enabled``, notify listeners of ``temp1_enable``:
+
+.. code-block:: c
+
+	__u32 index = 1; /* attrs[1]: temp1_enable */
+	if (ioctl(fd, UHWMON_NOTIFY, &index) < 0)
+		return;
