Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F6E4A4840
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264180; cv=none; b=SB1D431ThUsIlaZFWGVCrzZBh2zoAPiQVI3oRrV6le7WYJxK0+WTNPDkDAzxmLtdaqckv6odJK/Alz+f0eKdphonxnq8yD9KdAmC/i3sjegzxJ1POifnGCV7V8YnRx7qGGJ96pkHyhe63IvWG3tRYZjBrkuCYRljKekpPdAGows=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264180; c=relaxed/simple;
	bh=mbW0//BGLoiGM7/KqsbbDvaT7TOxpU6dppbfGoucxow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dpdy/NyxTfJ6SDaZGjlQUUmBuoTDNR+A+yIve5DwHh2VCUoq4xT28FxpnVJoMUInZb+U4jhiaFgXM/sXtHIBaRUgJ3urPTlrq2IfNnyGDvNTNdpBnfdkCAc6uo9no1Z/h52ouNlF3R6qxo+XAnYfhqBQZU/h4DcC5ZDirnSB9q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlRL/1HX; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlRL/1HX"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-398cb5615deso5637a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790264176; x=1790868976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHq3kx/aITpUfp32gN2q1/ndjJiSSW3d7Xl6YJ8epP0=;
        b=BlRL/1HXN+A4/pJKj+B80qrYzHIElE72ZrJrS5RdcFfYkhTqCIdKhQwXBScJxm7tiK
         mKbgEcY5V5E5yV+FW8pzUb46ZCkySRGzoGeq6ZVX/tra8ncFRDwG7zhtlegPFuXXQCMB
         20ZGcoR118Pa0V33FuvsazajBsAJ16+1WGp/AfhcPVtUW47LHmYhc4EbgC2sdfzMT4VI
         jKU6UqRJ3DAQEWkg4G7+vUSDxrUwDweWzO05pOCIVuBCvAyRs0eMN5mfGrksjX8uArol
         hvxpXoAHzn3Pwe7F83zqiys8FlVEw3/Ot5I4czvX9qWOSpbDKFewvLtClo6sGVB3LIsk
         gSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790264176; x=1790868976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHq3kx/aITpUfp32gN2q1/ndjJiSSW3d7Xl6YJ8epP0=;
        b=MffyXqyXOGYCiMqOIEe4Rdf6XasUv34GpRYMYQ+vN9q3zt1UqVLJ07b3vP8znQYVXW
         DnhHj9YgOSqvjyhZLAQfd17LNsGkiLPXZZxfjG9vG0oS42uN4ru2qpW0p4mAKVeCGuxN
         IHJ5pwMWVLVdvvsvv91iMoHbaTlK72We0I1uTPJHuWsW0TpdnX+Nwf7R6kO8UyFTD590
         E7HZoTQ4lJQsq6c5oPVJkNgHi4dpsnY8TdHmlC957/3dYz5jeCqLv1X49JZH5tXjyjcP
         s7tksLpiWN5Fu4eoevntTiXUa4loccKfRtnoRhsVSegj+v7YJLAewW7DcpzsRnBrjrU6
         jbvQ==
X-Gm-Message-State: AFuF++kbi+yBqBNbYTu/vkPDYAMRDmaLCJEyrS39zukZ43Pau6aiKFwe
	4tgCFJyCyR5AVer+j46YrSTV3hlgZsvRpQe7zc7S1jhOrGCZyztZc9WbB41ObOyV
X-Gm-Gg: AYBFou1wRGPGTKkWQHQhmgDbs3u2WzPjsNOYiJZNQh5kteQku2FtwXOptYDnmrgX4Sg
	NTBA/1QKg8zZbfd3mGO8Xf1icRVwTXqgwHPCggu3yXEm46YmsjN9L6ursLsFCa8mD0S8LwE2/cD
	VIOaKkIe50BqpIrgmJ1b9iaLJZr6MgULMatmtfdv/ei8fWDQNJvfT8AWxwqNiI1rHQnJ642DEQq
	/LknYXA4+lq3OGZSXBNNDuyMTnl2qXaByQ51v3h+cJqlTynJFv/pTEKsV8o2N0yjXMnKsrl2Fiz
	tBC6mDlw/YVpZIQ51QAAs0B4j5rYZEwlSSXxfWRgfrEGtXhDQLhQi5VK7zWJJOvUsXO4GXc6x6k
	/rz7SkzGcE9UidAB6K0FfRZ81ZSvlqn0NzMcMfkYQo1hg9otXsikIzg9Rk1VxRpZd1WgY5o7PrA
	9DZeutlogm6DlsoDcwSQg+IZ8b/h1zifdak2BTN0dKV/vfGN6CfvpN/S9ziHmFBC473ExbLAM42
	y7mfLLJodCIfiEKI4O1
