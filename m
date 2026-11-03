Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686082;
	b=Tqp5cZTBZ6rcpR3tpyqo/gTfhJjfEocmVlkRJCxxvbnRLoE6U9gMvXxhxjG4pV8VxjN7
	 8dsfruATpuxSXhDcvWPtde5VvzHVPBEIjt88j4w5GTHz6rqfIEMfsh+V+VLIt4afzkKTo
	 AADG0HYuR/59YW39MVyuIIkFOzD3ekqdfuq73X9L6VLsOhrvwGRV08m2B4PKu6NuGHDpK
	 DUxtwvL2l/SCpwz8swly22NMnFktP6rwO6i/l7FYkWyjVDwHH89xltTvS+l/APubnO8V0
	 hzk5au1kFSxZ+k0R6nh3bHRvZwiA3gpv/N0PWYekVIaj/gGwDcWQZVq+Sbw67//qaCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EqZFBFEZO5TSxtcO1rE9N6/Lrb9ZGXQ+yZtDiTgYOIA=;
	b=YB7sUTlgsgS2eBbGCRhFbIQZbSfxsqYlxGG9UIWz9LGftPdeLK1nasZblrFh95GvxpPY
	 YxzYwlanAg6g+ezNO0MV68kOph7dU/cju1GrD+vq+UnkQ70qJ9GDqiZF+fayfEdJd2ixo
	 SH6LJRvh2O2BSvSTaHj8RptuEmBPUV4dq6O+Gm2pJs7egamyyGuX6uTvJhLhzsF1wmLcE
	 NAJ44g/ARcPVkN8RW4inrCWeJKuWJnP5+H1Urtl3GNn9b/gDl2kXXadT9l1ma//Fr4r/2
	 J5dr1WzLqicEdekGTPrLrsDX+hxAvnMl8Y6XchOz3HFmhR6cEY9tSBYMCjhwhN+ACWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IynaLvmm;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FBE606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7FBE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IynaLvmm
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e0d885929so3005323f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793686080; x=1794290880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EqZFBFEZO5TSxtcO1rE9N6/Lrb9ZGXQ+yZtDiTgYOIA=;
        b=IynaLvmm8AyoydJlvlscvund15eOIxvoQHt4TeCsjuK1E4Ga2Zy6ojPs9ZzziUd9Ad
         WwITpXHJVXmKor+FHisR6Ea2Xqxunr6H0Tl5qfg4NpF2Bi2CwxGNBdlWb7F4L4nB8Pbp
         KsBlTmtQg/Ua3qOCfuHrntQbLn3O+voh61b3Mt2vhyM6ZFwV0uT4Iv3Z9lZBG1S/QltH
         yz83IhBrnUYxQ2CW4RVUaJD8nC/lxmk8E94oSbsvz1MGHn+Vf73OBItyHa+1fHJri0Zr
         rncHFvdw/pdU+E86G0/hP7Ci7YrJ9+GL5c2fg3cEtUI9M4iq+YztA9R5zZ56KEXycdX+
         rRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686080; x=1794290880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EqZFBFEZO5TSxtcO1rE9N6/Lrb9ZGXQ+yZtDiTgYOIA=;
        b=QAj4hhOhHa/T74AZEMdywvFFvTuuLSdGIen9vMIJDgrEpOmYaoLWvc6HR04xDLRyVw
         t4SsE2i/cBC+isoXSAdwPCyJ/tSc9aBY/bfmwQ8aCOpGCgESCmQnDy9tABvP3cSc4KMF
         T1l7tRqi/5y15r+Hl9yggAjjBRwrPFr15h4R3yuDHobjoe7jxr6ETQk8Izikayzz8D6X
         b0qpgqj+yo/LZfcBwuDUYmu27SQG3zAVyJhQs+AMLTsX9jXlsnKMGwXKnf8JvlzhDntI
         NNFr29d02X1eopPsWsp9rymis/JWo0YAz0ZYt5hjro6iUs7JHD/GyAIK0/VgpvQy9At0
         Ubtg==
X-Forwarded-Encrypted: i=1; AKwUvBwh/KAzoNAsJEx2GOb9ocCP1RW1NKu5UQUWipKmyC0nGgbBKVWM4lFJ+XJw3L2H0fZnSuDp4u+7XBB2V5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GShkrALa+Hn+6S258yoYW9L+OfDOe6jO2bB6xd6msSDkF1Hbm
	zwNjgp0ZfWG4CuwSR8P3VWkL5DmRUxJX8LOxJmONzaXTHYFawixy7mD2
X-Gm-Gg: AYBFou1+yCOEcGXT5kFUuMZ2udV3VfAGfHV2ajmODqKsynn1iRQRDjxDX887XqkNjVP
	cfv7MANeaDrcXdbs+i/fGl1K2R8IUqFBOddCPwVA6PpSA0c+Djh5MBIdLMJsLlKV4E+8vmA3Y78
	kdDbmKppu6NR6lZYeixU3piro1SUfCq4fKl8WsLBQJI2zXnAxyT4wsEBDxoApbSb5jyys8g77ZM
	R8/eq6ZiuPJQf11uYyRO1LLLx3JURuq488okgAvkoJS8z/F70bGqFrfC7Ib3Yuloipw1wNZdf3L
	ezZERGYcQGVBWFPTaYN5fiNfvuLwsowlKejPqimiKgkplX3VSpIdcMJbFZhLlBCGgIPcF2YsN7r
	MyPXlLg2Mq2Fsc8oFRWrpuuZQArvR7Ozum8W/xbSn/Rg8x7QD3ruPaY597GFoM/sdnKLicbjXpR
	SPWXIWUHySVGe2Ft9jRj1XnsZ5STxusmKKABgMrNc5DWN0Wlz8Xr8rcjUmnOQ7CbcZjhCJAZCMX
	0WHIwBxhjdi4Uhoz+cEcef4WJL+8bsEAwvizoMDedH4OVhgnc0mxee1fFypSUzDoJcN9ietJ5ep
	tQnScQjUqlRxalcSwbxdZ9a3JV1gMLmE0w7qzBJtc5MQ2q+OvhTgVUlIvfCtkIijhUxXcHQoi2O
	qjs9M/aedo5I=
