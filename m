Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547519;
	b=A5rRhm3QJoSs6f4r/Jj93esEdK7IneS29sglo9P8VboMzUrJmXLS5wNKYV22hFYAInWF
	 QeaS//hN8xwQN/RIjarHnEiRxP9eVHs8CQGJ4q7pRMzTXyeK81JS4OAlgVzrkBdMmeFDn
	 JpzHiH2XhiXzxm+movAKbmpRMtvpzLbRSqX235PRyt8/5lO28JYNQ6V1rub83XXera1bv
	 pnWAQLseUQdn40lrUJ69kwoq+7rmlaeNYjuGPnoi2tJjZBdAvZYZ2xaQGMmUV5kZ7SFkq
	 vHD0vCFTLlVZgch8Cn9gVfxry6HSuVBZnmwglANA7btO1yLQcIbTq7DhNgnZV/9i8EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547519;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+nlXZpj0iGB+6zl5ihr7+xk+fdVSweEY0gKqQhLDg9U=;
	b=ki2HjdX+OVnR4H0axDABYqIkdQpPkBlqOrr27+1mQU4lzotCTwajKPggTd3NeZf+wfwv
	 UjNWBOPy9uRV3ujuFBGVn3EWOfTubZJZgQ9Brb8NO0Ges/Qao4JoQgWnnf75v3LBZO/ZV
	 sS7tVZGZB1brR3Sd6Uq3kihyIGy4YEDPnV3d6V5V7ZqJHHb5Zghco2gZ5081RSeLX8gBK
	 Po0nDwjJGgHjJi6698+a2arZrp8cdnDUjKNG10vB8g4sajTHo0ZFVcpKVxfaR2PwLleZl
	 CUUzhFyK9GeI+N44bPqu/Gfm68Q8+Fl4jUvow1Te+QxB4tj7maK8vLmOIqxhB0Vo5Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b="qZ/K3+35";
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=bK12eE5Q;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD31606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD31606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=qZ/K3+35;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=bK12eE5Q
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793547498; bh=+nlXZpj0iGB+6zl5ihr7+xk
	+fdVSweEY0gKqQhLDg9U=; b=qZ/K3+35ceNRo0t6/18qDWKrEXURcKizLJfaUZkDIxqtkYkj+p
	Get60UQhGKBlj8jrXSeLIGyT9avHRZ8JEJXCDCTSmlsWMF4MxBV2IDYs7QNpnkeySEO07V+1OvZ
	HQJx4SbTZyz/BNcfYKM/rrVeUt42kCHzco7YFYP0qKwuYeDNcE0iYDiYT5FlloAa6K/dgOlCMsn
	yXoozVpo69d2SsypNtBkYx3a0CzpdVQJ5ehMQ29gyzZpFT59W7m8LUj7rTf653T/S35jlF6t2vt
	Ssros/VRYmS0jUNyjbjNm5fqUt/mAJQ5yQjhB94NkENbzGgeBMO603cTc3Qis8LDiow==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793547498; bh=+nlXZpj0iGB+6zl5ihr7+xk
	+fdVSweEY0gKqQhLDg9U=; b=bK12eE5QFUXYZghV36hGz46Wajk7vSBU6i/+lCfumfb4n7yo8Y
	SwomYAp5Qw6aVh0/XkeCgrHyMEx9vXhGX/DQ==;
Date: Sun, 01 Nov 2026 15:38:16 +0000
From: Bradley Morgan <brads@mainlining.org>
To: lauserve@gmail.com
CC: akpm@linux-foundation.org, brauner@kernel.org, jannh@google.com,
 laurijssen@protonmail.com, linux-kernel@vger.kernel.org, pjw@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_add_setutsname_to_reuse_?=
 =?US-ASCII?Q?code_in_setdomainname_and_sethostname?=
In-Reply-To: <20261101071227.14893-1-laurijssen@protonmail.com>
Message-ID: <AE97EF84-F9EB-403E-B2A5-E75A4C329179@mainlining.org>
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

> +static int setutsname(char __user *name, int len, enum uts_proc uts_proc,
> +		      char (*field)[__NEW_UTS_LEN + 1],
> +		      int fieldlen)

