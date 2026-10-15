Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816C930274D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075410; cv=none; b=c4Kq+aa3vt5QbdJ+qzULoaRcPjixaK8VUSkELzmS1ZdWC+LATzXQe9SL/5XzLRoX/vG1f13VywoT34QAogARVGVtYMGReuKaqzSSBnMLDRkf+7BRMFmN23dqGYsFAQwBl7wtIyGgMZJFKCty1BRBJisyqijyEYmXPngSoWe6vpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075410; c=relaxed/simple;
	bh=YfkYnqYbLiwwDCaWhcld7c9EZThL2PD1H7TKFE4pOe4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kjsKmi0vOtGy7eE8nwKs365R91sLBmW0jp+EDvVygoY1ju1Wtt+XwjAp0rRs2d1lK1vHGAucVVOf6O4qZO0Hw/u3efxZYQDXIqi/70aoJK6r5GwhPB4STR5J0VgBkOj3lvkQUTCzs78HVOvRCcIUnDleKpRY/xbzwYLiobUxPio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=dptZ0fD/; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=ptM43k+q; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="dptZ0fD/";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="ptM43k+q"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEYhZs856445
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=eV158TFcj2d7Quci3RW3jy1QxZ
	mGDfWW1rJtiFBMZDE=; b=dptZ0fD/whZyMi2Pfq4hs6okWUW8TH8jRAANTJYGAN
	8TGb5SqHr9DDbcHsNj9obWQJKhArxfmmVG0WGbUgOxQS/R/7AcpP+9XFAOoibMK7
	hyunmS53anVZ5v5+FqpF84BuXhXY9K//cvu9MrP8763WI+cy7PTrF6yzLnr9zT3u
	EVxNDhW6mgRyTkuz/AlMNx5sUrGTJYJpRaQQ8l0HXyyDto6DQfPD5ykZLDNCmoDO
	9Ilcg2Zg8R08KzLsjRXEbl680S/8okxUTLk9OWjueJsoDLdXahi+mYRTiGYQ3arE
	S5NLOqV9LsPTAso/gig9dLRInQ1SSO6PjMAdVTSLlVsQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hatthjc78-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:27 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91b7e90fef1so835106d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792075406; x=1792680206; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eV158TFcj2d7Quci3RW3jy1QxZmGDfWW1rJtiFBMZDE=;
        b=ptM43k+q1UWku+EsX4pL5wuqogDbFTeFdc/xdBrn1g7N2ddXI3rp4YFuujXQSlFWxR
         8fw0bl9QRIEiPyexQRZGUzORm1bI3oWkjn0BXSPBEf4CdZ9f8ig5qeS1xAGZJq9iDYv/
         z4GkXxlgzGUdnBjjxdPlggt62iOYLoyUCZ8nz2cUHKEzpXTDHi5PrlesO4I6hm8UhLRQ
         1IKxwPgmccOD/ClwFqiBiGoz+iTz2/K3cWxYSxH1LQVIUA1Jzy14tYfLo1OGtg5jg4c2
         FJ9uoQzezigpokfXaZucugZM+toT8MagtB8iYihKPT+ZWRntgAps3JhgIgZHhkGvEjR4
         K9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075406; x=1792680206;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eV158TFcj2d7Quci3RW3jy1QxZmGDfWW1rJtiFBMZDE=;
        b=T0sb02zpRVyUTVrGwIwOqZnbTWn4HQy5FgLpjXacFoNyQk+jZ6NxtiH49vb7w7T3WF
         z+NafymMBJEKOI1zB50aNrP6+typ5RFzeqMbIljDLlSiJc1YfoQMUiAvAG1QwKnF7ex+
         XOUmpgH6EK8KN1NLlDd6ptJQmfU4tpzdht/TQ7Xda0Cce2ARicOEwryM0PJ2+DpIaFEm
         hZsu6KZyOHB2CR9m722X+0xig4T4PVBq0YkPT4XV4A2/mahCYZB44ngnbc03p8BfGxcb
         NH9PWRDz4/Y5AdLuCsYrtIe8ksnG/VEdEh/7N7ewEr278/mqqW43NjLXUCU8eYUEJnwZ
         nlsg==
