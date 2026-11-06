Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946732;
	b=s1PG/68ImGC86G56VG2C/ijOvmucZ95Mustt00bxQ8ZSpKUjKgvy8Nv9+C3c0m5XbFKC
	 e+98K5A++lfIAp2y/PNxim4nay7+BpLf2F+TFWac7eK+PFZKFh9oN/8UVp28HY///Z/mq
	 vjoisTH2/DKoRr0v5H5/GdxIiUfMiht31vZ26xsWTKUHBpvnkGfBt01ZsVzLRUkjROUNZ
	 +ZnJGGxUqwHd5ZvVSlJIMu7b0gWVL3uzurNOQnRASUNhNvRDj0qXjTWSxjrLCcDsKymOs
	 AI8k1CA5VyOPX6bf8v3RIKXLTN5VdC1KJN0+Lo/dT10/HVZr6p/5YyfG1jw7G2sNU1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946732;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=+abND1Cpq7xlyokcR3yG/tZi6qe7h+vJ+77wvDE4CUU=;
	b=STUlEsPFPB2Cz63waGoPPzFbyw0BMmmpLXHmp8cvEQF+2E2wI1Yce6dXp864lhgLP4UU
	 6ccBGL9jjEPt9+XdwV5bn6zolZENr73RE2nERss+FtjsCoEogKd2Q2sELq8WBju9h26ZF
	 v/7anf2iU2zKS+f0FGHAmjmjr8AKlHd8tDakAfD5ZvcFXrYie7Y1vwxsK29NFnNdiOUaF
	 l8mwa8vcwyH398yMPbGxxEi0wHf4azbAzlBwTdHsiQibFNZ48Sv8QQ61Hxen2EbXloRqp
	 ChbmNBVyglC3C+be5ewv9UdRDBw9nqphDp/iyNoSFgTVA5udvhAQ4jzUulerhWvdzBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b="W/dx1qKo";
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76E4606D805
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B76E4606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=W/dx1qKo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=+a
	bND1Cpq7xlyokcR3yG/tZi6qe7h+vJ+77wvDE4CUU=; b=W/dx1qKoMbCyNZFXAv
	dc0K75WtodUoETvrT/AOLtjYeagQ5UC7/t/NqeL0Qp2/hWrvy0nCdiN1If/6QNZJ
	GZ3qEdJUR9VIt8ZMBFFWdrnlUqFmaiWtDt5x1q8BZ3R6dXOB/UjAO3joB4dOLzfz
	tg5JhV0GvHtd881H3SOwIzy4o=
