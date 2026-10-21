Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543627;
	b=ddTXEire1IaSq3NtvR18iD0LvPqQzQ9ZyMi9P16k8aMgsxbwZVpCOcc9mNwzeqZrdR6l
	 Ba5SMDS+i1i9f6Es9HUKq6iSRohGS3wZ2HtuE8hgEqjBS3MxorCkavDfWS4uTl2dIwdjA
	 C1tJh0/xNqcSnzgfDzAJXBXZ2d5i9cZdnJEMWX+t6Rp6VZuwfx4/xvw68l15qFHSxzi51
	 65GS/FT52/VW0gnCGODYZCLFfsjZJVuYDCq+73BzkSdHFAhhurukNEEpelCsa/0cBMRuu
	 YWsNFt3GXRDMIwYa25GGzwT4oIMS9lHHQaOmM/s8poSjbIuu/uCgVSJBrojPrUctHFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543627;
	h=Received:DKIM-Signature:Date:To:From:Message-Id:Subject;
	bh=+4J1ikdWRodL866L8ZB4HIPzbxbjVfCP68OwuDLd9b4=;
	b=SQyoTjJIjAcTfOU4TEWJwBONKZP+OTwKnhekFToKt/P72kRTFeyMpbIhvyS7JBfwiGeo
	 egqLa3L2F9fIDRVOsEoEYTGWJ6jEdPT2I2USmLKFigk9rGGmB+al4dVuL0pkB0Nu2eV96
	 hFGa66I3yU9Iu0DMr2KbK8IDOSsD9N/fRmogfS5+KQ4d1VioW9UxoZGGqhUCI0rdWSV5F
	 OlC6UNaIPq9aXVyM+F/4Y2B9HUhbSqZIbxPeEqj13AjeSJOv7bgFmnfZqpnPjfeLcW/X6
	 YZgjYR641xlk3JKY+/6X+2YJx9IHJ7jRLKLP4W0+TZVWFwws75Odw+Or91JZqRA/rbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qqDa1njb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57232606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=qqDa1njb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C138D1F000C9;
	Wed, 21 Oct 2026 00:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792543626;
	bh=+4J1ikdWRodL866L8ZB4HIPzbxbjVfCP68OwuDLd9b4=;
	h=Date:To:From:Subject;
	b=qqDa1njbkZe3Jb/X/idIDIrbjuJAeHiqQ8Uye35Zp0RHI9inkDG7hqHLBR55gJb7c
	 OZ9/j6/mJfnIeDL1Ksxv5IxVDGqedRvhZH0vxkP9eRonl1vXeoIN9dVA+Q+d3T9/mq
	 ZdAtDmYpEu4T6uTNtISDlyajruMd29aVWzZ1qvpE=
Date: Tue, 20 Oct 2026 17:47:06 -0700
To: thnkslprpt@gmail.com,brads@mainlining.org,akpm@linux-foundation.org,linux-kernel@vger.kernel.org
From: Andrew Morton <akpm@linux-foundation.org>
Message-Id: <feaa6c8de4df451f98efb7a337541321.1@linux-foundation.org>
Subject: [PATCH 1/2] profile: account for partial /proc/profile reads
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
