Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.167
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378051;
	b=hdhLQskFf9bEWAbFcRGIbNOjdMDmhkZGvETJuysntEavbjfjfVF0HyNddcEls+JZTPaO
	 67eSo2Bc0B9vRSUu6OBVRp7d21mDaihqG9RGp/gqldGGviN/tycWDv8D0RRFBINoC2VEC
	 MaUl0IiuvwDQdfJk507ZeRC7H102VXYknPOV1baQTEMVIzRc1fvSl8BWUdFvcMzyrczjD
	 VKPAvGzMPzLlN4YwJsmdiQFqi5s/zxYjxbyHPMkqygzCLL7yTvIcor5a2XSWxELZOP3DZ
	 freL1s3mWD9n2JR/gHgCcjq1pR3Cp1o+VT0xHmofoDhYIaKl8jKkw8kTjPExud6Bkpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378051;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=WKs2bdy4c8HrnvwR5ExOUyY5ZKJ09rsX2qWRI+07UKU=;
	b=XzlP9DYbYaJkVoyiO+0BWI3sWh1ubMVjLuF2YXErVx1jEUheJGKAJ1SscQfXv8ZGngyP
	 fMlXrH4OlTmfCgTaZOo0TG+OrwLgznoZ9/U18bEF6sWozWcilkrNtOCm1tZH72Vbx3zlG
	 SCOfWuldCTSBT0tLxlZuoEe1XIuotW7oMzAcuhozLCGa0gLKYBlYYfouuMqUdg5LidHLy
	 jlBaYVLqBC47f+Fb6URcJxPYjVb9bz4NcdaJk9eaw525hrfCCLkwftKgad2FhxXwRnCNX
	 8Oc5M4XAJOiof7pqhT4VxMiSzhXvSzgZO7tFnNWUbcZn0q880hyqk5JBBjGqoVxAlsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=decLfVf4;
	arc=none smtp.remote-ip=185.70.43.167
