Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793448708;
	b=x/FiQA+RYnGeaGPtz3RzjAZLls4uC0aSFPolXKT6tiI1H6fwTWnquBI1VW4h+SR90n31
	 fkhuyrjSf0hRBLetZABWJYI+HRQrmHxXotYGzmrKEHgQM1IZMhvsKYCZogPc3Mu8Kmf/f
	 Jlf/l6nB77sChILh05F7hpf12rh5WGeW6afGXFY0zC/ojDLMp9o1Ww2pB898k4h3Tsw6U
	 zlQr9QKvD+6JGMoEYjR0bd43u3mtPpUebFFI/yRDLXb/dap/D01Z9oX4DCPcckjUB4B2J
	 5ErbzjKO+9+7LzM0fZsneYGXOKoZLYQgGEoKsLfFtuilctTGP+6pAcOEc7M8c/4NFsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793448708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BT6J6/b48vPr/t0dhtJHyqHkA9y0z58dhZE+8yeOg4k=;
	b=zi7NnmfT2CEOeQX3u1oaqMBn7kFA8K7pWXYMnpOwWRMjA6CArsfrEJSBuSfqLYConxba
	 BArJ44FKClj/xJAXSvK80/6udkLabrZfCp9Z4Ae00wGZxOrHb3oALqGoZUkGnJWl6vuDV
	 Ek3vtm2//EIbCwG1ZvtSIA0eq8IBpcEkPApbVtUm5gTf1f0yZ9oXUsfdCxAf4k54wyfQL
	 tUos2gSiAw1+D1J56igUuekBozkLvnzshXc/w5HvAK1+CZ/FIutVKI4k9bqCVbtPQGE99
	 kPCXA06btqkukKpjhA7GOBdQEZuGPYG5g2TrxKlfxU+38aA2IZ6VFpyzh97Smc0jAtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ssVuBEYZ;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CF7606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 12:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4CF7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ssVuBEYZ
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so2717533c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 05:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793448707; x=1794053507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BT6J6/b48vPr/t0dhtJHyqHkA9y0z58dhZE+8yeOg4k=;
        b=ssVuBEYZ3bBYs5Ngxno/LuPVQxnI36NF8euRmCmpArxfYozZ9uinigoPgmJUDFD7j0
         KQJW2qarGxekzDvMZuUikY6tDRZhQpsw58FP8iceugb0Dt7Yq6EVULMYQlM5I8WVb0mG
         MVxWLZjzOjg1qy32H4tjYiS4pjGXhsooOJtYzt1wiyU4WpaOcpOQPddzfjqC+Eddq5TE
         ZKyK2jqvNIFn4NGV/BLKtxrUrfFSJwsVHCV1KMutftgv1nmO/uYDCuIXk5VnTUhVNLGU
         QbjcLr0MfDz5lrsIj4giWSWo3goNUGBFou9nKIQ9oeyPTAhBDwOtW1qz3FDxSztnEd0e
         fxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793448707; x=1794053507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BT6J6/b48vPr/t0dhtJHyqHkA9y0z58dhZE+8yeOg4k=;
        b=rbNjrRY7Ni0R0cJ6s7U4UkCiCr+J04ClRCjl1MFw1Si0+J+Gs+DwWUXhqLwsp0wxQV
         4CsJeqHOeX4EVJVnC+rydG/OdvWgm3wIAbrJkJROrTcRYgEM4UDLQ746/qnwEDKw704j
         UaJU/h/YheRrRVJ6JRedem37pIRRUWvykBqQiIhpgY5AqNuDjBpis6x4i4gQVnMx2u6x
         ro6KSl/dxtoVZOCASCAT/dKqhOcgRKvA4lIfb90HVaUu2Mqk7g9BCmMukPghtyoYi1Zl
         nI1qFzsrGtdzNDLSYjW6dbs0p7PO91APN4rsq2+vplvEVbEDW2WDV4PV65sY0DlJ0Vxc
         Vg6w==
X-Forwarded-Encrypted: i=1; AKwUvBz9Q7GOa/LX+IYvJmiFKW2GowN6nBdVplNLuGZk+OaHPQoznIwJfY6aYJrftCmCClpsZJeji1SDxNfTXDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3WD5EMifYtksr0YJ4zUYzOlWICUtkQy0CKGWYFw6sKbWuUTaN
	Lq4jYgRNgtLqC81DBpTLk1ir0ppCu2dA+kvBuLS9wdqqYYZfMjtWnJID
