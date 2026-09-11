Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F40365A0F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137768; cv=none; b=V3fmMkCkAdaWPwzJo9w9jzOIjtqUjaH4RSLH43HICS9XJusj99brmViiQQrkmANTEmwyLbo1OQPrVvhju13Jusr8mLvz9DftpuopX0DJ3zc0gomyR5A3QJz77BNkSDzIfFgFPaqCI/ZYx9Z1gnYGkesE8veCB8/AIhzmAdkz+qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137768; c=relaxed/simple;
	bh=Q6gYJk+pvivEut4Dg9S1KYlKEBevCBrSEwCT14tMvuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S1dJd00vkvML97+msgT49qp90Bql7E3hg2VMdwcLE5OYJvkG38exRujrciIp0ePoh8HX4sGWVLj5wyOD2JWxO4dK0M3jmF0p1qa6M5poKH51EWytRxExGvyrDEsCmRpsg6bbjaMrxUs1cBr8KkCRHu8a9TecX/JPMPvNUMZzaew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b5syWAab; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b5syWAab"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd6185db7so6034385e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789137764; x=1789742564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6xq0BxW8kPi2a+1MlzTOWetcM4nnwrAPZoyBYnvLVM=;
        b=b5syWAabYfLW/JkamLeCwo12Ds0StLNJSUY639dt7/PEU/zeXEnHt1BG/56u3em7j/
         QbBuSSvhKFQimwQL5tycIRYUKhpy079ocqnMl2oUiWmvHqaF3I/BZTYGalvm5opiRKRJ
         fClUSQX4cnLSlHYJByehBH+NYN9Y4fNk4LFOyQaKajA3GlE69PnSOhDt3rKwiX1hp7zS
         QbQ1PKkqX7CeVUzqRDKNuAbhztGsSN9maJ2hKkU6pPAnQdaGUUMf69EYIFNfPDQmk7LK
         5duFJ96WYai4NazsmJ0Y2M1qoSbdFoZBMMxUuW20BI/PfHPKD5GE3XhGIOz60+FYUmaA
         fJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137764; x=1789742564;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6xq0BxW8kPi2a+1MlzTOWetcM4nnwrAPZoyBYnvLVM=;
        b=ei+SfVmQqPIoB02SZJrdxJ6/fxvMr6z4I+JbeZAp2ReP4wy9JAlhqVlf4D927yWe4+
         H0BwzllTd0aSPxphLOPLF2p0fSe9qFwdJ97KENNDBVwgLKOPPPyJVZQbnj/ClTJkceQ0
         v6isiXsSwUrvmPQFJ6cJFa1Vn2Caf4+5bB+VqwbEoKE/KQbbZUD72BLh27tAWZIKudZU
         Znwkssd5b+cgKPaUdRDgs3IoDt3sJAAaAkrIpYj2NK1FETlhGwlcQ11NVY9mY3AiHOsm
         ELUsXtnNnzIxkaMq0KO/XHABEgCNV3xfbSM10hV/vLZaCxDOpA9NL2/dXS7irNjexngQ
         WvXw==
X-Forwarded-Encrypted: i=1; AKwUvBxC8R2E0F+vkab/f/lp1GnubmBAHuiaV5B0/3BYSAFkfILY1RzWDWp4KvEQEuKkC1uUIjFqw5bX+UaS+ug=@vger.kernel.org
X-Gm-Message-State: AFuF++mmwFwTEk4ptwET4gJYbHQTCNatmTHUuwMaj2H1Vq2sdZkPKY2v
	5nz2VLaVqZrdy7kcoQW91abBhqo5vkPZYRZkNpd+jVsbm11OI2ij/jDLxDaZv/nW7LI=
X-Gm-Gg: AYBFou38DPiQsTS3RIwuHI7oPgvFwm+1xUul656LE419iMhnwAPn7oOBxRhPEjrimZ+
	jtpiisWeM/Y+pGoEzPVJB9q8QnX+/XD0RWrGEQijticgPGM8pm5ZUNyJoW1UlQvEBDCZGeMfz6v
	Xzm6ZpTFdu/A/UfpRyDa8liN3wfL4hP4UDmhqQHu3MGpp9uUgtWZyNQ/AB0NMIdKLyb5rZOHBu4
	aFUl5uGkNniYIiUU+5Byazullhtr6k6WtNyGTb3wljZutNIkuadNJjrIeBvaXw04OEbw5rrPuw3
	5+yS5jUY4NBAaovXXcNj0ahYkgieWda67n+RkM4hCxUt94V9nIlUwEnhkuk/lR0C0NUXjIm9B37
	DHf92h05ZWwmMV8eaKQQWJ786uG2NiXgISyBT60QsOKiowaV9vmLZWRshAMcibvGQdGu/X8KvQO
	ErkrQVOF9UROlPSTzjKUH+Br1deR6KCDrjXZC9eUNWwRAb+D3KAhZjUj2rg+qzx91JAaZcVGcMm
	00u9w==