X-Received: by 2002:a17:90b:2751:b0:39e:5c8a:33b0 with SMTP id 98e67ed59e1d1-3a098fe8b26mr2240790a91.33.1790264175628;
        Thu, 24 Sep 2026 08:36:15 -0700 (PDT)
Received: from Modern-15.. ([223.225.63.228])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0972b11d4sm5979066a91.4.2026.09.24.08.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 08:36:15 -0700 (PDT)
From: mathura kumar <mathura.kumar.tech@gmail.com>
To: brauner@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	corbet@lwn.net,
	mathura.kumar.tech@gmail.com
Subject: [PATCH v4 3/4] IPC: Added system call entry in performance tool
Date: Thu, 24 Sep 2026 21:05:01 +0530
Message-ID: <20260924153505.620772-4-mathura.kumar.tech@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924153505.620772-1-mathura.kumar.tech@gmail.com>
References: <20260924153505.620772-1-mathura.kumar.tech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It include all the entries  made up in performance tools
for both new system call.

Signed-off-by: mathura kumar <mathura.kumar.tech@gmail.com>
---
 tools/include/uapi/asm-generic/unistd.h             | 8 +++++++-
 tools/perf/arch/alpha/entry/syscalls/syscall.tbl    | 4 ++++
 tools/perf/arch/arm/entry/syscalls/syscall.tbl      | 3 +++
 tools/perf/arch/arm64/entry/syscalls/syscall_32.tbl | 3 +++
 tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl | 2 ++
 tools/perf/arch/parisc/entry/syscalls/syscall.tbl   | 3 +++
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl  | 3 +++
 tools/perf/arch/s390/entry/syscalls/syscall.tbl     | 2 ++
 tools/perf/arch/sh/entry/syscalls/syscall.tbl       | 2 ++
 tools/perf/arch/sparc/entry/syscalls/syscall.tbl    | 2 ++
 tools/perf/arch/x86/entry/syscalls/syscall_32.tbl   | 2 ++
 tools/perf/arch/x86/entry/syscalls/syscall_64.tbl   | 2 ++
 tools/perf/arch/xtensa/entry/syscalls/syscall.tbl   | 2 ++
 tools/scripts/syscall.tbl                           | 2 ++
 14 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/tools/include/uapi/asm-generic/unistd.h b/tools/include/uapi/asm-generic/unistd.h
index a627acc8fb5f..b891edfebdf9 100644
--- a/tools/include/uapi/asm-generic/unistd.h
+++ b/tools/include/uapi/asm-generic/unistd.h
@@ -863,8 +863,14 @@ __SYSCALL(__NR_listns, sys_listns)
 #define __NR_rseq_slice_yield 471
 __SYSCALL(__NR_rseq_slice_yield, sys_rseq_slice_yield)
 
+#define __NR_mq_recvmmsg 472
+__SC_COMP(__NR_mq_recvmmsg, sys_mq_recvmmsg, compat_sys_mq_recvmmsg)
+
+#define __NR_mq_sendmmsg 473
+__SC_COMP(__NR_mq_sendmmsg, sys_mq_sendmmsg, compat_sys_mq_sendmmsg)
+
 #undef __NR_syscalls