Received: from liubaolin-ThinkPad-E15-Gen-2 (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3lzdFdO1qwIxJFg--.3403S2;
	Fri, 06 Nov 2026 14:31:35 +0800 (CST)
From: Baolin Liu <liubaolin12138@163.com>
To: linkinjeon@kernel.org,
	hyc.lee@gmail.com
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baolin Liu <liubaolin@kylinos.cn>
Subject: [PATCH v3 0/5] ntfs: support O_TMPFILE
Date: Fri,  6 Nov 2026 14:30:54 +0800
Message-ID: <20261106063059.2904988-1-liubaolin12138@163.com>
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
X-CM-TRANSID:_____wD3lzdFdO1qwIxJFg--.3403S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFyDGFyfAw4DtF1UGw18uFg_yoW7CF1rpF
	Z3K390qw1DJF1xW397Za1UXr1F9ayfGF47Jryjgry7Zwn8KFn2vrWxKF45Z3ZrC39agw4j
	qr4jq3s7WF98ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPpnLUUUUU=
X-CM-SenderInfo: xolxutxrol0iasrtmqqrwthudrp/xtbC6QdED2rtdEdBVAAA3E

From: Baolin Liu <liubaolin@kylinos.cn>

This series adds O_TMPFILE support to fs/ntfs. Applications can prepare a
regular file's contents and metadata before publishing it with linkat().
Unpublished files are reclaimed when their last reference is released.
O_EXCL prevents publication.

The series keeps the same five changes and ordering as v1 and v2:

  1. Initialize inherited ACLs after allocating the new MFT record.
     Anonymous creation needs its inherited ACL stored before returning.
  2. Preserve prepared atime and mtime when publishing the inode through
     the hard-link path.
  3. Initialize the new FILE_NAME's packed EA size, since a temporary
     file may already have EAs when it is published.
  4. Complete unlinked-file attribute writes before dropping the cache,
     including EAs and data copied during resident-to-nonresident
     conversion before publication.
  5. Add O_TMPFILE creation and publication support.

As requested in review, patch 2 gives the new FILE_NAME and directory
index entry the same ctime as the inode. The inode ctime is updated only
after the link succeeds. Patch 1 also initializes a newly created
FILE_NAME's ctime after inherited ACL setup, fixing a timestamp mismatch
caused by moving ACL initialization later in v1.

In v3, patch 4 also preserves data copied by
ntfs_attr_make_non_resident(). As reported in review, growing DATA in a
nearly full MFT record can convert SECURITY_DESCRIPTOR and leave its
contents only in a dirty folio. Evicting the zero-link attribute inode
then discards those contents.

Write the resident value to the newly allocated clusters before
committing the conversion. If that write fails, release the new clusters
and retain the original resident value. Propagate the error to the caller
instead of continuing with another attribute. Patches 1-3 and 5 are
unchanged in code from v2.

While implementing and testing O_TMPFILE, we also found pre-existing
NTFS bugs in attribute rollback and ACL lookup. These include stale
attribute inodes left cached after failed creation, which can cause
subsequent creation to return EIO even after space is freed, incorrect
ACL inheritance when the default ACL is not cached, and a fixed-size
read buffer that cannot handle larger ACL values. The underlying bugs
predate this series.

To keep this series focused on O_TMPFILE support and review
feedback, we are leaving these existing bugs to a separate bug-fix
series. We plan to submit those fixes after this series is accepted and
merged. These issues remain present with this series applied.

Tested this five-patch series in QEMU with four CPUs, NTFS debug and
lockdep enabled. The requested unchanged xfstests generic/004 and
generic/389 passed. Tests covered creation, publication, last-reference
cleanup, O_EXCL, normal idmapped ownership, named streams, nonresident
EAs, direct I/O, mmap, allocation and concurrent publication. Published
data and metadata were checked after cache eviction, remount and reboot.
Offline inspection compared hard-link ctime in STANDARD_INFORMATION,
the new FILE_NAME and the directory index.

The conversion regression uses 1 KiB MFT records and varies EA sizes
before writing 4 KiB to anonymous and ordinary files. Offline inspection
compares SECURITY_DESCRIPTOR contents with the original resident value.
The v2 kernel loses converted security descriptors and some EAs; v3
preserves them with 512-byte, 4 KiB and 8 KiB clusters, including after a
fresh boot. An injected block write error returns EIO and leaves the
resident security descriptor and EA intact. Free space is unchanged after
that failure, and retrying the write succeeds.

Changes in v3:
- Extend patch 4 to write converted attribute data before switching the
  record to nonresident form, addressing the v2 review.
- Preserve the resident value on conversion write failure and propagate
  conversion errors.
- Add conversion and I/O-error regression tests and rerun generic/004
  and generic/389.
- No code changes to patches 1-3 and 5; add Hyunchul Lee's Reviewed-by.

Changes in v2:
- Update FILE_NAME and index ctime as requested in review.
- Set the source inode ctime only after successful hard-link creation.
- Initialize creation FILE_NAME ctime after inherited ACL setup.
- Run generic/004 and generic/389 on the standalone five-patch series.
- Rebase onto ntfs-next commit
  564c7753647731d19170914c1c637d3b33d88d3b, including the const mnt_idmap
  tmpfile callback signature and documentation context.
- Resolve patch 1 against the updated early ACL error handling in
  __ntfs_create(); the relocated ACL failure still uses MFT/EA rollback.
- Keep the original five-patch scope; submit fixes for the pre-existing
  attribute rollback and ACL lookup bugs separately after this series
  is merged.
- No functional changes to patches 3 and 4.

Baolin Liu (2):
  ntfs: initialize inherited ACLs after allocating the MFT record
  ntfs: support O_TMPFILE

Xuewen Wang (3):
  ntfs: preserve timestamps when creating hard links
  ntfs: initialize packed EA size when creating hard links
  ntfs: write unlinked file attributes before dropping their cache

 Documentation/filesystems/ntfs.rst |  15 ++++
 fs/ntfs/attrib.c                   |  58 +++++++++++-
 fs/ntfs/inode.c                    |   8 ++
 fs/ntfs/namei.c                    | 140 +++++++++++++++++++++++------
 4 files changed, 192 insertions(+), 29 deletions(-)


base-commit: 564c7753647731d19170914c1c637d3b33d88d3b