X-Received: by 2002:a05:600c:4ece:b0:49c:f13e:e4c with SMTP id 5b1f17b1804b1-49e610829b5mr56105305e9.9.1789137763706;
        Fri, 11 Sep 2026 07:42:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60ababd5sm107038405e9.4.2026.09.11.07.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:42:43 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Xin Li <xin@zytor.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Aaron Tomlin <atomlin@atomlin.com>,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] x86: Avoid indirect includes through linux/module.h -> linux/elf.h
Date: Fri, 11 Sep 2026 16:40:31 +0200
Message-ID: <20260911-module-include-elf-v2-1-954c732975fb@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911-module-include-elf-v2-0-954c732975fb@suse.com>
References: <20260911-module-include-elf-v2-0-954c732975fb@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Several x86 files use ELF-related declarations and currently rely on them
being provided indirectly through linux/module.h -> linux/elf.h:

* arch/x86/entry/entry_fred.c: ia32_enabled() -> asm/ia32.h,
* arch/x86/entry/syscall_32.c: vdso32_image -> asm/vdso.h,
* arch/x86/kernel/cpu/intel.c: ELF_HWCAP2 -> asm/elf.h,
* arch/x86/kernel/fpu/xstate.c: elf_coredump_extra_notes_write(),
  elf_coredump_extra_notes_size(), NT_X86_XSAVE_LAYOUT, elf_note ->
  linux/elf.h,
* arch/x86/kernel/process.c: mmap_is_ia32() -> asm/elf.h,
* arch/x86/kernel/signal.c: get_sigframe_size() -> asm/elf.h.

Add the missing includes to these files in preparation for removing the
linux/elf.h include from linux/module.h.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 arch/x86/entry/entry_fred.c  | 1 +
 arch/x86/entry/syscall_32.c  | 1 +
 arch/x86/kernel/cpu/intel.c  | 1 +
 arch/x86/kernel/fpu/xstate.c | 2 +-
 arch/x86/kernel/process.c    | 1 +
 arch/x86/kernel/signal.c     | 1 +
 6 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/entry_fred.c b/arch/x86/entry/entry_fred.c
index fb3594ddf731..ea3bb4298065 100644
--- a/arch/x86/entry/entry_fred.c
+++ b/arch/x86/entry/entry_fred.c
@@ -9,6 +9,7 @@
 
 #include <asm/desc.h>
 #include <asm/fred.h>
+#include <asm/ia32.h>
 #include <asm/idtentry.h>
 #include <asm/syscall.h>
 #include <asm/trapnr.h>
diff --git a/arch/x86/entry/syscall_32.c b/arch/x86/entry/syscall_32.c
index 91123a90710c..4ace5b534f65 100644
--- a/arch/x86/entry/syscall_32.c
+++ b/arch/x86/entry/syscall_32.c
@@ -12,6 +12,7 @@
 #include <asm/traps.h>
 #include <asm/cpufeature.h>
 #include <asm/syscall.h>
+#include <asm/vdso.h>
 
 #ifdef CONFIG_IA32_EMULATION
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, compat)
diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index 4297ceb2cb24..7dd5a039186e 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -17,6 +17,7 @@
 #include <asm/cpufeature.h>
 #include <asm/cpu.h>
 #include <asm/cpuid/api.h>
+#include <asm/elf.h>
 #include <asm/hwcap2.h>
 #include <asm/intel-family.h>
 #include <asm/microcode.h>
diff --git a/arch/x86/kernel/fpu/xstate.c b/arch/x86/kernel/fpu/xstate.c
index a7b6524a9dea..8b90bf86a742 100644
--- a/arch/x86/kernel/fpu/xstate.c
+++ b/arch/x86/kernel/fpu/xstate.c
@@ -7,6 +7,7 @@
 #include <linux/bitops.h>
 #include <linux/compat.h>
 #include <linux/cpu.h>
+#include <linux/elf.h>
 #include <linux/mman.h>
 #include <linux/kvm_types.h>
 #include <linux/nospec.h>
@@ -26,7 +27,6 @@
 #include <asm/msr.h>
 #include <asm/tlbflush.h>
 #include <asm/prctl.h>
-#include <asm/elf.h>
 
 #include <uapi/asm/elf.h>
 
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 346c438ac880..e7f736b53f41 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -54,6 +54,7 @@
 #include <asm/mmu_context.h>
 #include <asm/msr.h>
 #include <asm/shstk.h>
+#include <asm/elf.h>
 
 #include "process.h"
 
diff --git a/arch/x86/kernel/signal.c b/arch/x86/kernel/signal.c
index 2404233336ab..0fe2d7a6b1af 100644
--- a/arch/x86/kernel/signal.c
+++ b/arch/x86/kernel/signal.c
@@ -29,6 +29,7 @@
 #include <linux/syscalls.h>
 #include <linux/rseq.h>
 
+#include <asm/elf.h>
 #include <asm/processor.h>
 #include <asm/ucontext.h>
 #include <asm/fpu/signal.h>

-- 
2.55.0
