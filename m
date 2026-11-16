Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794793342;
	b=U8CXFXpM8TQf44c6a/eRP+dk0fr80ReZ4gpAVDe3ktko9aDy4L0C4L/6SVp/KDHX09Ye
	 m7Veo6H+CgBL2di7zETkRX6aVj5z6nxzPH/o5tLKhGK/O17fG+LsooX6MNhGF4z8V3ePH
	 09Alz8IOd5BlolcA1Cq/KyFMN3J6+mfuz50SBilAo0i7RbdE2SNWW1tohXNGpF5Y8PqUF
	 3FL06HitLbDeCJA7PGzFamBWpLM5w4iu8KNwUT3cgmOmRDMOnov6fRtaG9edWz3KUKCEz
	 +Yy0KxZ8gWBTyZPVhqcEZIppBgFd8DfQFElMfO99CNEnjRrzyJ5+cxEY/m+ToJFdIaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794793342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8/gPUWQgBL4YpaUMj9IaoQs3NYT18BOp9IYonDJZev0=;
	b=kZMU+7CZxiGvyccKmMm5C5ww4ZgKe0D7KYABmCfAhkqkI1kqbo5f3g896rlAxBaEv0vV
	 V1GOtLtN3bLLe01j4pJSze/CsR4ach1YLjrRrSmxXZ8SpAdP5cBnOEsJvdW60Tc0cMTpI
	 vwkHlQh6ugUNKzytOaOou57s5f1LylAbA+EcA0teD9LU/+hFAtghHXCZcjPw8KsnLIQUf
	 s7T8h39n52HBHqPfh5B2Z1KZk4KhcYAsO65ettImpqdOFVJBczYaZLNHlhuUjA5xB5y1j
	 BtLWB8OFUl0iVx2krRUmHEoH2ZXLjwYe7DEsZsQD+P0F2dqeYNoWgvYGSKbgkm5Sy+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VTK6mp+t;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2D1606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F2D1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VTK6mp+t
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e10a70540so1529289f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794793340; x=1795398140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/gPUWQgBL4YpaUMj9IaoQs3NYT18BOp9IYonDJZev0=;
        b=VTK6mp+tpFSuXdi7YjleqCJglXkypHfOQ62H41qafcPNrwgmXRHtn3X8kEn4BXn5JG
         DdXpcliDlzl/yAoCy7FrFUgUyoa2ZLF71062DcuwqnmjgSIGl4mzENa1H4XyXDaQI5Sa
         oAIruFeVrW3QVZKNCCPRAm8dghAl9egUmlGrS6GDjBCBI8kk+aubNuX5zVivCgH9UFUb
         MSv7PD+BDw56sOxFNEa0aYv/vSiB9BI1/vTS0MPiweb4YyNQWjLn7Y8kGXKYTcevXHei
         tLD6donzmpZW5H5h0niCGrhWPYzpNwKwmWifj2Dki08S4eyun+w4QLzu9/zEQtxlDRze
         Btzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794793340; x=1795398140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/gPUWQgBL4YpaUMj9IaoQs3NYT18BOp9IYonDJZev0=;
        b=UreLloWhj4+YQWGRAeQ2qniX975Ec+af6CLGx1a3/5nMO3kUWDGPf+c6pQBxyQfIo7
         DCl0gaMxnOtBzDlOCb8cdaAcouRcsfDJxGlfssIbA+GNXHJjxkBU7PIqbJshhcx0GiMi
         81UW9RvFaxzMWj1Mzf8KDRd1gfhUTSG2Rk6W4R05wyn3DRMbj4Glx35lTEdIc9xdTO1H
         g6xtZJZ9ZflN1JP9dQSNUd80e2Uu9Pkz30k6WnU/cFHJkhCYgILmUECTpXmFycJRb0TA
         XK6akDmm2b1z3ZVFlWci6rGPXnVkqZp1+P8krRvYR51USZARBpQyXv3tNzj7FLIJcXfF
         sMwQ==
X-Forwarded-Encrypted: i=1; AL+hErHcAaaBtXUVs9e/vVHHPMoJCQ0Fyur6/dKIJ5QXv1pgMX0fclcEZWP3vRo8vOrCIivB36xnHlSVH8nTaxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UjIeKFl/6KwwtL1l2T6emdpejehZtf83FgoLwK64MyOaHMTtR
	nYAXT3XRF08hoa9wje2OeaHRU5Uy6iS65OS9IOI0kb89ZYvPZ0nCoH8cyD+o56au
X-Gm-Gg: AYBFou1m2LKnpYCfDXL8bP4FWF8R52Ft1g9+msDKUKcPorvfsh8+sKl08uVyvzMPNDN
	f71WS5tKACGQ5AguOxSC1QA0S6kbqg5Vy9nudGpZVO0R5Nh6pOkTsLfJlm/U8rlPVRHrC1uHc7q
	2znWv3gw4V9q46+6BKaSsElEO5zv+UuZ8oU63KVYRs9mVAe6x2R2OmCVuySAMzox/guu9c+HTrB
	W4KmcTQ9h1Shf6+26v3rp+M47Sc05KR6rSgzNJ6ENIGLMXu3auyvbrSMj9rXTtNAyGUd3RX59B0
	jhhs8LJ7usUNsbMm+0kMcu3Jf7wNpaYwrzR8Of4YULHI8q6xYTOg9cfSp9HYVO+8Nj/beBPKZrA
	1+AnAO7DkajMpkEZVRvpZJlnpIoWziZ9INjKsMys29gXkZfiDpuTo+K2G80+HEfPHrF/iIlISrU
	B3mWOxTmFyZN8q+ui/bOh3l+7V67aY5QEHUJykgkyTdLJwqXSX62C6NODFy3sQd/uDOUWHkFVPB
	Uqg//nlzpsfoSSxd8KTUHheiwcO4Op0OjreT2cYCi2ZSGsenXDH7vfo1G0koBCqmSQ4Cojr+L7F
	c9TOGXLZGLXmy2tA9WE83vKpVINnMsX/Ut/F977M7B/vCDbgNW0bpSioT6b4fzjgA0YVwnqhWDb
	+GZPnDQJCFFsjF9TgwAoekiUY4+i6Rl5zL/U+cbkxofLhWG648p1xQxlitzAcurjfJMvoKb7xoM
	/IeIlxW7Wyz/OBOK3dBDH5CxE=
