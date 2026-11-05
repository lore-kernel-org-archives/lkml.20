Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793838713;
	b=rdTLW9P0u0oD6nPCaQeL4JFgONUG1s63e5R5LJcrT3FGjYBbm3u4MmUb7cONDSGGxHAu
	 zvTthlEouaMTG8emMBcOawuIS50aSrX12dXOrENuCU3axXnBblILNkCXvofQg9D9UvD1l
	 r3fJc3gYFZYUFf7ApJ1xUlkfW9SS2iLyD30X7z7SfFOLL1OrYwdiSiZNnWF29SPlaUDTu
	 btaRcBk69oSHu2OswOkXGFFRXsjN9K/d3xu3N8wlv7ahmAxSxusCX7uXKm8d7OFZu+EaH
	 db3UmdkfAZK05bjIR2VHGC4InSHdzFpeKxGF2rnl7WnUDcuCXXLqRscdpFOmgVsnjNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838713;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xoz3voyt+WqTQ3cDULXr0zXhqbpHN0+5VdPzNta2SwY=;
	b=vX1ViFWSvJxPeunkVmMLGCv4hJgYaNPvs01ZSIsy4poaNj/mFu74wWhvSIJDWQ+IcDi1
	 PkUBx7hibqv0FBb4FOkbsCAh+NRry4dK43MBql9Kc+B3VG9LPM2PO/IjYVZ8r89SXSif9
	 AzjNJ3sHP2pQmTF0hODXa//C2rsUnadpE6y/jnkypvMWyvlc41fLkz59mjb0C0aVN5QXY
	 qjXhe8WTnktlMF9T+aGHfPJ1REs2rw4FYZ+Jf5g+GZXpGLSvoBtG+n5b3sbTkRg8JAlX5
	 JBA8T5E4EnI4Oyk5CCnc+uhP5Fg4MJJB35R7Ny0ylJmoRVuNzLz8DSPVgeNDurPIMlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=oKLRNbaj;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=IpV5YplR;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E31606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2E31606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=oKLRNbaj;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=IpV5YplR
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793838695; bh=xoz3voyt+WqTQ3cDULXr0zX
	hqbpHN0+5VdPzNta2SwY=; b=oKLRNbajrvRacpvJwW7cZe+9aq43Idbj1MbZg/XT0vR1xa9YZv
	Bi9bz3s0hZsbQZ8gkovmP2TtZdGiNXggnfZ1SQSQbmbrzasgXm6Bme2mmpndD8bxiJdnVDL/WMN
	Gvip7myhZYedjKcNyLUWdkNAkISCduG/vmlfJ7dsiV37NpCBXaBe3bGABoh3uT5IQtfHVeyK0J0
	1T58KFKoerQkqNcQ3UZOpTzCl3oQwPd2mDgSvxwJWI9eIJpNzumN10EFIFMs+gobjS+N3WhFp/5
	b2l5sUD6bvP4CUjK+2pCy5jYRqTRAXGJMWGh1d9b7j5pNA/Ojv+pW1pQPTolhuUfVQQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1793838695; bh=xoz3voyt+WqTQ3cDULXr0zX
	hqbpHN0+5VdPzNta2SwY=; b=IpV5YplRCpTZK4keygQPKYZ4yjZ3JtP6h7rOlwfqwRDHI9cUU2
	DekE/25FlQXSH1fJPthZtesSlil9VSWy2mCw==;
From: Bradley Morgan <brads@mainlining.org>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Bradley Morgan <brads@mainlining.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] futex: reject the unused PR_FUTEX_HASH arguments
Date: Thu,  5 Nov 2026 00:31:28 +0000
Message-ID: <20261105003129.3130709-3-brads@mainlining.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105003129.3130709-1-brads@mainlining.org>
References: <20261105003129.3130709-1-brads@mainlining.org>
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

PR_SET_MM, PR_SET_MDWE and the shadow stack cases all check that the
args they do not use are zero before doing anything.  PR_FUTEX_HASH is
the one that does not.  arg5 never even reaches futex_hash_prctl(), and
the GET_SLOTS branch never looks at arg3 or arg4, so
prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_GET_SLOTS, 1, 2, 3) hands back the
slot count.

Once an arg is ignored it is burned, whatever userspace sends there
today becomes part of the ABI and we can never use it for anything
without breaking whoever already passes garbage.  Take arg5 too and
reject the unused args per sub command, same as the neighbours do.

prctl() is variadic, so the two callers under tools/ leave those args as
whatever the register holds, they only work today because nothing was
checked.  The preceding patch in this series writes the zeros out first,
so this does not break them.

Fixes: 80367ad01d93 ("futex: Add basic infrastructure for local task local hash")
Signed-off-by: Bradley Morgan <brads@mainlining.org>
---
 include/linux/futex.h | 6 ++++--
 kernel/futex/core.c   | 7 +++++--
 kernel/sys.c          | 2 +-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/linux/futex.h b/include/linux/futex.h
index a895d8c69d663..70adc9fce6e63 100644
--- a/include/linux/futex.h
+++ b/include/linux/futex.h
@@ -80,7 +80,8 @@ void futex_exec_done(struct task_struct *tsk);
 
 long do_futex(u32 __user *uaddr, int op, u32 val, ktime_t *timeout,
 	      u32 __user *uaddr2, u32 val2, u32 val3);
-int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long arg4);
+int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long arg4,
+		     unsigned long arg5);
 
 #ifdef CONFIG_FUTEX_PRIVATE_HASH
 int futex_hash_allocate_default(void);
@@ -100,7 +101,8 @@ static inline long do_futex(u32 __user *uaddr, int op, u32 val, ktime_t *timeout
 {
 	return -EINVAL;
 }
-static inline int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long arg4)
+static inline int futex_hash_prctl(unsigned long arg2, unsigned long arg3,
+				   unsigned long arg4, unsigned long arg5)
 {
 	return -EINVAL;
 }
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index a240638f69e5c..eabf8abc2624b 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -2068,19 +2068,22 @@ void futex_mm_init(struct mm_struct *mm)
 	futex_robust_unlock_init_mm(&mm->futex);
 }
 
-int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long arg4)
+int futex_hash_prctl(unsigned long arg2, unsigned long arg3, unsigned long arg4,
+		     unsigned long arg5)
 {
 	unsigned int flags = FH_CUSTOM;
 	int ret;
 
 	switch (arg2) {
 	case PR_FUTEX_HASH_SET_SLOTS:
-		if (arg4)
+		if (arg4 || arg5)
 			return -EINVAL;
 		ret = futex_hash_allocate(arg3, flags);
 		break;
 
 	case PR_FUTEX_HASH_GET_SLOTS:
+		if (arg3 || arg4 || arg5)
+			return -EINVAL;
 		ret = futex_hash_get_slots();
 		break;
 
diff --git a/kernel/sys.c b/kernel/sys.c
index 755bfa5ccd92c..c4839c986f5e0 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -2885,7 +2885,7 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 		error = posixtimer_create_prctl(arg2);
 		break;
 	case PR_FUTEX_HASH:
-		error = futex_hash_prctl(arg2, arg3, arg4);
+		error = futex_hash_prctl(arg2, arg3, arg4, arg5);
 		break;
 	case PR_RSEQ_SLICE_EXTENSION:
 		if (arg4 || arg5)
-- 
2.53.0
