Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543630;
	b=uwxJyUN0GqwCXg0R2LOuSJtV/FF+oUcqteFZm+uPBRBhnAdCeKqFCB6Hh6838m8dSA4X
	 3zs7jnQKhmnBdbEyJm1PptzvbRZ4sz+c5lwWhYwyDfSJ5AjJQPb1HBWxZsF3WoEau+RsI
	 7xv83WbrszVWjCWYDBuAu2pEhvFiVVIojlu6vKEwvcT+z8gLG7Y/LlCLL92KCuwJio1vR
	 h3DD+DOmQMbc8AuLmoMa7y/yrHf0h4/5C0WGeW8tU2/1J+xx0OZUvE76m/ve+9yKNKes9
	 S5EI7NGsEtLfDLOOolBApC0b2WUbpNZgXLZs1gAgGYAD+conbvNQbNu224x/GwFg6Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543630;
	h=Received:DKIM-Signature:Date:To:From:Message-Id:In-Reply-To:
	 References:Subject;
	bh=xjtP3jATckAPLV/ZhwVkkvmsLQvh57losgjpaZLG5oU=;
	b=Csx3Z5vOGZkJbIXDNLOoC892kKzSsL3KO0Uxg2f+JntN8SM4ZGYU6Jijq0FB20x8B1XV
	 BW2GsJkkPo+DjkmHOxqqpAXoSGUVD40a57lTJbiBZT95Oe4NvjvyUilYAkuwNCfvw27Co
	 xu9zIeBXb2T2xMg0uRlsGyhWEUQS2vn2Ic17yA2Ox0vCSygznSCcr08cHWG9/5/c2qd89
	 l1Rf17s6u3Y+jgYYT6YUK14JwaDD9uSl34DN4rinyUb9lfPZH3m8bd+/7kxID6BhDj6s/
	 R2B1Sh6insivMYRHOXY9Zlhj9LbE0zAkDlZZPcYkFimpO87XtgvrJG0WKfG2IC+NaTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=sqYhRU4Y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD948606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=sqYhRU4Y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFBD1F000CB;
	Wed, 21 Oct 2026 00:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792543629;
	bh=xjtP3jATckAPLV/ZhwVkkvmsLQvh57losgjpaZLG5oU=;
	h=Date:To:From:In-Reply-To:References:Subject;
	b=sqYhRU4Yt8HUOr8/g/A0MtWq0WTSNM+tp7fhD8jbbhpRygtXzHpMC8mByJ7IaR5/o
	 zFEpg2DIQ/dHaghdh1lwUIedMRpmGjNQPZTjxPP5o75yxUWEdOrJpSf/bwT2iQ4H/w
	 hvX6gGLyvmHOGaMzjhH7J5ek1S+SkkymdZ4YB8js=
Date: Tue, 20 Oct 2026 17:47:09 -0700
To: thnkslprpt@gmail.com,brads@mainlining.org,akpm@linux-foundation.org,linux-kernel@vger.kernel.org
From: Andrew Morton <akpm@linux-foundation.org>
Message-Id: <feaa6c8de4df451f98efb7a337541321.2@linux-foundation.org>
In-Reply-To: <feaa6c8de4df451f98efb7a337541321.1@linux-foundation.org>
References: <feaa6c8de4df451f98efb7a337541321.1@linux-foundation.org>
Subject: [PATCH 2/2] profile: simplify /proc/profile read layout
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
