Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792722682;
	b=Qu39tJDmdeQASLAcevNBAxayWHUcJsjqvgVN4Ob4YC5MpFYelrEU9z3ePyGU1vAWbHjc
	 ApXJXR8VsRhJZ31T1lvzDqBAw7ptzRttkgkFwBQWVhynK83lYG6XXoNtRAXTQAVLnw6h2
	 h4WmK/ts1PqcctYnzgzPkqXvVwP51N2CfmWlaGE2ek/9snodAo78DuyMqARdX60Zqsoox
	 Iyd38odElR3kC/1ue2yMlVhD1C6HvVnRiAFI/aiw3OuCLMdb2mPkLh58ZimtURnXDH28H
	 n2XOWV0zdbTc+pMMozQ5qKm7odl+wkjHy0OZCmMdcKe6XUgHqc147k3O33er8cS8WDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792722682;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=HZzC1723EY2w+cC5K2qlsvEI7wuY7VANYPe4uNl7HOk=;
	b=BHvp/qILkcpo1PnZKmWQZ+y17QwU+9QHUuoEJ4F8H+geQ1hHn9i0REK60qFEsIyfqJUY
	 +JiKiQk+TvLxddK6uwuVE8aI8uzXAIkks7rduiltS3w3vNHFAx8tNFgKb37FGuMDXYZ9X
	 8/pfKDhM3SdliuOnAYc6f/ulOYiXBBEXFjeoWS9apB1nXuWB/YqlR/0ga6v4YDqGWcO1r
	 ElZ5oxPq79oiuL8IaPE8nblA1T+e6ni6P4/Y61b+t4YSgTiR1qaVOb5iowhI0z9MYzJgH
	 sDoDm7+pa/S4DLCFrzZtGk/ogfBzHOvEK9hFrFnnT1hMlNOO3l8kEhHbrKh0YLveb6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gyGZ0wUZ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9030F606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9030F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gyGZ0wUZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792722680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HZzC1723EY2w+cC5K2qlsvEI7wuY7VANYPe4uNl7HOk=;
	b=gyGZ0wUZQlQ7UjZmuP3QZmqu7W0KlvumzWUwzkuFLSnvr0mV6u78+fpO2rmhL5KgzuuPWR
	RYPfyH/kx3mHsN6+W4vrnGomvXSHXXyt/KbG2/72klXpxdiOKAIrj1JQmL1xNJ4lzzcKeI
	hutWRYCTPTlIBGdThePb3nVj7gt1XDs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32-ihdDI37kMBSM249ZqvrqQA-1; Thu,
 22 Oct 2026 22:31:19 -0400
X-MC-Unique: ihdDI37kMBSM249ZqvrqQA-1
X-Mimecast-MFC-AGG-ID: ihdDI37kMBSM249ZqvrqQA_1792722677
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E27281800631;
	Fri, 23 Oct 2026 02:31:16 +0000 (UTC)
Received: from lcapitul-thinkpadt14gen3.rmtcaqc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 811127DF;
	Fri, 23 Oct 2026 02:31:14 +0000 (UTC)
From: Luiz Capitulino <luizcap@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Jakub Matena <matenajakub@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [REGRESSION] mremap() fails VMA expansion when VM_MIXEDMAP is set
Date: Thu, 22 Oct 2026 22:31:06 -0400
Message-ID: <20261023023106.515365-1-luizcap@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Growing a VM_MIXEDMAP VMA with mremap(), with or without MREMAP_MAYMOVE, fails
with -ENOMEM when the address range after the VMA is free.

