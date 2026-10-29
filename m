Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260218;
	b=KRGhLkok/14fJy1tVGCsaEv5G0SWBh7UzbgV0cR7hRctTLCXjmDey5Ei+Bb/z3yiYSFm
	 +roOfX4Q/lf8N7yNYa7sGjErMwPYrdlE255Ed5jA1fycPXo+XVi3BsHeqqeQm1w1mDsw0
	 cV53AJZPva559d4g59laXtyKYBFi/P5vUP3bSVWoTbm84yjvZMlDXJ678ocDDO+uYHU3/
	 dXGi9ommgwX+e9AmL7Nb54PQR5yDr7uY6xzTGCiWXhLNYOMCLdW3zjQgp5hGYiZBjj87r
	 5uEfmMyNkQUI3Hi0PFUgdM3uX5GnzZkHHsUPj9kp6e6KIXjTd1DRHSpXAHMKgpyVBOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7fLWyH+TvbQZVa2PMkKwnEQ/dwg0CGfLoj0eX15fQZI=;
	b=AQOe9Y0wp5UU4QxBMTYd07uNkcudVhrKn6EA98lDpN5am7B3WkAEl8UaTy2uHGOg1wwx
	 eFGcQiXeiE9MFTPRm9Nir0H371wJRRB9Lec8HpAKfZf0m79sCCCLmC77tT2p9CAYwzVao
	 Rsl35FpwVxlgyAuZeJp8Xw2/sf2rw+vVm/RQxAxsOjNG00LdmNyK3NqGj4HTl1yKcqQ8D
	 0w0tLGOHRGFKU9/LRHNwVxFLtof6GO/J0EfETYkMqkEk4DQ3oQLQdf3Y2Y35jCccHY4Ob
	 LqPCYsaNtMH/skBKyFPs2ioOVEdBg4EoWvbh75tmxFgS/WZMdm3kbZ0O8u4+pyfVmYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LYjcKrJj;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72334606A324
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72334606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LYjcKrJj
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ea0efd636dso14936345ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793260217; x=1793865017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7fLWyH+TvbQZVa2PMkKwnEQ/dwg0CGfLoj0eX15fQZI=;
        b=LYjcKrJjv0MKqf9FieilagKD4BewFfIHgi0zmBu/JRYtxmga+m7MT4jnmJHnqLg3KK
         Y2BUnGnZkWz5/TpeaFIel4PtpinATEwSGsb66FK+fXZwU3N87pXrM4QZHKKlNhUXDVzB
         na7xyUyv5BIuqygFHorcx49o2jOK2OcuwPi5um9zRSh80FesR5m13FT2AanqSEGspLWr
         ise2TlN4gsI5PGquGPq6cNmTikuzzXl99YlrDqAnBXp8gxvTZWhWCqcvGO0c+7Uj+aii
         /lty+Pm3ZTSo27u8E5e8WiVXzVnkHmWQa2VRhGH1bXhXrV/fLUujSMyDCB8qw5auf+2/
         Pllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260217; x=1793865017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7fLWyH+TvbQZVa2PMkKwnEQ/dwg0CGfLoj0eX15fQZI=;
        b=zZ/FrmjNqlHn6YOu4a1CUIUYeplR8zg+w4OE0t7CilIFIoaeMldi7ID34iqmns/yPk
         CvNcFvEI7QwVMxwADDQWd8oqQgvBuU04pbESOAKcxCnyhLj9iraSQG1qYaHXabmd2iPX
         9pFnvJndLoRPQT2aHh5F2XTgahb2yKDyICYy61Mr8hA318bGgv21vGUaUgGaxAMKdFGe
         2zvHLPMdrBep4uuoEwaopqnVG/QKG9FF8dC97GqpTfCAHD4IEvgE7pDlRPqm2ukWkV3w
         DTlCKjrujBZN4ZUYjcOIsKQMjoROefov7sYYGYY/LS/rp0gKq+NT3h9g20xEh+o2VLtO
         Qyzg==
X-Forwarded-Encrypted: i=1; AKwUvBxej4z7P9OiUp2o3GT9Ni7tht7kFNlozP/WqWI/uCXkZYTI5INpnr2xug5dJKgGvb2jzJ6Dy5ugOiw7n8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdhZ45ofcBJLdcF9cPt4+Ng0ie4i1DA0Wg1gznYZCcdILVd+4t
	hK1QnvjzCz5L0jlYUOOzROxt5M/1eKG77RiG4Xb6azJKfVdxmMOIUjpYU0vk38T2PiA=
