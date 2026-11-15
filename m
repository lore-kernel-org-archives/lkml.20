Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749208;
	b=Zpa/U2l33B2wozcHNgbulaSSJmV5lnviJtw81X4Zqh4rJaTp1LT+UZ6vPvDZZpv2LCTY
	 Si7K4+PEPmuwYjLI3TneFib/Rv1xDLUg3wRgMnnh08gXmeDGXOnqaCv5kOgSPjuLG36VE
	 S7YEDoO7jrUavc/G+J7n3M27PF3JInfGcS4gCvA9+PuOJg0FEaC1RQTV4VFqn89w+UcVY
	 8xJidM+A8gtMuOe8YIFT64FV9SiA42JoHg5SZkZ5aHgJreroGqCnoHcO57tWX87aZPJ+v
	 3ILcBZYZK2mbEUwgiG1tXz1FSMOVsdty71dfny5RfD7pf+vhGv4cHPYG4gMmR40PsUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749208;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=fJJmyTJJU6B4xJ3D+kZJnm4N1NYcGuJE8y1bildXa/g=;
	b=wKkTyozbfLLtAui5ZnOvCpldWxAXWFy3HGNLztKl15QT7eyo93dLIk+CIWHbnyLP/pDx
	 jzS71cgaA6JeLp4qIMtlTg/xKyx6eriib0hMIuNWOcGj199yZSC8Np8TrsHaeGFkiqJDL
	 qGr9XMB1rl6Ve4Q/x0hLHeRrckgISRpx1rcojjnbFNEzb91WUTIUlttja/+HaFbXlBvRA
	 M/eVrKuCSn2llqTLalmhDXspIvnXZRcglAgo8mtupyAIEKRtSB2VN79zE/1rd5R9lm5xh
	 Lab+ypbC42vFTYGGp5cHbOvdXF5QNepLB+8K2gNQcBD24A/bDmvTWuisd9oaJ2etv7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=np2+izFu;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51B1606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51B1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=np2+izFu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=fJ
	JmyTJJU6B4xJ3D+kZJnm4N1NYcGuJE8y1bildXa/g=; b=np2+izFu255g8Dirp6
	cKyAzEvfNAeVHv7M5WZD2HxO35bBAgch4kK9pA5sKNNocZNn7n9f/lCpXDfICXu0
	jT0647VX1NsQ+6oI7Ve0LwJp6qm3lV3Dol8kxfNsXtqRBS/mY86bAIPfjRTI8qYH
	FciatNgW8rrBnyM7hX6JA8S3Y=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD33yHzsvlqXCkHHw--.36757S2;
	Sun, 15 Nov 2026 21:26:12 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v4 00/12] ntfs: support O_TMPFILE
Date: Sun, 15 Nov 2026 21:25:57 +0800
Message-ID: <20261115132609.209957-1-liubaolin12138@163.com>
X-Mailer: git-send-email 2.51.0
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
X-CM-TRANSID:_____wD33yHzsvlqXCkHHw--.36757S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZF1fuw1fXw18WrW8GFW8tFb_yoWrWr13pF
	Z3Wry5K347tw17K397Za1xXr1F9a93GF47Jw13W3W7Z3Wqq3WqvrW8Kw10qa48CrZ3Z34j
	qr48JFZ7Cry5uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U9iSJUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6hUDzWr5svUBwgAA3m

From: Baolin Liu <liubaolin@kylinos.cn>

This series adds O_TMPFILE support to fs/ntfs. Applications can prepare
a regular file's data and metadata before publishing it with linkat().
Unpublished files are reclaimed when their last reference is released;
O_EXCL prevents publication.

Patches 1-4 fix creation rollback; patch 5 moves ACL initialization after
MFT allocation. Patches 6-7 fix large ACL reads and cold-cache ACL lookup.
These changes make inherited ACLs persistent and clean up failed creation.
Patches 8-9 preserve timestamps and packed EA size when publishing a file.
Patch 10 writes internal attributes before zero-link inode eviction.
Patch 11 flushes previously dirtied attributes before ordinary unlink or
rename-overwrite; patch 12 adds anonymous creation. The five v3 patches
are now numbered 5, 8, 9, 10 and 12.

Changes since v3:
- Include the six cleanup and ACL lookup fixes to address the review
  concerns about the creation path.
- Also fix the preexisting loss of dirty internal attributes on unlink:
  flush before removing names, rescan under the MFT locks, and return
  writeback errors before changing the namespace.
- Guard writeback with I_CREATING after failed creation clears I_NEW.
- Check the attribute inode's own link count for synchronous writes and
  conversion, since it can remain zero after the base file is published.
- Rebase onto b028412297e6, which includes Wahid Khan's named-stream v9.
  Retain its NOWAIT and zero-link protections and propagate conversion
  I/O errors while skipping busy candidates.
- Add Fixes tags. Drop Reviewed-by from the changed ACL initialization
  patch; retain it on the unchanged hard-link, packed-EA and O_TMPFILE
  code. The FILE_NAME/index ctime update requested in v1 review is retained.

The final series was tested in QEMU with four CPUs, NTFS debug and lockdep.
generic/004 and generic/389 passed, along with creation, publication,
cleanup, permissions, idmapped mounts, EAs, streams, mmap, direct I/O,
concurrency, full-volume retries, and persistence checks.

Unlink and rename-overwrite preserved dirty EAs with 512-byte/4 KiB/8 KiB
clusters. Directory removal/replacement, hard links and concurrent EA/fsync
tests passed. Injected EA writeback EIO left names and link counts unchanged;
writing new data and retrying succeeded.

Earlier validation of the preceding fixes covered cold-cache/large ACLs,
1536 injected creation failures, offline reclamation, failed-creation
writeback, publication with a retained zero-link EA inode, SD/EA conversion
and block-write EIO, and the named-stream conversion paths. These patches
are unchanged in this update. Test-only hooks are not included.

v3: https://lore.kernel.org/r/20261106063059.2904988-1-liubaolin12138@163.com
v3 review: https://sashiko.dev/#/patchset/20261106063059.2904988-1-liubaolin12138%40163.com

Baolin Liu (5):
  ntfs: initialize inherited ACLs after allocating the MFT record
  ntfs: read ACLs using their stored size
  ntfs: load uncached ACLs through get_inode_acl
  ntfs: flush internal attributes before unlinking a file
  ntfs: support O_TMPFILE

Dandan Wu (2):
  ntfs: return zero after removing nonresident attributes
  ntfs: discard attribute inodes after failed initialization

Xuewen Wang (5):
  ntfs: discard reparse attributes when creation fails
  ntfs: remove remaining attribute lists on creation failure
  ntfs: preserve timestamps when creating hard links
  ntfs: initialize packed EA size when creating hard links
  ntfs: write unlinked file attributes before dropping their cache

 Documentation/filesystems/ntfs.rst |  15 ++
 fs/ntfs/attrib.c                   |  72 ++++++++-
 fs/ntfs/ea.c                       |  23 +--
 fs/ntfs/ea.h                       |   3 +-
 fs/ntfs/file.c                     |   4 +-
 fs/ntfs/inode.c                    |  14 ++
 fs/ntfs/namei.c                    | 227 ++++++++++++++++++++++++-----
 7 files changed, 304 insertions(+), 54 deletions(-)


base-commit: b028412297e640db52195df2649368c1910e8e4b

