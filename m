Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214A0371CE3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791949991; cv=none; b=dcVUidNLWoI5rEsyippgLsBOJtr2hGmMX+7gFlUzPRwLwXVpU3YAMSmjVy+NxPl46HMgaki4g3Xly5Guc+Qmf/kXY4gVFeRs9++eNfJbjsQNvV9HyKE/vDruT8seuUI1kY5+uHuOtiZk1/kdvi78ZsQ8ywYVz12fL59vnYpIygs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791949991; c=relaxed/simple;
	bh=nNNGU7o40tC7QXU/COOaQkrPnEkNW/BqTs/t6WVz1Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2tcBk6FK1qfLxbHtNYrNt+4qVoI4NUEojzWjJTWU2wkwtLU3RQNB1d1oZ7g5Cl3z/TSYqysVGwyTdEkWhqVwDsvgkW86WBnmhFMCfiYVC0rEUXWl9eoOmL22OxpVWO9i+tKAp9OsGJ73wOuE75ZFaE1+/N96EF5Ej62yDFF+Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Buev6srr; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Buev6srr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2+
	+tFfM9B8L7twSBvgop9sHGqKoD1BT9lh1zNIeJBBg=; b=Buev6srrsrHKqgNz9E
	/fOv9uryMc/p8/yAe/VdQ81Zdprd7NeHqXFG+hFNoUGzmDx6nb8zurDhJakvoQgO
	B7n54YhLIEbGB5on+Fz+EH5E1dS1tReAasLh72KCB/uQ4O/Ox754YpQfS5KB6u0y
	cR407qnB3jlasjaACtf6XD7Lo=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnhW54_M5qIvm3EQ--.3735S2;
	Wed, 14 Oct 2026 11:52:25 +0800 (CST)
From: Haolong Wang <18766350203@163.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 1/2] mm/memfd_luo: carry the sealed exec-bit state in the preserved record
Date: Wed, 14 Oct 2026 11:52:16 +0800
Message-ID: <20261014035216.473794-1-18766350203@163.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <sashiko-outbox-170776@kernel.org>
References: <sashiko-outbox-170776@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnhW54_M5qIvm3EQ--.3735S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr47Wr4ktr18tF1kGF17Wrg_yoW5Ww4Upr
	Z8ta45tFWkKFyIv3yxAr18ZFyrAa1fAr4ak3s0grs5AFn8urn2vF1IgFyqv3WDJFZ7Wa90
	yw4Uury7Kw4UArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07US_M-UUUUU=
X-CM-SenderInfo: jpryllawtvijiqt6il2tof0z/xtbC9hmrc2rO-HkpgwAA38

Thanks, this is valid, and it covers the pre-existing bit as well.

SysV SHM is created through shmem_kernel_file_setup(), which is the wrapper
that passes S_PRIVATE down to __shmem_file_setup():

    shmem_kernel_file_setup() -> __shmem_file_setup(..., S_PRIVATE)
    shmem_file_setup()        -> __shmem_file_setup(..., 0)

Both end in clear_nlink(), so the inode is unlinked either way and the
existing predicate

    return shmem_file(file) && !inode->i_nlink;

admits the segment.  A descriptor obtained through /proc/<pid>/map_files/
refers to the same inode, so it reaches the preserve ioctl, and the flags
word it then shares is the one SHMEM_F_LOCKED lives in: shmem_lock() states
it itself ("What serializes the accesses to info->flags?  ipc_lock_object()
when called from shmctl_do_lock()"), while the LUO side holds the inode
lock.  That mismatch is older than this series -- SHMEM_F_MAPPING_FROZEN
was already updated the same way, so the new seal-state freeze only adds
another bit to it.

I will add a preparatory patch that rejects kernel-private shmem inodes
from the memfd LUO handler:

    return shmem_file(file) && !IS_PRIVATE(inode) && !inode->i_nlink;

Real memfds come from shmem_file_setup() without S_PRIVATE, so memfd
support is untouched.  What the check removes is exactly the
shmem_kernel_file_setup() set: SysV SHM, big_key payloads, the XFS buffer
and scrub files, and the anonymous /dev/zero mapping file.  Because
SHMEM_F_LOCKED is only maintained for SysV segments, dropping those also
removes the handler's only concurrent writer of that word.  That is why
this does not need the flags word synchronized or the shmem_lock()
read-modify-writes turned into atomic bit operations: both sides would have
to change for that to help (one atomic side still loses against one plain
read-modify-write side), and it would be a patch for the shmem and ipc
maintainers rather than for this series.

One thing I am not claiming: this does not narrow the handler to
memfd_create() objects.  Unlinked non-private shmem files, a deleted tmpfs
file for example, keep being accepted; they are simply not part of this
race.

Measured on the same tree, with CONFIG_CHECKPOINT_RESTORE and CONFIG_SYSVIPC
enabled so that a segment descriptor is reachable, running the preserve
ioctl on the descriptor taken from /proc/self/map_files (memfd_luo is the
only file handler registered in that configuration):

  kernel                SysV SHM fd        memfd     unlinked tmpfs
  without the patch     accepted (0)       accepted  accepted
  with the patch        -ENOENT (errno 2)  accepted  accepted

The sysv descriptor reads back as "/SYSV00000000 (deleted)"; the two other
objects are the controls that show the ioctl path still works and that the
check is limited to kernel-private files.

v3 will follow as a separate thread: the new patch first, then the two
patches of v2 unchanged.

