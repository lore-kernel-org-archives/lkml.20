Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737303;
	b=APaGd8gfQfNuf2fZLJvZBv7KZwCLMHCHIQ3mneW9+lvrsccH8lx9Q/FhdQSjvtoWQvRd
	 vh2J13T1JbYtOZm9RP81MJt6obEeZ5AnY8n22PMmM59HghbuPwuZw0CpHDFyUnNJ9FtsF
	 uEK7kYkVzv+PkdN6k3GHCBfuAyQ2RRn1yLAmEpC34RiymSY5uNhRVB/LluNGmOPd8hdBQ
	 55hyXIuDUNxH3cOGMpPylQgclz14XYGk1T0P0iMh/IfWJui46QmVsWsP5l965uUFOoLss
	 A5fNOj1G+oJ7p48Vzep4lUktbYfpZrnGFyg4ihgd30UfyWmhApgT/eEPJMEULi8Pv5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737303;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=4CQ9QXYgEq5HlpZ4WHk4AkIIAa+3/a95hTxApO1XSIs=;
	b=EqCVvwOOv9SORSTukGlOFJ3Lf1qJRSbF6hTDju8cF2AzM4BB6QpwzM2anbHG9t0X8Hbu
	 KdfDNllLiB8ZFoWFMz2RLbnXKYLJ7bZMH7Jp/b0tv9faBvg+zIQ/Q78f/u0E01ehyDoRD
	 FXqhCXnF6agERgULVMffWgdtkVnSe4YRNH9TQ4pXyHGTZ/mguBlZTavrakyCvZ27mRU8I
	 dGeCKGVRvJ2KhpJoGi70EcTs0YlsmshTsLGtVIQG58My27zie8VaQqjcn1KkjZxCtSlKL
	 9P3WJALbZPor7y4qfu7+XXxhuVEPFrsTB7LKac/cUCgS79S7RfQXa6C0ciP48q++iYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FpHPeaD5;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E2CB606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E2CB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FpHPeaD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793737301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4CQ9QXYgEq5HlpZ4WHk4AkIIAa+3/a95hTxApO1XSIs=;
	b=FpHPeaD5HpO72jgRfMWFwnFiFyJw6WQuDSwKNq3yyB/pFSeadU2/K7+lcOzxtSML3j+NS9
	8xjHkOLEkvnzLcoCgKgH1anf6YLdqryGbZ/6FEZG2t9JuoFJrNflvwYD++AHPSFWywzr6z
	iObmHsNfeXLt4i8UJw4FuShyU3fPMXo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-y3M3VMR7O3mDnncLOjtuSA-1; Tue,
 03 Nov 2026 15:21:38 -0500
X-MC-Unique: y3M3VMR7O3mDnncLOjtuSA-1
X-Mimecast-MFC-AGG-ID: y3M3VMR7O3mDnncLOjtuSA_1793737296
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8547E18002F8;
	Tue,  3 Nov 2026 20:21:35 +0000 (UTC)
Received: from jocolema-thinkpadp1gen4i.rmtusco.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6FE4A18004D2;
	Tue,  3 Nov 2026 20:21:32 +0000 (UTC)
From: "John J. Coleman" <jocolema@redhat.com>
To: zenghui.yu@linux.dev
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	peterx@redhat.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org,
	audra@redhat.com
Subject: [PATCH] selftests/mm: scale uffd memory region contingent upon base page size
Date: Tue,  3 Nov 2026 13:20:49 -0700
Message-ID: <20261103202049.499206-1-jocolema@redhat.com>
In-Reply-To: <20261011163527.95988-1-zenghui.yu@linux.dev>
References: <20261011163527.95988-1-zenghui.yu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

When executing the uffd-unit-test, the "move-pmd on anon" test will fail on
aarch64+64k with a segmentation fault because the initial allocated memory
region is too small.  This only happens with the move-pmd* tests because the
architecture base page size is still utilized even though the memory region is
specific to the size indicated by the pmd.

Patch 9f5c2aec3388 ("selftests/mm: fix uffd move-pmd test crash on 64K base page
systems") implements an initial fix to the segmentation fault by skipping the
test if the allocated memory region is not large enough for the number of pages
x page size requested.  But as this will skip over the aarch64+64k pmd tests, this
patch is intended to resolve the problem with 64k pages by scaling up the
initial allocated memory region subject to base page size of the architecture.

Fixes: a2bf6a9ca805 ("selftests/mm: add UFFDIO_MOVE ioctl test")

Signed-off-by: John J. Coleman <jocolema@redhat.com>
---

I too have been looking into a solution for aarch64+64k.  I wanted to gauge your 
thoughts on this patch to scale up memory allocation region size predicated on 
architecture base page sizes.

 tools/testing/selftests/mm/uffd-unit-tests.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 2a97ba1d6feb1b35d6281449fd1917793a64fab1..c6cebb3c880d0b47e44c8afc4e3a4c3050cea579 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -13,8 +13,14 @@
 
 #ifdef __NR_userfaultfd
 
-/* The unit test doesn't need a large or random size, make it 32MB for now */
-#define  UFFD_TEST_MEM_SIZE               (32UL << 20)
+/*
+ * The unit test does not need a large or random size, but the allocation size
+ * needs to scale with base page size per architecture otherwise pmd alignment
+ * tests will fail for architectures like aarch64+64k.  For standard 4k pages, 
+ * this will allocate 64MiB, while allocating 1GiB for 64k page sizes.
+ */
+#define  PAGE_SIZE                        sysconf(_SC_PAGESIZE)
+#define  UFFD_TEST_MEM_SIZE               (PAGE_SIZE * (16 << 10))
 
 #define  MEM_ANON                         BIT_ULL(0)
 #define  MEM_SHMEM                        BIT_ULL(1)
-- 
2.56.0

