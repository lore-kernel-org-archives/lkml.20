Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B3F3B9D84
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791947657; cv=none; b=oAkdRb2n3X5T+cHGZNW088Aki0ecJUttHgMnZsdbU6mjgy5m03UY0dNdUFKaFNaYOYOqoybHyj9NqEDtmckuJ6z2zU4k+viAETyhrKoGK2wxwgwDCqIFJg0VmeXlSIlx2gmk8dcvtxpkYZ5rSL6ddy5Jqvcv8PYF9r3LcYFmMPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791947657; c=relaxed/simple;
	bh=coLPFIqywtPjzs0WGcN/LBOnMpZrQiEdCwllJXqNf7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t9dxsPbpzMaDzwvSt12FYRi0eD4UKNC8/G4iLR8Xgqbkj5EUjWkufNu/ZxasJOlFW0ivwF2vYJ+eo+HlCU7dXdU6hLIyA/wHJPNuqbceVkO6gLupry4U59g7L1tVcoWufnfzecq01f7uawreif1aSeoYRI/wNUOjIHgsL2RJ5Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=nW27Ss9q; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="nW27Ss9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Qg
	DLweGJbcN+p8LbKPcNn2/Fq8wZFtiysyyozTFsl6I=; b=nW27Ss9qtXLqBTup6y
	sOtw6aW0wluKo3t/4JSS/Vc46dypJka8JcZyuCjyYygWEpMV0TC080091e9V8USF
	JW4pzxXO3GXeiN0W4R4q9z+l6rifplFumQLZP+bj68IBMcbUGomUhxW1sNo+DtdT
	RKlrhCeVMv6whVNCyth/ZgvLc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD330I_885q6IC7Eg--.21712S2;
	Wed, 14 Oct 2026 11:13:04 +0800 (CST)
From: Haolong Wang <18766350203@163.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mm/memfd_luo: preserve the sealed exec-bit state; fix retrieve() leaks
Date: Wed, 14 Oct 2026 11:12:52 +0800
Message-ID: <20261014031254.432582-1-18766350203@163.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD330I_885q6IC7Eg--.21712S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxtw47Kw4xCFyfCw4DuF1xZrb_yoW7Zw1Dpr
	Z8Kwn8A34DGFyIvw47Zw4IvFyrA3yfJF45JrsrKry8Cay5WFnaqFyS9ayY9FyUAw1Sg3ZF
	vF4UCw18uayDAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFE__UUUUU=
X-CM-SenderInfo: jpryllawtvijiqt6il2tof0z/xtbC9gFbI2rO80FOCwAA3c

v1: https://lore.kernel.org/all/20261014003558.357783-1-18766350203@163.com/

Sashiko reviewed v1 and reported two issues, both of them real: the execute
bits were sampled long before the memfd stopped being usable, so the record
could be stale by the time it was handed to the next kernel, and retrieve()
leaked the preserved folios on its error paths.  Both are fixed here, together
with a third problem that the same reasoning exposes (the record carried a
single "some execute bit was set" flag, so a partially executable memfd was
restored with execute bits it never had).

Changes since v1:

 - Record the user/group/other execute bits separately instead of one "some
   execute bit was set" flag: an execute mask of 0100 was restored as 0111,
   inverting the guarantee this series is about.
 - Take the final sample of the execute mask and the seals in freeze(), under
   the inode lock, and freeze that state for the rest of the transition.
   shmem_setattr() (chmod), shmem_set_acl() (an access ACL rewrites the mode
   without going through shmem_setattr()) and memfd_add_seals() all reject
   changes from that point on, and a new .unfreeze callback clears the state
   when the update is rolled back.
 - Reject records with flag bits this version does not know.
 - Bump the record version to "memfd-v3" and keep reading "memfd-v2" records
   through a read-only handler, so that a record is never restored by a kernel
   that does not understand its flags.
 - Release the preserved folios when retrieve() fails, by sharing the cleanup
   with memfd_luo_finish().  This one predates the exec-bit work and is a
   separate patch with a Fixes tag.
 - selftest: an execute mask of 0100 with its full 0x3e seal set, a memfd
   without execute bits (MFD_NOEXEC_SEAL: mask 0000, seal set 0x20, still
   writable), and a skip when vm.memfd_noexec forbids MFD_EXEC.
 - Document the execute bits the record carries and the restrictions that
   apply once the update is committed to.

