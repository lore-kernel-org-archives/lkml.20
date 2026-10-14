Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047211A9F90
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791949990; cv=none; b=lj2t73pCvhBVJHYNq4rYMrTdpTjhp5MLRFuPCcSNSeqOh4eCBbZJ1Ulv5SdfJjf/UHUFrKoICwD+HOPlMgedpS7ssIg0lBgMIAIxEhcl9z8dwXotS+sWp4xLe+JZmACOs5A4P22eSlNMhMFf1XXX85iTgfDJjfSwHQC8VmDlHRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791949990; c=relaxed/simple;
	bh=8U1ZzebfvKubUslqe0u3YsvFJ2vFk2Mg4H7iy6LZDOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gR1M7wcyRglQwjgKRs4zeMXaMfTS7fOUjnwYyxFWwQ5JE+oTmtcfWDJajpa8RlZV+4a3v8Wi4kyIQFKNERmkAOVoFLQBacF8z2I2OBbizslXDYX3Jod8Ts/pW/sUtmM69zq5aAzM5bIKDLyk3EdGx+5EZJmteZIat3V833JlezM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=QOqxztTa; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="QOqxztTa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7I
	4Ah0JVOQm1OSF3+TCarpY5Fjoooqn/9uhkbG0e7FE=; b=QOqxztTaHU/KDDMRWs
	qdZKtJ2toFL5dv+B5weTvnVzxv2avWG41VGnDWsahaetTdIh0sO6FsWMAgyNIBmc
	gUIQf9aYxmyy06DWRCrQHYEovx/ZVyCJabckLRg4o/t/NpySTtzEpcSHWKoWm4W6
	tjKwe9RVueeEhgAEMlz4U4zZQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBncnaF_M5qUtfjEQ--.37990S3;
	Wed, 14 Oct 2026 11:52:41 +0800 (CST)
From: Haolong Wang <18766350203@163.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] mm/memfd_luo: reject kernel-private shmem files
Date: Wed, 14 Oct 2026 11:52:26 +0800
Message-ID: <20261014035228.473825-2-18766350203@163.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014035228.473825-1-18766350203@163.com>
References: <20261014035228.473825-1-18766350203@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgBncnaF_M5qUtfjEQ--.37990S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAw1UXF4rZF4xZFWDKw48WFg_yoW5Kw1Dpr
	Z5K3WrCay8KFyI9a97Ar109asYva1fAF4agrZ0gw17C3WvvrnIqFyI9FyUuF4UJrZ5WFyY
	qr4YkryakF4UAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07URmh7UUUUU=
X-CM-SenderInfo: jpryllawtvijiqt6il2tof0z/xtbC0wmvd2rO-IlSxAAA3F

memfd_luo_can_preserve() accepts any unlinked shmem file.  That includes
SysV SHM files, which are created with shmem_kernel_file_setup() and
marked S_PRIVATE: a privileged process can obtain a file descriptor for
an attached segment through /proc/<pid>/map_files and hand that
descriptor to LUO.

The preservation path then updates SHMEM_I(inode)->flags under the inode
lock when it sets SHMEM_F_MAPPING_FROZEN, while SHM_LOCK and SHM_UNLOCK
update the same word through shmem_lock(), serialized by
ipc_lock_object() instead.  Two read-modify-write cycles on one word with
no common lock can lose either the LUO frozen bit or SHMEM_F_LOCKED, so
the frozen state the handler depends on may quietly not be in effect.
The seal-state freeze this series adds (SHMEM_F_SEAL_STATE_FROZEN) has
the same synchronization requirement.

Reject S_PRIVATE shmem inodes from the memfd LUO handler.  Real memfds
are created with shmem_file_setup() without S_PRIVATE, while
shmem_kernel_file_setup() deliberately uses the flag for kernel-private
objects: SysV SHM, big_key payloads, the XFS buffer and scrub files, and
the anonymous /dev/zero mapping file.  Those must not be preserved as
memfds, and dropping them also removes the only concurrent writer of that
flags word from the handler's reach, so no shmem-wide locking change is
needed here.

The predicate is deliberately not narrowed to memfd_create() objects:
unlinked non-private shmem files stay eligible.  SHMEM_F_LOCKED is only
maintained for SysV segments, so they do not share this race and keep
being preserved as before.

Measured with QEMU runs on this tree, with CONFIG_CHECKPOINT_RESTORE and
CONFIG_SYSVIPC enabled and liveupdate=on, so that a descriptor for a
segment is reachable; memfd_luo is the only file handler registered in
that configuration:

  kernel                SysV SHM fd        memfd     unlinked tmpfs
  without this patch    accepted (0)       accepted  accepted
  with this patch       -ENOENT (errno 2)  accepted  accepted

The SysV descriptor came from /proc/self/map_files and reads back as
"/SYSV00000000 (deleted)"; the memfd and the unlinked tmpfs file are the
controls that show the ioctl path still works and that the check is
limited to kernel-private objects.  The SysV case is the same guarantee
that the pre-existing SHMEM_F_MAPPING_FROZEN bit relies on, so the
mismatch is older than this series; atomic flag updates or a shared lock
would be a change across shmem and ipc, and this patch removes the
handler's exposure to it instead.

Fixes: b3749f174d68 ("mm: memfd_luo: allow preserving memfd")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/sashiko-outbox-170776@kernel.org/
Assisted-by: Pi:glm-5.3-flash
Signed-off-by: Haolong Wang <18766350203@163.com>
---
 mm/memfd_luo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
index 59de210bee5f..6f8b84530995 100644
--- a/mm/memfd_luo.c
+++ b/mm/memfd_luo.c
@@ -582,7 +582,12 @@ static bool memfd_luo_can_preserve(struct liveupdate_file_handler *handler,
 {
 	struct inode *inode = file_inode(file);
 
-	return shmem_file(file) && !inode->i_nlink;
+	/*
+	 * shmem_kernel_file_setup() marks kernel-private files S_PRIVATE.  In
+	 * particular, SysV SHM updates SHMEM_I(inode)->flags under its IPC lock,
+	 * which does not serialize with the inode lock used by LUO.
+	 */
+	return shmem_file(file) && !IS_PRIVATE(inode) && !inode->i_nlink;
 }
 
 static unsigned long memfd_luo_get_id(struct file *file)
-- 
2.56.0

