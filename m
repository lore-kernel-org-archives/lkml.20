Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.94
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258703;
	b=cR1SY2fbElLtTZ5wdtO4NfNQcgXMfTHUQPXOvaUhLRdD2AF1RAoOueq9oxnh1frb7oQ7
	 9xyu2Rvr1PsrCNx2oO1cswKQgjAge75x567U4e/1NzqYGJZunAcdruswMIEhVhVhhR1je
	 yuhOFakZ3HSmTXqjBMs+gDIr9TklrsY8B6l/w8PMFprfpng4SKJ3S87LSdODjKVT2auXz
	 d7l8glCszBNxV8H4vo1Kw8cngAwYKxtThR97lxDfqF8fEOEcw+oT0MtMaZfbZw+h3o7Y/
	 oJCrybsOCrEBcsznhcCM+GX9R0OcIUBjXKz2Fc/toNvlayO0KifbgwfP10kOdI1pFnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258703;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=yuP1MQC29JxirhWagUbgO2ovuiCxpyUhgrkjZyBXrrY=;
	b=L9vcaLtJgZLswq0U7WkUKIK4WuUEgxlo2pMNUwKzIhppbztikL6wfYhDTU0tKwv+4wNi
	 BgezVctR04iYTPTchpA2fgw7QdGPlBuRy0zKlaniLTFC6WM1+b9zxftifljPsGxSDpdXX
	 pXoZ7yPQFQfTsWbFExzHl14DmdSZzXLEDT4tO3bYB32ep7oSfSePS/u8/tnb3dDEAYtQK
	 SdyWz8T2dMXkWFflzpn2u/QKBLf91VdOLgYBPsgZNiNqkBPiLIqx7hImwh3kGMMaQjOnu
	 S1KABGXdPSGWHabwLsFYZMVH8p+o8JdIyMsBmqpfj2oL5W90lv9v0eBmdHXNFoEvpmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ReBHnlSJ;
	arc=none smtp.remote-ip=95.215.58.94
Received: from mta1.migadu.com (out-94.mta1.migadu.com [95.215.58.94])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC58606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:11:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBC58606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ReBHnlSJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dxomrit1llAmiDlprFYpeDwskrC1e+D/GbIKtIK5TZc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794258699; v=1; x=1794863499;
 b=ReBHnlSJp6r6t2ztFEeYPoOWuhdLVLVw92+G+4sVRh5MTo1lvkHx4HH3MkotqC4dK/XycZ8H
 eN1NXKeiYFYRXqVnIV3e421EeW3iGQsqqL2r93XB6Fx+8xUVigMCZwzbs+zwA0zZxM7yCockWz9
 4h69FMXIx+d+fGsdvEF7YSlM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d9a2b3a770e200a4;
	Mon, 09 Nov 2026 21:11:39 +0000
X-Mizu-Trace-ID: d9a2b3a770e200a4
X-Migadu-Flow: FLOW_OUT
Date: Mon, 09 Nov 2026 21:11:35 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: lauserve@gmail.com
CC: akpm@linux-foundation.org, brauner@kernel.org, jannh@google.com,
 laurijssen@protonmail.com, linux-kernel@vger.kernel.org, pjw@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_SYS=3A_add_utsname=5Fset=5Ffield_to_?=
 =?US-ASCII?Q?reuse_code_in_setdomainname_and_sethostname?=
In-Reply-To: <20261109114421.8414-1-laurijssen@protonmail.com>
Message-ID: <B87D6D66-C989-406A-9FC6-9B504F4817AF@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 9 November 2026 11:44:21 GMT, Laurijssen <lauserve@gmail.com> wrote:
>Changes after review, cleanup of duplicated code in sethostname and
>setdomainname. Moved reusable code to utsname_sysctl.c
>
>- add utsname_set_field to utsname_sysctl.c
>- call utsname_set_field from sethostname/setdomainname
>- moved uts_proc_notify from .h into utsname_sysctl.c and turned static

