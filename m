Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674493;
	b=4B2lFO6dqjnLQ2KTEmKPBT30KbxUbxyAo4YxW36dlzc90FsiMnj+2vtrLwVSCsUY7e1U
	 a/tSDksZeLbX1LMUKxO0Gg4zoDhJHk9j/kcwLQN/ihhWAHHskrkbI7jTj2ZZjS6LDOI+N
	 Fymoa6aMU3wAB5bqLRpmGPYiRRiFRvSe1aycGuT66nMmikJWAszPStMUyeB3cfCg+gLry
	 CQbxT87/UpWRQFTjsMO49/Jte0GZmKP6236GW5Ui/B5b1W1LBYEBOTMXh5qpNTqyDTe5p
	 N0gwVOhsnpyheGoJFdF9Ng/xtzKglEsa++I89fRV4sORCjyyUE0p6uoC3TIo28bodGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qjmg1SjTs3atT2nn9WnBytEIpIW9LchwdehIjStPp4Y=;
	b=qDAxvC3fPFy2CHhr9zuBF2tcOx6xwP4ho161C/01ZGTQkLCObq0BxCoJCRBy4Upwm+rN
	 S95Vim0mDigIhjef10bTcMjJWqHKEaUuqnM6rPJIdvdp096bLcgb2254hl43DY/ocd4jk
	 WyNKEXJz1WIbZQ6k/s3gQpONLru18Ng1OxDU4hYCyw3/J1yPByjLHh+P3TuZURFPfxkis
	 bdiv07TzxMHdZSyK64lXdtHBF3TgXzK6bB/I9LJ9INbozwF2MAU+8yeplpN4+1/S0rdNP
	 Uuv9EKwaBQSpegMijkGq4DTztfI8RLfMYhB2aRNOUu0K4shszz5WuEfV9tbwg/EPz9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtntFBIf;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7286F606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7286F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dtntFBIf
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3551606c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674492; x=1794279292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qjmg1SjTs3atT2nn9WnBytEIpIW9LchwdehIjStPp4Y=;
        b=dtntFBIf+tvdIzW2rQriPPXnejCyrXyTE40uuzXpf0MErWx+C5J2xWWCI5kBNtwFt8
         6wAom3dDcPOLDG5jfdAlCp/1c0kv5RbrIvpDtMXFlzjEf2niDYxT5uiGgpA/MLZaPuIV
         4ySvi6uNzQGHEV2xi0ed2ahn9f3vUYSZ7ViIs3TDKBQM5XasEVbWcQIY/ZUFsDgrYmJn
         oYw/NO20JgDPK3B5M27f5ZLNiS21Ui3qwS68OENF0vhyOazEo/Do/kSO18J6PFhHVrzT
         UMbawFaqlExBCydfH1uPsIWGO2ycR3OVLl1kA9wGf1t73e7EFSxyRdD+P53zTdtnrf2E
         taAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674492; x=1794279292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjmg1SjTs3atT2nn9WnBytEIpIW9LchwdehIjStPp4Y=;
        b=WOfsh9uAlEcUuos123HWpJW2Q2USfJpceAXy2PGOx7pSABEd0bqAPGfL3P2tjkR7pm
         WcbCf/JbIh43NKu23KHN0sjHLo5vdBVTccXoNVKmgYaXx65zJwwgA7Ml9IC79NIBPgzY
         Z93Yf3HTNaABxIugkJfSSdKZej/9yPRmopGoK0tL6BS8HaFw3+vVtierPyF6YpmEgQFb
         931q8UuXppzKCwaXo5NRxPugTs+NjyK9/LCWYOujjK/crR1eDSOlvCgUDmumHMcP6ZZA
         PD1H7yNVNvGbs/fBtXgeBoa+UCwDZUzhyivnzcGRgVY2MBnuv1dlhnTKJvUKG1Qy2WdL
         0qcg==
X-Forwarded-Encrypted: i=1; AKwUvBz3LJxlUFVBMzBE08wcBbcSIxaKykSgVFoqSh3VZQ0CCCdgTPXt9jSVBexHgkvexVpKLMiifFb95xzc3BE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAZQhp1maYJvR66lqVniHlra1v28wczUm427L++nH5D56QgH9F
	PiKjB0sbNvgyUDznvjsBz8VlkRFmhychBMLE4EDBCDPo+TvNX7uZbJfj
X-Gm-Gg: AYBFou2TpIA5jPJEgCJXaQjy4k45baR8mK7nPDVKDo3mPr636lC5jmgCPoCzTAGfWyC
	DuWGa5zFMgKYGmj7QP/Y5HT2xCsOw893HFyTa9CORgjf5LFEuxN4gXIqs7FpicgA9c1mcPZzvOA
	1Tbup7Rq7aZ5eO/I7gsa+XUKVGf7UjshyvvpxGygSuoMEpb1zvsagqa+clfaFY32kuqk5U0rYiD
	zJ2gotNFpppIPC6o4/zp/WrXZ2SI9gMcThKYKnGOWqbO71BIlzylIIU1ytpkkez0+poajF61T5n
	QbTEY/kutLJe4aV4dyGdJJwoSPmTPQkBEhcjYWMJO3YbuhFVukClT1WEg2JpvtqXamqSuwvWpGp
	ON2xLL32EjvdeXGZ6P+gqAaQGf2BnDeyeIe6L7yoD4YPXJx3LMyBhWVPLJ3MqrVH+nYFlIknFrc
	uzI0bMsZrzv3SYKokGN5M/id5f7ybD5799xjPuZCjxJSo+DVNjky+8Xf6Hhdd7at5Aux2sdVWf3
	FheVuxmeS3DX8OichDw41NrkTkV7k8rQPenlOQ5les5nhe7uViHNrosB2VOLFeb1ZhCK4/shzAf
	/tjNrixSXVcDde60QaXOt9sO6hpXoz6KnQ==
