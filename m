Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637851;
	b=AOtt2IEoMViIericQ89oaSsglDZ6IHIAui79kw3aRMK/tDFHbz20R8jrIyMnWpyiSf9j
	 WfjZhM9ih08/w/hAyWq51dffPvtV6TBa5pF9lpEzD6X/n2MbpfHCBBMWmHNRjOcZquMDb
	 qpU/6g217UOehG3F0XDJR6bJfVWgAJ6ZGSIx8CTvS4qnKsk1fPlPHE0NeISAzt/s2cv/J
	 XcUlp3/p2KIj7OMkNcZOEQNhQK52qdbJ+ii18i6ZsVZ8c/+akGU/gyTcBFcBYYqWnuyWI
	 p80NGBaiUnepCHZIC4hSZ84AqohvO9976NmNHUTm2XxL03jjb0eF4BFDuWb4Qdsrp0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637851;
	h=Received:DKIM-Signature:Date:To:Cc:From:Message-Id:Subject;
	bh=oS9QFk6qCTqZmDiyydPycgUePjHsd6zHH42FyfHt1JU=;
	b=D0nYPxWYoEaEl6cMiRH2NNT6af6ihbMAB8PMQOsJmTckUxOaW0wC0ZKM0ZmqPbYgyfkA
	 X8iprFyUB8jSTnezua2u7D9e3ASPwJt7fYD/JDLnrcTjlG3G6rzEQLUbOoRqJFGpIX9Pl
	 WexUhotQUinHuiC+wnl07Vt448Bksduyyl5qepXq+u3wr0kZHsoFnlTsxXSlUfcvQcAIO
	 yTgO7TpOEyZ+Mdk7WpIdL0QVq9EyER8UHq8DgNqq5y9TovlOVLLG3lFQqqh5Q9i+jklqv
	 VrcaDqolvHL4wdu8BgoKNXkzKUogBkag7goXGvYxkZI1yk6J78HK7ZTHYVdNGZ9I6zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=URQzAA9G;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8316A606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=URQzAA9G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE531F000C5;
	Sat, 14 Nov 2026 06:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794637851;
	bh=oS9QFk6qCTqZmDiyydPycgUePjHsd6zHH42FyfHt1JU=;
	h=Date:To:Cc:From:Subject;
	b=URQzAA9GjFxBqcn+/SlJFAhBxIaJ5CrNwMr1u9uytsVbWCALxyV606nyJMgyQALVv
	 SUH/68qGVpZClndEtUKhj/6oj2YJsYHxOaghbNWnpP0YEl6HanyD5MVN2Dwe/m9L1Y
	 U2hK6QVjbgC9UIN2ypagHQZ+7B8BdtfXr/5qbhQg=
Date: Fri, 13 Nov 2026 22:30:50 -0800
To: Bradley Morgan <brads@mainlining.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
From: Andrew Morton <akpm@linux-foundation.org>
Message-Id: <b271a138ea114d2d8436445cad2a1aab.1@linux-foundation.org>
Subject: [PATCH 1/1] profile: simplify /proc/profile read layout
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
relative to the start of prof_buffer.  Retain the full loff_t value
for EOF and negative-offset checks before narrowing it to size_t.
Brief comments explain each region.

Keep the word-sized shift and explicit narrowing required by Avi
Weiss's "profiling: fix sampling step on 64-bit big-endian systems".
Assign the header value separately and explain why the 32-bit ABI
requires a narrowing conversion.

Preserve the partial-read and fault semantics established by [1/2],
including short copies within either region.  The full-width offset
check also prevents 32-bit pread64() offsets from wrapping into earlier
profile data.  No other userspace-visible
behavior change is intended.

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
Tested the combined three-patch series on x86-64 and i686 QEMU/KVM
guests with CONFIG_PROFILING=y and profile=12.
profile-read-test.c: PASS (0 failures) on both architectures.
Covered short and unaligned reads, header boundaries, EOF, partial
user-copy faults, return values, file positions and retry behavior.
The 64-bit big-endian sampling-step fix was not runtime tested.
No separate per-patch or unpatched-versus-patched run was reported.

 kernel/profile.c |   61 ++++++++++++++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 22 deletions(-)

--- a/kernel/profile.c~profile-simplify-proc-profile-read-layout
+++ a/kernel/profile.c
@@ -153,35 +153,52 @@ void profile_tick(int type)
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
+	loff_t offset = *ppos;
+	size_t pos;
+	size_t done = 0;
+	size_t n, not_copied;
 
-	if (p >= (prof_len+1)*sizeof(unsigned int))
+	/* Keep the shift word-sized before narrowing to the 32-bit ABI. */
+	sample_step = (unsigned int)(1UL << prof_shift);
+
+	if (offset < 0)
+		return -EINVAL;
+	if (offset >= file_size)
 		return 0;
-	if (count > (prof_len+1)*sizeof(unsigned int) - p)
-		count = (prof_len+1)*sizeof(unsigned int) - p;
-	read = 0;
+	pos = offset;
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
