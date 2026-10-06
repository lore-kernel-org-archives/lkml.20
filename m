Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07974370AFD
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 18:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791310227; cv=none; b=jRhpexdb+oVOOM7XmaaCfmhwQMEoJdnqhP4aiY/no0Sf+zEkxsPKVc4ZXC7KxvF0AempAdzW3FOmgzVWO31101vWYA/WZnKC0Tw1D56QTLJ88Iu1vqvBakbFgL5fNjrsl4C0UlBNUrQXXJmU3tBvnG6i69nCKip1RTrqkO9m5mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791310227; c=relaxed/simple;
	bh=WbGqaRbHtRgJ7moLMo1R8LVauqCNwfX6lnHlo7d/wis=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WbBajOXKLSAwYcImfbkh5t45gCzGWGth+K7jmJvVE0tg2OmAcalLwogQEwAs5ks7mQ9O7UnGCAXKkOE8XOp6fodhPimOWKhtsUe5Ua8V1wAqSm9yZ44mXit+ba0LY9O2jU3upl8HScclu9v0L7qzRcNbluUD/jXvxA9bnT6DbR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grDeE7S7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grDeE7S7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89508C2BCF4;
	Tue,  6 Oct 2026 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791310226;
	bh=WbGqaRbHtRgJ7moLMo1R8LVauqCNwfX6lnHlo7d/wis=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=grDeE7S7x4IPFFBFfg6oRmYWomaPplfClc1sarbSOlWaF4U6RQEBmUdPyqUbDOrZo
	 xj9+60ChRPIa+OmBcp5MHwdU/hfetPwgHQ2raggbGemt+NP/rj4BWSTnJUUD595pRN
	 WGamm89PZ8UeGCRRYiY5v8rrLks+XWzE2eoiiJy2VoPGdrypFq2Z/4USUPKC2dLGSF
	 DeoICMTwa7Le3fT079Z7v932vgQUHbAqoKCZenpWucypmnq/YLAxFbjnrOnmRakWR8
	 l+zXnT/9V9ZSU2Y+1pFOq0pYJHC2bFxpQOpp1Ftvg5W6DNjVqL7amC/nregFQ13dZN
	 seHhKqAbQ2pTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60FF0CA5FFC;
	Tue,  6 Oct 2026 18:10:26 +0000 (UTC)
From: Viorel Cernateanu via B4 Relay <devnull+vrilutza.gmail.com@kernel.org>
Subject: [PATCH 0/2] x86/kmsan: Fix two bugs in the metadata lookup
Date: Tue, 06 Oct 2026 21:10:21 +0300
Message-Id: <20261006-kmsan-serie-v1-0-07fa860ef3de@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCQAxFr1KyNpBpoVCvIi6SMW2jOMpERSy9u
 zPt8n3+ewu4ZlOHY7NA1o+5PVKBcGggzpwmRbsUhpbaPhD1eLs7J9ws1K4jIgnDEBWK8cw62ne
 rnc47+1uuGl81UR/CriiZU5zrtGeEfwzr+gcPNXc9jAAAAA==
X-Change-ID: 20261006-kmsan-serie-e33000b199ce
To: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>
Cc: Borislav Petkov <bp@suse.de>, kasan-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, Viorel Cernateanu <vrilutza@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791310224; l=2125;
 i=vrilutza@gmail.com; s=lenovo-20261005; h=from:subject:message-id;
 bh=WbGqaRbHtRgJ7moLMo1R8LVauqCNwfX6lnHlo7d/wis=;
 b=9a6NKEvMM7PCqPWjHR2uysMAJTSxRxcLisc4RrF/odFeZH8WJ8orNUKVDt+pfdzOii8EJVrSU
 Bw3gv4UegMPBYc7kV1UcSddHYndcrDwFHaX75IRcczp6yErXUPTGGHZ
X-Developer-Key: i=vrilutza@gmail.com; a=ed25519;
 pk=HttZd2ffphVYTK/pvlflateaij8E4SdPd6Y+xDQMqDU=
X-Endpoint-Received: by B4 Relay for vrilutza@gmail.com/lenovo-20261005
 with auth_id=1115
X-Original-From: Viorel Cernateanu <vrilutza@gmail.com>
Reply-To: vrilutza@gmail.com

Two fixes in arch/x86/include/asm/kmsan.h, found while running KMSAN
kernels with KASLR and with CONFIG_DEBUG_PREEMPT.

Patch 1 fixes the CPU lookup for addresses in the CPU entry area, which
is wrong with KASLR, and for the last page of each area without it.

Patch 2 fixes a recursion with CONFIG_DEBUG_PREEMPT: the metadata lookup
ends up in the instrumented preempt_count_add(), and the kernel hangs
right after KMSAN is enabled.

Both were tested on v7.3-rc6 in QEMU/KVM, with x86_64_defconfig plus
x86_debug.config (without LOCK_STAT, LOCKDEP, PROVE_LOCKING, GCOV and
DWARF), KMSAN and UBSAN_BOUNDS, and with a module that poisons and then
checks the KMSAN metadata at the start and at the end of the current
CPU's entry area, so a KMSAN report means the metadata was found.

Patch 1: without it, the end of the area is missed without KASLR, and
the lookup oopses with KASLR. With it, both are found, with and without
KASLR (three boots each). On an Ivy Bridge laptop, v7.3-rc6 with this
patch and KASLR gets past the hard lockup detector setup, and the same
check finds the metadata on all four CPUs. The lookup now scans up to
nr_cpu_ids entries for addresses in the CPU entry area; I have not
measured the cost on machines with many CPUs.

Patch 2, with CONFIG_DEBUG_PREEMPT added: without it, three boots out of
three with KASLR stop after the "ATTENTION: KMSAN is a debugging tool!"
banner and never reach init. With both patches, six boots out of six
reach init, with and without KASLR, and the module above still gets its
KMSAN reports. Not tested with lockdep, PROVE_RCU or
TRACE_PREEMPT_TOGGLE, and not on hardware.

---
Viorel Cernateanu (2):
      x86/kmsan: Fix CPU entry area metadata lookup
      x86/kmsan: Don't call instrumented code from kmsan_virt_addr_valid()

 arch/x86/include/asm/kmsan.h | 76 ++++++++++++++++++++++++++++++--------------
 1 file changed, 52 insertions(+), 24 deletions(-)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261006-kmsan-serie-e33000b199ce

Best regards,
--  
Viorel Cernateanu <vrilutza@gmail.com>


