Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105536;
	b=zp2RjtJlNSZkLYKlmf37nL2he5wnXREWaeSK+thQEEZGc8pwWMiAIKZw08n/4JknqTEu
	 ZdN0l09DkPP36OA1ZV9z5uir9QzmCMJgJHyX6cwb8sOW50CsQqiBn9P2jUmuF3lhuYwa3
	 wlmRbnd8Xa3otPLw/pMmTlGsAaSE5pFgqf0BG4a9/D3V2i/z2q6GalVovTkGS1wWSy9ni
	 ZeSIa+2R6pbErgeBbcvTWG4ctMUUMJLIIj8bwwv563PUWsoqSZSoxk9ICgxO337iyd/ff
	 TkMKtKqYOXwpXy8ue2Uxll/gw8IVymAfG7vzFNsduCfBVwt9t0GXg6RfwSe9Kk0MOgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105536;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TG52W8e2RYtjGPTZeIzpkudV29Okj7bliXK0rKtc2f4=;
	b=gBnKNfwgeBTRL05EiSo1wyS9Ky1T1Wkz8XLjpSdTn7ph5Cqfl0hGjvJZn1aSoVlVeCMU
	 ZwWv4K5ID7gI5kOtJZdOxFiDWrZ/4HOI56aVX5dsOL0lMj6yTisD5aml9Cjv3xlHrFexR
	 VhObceji04W3nTjRK7MZnZb9shZk4n8u6jzSk/76KBCPvQb95TPtGgb5PXStRQJEsQJL8
	 ciQhIpGlEbrZtrkrPmSqJFXobzMF1bi2cH0oL3oJIiM+HYofk33PwrWgkI8kVZ/8QnCl9
	 Gt4gcmcpVvjIJfWzHm1WY244HzKMmc/xSCxOxftWOcbuUkVL0kPJvDouJZTUsMqKQYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D6606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D1D6606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xLgew-00BINw-9J;
	Tue, 27 Oct 2026 08:52:10 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <tchiu@tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] riscv: uaccess: Report partial progress when the word copy faults
Date: Tue, 27 Oct 2026 08:52:09 -0400
Message-ID: <20261027125210.843589-1-nickolai@csail.mit.edu>
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

write(2) from a buffer whose last 40 readable bytes are followed by an
unmapped page spins in generic_perform_write(), holding the inode lock,
until the task is killed, instead of returning 40; read(2) into such a
buffer fails with -EFAULT.

The unrolled word copy does eight loads before its eight stores, and
the shift copy loads one word ahead of its store, but their fixups
count everything from the first destination byte not stored as not
copied. So a fault in the first block reports that nothing was copied
although some bytes could be, which uaccess.h does not allow;
generic_perform_write() then retries forever, as
fault_in_iov_iter_readable() succeeds for the readable bytes.

Make those fixups finish the copy a byte at a time from the first byte
not stored; the byte copy's fixup then returns the exact count.

Reproduced on riscv64 under QEMU with write(2) to tmpfs and ramfs; the
patched kernel returns 40.