X-Forwarded-Encrypted: i=1; AKwUvBzoSYqAiI71Lt0LtI9v5QxRGCW38Dh9T2D4ncToScccnnlPndL18roRGwiECXWtgZV5EXy0KwNHoq31N/s=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+tKJ5x7BSHlW2LJGhF3hdwCWGSCDs7i3fx3GsJkpWArF64Etn
	hikkiqAxyiXO6fQ6sXAF0RrlEUxOWTW6tADZK0HlNu7nTrqV7cSIvbQRbYSbUDaHUt3k13vacaf
	IfySx5UgnGUYAsrNgOn4Bl9E938RyuovHg15R0z5XAgpkmvHXSP9g1bt/QrilsA==
X-Gm-Gg: AYBFou1Blqpk3bPf1tyOZeK6sU9NlgfUBrlXvcGYYagrqba+UvwP5W8ivA1yBmsoqXX
	zzfc83hhN4tUbCmibyH3ECSfPeRbwfKk5oZVk8IoOG+0dSArWsEvS1w3dK2086vp54vx9tjfwdL
	EzB5JSJAA4bvVMXQgDoCMASjK8IK8SL4/FNOOD24RdJNdnJsuT7rSSXtxhWiKpCgfbJEB/ntBRl
	LnEcfcpHCqokv1cHImC0PD5yAkitJATS4giF5b1ZeGbCgruwK1K+pVtbAJYp3Otb00zxn2bYKwH
	+GXqrBoeAs8cPbTa/0PN0Tne4RnpB264U3sViWrXRJ9VC+QbwlAS+Vm4E/DLb85/2I3vOaaMDHh
	D6O9FNebuUzHuCN39ISSs6N6haECm3JIwuHouBN+wNJtY
X-Received: by 2002:a05:6214:f28:b0:917:7e2b:d732 with SMTP id 6a1803df08f44-91bc9486bc0mr4947056d6.21.1792075406404;
        Thu, 15 Oct 2026 07:43:26 -0700 (PDT)
X-Received: by 2002:a05:6214:f28:b0:917:7e2b:d732 with SMTP id 6a1803df08f44-91bc9486bc0mr4946686d6.21.1792075405836;
        Thu, 15 Oct 2026 07:43:25 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b5f323sm83026476d6.20.2026.10.15.07.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:43:24 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v5 00/19] btrfs: remove the v1 space cache
Date: Thu, 15 Oct 2026 10:43:13 -0400
Message-Id: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIHm0GoC/33QzWoDIRSG4VsJrmvwZ9TYVe+jdHF0jhlDkwk6I
 wlh7j2a0hJKmOULh+eDcyMZU8RM3jc3krDEHMdTDfW2IX6A0x5p7GsTwYRmlmnqphQyTXgcC9L
 CaT6DR+rBD0g75YMy3ioDglThnDDEy0P//PrpPLsD+qmR7WKIeRrT9TFfeLv7XTKrSzUZVcGCc
 iCVAPPhx+/56CJssZ9JGyviieNynROV4ztttAGDnOkXnHzm1v9QZOMYuh6ZdFaHF1z3x3HGxTr
 XVS5woVy/88wE+49bluUOsM438cgBAAA=
