Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224669;
	b=jIi1r9pJXI2FWs/4CAHygrODHu3ND5ZMOr8e/QC/l0f+ZKsO20ZadVC/Fg6vJFEoTXEY
	 D+lS5A8VZZYO6dy+HJpGam2/quM3yrWzZF+N2YB9Ge+UFzpdXfOIm199BnuQ9fBkF7R81
	 OLkMWznpIAykzpd3krHbA3DV373Wsfu7JnriV0Ahg7uHRRAVIFt2xkVGQEr+IV2bnpSrn
	 EFwu+qxrE4ArVrbumBpoLH6FeDeWJyobNXSUoCl8O/EGikMXPNtogXlTJJ3Yl82KLPMSr
	 bHbCgDBxio6SdPmjGTGxepQB7hY0TYDUcWsCBUJo6RFissj3nOu2spqIKzK9KERtnSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TUIOjmzBlQxfdwjHftiwHU+LF7dk3gDF7kPQW6Gje5E=;
	b=q1GBY8De0r26LzIa/dimexAzktjoC9q0WaqD1Bke6RaC/9Sd2d3gjleH67p8Qc6bEiTI
	 FHflZl+OWgKJFufY82DdCP70BWYWByeXmHYxSiBV3FV9MwM+KvqhUrAMmM6ntf3i+EBr9
	 4HheYM5nu7OIB3POE9OJdMeFxFrxls3SSupXrIyNNlKO63K3f6706ysRBUR33hD7DG7fL
	 T5lyXYb7TyvRB3PYggnNnOhzvfkcgQeAgrkInINV309ix3QpwKfky9230PSJR3tft+xPP
	 U37uZVtZiUjyrRVKS6fbdn02UtHnOD6e8SlEXNCcvvY9X/hasVEanctCrwUANY8vx6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xqEuKWhE;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442DC606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 442DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xqEuKWhE
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b58cb69927so1263227a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794224668; x=1794829468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUIOjmzBlQxfdwjHftiwHU+LF7dk3gDF7kPQW6Gje5E=;
        b=xqEuKWhEubSRYm9cPGcvDBUNSMiBaxMCVF2Co9vgHEEsJijOwKyFhf0BNcawkj6ZYA
         U1saTLAnUDDpKqXyVvYsd4gN+hZx1lyqXguoiwQiQbdk2Fr6cTrz8PfMTD/lVpn/kKi3
         u8IgYVnDGKwZGmAH8rLo+KSRKJC3U6QGHBX8aAtOpWlPKxTndnbwYINHhTkZVXeVcNXa
         jAakjW49pScqXtHdisUszHSRlsnoEOSKgDg0S5OvVE/FF/dDJUw6UiTlA11RPdibzwSP
         ZWxUql9X24OubHJve/e6Bak9W7aULb2pSukQmHlO0XGXawYRgtaQXc200baK1XnRliir
         qAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794224668; x=1794829468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TUIOjmzBlQxfdwjHftiwHU+LF7dk3gDF7kPQW6Gje5E=;
        b=AP7FI4hvXQViVsL674lx2NRO6vsnzrP/e/aIPhOoWkyMjY9g0XKFDuY2KW8MotBxfa
         /a9jH51re0DDTOFeWfRB4oPwbig2Y5Wkkvlx2fxQ4S2sRi/jkbBq3jEsQiMDT69EGQJc
         pldUEONYGA/EXA2VOKrjOOCd/GBDJF8Nw2Qf5JABcgGT7MbUBGpuzDGZxsN6QT3TOtnC
         vYvj0qUbmf/juW04yuP9sXH2347JzYrxkFTx2NRMoshFqZcF9+l89ayFsYVH3pkoOe8U
         NJZBIbTT/QoYqe0wby818D2vjBSPUVGFlUlasMMkHJNRwydZi5yYlpvhNWDbEWNiDoQg
         lxig==
X-Gm-Message-State: APuU4Z+s96EDIOdcXUhri+3cQFgZXltynJrKXbZvHVZU1wcWmbu73Rxr
	hVGkCRrVdD3Wt65gFnKDtpV6JZ7s402pDLNTnjvSJIp//UwrzbdzA+YFZych66u7
