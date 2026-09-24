Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F80A2E737D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790218646; cv=none; b=I3Xjh0ONFtR98YLxO0ZJD74RPEnZdNvX9id7mregXZppki17nV0C1DD47dhkZQ+fWHvVyLmflWo/lEAn/PHp9sKqyuRWurwM4EGgFbabBJtLDm5xx9k6OBB/WWPkpZ7soWWtBR3E+ZU1uZoeieqSUnBBvrzPh7DCbNw/PsLc4vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790218646; c=relaxed/simple;
	bh=SmZLFrourm/lwfryw3a8yPdylzCt7syXYJoVoYOw9tc=;
	h=Message-ID:Date:Mime-Version:From:To:Cc:Subject:Content-Type; b=Jum+Fl8YJo7q6amY6vuUw+Qw1VS6HBMrrXE3TY9e+bHsLJM/m+VsaUA9ePjewmSubprdsoaFQrS1qZvUt06+atqkDEBo4MecVZN6MwpApkcBO4EgXeEAB1z46QA94GjvTucOEfuuFiLuZJ74VXTbjKs3C7BoKe7SmzfoEJTvxsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hqz5X6PVLz57DCk;
	Thu, 24 Sep 2026 10:57:20 +0800 (CST)
Received: from szxl2zmapp07.zte.com.cn ([10.1.32.52])
	by mse-fl1.zte.com.cn with SMTP id 68O2v7dj077852;
	Thu, 24 Sep 2026 10:57:07 +0800 (+08)
	(envelope-from gao.rui@zte.com.cn)
Received: from mapi (szxl2zmapp07[null])
	by mapi (Zmail) with MAPI id mid12;
	Thu, 24 Sep 2026 10:57:08 +0800 (CST)
X-Zmail-TransId: 2b096ab49184724-27f6d
X-Mailer: Zmail v1.0
Message-ID: <20260924105708488K1vV5J_xi9COWY7TvJawc@zte.com.cn>
Date: Thu, 24 Sep 2026 10:57:08 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <gao.rui@zte.com.cn>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <jiangfeng@kylinos.cn>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <jmontleo@redhat.com>
Subject: =?UTF-8?B?W1BBVENIIHYyXSByaXNjdjogZml4IHN0cm5sZW4oKSBvdmVyZmxvdyBpbiBaYmLCoGltcGxlbWVudGF0aW9u?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 68O2v7dj077852
X-TLS: YES
X-ENVELOPE-SENDER: gao.rui@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 24 Sep 2026 10:57:20 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AB49190.002/4hqz5X6PVLz57DCk

The RISC-V Zbb optimized strnlen() implementation can return incorrect
results when very large count values are supplied.

The previous implementation calculates an end address based on the
input pointer and count. When count is close to SIZE_MAX, the address
calculation may overflow, resulting in incorrect termination checks and
wrong return values.

This issue was observed while running device-mapper tests:

dmsetup create testname9 --table "0 8 zero"
cat /sys/block/dm-*/dm/name
dmsetup remove testname9

Rework the Zbb implementation to use a decrementing word counter. 
This removes the dependency on end-address calculations,
avoids overflow entirely, and simplifies the word scanning loop.

Performance was evaluated with string_bench_strnlen:

New Implementation Previous Implementation

len=0 : 70 ns/call 70 ns/call
len=1 : 81 ns/call 81 ns/call
len=7 : 81 ns/call 81 ns/call
len=8 : 81 ns/call 81 ns/call
len=16 : 97 ns/call 90 ns/call
len=31 : 119 ns/call 113 ns/call
len=64 : 174 ns/call 162 ns/call
len=127 : 264 ns/call 258 ns/call
len=512 : 801 ns/call 824 ns/call
len=1024 : 1578 ns/call 1550 ns/call
len=3173 : 4541 ns/call 4703 ns/call
len=4096 : 5984 ns/call 5982 ns/call

Results show comparable performance to the previous implementation
while fixing the overflow issue.

Fixes: 5ba15d419fab ("riscv: lib: add strnlen() implementation")
Signed-off-by: Gao Rui <gao.rui@zte.com.cn>

---
v2:
- Rework the Zbb implementation to eliminate end-address overflow
instead of falling back to the generic path.
- Use a decrementing word counter for word scanning.
- Replace numeric labels with descriptive local labels.
- Add comments describing the loop structure.
- Run KUnit string tests successfully.
- Add string_bench_strnlen benchmark results.
---
 arch/riscv/lib/strnlen.S | 111 +++++++++++++++++----------------------
 1 file changed, 48 insertions(+), 63 deletions(-)

