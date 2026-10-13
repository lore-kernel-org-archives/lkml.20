Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9980151EDFE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906138; cv=none; b=DiBPyU7VVT4UB5bubGY+iysWfa19pQgR7MmW5UaneFJEjUUW4o7uikSXdPz91LStF8HjsXB7n9fzKi4oGNcmR/ByWWLsY1DpBt3zx14OrYz+zhnmNsD3RuHCPKBaHut+1Zo6L9Ek1wbaYkH464SUNDN5AmKk2IAgkQmhVij8Ni0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906138; c=relaxed/simple;
	bh=PLKNnY0shbYu+toZqyW6ELKsVMoYRKE9gJsmG7TyZxM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W4yTWL7VuWYV6GcD9qTeRI4TWajXA4tdMEWV8XuLYSSWvMy9tzZXnBWdlCnzss6fG3eBJYnx5nJ82ELOOrqyMn2g9RKYmUuLgpZXKQ/aXrIlFDjBBLY1Q01LBmrjzh4e03WYnoiDMnkHLs9t8PULVl7GIcjv8+N6UWa6EqcDnrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=byP2PoQM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="byP2PoQM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so439335e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791906135; x=1792510935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0o562vnHxAoJu9TkgWw6HND2WtwAaL2hGXNC5e9IZzI=;
        b=byP2PoQM4uPldPaIfpW9XxTc0IsE3u95MYFGud7gsZKiqQvP2rcb4skdzTcT5y7NJD
         QpCKg4Jrem5YzYm6KNRbDLRTXiWqyxhviHrYIb+/pp8t2L671FVvt88lEACZ/eU1uA6Z
         y9M5JBHi1JkuZYPjODVUonnSQxglT/yUjM/FitP8dOq+RQxSjYfkpE0SEGKKT08iaW2f
         7sEyQV0+6ucRjD03Ri5HGOSLQCwwZff+1LknMVPdEl6fvpe5rwnK+2jO45Ih0yw8IbXq
         gd+DC6eU3Vt6DZCxTsDc7oBYJbtpH64KqjXMwZOH/dApJ1N8G9U8N0FaCZHeN241wBQU
         BPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906135; x=1792510935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0o562vnHxAoJu9TkgWw6HND2WtwAaL2hGXNC5e9IZzI=;
        b=eJkltadIBZiNsr7lvbjPq84UL8u+un9gB7yjC8AM4ArPM26cp/HRR9Xyf6jYDkJxEO
         yZci4ZLxATNib69HvIUcXVZbz9z3Oz3TY7JlZPsMNnb4pqpctVsUY59GmylxQBUizyvZ
         I2BNrQoEhvhHbM9/HYm0jO3aJEW3EQbCL5ryUZozHjtM8/jIqPWEoyIOwUP98P0CKZzP
         cGCF/V7uo0VJ1mw+xxV2HwkyCXkNYzLGCAvQEjf15P87zPgmj1v9WP8v6tycqTt600Tx
         CuFqmjSPVIYSZYyZQl9ohHahTrnhrXpFpeu8VAJlDlGVrZdWDGPnjScY33umsLJh/MDp
         +A8A==
X-Forwarded-Encrypted: i=1; AKwUvBzYINF5G56dnb0Q/uNZDBRv+RprFzKyIF1HmpFeUajC9g9cgvojbjkGHzXM5IItGBx9qOSVfofPjXp6ePg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrUIdlumRcZDmlheELyXRmQPr54vlw/gAUtgqW6Ty++nspVjms
	A8m4VYY5thPNpKCMyVIVXP6L3b1fJ2QFwg5M/vGx76k4+d9aT7TrNJVwjVfS/5ecm7Y=
X-Gm-Gg: AYBFou0d45R4pDHBlw18W/2UPv/xs2UIsFzy05V0mTT9SxmL2wwfNySvfzyKiXpp9w3
	RBOJN3Vcd7HkN5qqD7znsGiru3y82EyIe1IqVsmJNumwGSB8ODlXPAORwKH7W2il/+JOMJkxH2P
	qKqdU5hLYwB6bN7P0UexrgkC78uUgl4oDrbwDj2WItcjMPYdo04wrFwhCnCkO04uiHtdiu+VEZo
	c1kz655OKQaBpB1kBVmUs+5+KP4fb1e7Nitx5HboqrNhmARHyXZs4O2s4+BO78dM37bGlL5IegB
	YgbFN8YEFeNYIJUlaPxkgW4gMUDK3eMYVyGgUVnLxgTniiRkMUNGPNcY+rISaEnhlU1g1NWR0Cd
	/zAz5qI+oHMIzKX0GJFlxiqFvC3aW4I73DwxtVvZhs5t12uFrFUq5Io9+qpRMaFqnifvSE6V0Ec
	d5Yok26yYPRouLObUU0ZRkASu3PD1usb9UiAI8kqIDsXO4S9w6ExDbunXSZQbCIRsV8JkN09A46
	K0bntqe0jk=
X-Received: by 2002:a05:600c:4e89:b0:4a0:22d5:908c with SMTP id 5b1f17b1804b1-4a18e4a4976mr278830225e9.12.1791906131800;
        Tue, 13 Oct 2026 08:42:11 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm464244575e9.4.2026.10.13.08.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:42:11 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Christian Brauner <brauner@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	oe-lkp@lists.linux.dev,
	lkp@intel.com,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v2] nbcon/reboot: Switch NBCON consoles into the emergency mode in emergency_restart()
Date: Tue, 13 Oct 2026 17:41:41 +0200
Message-ID: <20261013154141.94016-1-pmladek@suse.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the system is going down a normal way, the NBCON kthreads are
flushed and stopped properly via a syscore shutdown callback, see
printk_kthreads_shutdown().

One missing piece is emergency_restart() where the kthreads are not
stopped. It might be called from several non-panic code paths,
e.g. sysrq-o, kdb_reboot(), or some watchdogs.

Fix it by explicitly entering the emergency (atomic) mode and trying
to flush the consoles there.

Note that printk_trigger_flush() must be used instead of pr_flush()
because the later is not safe in an atomic context.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/all/202608061008.48a1e76e-lkp@intel.com/
Suggested-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
This is a 2nd attempt to make sure that NBCON consoles are flushed
during a shutdown.

Changes against [v1]

  + Handle only emergency_restart() where the syscore shutdown
    callbacks are not called. [John]

  + Explicitly enter nbcon emergency mode instead of relying on
    the system_state variable. [John]

  + Reworked the commit message completely.

[v1] https://lore.kernel.org/r/20261008150852.8286-1-pmladek@suse.com
---
 kernel/reboot.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index d177d89fcc33..5b9691f45f5f 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt)	"reboot: " fmt
 
 #include <linux/atomic.h>
+#include <linux/console.h>
 #include <linux/ctype.h>
 #include <linux/export.h>
 #include <linux/kexec.h>
@@ -94,6 +95,14 @@ void emergency_restart(void)
 {
 	kmsg_dump(KMSG_DUMP_EMERG);
 	system_state = SYSTEM_RESTART;
+
+	/*
+	 * NBCON kthreads won't be flushed and stopped properly in
+	 * the emergency restart. Move them to the atomic mode.
+	 */
+	nbcon_cpu_emergency_enter();
+	printk_trigger_flush();
+
 	machine_emergency_restart();
 }
 EXPORT_SYMBOL_GPL(emergency_restart);
-- 
2.56.0

