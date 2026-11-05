Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901276;
	b=deFTirdfFA3ewmoOo/A7tYqPgZFD97Gb90AlVW3HtEcasJcAN+H/XBwARBlUMAZ1ofOW
	 qF9AtwvDweYwcesaSS/DRYzsm6CjmqNnMhril48G6e1hSNQ8BUpFXiKrKsuvfaMRo4YLw
	 XPcGg7u3zEiFYlGjI2qpG/F3IlDfzYnkgG2laRorqHNhJ9NZAklNTAvGvFRP+tFs16XTj
	 28IMBJFKb4DY4heLw4f2zWtUJoCQ+lQk2IesxcQyz+M8G53bMPBxF2rMZZFq0pHwjoXzS
	 MBjWwHxzHs+9JgA08n8pr4ewVgasM7B/SAex5vsU6ia11Ed5CV7HtPuMXqN2FEJjUFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901276;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=eNswTHRkAB3xpLhJNb2j9JZGG582cPl1mfH65MgD+RA=;
	b=RPBkpswrTgHz1HXFLgnaUmBP5dw9OelRE3N+pQ8NEsz9epFcQyX98nW4TrSF1Cmrr8Xi
	 Okpn2TFEzhCdzjXLTYMU//bzKCKZ9g5dif8F3UvWXHSm7jE+SluWQzsn99M0n7hO8UXbv
	 uCIO0YMMb/+6ytXpzKVC2g57Y8YLxL+deioaN7WDxkG7pIL2U68ECJcSdmUTl5kDTaUkv
	 MKgy4LHJXEMQ/hl/V+wc++G+fDhIaVzd9qmoONcdU2X+tc9HlyvzP0X7fyJVpDJiVBuxH
	 Xvy5JZcYBwFhdLFJEHO0POy2oqeys9SkLdH0damiUqwz1jj258957pWquKeqnEm1bPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fgzuvIbj;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9572606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9572606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fgzuvIbj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793901274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eNswTHRkAB3xpLhJNb2j9JZGG582cPl1mfH65MgD+RA=;
	b=fgzuvIbjXHVAdERlt7LjLyL/kUDfzU2M2a2bVJv5tDn3bTXaZbFL/+nDojESzn6OTliFdX
	tflVRmuxMzPZraF9bxAHxh4TWRmhokZM4E4snleoafh76gvBCWwtfMPmQz/4V10Qll9WRN
	dXmPyMpMDchSFNP8+DqvG0ewTtIzKKU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-whESyizYMTKoAN_7Vbzs-A-1; Thu,
 05 Nov 2026 12:54:29 -0500
X-MC-Unique: whESyizYMTKoAN_7Vbzs-A-1
X-Mimecast-MFC-AGG-ID: whESyizYMTKoAN_7Vbzs-A_1793901267
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 21F9319560B5;
	Thu,  5 Nov 2026 17:54:26 +0000 (UTC)
Received: from jocolema-thinkpadp1gen4i.rmtusco.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5366418004FC;
	Thu,  5 Nov 2026 17:54:22 +0000 (UTC)
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
Subject: [PATCH v2] selftests/mm: scale uffd memory region contingent upon base page size
Date: Thu,  5 Nov 2026 10:54:07 -0700
Message-ID: <20261105175407.638242-1-jocolema@redhat.com>
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

When executing the uffd-unit-test, the "move-pmd on anon" test will fail 
on aarch64+64k with a segmentation fault because the initial allocated 
memory region is too small.  This only happens with the move-pmd* tests 
because the architecture base page size is still utilized even though the 
memory region is specific to the size indicated by the pmd.

Patch 9f5c2aec3388 ("selftests/mm: fix uffd move-pmd test crash on 64K 
base page systems") implements an initial fix to the segmentation fault 
by skipping the test if the allocated memory region is not large enough 
for the number of pages x page size requested.  But as this will skip 
over the aarch64+64k pmd tests, this patch is intended to resolve the 
problem with 64k pages by scaling up the initial allocated memory region 
subject to base page size of the architecture.

Fixes: a2bf6a9ca805 ("selftests/mm: add UFFDIO_MOVE ioctl test")

Signed-off-by: John J. Coleman <jocolema@redhat.com>
---

I made some basic revisions, but as I am looking to gauge opinions on 
this email chain I am replying to the chain, I apologize if this is an
inconvenience.

Changes in v2:
 * Since psize() is included from vm_util.h through uffd-common.h, 
   PAGE_SIZE macro removed.
 * Added UL suffix to ensure integer is treated as unsigned long.

 tools/testing/selftests/mm/uffd-unit-tests.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index 2a97ba1d6feb1b35d6281449fd1917793a64fab1..3be227ed8d413f6e67e475862aba10ce13221446 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -13,8 +13,13 @@
 
 #ifdef __NR_userfaultfd
 
-/* The unit test doesn't need a large or random size, make it 32MB for now */
-#define  UFFD_TEST_MEM_SIZE               (32UL << 20)
+/*
+ * The unit test does not need a large or random size, but the allocation size
+ * needs to scale with base page size per architecture otherwise pmd alignment
+ * tests will fail for architectures like aarch64+64k.  For standard 4k pages, 
+ * this will allocate 64MiB, while allocating 1GiB for 64k page sizes.
+ */
+#define  UFFD_TEST_MEM_SIZE               (psize() * (16UL << 10))
 
 #define  MEM_ANON                         BIT_ULL(0)
 #define  MEM_SHMEM                        BIT_ULL(1)
-- 
2.56.0

