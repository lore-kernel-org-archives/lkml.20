Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792786881;
	b=DBwSJrUDy8nb5gHOQDmjg/UfPDRjJHCRoLFU3pxLjYbBtBwP6KT7++5+81bhRvQphdG1
	 ZgvqsnTk+rJJC7MEG5nt/E1jTpbcI0v2LkOobJ00jIRkGCC1LO1hJpDgGRznSxLo5GAhq
	 oEMLgUI7d1ullCjR7YuR5byNNoS7zqcDGtOY08/VeIJOzYLLTMGqZqHw0/BESIpnwgDOO
	 OeiKtxkFPWN1qggzlG/vtUwOqRVGRlzvXXOsq9vwE8YkNiheo3po5QuyRgxM1KxgiRkhv
	 fU2V2ZBRh3r/fviFy0U9EExmcRn0iovNAsKAuQUKzryLAW7QeCUI7OIkk+vvoJw1OLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792786881;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=KiicLmvcEJTvj4IUoFShe1zCkXcPbAaG1PST3Sy3hOY=;
	b=RV9gtMAaGsJmEGdTIefmy80R82b7GNw+UYcBWCmQNcuP2KWE2taKYNYpnnpnffTpjtLQ
	 rnvX7/vZFJ13UJ4EgqTp+Xwf6LJRQ2WQ5Q0z0z4AG/dv8YvhIWDzMiLQ3iodT7At1M3cB
	 4oiqnVODiYw373OTmhvWVLhVb74CUcN2KvbJHGGq3V6JyNSMzK6s7+cuQAuBfGbRY/Aq6
	 DfG18BTdx4UmfOEXPymcuQFYO6/D3X00oAz4UAnbcVnxcsgqHlJzugpBDgoBED8evOi1O
	 wx7RYAp7d7onbXuZ56vaxqX2gdPKROaPnQGHUP6vGeEvoZvQ3SMPPdM8sWY6RwsEtng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=VWy0WdGa;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6628F606A31A;
	Fri, 23 Oct 2026 20:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6628F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=VWy0WdGa
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A6E5F40915
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1792786879; bh=KiicLmvcEJTvj4IUoFShe1zCkXcPbAaG1PST3Sy3hOY=;
	h=From:To:Cc:Subject:Date:From;
	b=VWy0WdGaMI6K/kRrPLKn78UmBR8zOSjJwB8vv9MWdZGXjlfLNvRlrf7SD7dU7XBLN
	 RCTWtUjoMokps474J2EvS+ElcKfubghxKiKPjE+hqlUco1ptsyAo4E/9YHa2KTzWNK
	 DXK/m2NCS3L3BTfhXvJ7orczYvGPiaRua9S22FoNNcfMSfqvPUikx5quvHIxXom9un
	 52dfk1OJySJyvqUMBb/EZXOD3vYdZCnnSEyFEsetmwKe4i5RnRiIbTO4J51KZ13i87
	 XC8Unn58azGD2CAmBAoj/nPpgkHeCl4ar4tdv+H7uz2LQCJo3jH9Raeck50/oFAm8P
	 0wuhMjQG8NigQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A6E5F40915;
	Fri, 23 Oct 2026 20:21:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] uaccess: fix some erroneous kerneldoc comments
Date: Fri, 23 Oct 2026 14:21:18 -0600
Message-ID: <87se1ww4ld.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Several of the comments in include/linux/uaccess.h generate kerneldoc
warnings due to the use of "/**" markers on non-kerneldoc comments and
unmarked literal blocks.  Bring these digressions into form and eliminate a
number of docs-build warnings.  No changes to code or documentation
content.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
Naturally bringing this file into the docs build turned up some
warnings; this fixes them.  Happy to ship it with my other patch or let
it go through -mm, whatever works.

 include/linux/uaccess.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index eddbbb65ccc4..67cdb0a4f583 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -357,7 +357,7 @@ extern __must_check int check_zeroed_user(const void __user *from, size_t size);
  * struct).
  *
  * @ksize is just sizeof(*dst), and @usize should've been passed by userspace.
- * The recommended usage is something like the following:
+ * The recommended usage is something like the following::
  *
  *   SYSCALL_DEFINE2(foobar, const struct foo __user *, uarg, size_t, usize)
  *   {
@@ -447,7 +447,7 @@ copy_struct_from_user(void *dst, size_t ksize, const void __user *src,
  * about data it does not.
  *
  * @ksize is just sizeof(*src), and @usize should've been passed by userspace.
- * The recommended usage is something like the following:
+ * The recommended usage is something like the following::
  *
  *   SYSCALL_DEFINE2(foobar, struct foo __user *, uarg, size_t, usize)
  *   {
@@ -529,7 +529,7 @@ __copy_struct_generic_bounce_buffer(void *dst, size_t dstsize,
 	memcpy(dst, src, size);
 }
 
-/**
+/*
  * This is like copy_struct_from_user(), but the
  * src buffer was already copied into a kernel
  * bounce buffer, so it will never return -EFAULT.
@@ -553,7 +553,7 @@ copy_struct_from_bounce_buffer(void *dst, size_t dstsize,
 	return 0;
 }
 
-/**
+/*
  * This is like copy_struct_to_user(), but the
  * dst buffer is a kernel bounce buffer instead
  * of a direct userspace buffer, so it will never return -EFAULT.
@@ -770,7 +770,7 @@ static __always_inline void __scoped_user_rw_access_end(const void *p)
  * If the user access function inside the scope requires a fault label, it
  * can use @elbl or a different label outside the scope, which requires
  * that user access which is implemented with ASM GOTO has been properly
- * wrapped. See unsafe_get_user() for reference.
+ * wrapped. See unsafe_get_user() for reference::
  *
  *	scoped_user_rw_access(ptr, efault) {
  *		unsafe_get_user(rval, &ptr->rval, efault);
-- 
2.55.0