diff --git a/arch/riscv/lib/strnlen.S b/arch/riscv/lib/strnlen.S
index a8911605c248..0d074e45363c 100644
--- a/arch/riscv/lib/strnlen.S
+++ b/arch/riscv/lib/strnlen.S
@@ -67,102 +67,87 @@ strnlen_zbb:
 	 *   a1 - Max length of string
 	 *
 	 * Clobbers
-	 *   t0, t1, t2, t3, t4
+	 *   t0, t1, t2, t3, t4, t5, t6
 	 */

 	/* If maxlen is 0, return 0. */
-	beqz	a1, 3f
+	beqz	a1, .Lmaxlen

-	/* Number of irrelevant bytes in the first word. */
-	andi	t2, a0, SZREG-1
+	/* Save original pointer: final length = (current - orig) + offset. */
+	mv	t2, a0
+
+	/* Bytes preceding the string in the first word. */
+	andi	t6, a0, SZREG-1

 	/* Align pointer. */
 	andi	t0, a0, -SZREG

-	li	t3, SZREG
-	sub	t3, t3, t2
-	slli	t2, t2, 3
-
-	/*
-	 * Aligned boundary.  Use the address of the last valid byte
-	 * (s + count - 1) to avoid loading a word past the count
-	 * boundary in the loop below.  count == 0 is handled above.
-	 */
-	add	t4, a0, a1
-	addi	t4, t4, -1
-	andi	t4, t4, -SZREG
+	li	t5, SZREG
+	sub	t5, t5, t6
+	slli	t6, t6, 3

-	/* Get the first word.  */
+	/* Load and mask the first word. */
 	REG_L	t1, 0(t0)
-
-	/*
-	 * Shift away the partial data we loaded to remove the irrelevant bytes
-	 * preceding the string with the effect of adding NUL bytes at the
-	 * end of the string's first word.
-	 */
-	SHIFT	t1, t1, t2
-
-	/* Convert non-NUL into 0xff and NUL into 0x00. */
+	SHIFT	t1, t1, t6
 	orc.b	t1, t1
-
-	/* Convert non-NUL into 0x00 and NUL into 0xff. */
 	not	t1, t1
-
-	/*
-	 * Search for the first set bit (corresponding to a NUL byte in the
-	 * original chunk).
-	 */
 	CZ	t1, t1

-	/*
-	 * The first chunk is special: compare against the number
-	 * of valid bytes in this chunk.
-	 */
+	/* NUL offset inside the first (shifted) word. */
 	srli	a0, t1, 3
-
-	/* Limit the result by maxlen. */
 	minu	a0, a0, a1

-	bgtu	t3, a0, 2f
+	/* If the NUL lies inside the valid bytes of this first chunk, done. */
+	bgtu	t5, a0, .Ldone
+
+	/*
+	 * Remaining bytes = a1 - t5 (never underflows here).
+	 * Word count = ceil(remaining / SZREG) without addi-wrap hazard.
+	 */
+	sub	t4, a1, t5
+	beqz	t4, .Lmaxlen

-	/* All remaining bytes are in the first word, no loop needed. */
-	bgeu	t0, t4, 2f
+#if defined(CONFIG_64BIT)
+	srli	t1, t4, 3
+	andi	t4, t4, 7
+#else
+	srli	t1, t4, 2
+	andi	t4, t4, 3
+#endif
+	beqz	t4, 1f
+	addi	t1, t1, 1
+1:
+	mv	t4, t1

-	/* Prepare for the word comparison loop. */
-	addi	t2, t0, SZREG
 	li	t3, -1

 	/*
-	 * Our critical loop is 4 instructions and processes data in
-	 * 4 byte or 8 byte chunks.
+	 * Critical loop: exactly one backward branch.
+	 * addi t4 is hoisted before orc.b to hide in the load-use latency.
 	 */
 	.p2align 3
-1:
+2:
 	REG_L	t1, SZREG(t0)
 	addi	t0, t0, SZREG
+	addi	t4, t4, -1
 	orc.b	t1, t1
-	bgeu	t0, t4, 4f
-	beq	t1, t3, 1b
-4:
+	bne	t1, t3, .Lfound
+	bnez	t4, 2b
+
+.Lmaxlen:
+	mv	a0, a1
+.Ldone:
+	ret
+
+.Lfound:
 	not	t1, t1
 	CZ	t1, t1
 	srli	t1, t1, 3

-	/* Get number of processed bytes. */
-	sub	t2, t0, t2
-
-	/* Add number of characters in the first word.  */
-	add	a0, a0, t2
-
-	/* Add number of characters in the last word.  */
+	/* Length = bytes already passed + offset in final word. */
+	sub	a0, t0, t2
 	add	a0, a0, t1
-
-	/* Ensure the final result does not exceed maxlen. */
 	minu	a0, a0, a1
-2:
-	ret
-3:
-	mv	a0, a1
 	ret

 .option pop
-- 
2.27.0
