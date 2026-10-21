Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543921;
	b=Vd55UKiXxAoygkf/9jri3rbw5YGEhz/HWDOokJRE1IVbDYA0i22c5BmGYp7RcnsNEjat
	 GzmA9AgTXS2SuXwC/ebCIJvAEP22VLwYHZVNlrqrNC4F+xSUnYHOd+9sEQYbzZRuxXVnd
	 Q9lDqfrRFRqfmFep5u5rJDaPHtlIELYxF0OaRABAxPGsNRjyHq3wjZQ4pIsHDRkEkjWRP
	 qgv+14prXm5WW9MGwdzOAd3TXQzQKrbNh5HMZ3gvUFxapeQru8k4pK3AY0aaQRBg/JVzB
	 fyRBlrxL9WE9fFAZdOU/jNQCbh+Os5KRzk00OnxMGofQwmo5Jug9m2oP0jMYtXLElRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543921;
	h=Received:DKIM-Signature:Date:To:From:Message-Id:In-Reply-To:
	 References:Subject;
	bh=thYa21ZTgFO65f2PaS+rLx+2XGdnUBz87DPWNF4dx+s=;
	b=kqW7cizQcQeJb9rP768dwj01BFvsNqiccwb8t3/pnF8dAKwAi2ZhkNU5RawETHTLsr1z
	 mDyKPQdoJ8HcZOty3o35b0G5JZQwbuzNtW+jek2TOBKyrAtky5vpbbyxWQ+SLUSf1dFor
	 yU9T5xt/B01lPWL91bQVepPztQn7374ZuwseE+BN+KecAWM/82m81voLHjiaWD5AlmsMD
	 +ZChPu5veL8zkRMIilvTxUsWm+ctn8FC83fyDHF3NLa1IRtPvV7PhQwzYGZK1BLc86hOm
	 xntMi5/4ZsPjvTJFrw2GDhVjAPrF229bFYQeeD6/WNZ93sBeVcIa5Cnlmdk3Vbh1mZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=sksLqmqm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC28606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=sksLqmqm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405141F000CD;
	Wed, 21 Oct 2026 00:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792543921;
	bh=thYa21ZTgFO65f2PaS+rLx+2XGdnUBz87DPWNF4dx+s=;
	h=Date:To:From:In-Reply-To:References:Subject;
	b=sksLqmqmL0+lfRs0JGyFYrpPcKHVEh7uZU1HqtiVr0Bnuin9UQR3YxKt2popcGh0s
	 MzkYFKVwD9MfEj7QEOgXJxrXqbPMDKCoE+sdf24o6i8SOrXqCuFfec+qNpiztuaKqz
	 6ZWMb0+Ml8vwrG7nPfy9bflu9XRr54+g0Jo2vyks=
Date: Tue, 20 Oct 2026 17:52:00 -0700
To: thnkslprpt@gmail.com,brads@mainlining.org,akpm@linux-foundation.org,linux-kernel@vger.kernel.org
From: Andrew Morton <akpm@linux-foundation.org>
Message-Id: <e7e8de4d10204573a54c2044c060379b.2@linux-foundation.org>
In-Reply-To: <e7e8de4d10204573a54c2044c060379b.1@linux-foundation.org>
References: <e7e8de4d10204573a54c2044c060379b.1@linux-foundation.org>
Subject: [PATCH 2/3] profile: account for partial /proc/profile reads
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

From: Andrew Morton <akpm@linux-foundation.org>
Subject: profile: account for partial /proc/profile reads
Date: Tue, 20 Oct 2026 15:28:00 -0700

read_profile() returns -EFAULT without advancing the file position
when a user copy faults, even if earlier header bytes or a prefix of
the counters were successfully copied.  A retry can therefore copy
the same bytes again despite the previous read having delivered data.

Return the number of successfully copied bytes and advance *ppos by
that amount.  Return -EFAULT only if the fault occurs before any bytes
are copied.  Preserve the four-byte sampling-step header, raw counter
representation, and normal successful-read behavior.

Avi Weiss's "profiling: fix sampling step on 64-bit big-endian
systems" is unchanged.  This patch changes only short-read and
fault reporting, not the output format.
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Avi Weiss <thnkslprpt@gmail.com>
Cc: Bradley Morgan <brads@mainlining.org>
---
Tested the combined three-patch series on x86-64 QEMU/KVM with
CONFIG_PROFILING=y, CONFIG_PROC_FS=y and profile=12.
profile-read-test.c: PASS (0 failures). Covered header decoding,
short and boundary reads, EOF, partial user-copy faults, return
values and file-position accounting.
The 64-bit big-endian fix was not runtime tested. There was no
individual-patch or unpatched-versus-patched runtime comparison.

 kernel/profile.c |   17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

--- a/kernel/profile.c~profile-account-for-partial-proc-profile-reads
+++ a/kernel/profile.c
@@ -157,6 +157,7 @@ read_profile(struct file *file, char __u
 	ssize_t read;
 	char *pnt;
 	unsigned int sample_step = (unsigned int)(1UL << prof_shift);
+	size_t not_copied;
 
 	if (p >= (prof_len+1)*sizeof(unsigned int))
 		return 0;
@@ -166,15 +167,21 @@ read_profile(struct file *file, char __u
 
 	while (p < sizeof(unsigned int) && count > 0) {
 		if (put_user(*((char *)(&sample_step)+p), buf))
-			return -EFAULT;
+			goto out;
 		buf++; p++; count--; read++;
 	}
-	pnt = (char *)prof_buffer + p - sizeof(atomic_t);
-	if (copy_to_user(buf, (void *)pnt, count))
-		return -EFAULT;
-	read += count;
+	if (count) {
+		pnt = (char *)prof_buffer + p - sizeof(atomic_t);
+		not_copied = copy_to_user(buf, pnt, count);
+		read += count - not_copied;
+		if (not_copied)
+			goto out;
+	}
 	*ppos += read;
 	return read;
+out:
+	*ppos += read;
+	return read ? read : -EFAULT;
 }
 
 /* default is to not implement this call */
_
