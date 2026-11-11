Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428245;
	b=HDq8sP/Uj/q56Bxvw6LMo7rBi5D0rtZfd0q4EfDJmoseHPOCX/Tcywh8AOMPJstv9ywr
	 gaVCmSF6sCOMU9vAhZguFCqkJVmw+kyLQTNw7+voozc0f6wv7aNkrLijnUjk9Jv5jd6wH
	 8xaDESKBKUUicPtoM7cwl0MObAPjZJqNWAxnP9pBdr2futmNLgpt9JqH3UCiHuxX1Qwmh
	 WX2ZGl3/h6FZMCK/2a200FeShHbMqfEkvLD2wfgm5T5+1j6NTWLPFOf9NjS2cD0IrmcJk
	 c5UBV1RSeMPMiHApkf6KKivoHJifnddPva6G0Wqfy67aJlifxjtUndNAGz0y9M2GyXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428245;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+EgWxf4gng07oAgG4s4PXbVN2cj6AmfKs5B3QBz4BG4=;
	b=Q+h1/Ke1x2HQwl13KE1tZ1Nf7pLwn0xigQoNHjrbKeLtspgB6qDSPk3bnpGBJ+aHbRa6
	 CjA3WlmbH87PTEHYO79ZL1EfzQwnOeXCklk8FDtPh2OPpZz+Uy785dmRl12LT7RschFxE
	 pKTPy1RymzK3WV20H0m8itrEsgbwWu1vtXfgJS5zRa1l9MoXNRl1PzxKgBZA0aK7ojsJE
	 f+6cvHVtBuDMS3aaGwGmmUjugJO7XG20i5csr+nrnaxeDLm72eSygoANnvuZU678ky+vM
	 Dx8C4b5LM3rb8o8sQjAyX663fhJprViYgbNbN7vkR9wO7dRTEXnm6k83V4ifFoPzFVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZfFBTaph;
	arc=none smtp.remote-ip=91.218.175.158
Received: from mta0.migadu.com (out-158.mta0.migadu.com [91.218.175.158])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88349606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88349606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZfFBTaph
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HmCcL0luT9C/UWbqbpiU7NuLTnUt+wuE9oGZIP9tmjQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794428240; v=1; x=1795033040;
 b=ZfFBTaphJvhoTeNLboSa1xE0OGRafo3YHwI1ohDQ3COPWUxerMghWYknCMmdjLtMWrL7uFYJ
 jIEMaK2/5cYRRdfTEfk0ZsTeg24QKYM7fxyeycPrKOQPYcoTU72NSluszfeRbH4lNPrp/dznmQp
 RZLIEmSHznjFSp/Iyic29l+A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a3dd4c8d84a66b62;
	Wed, 11 Nov 2026 20:17:20 +0000
X-Mizu-Trace-ID: a3dd4c8d84a66b62
X-Migadu-Flow: FLOW_OUT
Date: Wed, 11 Nov 2026 20:17:20 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: lauserve@gmail.com
CC: akpm@linux-foundation.org, brauner@kernel.org, jannh@google.com,
 laurijssen@protonmail.com, linux-kernel@vger.kernel.org, pjw@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_add_utsname=5Fset=5Ffield_to_reu?=
 =?US-ASCII?Q?se_code_in_setdomainname_and_sethostname?=
In-Reply-To: <20261111073317.93929-1-laurijssen@protonmail.com>
Message-ID: <B9DD7F6A-A760-41D8-8809-D12F3F178326@linux.dev>
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

On 11 November 2026 07:33:17 GMT, Laurijssen <lauserve@gmail.com> wrote:
>Changes after review, cleanup of duplicated code in sethostname and
>setdomainname.
>
>- add static utsname_set_field sys.c
>- call utsname_set_field from sethostname/setdomainname
>- code compiles now when CONFIG_SYSCTL is not defined

This changelog seriously isn't great, like this description is absolutely
unmergable. Please read docs.

NAK.

>
>Signed-off-by: Laurijssen <laurijssen@protonmail.com>
>---
> kernel/sys.c | 53 ++++++++++++++++++++++++++--------------------------
> 1 file changed, 27 insertions(+), 26 deletions(-)
>
>diff --git a/kernel/sys.c b/kernel/sys.c
>index 755bfa5ccd92..77fedd127a3f 100644
>--- a/kernel/sys.c
>+++ b/kernel/sys.c
>@@ -1419,7 +1419,7 @@ SYSCALL_DEFINE1(olduname, struct oldold_utsname __user *, name)
> }
> #endif
> 
>-SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
>+static int utsname_set_field(char __user *name, int len, enum uts_proc proc)
> {
> 	int errno;
> 	char tmp[__NEW_UTS_LEN];
>@@ -1432,19 +1432,41 @@ SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
> 	errno = -EFAULT;
> 	if (!copy_from_user(tmp, name, len)) {
> 		struct new_utsname *u;
>+		char *field;
> 
> 		add_device_randomness(tmp, len);
> 		down_write(&uts_sem);
>+
> 		u = utsname();
>-		memcpy(u->nodename, tmp, len);
>-		memset(u->nodename + len, 0, sizeof(u->nodename) - len);
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
> 		errno = 0;
>-		uts_proc_notify(UTS_PROC_HOSTNAME);
>+		uts_proc_notify(proc);
> 		up_write(&uts_sem);
> 	}
> 	return errno;
> }
> 
>+SYSCALL_DEFINE2(sethostname, char __user *, name, int, len)
>+{
>+	return utsname_set_field(name, len, UTS_PROC_HOSTNAME);
>+}
>+
> #ifdef __ARCH_WANT_SYS_GETHOSTNAME
> 
> SYSCALL_DEFINE2(gethostname, char __user *, name, int, len)
>@@ -1475,28 +1497,7 @@ SYSCALL_DEFINE2(gethostname, char __user *, name, int, len)
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
>

--- Thanks!