X-Gm-Gg: AYBFou0RWxT5zeQHcfEc/423+qzN+zLS79qAKyRpt2mP1J6iR7N5RIkcsG/Rv/l9aAb
	BfOZIzus0LPEMNrPbk6skcMA8JwBz19T5GBPhMsYM7va95s/v8ZnMmliUegUjyTYjiep/XRAUtJ
	T4sdMfQ+QepBdMf73yxULTlZQ5J4zUcFNSBykHVcI7L18JvTgfOeKeLZaSqhoDoejtXqBdS8TPw
	GlHjw9Ake6Ojdn2WO7hRMaBSZAk6656IBvD6knq2VktxzfUP2QUmEJVwRZ5IeVRWjW93vP2r1H/
	x2KrFyPkvDzl7lyH+695IYJfAu3ODOil4YdpkId2kn0ZY+OZAK6ap7O3g6qzIwz/E8bt6uH8ZpE
	QND8JqkIUJM1l6c78GKWt/NZvRfBMv6mZNKzAmwudJ/AD+obw31k9EQij/iLMv+iqwlTYBSxINC
	YOJx+btf7ZKs4gmGdhU5ZUVkYz6cy2n2Mh7zofR8jPbvIzsFk6m1CKJrn4zHG1RllFD3HDTrXXL
	TcccQGrf1DClRjCvPlnVNQRePuRfOPLv07PspQi8X+yKdoHOb6t8iLpuRNzI3qxFMzShuy4g87M
	i5MXegWN1ZnMWTUEP/tbUd3PvmWQa42f5xU=
X-Received: by 2002:a05:7022:3a02:b0:169:bef5:f445 with SMTP id a92af1059eb24-1ac55774bf9mr7170978c88.4.1793448706406;
        Sat, 31 Oct 2026 05:11:46 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm26762301c88.10.2026.10.31.05.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:11:45 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
	chleroy@kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH] powerpc/entry: Trace the IRQ disable before irqentry_exit() on 32-bit
Date: Sat, 31 Oct 2026 17:41:37 +0530
Message-Id: <a14571be1897955f43d9994f0e093de3ada6ecde.1793447880.git.ritesh.list@gmail.com>
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

Commit 63a7531ca31f ("powerpc/entry: Fix irq_soft_mask corruption on
replayed interrupt exit") changed arch_interrupt_exit_prepare() to
disable interrupts with hard_irq_disable() instead of
local_irq_disable().
This is correct for 64-bit (since it takes care of everything there)
however, it breaks lockdep on 32-bit.

exceptions such has page fault handling (do_page_fault()), re-enables
interrupts since handling a page fault can sleep. Then generic irq exit
expects the arch to disable the interrupts back before returning to the
user/kernel in their arch_interrupt_exit_prepare() function, before
irqentry_exit() is called. irqentry_exit() then checks for lockdep's irq
tracing state and expects the interrupts to be off.

Note that on 32-bit we don't have any soft mask and hard_irq_disable()
just clears the MSR[EE] state and does not update the irq tracing state
unlikes local_irq_disable(). This causes the lockdep to warn like:

    WARNING: include/linux/irq-entry-common.h:540 at irqentry_exit+0x398/0xd1c, CPU#1: init/1
    NIP  irqentry_exit+0x398/0xd1c
    LR   do_page_fault+0x390/0x7b4
    Call Trace:
     do_page_fault+0x218/0x7b4
     DataStorage+0x15c/0x180
    --- interrupt: 300 at __arch_clear_user+0x10/0xcc

    WARNING: include/linux/irq-entry-common.h:312 at irqentry_exit+0x224/0xd1c, CPU#1: init/1
    NIP  irqentry_exit+0x224/0xd1c
    LR   do_page_fault+0x390/0x7b4
    Call Trace:
     __per_cpu_offset+0x0/0x60 (unreliable)
     do_page_fault+0x390/0x7b4
     InstructionStorage+0x150/0x160
    ---- interrupt: 400 at 0xb77b059c

So, use local_irq_disable() on 32-bit which clears MSR[EE] and also
records the transition for lockdep. For 64-bit we keep hard_irq_disable().

Fixes: 63a7531ca31f ("powerpc/entry: Fix irq_soft_mask corruption on replayed interrupt exit")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
This was caught during debugging some other issue on 32-bit platform.
When lockdep is enabled there, this warning can be easily seen during bootup
itself.

 arch/powerpc/include/asm/entry-common.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
index 8e91489fdf2b..c944a267532d 100644
--- a/arch/powerpc/include/asm/entry-common.h
+++ b/arch/powerpc/include/asm/entry-common.h
@@ -268,7 +268,10 @@ static inline void arch_interrupt_exit_prepare(struct pt_regs *regs)
 	}

 	/* irqentry_exit expects to be called with interrupts disabled */
-	hard_irq_disable();
+	if (IS_ENABLED(CONFIG_PPC64))
+		hard_irq_disable();
+	else
+		local_irq_disable();
 }

 static inline void arch_interrupt_async_enter_prepare(struct pt_regs *regs)
--
2.39.5

