Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227494;
	b=dYH6UHFAo2fm7dfohq0uy12SL6AJqaE5Oy+jE3fQ5xXtWYPOM5Kz4kQUyV20Ii4CMHGO
	 BxdAtAk857QXAN+3PsFmDl0uON76iCg00j4Xc0AjwC3qUqWH72oeT8r8TB1STZlx29SHi
	 TpazC4+vzc8S5Xel6hIsP9gsBjN2cbJedbhV9/B6gMPZ2cuPzIz+fO9O9ZF9IUO3dok+Q
	 R6K0NJtq90My0KI8GZia6WxAjGRHRK+9T5MqAI4NVFiFWjzcVqujZLt4m/3//qmA7+5C4
	 cl0WuYrjE3H65QmOY7h7RdYqEMdLiR8dMo+AbMxm0mzj8pDtG4ZHEUa2IItq+DbC+Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227494;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QGPGgmuQu2fufOLJfGHUvsRMzAjWcvAMNtZA8gm+nvI=;
	b=l4dfniM71jOgpSfxpa5xJqdtXdqZP9ZVnqy7Ld4fgYSOk6B952T0eInjqMbFNN4vGWvk
	 r0Q/eE7RI+GCbYS9TUAsaKBsJz2A1dT4Qdh254tGZgXzGq/9Z2UHKm2OprUp5KFJAhmWR
	 hzeJaeh4y/zT7/hMdqg4llGAMS+fMCyA6RrByJAAzih0H2p9J3D3O9SuHdqnY7wSBIzfZ
	 nt5GGPRVY/cwYiocjUQ/bhQ2q99EK09mlZCt4Sp2E/dSvGrIVCjEQOqDja01xW/rorIs1
	 calwAVDgiiHdHs8k/yVGIEAk/hwbcb4jiJz53c6PnyD3aaCrA7UsZ9x8WqZHRCZ9fNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dWCwP9LI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TOK70ySp;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2D7606D809
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D2D7606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dWCwP9LI;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=TOK70ySp
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794227492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGPGgmuQu2fufOLJfGHUvsRMzAjWcvAMNtZA8gm+nvI=;
	b=dWCwP9LIP0FfMZO0Sr35ZuGCo+VAH9IXCEV+8Cu5RfqAt+MflGIngtFBsnr/SIABYMIk5x
	tWRBuEhfWoBAIAvtIqFTAlat7UO42/H9F4KmyYU3UnAmWGaKWk9CDjwrPYWp/ZkN0yf0kB
	zesBIuOJHG2WyKNdHbfhU//ExSeNe+oXAnWz5B0gJiPXNyqPsAcU6p4wveuw9vGGeZYooq
	efHJNUhUO2PIImz4irTE9oQepnv95VY/OOVboLqnEZ3nexnFa7T//sGzvykckv9Tlf8vbI
	7S5vvhz1xRZO0iwv6e7ziIbOfXVhVmV6MEMukLDDjyN49UUS/Wpy0Y6re5+csw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794227492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGPGgmuQu2fufOLJfGHUvsRMzAjWcvAMNtZA8gm+nvI=;
	b=TOK70ySpMFiIv8oWkfah1Ca9CjsT7PkF+cx7DzYQGjib/YDAuyeYj5pZ8S9MJ69wF7agG8
	raecUvWJCv16QoDA==
To: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Breno Leitao <leitao@debian.org>,
	printk@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	kexec@lists.infradead.org
Subject: [PATCH printk 5/6] printk: Add panic+kexec flush point
Date: Mon,  9 Nov 2026 13:37:22 +0106
Message-ID: <20261109123127.489676-6-john.ogness@linutronix.de>
In-Reply-To: <20261109123127.489676-1-john.ogness@linutronix.de>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
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

During panic, nbcon consoles transition to atomic printing. However,
there are consoles that do not support safe atomic printing
(CON_NBCON_ATOMIC_UNSAFE). Such consoles will only flush during
panic if their unsafe flush policy allows them to do so.

The unsafe flush policy NBCON_PANIC_FLUSH only allows unsafe
flushing when particular flushes are explicitly invoked. Call
printk_trigger_flush(PR_FLUSH_RESTART) before performing the kexec
in order to give such consoles a chance to perform an unsafe flush.

Signed-off-by: John Ogness <john.ogness@linutronix.de>
---
 kernel/crash_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d0bd2d0cf8990..064b0af903c38 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -140,6 +140,7 @@ void __noclone __crash_kexec(struct pt_regs *regs)
 
 			crash_setup_regs(&fixed_regs, regs);
 			crash_save_vmcoreinfo();
+			printk_trigger_flush(PR_FLUSH_RESTART);
 			machine_crash_shutdown(&fixed_regs);
 			crash_cma_clear_pending_dma();
 			machine_kexec(kexec_crash_image);
-- 
2.47.3

