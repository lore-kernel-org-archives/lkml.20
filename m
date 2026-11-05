Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892759;
	b=IvPxM1pLaHvX2m09dJv1ei2fQE5Yt4QpUa8UY50W5iy/k6NpEe1cIkAAazKdGJnx/kE2
	 NW/gZdyYdp0XTx/eUNVpIy90PBeiXRtNTh/lxbbg3wWAst8zTUE5H2+7A6lAo6bMbbql0
	 neyTeOJiPJ8UnM8BDiM9RK5Pbj5zRjlyUptCwZdjaZ8wzqyP1o4/MLU45yHPaMbiU8a6j
	 YO2Yjd79fDlks7w8a3aUC577CDX8M9oaKrtd+HscVa707IDuUjEjxw74lnQSeZPjGm13f
	 zavOjWIa9XZ+cCHfe9SjL/oHhhXb5hYq/gO8WGQI3CGxJbVg5PxCf0+zZn/jarKLOlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=W9QF5hbzUCYoZDZ3I7IciqT8HzBzhR7NbTf+LS8V6R0=;
	b=d5G9zyMF2PrewmaA/v0nBObZBdqJ9c2yr1IrTPSPGX0QUnjQnn8AxhMRvi8/M8P4sqMY
	 T92tg4Pu+HGvnDa9uSg7xcpdWopjfk0CJMY8yT+8uFeZdZ071MW4BYlieDAcWqpOuVZbs
	 NYSM33sCwcCXg+A0zNg5m9Ph3I7EHaYqz7XCY72spvyKarkrOU7EMr3wQ6RUfe83oBAWR
	 8/0ERgjyZe8RKJeshkLFrFm9V3wYLyxHBJ/NvoKQH0ZdbC4pvd+uILNnK7k4gY/EDBrrj
	 2E0cq+oJidvjKj2VOIPqolxWZpl9p1Ay7lBynTovTnnbiJr42UlyomVZXflH8kreltA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b="Q/hkGo+F";
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44D5606D81A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C44D5606D81A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Q/hkGo+F
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91e7c847aceso17745236d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892758; x=1794497558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W9QF5hbzUCYoZDZ3I7IciqT8HzBzhR7NbTf+LS8V6R0=;
        b=Q/hkGo+FK5cKEprDXG7FBBWS9aS4gHBhukF+1psbbcJ77e6k4918reYxOVHzeS5Vfq
         1MOIReUKeexIiqNY7SQxqBMRpqoty9OEdjrRco1KvPqbL7ClJF291haXjgTWIbCERlM8
         TGHu6uYrlFuSc23yhj/eTBcTV5VMKiTzDt+LzWbNKS7otLhngUMQEiWdL5vHHhGS8j2a
         5xARVuN27Mb6e9F5VVDMrSHLmWoAFIxs1TKAX5vNP7KY2JtOOeZ0LOW9ooW9y8zVzAa1
         VFGY4e9TsGjTZCNYbwWOS9qosHED51UXVYpbMG8LTde89jSicOEfJsHHIOpK5R1ecRz4
         kTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892758; x=1794497558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9QF5hbzUCYoZDZ3I7IciqT8HzBzhR7NbTf+LS8V6R0=;
        b=QTGR2ZrqMgiS2tKHv+2R8TTJVjWDjKnHuLTh+V9RVamKs+DVCGN4eacrYJl0bnMkYF
         oJ0d+6n4UiHYzZUfKGChmDemlrcVL3LoarPPL5VuqwbYn/h873kBP8dRAs6zYzgIml3K
         YvnmvZxIzpe+m0ulMB/zsh/JoEbg37LW5opevFL79q6c1qiX+cT8LdH/AmTjD1eoTx9V
         EDZ6X93TqLmW/O4w14gddJPvWr2Z/O+ibSJBwWG1npsp2d0vqQHPZRCRn+GA5JPnow48
         xy2LsJ2xfCivvbaD7Rf6NCuHeVLW5D60rIh887c9+YKoMHOMjPSXPb4IIxtvdjoB69k5
         upnQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5cqkPxARulwtYvdaVx689RL3S2TOBZDTgk/14Hp5nn4TlViAo/BsPtkaZ+x8rXI3HsbmtnIaDAnYgVCw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bHAO9jx+ruLu0n8O0Oz4F/lx3Llsqd6gbWirW3Z41wxcCDyO9
	MXk4TgUKby+jvZSKt3PenAI762NXej3KgWY+WYglq6HJs37WgqxGiKS7XFQ6UZ0j+r0=