Fixes: 4b05b993900d ("riscv: uaccess: Return the number of bytes effectively not copied")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    This patch was prepared with the help of an AI tool.
    
    The scalar copy also runs when the vector copy is in use: for copies
    below riscv_v_usercopy_threshold and for the rest of a vector copy that
    faulted. Under QEMU -cpu max a 4096-byte write(2) from the buffer below
    hangs as well.
    
    Reproducer (riscv64, no privileges; the directory is on ramfs or tmpfs):
    
      gcc -O2 -o uaccess-progress uaccess-progress.c && ./uaccess-progress /tmp
    
    Before (mainline d135ab453a74, defconfig, QEMU -cpu max):
    "read:  -1 (expected 40)", then the write spins in the kernel until the
    alarm kills it ("Alarm clock"). After: "read:  40 (expected 40)" and
    "write: 40 (expected 40)".
    
      /*
       * read(2) and write(2) of 100 bytes from a buffer with 40 bytes before an
       * unmapped page: both must return 40.
       * Usage: uaccess-progress <dir on ramfs or tmpfs>
       */
      #include <fcntl.h>
      #include <stdio.h>
      #include <string.h>
      #include <sys/mman.h>
      #include <unistd.h>
    
      int main(int argc, char **argv)
      {
      	long pg = sysconf(_SC_PAGESIZE);
      	char path[256], *p;
      	ssize_t r;
      	int fd;
    
      	snprintf(path, sizeof(path), "%s/uaccess-progress", argc > 1 ? argv[1] : "/tmp");
      	p = mmap(NULL, 2 * pg, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
      	if (p == MAP_FAILED || munmap(p + pg, pg))
      		return 1;
      	memset(p, 'x', pg);
      	fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0600);
      	if (fd < 0 || pwrite(fd, p, pg, 0) != pg)
      		return 1;
    
      	r = pread(fd, p + pg - 40, 100, 0);
      	printf("read:  %zd (expected 40)\n", r);
      	fflush(stdout);
    
      	alarm(5);	/* the unpatched kernel never returns: "Alarm clock" */
      	r = pwrite(fd, p + pg - 40, 100, pg);
      	printf("write: %zd (expected 40)\n", r);
      	return 0;
      }

 arch/riscv/lib/uaccess.S | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index cf8586a937de8..99886ab86802e 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -88,9 +88,9 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	beq	a0, t1, .Lskip_align_dst
 1:
 	/* a5 - one byte for copying data */
-	fixup lb      a5, 0(a1), 10f
+	fixup lb      a5, 0(a1), 11f
 	addi	a1, a1, 1	/* src */
-	fixup sb      a5, 0(a0), 10f
+	fixup sb      a5, 0(a0), 11f
 	addi	a0, a0, 1	/* dst */
 	bltu	a0, t1, 1b	/* t1 - start of aligned dst */
 
@@ -169,7 +169,7 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	sub	t4, a5, t3
 
 	/* Load the first word to combine with second word */
-	fixup REG_L   a5, 0(a1), 10f
+	fixup REG_L   a5, 0(a1), 12f
 
 3:
 	/* Main shifting copy
@@ -181,11 +181,11 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 
 	/* At least one iteration will be executed */
 	srl	a4, a5, t3
-	fixup REG_L   a5, SZREG(a1), 10f
+	fixup REG_L   a5, SZREG(a1), 12f
 	addi	a1, a1, SZREG
 	sll	a2, a5, t4
 	or	a2, a2, a4
-	fixup REG_S   a2, 0(a0), 10f
+	fixup REG_S   a2, 0(a0), 13f
 	addi	a0, a0, SZREG
 	bltu	a0, t1, 3b
 
@@ -203,16 +203,31 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	 */
 	bgeu	a0, t0, .Lout_copy_user  /* check if end of copy */
 4:
-	fixup lb      a5, 0(a1), 10f
+	fixup lb      a5, 0(a1), 11f
 	addi	a1, a1, 1	/* src */
-	fixup sb      a5, 0(a0), 10f
+	fixup sb      a5, 0(a0), 11f
 	addi	a0, a0, 1	/* dst */
 	bltu	a0, t0, 4b	/* t0 - end of dst */
 
 .Lout_copy_user:
 	li	a0, 0
 	ret
+
+	/*
+	 * A fault in the word or shift copy: redo the rest a byte at a time
+	 * from the first dst byte not stored, so that every byte before the
+	 * faulting one is copied and counted.
+	 */
+#if !defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)
+13:	/* shift copy store: a1 is already one word ahead */
+	addi	a1, a1, -SZREG
+12:	/* shift copy load: the src of a0 is a1 + a3 */
+	add	a1, a1, a3
+#endif
 10:
+	mv	t0, t5
+	j	.Lbyte_copy_tail
+11:
 	sub a0, t5, a0
 	ret
 SYM_FUNC_END(fallback_scalar_usercopy_sum_enabled)

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0