X-Received: by 2002:a05:7022:5f02:b0:19a:51da:f54f with SMTP id a92af1059eb24-1ac5d88c584mr16916727c88.14.1793674492234;
        Mon, 02 Nov 2026 18:54:52 -0800 (PST)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1854da78sm49882356c88.6.2026.11.02.18.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:54:51 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	chleroy@kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org,
	Josef Schlehofer <pepe.schlehofer@gmail.com>
Subject: [PATCH] powerpc/code-patching: Flush the patch area TLB entry locally
Date: Tue,  3 Nov 2026 08:24:43 +0530
Message-Id: <b7916dadd8ef56d417d0cbf69fa9ef2a447a5a3e.1793674111.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
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

patching functions like patch_mem() and patch_instructions(), maps the
target page at the per-cpu text_poke_area, write it, clear the PTE and
then flushes the tlb using flush_tlb_kernel_range(), with interrupts
disabled. flush_tlb_kernel_range() on SMP nohash (e500) does an IPI
based TLB invalidation i.e -

	smp_call_function(do_flush_tlb_mm_ipi, NULL, 1);

...which will wait for other CPUs but with interrupts off. This can be
caught by lockdep with the following warning:

  WARNING: kernel/smp.c:917 at smp_call_function_many_cond+0x430/0x818, CPU#1: swapper/0/1
  CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.3.0-rc1-leds-v4 #1 PREEMPT
  Hardware name: Turris 1.1 e500v2 0x80211051 Freescale P2020
  Call Trace:
  [c1915bc0] [c001be04] flush_tlb_kernel_range+0x2c/0x74
  [c1915bd0] [c001ce2c] patch_instructions+0x1b0/0x318
  [c1915c20] [c003113c] bpf_arch_text_copy+0x5c/0xb4
  [c1915c40] [c01c3398] bpf_jit_binary_pack_finalize+0x28/0x8c
  [c1915c60] [c0031770] bpf_int_jit_compile+0x5dc/0x758
  ...
  [c1915dd0] [c102e114] ptp_classifier_init+0x30/0x4c
  [c1915df0] [c102d3a8] sock_init+0xc8/0xe4
  ...
  hardirqs last disabled at (3076): [<c001ceb4>] patch_instructions+0x238/0x318

Josef confirmed that this was causing a hang (deadlock):
    I think this is why the CZ.NIC Turris 1.1 hangs early in boot with
    CONFIG_JUMP_LABEL=y. On 6.18.44 it hung in 19 of 19 boots and booted
    fine 9 of 9 times with jump labels off. The hang comes while static
    keys are patched and modules are loaded, nothing is printed and the
    watchdog resets the board. OpenWrt keeps jump labels off on these
    boards for now.

...which is possible if both cpus are doing similar operations with interrupts
off and doing TLB invalidation using IPI.

Broadcast TLB invalidation is not needed here since text_poke_area is
a per-cpu area. It is mapped and unmapped with interrupts disabled by
it's own cpu. The only reason I think, if we would need a broadcast tlb
invalidate is, when we want to prevent a stray or malicious write to
this cpu text_poke_area by another CPU. This generally gets solved with
temporary-mm path like how Radix and even x86 implements. However, booke
doesn't implement that, so for now let's ensure we use local tlb
flushing for correctness.

Fixes: 49e3d8ea6248 ("powerpc/fsl_booke: Enable STRICT_KERNEL_RWX")
Cc: stable@vger.kernel.org
Reported-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Closes: https://lore.kernel.org/all/20261026195644.16384-1-pepe.schlehofer@gmail.com/
Tested-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/lib/code-patching.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 44ff9f684bef..6351342fa5c3 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -276,6 +276,23 @@ static int __do_patch_mem_mm(void *addr, unsigned long val, bool is_dword)
 	return err;
 }

+/*
+ * The patch area is per-CPU and only used by its own CPU, with IRQs
+ * disabled, so only the local TLB can hold an entry for it.
+ *
+ * On nohash SMP, flush_tlb_kernel_range() IPIs the other CPUs and waits, which
+ * must not be done with IRQs disabled (see smp_call_function_many_cond()), so
+ * flush just the local kernel (PID 0) entry.
+ * Book3S keeps flush_tlb_kernel_range() which doesn't IPI here.
+ */
+static void flush_patch_area(unsigned long addr)
+{
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
+		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
+	else
+		local_flush_tlb_page(NULL, addr);
+}
+
 static int __do_patch_mem(void *addr, unsigned long val, bool is_dword)
 {
 	int err;
@@ -296,7 +313,7 @@ static int __do_patch_mem(void *addr, unsigned long val, bool is_dword)
 	err = __patch_mem(addr, val, patch_addr, is_dword);

 	pte_clear(&init_mm, text_poke_addr, pte);
-	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
+	flush_patch_area(text_poke_addr);

 	return err;
 }
@@ -488,7 +505,7 @@ static int __do_patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat
 	err = __patch_instructions(patch_addr, code, len, repeat_instr);

 	pte_clear(&init_mm, text_poke_addr, pte);
-	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
+	flush_patch_area(text_poke_addr);

 	return err;
 }
--
2.39.5

