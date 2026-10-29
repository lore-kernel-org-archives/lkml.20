Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793275886;
	b=pgfwX0CnmE00fei+Qm2Jyt/G28+g9qZzar1gktpI0+6NhtMw2Tau3zs7CT9RFkF5Sx2u
	 GauXBHQSmqQn3JMdbLgVKIMZIxBoPPdzDUfWcozvBPAmsFB1aHBP0ugSVv7yM5rbLRB5f
	 gw0gdhJva0JxT7+L8bbmui2SPvbgQlvJbkuEjGQI+zxNT1lsPtaJvZBny2MZgQ/sECQdS
	 AjG9uNJL/lue6j0TqvYeq6uWeL3k6C+i4YH+Ri2rd90I+tdsDsVZtAeZ5SgIzF0wSfgP1
	 9CJ6OQGhKclBE0uhIbiNWSlR/It+k+LPr6CAWZxYvQoB4VzUqSAohlGEutiKDbLw+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275886;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:Subject:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YbujP6JKj1oxCEjBlCYusdX8zGbYupnOiFDHcl8ZAlk=;
	b=lVBM+wETZ6RvDk3HwRJphVhomEwG2WPOszTMeSmpr7e0AnDDre2Snwh10M78PsMJhRFQ
	 UBjrJ4qq6nSjZXykfoko4n4ln1Q1ojqYhQprpPg1gYsfSsLQ1c0mzKG+QIm3G8AEtLxgC
	 8bpqVqTmaiKPB73Q+/dwr4bhYh8Zg8TA50STxKQmxYjlkH+jVumdO+qP9aoaWcUNiO8mp
	 K/aVTP87WTwrYLi3exI4VqGifGsrDU6ZV06kxNLjNaCJaeCBl9oTva+kf9jWH95szcCUm
	 UWT57zULY2eE4uYZkpdZLSX1EQHAiLyGhHknd812VzZasouEMwmGYb5zA+pVQHwXewA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=OuZ1g7Kr;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=xLTFNUs6;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D931606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D931606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=OuZ1g7Kr;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=xLTFNUs6
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793275881; bh=YbujP6JKj1oxCEjBlCYusdX
	8zGbYupnOiFDHcl8ZAlk=; b=OuZ1g7KrM4Y+yS6CIqeQc5Rjmu37bmlP5cz8OOpKIub5axU1a3
	fmUsqiyt88nqkQF6+NEK6hJM0SuL4voAlesIWVZdclXFP8H9DXbv2jqkTayc77G7JQRyt8H7Bwn
	J3ag5oHnUuNyZSNVdUhrGSwI5rtTXsQ/gSVXhJRH2MtpRbshntiahptXIaiaHCkBWV1UWnBevl9
	xk9bE2sBTzK0NblbdbFuY/3aI9Q6zToGF9IjvXlHRY0TWS9YsN3dlASJRBblDsn11xPeNx2BwmV
	98J76fncAU5s94usEibCFRdsv2S+OGm5vWeWIQ3P6T/j+Y2MsQxG+ssrHMbxkDchXmw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793275881; bh=YbujP6JKj1oxCEjBlCYusdX
	8zGbYupnOiFDHcl8ZAlk=; b=xLTFNUs6g2l8MEeqWVdZ+0xPwNlVxlCQ9q1rFrUU93dmcvb+U3
	WDX+c2rV+aZ2vNWchrpovmP4f9ppd+SjzaAQ==;
Date: Thu, 29 Oct 2026 12:11:22 +0000
From: Bradley Morgan <brads@mainlining.org>
To: Andrew Morton <akpm@linux-foundation.org>, thnkslprpt@gmail.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] profile: simplify /proc/profile read layout
In-Reply-To: <20261020182736.26ac79b01dd02ecda8a89ab6@linux-foundation.org>
References: <e7e8de4d10204573a54c2044c060379b.1@linux-foundation.org> <e7e8de4d10204573a54c2044c060379b.3@linux-foundation.org> <20261020182736.26ac79b01dd02ecda8a89ab6@linux-foundation.org>
Message-ID: <3E2400AD-7988-4D87-9982-A2B6EEE0B1E5@mainlining.org>
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

On 21 October 2026 02:27:36 BST, Andrew Morton <akpm@linux-foundation.org>
wrote:
>On Tue, 20 Oct 2026 17:52:03 -0700 Andrew Morton
><akpm@linux-foundation.org> wrote:
>
>> read_profile() is needlessly difficult to understand.  It copies the
>> four-byte sampling-step header one byte at a time, then manufactures
>> a pointer before prof_buffer so a file offset can be used as a
>> counter-array offset.  Its signed byte counter, unsigned long file
>> offset and repeated size calculations further obscure where each
>> read starts and how many bytes it transfers.
>> 
>> Treat the file as two consecutive regions: a four-byte header and
>> the profiling counters.  Use size_t for byte positions and lengths,
>> copy the bounded header in one operation, and address the counters
>> relative to the start of prof_buffer.  Brief comments explain each
>> region.
>> 
>> Keep the word-sized shift and explicit narrowing required by Avi
>> Weiss's "profiling: fix sampling step on 64-bit big-endian systems".
>> Assign the header value separately and explain why the 32-bit ABI
>> requires a narrowing conversion.
>> 
>> Preserve the partial-read and fault semantics established by [1/2],
>> including short copies within either region.  No userspace-visible
>> behavior change is intended.
>
>Me:0, Sashiko:1
>
>revised version, I'll resend in a few days.  I tested 32-bit now.

