Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792841391;
	b=NG+ntnoCYRb+nSYe0wGy0fupOVuAlLImahJnIdwEqUHvTuVJd2KxDryLngtqHK6dH3Ke
	 Yp5Umhxv0wu25YjC4ZvZaFSMBoqBE9AdvFOhX/O3fakvAyLMdvhIWIjgha+OOZvx/qCOV
	 yCkybpoHFLFnjZk68hhpAO3muqf2z0zqXGhcCD8q0730yQDkerxPWNM9MBOusZhHQvu6R
	 2JEI1q/Q2EdUBJQ08Xx9DqLGP4SIl9swQBILprzSk+n0Ecd3dDXNpZp7g7lo59xF5VoEK
	 /zxIExC5aK67C7g+tbLOdqoCZ/YgFiqVriuO59nylIbUD+3waFZuRksmKrD7GXuqF3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792841391;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=HHrPvvB7UUqd1RCXud0IPNgMqze5S1MFspwatvlUBew=;
	b=huneFzT+fx6JkKsAZ9RRo+H1A50sD6jux3ohIwif6hpiaYrZHiUtlCzhxJlmy6PUVgvS
	 y1NiLITlUH8aMIZYj9Kvd3+OmjOyLgzmOgcJ/lfyW6S33nCLRB7uL/aXkVsEtihGwe0rB
	 /JgA8upEMLcj5ZIb0mTeuof2xiBeaA6nC7Y95DZ/CER+mLSGj6fkLelK0DzdJLNG4TmlB
	 hvRkpilboCAZJpMe73rqJ83az6TqRKuz7J8Bg47UMqF62E5jqtC0I2GzSmdt96tnx/VSN
	 6svNDZU9vyod2x3j/NMEpAQNJkryUEBZirKwp4VQ4C7ix5/Vojix639R6Y+eLLvP3Vw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=Q1XJyn97;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=+NkJhs8G;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0438606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0438606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=Q1XJyn97;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=+NkJhs8G
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792841360; bh=HHrPvvB7UUqd1RCXud0IPNg
	Mqze5S1MFspwatvlUBew=; b=Q1XJyn978adN7xTDUfC+iECj0Y1aI7QH1WIAdV8bF2l9n+7rS+
	JBFaAq+AXlemvQRcxWZkq6Ye6ctSvTjc56d00icACMdRSVzTnF2JcRbIVuNJSPHqGBLORvGAnHq
	FOsXTuNSZnknbqIl+sUI37tRuwUDww7Jf+yUdrF+phFpY3fWcLmN/Jp2BiF6+hsdYBa78c/QpYp
	mbYLSNjjDKeSdVUqlUNAlH8LYHQWLPg+U3nm0jfBz62Z24jeeHp6rm1AkGt74/BWDG2D0e6Yt9s
	AvI4w8L1xnKliTa9LEexntP1XCFweM6Gk23XRmAdb7MFQNqFYzAvoKmwaSclTmMLlqw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1792841360; bh=HHrPvvB7UUqd1RCXud0IPNg
	Mqze5S1MFspwatvlUBew=; b=+NkJhs8GF19SlXrI5gw6M+wz23Mbx6NfsenTkHPqKtjmyJ6IXO
	86wGisODr65zPE7BKJ7DFUBhtXyMRHfG4wDA==;
Date: Sat, 24 Oct 2026 12:29:20 +0100
From: Bradley Morgan <brads@mainlining.org>
To: nickolai@csail.mit.edu
CC: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, pmladek@suse.com,
 rioo.tsukatsukii@gmail.com
Subject: Re: [PATCH v1] panic: zero the dynamically allocated taint buffer
In-Reply-To: <20261024020153.830459-1-nickolai@csail.mit.edu>
Message-ID: <B31973BB-607F-4332-AB43-76EA9CACA524@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 24 October 2026 03:01:52 BST, Nickolai Zeldovich
<nickolai@csail.mit.edu> wrote:
>A %s read of print_tainted()'s string can run past the end of the taint
>buffer while another CPU rebuilds a longer string in it, reading slab
>memory out of bounds into the kernel log (a KASAN slab-out-of-bounds
>report at taint_buf + size). A warning or an unhandled-signal dump on
>another CPU reaches print_tainted() through dump_stack_print_info().
>
>alloc_taint_buf() sizes the buffer for the longest taint string and
>allocates it with kmalloc(), so the bytes past that string are never
>written and the object holds no permanent NUL terminator. _print_tainted()
>rebuilds the string in place without locking and writes the terminator
>last, so a reader that overtakes a writer extending the string past the
>previous high-water mark finds no terminator inside the object and walks
>off its end. print_tainted()'s kernel-doc promises the string is "always
>NULL terminated", a guarantee the previous zero-filled static buffer kept.
>
>Allocate the buffer with kzalloc() so its trailing bytes stay NUL and
>every reader stops inside the object.
>
>Reproduced on QEMU riscv64 under KASAN by growing the taint set while
>processes took unhandled-signal dumps on several CPUs: the unpatched
>kernel reports a slab-out-of-bounds read at taint_buf + size, the patched
>one is clean.
>
>Fixes: a9dff0d0d11c ("kernel/panic: allocate taint string buffer dynamically")

