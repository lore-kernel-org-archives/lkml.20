Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793445960;
	b=gsCXXmJF5hCWLTSe/EBql0nwyHMAHAvjy22LTKy2SsRPUxeHHl4+HIDIyDTlNYr5nEYl
	 RdJz6aDAUFv4Yh3M3hz93UVbf0YPpZb4ekUUYhyTyX1CKQh5U2a44V2YQxXIKmeFGBzES
	 08kT6EHf5VybsrDaYdSlIBgs3hbHBj6A3wc1R7dwZ4jNPO/nDoxbo9KHrsvm1bLdf0BgA
	 VIw/7i55eKJ3rtnN62OHiW+gGK5pP4okc9KQ+jfid9kXEMR+TTDXvywbc4m/ovy+iurl/
	 K+KshuqgsDwgNwVQg7x/sWCWT3FUQ2gTDhXwKkzKFhqvPZTowD56jITRwfJJb1vxYjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793445960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PESgDgsu2c/r7teZyzcuX13JwnUaa6gFmYdHHW0uCb8=;
	b=htzYMuK0oxt+krHO6tb1Zt6eDbzPwfAWHl46YRxdGt5Ln6xUhEQzkq/fRvuyT8XUUB5a
	 sB69YbJ/WyXfxtkcxvU1Ju00GzQRs0Bp0o8r3uAEWOKJpZgiP6ph0nyaeYhfA6VA6xXUU
	 CnAe/dhTNEYA0IR9oQPY6Gm0FQpoHSqKDvnmTFrYKrXegTrW79aHUl0sEe50lQjdmH4GI
	 P9TAjcj6Zsp2rpM8zCxJrXCxc9n1kDUUwdNcQcz/o98rq4LmV8hcI7ngQuGpMryEw/EO3
	 34ipvyqswmMYQTWyY5PfkZrcPGfvVN3ixudFLiDA2Hx3/Ly12QAk+/6GtphntC2tvpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RMERfyB7;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1944606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1944606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RMERfyB7
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso1682113e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 04:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793445958; x=1794050758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PESgDgsu2c/r7teZyzcuX13JwnUaa6gFmYdHHW0uCb8=;
        b=RMERfyB7G4wN2Uumo0wMro92YeRLH1pqPycKGCVHPHxIVuYoUXvPurxlSUNfErxPr5
         5R1//dfklBKfZUYg3kLEaBgTGNrxdqto7GP23P2Mr2V7dxFY6xQb33DJk5q4OnP4BpOv
         JPy2zD4pbzfPrwT8GyxMIy3hkZdc/jmjOxzLPTb6cnT3nhtAN2gL5i3RS2A6FKe/OZS8
         6ejJF2FfjqewncdsigxjIjIAk/hZq5S07OcbZlePAhMxphQHGRTolfVyRBdJ5JaPHEHS
         B0X1VH/HLl3VxP6OiT6W7xQXaX5al4zZVI4Q3AOIJ8HMIOXsPZcafOnmZwUt5ZoIjJjP
         4yjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793445958; x=1794050758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PESgDgsu2c/r7teZyzcuX13JwnUaa6gFmYdHHW0uCb8=;
        b=awh94yuqDv2A/eM4GWT06/TiyVjchAkyNBE6PG8aGqZEfGT750G10vxvEutNQrssto
         RHlouQtbzCfIlUGBKxjPWRZBwNyVF9Dm/LDbAnXqb+/eLijdAxeLlZvsNKFTGOcgAE2c
         mbz2pwLaQnuXsKOuTeSDQwRyK6OW00gfuw5kz1IXb62Ou/AAldnYkzMy/lV3UH2y6Msj
         I1Cwur1InYcJKoGQuupDSzxm14WvFPtc/k6YkeItra9JVu5fUnX6YI75Qd6P6IuI3BEr
         u9Mfal6+Ul4yDjGkzs1RjGE9wCxHAzdqUkYXaGkQiO27PdTfXWE8uqsyuU2yf0sUh7JO
         7G0Q==
X-Forwarded-Encrypted: i=1; AKwUvBziThF5sXKeEnXEIWsZ27OItGFhfII12SL3Yc+G+TR+aPG4ar81F6wnMTL4QdKypAajHkMg7iBRPBkcDqE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6uzajGZdnn+yCFsxw/Nj/AZsHhPA7hsaGitR/I81ZOxARSw2I
	FcVXnJHsLuBXYtDGT6OaFdjKfGIqUl1gUFTh063/6BqAeQudTM1V4NaK
