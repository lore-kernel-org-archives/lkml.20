Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793880492;
	b=af5SemluiIrNTSUeEp0VoCLtSO0Dv2AWi+9vhcn2wSpexC890Q301l9e7E2H8mDcZCZX
	 KgiILtn/utRm1GjgEiuzZG5NEN1WzuqrDDh12I6RYc3/BZ3cu8l142Ct1a/JVR90fulPe
	 scFzttRtyawx5kFKvDMkG46CZg92W4nIvxcgBMHFsKuTG0eIrIZ8RGLjStzZhcgQH004E
	 6Co7qlt9ueVUxpzl4GVcl+kWvKvL6ICI5U8nlWEmuzD03KTY8xsk/L87f9HgxU7pQfo4U
	 YDftwfpA+Y7VfByDj1YjEwi8sa3AqJr9TD6YjVTwm3BW0mwce+NILyw7f+8jxVsHFZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l7F9TTWWbMuBr9Fre/VxX8gEqsdwrkbz9r1btreVxJE=;
	b=3HI/AX69p1miOE0vQtETJ1wByY8lBCyZGRZVAODri5dcjmRpuKLxi3fJfYcFTXgipoVS
	 prn/0GwfdvA9A5q4edfzIwD0BwcCJX+61YORdcjYR0YuVxmN0uJtz7Uu4urb48+IB8Qhi
	 HfaByUr7g5mqDN2ze65saNAbJBv46yzxYbGxFLnKAZfy+F0Yfn9F1vop5lrDG2jl9Ea3b
	 XH/cQXjJW8U9bh2A0IAA3hEqWxY5McIbrOgoDYCl1/IQns+Go5Uhj04rsYuEO84ulRTHe
	 RdmX3DYH1E9dPd3AD/LRg5AUMMBaW+qdxXE1On5jpPekRAO+hZt0Q0oYDiGRCU3yATw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VOHf58wf;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8DE9606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8DE9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VOHf58wf
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b56c3677f8so1634816a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793880490; x=1794485290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l7F9TTWWbMuBr9Fre/VxX8gEqsdwrkbz9r1btreVxJE=;
        b=VOHf58wf8LTojh5I2KdMWrDXjHLT5K5fgYjJ4qsuu35mpAw6cc9jTBQ+katdsIkqER
         /FC9cLHnmJzLdVOe1rWQiMo+2KkCsjRAS70gLoKLOlFSCbODbLMpd5yhmCQd8UFXy9HW
         6sRR1ew/BesXTaAQjgfNB/uDyW1Gn+DQihCCuJNl/900YxQYeI/FbwLpPM3NnDoWmW3N
         KTJtgVgkohuuY3OVbsj27j4m9KGVVCmYg30wOMjtKE62yD4T7YKCXc+hnNXxh3XmAT/Y
         XWUGi2YYAlzZOdUmqLLf2ki8MXKcvjJHIr2C815CXawtvf+UZ5XkL0sGpkL/LjM4gWbN
         3/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880490; x=1794485290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7F9TTWWbMuBr9Fre/VxX8gEqsdwrkbz9r1btreVxJE=;
        b=Yddy6B9mR3NIrdttRRNZO5phQb784pxxtgghNz7YQYm07eywwb1ErKikjbNIynT+K8
         uDvOhS3ucENT09jtx+U9kTm3xr8E6+rVqICHaYL1W7PFxQ+mc/DPufj/mURJsZdfFu4v
         T8+098wwdPU+JRd4zS/N+I7X79ni7Ce5aimRc7nUByx2KFe6yyDkQqUsfBaswTSImK8X
         y/QhCE6nirXPATxaeuSf5H9VVq72g1ogUE+3NB79EmuujMpomEHhoICpXmhnZpRwAjPi
         ifItKaCNYuJcIP2777K1DuM7fWNWS8+f9AsHHspaGmMu9AowVCjKpbPeKKAlIvvv98qu
         P28g==
X-Gm-Message-State: APuU4Z84cldERBDV2ZoptI1Yi3RSkCabAMXZEcPghbKvVRzW7gsIo6Vf
	Npn5EXLAn4l49YUbUGQ6DsnENwj4GI8gmWstxzpbNkyBJexVMjzi1pvA6q7xm3UK
X-Gm-Gg: AYBFou1nbetfU30sYb76cmypwQDUZnIUYKY5k4HWLsjZPlCH524qalb4/QoDz2Jwq1W
	j7C1iAWkOAigScKk6vctr29q2k6y73ilB6fiyKc40jdzOsM/LJLnZt/ekneNVEUxqly/dL8/qPK
	5WjnrWhBDGr6QRBnxpjYCG/n7SBIkY77Tp49Y7Cs3BSSBPZkNzl++a8vw3Bx2i3gYmyvdXxitZC
	ijQX8eyCpitTvToDoFQrZC2RayEI1mLA9KwXvAlpUUIG5RtFji22aKZtvAGTiHIQhJwken9pVJD
	oBU2LdTCV0VgE1Hy+d55jiEta+PjgFNlSzAnQ6+qVGYfU+ZJeAUeW1qMoJm3S7Q4J0eiu7p9qAM
	LxMcQKtq8Ht9LnN/z30PnSTdqfZYcShkwnn3/rnZwjUlkWB74BqJu4v3pR5RI8BPsyT7yuKyqKb
	uJsdMBri9gTE8kGNQKZ01PXd1azyqVKQXY47cVsYDrTFw+TwTU6vzvF4n0WxlVwyDitOPsHzFH0
	TlpX6WVi4VdVALCPqNbWSALJnB66wFkbTHNYeiL6vX/8FdivsKxaKAvh2QmTG8JE7uO4XumBirN
	m8agR4jxv2XMqndDPFfl+eI4LTZWbm7e03Siy8VsvjE+IFNRwvIox4x0M0q8iLFNUXMsLzcViEF
	uaPMFXgkcD8xjcjXR5hZ495mhvlma/hH1mP43P8NBE2c5EQ1U4bYjB6FY0aluqhZcGkY=
X-Received: by 2002:a05:6402:a51a:10b0:6ac:8e1a:2b6f with SMTP id 4fb4d7f45d1cf-6b4d438baa9mr10181116a12.12.1793880489393;
        Thu, 05 Nov 2026 04:08:09 -0800 (PST)
Received: from linux-laptop.dynamic.ziggo.nl (2001-1c03-0884-3400-503b-37c4-84e0-7f98.cable.dynamic.v6.ziggo.nl. [2001:1c03:884:3400:503b:37c4:84e0:7f98])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac78e29sm1705142a12.27.2026.11.05.04.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:08:07 -0800 (PST)
From: Laurijssen <lauserve@gmail.com>
X-Google-Original-From: Laurijssen <laurijssen@protonmail.com>
To: linux-kernel@vger.kernel.org,
	pjw@kernel.org,
	akpm@linux-foundation.org,
	jannh@google.com,
	brauner@kernel.org
Cc: Laurijssen <laurijssen@protonmail.com>
Subject: [PATCH] add utsname_set_field to reuse code in setdomainname and sethostname
Date: Thu,  5 Nov 2026 13:07:51 +0100
Message-ID: <20261105120751.920311-1-laurijssen@protonmail.com>
X-Mailer: git-send-email 2.53.0
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

- add utsname_set_field to utsname_sysctl.c, it reuses duplicated code
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