X-Gm-Gg: AYBFou0k7Orsis4kSpx4iU0pctbdgQgFeews+C33I5koSXHMhRm9SX8+0ZPFlXeBjPM
	+G43XEEHZ7ATV8Xs6vpnG/i90z6SFWHY+oiKhEBKgSez1SXb9MiFLEQmxpW51Xb5ouizqd8gVPo
	uony3JnFhlJbbGsjzQG5j//0AOtAWvyt/EBmmtdvvAKQLgB0/kOrzUZDe7iG2I6xgK28vs2dq6d
	vxFOUh1b2m2Lu3w0Ht2XcBBDQkBRX6xxaSrzdMG5RB08cUV55uHoGcMn+ln55NPhEV87zVLcylA
	HVHPHjfW20ay0RzShHJuDS6dALWwtAYob6umM97MndGBmr5IxVoIyf6rPRgbnZmw8y/CdMZFn5e
	uQZgldTQScz0L8KezXUHrucAkq0osdetq7wCwFQ322AxjDjbqSMI6ZAz1CZVa9HDhgMnc0pYYSk
	99sHYPL+owZdGWy1RXKgYgYfcSQJ149AKS7hGfSNwKnWhN+LjAVNaTBPr/sUxwLqmrbaFRN3aJ+
	ZNbxO4RXjGO/0615p2BhlIA6Yn84pqn9sjoXMzvxRu93lg880cUdI9sdFtf7LcwgzN/4saeqncS
	0/o7ccxpwTMQ3BACUAmsSc+JOOaVYBTi11lsy4Z6YfGwrD2+ZgnUnCnlK87s+WO5wTbhFoRI99E
	FOimQHJEhZfUE5N4MFQ9ljV9AWmT1I21io+5gfPpsR9GI0WcSPixFkJqJM6Tmk4gAXwFeFQnNlL
	8aK9wQW/1757Q=
X-Received: by 2002:a17:907:3fa1:b0:c42:6632:a369 with SMTP id a640c23a62f3a-c4d6db7d76bmr283531266b.21.1794224667461;
        Mon, 09 Nov 2026 03:44:27 -0800 (PST)