X-Received: by 2002:a05:6000:4026:b0:48b:4a2:8175 with SMTP id ffacd0b85a97d-48e6e501911mr27129221f8f.43.1793686080145;
        Mon, 02 Nov 2026 22:08:00 -0800 (PST)
Received: from box (046124040162.public.t-mobile.at. [46.124.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm26072722f8f.6.2026.11.02.22.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:07:59 -0800 (PST)
From: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Martin Leitner-Ankerl <martin.ankerl@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andi Kleen <ak@linux.intel.com>,
	Youling Tang <youling.tang@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Youling Tang <tangyouling@kylinos.cn>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH] x86/cpu: Use prefetcht0 for prefetch() on 64-bit
Date: Tue,  3 Nov 2026 07:06:20 +0100
Message-ID: <20261103060658.696994-1-martin.ankerl@gmail.com>
X-Mailer: git-send-email 2.56.0
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

x86-64 does not define ARCH_HAS_PREFETCH, so prefetch() from
<linux/prefetch.h> is just __builtin_prefetch(). The kernel builds with
-mno-sse, and clang then drops __builtin_prefetch() without a warning,
while gcc emits prefetcht0. An x86-64 defconfig vmlinux has 8
prefetcht0 with clang 22.1.8, all from inline assembly, and 62 with gcc
16.2.1. Also prefetch_range() is empty on x86-64 with any compiler, it
needs ARCH_HAS_PREFETCH.

Give x86-64 its own prefetch(), a prefetcht0 in inline assembly, which
every x86-64 CPU has, and define ARCH_HAS_PREFETCH for 64-bit too. Not
the 32-bit alternative: it becomes prefetchnta on CPUs with SSE, a
non-temporal prefetch, which would change what gcc builds emit today.

Afterwards clang's vmlinux has 57 prefetcht0, the new ones in 34
functions, e.g. __blk_mq_alloc_requests(), prepend_path(),
__alloc_skb(), tcp_ack() and the receive paths of e1000, tg3, sky2,
r8169 and forcedeth. gcc's stay at 62. With gcc 16.2.1, prefetch_range()
adds 16 to hfi1's receive functions and 8 to scsi_debug, which a
defconfig does not build. Youling Tang proposed to define
ARCH_HAS_PREFETCH in <linux/prefetch.h> instead [1].

KVM guest with one CPU on a Ryzen 9 7950X at a fixed 4.5 GHz, clang
22.1.8, 6 boots per kernel in turns, ns per call, median (range):

                    before                 after
  io_uring IOPOLL   680.1 (679.6..684.6)   664.9 (663.1..668.4)   -2.3%
  getcwd()          912.9 (912.0..1019.4)  901.4 (900.1..907.3)   -1.3%

IOPOLL reads 4 KiB from null_blk, 32 per submit; getcwd() is 40
directories deep. Built with gcc, where both kernels have the same
prefetches, the two differ by +0.4% and 0.0%. pread() with O_DIRECT, UDP
and TCP over loopback, times() and clock_gettime() change no more than
that. Unfortunately the NIC receive paths need real hardware, so they
are not measured.

Fixes: ab483570a13b ("x86 & generic: change to __builtin_prefetch()")
Link: https://lore.kernel.org/20240529032059.899347-2-youling.tang@linux.dev/ # [1]
Cc: Youling Tang <tangyouling@kylinos.cn>
Cc: Nikolay Borisov <nik.borisov@suse.com>
Signed-off-by: Martin Leitner-Ankerl <martin.ankerl@gmail.com>
---

Notes:
    Code generation, testing, compiling, analysis, measurements, etc. were
    all driven by an AI agent (Claude Code). I have reviewed the results and
    supervised the process.

    A few minutes ago this went to the x86 maintainers only, without the
    lists, by mistake. Sorry for the duplicate.

 arch/x86/include/asm/processor.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 77488ff5eb8c..64748b8705e3 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -624,15 +624,25 @@ extern int			bootloader_version;
 extern char			ignore_fpu_irq;
 
 #define HAVE_ARCH_PICK_MMAP_LAYOUT 1
+#define ARCH_HAS_PREFETCH
 #define ARCH_HAS_PREFETCHW
 
 #ifdef CONFIG_X86_32
 # define BASE_PREFETCH		""
-# define ARCH_HAS_PREFETCH
 #else
 # define BASE_PREFETCH		"prefetcht0 %1"
 #endif
 
+#ifdef CONFIG_X86_64
+/*
+ * Every x86-64 CPU has prefetcht0. Not __builtin_prefetch(): the kernel
+ * builds with -mno-sse, and clang then drops the builtin without a warning.
+ */
+static inline void prefetch(const void *x)
+{
+	asm("prefetcht0 %0" : : "m" (*(const char *)x));
+}
+#else
 /*
  * Prefetch instructions for Pentium III (+) and AMD Athlon (+)
  *
@@ -645,6 +655,7 @@ static inline void prefetch(const void *x)
 			  X86_FEATURE_XMM,
 			  "m" (*(const char *)x));
 }
+#endif /* CONFIG_X86_64 */
 
 /*
  * 3dnow prefetch to get an exclusive cache line.

base-commit: 2305edc99ef7bbc11a8dcebf78853bc1b6a761bc
-- 
2.56.0

