Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4875417A2F6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 01:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791338273; cv=none; b=Lp2vvvXzDmpYgLimDcgLN8QMLCxOd/aj45cbKS4SbO18pyS5vm96/h7XXGoLLDmKqRz6C2LFPd14qOC6dZa0AaoDe4tvvnzhT+3owXdDlWqWyTuYHd0micpy0jnZU9t/a7qAaOiVkQ6KlNLlPoCWV1Rr/VKJeCpMRZvl5LSOQV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791338273; c=relaxed/simple;
	bh=EnH+Y+4cL2AjL+MfdV9nfQghjAGlt8P35VugtZxmsj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MSQDSHo36S1K4bpQR/nEdPDETKtkLUmAjGcKFgsFq2l0NZOfF+AOhWfnUp8is7JhA+3tz+lH5/LILAAZ9kOrMd0a7ntvPIOcKJcE5tm4P/iKkoIHpz0fWhEHmI/2v6zQ13qTEApdw409syj06sO8s794+XxCD+82aC9bx0QqkDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TwzuOkWJ; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TwzuOkWJ"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so10115561eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 18:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791338271; x=1791943071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Co7b2LMbzdCPsCsbgcCtLsS9QDYuBuOKqGML2L6dVHc=;
        b=TwzuOkWJgAM8y1k2TehcGGNInheRgn0BFiGCW25ci6z3d5+E6NR2bZiWTsC965lqlM
         pfzXMAauczy+xc5HrEVJfwMl2NnYfn9v82MsiUxJ0bisx+UMzmOH4d8ti8hyXvvceh7X
         IwiVX5h1+ak6GA2PwRRpB67GqvBtxXVwZJyYMNw7bX0RPwlkzRdw/1NCjhwZbITl3MuG
         ve3tVTzAUA107cO8voRpYOBOBKuH63pZpcS6jsekp1SMKqE09Xzy6SW2mzOArXIe2MIr
         bUplMHpRfWC5xWKz5kHK0A09+7FArkNtuUjGewMnHEye5JOZ5g+VKKGP3VyiE+lZjpNE
         WS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791338271; x=1791943071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Co7b2LMbzdCPsCsbgcCtLsS9QDYuBuOKqGML2L6dVHc=;
        b=Q5ShY6LRrqcc3Zew0IOW03gra6HYOxB5fVkh0YLQrLDG5v0nQqnD5AH3QCML6uKYel
         Kle2rxRFyvP6dPYF5bQr5hFsu+JuxlOLU7dWYk65HvFK0hvCrK4ap4LqOYWT7oABh8+E
         N2Z03LO3YMYOnw8xQIB7WA9X6di+n6LLm6qiqnG2+NTE6kBKNau/WWi/QJ0kvk05yQD6
         XSxs0ZIO4NgyQU6oXLjBppzK/d+olVGmVv0hJrZ2J08EAPHFRZi7thpPIRb+DBJahst7
         a7c3nFCnjbsNHN/HBLA1VJV/X5MWMNVtdaFe13An7E+h4N1MXOaBxYjdY36O3j486bqd
         q8KA==
X-Forwarded-Encrypted: i=1; AKwUvByOrGr3LOr8MSjphf3SvlmUOUzRxDfvJfY69nyb6UOFKaPg5riAd4PSouvStPLqDQuvrCl5x69FK8xx7jM=@vger.kernel.org
X-Gm-Message-State: AFuF++n0CKgfBeI/F0h4hWH4iICwZy6d1nTbAA3MZnfXeAIhW3Xl4m14
	VRrbm4UmJqJrMw7oumXKLutK2nqbY/bftlBBFBvELHjUdavjA+cMUblDd4ciAQ==
