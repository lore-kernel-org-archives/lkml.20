Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471100;
	b=N2WfTW+ELWzBoVdTrtBmEw/U2ztBkpVffVz7BswhWuk8AtjQ/CJFSdK55M3GD1rr0eTi
	 64No80AGh8RhuzwQKtq+t6VpgdK8pakwJEG4A2n4JWiOvSQw/vXLuw3ScuS6DCX+SHuP8
	 mvEXOIEQ7RVb8U6riwPq4WkuDEd1VFSdKwuiadPCpZz+LtZoqayqp/Hg5oxJC3qogFYTs
	 E4dR+6fP6QsIcfuWDBNy/oL94B83gYVBQIDT0sCPosGZeEUUayDFj1M7hx9K6aTaF7OZf
	 6iVmWktZSQGLQoFFk3OufanjgB6UGOXbZBKQd0ID8ujwPyXGOsS+cBiRIu2S+dwLf/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=H4vjM6fl38ofKkWcwbaRhnfiX4FoH+NhbL+2mBYo4os=;
	b=a2vi5xIcniy9qkgIQ5VDvOK8nSPdqvwvSirOBrl9VeYGg5MyRcocK73+dqjHfBym/3Du
	 pWvWQyhrlGQark2i6H5zr1tD4InBa3VU5dj4zJYitn/k6uwKOGJHW84USRslo5FvlNm7V
	 IVybx8FkwfuDn4hJD2wb9kGMyH3xqQMlcxVPE9xkv+pNjwMvte5+HUioiF4B2aCqnREx+
	 jxUJln5081mDQPpGHz/HQrPR/xr1cPmWlXyooSmSyF/j8MIrsmv/sjJPzNn/ZENXmcyCI
	 qlmYHv5/4MYNu2SS8deGP4noSD+nRSazMllqVUg9vv7XMAPBKE8lIjIRac6zXOW51Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpMGR+8y;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7083606A33C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7083606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RpMGR+8y
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c169ae1cb26so98650866b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471098; x=1795075898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H4vjM6fl38ofKkWcwbaRhnfiX4FoH+NhbL+2mBYo4os=;
        b=RpMGR+8yn3gSc0hbjlU2G8ZnYRgNv1Qe3eidCxOhoncbBoGEc7SDw9Wjbtlsar9wwP
         t8MePjDh6RuxpmbtSltlqK3UzCkrxNBm8he8pTx+9rwEaRiSuTwYW858M0t+lfwY0QsA
         ELwS7yVlmkEjx89bm4aYOUBd8e5wtpq8RlgWO50bFEuxgdHOXiDPjxrWhjTjc+YySxpH
         +qab04gopUcBxVtTWQ02YtTdaWdykgcgR3p17DT6EIdVca59l405Vk1om1+PUNHGFS8u
         WXE665O59eW5sMyTBITeBPqtA0Ct2eHkJ8+YWOo9Dk1woBT64XDWHaoAwZjpK23cEtGi
         VrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471098; x=1795075898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H4vjM6fl38ofKkWcwbaRhnfiX4FoH+NhbL+2mBYo4os=;
        b=BJbZtYDMbVraoX8112YrYLbI0tN8CU3tJ17VTRXOeQHuqUnzytRew5THE7i6tJHJkW
         euSEosGCLJyPa08NguwQrJmfPy2M1r7DVn9+icderOA/kzXZ6yiqU+52A7/bsnHwE0FI
         iiHYFFDlUBuC6ONF5GMKBM673PxrFGp3zx40ajt4nt+dQiGZxi0xHl/iT/OnpIJdWzAC
         hqdu8upUCnWHwo5zeyiItpCzQ1r3j31262Wo7Yho2upq3s96rIIF/nD/B5FVOOZthqzM
         LOGTvlmf84LnRc83O1ZEw7F3wBy4I+4fTwW9g9D/3ZTqkBvl/rjFvm6pFW1nj50+QTjE
         cz3w==
X-Gm-Message-State: APuU4Z/vV6BK01CYeq6O+dhNThC1p/NmxBF1NMIBVS4uW0IgkiLuCKfc
	ML4LkWTtlv2cy+WC63GajRjsdfq/buYrvmUAsk1RYBlWlfv9Z+J/ezMCTxMj++G/