X-Gm-Gg: AYBFou1BhrJQu+bYUygACKfocQhU8v+pq8/3roiA2XAgd9d+/sGBFAx6NXfFtEEma5c
	2Wb02JeIiukXiApagf5Mh9DOYMp/Ab9KON4LpejdSIht4Azvv9ouTCoXyc0VmpUWKD+7RE43NFX
	HslKEhnkE/MeeF+tRaNEJS0kff6IHGl1/oLAQaMnqjHqVcsNcwGhMhCgQeA1NATqCiDFFrEhYTm
	GhISxGXxNdvcu9H/vM02p+Vb7wjoLUqx9/kAXuSkfIFj04OEkiUKJG64j1pI9jrTVkRZV/7maoD
	+pySQ2dGg49Sx3izRxrOaHKyOpIHoHM5lV/40BZd/z++yDiI7pt5vDZ0FnL/d0bL9AJaWaezZ+X
	ccce04xwU4qaOMTkLrarx3+VV/CWl1troLloCIPlUxTE3XCnI3OCc3nlx4xzQMpLQGoBamyjIP7
	do0eRuqbK9lj+KdT8FoPJkmju/85NVy1nAhP9spAY2yGDm05Q1InBH/4+PPrlwgz0w3AtaHvLGR
	cI56+pBULhfOoQ+VURkVe0A7Cal/S/hQGks4I7ZYpXiS8/LTr4hONWX+MupwGgt5yxLq8BHd+Wq
	INepTvl1xkPQV7yOO+2qSRgggC4B2R47Qfo9NaU+qVOgxQ==
X-Received: by 2002:a05:6214:ca2:b0:91c:52f2:b469 with SMTP id 6a1803df08f44-91ca4b595aemr341157326d6.15.1793892757602;
        Thu, 05 Nov 2026 07:32:37 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dfe973bsm49909996d6.22.2026.11.05.07.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:32:35 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:20 +0000
Subject: [PATCH RFC v3 88/90] arch: wire up the cell system calls
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-88-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890936; l=5416;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=jGFSk6fF/gH1paSfT76+71kLQeCCUX/CemcF177XB5U=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDceqJ59WM96QNaMYpWM6bjN/hcsoqX2QXE2rKxYjPq41+78tc/rgyBLpTKfG6SAb5xj1ixN8cP
 +W5IiM9kgdAc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Wire up cell_create(), cell_configure(), cell_info(), cell_open(),
cell_kill() and pidfd_configure() on x86 and in the generic system call
table.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/entry/syscalls/syscall_32.tbl |  6 ++++++
 arch/x86/entry/syscalls/syscall_64.tbl |  6 ++++++
 include/linux/syscalls.h               | 14 ++++++++++++++
 include/uapi/asm-generic/unistd.h      | 15 ++++++++++++++-
 kernel/sys_ni.c                        |  6 ++++++
 scripts/syscall.tbl                    |  6 ++++++
 6 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/syscalls/syscall_32.tbl b/arch/x86/entry/syscalls/syscall_32.tbl
index 2c172ef48dfd..4ed6bf999b53 100644
--- a/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/arch/x86/entry/syscalls/syscall_32.tbl
@@ -478,3 +478,9 @@
 470	i386	listns			sys_listns
 471	i386	rseq_slice_yield	sys_rseq_slice_yield
 472	i386	fchroot			sys_fchroot
+473	i386	cell_create		sys_cell_create
+474	i386	cell_configure		sys_cell_configure
+475	i386	cell_info		sys_cell_info
+476	i386	cell_open		sys_cell_open
+477	i386	cell_kill		sys_cell_kill
+478	i386	pidfd_configure		sys_pidfd_configure
diff --git a/arch/x86/entry/syscalls/syscall_64.tbl b/arch/x86/entry/syscalls/syscall_64.tbl
index d5b6045b0090..bdf0c48b5682 100644
--- a/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/arch/x86/entry/syscalls/syscall_64.tbl
@@ -397,6 +397,12 @@
 470	common	listns			sys_listns
 471	common	rseq_slice_yield	sys_rseq_slice_yield
 472	common	fchroot			sys_fchroot
