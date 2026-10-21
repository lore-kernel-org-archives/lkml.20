Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543924;
	b=cqzDc84b+fN8ccZ5sd23VMBP6Y7VBnQxNf3lnl9gT3RVlNMK97Nu5gembcLVeopH5s4Q
	 caHQJuaHmcLj2xgLVnh1OjigXF8XEf5ctL/XIVPG9xWCM+4nNXmCNqwGZjsv2U8ZkpIfi
	 21AeGeQgEBv1YFLOP+vrvw/A6guEgr8KxaZZIKoSToKBftKwOJPQ9S24VO553zV4yKnfd
	 wmBPVm/4av0CAeuQDlF9+Vqd4ZFNW4V1WfKLZX8NSlcUi36Y20zr4RPDtIVYpzueW3i2d
	 2or0fZfTuXaWr5H3eYcUPi2/3MYeX7i5EA+pzcZaK09vVjr8ClJ79Ei4gMvW2DZeSIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543924;
	h=Received:DKIM-Signature:Date:To:From:Message-Id:In-Reply-To:
	 References:Subject;
	bh=3IkbfkJBNqm598Pvm3Y0LA2Z/piM4gxhUmj/DrosS7o=;
	b=pFKn362wYIaae47jRNK8U70HoAhV+WcJsivFaVeXOu9iXvZexJqBEO/YGw+W4QCJhPYJ
	 RHx0OrO8+542xPGXvBiLrgcgIpxiXipLtUiWRYY/3OPIUgP1eURM5yEvOwxw/kyPu0Rfk
	 0dCdjwdwn3ZDAHGwypZo7jcRAn+riKoMXzQQaf34GaPRfX3S0AFhBAZRNcIKrV2d5Va9d
	 Vwn2st14WOiiZtbhV8e4PepWuJCB5wW0kB2NBjllQ6f8NJeVBjYDyotOS9XHqFV8elgEK
	 54uj7tQC+QjQZOrQZ9HNuC6pIQ80gOcVwMEUr5N+4CuZIMjziFouVHl0I4RhCHGZAvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=gCVEdhaG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646A4606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=gCVEdhaG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD78B1F000CA;
	Wed, 21 Oct 2026 00:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792543924;
	bh=3IkbfkJBNqm598Pvm3Y0LA2Z/piM4gxhUmj/DrosS7o=;
	h=Date:To:From:In-Reply-To:References:Subject;
	b=gCVEdhaGKWqi6sK2qfWcz77Nz/TKFPhxKBzMYBHGcGXh30htyufJ6lmxkz8S3Rxgy
	 8MEg0yaFg9T76NeuwM9ghJXKatbW2xh7AdI5hdeIGr5sinMGew6z/VUxOwckCEn6aA
	 cOhLmmlH+k68X3xtzA0+zEQb1S+8+m3Ncqtdk19o=
Date: Tue, 20 Oct 2026 17:52:03 -0700
To: thnkslprpt@gmail.com,brads@mainlining.org,akpm@linux-foundation.org,linux-kernel@vger.kernel.org
From: Andrew Morton <akpm@linux-foundation.org>
Message-Id: <e7e8de4d10204573a54c2044c060379b.3@linux-foundation.org>
In-Reply-To: <e7e8de4d10204573a54c2044c060379b.1@linux-foundation.org>
References: <e7e8de4d10204573a54c2044c060379b.1@linux-foundation.org>
Subject: [PATCH 3/3] profile: simplify /proc/profile read layout
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

From: Andrew Morton <akpm@linux-foundation.org>
Subject: profile: simplify /proc/profile read layout
Date: Tue, 20 Oct 2026 23:58:33 +0000

read_profile() is needlessly difficult to understand.  It copies the
four-byte sampling-step header one byte at a time, then manufactures
a pointer before prof_buffer so a file offset can be used as a
counter-array offset.  Its signed byte counter, unsigned long file
offset and repeated size calculations further obscure where each
read starts and how many bytes it transfers.

