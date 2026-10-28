Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793150406;
	b=U9aZXGYdxt7rPRalFRR1heW8Uj05pg3pU+e23Ojpsrh8GhGgFH6YgLt6imzCcR2jxeX0
	 OHdrYyja1MIiGrDlWMpfi4mN3SjZFwrBIwQDs1Bntcmca4nk7ygk4YXA5xNmDdE+xv4hH
	 KiJu3CQx31vs9YDwi6SdLyx1jkt8/6mmvE7tFDNKb1w8m2kKnRzzCOuw77NfxHNXIgDQO
	 /ZwZjGJbL2DtxNuQsmyt1uc8894eVoo+KXAwTL0+aY/27O9EVwpbAZ/0qbUquSOCKDJiU
	 L9Hl5x8PFhSnLyxxBYYhjxC+lDAL7oDHkGS9HacRF8WDNVC1ZRkKttbO6DU2owkm/uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793150406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aLduANwv1S0zzwppHfmO8Zkbjseh7UvsZ5j1k5QDDg4=;
	b=N7MlvyzJWiURx5B4p6OVIBG1KGZeCDiGC3M+nG0zK9/8YOTK/RTUILQvj/xBBQBl6rSQ
	 gE3jMyIiviEzh6FVTvmrKeBDqAQ7UemzcC1JxZmMEN60kLamKwkgPqbmxxQWzxYf4vZ/v
	 45Rg0Hq8D+l4+r4J1hcOW839T76tRNtvWH7G4KVWFIgKC2dZ6Hb+FTUckR08kIi6GgDLm
	 kOlAM1PUNJeYA7/Y3p1H/g9WiMBzbzb3uo2J2BUGb+QS0fomYEK2Bcakfiq7uGXGsTptW
	 HI0STiIJ12KMnL+4gMmXbdTnJs3hQzxCR3kPOg1eq92vcUi1d+jCwIvrmoWEXWfJV8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYuptatW;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C1B606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44C1B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYuptatW
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a058f74a54so223874b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 18:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793150405; x=1793755205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aLduANwv1S0zzwppHfmO8Zkbjseh7UvsZ5j1k5QDDg4=;
        b=cYuptatWk3AIwuv9NVY3j83Ne4A61NfgI8j3FYTY6xXx/cFjxGfsLVtWCjrLpzKhWp
         25pnxHwRFPtQANPLPSGH6YnFdmPfUI1ByFIlZWoMnzHMztZ/lVvNe2lFch8ihM/BdsN6
         FNlOmF2TkRk+aBvX4uxxQfIaYJXgRnzmG2F5ajawitg5FWu9W7dR7yTKR7GC+WqhGEZT
         ETGOsO4n+ZVDpYbADgdtN5+dXKuTPl6KIeqfT6ijS9xdocn4JqhBpSZVnQixv+DE98XD
         ARMp0gSsgVtXbopws1pGy8qq5vbCPhsXYbXHbbAywwhPtySTAYQULmVzvZ3pHY3rdMA8
         oJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793150405; x=1793755205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aLduANwv1S0zzwppHfmO8Zkbjseh7UvsZ5j1k5QDDg4=;
        b=MXDIRoMzFDM6MUyBdU1xGndi1i76rV068l+DUZvD5BEx3mJSf1loxr3UYwuLuUkDKs
         i9faWgLTyFIOL8D/B02gtQkWAutMx8tqkPCEpeBt0//x0MVm0qwAT3ilfkHF061lvCbV
         YLLpGy4tnLQISxYAEiBgBpnC7YLlA3cgjT3lnIcM1nAmxfe4Rxqa3CEtudBycq1MkM0Q
         wsfy1TLVi524+JC3+999C3i5SVISq+4HUZyRmuNjLubZ4c2A4KSkomfMiySMWc71H6KV
         4LudvAjz55NCmL5se2QwsZbI2PQ9KgzrTtM8T4f5rI6aR7miA62QLjDcLfECPFqXOHFt
         3RLg==
X-Forwarded-Encrypted: i=1; AKwUvBwE2qwR5v4owAdMG/ess8Ih6ykBNu5je2xys57u3KnCod5bmHi587dbgphqKim89thuuS9V51kvUuDI7u4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxXCO6cBTYvk8fldLFKAU7dp4SiPvOdvvLYwQSQ+/e/5ugGksO
	AYyt36EAShoH/p7LuLvoILT8Ylmn3CJlT94Cekjeo11IJO58hnbL+Kci