X-Change-ID: 20260906-btrfs-remove-v1-space-cache-45cf57c957a2
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075404; l=7060;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=YfkYnqYbLiwwDCaWhcld7c9EZThL2PD1H7TKFE4pOe4=;
 b=FfVuTPNOEA5yBgQo7ZfKGRrGp5IZ7zdc60cnGbQDlx/jA3Ri1HpAit4CBv35rnUNSSY3tVBVp
 Fbx0nni4fe+AFGF4WVZ6gSi82N9QcK2Y0TPUzlt/rNHt55KYoIrDcBn
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: DnkylLChR5RaBsGNOVexBY2-TGRu8b4v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX2I5+ToJLR76F
 1LDdlLZHklLSmoakG8Aal1+SPLYdUg3b5fq7qT6DvR/ZNNfLCQDI8cw41VAkxHjqtIhAUNaOoox
 MZ8Z1oZtHXDQeg2aEAExQYAe/bfzIqb4KaoHz+7uFLC3SAMBNjk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX8GbDUGKLw4Lq
 7NN6IfWYEKWZ4uRZFasb+ZTYaYFuw9RZ8bvD4Kqo7eWMUw+GqqHKk0R5LIPMFxeAl914PIa7B9A
 2Gv3dtl0LaZBIn9LsZCE0fmgSlq5ibCSGB5bchovaOfeX7eSKV2/+/SKPwejuJz3FNsRbRfhhra
 2RENRCZHAHv4hHCwiPkX5cgowXzRDo50MkoUd/v3rHQga9RIPSFlmqwo2nKGRT6sows+zS+AJJj
 p21w1h4M2675W3WOPDLtTuQLlT754YPb2KIrk5a+GWGYJOpLvNv9wENLj0nD5RnBf4rb3SwDt/R
 eV1nB2CXoLTlavWd/sdtELScF/pnfXWPKtvEf+uG45JKC3ejP/3hT5awd5EmVA3h1PW6DfV29Ff
 bFmtazZiiG0D4ZPYAOrtc5Anz0CVOfVIWTKsELJPrHoCqaD7P3g+3TMcLGdtWXD4zLUpw6EpLHq
 B/AmiSPUT+3cMldQzew==
X-Authority-Analysis: v=2.4 cv=WJvqzXsR c=1 sm=1 tr=0 ts=6ad0e68f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=bC-a23v3AAAA:8 a=IXpjHA8lEWY8KwlMyKwA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: DnkylLChR5RaBsGNOVexBY2-TGRu8b4v
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=10 lowpriorityscore=10
 bulkscore=10 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150057

Since commit 545e560a5b0f ("btrfs: disable v1 space cache") the mount
options can't select the v1 space cache anymore, but the code is all
still there, and a filesystem with an old cache and no free space tree
still enabled it from the superblock. Qu suggested removing it rather
than converting its page handling to folios [1].

Patch 1 fixes a pre-existing bug in the ordered extent error path: a
truncated ordered extent that fails to complete kept the extent maps for
its written part while the extent itself was freed.

Patch 2 fixes a pre-existing leak in the cleanup path, where a crash
before the delayed iput evicts a cache inode left it unreachable with
its link count still set.

Patch 3 stops enabling the cache from the on-disk state, so an existing
cache is cleaned up on the next read-write mount, as -o nospace_cache
already did. This is the one user-visible change: the cleanup is now
unconditional, and a read-write mount fails if it fails. There are two
ways to fix this failure:

1. Convert to the free space tree during mount (the recommended
   conversion), but this could fail for the same reason.

2. Run 'btrfs rescue clear-space-cache v1' on an unmounted filesystem.

Patches 4-8 remove the write path, 9 and 10 the load path and
disk_cache_state, and 11 and 12 the SPACE_CACHE flag and the unused
half of the cleanup helper. Patches 13-18 remove the trimming ranges
and the free space inode special cases in the write path, which only
the v1 writer used. Patch 19 removes TRANS_JOIN_NOLOCK, which the space
cache was the only user of.

What's left is what's needed to find and delete the cache inodes of an
existing filesystem:

1. lookup_free_space_inode(), btrfs_remove_free_space_inode(), and
   btrfs_cleanup_free_space_cache_v1(), which runs on the first
   read-write mount and zeroes cache_generation in the super block.

2. btrfs_truncate_free_space_cache() and delete_v1_space_cache(), which
   relocation uses to get a cache inode's extents out of a block group.

3. btrfs_is_free_space_inode(), for the evict and inode update paths.

4. The on-disk definitions: cache_generation in the super block,
   BTRFS_FREE_SPACE_OBJECTID, and the free space header and entry
   items.

space_cache and space_cache=v1 still fall back to nospace_cache with a
warning.

This also removes the page-based I/O in the free space code.
btrfs_io_ctl used a struct page array and was one of the last users
of clear_page_dirty_for_io().

Tested with fstests (btrfs and generic quick groups), with and without
the free space tree, with no regressions against the base kernel.
Upgrading from a filesystem with an existing v1 cache written by a 6.8
kernel was also tested. The cache is removed on the first read-write
mount and on remount from read-only, and the resulting filesystem is
clean under btrfs check and still mountable by the old kernel.

Based on btrfs for-7.4.