If we pass uts_proc, why do we also need field? Nothing keeps them in sync.
UTS_PROC_HOSTNAME paired with &u->domainname still writes where you wanted,
it just notifies the wrong sysctl poll, and the compiler says nothing about
it. Both callsites are right today so its not a bug, its a shape I would
rather not have in the tree. The enum already names the two writable
fields,
so let the helper pick the field from it. fieldlen can go too, the array in
the parameter list already says 65, so sizeof(*field) is the whole field. I
built that bit standalone to be sure, it gives 65.

Diff on top of your patch, it applies clean and builds here:

diff --git a/kernel/sys.c b/kernel/sys.c
index 3a4e483..f957871 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1419,9 +1419,7 @@ SYSCALL_DEFINE1(olduname, struct oldold_utsname __user *, name)
 }
 #endif
 
-static int setutsname(char __user *name, int len, enum uts_proc uts_proc,
-		      char (*field)[__NEW_UTS_LEN + 1],
-		      int fieldlen)
+static int setutsname(char __user *name, int len, enum uts_proc proc)
 {
 	int errno;
 	char tmp[__NEW_UTS_LEN];
@@ -1433,13 +1431,17 @@ static int setutsname(char __user *name, int len, enum uts_proc uts_proc,
 		return -EINVAL;
 	errno = -EFAULT;
 	if (!copy_from_user(tmp, name, len)) {
+		struct new_utsname *u;
+		char *field;
+
 		add_device_randomness(tmp, len);
 		down_write(&uts_sem);
-		memcpy(*field, tmp, len);
-		memset(*field + len, 0, fieldlen - len);
-
+		u = utsname();
+		field = proc == UTS_PROC_HOSTNAME ? u->nodename : u->domainname;
+		memcpy(field, tmp, len);
+		memset(field + len, 0, sizeof_field(struct new_utsname, nodename) - len);
 		errno = 0;
-		uts_proc_notify(uts_proc);
+		uts_proc_notify(proc);
 		up_write(&uts_sem);
 	}
 	return errno;
@@ -1447,10 +1449,7 @@ static int setutsname(char __user *name, int len, enum uts_proc uts_proc,
 
 SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
 {
-	// utsname() always returns a valid pointer to the current utsname structure.
-	struct new_utsname *u = utsname();
-
-	return setutsname(name, len, UTS_PROC_HOSTNAME, &u->nodename, sizeof(u->nodename));
+	return setutsname(name, len, UTS_PROC_HOSTNAME);
 }
 
 #ifdef __ARCH_WANT_SYS_GETHOSTNAME
@@ -1483,10 +1482,7 @@ SYSCALL_DEFINE2(gethostname, char __user *, name, int, len)
  */
 SYSCALL_DEFINE2(setdomainname, char __user *, name, int, len)
 {
-	// utsname() always returns a valid pointer to the current utsname structure.
-	struct new_utsname *u = utsname();
-
-	return setutsname(name, len, UTS_PROC_DOMAINNAME, &u->domainname, sizeof(u->domainname));
+	return setutsname(name, len, UTS_PROC_DOMAINNAME);
 }
 
 /* make sure you are allowed to change @tsk limits before calling this */

Then both syscalls are a one line return, 12 added lines against your 18.
If
you would rather the other procs be loud instead of silently taken as
domainname, make it a switch with WARN_ON_ONCE(1) in the default, I'd take
either form.


> +	// utsname() always returns a valid pointer to the current utsname structure.
> +	struct new_utsname *u = utsname();

I dont think reading utsname() outside the lock is unsafe, current owns its
nsproxy and nothing else can move uts_ns under it. But the hoist buys
nothing and it is a change your changelog does not mention: uts_sem used to
cover the call. Keeping it next to the memcpy means there is nothing to
explain. The comment restates the line it sits on and it appears twice, so
the diff drops it. Also kernel/sys.c has no // comments of its own, the
single // in it is the SPDX line, so it reads new for this file either way.
Anything that isnt needed, goes.

If you want more of a cleanup, the /proc/sys/kernel/
hostname writers in kernel/utsname_sysctl.c buffer, call
add_device_randomness(), take uts_sem and memcpy, so they are a third copy
of this. Not the same though, they write all 65 bytes rather than len plus
the zero fill, so afaics your patch doesn't try to cover them and that is
fine. But that file has had "Should this be in kernel/sys.c ????" sitting
over proc_do_uts_string() since 2007, so if you want the bigger version of
this cleanup, that is where the shared helper goes.
--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