Treat the file as two consecutive regions: a four-byte header and
the profiling counters.  Use size_t for byte positions and lengths,
copy the bounded header in one operation, and address the counters
relative to the start of prof_buffer.  Brief comments explain each
region.

Keep the word-sized shift and explicit narrowing required by Avi
Weiss's "profiling: fix sampling step on 64-bit big-endian systems".
Assign the header value separately and explain why the 32-bit ABI
requires a narrowing conversion.

Preserve the partial-read and fault semantics established by [1/2],
including short copies within either region.  No userspace-visible
behavior change is intended.
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Avi Weiss <thnkslprpt@gmail.com>
Cc: Bradley Morgan <brads@mainlining.org>
---
Tested the combined three-patch series on x86-64 QEMU/KVM, with
CONFIG_PROFILING=y, CONFIG_PROC_FS=y and profile=12.
profile-read-test.c: PASS (0 failures). Covered header decoding,
short/unaligned and boundary reads, EOF, partial copy faults,
return values and file-position updates.
The 64-bit big-endian case was not tested. No per-patch or
unpatched-versus-patched runtime comparison was reported.

 kernel/profile.c |   57 +++++++++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 22 deletions(-)

--- a/kernel/profile.c~profile-simplify-proc-profile-read-layout
+++ a/kernel/profile.c
@@ -153,35 +153,48 @@ void profile_tick(int type)
 static ssize_t
 read_profile(struct file *file, char __user *buf, size_t count, loff_t *ppos)
 {
-	unsigned long p = *ppos;
-	ssize_t read;
-	char *pnt;
-	unsigned int sample_step = (unsigned int)(1UL << prof_shift);
-	size_t not_copied;
+	const size_t header_size = sizeof(unsigned int);
+	const size_t file_size = (prof_len + 1) * sizeof(unsigned int);
+	unsigned int sample_step;
+	size_t pos = *ppos;
+	size_t done = 0;
+	size_t n, not_copied;
 
-	if (p >= (prof_len+1)*sizeof(unsigned int))
+	/* Keep the shift word-sized before narrowing to the 32-bit ABI. */
+	sample_step = (unsigned int)(1UL << prof_shift);
+
+	if (pos >= file_size)
 		return 0;
-	if (count > (prof_len+1)*sizeof(unsigned int) - p)
-		count = (prof_len+1)*sizeof(unsigned int) - p;
-	read = 0;
+	count = min(count, file_size - pos);
 
-	while (p < sizeof(unsigned int) && count > 0) {
-		if (put_user(*((char *)(&sample_step)+p), buf))
-			goto out;
-		buf++; p++; count--; read++;
+	/* Copy the four-byte sampling resolution. */
+	if (pos < header_size) {
+		n = min(count, header_size - pos);
+		not_copied = copy_to_user(buf, (u8 *)&sample_step + pos, n);
+		done += n - not_copied;
+		if (not_copied)
+			goto fault;
+		buf += n;
+		pos += n;
+		count -= n;
 	}
+
+	/* Copy raw counters using offsets relative to the counter array. */
 	if (count) {
-		pnt = (char *)prof_buffer + p - sizeof(atomic_t);
-		not_copied = copy_to_user(buf, pnt, count);
-		read += count - not_copied;
+		not_copied = copy_to_user(buf,
+					(u8 *)prof_buffer + pos - header_size,
+					count);
+		done += count - not_copied;
 		if (not_copied)
-			goto out;
+			goto fault;
 	}
-	*ppos += read;
-	return read;
-out:
-	*ppos += read;
-	return read ? read : -EFAULT;
+	*ppos += done;
+	return done;
+fault:
+	*ppos += done;
+	if (!done)
+		return -EFAULT;
+	return done;
 }
 
 /* default is to not implement this call */
_
