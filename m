Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792612308;
	b=bQehw4PdFeTdrubOxZM53bv1MQJOZi/KMxfNbr78trgbiGoo1f40EFXbftMyWtiRuY8K
	 WhOxpVgAfUh3W2evwZsUP9YqRZ7vLy4v6pggi8ZGP/97KNg0MlYPbGhfSM4SilaajLKQi
	 jErobUx+6WI+cIGB2nzi+lr02DVYm+/yDBC3cQNwvGPT1d5aXSSPn5liAQsuN6CpJj3k5
	 BwA3vBGiobF0+bEvS+se5MP9Dp+En2vbEohdlCBLjc3hFNtNXB8UxXIoNbbG+uFXSFMBL
	 E+wsPXz/MW1dABBMGd94mrvcNFkySIknz5BolYxTDk488RensfgZ4mzFK77mgvz2YQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612308;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Subject:To:Cc:From:
	 Date:References:In-Reply-To:Message-Id;
	bh=aPxt8e/lamI9P2AXwyh7UPyw2CRSJmGqsyEUFkb5bh0=;
	b=LE7prsOiVtxL/FTP2/wEd5uz1njOLo2Ye39MR/1WokHG/C81TUePzM7YE1s/91oOJTnk
	 BAx013BaQtqLa1PESVABZN6b9RPN9Efk4uHdKejDOwZQvd5UCuabYqCQAtdVZvt3DfFZC
	 GAlF8xXIRMcXDd52pFwsyJ3QoyYkdDAvNIRtbXpjrnNivjFSwEWNJWzTAMFjToBir4yQ7
	 fDegONet10QhkibGyEbJHpU2iYQeSy+8glA61ClRzFULWD6R9klSpW3CHwS0o1id4Pb/E
	 dJlySp1DwEQCaw8gpQJ+lJ2cJPZ6WcWxCzj5i4olqXqjnNjcARaT7ZdK+kRstouwW4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZSHz0UaH;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2478260A5BE0
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2478260A5BE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZSHz0UaH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792612308; x=1824148308;
  h=subject:to:cc:from:date:references:in-reply-to:
   message-id;
  bh=Ao5yajaMxugMQCEuI5KQUm6kZhXCBl6h+t8DN1NRfS8=;
  b=ZSHz0UaHkQwPqqsXBdc+GoZfHsoywtPx2BS/Wzfg85YZ/lq1L96O5cKP
   AbhbNb/11dQTiQpUeQp8jKAKiXBlOz+NWMyR3Byg8yg0iqydV9AQKRZk8
   0deBwwxU4+rHK+GLursbXhwbOzJCxokVTQ/zsqWvjJ9/nTquHDAKuaxK8
   fidJXCpXO3Eg6mpj44bWL6uFUEDrPSL6NSQqu+kALq543LlW6pfIPVXzJ
   5VEkj+SwV4X63U7eu0ayoB09DgIsygAGpXQw6wVYcOMttxD6Ejcsq6rnh
   UEAvbYUfrJEXNvnLTHTVHhQ3eSNPFfUjaUJX9dRZ4iLrRsrcL8AOjj40D
   Q==;
X-CSE-ConnectionGUID: btmndi/sTMG0K70IzsMtUw==
X-CSE-MsgGUID: ADS/e317S8GmgV9fY0Tj+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1230248"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1230248"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 12:51:48 -0700
X-CSE-ConnectionGUID: 29zOquGwSGakzfV8puxw8Q==
X-CSE-MsgGUID: uMiiC0OYTg6uN67qYE4RGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3092238"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa007.jf.intel.com with ESMTP; 21 Oct 2026 12:51:48 -0700
Subject: [RFC][PATCH 20/24] x86/entry: Stash kernel SSP on FRED entry
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Edgecombe, Rick P <rick.p.edgecombe@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, the arch/x86 maintainers <x86@kernel.org>, Kees Cook <kees@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 Oct 2026 12:51:47 -0700
References: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
In-Reply-To: <20261021195120.E61EC737@davehans-spike.ostc.intel.com>
Message-Id: <20261021195147.3B42C03D@davehans-spike.ostc.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list


Kernel shadow stacks are intended to preserve control flow integrity
across all kinds of RIP transitions, not just strict CALLs. One of
those transitions is when there is a kernel interrupt or exception
and the kernel stops what it was doing and jumps over to
asm_fred_entrypoint_kernel.

On those jumps, FRED hardware writes a special frame to the shadow
stack. That frame includes the return address of the interrupted
kernel code. When returning from the event via ERETS, the hardware
compares this shadow stack frame with the return address on the
regular stack to ensure that they match.

The kernel munges event return addresses for lots of reasons. But,
with shadow stacks, it also needs to munge the corresponding
shadow stack frame contents.

Make it easy for RIP-munging code to locate the shadow stack frame.
Stash off the shadow stack pointer so it sits adjacent to pt_regs.
Without this, anything wishing to locate the special shadow stack
frame would need to walk up the stack. I'm not opposed to doing
it that way, this just seemed simpler for now.

Note, since RDSSPQ is a NOP with shadow stacks off, this assembly
is safe either way, although it does a unnecessary push/pop.

---

 b/arch/x86/entry/entry_64_fred.S |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff -puN arch/x86/entry/entry_64_fred.S~fred-entry-ssp-stash arch/x86/entry/entry_64_fred.S
--- a/arch/x86/entry/entry_64_fred.S~fred-entry-ssp-stash	2026-10-21 12:36:42.552889917 -0700
+++ b/arch/x86/entry/entry_64_fred.S	2026-10-21 12:36:42.555889923 -0700
@@ -16,6 +16,26 @@
 	.code64
 	.section .noinstr.text, "ax"
 
+/*
+ * Kernel-mode events: save the SSP of the shadow stack frame FRED
+ * pushed (old SSP, LIP, CS) just below pt_regs. See struct
+ * fred_kernel_frame.
+ */
+.macro PUSH_KERNEL_EVENT_SSP
+#ifdef CONFIG_X86_USER_SHADOW_STACK
+	xorl	%eax, %eax
+	rdsspq	%rax		/* nop if shadow stacks are off  */
+	pushq	%rax
+	UNWIND_HINT_REGS offset=8
+#endif
+.endm
+
+.macro POP_KERNEL_EVENT_SSP
+#ifdef CONFIG_X86_USER_SHADOW_STACK
+	addq	$8, %rsp
+#endif
+.endm
+
 .macro FRED_ENTER
 	UNWIND_HINT_END_OF_STACK
 	ANNOTATE_NOENDBR
@@ -54,7 +74,9 @@ SYM_CODE_END(asm_fred_entrypoint_user)
 	.org asm_fred_entrypoint_user + 256, 0xcc
 SYM_CODE_START_NOALIGN(asm_fred_entrypoint_kernel)
 	FRED_ENTER
+	PUSH_KERNEL_EVENT_SSP
 	call	fred_entry_from_kernel
+	POP_KERNEL_EVENT_SSP
 	FRED_EXIT
 	ERETS
 SYM_CODE_END(asm_fred_entrypoint_kernel)
_