Hi, let's review this code

>Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
>---
>
>Notes:
>    This is a race on the shared taint_buf: the fix removes the memory-safety
>    consequence (a buffer with no terminator inside it), but two concurrent
>    callers can still garble each other's "Tainted:" string. That is accepted
>    behaviour -- print_tainted()'s kernel-doc already says the string is
>    overwritten by the next call.
>    
>    taint_buf and taint_buf_size are published by plain stores in
>    alloc_taint_buf(). A hart racing the postcore_initcall could in principle
>    see the new pointer before the kzalloc'd contents, or see the torn
>    (pointer, size) pair; both are harmless now (every writer stops within the
>    smaller bound and the object is zeroed), so this patch does not add an
>    smp_store_release(). It can be added if that boot-time window is ever
>    tightened.
>    
>    Reproduced under KASAN on QEMU riscv64 (-cpu max -smp 4, slub_debug=P). The
>    window between the body and the terminating NUL in _print_tainted() is
>    narrow, so to hit it on demand a test-only mdelay() was inserted there (it
>    is not part of the patch). As root, grow the taint set while several
>    processes take unhandled-signal dumps on different CPUs:
>    
>    Reproducer (needs CONFIG_KASAN and a test-only mdelay() in _print_tainted()):
>    
>      #define _GNU_SOURCE
>      #include <fcntl.h>
>      #include <sched.h>
>      #include <string.h>
>      #include <unistd.h>
>      #include <stdint.h>
>      #include <sys/wait.h>
>    
>      static void grow_taint(void)
>      {
>      	int fd = open("/proc/sys/kernel/tainted", O_WRONLY);
>      	if (fd >= 0) { write(fd, "2097151\n", 8); close(fd); }
>      }
>    
>      static void crasher(int cpu)
>      {
>      	cpu_set_t s; CPU_ZERO(&s); CPU_SET(cpu, &s);
>      	sched_setaffinity(0, sizeof(s), &s);
>      	for (;;) {
>      		if (fork() == 0) {
>      			*(volatile long *)(uintptr_t)0xdeadbeef000UL = 1; /* SIGSEGV */
>      			_exit(0);
>      		}
>      		wait(0);
>      	}
>      }
>    
>      int main(void)
>      {
>      	long n = sysconf(_SC_NPROCESSORS_ONLN);
>      	grow_taint();
>      	for (long i = 0; i < n; i++)
>      		if (fork() == 0) { crasher(i); _exit(0); }
>      	for (int k = 0; k < 120; k++) { grow_taint(); usleep(50000); }
>      	return 0;
>      }
>    
>    Unpatched: a flood of
>    
>      BUG: KASAN: slab-out-of-bounds in string+0x..
>      Read of size 1 ... 0 bytes to the right of the 347-byte region
>      allocated by alloc_taint_buf(), from dump_stack_print_info() ->
>      vsnprintf() in a do_trap() dump.
>    
>    Patched: the same dumps run, no KASAN report.
>
>    Developed with the assistance of an LLM.

Thanx for the declaration.

>    
> kernel/panic.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/kernel/panic.c b/kernel/panic.c
>index a4dbb6b8cd2bf..f23f6bc38ab41 100644
>--- a/kernel/panic.c
>+++ b/kernel/panic.c
>@@ -886,7 +886,7 @@ static __init int alloc_taint_buf(void)
> 
> 	size += 1; /* For NULL terminator */
> 
>-	buf = kmalloc(size, GFP_KERNEL);
>+	buf = kzalloc(size, GFP_KERNEL);

yeah, makes sense. Thanks for fixing the bug.

Reviewed-by: Bradley Morgan <brads@mainlining.org>

Andrew: Perhaps wait for Petrs opinion on this patch too?

> 
> 	if (!buf) {
> 		panic("Failed to allocate taint string buffer");
>
>base-commit: 26344c0dd32af8790d8474d233619db825441138
>

--- Thanks!