X-Gm-Gg: AYBFou0BwkLYlS17gCF9o3f5SGpdraV+pSTBfyYtnkSoPurK88Ioakzt3U0ca2WOSly
	1t8xq9XhkNRMZ33QxFFkqomPO+wWZYwep71AOfsKP/pTiKrLx3Z18d7aecFdKsZEB4s/aVKDToB
	L5G2QXLoXcdXywRNRjVHznqkStpQizj3oDpfu4LHHgvXpo0QhuIWFzSC8QKIANAhwOG2+aK3egc
	ocfBc1byGELU8WMcJhSkDQMeCPsIvoA8RVZ8RJQYewO15QI3UTgjebixu1ThFX6aCispkJKCUGp
	+SmtTlCRac06RKmTS5GjsF8BONC+Mr7BhTli3f7XNzycpJ4mv9p/lUoyv3N2q1s0SPUv330Z+pT
	g3B6vTCeEyx0v5JOylvX9WUAJDGkfczyajcSOiE5zkZyZvp6ubhB9275dE5XZqUuXb5jrrl4r0E
	ErjuX63wrvo9KRUfOTQ/Pz3efKIxTk77QzXFXgrRCMWWNDyUPnFcldad09F4KWqkiw/8L2gA/V4
	99fKNY5O23DxNfK5427ZLz7PfNaIhXw+lw1QGcOC5Gi3Xz4T2snq6los7NWVC1JtFfGnloiDw48
	ZRMtMEcCci7GW3+sspg4PudczMu8vMB4UiJu2YdUbN3c2snatzpOW7T2z6gs+ZOy4xqM7KUiflM
	oI3Jl3Zk=
X-Received: by 2002:a17:902:e949:b0:2e6:dcce:8222 with SMTP id d9443c01a7336-2eb005fd704mr43443105ad.57.1793260216775;
        Thu, 29 Oct 2026 00:50:16 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bd60desm30598915ad.29.2026.10.29.00.50.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 00:50:16 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 05/11] riscv: mm: avoid enabling interrupts for nofault page faults
Date: Thu, 29 Oct 2026 15:48:47 +0800
Message-ID: <20261029074853.35467-6-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
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

RISC-V enables interrupts in handle_page_fault() before checking whether
the fault occurred with fault handling disabled. A nofault access from an
atomic context can therefore run tracepoints and open an interrupt window
before reaching the exception-table fixup.

Handle an exception-table entry before entering the generic fault path when
fault handling is disabled. Also keep interrupts disabled until such a
fault has been resolved.

On 32-bit RISC-V the vmalloc mapping must still be synchronised into the
current page table before that fixup runs: otherwise a nofault access to a
not-yet-synced vmalloc address would take the exception-table fixup and
fail spuriously instead of being resolved. Order the vmalloc
synchronisation ahead of the nofault fixup. That synchronisation only
copies an already-established kernel mapping, takes no locks and waits for
no I/O, so it is safe in the nofault path; if the mapping does not exist it
falls through to the existing no_context() error handling. This early
return skips the page-fault tracepoints, as before.

This makes RISC-V consistent with the expectation that an in-atomic
nofault access does not enter the normal fault-handling path. It also
removes one source of re-entry when perf sampling is delivered through an
SBI Supervisor Software Event (SSE).

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/mm/fault.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 04ed6f8acae..3934248f7a2 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -294,19 +294,23 @@ void handle_page_fault(struct pt_regs *regs)
 	if (kprobe_page_fault(regs, cause))
 		return;
 
-	if (user_mode(regs))
-		trace_page_fault_user(addr, regs, cause);
-	else
-		trace_page_fault_kernel(addr, regs, cause);
-
 	/*
 	 * Fault-in kernel-space virtual memory on-demand.
 	 * The 'reference' page table is init_mm.pgd.
 	 *
+	 * This only synchronises an already-established kernel vmalloc mapping
+	 * into the current page table; it neither allocates memory nor waits for
+	 * I/O, so it is safe in the nofault path. It must run before the
+	 * exception-table fixup below: otherwise a nofault access to a
+	 * not-yet-synced vmalloc address would take the fixup and fail
+	 * spuriously instead of being resolved. If the mapping does not exist,
+	 * vmalloc_fault() falls through to no_context() error handling.
+	 *
 	 * NOTE! We MUST NOT take any locks for this case. We may
 	 * be in an interrupt or a critical region, and should
 	 * only copy the information from the master page table,
-	 * nothing more.
+	 * nothing more. This path returns early and therefore skips the
+	 * trace_page_fault_*() tracepoints below.
 	 */
 	if ((!IS_ENABLED(CONFIG_MMU) || !IS_ENABLED(CONFIG_64BIT)) &&
 	    unlikely(addr >= VMALLOC_START && addr < VMALLOC_END)) {
@@ -314,8 +318,20 @@ void handle_page_fault(struct pt_regs *regs)
 		return;
 	}
 
-	/* Enable interrupts if they were enabled in the parent context. */
-	if (!regs_irqs_disabled(regs))
+	/*
+	 * Nofault accesses must be resolved through the exception table before
+	 * entering the generic fault path or enabling interrupts.
+	 */
+	if (unlikely(faulthandler_disabled()) && fixup_exception(regs))
+		return;
+
+	if (user_mode(regs))
+		trace_page_fault_user(addr, regs, cause);
+	else
+		trace_page_fault_kernel(addr, regs, cause);
+
+	/* Do not open an interrupt window before a nofault fixup completes. */
+	if (!regs_irqs_disabled(regs) && !faulthandler_disabled())
 		local_irq_enable();
 
 	/*
-- 
2.50.1 (Apple Git-155)