X-Gm-Gg: AYBFou3HpWCxjcSpD/F1uAf5trwi6Iaa11Z/6OhKb36zvIeVIi8zFBzvtxfinlpsot6
	2FYmzAQcRVgU0xDZJlCzYQ8aS3s9Z7SDP9Ixx7IJXgO7A5FMi3xnCNSCIDWIolJrqPWlLjl8r6i
	Ic2mEdaDVqRWZ8IImZ7v+78dxwxySPYOh1wg2O6FSaap4/z/G4HUFMm4wtqC9DhQiOeZzA91AoT
	+t3zaYeVz/Bm1OcK6SNNIlvbxdh6SDK9vQbSAWiQIO+6FoSyVyU81XZLBit5gF8Uy2vUiihV3xs
	SZvplUbwkwZXDwd3BSe/lV60Y2qoXN0ut68TPKzE2LaWA2NrwrT0+BjLeqd681upMNbuiOj8tpg
	pws1ERJk0kpZfx8j6O0p8XWSLilfJzJnkX8+aVVDz0Ip2XlLeTrv/wqH2w4w5YLw5geo0Iu7ioc
	3f7zdoUK4u9j2cL+Szl8IsVI4AowXmK2Z9eHDny0uk2BfAdost5nFMxTlpcpkdPAJVeByDWsYsh
	NnNJ3kuCQ9vZEB6vTTJZoO/g8+ksr5brnVqIB7uEmcPAPHysbZ3eNUnF7pfsnaC6nMeRYcW2C6t
	zN3SHf8mLRC2+YCY2oXlnnUcpOgsopRgXKNacpRp7trBLNYWmQ==
X-Received: by 2002:a05:6300:49c:b0:3dd:a197:735a with SMTP id adf61e73a8af0-3e902392eddmr613544637.51.1793150405474;
        Tue, 27 Oct 2026 18:20:05 -0700 (PDT)
Received: from localhost ([182.216.53.174])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc8f97esm3272997a12.19.2026.10.27.18.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:20:04 -0700 (PDT)
From: Jaewon Jung <jaewon8868@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <shuah@kernel.org>
Cc: stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2] selftests/ftrace: Add missing spaces after ! in probe syntax tests
Date: Wed, 28 Oct 2026 10:18:49 +0900
Message-ID: <20261028011923.2050009-1-jaewon8868@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025075044.1750113-1-jaewon8868@gmail.com>
References: <20261025075044.1750113-1-jaewon8868@gmail.com>
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

Add the missing space between ! and grep. Otherwise, the shell tries
to run !grep and reports "!grep: not found". This always skips the
conditional checks without checking for kernel return probe argument
support.

Fixes: 25f00e40ce79 ("tracing/probes: Support $argN in return probe (kprobe and fprobe)")
Cc: stable@vger.kernel.org
Signed-off-by: Jaewon Jung <jaewon8868@gmail.com>
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
Changes in v2:
- Add Fixes, Cc stable and Acked-by tags as suggested by Masami.

 .../selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc  | 4 ++--
 .../selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc
index 384209968325..70751573e8de 100644
--- a/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc
+++ b/tools/testing/selftests/ftrace/test.d/dynevent/fprobe_syntax_errors.tc
@@ -33,7 +33,7 @@ check_error 'f vfs_read ^$stack10000'	# BAD_STACK_NUM
 
 check_error 'f vfs_read ^$arg10000'	# BAD_ARG_NUM
 
-if !grep -q 'kernel return probes support:' README; then
+if ! grep -q 'kernel return probes support:' README; then
 check_error 'f vfs_read $retval ^$arg1' # BAD_VAR
 fi
 check_error 'f vfs_read ^$none_var'	# BAD_VAR
@@ -100,7 +100,7 @@ if grep -q "<argname>" README; then
 check_error 'f vfs_read args=^$arg*'		# BAD_VAR_ARGS
 check_error 'f vfs_read +0(^$arg*)'		# BAD_VAR_ARGS
 check_error 'f vfs_read $arg* ^$arg*'		# DOUBLE_ARGS
-if !grep -q 'kernel return probes support:' README; then
+if ! grep -q 'kernel return probes support:' README; then
 check_error 'f vfs_read%return ^$arg*'		# NOFENTRY_ARGS
 fi
 check_error 'f vfs_read ^hoge'			# NO_BTFARG
diff --git a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
index b0e6b80ccb01..06efa67e01ff 100644
--- a/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
+++ b/tools/testing/selftests/ftrace/test.d/kprobe/kprobe_syntax_errors.tc
@@ -108,7 +108,7 @@ if grep -q "<argname>" README; then
 check_error 'p vfs_read args=^$arg*'		# BAD_VAR_ARGS
 check_error 'p vfs_read +0(^$arg*)'		# BAD_VAR_ARGS
 check_error 'p vfs_read $arg* ^$arg*'		# DOUBLE_ARGS
-if !grep -q 'kernel return probes support:' README; then
+if ! grep -q 'kernel return probes support:' README; then
 check_error 'r vfs_read ^$arg*'			# NOFENTRY_ARGS
 fi
 check_error 'p vfs_read+20 ^$arg*'		# NOFENTRY_ARGS
-- 
2.43.0

