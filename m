Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793037987;
	b=pEeALMhMNMnWqzIMJ7Q9uTFAu+c0EY3wpWMHzGfcAyxomZCvWmixVZHLnvtfDKenDumc
	 qZVzzQotEd1ho/ZAflaOKdVpOqwe6hwImcHvc27kBSxOJCaCaYkkZucLEvFDZEpTp7yVG
	 hYX2sspUpMp7bpp++GgsfOOV+Pr2LzHBE3Wq0uxA+0hozr41kDzEZk3bL7NU/OYUwz31N
	 wkWxoZsejvd8gIaORwKn2aah2ZcVlF7EcWkowPcVWCdVxzBJ9AHUF+6hykUH8xIlLFnx7
	 UHjuv5R1QJSCv4teugt1rjAH8Br5QY0UEMtBplKwpGBiQ+rYtgKfxuFnjvqAxljAUIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793037987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xHfjRrcnHq0gMjmE8KEiw2pb4RTHUukE8vXn8oTU6AA=;
	b=fS5FLA/CwLW8CtsU/asyj6IJSVg7UUk7OTTTa6EcoRxrA7s5jja+qkzNKvz3eT/7a53H
	 /5YJHJ6prdLHYzhcEn3cI7bcdflPWmfwdkcoJjm94pNAqjtNZW5wB1kcJO0GftkSY7Bxb
	 eEKK0KXiHITb+svYnWhqweDa4c48FYUNk+Log4A38oFRfRFf9zOMwz9eoyDq53Mk9CV+0
	 0uVZI7QMtxoGHaeNQc2+Mrjfhq5uuMUI+EfKqjB7cOKWHXj6fs9skqpvxlvh6qioJgrbB
	 Y0uM5F28AEMFgin6SP9jkGrV5AfxZKoh9y3hzgQdVR0UL+To+GDKBsoTMSO5oOvY1wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o6YgJ9hw;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1A5606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E1A5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=o6YgJ9hw
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e0d885929so2202327f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793037985; x=1793642785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xHfjRrcnHq0gMjmE8KEiw2pb4RTHUukE8vXn8oTU6AA=;
        b=o6YgJ9hwBkPl3jqVNbqlawnck8SEmLFj67acDobAFAJHw7IAOdzm/7GapKqpsYzHHb
         4/AxJx7EygdI7UDzPpEFU732U3zq5O6cUfZm0WevnyLaJyO9qa4Hy8IE7UFyTokTzkbo
         yhV16Dc0zG8els4Pu3fRhtKSr7i9yagF+hH+WH/fSljpWZxrw6HASGVpq3NheTiVMajf
         6Iqn/VwO9D1HJX2aZQxY/VKSduQz8+CO/TId8cWkSSj0fK5WCPK+4YExuTDUNZLx03Dg
         zgKOSf7WnGEHBhMXzuL88lL8Wy2rujcNbbfSLj4/BmuWunGkZNy5v4qu/MLmu/HDu8y9
         jIuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793037985; x=1793642785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xHfjRrcnHq0gMjmE8KEiw2pb4RTHUukE8vXn8oTU6AA=;
        b=xeYsqbiv+mjoqMKv5zgHi2dO+jxa/SW3kpTopQWICU1JwckCHlGeCOnPqdAHLIB93L
         1MKGf8dxyuMG3fzZK+kJFbugSXzNIjwRlovsfemWaompKBSfKohkEP002z7OZX2aAR7D
         msN67i+6Whq/CKvIMUezb7NTAWi0lKY4iBQBIR7mDqo8OE2yVLJoSO2OsZJ2Zk3+HDov
         UzHMNIqZfCbQGYBmF0jDc/YA84/P+qjrl8pmRqYGn0FvZ/y8pAhWs4El6AMPwR+YO7cm
         B/8uiK9yEgCxtU6eBIKWuaaCj/FwZ793Zxl64YOQTvCx+jCkifT+ofkSe9jpyODaujRh
         +bcg==