Received: from mail-43167.protonmail.ch (mail-43167.protonmail.ch [185.70.43.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26BE606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B26BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=decLfVf4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794378048; x=1794637248;
	bh=WKs2bdy4c8HrnvwR5ExOUyY5ZKJ09rsX2qWRI+07UKU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=decLfVf4SVI8jdH0GVeoZhnYzH95jUw2RzyEI19tE2+IY/QVsDILOxOXLna4U9PZY
	 OucNVxL52Do2Br4InowzUvO+wo7MTIZqNn3ocJr8w6e9loC+LSpgfYYq3cxA23gBbI
	 mEPNZuoG4rwr7E7CfWa1CurwKMYWZ1hfeZ2cjCx2+ZHNzXcJvtIaUxnNtEH1tEk0CF
	 tZMIQjPcQpCxHbb3oh0Q0syUNODzN03MvBLwUXXfhNbRXqQnom0BqZSXW7AC5zBKGa
	 ZzMFNkAQdCahAdhvjaZH+JQjzNr62Hifq0eUeZD9latktqc5imCM2d63qzjEfxep9S
	 ofKyt2c+bW7/A==
Date: Wed, 11 Nov 2026 06:20:43 +0000
To: Bradley Morgan <bradley.morgan@linux.dev>
From: Laurijssen <laurijssen@protonmail.com>
Cc: lauserve@gmail.com, akpm@linux-foundation.org, brauner@kernel.org, jannh@google.com, linux-kernel@vger.kernel.org, pjw@kernel.org
Subject: Re: [PATCH] SYS: add utsname_set_field to reuse code in setdomainname and sethostname
Message-ID: <HZRBbAN2pvX8wrSpBzLfSktpGE2cXZ4-N8aLmvOCKxVesYuG2aGztMmxOHxAsgeJxULM52DyE-7O_Uqh-Veu5EOucViplpSypqQCNiAmNGU=@protonmail.com>
In-Reply-To: <B87D6D66-C989-406A-9FC6-9B504F4817AF@linux.dev>
References: <B87D6D66-C989-406A-9FC6-9B504F4817AF@linux.dev>
Feedback-ID: 76652164:user:proton
X-Pm-Message-ID: de7ef798be08cc0a92d03060bae5fc9a2c1a5abc
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The code does not compile when CONFIG_SYSCTL is not defined.

Even though utsname_sysctl.c has "#ifdef CONFIG_SYSCTL" and I made sure the=
 function was outside of the #ifdef CONFIG_SYSCTL the function still could =
not be linked from sys.c.

It turns out that utsname_sysctl.c is not compiled at all on the Makefile l=
evel when CONFIG_SYSCTL is not defined.

kernel/Makefile:obj-$(CONFIG_SYSCTL) +=3D utsname_sysctl.o

I'll fix it by adding the function as a static inside sys.c. Then it's also=
 clear why uts_proc_notify was defined in header and not C file, so that is=
 going back as well.

Not sure why there are #ifdef CONFIG_SYSCTL inside utsname_sysctl.c then th=
ough.

On Monday, November 9th, 2026 at 10:11 PM, Bradley Morgan <bradley.morgan@l=
inux.dev> wrote:

> On 9 November 2026 11:44:21 GMT, Laurijssen <lauserve@gmail.com> wrote:
> >Changes after review, cleanup of duplicated code in sethostname and
> >setdomainname. Moved reusable code to utsname_sysctl.c
> >
> >- add utsname_set_field to utsname_sysctl.c
> >- call utsname_set_field from sethostname/setdomainname
> >- moved uts_proc_notify from .h into utsname_sysctl.c and turned static
>=20
> Hmm..
>=20
> >
> >Signed-off-by: Laurijssen <laurijssen@protonmail.com>
> >---
> > include/linux/utsname.h | 10 ++----
> > kernel/sys.c            | 46 ++-----------------------
> > kernel/utsname_sysctl.c | 75 ++++++++++++++++++++++++++++++++++-------
> > 3 files changed, 66 insertions(+), 65 deletions(-)
> >
> >diff --git a/include/linux/utsname.h b/include/linux/utsname.h
> >index dc5594ffffcc..409261d5381f 100644
> >--- a/include/linux/utsname.h
> >+++ b/include/linux/utsname.h
> >@@ -18,14 +18,6 @@ enum uts_proc {
> > =09UTS_PROC_DOMAINNAME,
> > };
> >
> >-#ifdef CONFIG_SYSCTL
> >-extern void uts_proc_notify(enum uts_proc proc);
> >-#else
> >-static inline void uts_proc_notify(enum uts_proc proc)
> >-{
> >-}
> >-#endif
> >-
> > static inline struct new_utsname *utsname(void)
> > {
> > =09return &current->nsproxy->uts_ns->name;
> >@@ -38,4 +30,6 @@ static inline struct new_utsname *init_utsname(void)
> >
> > extern struct rw_semaphore uts_sem;
> >
> >+int utsname_set_field(char __user *name, int len, enum uts_proc proc);
> >+
> > #endif /* _LINUX_UTSNAME_H */
> >diff --git a/kernel/sys.c b/kernel/sys.c
> >index 755bfa5ccd92..688c5e9e222f 100644
> >--- a/kernel/sys.c
> >+++ b/kernel/sys.c
> >@@ -1421,28 +1421,7 @@ SYSCALL_DEFINE1(olduname, struct oldold_utsname _=
_user *, name)
> >
> > SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
> > {
> >-=09int errno;
> >-=09char tmp[__NEW_UTS_LEN];
> >-
> >-=09if (!ns_capable(current->nsproxy->uts_ns->user_ns, CAP_SYS_ADMIN))
> >-=09=09return -EPERM;
> >-
> >-=09if (len < 0 || len > __NEW_UTS_LEN)
> >-=09=09return -EINVAL;
> >-=09errno =3D -EFAULT;
> >-=09if (!copy_from_user(tmp, name, len)) {
> >-=09=09struct new_utsname *u;
> >-
> >-=09=09add_device_randomness(tmp, len);
> >-=09=09down_write(&uts_sem);
> >-=09=09u =3D utsname();
> >-=09=09memcpy(u->nodename, tmp, len);
> >-=09=09memset(u->nodename + len, 0, sizeof(u->nodename) - len);
> >-=09=09errno =3D 0;
> >-=09=09uts_proc_notify(UTS_PROC_HOSTNAME);
> >-=09=09up_write(&uts_sem);
> >-=09}
> >-=09return errno;
> >+=09return utsname_set_field(name, len, UTS_PROC_HOSTNAME);
> > }
> >
> > #ifdef __ARCH_WANT_SYS_GETHOSTNAME
> >@@ -1475,28 +1454,7 @@ SYSCALL_DEFINE2(gethostname, char __user *, name,=
 int, len)
> >  */
> > SYSCALL_DEFINE2(setdomainname, char __user *, name, int, len)
> > {
> >-=09int errno;
> >-=09char tmp[__NEW_UTS_LEN];
> >-
> >-=09if (!ns_capable(current->nsproxy->uts_ns->user_ns, CAP_SYS_ADMIN))
> >-=09=09return -EPERM;
> >-=09if (len < 0 || len > __NEW_UTS_LEN)
> >-=09=09return -EINVAL;
> >-
> >-=09errno =3D -EFAULT;
> >-=09if (!copy_from_user(tmp, name, len)) {
> >-=09=09struct new_utsname *u;
> >-
> >-=09=09add_device_randomness(tmp, len);
> >-=09=09down_write(&uts_sem);
> >-=09=09u =3D utsname();
> >-=09=09memcpy(u->domainname, tmp, len);
> >-=09=09memset(u->domainname + len, 0, sizeof(u->domainname) - len);
> >-=09=09errno =3D 0;
> >-=09=09uts_proc_notify(UTS_PROC_DOMAINNAME);
> >-=09=09up_write(&uts_sem);
> >-=09}
> >-=09return errno;
> >+=09return utsname_set_field(name, len, UTS_PROC_DOMAINNAME);
> > }
> >
> > /* make sure you are allowed to change @tsk limits before calling this =
*/
> >diff --git a/kernel/utsname_sysctl.c b/kernel/utsname_sysctl.c
> >index 6c1522201e39..026e5c877a8b 100644
> >--- a/kernel/utsname_sysctl.c
> >+++ b/kernel/utsname_sysctl.c
> >@@ -5,6 +5,7 @@
> >  *  Author: Eric Biederman <ebiederm@xmision.com>
> >  */
> >
> >+#include <linux/capability.h>
> > #include <linux/export.h>
> > #include <linux/uts.h>
> > #include <linux/utsname.h>
> >@@ -12,6 +13,9 @@
> > #include <linux/sysctl.h>
> > #include <linux/wait.h>
> > #include <linux/rwsem.h>
> >+#include <linux/uaccess.h>
> >+
> >+static const struct ctl_table uts_kern_table[];
> >
> > #ifdef CONFIG_SYSCTL
> >
> >@@ -67,10 +71,68 @@ static int proc_do_uts_string(const struct ctl_table=
 *table, int write,
> >
> > =09return r;
> > }
> >+
> >+/*
> >+ * Notify userspace about a change in a certain entry of uts_kern_table=
,
> >+ * identified by the parameter proc.
> >+ */
> >+static void uts_proc_notify(enum uts_proc proc)
> >+{
> >+=09const struct ctl_table *table =3D &uts_kern_table[proc];
> >+
> >+=09proc_sys_poll_notify(table->poll);
> >+}
> > #else
> > #define proc_do_uts_string NULL
> >+
> >+static inline void uts_proc_notify(enum uts_proc proc)
> >+{
> >+}
> > #endif
> >
> >+int utsname_set_field(char __user *name, int len, enum uts_proc proc)
> >+{
> >+=09int errno;
> >+=09char tmp[__NEW_UTS_LEN];
> >+
> >+=09if (!ns_capable(current->nsproxy->uts_ns->user_ns, CAP_SYS_ADMIN))
> >+=09=09return -EPERM;
> >+
> >+=09if (len < 0 || len > __NEW_UTS_LEN)
> >+=09=09return -EINVAL;
> >+=09errno =3D -EFAULT;
> >+=09if (!copy_from_user(tmp, name, len)) {
> >+=09=09struct new_utsname *u;
> >+=09=09char *field;
> >+
> >+=09=09add_device_randomness(tmp, len);
> >+=09=09down_write(&uts_sem);
> >+
> >+=09=09u =3D utsname();
> >+
> >+=09=09switch (proc) {
> >+=09=09case UTS_PROC_HOSTNAME:
> >+=09=09=09field =3D u->nodename;
> >+=09=09=09break;
> >+=09=09case UTS_PROC_DOMAINNAME:
> >+=09=09=09field =3D u->domainname;
> >+=09=09=09break;
> >+=09=09default:
> >+=09=09=09WARN_ON_ONCE(1);
> >+=09=09=09field =3D u->domainname;
> >+=09=09=09break;
> >+=09=09}
> >+
> >+=09=09memcpy(field, tmp, len);
> >+=09=09memset(field + len, 0, sizeof_field(struct new_utsname, nodename)=
 - len);
> >+
> >+=09=09errno =3D 0;
> >+=09=09uts_proc_notify(proc);
> >+=09=09up_write(&uts_sem);
> >+=09}
> >+=09return errno;
> >+}
> >+
> > static DEFINE_CTL_TABLE_POLL(hostname_poll);
> > static DEFINE_CTL_TABLE_POLL(domainname_poll);
> >
> >@@ -122,19 +184,6 @@ static const struct ctl_table uts_kern_table[] =3D =
{
> > =09},
> > };
> >
> >-#ifdef CONFIG_SYSCTL
> >-/*
> >- * Notify userspace about a change in a certain entry of uts_kern_table=
,
> >- * identified by the parameter proc.
> >- */
> >-void uts_proc_notify(enum uts_proc proc)
> >-{
> >-=09const struct ctl_table *table =3D &uts_kern_table[proc];
> >-
> >-=09proc_sys_poll_notify(table->poll);
> >-}
> >-#endif
> >-
> > static int __init utsname_sysctl_init(void)
> > {
> > =09register_sysctl("kernel", uts_kern_table);
>=20
> This code doesn't compile, please check kernel test robot.
>=20
> >
>=20
>=20
> --- Thanks!
> 