X-Received: by 2002:a05:6000:46c4:b0:491:286f:8e63 with SMTP id ffacd0b85a97d-49c731648a8mr11496375f8f.14.1794793339534;
        Sun, 15 Nov 2026 17:42:19 -0800 (PST)
Received: from DESKTOP-D7IGS5L.localdomain (123.20.61.94.rev.vodafone.pt. [94.61.20.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c81a63b1csm18342616f8f.4.2026.11.15.17.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 17:42:19 -0800 (PST)
From: Marco Martins <marcomartins86@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: kexec: Sync the instruction cache with the copied kernel
Date: Mon, 16 Nov 2026 01:42:07 +0000
Message-ID: <20261116014207.3112156-1-marcomartins86@gmail.com>
X-Mailer: git-send-email 2.53.0
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

machine_kexec() writes back and invalidates the caches with
__flush_cache_all() and then calls kexec_reboot(), which still runs
set_cpu_online() and local_flush_icache_range() before it jumps to the
relocation code, so their lines stay valid in the instruction cache.
relocate_new_kernel() then copies the new kernel over the old one
through the data cache and jumps to it without writing the copy back
or invalidating the instruction cache, except on Octeon. Where both
kernels have code at the same address, the new kernel can run stale
instructions of the old one.

The new kernel calls set_cpu_online() in boot_cpu_init(), before it
prints anything, and hangs there when its copy sits at a different
address than the old kernel's. On an MT7620A (24KEc), a kexec from a
kernel with set_cpu_online() at 0x8002bb5c into one with it at
0x8002bb7c hung in all 5 tries; with this change in the old kernel,
the new one booted in all 4.

On R2 and later, SYNCI each copied page, which writes it back from the
data cache and drops it from the instruction cache, and jump to the new
kernel with JR.HB. Octeon keeps its own SYNCI of the whole instruction
cache.

The bug was found, and this patch and its description written, with an
AI coding assistant (Claude Code, model Claude Opus 5.5), asked to find
why images started with kexec on an MT7620A board sometimes hung. It
bisected the new kernel's boot with reset probes patched into the
image, and ran the tests on the board.

Fixes: 62cac480f33f ("MIPS: kexec: Make a framework for both jumping and halting on nonboot CPUs")
Cc: stable@vger.kernel.org
Signed-off-by: Marco Martins <marcomartins86@gmail.com>
---
Tested on a TP-Link TL-WPA7510 v2 (MT7620A, MIPS 24KEc, single core)
with OpenWrt's 6.18.60 kernel. relocate_kernel.S and machine_kexec.c are
the same in 6.18.60 and v7.4-rc3, but OpenWrt adds a patch of its own to
both (command line arguments for the new kernel). The board runs this
change on top of that patch, in a form that assembles to the same
machine code. The 5 hangs and 4 boots above are from November 13;
without a serial console, a hang showed as the watchdog resetting the
board, as the kernel was booted with watchdog.stop_on_reboot=0. Since
then the board has run the change, and on November 15 alone kexec
started kernels laid out differently from the running one more than 30
times, all of which booted.

Built only in that 6.18.60 tree, with the board's configuration. Not
tested: SMP, where the other CPUs also jump into the new kernel, from
kexec_smp_wait; 64-bit; R6; Octeon.

 arch/mips/kernel/relocate_kernel.S | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/relocate_kernel.S b/arch/mips/kernel/relocate_kernel.S
index de894a0..e3cae10 100644
--- a/arch/mips/kernel/relocate_kernel.S
+++ b/arch/mips/kernel/relocate_kernel.S
@@ -64,8 +64,25 @@ copy_word:
 	PTR_ADDIU	s4, s4, SZREG
 	PTR_ADDIU	s2, s2, SZREG
 	LONG_ADDIU	s6, s6, -1
-	beq		s6, zero, process_entry
+	beq		s6, zero, 2f
 	b		copy_word
+2:
+#if MIPS_ISA_REV >= 2 && !defined(CONFIG_CPU_CAVIUM_OCTEON)
+	/*
+	 * The old kernel's code may still be in the I-cache at this page's
+	 * address: write the page back from the D-cache and drop it from
+	 * the I-cache.
+	 */
+	rdhwr		t0, $1
+	beqz		t0, process_entry
+	li		t1, (1 << _PAGE_SHIFT)
+	PTR_SUBU	t1, s4, t1
+3:	synci		0(t1)
+	PTR_ADDU	t1, t1, t0
+	sltu		t2, t1, s4
+	bnez		t2, 3b
+#endif
+	b		process_entry
 
 done:
 #ifdef CONFIG_SMP
@@ -96,7 +113,11 @@ done:
 	sync
 #endif
 	/* jump to kexec_start_address */
+#if MIPS_ISA_REV >= 2
+	jr.hb		s1
+#else
 	j		s1
+#endif
 	END(relocate_new_kernel)
 
 #ifdef CONFIG_SMP

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.53.0