X-Gm-Gg: AYBFou2iiieLbMB1G0+/UIG0CQMFcbO66FDeZv3mY7JvbxFgwC4Bn9D+eLUrJUic7YN
	5PKjmj+ZSu/8xTz+7x4vWiO8h74F/AQztEL2P9ZIDmjdnVqk/7ZX4hUaCChHhNp25DIKng9rQKW
	RdlT9AOE/HC13tQtpBaRuu94JOLSQTGwjxI7FcPq8MopFyUafP0PrGe+0+o6l3ymwWTcOTmgH7Y
	CRKaRMPQYB2ctgETsnk1QEqw60+mAFBsZJNpDG1JL4nCrMxPklsR2UZjrwekEIbYVLmMEnHkJqZ
	6pwjlbTDu7w3AFJLKryMztY/TjYLxo1APvm2WKMK3DxA37j7WW0F6Ocqo0af61cDGe7PbT1kMFg
	Wgbf+9CJTVp5AWfoynERWqXUPfcomzd41CCQNC0SM2nkGse0cIZLhKFq/3UhskOMWaHW/GkebsL
	bdNueRX/EwzSuPlAIoteedaVn03ObDHcsLmX/RCXjO1K4huuyg5CpplSw8ufhrTDdOgjFVOfMNv
	Xz2GKAOKggKMnxxqwd2hQh/R3ouSCoNurGj3ZzLGu8EJpWkzkPkuQcQ1HIKXzmtQUyvtxRISHVf
	k57GZNoB7XiZdx8FmWdcbc0=
X-Received: by 2002:a05:6512:3c96:b0:5bf:d54c:1fb6 with SMTP id 2adb3069b0e04-5bfd9574e70mr1601249e87.44.1793445957578;
        Sat, 31 Oct 2026 04:25:57 -0700 (PDT)
Received: from thinkpad ([92.36.11.130])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074802esm534853e87.73.2026.10.31.04.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 04:25:56 -0700 (PDT)
From: Andrey Zakharov <dedemorow@gmail.com>
To: dave.hansen@intel.com
Cc: x86@kernel.org,
	luto@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	peterz@infradead.org,
	kees@kernel.org,
	brgerst@gmail.com,
	pawan.kumar.gupta@linux.intel.com,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/entry/32: Harden return-to-user
Date: Sat, 31 Oct 2026 14:25:10 +0300
Message-ID: <20261031112510.105323-1-dedemorow@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <3d982c1c-4c97-4dbc-958a-4e71131c0020@intel.com>
References: <3d982c1c-4c97-4dbc-958a-4e71131c0020@intel.com>
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

Hi Dave,

Thanks for the pointers. I looked at the list in 4dab5fe58904 and at
kss-2026-10-23 (b6fa923e47fc). This is code reading and builds only: I
have no FRED hardware, so nothing below was run.

Build problems in kss-2026-10-23:

 - "make defconfig" (X86_CET=y via X86_KERNEL_IBT, X86_USER_SHADOW_STACK
   unset) fails in arch/x86/kernel/cet.c with gcc 16.2.1:
     :277 no previous prototype for 'kshstk_build'
     :330 redefinition of 'arch_kernel_stack_lock_current'
     :351 'struct thread_struct' has no member named 'kshstk_ssp'
     :351 implicit declaration of 'kshstk_enable_current'
   cet.c has no #ifdef, while the declarations in asm/shstk.h sit under
   CONFIG_X86_USER_SHADOW_STACK. Only cet.o was built for defconfig.
 - With USER and KERN shadow stacks both =y, vmlinux.o gets an objtool
   warning: kshstk_enable_current+0x3: call to kshstk_build() leaves
   .noinstr.text section (it is in .entry.text, kshstk_build is in .text).

A question: PUSH/POP_KERNEL_EVENT_SSP in entry_64_fred.S are under
CONFIG_X86_USER_SHADOW_STACK, but regs_set_return_ip() depends on
X86_FEATURE_KERN_SHSTK. With KERN=y and USER=n no slot would be pushed,
and regs_set_return_ip() would read the word below pt_regs. Should the
macros depend on X86_KERN_SHADOW_STACK? That config does not build
today, so this is from reading only.

Direct writes to regs->ip in kernel-event paths, as far as I read them
(as I understand it, ERETS compares the shadow stack LIP with RIP on the
regular stack; please correct me if that is wrong):

 - traps.c, handle_bug(): regs->ip += ud_len or = addr, so every handled
   WARN() goes through it.
 - alternative.c, FineIBT decoding (two places): regs->ip = *target.
 - text-patching.h, int3_emulate_jmp(), used by int3_emulate_call/ret;
   callers are in smp_text_poke_int3_handler() (ret, call, jmp, jcc).
   int3_emulate_push/pop only touch regs->sp and the regular stack.
   Emulation is reached from jump_label.c (JMP; NOP5 is emulated as
   JMP32+0), ftrace.c (CALL/JMP32) and static_call.c.
 - kgdb: kgdb_arch_set_pc(), the 'c'/'s' commands with an address,
   kgdb_skipexception(), and dbg_set_reg(), which memcpy()s into
   pt_regs (ip, cs, flags) through dbg_reg_def.

smp_text_poke_int3_handler() is noinstr and must not call out. cet.c has
no noinstr/notrace and is not removed from -pg in the Makefile, so
calling regs_set_return_ip() from there as it is looks unsafe.

I found no caller of arch_kernel_stack_lock_current() yet. If it ends up
before alternative_instructions(), int3_selftest() would run an emulated
call with shadow stacks on.

Not checked: runtime behaviour, whether these paths are reachable in
practice, other writers of regs->ip (tdx, vc-shared, mm/fault.c were not
read).

Thanks,
Andrey