+473	common	cell_create		sys_cell_create
+474	common	cell_configure		sys_cell_configure
+475	common	cell_info		sys_cell_info
+476	common	cell_open		sys_cell_open
+477	common	cell_kill		sys_cell_kill
+478	common	pidfd_configure		sys_pidfd_configure
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 552d9710a0d5..f70bfe5b028b 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -77,6 +77,7 @@ struct cachestat;
 struct statmount;
 struct mnt_id_req;
 struct ns_id_req;
+struct cell_info;
 struct xattr_args;
 struct file_attr;
 
@@ -442,6 +443,19 @@ asmlinkage long sys_statmount(const struct mnt_id_req __user *req,
 asmlinkage long sys_listmount(const struct mnt_id_req __user *req,
 			      u64 __user *mnt_ids, size_t nr_mnt_ids,
 			      unsigned int flags);
+asmlinkage long sys_cell_create(int parent, unsigned int flags);
+asmlinkage long sys_cell_configure(int cfd, unsigned int cmd,
+				   const char __user *key,
+				   const void __user *value, int aux);
+asmlinkage long sys_cell_info(int cfd, struct cell_info __user *info,
+			      size_t size, unsigned int flags);
+asmlinkage long sys_cell_open(int cfd, unsigned int what,
+			      const char __user *key, const void __user *arg,
+			      unsigned int flags);
+asmlinkage long sys_cell_kill(int cfd, unsigned int flags);
+asmlinkage long sys_pidfd_configure(int pidfd, unsigned int cmd,
+				   const char __user *key,
+				   const void __user *value, int aux);
 asmlinkage long sys_listns(const struct ns_id_req __user *req,
 			   u64 __user *ns_ids, size_t nr_ns_ids,
 			   unsigned int flags);
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index 5b7e77a7c736..aa7bcaa8348f 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -867,8 +867,21 @@ __SYSCALL(__NR_rseq_slice_yield, sys_rseq_slice_yield)
 #define __NR_fchroot 472
 __SYSCALL(__NR_fchroot, sys_fchroot)
 
+#define __NR_cell_create 473
+__SYSCALL(__NR_cell_create, sys_cell_create)
+#define __NR_cell_configure 474
+__SYSCALL(__NR_cell_configure, sys_cell_configure)
+#define __NR_cell_info 475
+__SYSCALL(__NR_cell_info, sys_cell_info)
+#define __NR_cell_open 476
+__SYSCALL(__NR_cell_open, sys_cell_open)
+#define __NR_cell_kill 477
+__SYSCALL(__NR_cell_kill, sys_cell_kill)
+#define __NR_pidfd_configure 478
+__SYSCALL(__NR_pidfd_configure, sys_pidfd_configure)
+
 #undef __NR_syscalls
-#define __NR_syscalls 473
+#define __NR_syscalls 479
 
 /*
  * 32 bit systems traditionally used different
diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index c8be0abaa407..e0ff9a6909fb 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -167,6 +167,12 @@ COND_SYSCALL_COMPAT(keyctl);
 COND_SYSCALL(landlock_create_ruleset);
 COND_SYSCALL(landlock_add_rule);
 COND_SYSCALL(landlock_restrict_self);
+COND_SYSCALL(cell_create);
+COND_SYSCALL(cell_configure);
+COND_SYSCALL(cell_info);
+COND_SYSCALL(cell_open);
+COND_SYSCALL(cell_kill);
+COND_SYSCALL(pidfd_configure);
 COND_SYSCALL(fadvise64_64);
 COND_SYSCALL_COMPAT(fadvise64_64);
 COND_SYSCALL(lsm_get_self_attr);
diff --git a/scripts/syscall.tbl b/scripts/syscall.tbl
index 0ab531605120..cff7843e2677 100644
--- a/scripts/syscall.tbl
+++ b/scripts/syscall.tbl
@@ -413,3 +413,9 @@
 470	common	listns				sys_listns
 471	common	rseq_slice_yield		sys_rseq_slice_yield
 472	common	fchroot				sys_fchroot
+473	common	cell_create			sys_cell_create
+474	common	cell_configure			sys_cell_configure
+475	common	cell_info			sys_cell_info
+476	common	cell_open			sys_cell_open
+477	common	cell_kill			sys_cell_kill
+478	common	pidfd_configure			sys_pidfd_configure

-- 
2.55.0