-#define __NR_syscalls 472
+#define __NR_syscalls 474
 
 /*
  * 32 bit systems traditionally used different
diff --git a/tools/perf/arch/alpha/entry/syscalls/syscall.tbl b/tools/perf/arch/alpha/entry/syscalls/syscall.tbl
index 74720667fe09..44cb7657bd44 100644
--- a/tools/perf/arch/alpha/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/alpha/entry/syscalls/syscall.tbl
@@ -502,3 +502,7 @@
 570	common	lsm_set_self_attr		sys_lsm_set_self_attr
 571	common	lsm_list_modules		sys_lsm_list_modules
 572	common  mseal				sys_mseal
+# 573-581 are kept reserved for existing system call
+582	common	mq_recvmmsg			sys_mq_recvmmsg
+583	common	mq_sendmmsg			sys_mq_sendmmsg
+
diff --git a/tools/perf/arch/arm/entry/syscalls/syscall.tbl b/tools/perf/arch/arm/entry/syscalls/syscall.tbl
index 94351e22bfcf..714b3964e31c 100644
--- a/tools/perf/arch/arm/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/arm/entry/syscalls/syscall.tbl
@@ -486,3 +486,6 @@
 469	common	file_setattr			sys_file_setattr
 470	common	listns				sys_listns
 471	common	rseq_slice_yield		sys_rseq_slice_yield
+472	common	mq_recvmmsg			sys_mq_recvmmsg
+473	common	mq_sendmmsg			sys_mq_sendmmsg
+
diff --git a/tools/perf/arch/arm64/entry/syscalls/syscall_32.tbl b/tools/perf/arch/arm64/entry/syscalls/syscall_32.tbl
index 9a37930d4e26..3d408a842d07 100644
--- a/tools/perf/arch/arm64/entry/syscalls/syscall_32.tbl
+++ b/tools/perf/arch/arm64/entry/syscalls/syscall_32.tbl
@@ -474,3 +474,6 @@
 460	common	lsm_set_self_attr		sys_lsm_set_self_attr
 461	common	lsm_list_modules		sys_lsm_list_modules
 462	common	mseal				sys_mseal
+# 463-471 are kept reserved for existing system call
+472	common mq_recvmmsg			sys_mq_recvmmsg		compat_sys_mq_recvmmsg
+473	common mq_sendmmsg			sys_mq_sendmmsg		compat_sys_mq_sendmmsg
diff --git a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
index 630aab9e5425..de1000dff765 100644
--- a/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
+++ b/tools/perf/arch/mips/entry/syscalls/syscall_n64.tbl
@@ -386,3 +386,5 @@
 469	n64	file_setattr			sys_file_setattr
 470	n64	listns				sys_listns
 471	n64	rseq_slice_yield		sys_rseq_slice_yield
+472	n64	mq_recvmmsg			sys_mq_recvmmsg
+473	n64	mq_sendmmsg			sys_mq_sendmmsg
diff --git a/tools/perf/arch/parisc/entry/syscalls/syscall.tbl b/tools/perf/arch/parisc/entry/syscalls/syscall.tbl
index 66dc406b12e4..e1d442f17f25 100644
--- a/tools/perf/arch/parisc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/parisc/entry/syscalls/syscall.tbl
@@ -461,3 +461,6 @@
 460	common	lsm_set_self_attr		sys_lsm_set_self_attr
 461	common	lsm_list_modules		sys_lsm_list_modules
 462	common	mseal				sys_mseal
+472	common	mq_recvmmsg			sys_mq_recvmmsg		compat_sys_mq_recvmmsg
+473	common	mq_sendmmsg			sys_mq_sendmmsg		compat_sys_mq_sendmmsg
+
diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
index 4fcc7c58a105..4a9edd38da52 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
@@ -562,3 +562,6 @@
 469	common	file_setattr			sys_file_setattr
 470	common	listns				sys_listns
 471	nospu	rseq_slice_yield		sys_rseq_slice_yield
+472	common	mq_recvmmsg			sys_mq_recvmmsg		compat_sys_mq_recvmmsg
+473	common	mq_sendmmsg			sys_mq_sendmmsg		compat_sys_mq_sendmmsg
+
diff --git a/tools/perf/arch/s390/entry/syscalls/syscall.tbl b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
index 09a7ef04d979..eba3ed5b7576 100644
--- a/tools/perf/arch/s390/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/s390/entry/syscalls/syscall.tbl
@@ -398,3 +398,5 @@
 469	common	file_setattr			sys_file_setattr
 470	common	listns				sys_listns
 471	common	rseq_slice_yield		sys_rseq_slice_yield
+472	common	mq_recvmmsg			sys_mq_recvmmsg
+473	common	mq_sendmmsg			sys_mq_sendmmsg
diff --git a/tools/perf/arch/sh/entry/syscalls/syscall.tbl b/tools/perf/arch/sh/entry/syscalls/syscall.tbl
index 70b315cbe710..b14d8f4614c4 100644
--- a/tools/perf/arch/sh/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/sh/entry/syscalls/syscall.tbl
@@ -475,3 +475,5 @@
 469	common	file_setattr			sys_file_setattr
 470	common	listns				sys_listns
 471	common	rseq_slice_yield		sys_rseq_slice_yield
+472	common	mq_recvmmsg			sys_mq_recvmmsg
+473	common	mq_sendmmsg			sys_mq_sendmmsg
diff --git a/tools/perf/arch/sparc/entry/syscalls/syscall.tbl b/tools/perf/arch/sparc/entry/syscalls/syscall.tbl
index 7e71bf7fcd14..35ee3651e66c 100644
--- a/tools/perf/arch/sparc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/sparc/entry/syscalls/syscall.tbl
@@ -517,3 +517,5 @@
 469	common	file_setattr			sys_file_setattr
 470	common	listns				sys_listns
 471	common	rseq_slice_yield		sys_rseq_slice_yield
+472	common	mq_recvmmsg			sys_mq_recvmmsg		compat_sys_mq_recvmmsg
+473	common	mq_sendmmsg			sys_mq_sendmmsg		compat_sys_mq_sendmmsg
diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_32.tbl b/tools/perf/arch/x86/entry/syscalls/syscall_32.tbl
index f832ebd2d79b..b40cce591f20 100644
--- a/tools/perf/arch/x86/entry/syscalls/syscall_32.tbl
+++ b/tools/perf/arch/x86/entry/syscalls/syscall_32.tbl
@@ -477,3 +477,5 @@
 469	i386	file_setattr		sys_file_setattr
 470	i386	listns			sys_listns
 471	i386	rseq_slice_yield	sys_rseq_slice_yield
+472	i386	mq_recvmmsg		sys_mq_recvmmsg		compat_sys_mq_recvmmsg
+473	i386	mq_sendmmsg		sys_mq_sendmmsg		compat_sys_mq_sendmmsg
diff --git a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
index 524155d655da..c16fb5d613b2 100644
--- a/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
+++ b/tools/perf/arch/x86/entry/syscalls/syscall_64.tbl
@@ -396,6 +396,8 @@
 469	common	file_setattr		sys_file_setattr
 470	common	listns			sys_listns
 471	common	rseq_slice_yield	sys_rseq_slice_yield
+472	common	mq_recvmmsg		sys_mq_recvmmsg
+473	common	mq_sendmmsg		sys_mq_sendmmsg
 
 #
 # Due to a historical design error, certain syscalls are numbered differently
diff --git a/tools/perf/arch/xtensa/entry/syscalls/syscall.tbl b/tools/perf/arch/xtensa/entry/syscalls/syscall.tbl
index a9bca4e484de..377f27d70a65 100644
--- a/tools/perf/arch/xtensa/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/xtensa/entry/syscalls/syscall.tbl
@@ -442,3 +442,5 @@
 469	common	file_setattr			sys_file_setattr
 470	common	listns				sys_listns
 471	common	rseq_slice_yield		sys_rseq_slice_yield
+472	common	mq_recvmmsg			sys_mq_recvmmsg
+473	common	mq_sendmmsg			sys_mq_sendmmsg
diff --git a/tools/scripts/syscall.tbl b/tools/scripts/syscall.tbl
index 7a42b32b6577..8e50ab85b951 100644
--- a/tools/scripts/syscall.tbl
+++ b/tools/scripts/syscall.tbl
@@ -412,3 +412,5 @@
 469	common	file_setattr			sys_file_setattr
 470	common	listns				sys_listns
 471	common	rseq_slice_yield		sys_rseq_slice_yield
+472	common	mq_recvmmsg			sys_mq_recvmmsg		compat_sys_mq_recvmmsg
+473	common	mq_sendmmsg			sys_mq_sendmmsg		compat_sys_mq_sendmmsg
-- 
2.43.0