This regression was introduced in v6.1 by commit ca3d76b0aa80 ("mm: add merging
after mremap resize"). This commit changed mremap() to use vma_merge() instead
of vma_adjust() for the expansion case. However, vma_merge() returns NULL for
a VMA that has any of the VM_SPECIAL flags set.

The issue is also present in latest Linus tree, except that the code has been
refactored. In the current tree, the path now is expand_vma_in_place() ->
vma_merge_extend() -> vma_merge_new_range(), which performs the check:

	/* Special VMAs are unmergeable, also if no prev/next. */
	if (vma_flags_test_any_mask(&vmg->vma_flags, VMA_SPECIAL_FLAGS) ||
	    (!prev && !next))
		return NULL;

This issue was originally reproduced with an external module that sets
VM_MIXEDMAP on a VMA because it wants to insert pages with vm_insert_page().
However, there's at least one in-tree reproducer: tcp_mmap().

Note that commit ca3d76b0aa80 introduced other VMA expansion regressions,
but they were caught and fixed early:

- 6f12be792fde ("mm, mremap: fix mremap() expanding vma with addr inside vma")
- d014cd7c1c35 ("mm, mremap: fix mremap() expanding for vma's with vm_ops->close()")

Below you'll find a reproducer and an attempted fix.

Reproducer
==========

This reproducer was written by an LLM and uses tcp_mmap(). It reproduces
against v6.1 and latest Linus tree (2a08195e4db5). The issue is not
reproduced on v6.0.

#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <sys/mman.h>
#include <sys/socket.h>

int main(void)
{
        int fd, pagesize;
        void *p, *ret;

        fd = socket(AF_INET, SOCK_STREAM, 0);
        if (fd < 0) {
                perror("socket");
                return 1;
        }

        pagesize = getpagesize();

        /* tcp_mmap() sets VM_MIXEDMAP on this vma. */
        p = mmap(NULL, 2 * pagesize, PROT_READ, MAP_SHARED, fd, 0);
        if (p == MAP_FAILED) {
                perror("mmap");
                return 1;
        }

        /* Drop the upper half, so growing back into it can happen in place. */
        if (munmap((char *)p + pagesize, pagesize)) {
                perror("munmap");
                return 1;
        }

        errno = 0;
        ret = mremap(p, pagesize, 2 * pagesize, MREMAP_MAYMOVE);
        if (ret == MAP_FAILED) {
                printf("BUG REPRODUCED errno=%d\n", errno);
                return 1;
        }

        printf("NOT REPRODUCED\n");

        return 0;
}

Sketch fix
==========

In the fix below, I started with the same idea as d014cd7c1c35: on v6.1 I
made mremap() expand VM_MIXEDMAP VMAs the same way that commit did for 
VMAs with vm_ops->close(). Then I adapted it to the current tree. It fixes
the reproducer and I didn't get regressions in MM kselftests nor the
tools/testing/vma test.

However, I'm not posting this as a fix because I'm unfamiliar with the VMA
code so I'm not confident this is the right approach.

I really don't mind someone more familiar with the code taking this over.

diff --git a/mm/vma.c b/mm/vma.c
index 6c35f0d775ab..ac9a0a8a4be9 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -851,9 +851,15 @@ static int commit_merge(struct vma_merge_struct *vmg)
 	return 0;
 }
 
-/* We can only remove VMAs when merging if they do not have a close hook. */
 static bool can_merge_remove_vma(struct vm_area_struct *vma)
 {
+	if (vma_flags_test(&vma->flags, VMA_MIXEDMAP_BIT))
+		return false;
+
+	/*
+	 * We can only remove VMAs when merging if they do not have a
+	 * close hook.
+	 */
 	return !vma->vm_ops || !vma->vm_ops->close;
 }
 
@@ -1093,6 +1099,20 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	return NULL;
 }
 
+static bool can_merge_vma(const struct vma_merge_struct *vmg)
+{
+	/* VMAs without prev/next are unmergeable */
+	if (!vmg->prev && !vmg->next)
+		return false;
+
+	/* We can't merge VMA_IO, VMA_DONTEXPAND or VMA_PFNMAP */
+	if (vma_flags_test_any(&vmg->vma_flags, VMA_IO_BIT, VMA_DONTEXPAND_BIT,
+			       VMA_PFNMAP_BIT))
+		return false;
+
+	return true;
+}
+
 /*
  * vma_merge_new_range - Attempt to merge a new VMA into address space
  *
@@ -1152,9 +1172,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
 
 	vmg->state = VMA_MERGE_NOMERGE;
 
-	/* Special VMAs are unmergeable, also if no prev/next. */
-	if (vma_flags_test_any_mask(&vmg->vma_flags, VMA_SPECIAL_FLAGS) ||
-	    (!prev && !next))
+	if (!can_merge_vma(vmg))
 		return NULL;
 
 	can_merge_left = can_vma_merge_left(vmg);