On record versions.  The flags cannot tell "the execute bits were clear" apart
from "the writer did not know about the flags", so records written before the
flags existed have to be told apart by the version string, which is compared
with strcmp().  The version is therefore bumped and a read-only handler for
"memfd-v2" is registered next to the current one:

  record writer   reading kernel and handler     result
  old v2          old kernel, v2 handler         default executable mode
  old v2          new kernel, legacy v2 reader   no execute bits
  new v3          new kernel, v3 handler         exact exec mask and seals
  new v3          old kernel                     no handler, -ENOENT

The legacy handler only reads records written by an older kernel: its
.can_preserve() always returns false, so it is never selected for an outgoing
preservation and every new record is serialized as "memfd-v3"; a "memfd-v3"
record is never handed to it either, because the compatible strings have to
match exactly.  If registration of the legacy v2 reader fails, the already
registered v3 handler is unregistered as well, so the kernel never ends up with
only one of the two handlers registered.

Row two is a one-time behaviour change for records written by a kernel without
these flags: an executable memfd preserved by such a kernel comes back without
execute bits.  That is the safe reading, but it is not what the old reader did
-- it never looked at the flags at all, it restored the default (executable)
mode -- so the change applies to every such record, not only to the ones that
were sealed with F_SEAL_EXEC.  Without the version bump an old kernel would
instead read a new record, ignore the flags and restore the default executable
mode, undoing exactly the guarantee this series restores; with "memfd-v3" it
has no matching handler at all, so the deserialization of that session fails
with -ENOENT instead of the memfd being restored wrongly.

Two things I could not close here, both written down in the patches:

 - f_pos can still change after freeze().  The LUO file API has no global
   userspace quiescence before .freeze() runs, so this needs a framework-level
   answer rather than a memfd one.
 - If kho_restore_vmalloc() fails, the folio array cannot be walked and the
   folios stay reserved; that API is not failure-atomic and cannot be retried
   after a partial failure.  A KHO-side fix or an allocation-free
   discard/iterator API would close it.

Testing:
 - the kernel builds from this tree with the liveupdate selftest config (plus
   TMPFS_POSIX_ACL/TMPFS_XATTR, so that the new ACL path is compiled);
   mm/memfd_luo.o, mm/shmem.o and mm/memfd.o build without warnings
 - QEMU live-update round trip (preserve -> kexec -> retrieve) with the new
   selftest: PASSED -- the memfd with execute mask 0100 and seal set 0x3e
   comes back with the same mask and seal set, and the memfd without execute
   bits comes back with mask 0000, seal set 0x20, data intact and writable
 - the same test against a kernel without this change: "execute mask changed
   across kexec: 0111 != 0100"
 - checkpatch.pl --strict on the series: 0 errors, 0 warnings
 - not covered by the run: the freeze-time rejection (it happens inside the
   reboot() path, so userspace cannot observe it) and the ACL path at runtime

Haolong Wang (2):
  mm/memfd_luo: carry the sealed exec-bit state in the preserved record
  mm/memfd_luo: release preserved folios when retrieve fails

 include/linux/kho/abi/memfd.h                 |  24 +-
 include/linux/shmem_fs.h                      |  20 ++
 mm/memfd.c                                    |   6 +
 mm/memfd_luo.c                                | 240 +++++++++++++++---
 mm/shmem.c                                    |  35 ++-
 .../selftests/liveupdate/luo_kexec_simple.c   | 208 +++++++++++++++
 6 files changed, 490 insertions(+), 43 deletions(-)


base-commit: 3a0b8fa2eb36afc88b62a95f33f0c77c71fa5ded
-- 
2.56.0

