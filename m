Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660132;
	b=BYuShTT2Qb91314aXdHBU9+1LvX/rd53c6+wCl6ZuIe3FPcblfBhYMmXZDflgaZi5e7w
	 x+GKwphphL57QBLCdNQ+kK69Chy6wpWQzBpvZX+HVn/S59Tge6Hh8pglxImOrwx4TAly0
	 tbNRGE1HwjxL6bMb9iI7Ngsgiph7sjq8J4qjuEpSL3BUWlBP3Z2HykbsobjdSTSWmBQmc
	 P1BV2v4Ct9n7t+2IKkTp8BR8dYVBOHOKRQc+FvXFQMxTbLfZcso5X3cLQoLsFfaGc0Wwx
	 SubtOkdJbMDwOZCGEqR0rmU1YkNUJ26/Q+iGhzg+Cg9hVXLGa5pbMjrX1APoV6Qf9Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660132;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uJfNtNVmnfNND8tuhpLlIQhfsKyvuLzHczRnhNnq3AM=;
	b=B710QrW2rakC9xPkJypQmcS/Wu5U3ne8xEwCspWtZ0FOUeHN8VoxiwfQt7sz/qX0MN98
	 1cK0xJ3oHHWcGNsDZks2XsmJifrptv3T7vsZPKeLRJpT38MWiVtP7CQm5eTQUHts4iNhI
	 /6c72GgA8T375oK4+mvroPsnXvPty6hP/pvEQ8w6+CuOKKVSnluLAU5VOmqGbsTrJZkvK
	 /GHj3XaKL5rTnArzaJjO3An57A4/wGzL16s7CHGT1AeR3lIYI2h1Mk2Ee15hIjjCK3AjZ
	 XkB7l2ZECuiz94h5ObQQXnwAHais9JX1UZ75/tGfi/pBAnW1bwcN2/eMHwjNoR5pOSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XDAGrZs8;
	arc=none smtp.remote-ip=91.218.175.163
Received: from mta0.migadu.com (out-163.mta0.migadu.com [91.218.175.163])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E77606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46E77606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XDAGrZs8
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UE4RiX8U8HduN+nFaT8/pzBhYlXGFBfcU1QbZdGbl2U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794660128; v=1; x=1795264928;
 b=XDAGrZs8t6rr5NhLViqGmFucNcNqkG6I7iDlFazzi89jG0n4wP7gX+vI+LOj4TvznuSSgE+3
 tF4SvfZvznnY7vInAzBqNurt4c03aXY/8rayTMPYoVKOgeW/LLD9NdJFuXDroQbdX0c2mtUy9XN
 QM0hkeiqTjnLQOic0GfxSwM8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5aa57e8ac6425923;
	Sat, 14 Nov 2026 12:42:07 +0000
X-Mizu-Trace-ID: 5aa57e8ac6425923
X-Migadu-Flow: FLOW_OUT
Date: Sat, 14 Nov 2026 12:42:07 +0000
From: Bradley Morgan <bradley.morgan@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
CC: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] profile: account for partial /proc/profile reads
In-Reply-To: <41a747d4b3cd4bf3b266631a1f39ca69.1@linux-foundation.org>
References: <41a747d4b3cd4bf3b266631a1f39ca69.1@linux-foundation.org>
Message-ID: <C672A545-DFD4-4F4D-81A1-606FA6704C0D@linux.dev>
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

On 14 November 2026 06:30:37 GMT, Andrew Morton <akpm@linux-foundation.org>
wrote:
>From: Andrew Morton <akpm@linux-foundation.org>
>Subject: profile: account for partial /proc/profile reads
>Date: Tue, 20 Oct 2026 15:28:00 -0700
>
>read_profile() returns -EFAULT without advancing the file position
>when a user copy faults, even if earlier header bytes or a prefix of
>the counters were successfully copied.  A retry can therefore copy
>the same bytes again despite the previous read having delivered data.
>
>Return the number of successfully copied bytes and advance *ppos by
>that amount.  Return -EFAULT only if the fault occurs before any bytes
>are copied.  Preserve the four-byte sampling-step header, raw counter
>representation, and normal successful-read behavior.
>
>Avi Weiss's "profiling: fix sampling step on 64-bit big-endian
>systems" is unchanged.  This patch changes only short-read and fault
>reporting, not the output format.

Oh why not a series, please..

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
> kernel/profile.c |   17 ++++++++++++-----
> 1 file changed, 12 insertions(+), 5 deletions(-)
>
>--- a/kernel/profile.c~profile-account-for-partial-proc-profile-reads
>+++ a/kernel/profile.c
>@@ -157,6 +157,7 @@ read_profile(struct file *file, char __u
> 	ssize_t read;
> 	char *pnt;
> 	unsigned int sample_step = (unsigned int)(1UL << prof_shift);
>+	size_t not_copied;
> 
> 	if (p >= (prof_len+1)*sizeof(unsigned int))
> 		return 0;
>@@ -166,15 +167,21 @@ read_profile(struct file *file, char __u
> 
> 	while (p < sizeof(unsigned int) && count > 0) {
> 		if (put_user(*((char *)(&sample_step)+p), buf))
>-			return -EFAULT;
>+			goto out;
> 		buf++; p++; count--; read++;
> 	}
>-	pnt = (char *)prof_buffer + p - sizeof(atomic_t);
>-	if (copy_to_user(buf, (void *)pnt, count))
>-		return -EFAULT;
>-	read += count;
>+	if (count) {
>+		pnt = (char *)prof_buffer + p - sizeof(atomic_t);
>+		not_copied = copy_to_user(buf, pnt, count);
>+		read += count - not_copied;
>+		if (not_copied)
>+			goto out;
>+	}
> 	*ppos += read;
> 	return read;
>+out:
>+	*ppos += read;
>+	return read ? read : -EFAULT;
> }
> 
> /* default is to not implement this call */
>_

--- Thanks!