Hmm..

>
>Signed-off-by: Laurijssen <laurijssen@protonmail.com>
>---
> include/linux/utsname.h | 10 ++----
> kernel/sys.c            | 46 ++-----------------------
> kernel/utsname_sysctl.c | 75 ++++++++++++++++++++++++++++++++++-------
> 3 files changed, 66 insertions(+), 65 deletions(-)
>
>diff --git a/include/linux/utsname.h b/include/linux/utsname.h
>index dc5594ffffcc..409261d5381f 100644
>--- a/include/linux/utsname.h
>+++ b/include/linux/utsname.h
>@@ -18,14 +18,6 @@ enum uts_proc {
> 	UTS_PROC_DOMAINNAME,
> };
> 
>-#ifdef CONFIG_SYSCTL
>-extern void uts_proc_notify(enum uts_proc proc);
>-#else
>-static inline void uts_proc_notify(enum uts_proc proc)
>-{
>-}
>-#endif
>-
> static inline struct new_utsname *utsname(void)
> {
> 	return &current->nsproxy->uts_ns->name;
>@@ -38,4 +30,6 @@ static inline struct new_utsname *init_utsname(void)
> 
> extern struct rw_semaphore uts_sem;
> 
>+int utsname_set_field(char __user *name, int len, enum uts_proc proc);
>+
> #endif /* _LINUX_UTSNAME_H */
>diff --git a/kernel/sys.c b/kernel/sys.c
>index 755bfa5ccd92..688c5e9e222f 100644
>--- a/kernel/sys.c
>+++ b/kernel/sys.c
>@@ -1421,28 +1421,7 @@ SYSCALL_DEFINE1(olduname, struct oldold_utsname __user *, name)
> 
> SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
> {
>-	int errno;
>-	char tmp[__NEW_UTS_LEN];
>-
>-	if (!ns_capable(current->nsproxy->uts_ns->user_ns, CAP_SYS_ADMIN))
>-		return -EPERM;
>-
>-	if (len < 0 || len > __NEW_UTS_LEN)
>-		return -EINVAL;
>-	errno = -EFAULT;
>-	if (!copy_from_user(tmp, name, len)) {
>-		struct new_utsname *u;
>-
>-		add_device_randomness(tmp, len);
>-		down_write(&uts_sem);
>-		u = utsname();
>-		memcpy(u->nodename, tmp, len);
>-		memset(u->nodename + len, 0, sizeof(u->nodename) - len);
>-		errno = 0;
>-		uts_proc_notify(UTS_PROC_HOSTNAME);
>-		up_write(&uts_sem);
>-	}
>-	return errno;
>+	return utsname_set_field(name, len, UTS_PROC_HOSTNAME);
> }
> 
> #ifdef __ARCH_WANT_SYS_GETHOSTNAME
>@@ -1475,28 +1454,7 @@ SYSCALL_DEFINE2(gethostname, char __user *, name, int, len)
>  */
> SYSCALL_DEFINE2(setdomainname, char __user *, name, int, len)
> {
>-	int errno;
>-	char tmp[__NEW_UTS_LEN];
>-
>-	if (!ns_capable(current->nsproxy->uts_ns->user_ns, CAP_SYS_ADMIN))
>-		return -EPERM;
>-	if (len < 0 || len > __NEW_UTS_LEN)
>-		return -EINVAL;
>-
>-	errno = -EFAULT;
>-	if (!copy_from_user(tmp, name, len)) {
>-		struct new_utsname *u;
>-
>-		add_device_randomness(tmp, len);
>-		down_write(&uts_sem);
>-		u = utsname();
>-		memcpy(u->domainname, tmp, len);
>-		memset(u->domainname + len, 0, sizeof(u->domainname) - len);
>-		errno = 0;
>-		uts_proc_notify(UTS_PROC_DOMAINNAME);
>-		up_write(&uts_sem);
>-	}
>-	return errno;
>+	return utsname_set_field(name, len, UTS_PROC_DOMAINNAME);
> }
> 
> /* make sure you are allowed to change @tsk limits before calling this */
>diff --git a/kernel/utsname_sysctl.c b/kernel/utsname_sysctl.c
>index 6c1522201e39..026e5c877a8b 100644
>--- a/kernel/utsname_sysctl.c
>+++ b/kernel/utsname_sysctl.c
>@@ -5,6 +5,7 @@
>  *  Author: Eric Biederman <ebiederm@xmision.com>
>  */
> 
>+#include <linux/capability.h>
> #include <linux/export.h>
> #include <linux/uts.h>
> #include <linux/utsname.h>
>@@ -12,6 +13,9 @@
> #include <linux/sysctl.h>
> #include <linux/wait.h>
> #include <linux/rwsem.h>
>+#include <linux/uaccess.h>
>+
>+static const struct ctl_table uts_kern_table[];
> 
> #ifdef CONFIG_SYSCTL
> 
>@@ -67,10 +71,68 @@ static int proc_do_uts_string(const struct ctl_table *table, int write,
> 
> 	return r;
> }
>+
>+/*
>+ * Notify userspace about a change in a certain entry of uts_kern_table,
>+ * identified by the parameter proc.
>+ */
>+static void uts_proc_notify(enum uts_proc proc)
>+{
>+	const struct ctl_table *table = &uts_kern_table[proc];
>+
>+	proc_sys_poll_notify(table->poll);
>+}
> #else
> #define proc_do_uts_string NULL
>+
>+static inline void uts_proc_notify(enum uts_proc proc)
>+{
>+}
> #endif
> 
>+int utsname_set_field(char __user *name, int len, enum uts_proc proc)
>+{
>+	int errno;
>+	char tmp[__NEW_UTS_LEN];
>+
>+	if (!ns_capable(current->nsproxy->uts_ns->user_ns, CAP_SYS_ADMIN))
>+		return -EPERM;
>+
>+	if (len < 0 || len > __NEW_UTS_LEN)
>+		return -EINVAL;
>+	errno = -EFAULT;
>+	if (!copy_from_user(tmp, name, len)) {
>+		struct new_utsname *u;
>+		char *field;
>+
>+		add_device_randomness(tmp, len);
>+		down_write(&uts_sem);
>+
>+		u = utsname();
>+
>+		switch (proc) {
>+		case UTS_PROC_HOSTNAME:
>+			field = u->nodename;
>+			break;
>+		case UTS_PROC_DOMAINNAME:
>+			field = u->domainname;
>+			break;
>+		default:
>+			WARN_ON_ONCE(1);
>+			field = u->domainname;
>+			break;
>+		}
>+
>+		memcpy(field, tmp, len);
>+		memset(field + len, 0, sizeof_field(struct new_utsname, nodename) - len);
>+
>+		errno = 0;
>+		uts_proc_notify(proc);
>+		up_write(&uts_sem);
>+	}
>+	return errno;
>+}
>+
> static DEFINE_CTL_TABLE_POLL(hostname_poll);
> static DEFINE_CTL_TABLE_POLL(domainname_poll);
> 
>@@ -122,19 +184,6 @@ static const struct ctl_table uts_kern_table[] = {
> 	},
> };
> 
>-#ifdef CONFIG_SYSCTL
>-/*
>- * Notify userspace about a change in a certain entry of uts_kern_table,
>- * identified by the parameter proc.
>- */
>-void uts_proc_notify(enum uts_proc proc)
>-{
>-	const struct ctl_table *table = &uts_kern_table[proc];
>-
>-	proc_sys_poll_notify(table->poll);
>-}
>-#endif
>-
> static int __init utsname_sysctl_init(void)
> {
> 	register_sysctl("kernel", uts_kern_table);

This code doesn't compile, please check kernel test robot.

>


--- Thanks!
