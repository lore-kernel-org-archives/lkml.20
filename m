Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792807315;
	b=pmBUTNtN47cJg4wQePeev0jHC9iqUABJla3JcJ77f2HDwCnAIiZhIgGX5a8WxFqU1VJx
	 dPBHMLCRbfFdBE3jFBgy0g3HBXBhcIiddP9NPthkJKzm7YMMiefNUDvMndGrLTp8It6qH
	 VLpa2ZZxOtz4BSI4zRluFPeoYliljDznD9teBvfoHMKbH/gy4wiPgOHTAYcxl64Lu+5P8
	 Wz2TegY16DHVndstCAzKTiDbdsZqTGeTYJE62pdIMDmUrTdYBKDecdbybKOk8k893wTzZ
	 087hL3C7yxRVNW3bygHxEhIC4npI8UanudjLaY92hz1KJYzyNv4Ct7JITs3RKvG/7kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792807315;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l9TljpQRZ6ZTyvJSq5KUPD3kevzwaC9DocCYFhPRWvo=;
	b=DG8BChkwl+Mdoc5FSLc3ZG6Gp5jffQ8mL1yhT4tPDxDUzwIPkIkUKVMl4jEtwHtixh+V
	 QM5rkUUvNwc/qL4FVeEMaleMqboggH9L8CpORSSS44C7V8ZSoJLVIb6Blz3iQcuPjh5q4
	 haJ0KOBP8L1XQx0VZWO17twNJ6tk1TdINLCP4vXgBhDHfkU1d2HqzIa8Rq3w267Lz53qZ
	 n75zwiFJAF/Ur0A96KB+6uE/pxxTZ8WtJv7OUQPm2QOwJ3lOfvlKwW+b113AlSpiqTkM/
	 AJ6VGqnDk2t1Ly2yei0ZwaAN5JTIuZX4x/ye7YNoteKGLiSwdR7qhR4fFRZRagbxZWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1337C606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:01:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1337C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xKR4z-00E0VB-7H;
	Fri, 23 Oct 2026 22:01:53 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Rio <rioo.tsukatsukii@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] panic: zero the dynamically allocated taint buffer
Date: Fri, 23 Oct 2026 22:01:52 -0400
Message-ID: <20261024020153.830459-1-nickolai@csail.mit.edu>
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

A %s read of print_tainted()'s string can run past the end of the taint
buffer while another CPU rebuilds a longer string in it, reading slab
memory out of bounds into the kernel log (a KASAN slab-out-of-bounds
report at taint_buf + size). A warning or an unhandled-signal dump on
another CPU reaches print_tainted() through dump_stack_print_info().

alloc_taint_buf() sizes the buffer for the longest taint string and
allocates it with kmalloc(), so the bytes past that string are never
written and the object holds no permanent NUL terminator. _print_tainted()
rebuilds the string in place without locking and writes the terminator
last, so a reader that overtakes a writer extending the string past the
previous high-water mark finds no terminator inside the object and walks
off its end. print_tainted()'s kernel-doc promises the string is "always
NULL terminated", a guarantee the previous zero-filled static buffer kept.

Allocate the buffer with kzalloc() so its trailing bytes stay NUL and
every reader stops inside the object.

Reproduced on QEMU riscv64 under KASAN by growing the taint set while
processes took unhandled-signal dumps on several CPUs: the unpatched
kernel reports a slab-out-of-bounds read at taint_buf + size, the patched
one is clean.

Fixes: a9dff0d0d11c ("kernel/panic: allocate taint string buffer dynamically")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    This is a race on the shared taint_buf: the fix removes the memory-safety
    consequence (a buffer with no terminator inside it), but two concurrent
    callers can still garble each other's "Tainted:" string. That is accepted
    behaviour -- print_tainted()'s kernel-doc already says the string is
    overwritten by the next call.
    
    taint_buf and taint_buf_size are published by plain stores in
    alloc_taint_buf(). A hart racing the postcore_initcall could in principle
    see the new pointer before the kzalloc'd contents, or see the torn
    (pointer, size) pair; both are harmless now (every writer stops within the
    smaller bound and the object is zeroed), so this patch does not add an
    smp_store_release(). It can be added if that boot-time window is ever
    tightened.
    
    Reproduced under KASAN on QEMU riscv64 (-cpu max -smp 4, slub_debug=P). The
    window between the body and the terminating NUL in _print_tainted() is
    narrow, so to hit it on demand a test-only mdelay() was inserted there (it
    is not part of the patch). As root, grow the taint set while several
    processes take unhandled-signal dumps on different CPUs:
    
    Reproducer (needs CONFIG_KASAN and a test-only mdelay() in _print_tainted()):
    
      #define _GNU_SOURCE
      #include <fcntl.h>
      #include <sched.h>
      #include <string.h>
      #include <unistd.h>
      #include <stdint.h>
      #include <sys/wait.h>
    
      static void grow_taint(void)
      {
      	int fd = open("/proc/sys/kernel/tainted", O_WRONLY);
      	if (fd >= 0) { write(fd, "2097151\n", 8); close(fd); }
      }
    
      static void crasher(int cpu)
      {
      	cpu_set_t s; CPU_ZERO(&s); CPU_SET(cpu, &s);
      	sched_setaffinity(0, sizeof(s), &s);
      	for (;;) {
      		if (fork() == 0) {
      			*(volatile long *)(uintptr_t)0xdeadbeef000UL = 1; /* SIGSEGV */
      			_exit(0);
      		}
      		wait(0);
      	}
      }
    
      int main(void)
      {
      	long n = sysconf(_SC_NPROCESSORS_ONLN);
      	grow_taint();
      	for (long i = 0; i < n; i++)
      		if (fork() == 0) { crasher(i); _exit(0); }
      	for (int k = 0; k < 120; k++) { grow_taint(); usleep(50000); }
      	return 0;
      }
    
    Unpatched: a flood of
    
      BUG: KASAN: slab-out-of-bounds in string+0x..
      Read of size 1 ... 0 bytes to the right of the 347-byte region
      allocated by alloc_taint_buf(), from dump_stack_print_info() ->
      vsnprintf() in a do_trap() dump.
    
    Patched: the same dumps run, no KASAN report.

    Developed with the assistance of an LLM.
    
 kernel/panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index a4dbb6b8cd2bf..f23f6bc38ab41 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -886,7 +886,7 @@ static __init int alloc_taint_buf(void)
 
 	size += 1; /* For NULL terminator */
 
-	buf = kmalloc(size, GFP_KERNEL);
+	buf = kzalloc(size, GFP_KERNEL);
 
 	if (!buf) {
 		panic("Failed to allocate taint string buffer");

base-commit: 26344c0dd32af8790d8474d233619db825441138
-- 
2.53.0