X-Gm-Gg: AYBFou3oG8kckD0qz5jU3QMXvZJTcoUpXBhzrHtkB85hN2coig+QiJ6TME1V7ptrnoC
	QTCGDnsr3z/HDt24xrgT6x5Kjgdbk78Syw2h0p4WUxOWwk1kNnTvIC33nqdkMNeC0SLBbjq/Cqh
	1WL9YEjesmPpCPq5RD2mPwrz+s7ZfUOE8G0vA8EGb0v8DzS/0G6I0yUGJv8hr2evjsc4V2HQ2oT
	5z6mlEPrPfsKxcbPU1qZPWM2ywyWg7IWsls1X8BuYmS1nAaPHIe+qFa1NMRnoCPeW+GDyceyfnS
	Uzh8as9wrANtxwqN2coRmhfh3pr+EZ4kIevZ7Lr4+Dr6TBWTeWz5V0cw+I3h4N/Xhg5QH/+8x7y
	i72hIk5baTIDmE10cj17+MZclMc7sTTrbX5q0aVa/X0JeHREsRKI7oybn0K1KtYzg0DJZM//pVi
	YOO6tpHiq7R90jfscAyWI1FqFGU/BgA/YgSb/RkEU9qreXVGKYaQBTb4e9WOcLJWEmp8xXFiiJw
	TadQEv1UA/+ExRuk/Kpm74ySVhSc0jEmAJco2TyB1/QPcqqierCU0MnXTVSkJtMJm6TC3y6PfXE
	dftd0mPPEK3j0IyE9Cm7AC923dFOb+5nd+uPkaMTFUlZY3hrG0q/sVHuqsE65rk/LxEzZhpx5IK
	IeB9z99M+Sn6aqrIaQ/AoA2jZFE4NZ/gx/9+0Xx377QE6UdmC49n5eUP/59PwES78iQ==
X-Received: by 2002:a17:906:c103:b0:c50:6222:7b1c with SMTP id a640c23a62f3a-c507bc3805bmr142935266b.23.1794471098078;
        Thu, 12 Nov 2026 00:11:38 -0800 (PST)
Received: from linux-laptop.dynamic.ziggo.nl (2001-1c03-0884-3400-503b-37c4-84e0-7f98.cable.dynamic.v6.ziggo.nl. [2001:1c03:884:3400:503b:37c4:84e0:7f98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a64998dsm313662266b.63.2026.11.12.00.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:11:37 -0800 (PST)
From: Laurijssen <lauserve@gmail.com>
X-Google-Original-From: Laurijssen <laurijssen@protonmail.com>
To: linux-kernel@vger.kernel.org,
	pjw@kernel.org,
	akpm@linux-foundation.org,
	brauner@kernel.org
Cc: Laurijssen <laurijssen@protonmail.com>
Subject: [PATCH] SYS: refactor sethostname setdomainname by introducing shared helper
Date: Thu, 12 Nov 2026 09:11:32 +0100
Message-ID: <20261112081132.14183-1-laurijssen@protonmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <B9DD7F6A-A760-41D8-8809-D12F3F178326@linux.dev>
References: <B9DD7F6A-A760-41D8-8809-D12F3F178326@linux.dev>
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

Refactor sethostname/setdomainname to consolidate name setting logic
into a new helper, utsname_set_field. The existing implementation
duplicated validation, size checks, and uts namespace update steps that
are also needed by upcoming changes in related syscalls.

The helper centralizes:
  - updates to utsname()->nodename/domainname with proper locking
  - propagation rules for shared uts namespaces.

utsname_set_field could not be moved to utsname_sysctl.c as that file
is not compiled when CONFIG_SYSCTL is not defined.

This refactor does not change user behavior. All semantics of
the syscalls remain intact, including error codes and namespace
handling. The patch reduces code duplication, improves maintainability
and prepares for future extensions to utsname management.

Signed-off-by: Laurijssen <laurijssen@protonmail.com>
---
 kernel/sys.c | 53 ++++++++++++++++++++++++++--------------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/kernel/sys.c b/kernel/sys.c
index 755bfa5ccd92..77fedd127a3f 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1419,7 +1419,7 @@ SYSCALL_DEFINE1(olduname, struct oldold_utsname __user *, name)
 }
 #endif
 
-SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
+static int utsname_set_field(char __user *name, int len, enum uts_proc proc)
 {
 	int errno;
 	char tmp[__NEW_UTS_LEN];
@@ -1432,19 +1432,41 @@ SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
 	errno = -EFAULT;
 	if (!copy_from_user(tmp, name, len)) {
 		struct new_utsname *u;
+		char *field;
 
 		add_device_randomness(tmp, len);
 		down_write(&uts_sem);
+
 		u = utsname();
-		memcpy(u->nodename, tmp, len);
-		memset(u->nodename + len, 0, sizeof(u->nodename) - len);
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
 		errno = 0;
-		uts_proc_notify(UTS_PROC_HOSTNAME);
+		uts_proc_notify(proc);
 		up_write(&uts_sem);
 	}
 	return errno;
 }
 
+SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
+{
+	return utsname_set_field(name, len, UTS_PROC_HOSTNAME);
+}
+
 #ifdef __ARCH_WANT_SYS_GETHOSTNAME
 
 SYSCALL_DEFINE2(gethostname, char __user *, name, int, len)
@@ -1475,28 +1497,7 @@ SYSCALL_DEFINE2(gethostname, char __user *, name, int, len)
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
-- 
2.53.0