X-Gm-Gg: AYBFou0peDDPquleoW1J396hu99Eb22FZotVxFGOVmm9ywaXEmiyK8qek3D5EXVtWKr
	T52RKIPyh2gMbQGLrvwGF+ZNiu3JLtEsKV95LYXddbQW+4edZ9vhAXzf9wyaKqcb87V9uznrmgU
	yquspwkMnD4gEs4JUAvAfpExxBNZn4Z+rm8KiqxLq3FjkOX4RyTLUERPZRZm13zxG+iFxiOAsvR
	Qgi56LQSm44fDPjqwr5AdoBKpqw5kDK2nKt28PBz4ow1Bh89aTy0xTScLVoa2oWRez1iBuB0NZu
	yUWzVGYKt0hJqpS4/5EH0CCo6N+QFNLBSZI2lhTmrFdLm3jJFSKH+qh9ES2wp9J+sJnn2gagB8I
	QyRip9t0hgU7t2qCvz7ill8xyTKfcDxoM5GCvQHuPkkVaZ+k4BECEeY3ZqAqb9kuY9t3eoi98oE
	ZaOW/ZdQfCzw07pmQOQU8Lb9Vfa9aPnm/HcrTWXUpyAJ+no3gyAvW1iHvTdtlDA7/02C8B27flZ
	CtojOsFFW45rKbY/rx9ygmzgQ==
X-Received: by 2002:a05:7022:69a9:b0:143:2984:6517 with SMTP id a92af1059eb24-1620966b83amr909080c88.38.1791338270950;
        Tue, 06 Oct 2026 18:57:50 -0700 (PDT)
Received: from FredPC.lan ([2600:381:9f1f:6c0f:5b83:27bd:dced:34e2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1616980c3b7sm2156652c88.16.2026.10.06.18.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 18:57:49 -0700 (PDT)
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	David Howells <dhowells@redhat.com>
Cc: Jeff Layton <jlayton@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fredric Cover <fredric.cover.lkernel@gmail.com>
Subject: [PATCH] netfs: Fix off-by-one in the flush range in netfs_page_mkwrite()
Date: Tue,  6 Oct 2026 18:57:01 -0700
Message-ID: <20261007015702.111459-1-fredric.cover.lkernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a page fault wants to make a folio writable but the folio belongs
to a different netfs group (e.g. a ceph snap context) than the one the
write is being made under, netfs_page_mkwrite() flushes the folio and
retries the fault.  It does so with:

	filemap_fdatawrite_range(mapping,
				 folio_pos(folio),
				 folio_next_pos(folio));

filemap_fdatawrite_range() takes an inclusive end offset, but
folio_next_pos() is the position of the first byte of the following
folio.  The range therefore covers one byte too many, and writeback is
also run on whichever folio contains that byte.

filemap_fdatawrite_range() is a WB_SYNC_ALL operation documented as
waiting upon dirty or in-writeback pages in the range, so the faulting
task can stall behind I/O on a neighbouring folio that has nothing to
do with the fault, and a neighbouring dirty folio is written out early.

The off-by-one dates from the original implementation, which passed
folio_pos(folio) + folio_size(folio) as the end of a
filemap_fdatawait_range() call, which also takes an inclusive end.  It
was carried over when the call was changed to
filemap_fdatawrite_range().

The flush of the faulting folio itself is unaffected, so this does not
cause data loss or incorrect results, only unneeded writeback and
latency.

Fix it by passing folio_next_pos(folio) - 1, as the flush_content path
in netfs_perform_write() already does with fpos + flen - 1.

Assisted-by: LLM
Fixes: 102a7e2c598c ("netfs: Allow buffered shared-writeable mmap through netfs_page_mkwrite()")
Signed-off-by: Fredric Cover <fredric.cover.lkernel@gmail.com>
---
 fs/netfs/buffered_write.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index ecf119b4f9166..b398c3bef6f3c 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -579,7 +579,7 @@ vm_fault_t netfs_page_mkwrite(struct vm_fault *vmf, struct netfs_group *netfs_gr
 		folio_unlock(folio);
 		err = filemap_fdatawrite_range(mapping,
 					       folio_pos(folio),
-					       folio_next_pos(folio));
+					       folio_next_pos(folio) - 1);
 		switch (err) {
 		case 0:
 			ret = VM_FAULT_RETRY;
-- 
2.53.0

