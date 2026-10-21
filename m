Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792546057;
	b=WXGoTKP/UB1O8bzeW1JECcw7QN6ZfEtMA/xlf5hN0bOoUbYrIuP09+0tNLQ4KvwmU8HN
	 b/6nsgq3oZCId7ETSD2DRWoYcZR3Ygy8covgHtNoLM16uzl4zzZb8TvwGjsuwqCcNj0MW
	 Ii6qGDa8rqxOFNVfa69PYU6SuZqKFC588Rxz0liV8goV8s8STCJ8grT1Td4ChSG8pBlw0
	 tQlxLdI30vbtvU7da1+9Awh++BsneGcu6L/b0XLmf3x4ffzISD+wi9/ilgXt6W9ZZx9rr
	 aN73McBKektY4WSuxL4MSmcH+V23CSH90VsF2sawjP/mUM5Z1OmSxdsU42+Zz5VSUMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792546057;
	h=Received:DKIM-Signature:Date:From:To:Subject:Message-Id:In-Reply-To:
	 References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+Y6NL/+5dgn0/kEBlL90UILFl10o5SglUAcvDKFJ+bk=;
	b=MMAirDEctCuqFLaJMiN4/fH3qMMyhSCiHF81vbiNyTBfOQ8JAHWLGiJvUEVKXpvk3TBR
	 EGyPm0bjdzGBIdhQgsX+WNATJAHiCHMIdVlfzkI5H1MO+t7ty7p/4Wev07l7Q+3/ltdlc
	 pY+rZFj5j+Tpk9ZBHXZRDBMV/L2ZKOgWjN43ZcXVxq0krzSHRtPd97sL9aju3l2BmR7Ov
	 270W9708a9YBko5ZdunaVnXHredjTALvyPTUNO1lhEe84JBIKQdvsyNvYEVeyT4u4Ag2H
	 aMO8n6S8HrmgUqjsvtHo/XB5OoG0GPlsz9iTwDptRWeBLSwKABxOTUZf7YThYH6nrWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Mopo5UA9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAA3606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Mopo5UA9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C19C61F000C9;
	Wed, 21 Oct 2026 01:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792546056;
	bh=+Y6NL/+5dgn0/kEBlL90UILFl10o5SglUAcvDKFJ+bk=;
	h=Date:From:To:Subject:In-Reply-To:References;
	b=Mopo5UA9knuOVZVJ8+IGOvNfpgrYYoYvHYrqBlbtN9cNwe6/ojr7N6CzICruFZqxE
	 z0zlC21NjLY86OtAzlD3ztc0BI2KnYC1XufLWDHUP01p3GEbzpDWfE5Cpn1smuBdCW
	 Lc95MdVB83QLnUQr2l2gQEZC5WAtRMzi0F9DuVtA=
Date: Tue, 20 Oct 2026 18:27:36 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: thnkslprpt@gmail.com, brads@mainlining.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] profile: simplify /proc/profile read layout
Message-Id: <20261020182736.26ac79b01dd02ecda8a89ab6@linux-foundation.org>
In-Reply-To: <e7e8de4d10204573a54c2044c060379b.3@linux-foundation.org>
References: <e7e8de4d10204573a54c2044c060379b.1@linux-foundation.org>
	<e7e8de4d10204573a54c2044c060379b.3@linux-foundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 17:52:03 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:

> read_profile() is needlessly difficult to understand.  It copies the
> four-byte sampling-step header one byte at a time, then manufactures
> a pointer before prof_buffer so a file offset can be used as a
> counter-array offset.  Its signed byte counter, unsigned long file
> offset and repeated size calculations further obscure where each
> read starts and how many bytes it transfers.
> 
> Treat the file as two consecutive regions: a four-byte header and
> the profiling counters.  Use size_t for byte positions and lengths,
> copy the bounded header in one operation, and address the counters
> relative to the start of prof_buffer.  Brief comments explain each
> region.
> 
> Keep the word-sized shift and explicit narrowing required by Avi
> Weiss's "profiling: fix sampling step on 64-bit big-endian systems".
> Assign the header value separately and explain why the 32-bit ABI
> requires a narrowing conversion.
> 
> Preserve the partial-read and fault semantics established by [1/2],
> including short copies within either region.  No userspace-visible
> behavior change is intended.

Me:0, Sashiko:1

revised version, I'll resend in a few days.  I tested 32-bit now.


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