X-Forwarded-Encrypted: i=1; AKwUvBz/thdDZxXUBEVd4nt4VUmj/x45haHYaA1ef45Agmm/Zg47cK1l3/sNdPt1yDr6ptPok4yGLgT0JowvZUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxcRWjqNXSR2Q6KjVG8MmeB7RrJcAKOiFiixrECjF1O8BNU4N9
	7H8ZImrmLgx0MJ0FUA++9l0x6o7lCPItK86r9f7OK/+wqhe/FagSCxxI
X-Gm-Gg: AYBFou1q4uKnLCUvJl8SJKA7Feu45QnQ3d7ieIFNWOgoBujKuWYlOasS4ZUCEql2HtF
	WNN4aeHIv5hJcCiXIGbbowEJ5mJiEyg2CNPu7wcVgso8c5pBHWDobLzB1rPvv5Sm8EoSgx5fEOh
	iWLS3xigvjjO7dlCOGwwQ6Dy0/f0HS9xin360RYwy3B6cZ1clKx+U3I0T9qxcGnq9jyQDhgwC/P
	AdmXXbQuGpHwPB/IxpcYsvvSm9hiE1o50fDPJ2sKqGFyyZGF6Gob9ylq70g939Pnd8ukPAVNTWQ
	0cdGTy4SYDnYBrlN6ZCYROKRfa2Sk/UWQUvhYBudbQdr/CJQMJqB534wJMP4+c2l4N8zHjf1xMy
	p+MdpKFZUlZIJxAhloTvImWvRGT1KjN4fIGDgTR+08dTbTSow4F9ypyks7kLXvktyWGpq86/mUE
	E9PIv/0oYSEwbqmhrgpW4KSlRrc83ckVvd/S/bwxPHP3HgNk64xh+RNt5zoUCBjR05FXoAFrCe8
	gSl/3MW3no+kBOfOQdXbjpPvNkEtaEvd+MVg2dkzYXWvu0gOhWIherpBTBB0OUmd2WRCXiI0k96
	MW7SJKIMCj8Crh7QsfWea9UznLQ=
X-Received: by 2002:a05:6000:2405:b0:48e:517b:cf21 with SMTP id ffacd0b85a97d-48e517bcfedmr5799152f8f.26.1793037985247;
        Mon, 26 Oct 2026 11:06:25 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.109.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48fasm17694846f8f.31.2026.10.26.11.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:06:24 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-fsdevel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-mm@kvack.org,
	linux-api@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iov_iter: take an unsigned long segment count in import_iovec()
Date: Mon, 26 Oct 2026 19:06:18 +0100
Message-ID: <20261026180619.4147910-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

readv(), writev() and their positional variants, process_vm_readv(),
process_vm_writev(), vmsplice(), process_madvise(), vectored aio and
the btrfs encoded I/O ioctls all take a full-width segment count, and
all of them hand it to import_iovec() or __import_iovec().  Those take
an unsigned int count, so on 64-bit kernels the upper 32 bits are
dropped before iovec_from_user() checks the count against UIO_MAXIOV.

A count of 0x100000001 is therefore imported as one segment: writev()
on a pipe writes a byte and readv() reads it back, instead of both
failing with EINVAL.  A count of 0x100000000 returns 0 as an empty
vector.

import_iovec() was added with an unsigned int count, but the helper it
wrapped, rw_copy_check_uvector(), took an unsigned long, as does
iovec_from_user() today.  Until v4.1, readv(), writev(), preadv(),
pwritev(), process_vm_readv(), process_vm_writev() and vectored aio
therefore failed these counts with EINVAL, as did vmsplice() until
v4.18.

Widen nr_segs in both import helpers so the UIO_MAXIOV check sees the
count the caller passed.  Callers with 32-bit counts are unaffected.

AI assistance was used to find the bug, develop the fix, and run the
reproducers.

