Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093745;
	b=qjaOs3RUIly2ekTYhWaxAIp9RnIn4z2QfgtBilUXlSZbWyjpdwqZxjz/vDOCQUFYu2MK
	 xenBaMMDY0twXSOZHsneJyW2/NXwyEKTnfNZWc9Xtd0y+jzq7XYIvsenXoCiNwHGf4GO9
	 25QqOAbmA0WuuShfnFr9Wg9IFG5VOBpQwqZJuV5Q5Eya0dphFAeFXlv3j/MzAmmeTsHJ9
	 qkmm1LG90of9FFdUCSUvGhk1IfpcQSy59VKEslYizT3DYXvA401WScO5o30kJxqxFCWMk
	 xWLiC/8fkJLMHCJ1lArKNBlKaRLkbvovqwxLGujwd2g1sKIlhFT71CNk5o+xqwKq2Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093745;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=BQSqnrhB0wqKJzkCSZ4Q3xGBVoAa0KEuXEDWeoLBoVo=;
	b=jlVEJAJgX54IuWYv9kfa6Qoo/BdQGQY8k7Uraiqnq1PUs/7Rnnogu/JnHGVAvY+t8hgn
	 jls7Lo7hKnjrBufMVldCmsUNfS6Y1t4fVYMlpJM66I9/p1hJbBiWXt6XL8YkiFUrNdU63
	 FQciN25ToMc62FcCpWuJrpV45V420bi9smZg6E5b3pa04Rt/WhEvxf3SzXrq62k9t8tXT
	 GwaN+W7/7fHIiDo1lALFQrNds8S0LF9KYWCXUw0v32bFXmN/DDv//G3BkvAlOa6r85L5/
	 opAFqrMVK9lWKIVmPxtwsFCKdOEgEdJJPrTcZiiLZaV+19TuSk96U/WEgr130Rlqq0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DqQBXtJZ;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A1D606A330
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44A1D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=DqQBXtJZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=BQ
	SqnrhB0wqKJzkCSZ4Q3xGBVoAa0KEuXEDWeoLBoVo=; b=DqQBXtJZaU3VMiRMf/
	rVVh6kXc72IPVU0X/FitO9tljBnfd0sxOwv4To/s/DFqGtclFwxGSqyaFTwqnExj
	q40YsecOSpKERz0YESpk84TGvZE7pmGcaFSdl6TG2jJqvDxD+EMBwiSNz27pv39t
	Wh/AaoEkywyPZbKpwNiFRLbYQ=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD33xFVcOBqdMGFDQ--.18497S2;
	Tue, 27 Oct 2026 17:35:18 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v1 0/5] ntfs: support O_TMPFILE
Date: Tue, 27 Oct 2026 17:35:10 +0800
Message-ID: <20261027093515.344799-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD33xFVcOBqdMGFDQ--.18497S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr4DJw47tFyDtFyDWFWfZrb_yoW5Cw17pF
	Z3XrySg3ZrK34xu3s3Zw47Jr1S9a1rGr47Jw15WryUJw1ktFnYva13KF15Ja4xJF93Xw4j
	qr4qqa47GrZ8A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UQyCAUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6RYEzmrgcFZKSAAA3b

From: Baolin Liu <liubaolin@kylinos.cn>

Hi all,

This series adds O_TMPFILE support to fs/ntfs. Applications can prepare a
regular file's contents and metadata without exposing a directory entry,
then publish the file with linkat(). Unpublished files are reclaimed when
their last reference is released. O_EXCL prevents publication.

O_TMPFILE reuses the existing inode creation, EA update and hard-link
paths. The first four patches fix existing bugs in those paths, so that
anonymous files can inherit ACLs, prepare metadata and be published
correctly:

  1. ACLs must be initialized after allocating the MFT record. Otherwise,
     an inherited ACL can appear correct in memory but disappear after
     inode eviction. Anonymous creation uses the same initialization
     path as ordinary file creation.

  2. Publication through linkat() must preserve the file's atime and
     mtime. The existing hard-link path resets both; the fix updates only
     the required timestamps and marks the affected inodes dirty.

  3. Files may already have ACLs or other EAs before publication. The
     hard-link path currently leaves the new FILE_NAME's packed EA size
     at zero. Initialize it from EA_INFORMATION when adding the link.

  4. Attribute inodes initialized while the base file has zero links
     also have zero links. They are evicted at the final iput(), discarding
     dirty pages from nonresident EA writes. Synchronous nonresident
     writes keep a successful EA update readable after that cache is dropped.

These bugs also affect ordinary creation, hard links and open-unlinked
files. Keeping the fixes separate allows independent review and use
without O_TMPFILE. Patch 5 builds on them to add anonymous creation,
VFS-controlled publication and documentation.

Named-stream ioctls can create or open streams after publication, but
not while the temporary file remains unpublished.

Tested this five-patch series in QEMU with four CPUs, NTFS debug and
lockdep. Tests cover creation, publication, permissions, idmapped mounts,
direct I/O, mmap, allocation, concurrent publication and ENOSPC. Checks
after cache eviction/remount/reboot covered file contents, EA values,
access ACL readability, mode and explicitly set atime/mtime. Injected
ENOSPC at five creation/publication/open sites and checked failure
behavior and release of the recorded base MFT records. Ordinary file
operations were also exercised. Individual patch notes describe the tests.

Based on ntfs-next commit e845077350df3862c733ed10a950d49ef4d64b0c.

Thanks,
Baolin

Baolin Liu (2):
  ntfs: initialize inherited ACLs after allocating the MFT record
  ntfs: support O_TMPFILE

Xuewen Wang (3):
  ntfs: preserve timestamps when creating hard links
  ntfs: initialize packed EA size when creating hard links
  ntfs: write unlinked file attributes before dropping their cache

 Documentation/filesystems/ntfs.rst |  15 ++++
 fs/ntfs/inode.c                    |   8 ++
 fs/ntfs/namei.c                    | 123 ++++++++++++++++++++++++-----
 3 files changed, 126 insertions(+), 20 deletions(-)


base-commit: e845077350df3862c733ed10a950d49ef4d64b0c

