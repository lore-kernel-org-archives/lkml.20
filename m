Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637838;
	b=EyJY3xon7LJo08E7KS+VIW3EWDnAp2jCYYREf3zhebxsw+PAGBd2zOB7iw7iYhPQ1TsD
	 OhxNfyaFjcm56SBPKnkTLivvbNakbnstJGfn+iAAVlAG5UQAKqn3rLxDJ5zezf/uR/2RO
	 KvpdGGgBwnKp/Sp5aZ8JG77A1nWsmJEp7a75PxHl4ZI1tiJe/Vh+znAuJGRMzXKzeT4+f
	 ewC6fDimk6w7fP4Hcy9dL2S4Dxmou1QOnDRfUIVngYGGijhpzEUit7N3HZ+48ci3YvsYE
	 yonKXKsnMj5cxBjsa6btJLK6XSaRIL1GoJ07D3LCPAU+iyKnABPL4caR5c+1E/upUGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637838;
	h=Received:DKIM-Signature:Date:To:Cc:From:Message-Id:Subject;
	bh=JVznsVsPInUpSLMrJJOTjWFvzhy/T2qZG1CdKQlMgyk=;
	b=hRtG/etZDnkh57KOjRewH4rcHjK+aw4zfh3L9zAFSd9S3r2KTXYzuxT2kkHeKPy2hTtl
	 kO83rAq6CpQsdw/DT+aWHHcQlq7f4wmpNrt+Lrm0FLjDDL7dg7H4hzwyfpO3bJljgZaZP
	 FQrq1XSJrLDBCUx7entVNdvReGOgXk/4oizSdl56DTmBw3BUVP8ECyeOs73hIObV3Qezf
	 /gXmRMW4tkUDVf8mz+ajOWg+vlJ61xvlRTjqJ6pNihubFJ1hsBfoVKtWrAvE2WMWL58v2
	 Fol8LThf91B89mEuxEJee52xdfrmLllS2VmSe5ECalLCiuUUtA3yUVgN9Dnwpi1rx7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=FUDiKINR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0F606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=FUDiKINR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9981B1F000C4;
	Sat, 14 Nov 2026 06:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794637837;
	bh=JVznsVsPInUpSLMrJJOTjWFvzhy/T2qZG1CdKQlMgyk=;
	h=Date:To:Cc:From:Subject;
	b=FUDiKINRRFXHBQqnUif4afMHYPS+aAFHexcfSZohrT21Gm11GsDV+swyO2bebEM5E
	 tM6c42EzSMC65xaqx+BlB+IQ4mRvpNLNyCOsHEj9rEi1p5Q1aXMkdp7ANHcS0gQ3tb
	 86FosMTK5Krt/4EKV0ix69HkJze5GpB4TlIvKrzU=
Date: Fri, 13 Nov 2026 22:30:37 -0800
To: Bradley Morgan <brads@mainlining.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
From: Andrew Morton <akpm@linux-foundation.org>
Message-Id: <41a747d4b3cd4bf3b266631a1f39ca69.1@linux-foundation.org>
Subject: [PATCH 1/1] profile: account for partial /proc/profile reads
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
systems" is unchanged.  This patch changes only short-read and fault
reporting, not the output format.

Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
Tested the combined three-patch series on x86-64 and i686 QEMU/KVM
guests with CONFIG_PROFILING=y and profile=12.
profile-read-test.c: PASS (0 failures) on both architectures.
Covered short and unaligned reads, header boundaries, EOF, partial
user-copy faults, return values, file positions and retry behavior.
The 64-bit big-endian sampling-step fix was not runtime tested.
No separate per-patch or unpatched-versus-patched run was reported.

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
