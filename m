Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED0946F480
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 08:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941206; cv=none; b=oBEt12l7IMZ+SQI4qYCq25aQCXUN/jYzo9P1DzplPfLbeetQ8Gq6faDviVQ+AI2e0VCbMbjg/xi1XowakCIrhYICLE7XCDUReN9lO5N8QPPB7qsRFFFMreUBWNf8qv8Msu/jHts4HeDKWBHt44mubt41fhOKKsbQEhbFsj+QA/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941206; c=relaxed/simple;
	bh=N9z1K2SBrT9/svi51BfJs09jC4ZMQFUjvTpV6sRzPL0=;
	h=From:To:Cc:Subject:MIME-Version:Content-Type:Date:Message-ID; b=Y5jeSi6B2/CnLZPg0WP/CeF5gaaTKStiz44vtplTWduDa3POpcAhHe0EWG1RQri35kxmEH5tpE/T6JQF3r6nffXydqBmzOO0aYUMFBvkqd/EC+w6MS9XOTthPywibq/J5QJR2kTPhayo4loIYjHSfjlZveFbPG/jo9d/eMIPsLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Puwk+s/y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Puwk+s/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788941203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RPfNlsD27FEZu3u7e8EknywRWsoD80LV38mFdatAh9w=;
	b=Puwk+s/ygWvF36OzVw3aUqEjFgwUygyjH/CvGuXG0EhRJPRQgPOgF82oS/TudLEVwpvRVF
	1jl5+uHMRoizDi7ClRzybP6iUmwEFHyBCxMZF75I0fMX6QS+qqZAsQHo+USvEBDVUxSD5T
	bEIpijDUgxKNMwzE1qYF7SKCYpmU4CE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-YDBOeEJyPCSEDI1t1kGT9w-1; Wed,
 09 Sep 2026 04:06:38 -0400
X-MC-Unique: YDBOeEJyPCSEDI1t1kGT9w-1
X-Mimecast-MFC-AGG-ID: YDBOeEJyPCSEDI1t1kGT9w_1788941196
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F15E418005A4;
	Wed,  9 Sep 2026 08:06:35 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.32.158])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6F77940E;
	Wed,  9 Sep 2026 08:06:32 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: dhowells@redhat.com, Keith Busch <kbusch@kernel.org>,
    Hannes Reinecke <hare@kernel.org>, Christoph Hellwig <hch@lst.de>,
    Alexander Viro <viro@zeniv.linux.org.uk>,
    Paulo Alcantara <pc@manguebit.org>, netfs@lists.linux.dev,
    linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: [PATCH v4] block: Fix start and length check added to iov_iter_extract_bvecs()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1667274.1788941191.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 09:06:31 +0100
Message-ID: <1667275.1788941191@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Commit 14b007e17881 added an address check using iter_iov_addr() and a
length check using iter_iov_len() to iov_iter_extract_bvecs(), but these
cannot be used so and are unsafe in this circumstance as the functions hav=
e
hardwired assumptions about the iterator type.  They should only be used
with ITER_UBUF or ITER_IOVEC-type iterators; they shouldn't be used with
ITER_BVEC, ITER_KVEC, ITER_FOLIOQ, ITER_XARRAY or ITER_DISCARD iterators.

This proves to be a problem for cachefiles as an iterator of type
ITER_FOLIOQ is passed and iter_iov_addr() and iter_iov_len() both
malfunction because iter->__iov in iter_iov() is not pointing to an iovec
array.

Fix this by using iov_iter_alignment() instead.

Fixes: 14b007e17881 ("block: validate user space vectors during extraction=
")
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
cc: Hannes Reinecke <hare@kernel.org>
cc: Christoph Hellwig <hch@infradead.org>
cc: Jens Axboe <axboe@kernel.dk>
cc: Alexander Viro <viro@zeniv.linux.org.uk>
cc: Paulo Alcantara <pc@manguebit.org>
cc: netfs@lists.linux.dev
cc: linux-block@vger.kernel.org
cc: linux-fsdevel@vger.kernel.org
---
 lib/iov_iter.c |   18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/lib/iov_iter.c b/lib/iov_iter.c
index 6665372ecf71..2072c04e99d0 100644
--- a/lib/iov_iter.c
+++ b/lib/iov_iter.c
@@ -1921,15 +1921,29 @@ ssize_t iov_iter_extract_bvecs(struct iov_iter *it=
er, struct bio_vec *bv,
 		unsigned short max_vecs, unsigned mem_align_mask,
 		iov_iter_extraction_t extraction_flags)
 {
-	unsigned long start =3D (unsigned long)iter_iov_addr(iter);
 	unsigned short entries_left =3D max_vecs - *nr_vecs;
 	unsigned short nr_pages, i =3D 0;
 	size_t left, offset, len;
 	struct page **pages;
 	ssize_t size;
 =

-	if ((start | iter_iov_len(iter)) & mem_align_mask)
+	/*
+	 * DMA engines typically have both memory address and length alignment
+	 * requirements, so check these against the alignment mask.  For UBUF,
+	 * IOVEC and KVEC, only the current segment will be extracted from; for
+	 * everything else we might extract from multiple segments, so we need
+	 * to check those too.
+	 */
+	if (likely(iter_is_ubuf(iter) ||
+		   iter_is_iovec(iter) ||
+		   iov_iter_is_kvec(iter))) {
+		unsigned long start =3D (unsigned long)iter_iov_addr(iter);
+
+		if ((start | iter_iov_len(iter)) & mem_align_mask)
+			return -EINVAL;
+	} else if (iov_iter_alignment(iter) & mem_align_mask) {
 		return -EINVAL;
+	}
 =

 	/*
 	 * Move page array up in the allocated memory for the bio vecs as far as