Thx, did you resend them?

>
>
>From: Andrew Morton <akpm@linux-foundation.org>
>Subject: profile: simplify /proc/profile read layout
>Date: Tue, 20 Oct 2026 23:58:33 +0000
>
>read_profile() is needlessly difficult to understand.  It copies the
>four-byte sampling-step header one byte at a time, then manufactures
>a pointer before prof_buffer so a file offset can be used as a
>counter-array offset.  Its signed byte counter, unsigned long file
>offset and repeated size calculations further obscure where each
>read starts and how many bytes it transfers.
>
>Treat the file as two consecutive regions: a four-byte header and
>the profiling counters.  Use size_t for byte positions and lengths,
>copy the bounded header in one operation, and address the counters
>relative to the start of prof_buffer.  Retain the full loff_t value
>for EOF and negative-offset checks before narrowing it to size_t.
>Brief comments explain each region.
>
>Keep the word-sized shift and explicit narrowing required by Avi
>Weiss's "profiling: fix sampling step on 64-bit big-endian systems".
>Assign the header value separately and explain why the 32-bit ABI
>requires a narrowing conversion.
>
>Preserve the partial-read and fault semantics established by [1/2],
>including short copies within either region.  The full-width offset
>check also prevents 32-bit pread64() offsets from wrapping into earlier
>profile data.  No other userspace-visible
>behavior change is intended.
>
>Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>---
>Tested the combined three-patch series on x86-64 and i686 QEMU/KVM
>guests with CONFIG_PROFILING=y and profile=12.
>profile-read-test.c: PASS (0 failures) on both architectures.
>Covered short and unaligned reads, header boundaries, EOF, partial
>user-copy faults, return values, file positions and retry behavior.
>The 64-bit big-endian sampling-step fix was not runtime tested.
>No separate per-patch or unpatched-versus-patched run was reported.
>
> kernel/profile.c |   61 ++++++++++++++++++++++++++++-----------------
> 1 file changed, 39 insertions(+), 22 deletions(-)
>
>--- a/kernel/profile.c~profile-simplify-proc-profile-read-layout
>+++ a/kernel/profile.c
>@@ -153,35 +153,52 @@ void profile_tick(int type)
> static ssize_t
> read_profile(struct file *file, char __user *buf, size_t count, loff_t
> *ppos)
> {
>-	unsigned long p = *ppos;
>-	ssize_t read;
>-	char *pnt;
>-	unsigned int sample_step = (unsigned int)(1UL << prof_shift);
>-	size_t not_copied;
>+	const size_t header_size = sizeof(unsigned int);
>+	const size_t file_size = (prof_len + 1) * sizeof(unsigned int);
>+	unsigned int sample_step;
>+	loff_t offset = *ppos;
>+	size_t pos;
>+	size_t done = 0;
>+	size_t n, not_copied;
> 
>-	if (p >= (prof_len+1)*sizeof(unsigned int))
>+	/* Keep the shift word-sized before narrowing to the 32-bit ABI. */
>+	sample_step = (unsigned int)(1UL << prof_shift);
>+
>+	if (offset < 0)
>+		return -EINVAL;
>+	if (offset >= file_size)
> 		return 0;
>-	if (count > (prof_len+1)*sizeof(unsigned int) - p)
>-		count = (prof_len+1)*sizeof(unsigned int) - p;
>-	read = 0;
>+	pos = offset;
>+	count = min(count, file_size - pos);
> 
>-	while (p < sizeof(unsigned int) && count > 0) {
>-		if (put_user(*((char *)(&sample_step)+p), buf))
>-			goto out;
>-		buf++; p++; count--; read++;
>+	/* Copy the four-byte sampling resolution. */
>+	if (pos < header_size) {
>+		n = min(count, header_size - pos);
>+		not_copied = copy_to_user(buf, (u8 *)&sample_step + pos, n);
>+		done += n - not_copied;
>+		if (not_copied)
>+			goto fault;
>+		buf += n;
>+		pos += n;
>+		count -= n;
> 	}
>+
>+	/* Copy raw counters using offsets relative to the counter array. */
> 	if (count) {
>-		pnt = (char *)prof_buffer + p - sizeof(atomic_t);
>-		not_copied = copy_to_user(buf, pnt, count);
>-		read += count - not_copied;
>+		not_copied = copy_to_user(buf,
>+					(u8 *)prof_buffer + pos - header_size,
>+					count);
>+		done += count - not_copied;
> 		if (not_copied)
>-			goto out;
>+			goto fault;
> 	}
>-	*ppos += read;
>-	return read;
>-out:
>-	*ppos += read;
>-	return read ? read : -EFAULT;
>+	*ppos += done;
>+	return done;
>+fault:
>+	*ppos += done;
>+	if (!done)
>+		return -EFAULT;
>+	return done;
> }
> 
> /* default is to not implement this call */
>_
>

--- Thanks!