[1] https://lore.kernel.org/linux-btrfs/e1dd5a75-9a67-4bc6-b8d8-bfff79b5b907@suse.com/

---
Changes in v5:
- Patch 1 (new): Drop the extent maps of the written part when a
  truncated ordered extent fails to complete, per Sashiko.
- Link to v4: https://patch.msgid.link/20261012-btrfs-remove-v1-space-cache-v4-0-f125bd8c07f9@columbia.edu

Changes in v4:
- Patch 1 (new): Write the zero link count when removing a free space
  inode, so an interrupted cleanup can't leak it.
- Patch 2: Clear FREE_SPACE_TREE in btrfs_reconfigure() whenever the
  free space tree is not on disk, so a remount that only warns about
  the free space tree no longer leaves the option set, per Sashiko.
- Patch 2: Dropped review tag.
- Patch 16: Also drop the tree root check from the delalloc metadata
  release.
- Patch 18: Redo against the TRANS_* flag cleanups in for-next.
- Link to v3: https://patch.msgid.link/20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu

Changes in v3:
- Patch 5 (new): Keep the cache_write_mutex locking that serializes
  btrfs_start_dirty_block_groups() with btrfs_remove_block_group(),
  since it also protects the block group item update and not just the
  cache writeout. Rename it to dirty_bgs_update_mutex.
- Patch 8: Drop the "Old style space inode found, converting." branch
  from lookup_free_space_inode(), as it no longer converts anything.
- Link to v2: https://patch.msgid.link/20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu

Changes in v2:
- Split the TRANS_JOIN_NOLOCK removal out of the ordered extent patch
  into its own patch at the end of the series, per David
- Add recovery information for a mount failure due to patch 1 to the
  cover letter.
- Link to v1: https://patch.msgid.link/20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu

---
Tal Zussman (19):
      btrfs: drop the extent maps of the written part of a failed ordered extent
      btrfs: update the inode item when removing a free space inode
      btrfs: stop enabling the v1 space cache from the on-disk state
      btrfs: remove the v1 space cache writeout from the transaction commit
      btrfs: remove the free space cache endio workqueue
      btrfs: remove the v1 space cache write path
      btrfs: rename cache_write_mutex to dirty_bgs_update_mutex
      btrfs: drop the transaction handle from the prealloc helpers
      btrfs: remove the v1 space cache load path
      btrfs: remove btrfs_disk_cache_state
      btrfs: remove the SPACE_CACHE mount option flag
      btrfs: replace btrfs_set_free_space_cache_v1_active() with a cleanup helper
      btrfs: remove the free space cache trimming ranges
      btrfs: remove BTRFS_RESERVE_FLUSH_FREE_SPACE_INODE
      btrfs: remove the free space inode ordered extent special cases
      btrfs: remove the free space inode special cases from the COW paths
      btrfs: stop special-casing free space inodes in the delalloc accounting
      btrfs: stop reading free space inodes from the commit root
      btrfs: remove TRANS_JOIN_NOLOCK

 fs/btrfs/block-group.c      |  497 ++-----------
 fs/btrfs/block-group.h      |   14 -
 fs/btrfs/btrfs_inode.h      |    6 -
 fs/btrfs/delalloc-space.c   |   13 +-
 fs/btrfs/disk-io.c          |   81 +--
 fs/btrfs/file-item.c        |   11 -
 fs/btrfs/free-space-cache.c | 1670 +++++--------------------------------------
 fs/btrfs/free-space-cache.h |   29 +-
 fs/btrfs/fs.h               |    2 -
 fs/btrfs/inode.c            |  155 +---
 fs/btrfs/ordered-data.c     |   27 +-
 fs/btrfs/relocation.c       |    2 +-
 fs/btrfs/space-info.c       |    2 -
 fs/btrfs/space-info.h       |    4 -
 fs/btrfs/super.c            |   48 +-
 fs/btrfs/transaction.c      |   62 +-
 fs/btrfs/transaction.h      |   27 +-
 fs/btrfs/zoned.c            |    9 -
 18 files changed, 305 insertions(+), 2354 deletions(-)
---
base-commit: 58e844c3ba387ceb0f527a6ba82aa50c81c4d7b7
change-id: 20260906-btrfs-remove-v1-space-cache-45cf57c957a2

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