Received: from linux-laptop.dynamic.ziggo.nl (2001-1c03-0884-3400-503b-37c4-84e0-7f98.cable.dynamic.v6.ziggo.nl. [2001:1c03:884:3400:503b:37c4:84e0:7f98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a4b0245sm156584666b.62.2026.11.09.03.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:44:27 -0800 (PST)
From: Laurijssen <lauserve@gmail.com>
X-Google-Original-From: Laurijssen <laurijssen@protonmail.com>
To: linux-kernel@vger.kernel.org,
	pjw@kernel.org,
	akpm@linux-foundation.org,
	jannh@google.com,
	brauner@kernel.org
Cc: Laurijssen <laurijssen@protonmail.com>
Subject: [PATCH] SYS: add utsname_set_field to reuse code in setdomainname and sethostname
Date: Mon,  9 Nov 2026 12:44:21 +0100
Message-ID: <20261109114421.8414-1-laurijssen@protonmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <AE97EF84-F9EB-403E-B2A5-E75A4C329179@mainlining.org>
References: <AE97EF84-F9EB-403E-B2A5-E75A4C329179@mainlining.org>
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

Changes after review, cleanup of duplicated code in sethostname and
setdomainname. Moved reusable code to utsname_sysctl.c

- add utsname_set_field to utsname_sysctl.c
- call utsname_set_field from sethostname/setdomainname
- moved uts_proc_notify from .h into utsname_sysctl.c and turned static

Signed-off-by: Laurijssen <laurijssen@protonmail.com>
---
 include/linux/utsname.h | 10 ++----
 kernel/sys.c            | 46 ++-----------------------
 kernel/utsname_sysctl.c | 75 ++++++++++++++++++++++++++++++++++-------
 3 files changed, 66 insertions(+), 65 deletions(-)

diff --git a/include/linux/utsname.h b/include/linux/utsname.h
index dc5594ffffcc..409261d5381f 100644
--- a/include/linux/utsname.h
+++ b/include/linux/utsname.h
@@ -18,14 +18,6 @@ enum uts_proc {
 	UTS_PROC_DOMAINNAME,
 };
 
-#ifdef CONFIG_SYSCTL
-extern void uts_proc_notify(enum uts_proc proc);
-#else
-static inline void uts_proc_notify(enum uts_proc proc)
-{
-}
-#endif
-
 static inline struct new_utsname *utsname(void)
 {
 	return &current->nsproxy->uts_ns->name;
@@ -38,4 +30,6 @@ static inline struct new_utsname *init_utsname(void)
 
 extern struct rw_semaphore uts_sem;
 
+int utsname_set_field(char __user *name, int len, enum uts_proc proc);
+
 #endif /* _LINUX_UTSNAME_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 755bfa5ccd92..688c5e9e222f 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1421,28 +1421,7 @@ SYSCALL_DEFINE1(olduname, struct oldold_utsname __user *, name)
 
 SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
 {
-	int errno;
-	char tmp[__NEW_UTS_LEN];
-
-	if (!ns_capable(current->nsproxy->uts_ns->user_ns, CAP_SYS_ADMIN))
-		return -EPERM;
-
-	if (len < 0 || len > __NEW_UTS_LEN)
-		return -EINVAL;
-	errno = -EFAULT;
-	if (!copy_from_user(tmp, name, len)) {
-		struct new_utsname *u;
-
-		add_device_randomness(tmp, len);
-		down_write(&uts_sem);
-		u = utsname();
-		memcpy(u->nodename, tmp, len);
-		memset(u->nodename + len, 0, sizeof(u->nodename) - len);
-		errno = 0;
-		uts_proc_notify(UTS_PROC_HOSTNAME);
-		up_write(&uts_sem);
-	}
-	return errno;
+	return utsname_set_field(name, len, UTS_PROC_HOSTNAME);
 }
 
 #ifdef __ARCH_WANT_SYS_GETHOSTNAME
@@ -1475,28 +1454,7 @@ SYSCALL_DEFINE2(gethostname, char __user *, name, int, len)
  */
 SYSCALL_DEFINE2(setdomainname, char __user *, name, int, len)
 {
-	int errno;
-	char tmp[__NEW_UTS_LEN];
-
-	if (!ns_capable(current->nsproxy->uts_ns->user_ns, CAP_SYS_ADMIN))
-		return -EPERM;
-	if (len < 0 || len > __NEW_UTS_LEN)
-		return -EINVAL;
-
-	errno = -EFAULT;
-	if (!copy_from_user(tmp, name, len)) {
-		struct new_utsname *u;
-
-		add_device_randomness(tmp, len);
-		down_write(&uts_sem);
-		u = utsname();
-		memcpy(u->domainname, tmp, len);
-		memset(u->domainname + len, 0, sizeof(u->domainname) - len);
-		errno = 0;
-		uts_proc_notify(UTS_PROC_DOMAINNAME);
-		up_write(&uts_sem);
-	}
-	return errno;
+	return utsname_set_field(name, len, UTS_PROC_DOMAINNAME);
 }
 
 /* make sure you are allowed to change @tsk limits before calling this */
diff --git a/kernel/utsname_sysctl.c b/kernel/utsname_sysctl.c
index 6c1522201e39..026e5c877a8b 100644
--- a/kernel/utsname_sysctl.c
+++ b/kernel/utsname_sysctl.c
@@ -5,6 +5,7 @@
  *  Author: Eric Biederman <ebiederm@xmision.com>
  */
 
+#include <linux/capability.h>
 #include <linux/export.h>
 #include <linux/uts.h>
 #include <linux/utsname.h>
@@ -12,6 +13,9 @@
 #include <linux/sysctl.h>
 #include <linux/wait.h>
 #include <linux/rwsem.h>
+#include <linux/uaccess.h>
+
+static const struct ctl_table uts_kern_table[];
 
 #ifdef CONFIG_SYSCTL
 
@@ -67,10 +71,68 @@ static int proc_do_uts_string(const struct ctl_table *table, int write,
 
 	return r;
 }
+
+/*
+ * Notify userspace about a change in a certain entry of uts_kern_table,
+ * identified by the parameter proc.
+ */
+static void uts_proc_notify(enum uts_proc proc)
+{
+	const struct ctl_table *table = &uts_kern_table[proc];
+
+	proc_sys_poll_notify(table->poll);
+}
 #else
 #define proc_do_uts_string NULL
+
+static inline void uts_proc_notify(enum uts_proc proc)
+{
+}
 #endif
 
+int utsname_set_field(char __user *name, int len, enum uts_proc proc)
+{
+	int errno;
+	char tmp[__NEW_UTS_LEN];
+
+	if (!ns_capable(current->nsproxy->uts_ns->user_ns, CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (len < 0 || len > __NEW_UTS_LEN)
+		return -EINVAL;
+	errno = -EFAULT;
+	if (!copy_from_user(tmp, name, len)) {
+		struct new_utsname *u;
+		char *field;
+
+		add_device_randomness(tmp, len);
+		down_write(&uts_sem);
+
+		u = utsname();
+
+		switch (proc) {
+		case UTS_PROC_HOSTNAME:
+			field = u->nodename;
+			break;
+		case UTS_PROC_DOMAINNAME:
+			field = u->domainname;
+			break;
+		default:
+			WARN_ON_ONCE(1);
+			field = u->domainname;
+			break;
+		}
+
+		memcpy(field, tmp, len);
+		memset(field + len, 0, sizeof_field(struct new_utsname, nodename) - len);
+
+		errno = 0;
+		uts_proc_notify(proc);
+		up_write(&uts_sem);
+	}
+	return errno;
+}
+
 static DEFINE_CTL_TABLE_POLL(hostname_poll);
 static DEFINE_CTL_TABLE_POLL(domainname_poll);
 
@@ -122,19 +184,6 @@ static const struct ctl_table uts_kern_table[] = {
 	},
 };
 
-#ifdef CONFIG_SYSCTL
-/*
- * Notify userspace about a change in a certain entry of uts_kern_table,
- * identified by the parameter proc.
- */
-void uts_proc_notify(enum uts_proc proc)
-{
-	const struct ctl_table *table = &uts_kern_table[proc];
-
-	proc_sys_poll_notify(table->poll);
-}
-#endif
-
 static int __init utsname_sysctl_init(void)
 {
 	register_sysctl("kernel", uts_kern_table);
-- 
2.53.0

