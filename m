Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794E3955D1
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947610; cv=none; b=jCkWZ1yRvkCHCC+pesvzEfCwWY8nUKVZBtGXtMK6cN2NmH+sKqQHxwFfRHPrdS2AepuLSOarBtEKbhWx3fCKlgSdQWiRKmme4l655SC2solRKWzlNjByoVK0MCQdoB08efHVu9tAvXjtWN7ZFaOzSJQo/lp9xRuHmpIoNUAqsBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947610; c=relaxed/simple;
	bh=3TOivm9YmAX5+8Lk+9NHkDa52O1JqZFE5vJ6hEgM8AM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9EQ78KzOep7O1MaUUPeqhZUA4jHZCYzR9+N5YOFX4F4qncGiIOk51rprHL49Odo9oBA9YB2hMDar24UCTVZr25pExufzoz8zLMq1bPnm84A6gt5gt85u64e+Jxa/aLMZaVWD3G5J0DLv5v6u1+zXwgPYgjp0wXBUYbzOtDiOf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=I/Ve6Ntv; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="I/Ve6Ntv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7G
	Q2NJ+XFehaoUKQh9K8T656Nb9kxKH0kwaVt8iqHl4=; b=I/Ve6NtvlPGIqUL+ZA
	VubSUKBOj9Eh28JifaDZ2YLNsyeYTJB6el9RxdWWhxSUeyfcASGDdcSdR5iVAIDV
	bv15TNmCIUgBABh7MvzDaB61Bkmbe6cgRNx+WuvX8LKY7XAvnExoO1RyyBcrN2vo
	ti6xnEcYS9eTsWg/IGNcjw+Q8=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgB36cMq885qzbNoEA--.22532S2;
	Wed, 14 Oct 2026 11:12:43 +0800 (CST)
From: Haolong Wang <18766350203@163.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/memfd_luo: carry the exec-bit state in the preserved record
Date: Wed, 14 Oct 2026 11:12:35 +0800
Message-ID: <20261014031235.432509-1-18766350203@163.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-170651@kernel.org>
References: <sashiko-outbox-170651@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgB36cMq885qzbNoEA--.22532S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXF4fJF13Gw48XrWfAr47Arb_yoWrtFyrpr
	Z8Kr1Yyw1kGa40vw4xZw1IqryrA3yIyF1rJFs8Kry7A3W5WF1SqFWFga4Y9FyUGrnaga42
	qa1j9348Za98Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uyq2_UUUUU=
X-CM-SenderInfo: jpryllawtvijiqt6il2tof0z/xtbC1AxWHmrO8yxxJQAA3-

Thanks for the review.  Both findings were real.

On the exec-mode snapshot: the sample itself was atomic -- the mode is
read under inode_lock, in the same critical section that sets
SHMEM_F_MAPPING_FROZEN -- but it was taken far too early.  The frozen
mapping only rejects growing, shrinking and fallocate(); fchmod() of the
exec bits (until F_SEAL_EXEC is set) and F_ADD_SEALS are not checked on
that path at all, and freeze() refreshed only f_pos.  v2 closes this from
both ends: freeze() takes the final sample of the exec mask and the seals
under the inode lock and, in the same critical section, sets a new
SHMEM_F_SEAL_STATE_FROZEN inode flag before dropping the lock.  From
that point on shmem_setattr() rejects exec-bit changes, memfd_add_seals()
rejects new seals, and shmem_set_acl() rejects access-ACL updates.  The
flag is cleared by a new .unfreeze callback when the update is rolled
back, and defensively by unpreserve().

Two more things fell out of that work:

 - A single "some exec bit was set" flag was not enough: an execute mask
   of 0100 (mode 0700) came back as 0111, which is the inversion this
   series is about.  The record now carries the three execute bits
   separately, retrieve() restores the exact mask and rejects unknown flag
   bits, and luo_kexec_simple.c round-trips an execute mask of 0100 with
   its full 0x3e seal set, plus a memfd without execute bits
   (MFD_NOEXEC_SEAL: mask 0000, seal set 0x20, still writable), which is
   the state the original report was about.
 - An access ACL rewrites inode->i_mode without going through
   shmem_setattr(), so the frozen state has to cover that path too.
   Scope note: F_SEAL_EXEC itself is still bypassable by an access ACL
   write (posix_acl_update_mode() updates the mode directly, with no seal
   check anywhere on that path).  That is a pre-existing
   F_SEAL_EXEC/vm.memfd_noexec issue, deliberately not part of this
   series; I will report it separately with a minimal repro.

On the folio leak: also real.  retrieve() now releases the preserved
folios on every failure path by sharing the cleanup with
memfd_luo_finish().  The folio array is restored before the file is
allocated, so the later error paths (memfd_alloc_file(),
memfd_add_seals()) can release the folios directly instead of allocating
memory while already handling a failure, and memfd_luo_retrieve_folios()
takes ownership as soon as it runs, so nothing is released twice.  It
predates the exec-bit work, so it is a separate commit with a Fixes tag.

Two limitations I could not close here, both written down in the patches:

 - f_pos can still change after freeze().  The LUO file API has no global
   userspace quiescence before .freeze() runs, so this needs a
   framework-level answer rather than a memfd one.
 - If kho_restore_vmalloc() fails before consuming anything (for example
   its own kvmalloc() fails), the folio array cannot be walked at all and
   those folios stay reserved.  That API is not failure-atomic and cannot
   be retried after a partial failure, so it needs a KHO-side fix or an
   allocation-free discard/iterator API.

On record versions: the record is now written as "memfd-v3", and a
read-only "memfd-v2" handler is registered next to it.  The compatible
strings are matched exactly, so the matrix is:

  record writer   reading kernel and handler     result
  old v2          old kernel, v2 handler         default executable mode
  old v2          new kernel, legacy v2 reader   no execute bits
  new v3          new kernel, v3 handler         exact exec mask and seals
  new v3          old kernel                     no handler, -ENOENT

Rows two and four are both behaviour changes, and neither direction is
interoperable: an executable memfd preserved by an older kernel comes back
without execute bits (row two -- the safe reading; the old reader never
looked at the flags, it restored the default executable mode), and a new
record handed to an older kernel finds no matching handler at all, so the
deserialization fails with -ENOENT instead of the memfd being restored as
executable again (row four, which is why the version is bumped).  The
legacy handler only reads records written by an older kernel: its
.can_preserve() always returns false, so an outgoing preservation is
always serialized as "memfd-v3".

v2 will follow as a separate thread.

Both changes are covered by a QEMU live-update run (preserve -> kexec ->
retrieve) with the liveupdate selftest: the memfd with execute mask 0100
and seal set 0x3e round-trips exactly, the memfd without execute bits
comes back with mask 0000, seal set 0x20 and still writable, and the same
test against a kernel without the change reports "execute mask changed
across kexec: 0111 != 0100".  The numbers are in the v2 cover letter.