Fixes: bc917be81059 ("saner iov_iter initialization primitives")
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
Tested on x86_64 with virtme-ng, base 734bef548a96e vs patched:
readv, writev, preadv, pwritev, preadv2, pwritev2, vectored aio,
process_madvise, process_vm_readv, process_vm_writev and vmsplice with
counts 0, 1, 1024, 1025, UINT_MAX, 2^32, 2^32+1, 2^32+1024, 2^32+1025
and ULONG_MAX (LONG_MAX for aio).  The base kernel accepts 2^32,
2^32+1 and 2^32+1024 on every path; the patched kernel rejects every
count above 1024 with EINVAL.  Also built every caller with
allmodconfig W=1, and lib/iov_iter.o and the readv, vmsplice and
process_vm callers with i386 defconfig W=1.

Reproducer (64-bit userspace):
  cc -Wall -Wextra -O2 repro.c -o repro
  ./repro

// SPDX-License-Identifier: GPL-2.0-only
#define _GNU_SOURCE
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/syscall.h>
#include <sys/uio.h>
#include <unistd.h>

int main(void)
{
	char source = 'x', received = '-';
	struct iovec wiov = { .iov_base = &source, .iov_len = 1 };
	struct iovec riov = { .iov_base = &received, .iov_len = 1 };
	const unsigned long count = (1UL << 32) + 1;
	long wret, rret;
	int pipefd[2], werr;

	if (pipe(pipefd)) {
		perror("pipe");
		return EXIT_FAILURE;
	}
	errno = 0;
	wret = syscall(SYS_writev, pipefd[1], &wiov, count);
	werr = errno;
	close(pipefd[1]);
	errno = 0;
	rret = syscall(SYS_readv, pipefd[0], &riov, count);
	printf("writev=%ld (%s) readv=%ld (%s) byte=%c\n",
	       wret, strerror(werr), rret, strerror(errno), received);
	close(pipefd[0]);
	return EXIT_SUCCESS;
}

 include/linux/uio.h | 8 ++++----
 lib/iov_iter.c      | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/uio.h b/include/linux/uio.h
index fe2e985d74d24..529c6cd53df7a 100644
--- a/include/linux/uio.h
+++ b/include/linux/uio.h
@@ -362,11 +362,11 @@ struct iovec *iovec_from_user(const struct iovec __user *uvector,
 		unsigned long nr_segs, unsigned long fast_segs,
 		struct iovec *fast_iov, bool compat);
 ssize_t import_iovec(int type, const struct iovec __user *uvec,
-		 unsigned nr_segs, unsigned fast_segs, struct iovec **iovp,
-		 struct iov_iter *i);
+		 unsigned long nr_segs, unsigned int fast_segs,
+		 struct iovec **iovp, struct iov_iter *i);
 ssize_t __import_iovec(int type, const struct iovec __user *uvec,
-		 unsigned nr_segs, unsigned fast_segs, struct iovec **iovp,
-		 struct iov_iter *i, bool compat);
+		 unsigned long nr_segs, unsigned int fast_segs,
+		 struct iovec **iovp, struct iov_iter *i, bool compat);
 int import_ubuf(int type, void __user *buf, size_t len, struct iov_iter *i);
 
 static inline void iov_iter_ubuf(struct iov_iter *i, unsigned int direction,
diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 2072c04e99d05..55cf2ff5bfdad 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1362,8 +1362,8 @@ static ssize_t __import_iovec_ubuf(int type, const struct iovec __user *uvec,
 }
 
 ssize_t __import_iovec(int type, const struct iovec __user *uvec,
-		 unsigned nr_segs, unsigned fast_segs, struct iovec **iovp,
-		 struct iov_iter *i, bool compat)
+		 unsigned long nr_segs, unsigned int fast_segs,
+		 struct iovec **iovp, struct iov_iter *i, bool compat)
 {
 	ssize_t total_len = 0;
 	unsigned long seg;
@@ -1434,7 +1434,7 @@ ssize_t __import_iovec(int type, const struct iovec __user *uvec,
  * Return: Negative error code on error, bytes imported on success
  */
 ssize_t import_iovec(int type, const struct iovec __user *uvec,
-		 unsigned nr_segs, unsigned fast_segs,
+		 unsigned long nr_segs, unsigned int fast_segs,
 		 struct iovec **iovp, struct iov_iter *i)
 {
 	return __import_iovec(type, uvec, nr_segs, fast_segs, iovp, i,

base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.53.0

