Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9EE2DFA3A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 01:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788830403; cv=none; b=I1aU6i6hL9XTcLj0YGjLRc3DSq5HDzaW5x+EX4eKwyolvbvDzkvJUz4M56TPGX7roBweLIUdIBrHRKgcLeRJSmmyqQKFUI17v43c00m+3imEpjJWs1D2Nby1DO5t+vlVi6nDyZ56LAjJPn029bnTXNM/5Dq7pxvNNmX3P44hMmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788830403; c=relaxed/simple;
	bh=u+l5WqfZyP1A6ijQPmcJ6iUUh0+1QxN6dCzOI9I6rJ0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qqWdbnpQ9OTlowCmJmoIP4UlcPUTD/TlyfWt/r/etGIdokJ8KQaz6XPff7SADkjTkqJIw4hbnqwddEsA0b7KVu5JBoB8BSANg6Mb1eeJOPMfWqDisWES8Wf5nsMyCw4+k8ACYZzGiXJprf0hq0p5OsCglxwBBegJIJOQrfJSUaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=XTnlbxKQ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=wB11mLQ6; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="XTnlbxKQ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="wB11mLQ6"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6880ulFc3140169
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 21:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=t0Ln7X7H2GEOTi/inzoAc0KOS8
	FBpzJbnedrNHut9G4=; b=XTnlbxKQoIXmJRvXH8n5N6BIxmDsUUrPajTBrWw8N5
	VvWyGhKFSzbJ3pXjJI3GmYzT6AtveOsMTVf63hpJIf1fwpNg/wu8+FqK2I1/3i/b
	Fb9RLIhHMESNtFH9qZpcLihoOgf5CBTiV47gs/IJ+BdH2rFaH5i0uE2lQ4IleB/I
	EAkSttbzakQemFCYFApXnibDoUk7rVgX9+qoVhCdG54yuCoXoyVKHMBdq6G3bu6V
	TvW9MhjUyG9s+oYKbq7n6H1Y5hRtCAmlhMaZfNOeUWsHi1z30//sVNBr/29tw4Bx
	1gSOUdl8DASm6HxtKJWRV88mSPPYFbox2vRP1+/hEVrA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gj4aas6tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 21:19:51 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90ceabcd64aso88169566d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 18:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788830390; x=1789435190; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t0Ln7X7H2GEOTi/inzoAc0KOS8FBpzJbnedrNHut9G4=;
        b=wB11mLQ6bgavw1Mo+V0Whz/wEFLsz8767PUY4y2N8HDS/5+1M25cef7wm42VXEA94F
         8Wm9g9rQOu2mJdNr8ZIfYL4VdaOnT4QyEL5pD6F87tHu4WEAZzYVO+4dHiMcMVaWT9Pf
         SGilGoFMHsEt/9SvQZIrMTeTbWPEbwy5TLh6X35rPnt/GkOhHdNPVL71FBkpvkWNHiLX
         tzdg2kx0LrBSgyz+sONC4Vpb7NW/iXiaO8B4wZRqPVuVRvZRl2qGIJ4KNMlHqHsUsOhS
         ceQpUOPNgySWkDPAgu+9dkspetxIk21ah/ugMHWG4cWcTzRzc8VjD6+pgfpAP+pl4QBD
         21Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788830390; x=1789435190;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t0Ln7X7H2GEOTi/inzoAc0KOS8FBpzJbnedrNHut9G4=;
        b=NvD/HApn/pdje2PcONsubJ1R2ifrAhz9Lm0MI1kkgd586PWZ85+gWytROzR9Dr/aH1
         J393gErbXREz9cDKNe5fZ9IR6KTCk+/PrO3u3E9YejuGqvkB0ZDzAHlvg58zVVTzkUPB
         MW8bde/mOC3BiZlgbSXfIpVdJcCCduM3KrtVeIZ1WPKAtdR1VddtUJL6CzuCnV6OWjFA
         5qmZ7DbR96TPQV/CKdW9Wye8y/riv09oqwO1b4cIkLkUs7aOeqxY5v7fjdxYh6c+grZ5
         qT1QfKi/sNMm/eyZrAids/w5bTKL0Hc3tEm3p3LhVwU9nl1K/BbzTXzx3sBycwLKBxEs
         DPeg==
X-Forwarded-Encrypted: i=1; AKwUvByN+vmERxCCj5YIL69wJzo9kovUWYCKnsN07xrqA6a35LscUyQkhr1wJvJcXd5DL040Fx+hP0EezGj/meM=@vger.kernel.org
X-Gm-Message-State: AFuF++mGuJ91l0+ZsF+TZ8Wq9QeqC6Dmsui3zN+kDzg7m0v6mAIETPGH
	SW/hJJiijS2gwSYsAbVn0vAe4TLok7bJatz3LU+YJ1CXdg7zSRTR0fRtke4z0U0NLy5xQastAQc
	/QZZ93gazAYw5ZU5TefV+/09yjr18eAXndXLj56OBtPE8HtppBozOJynTuNEOhA==
X-Gm-Gg: AYBFou1/R/VeyP+a3PoqNdRGY8oK7YeBieVQY70O71H7Y3y4UiTT10VVvHAj1+FPSzO
	nL8YKttI0EaNbhGols5kumXy9++pOQq8QYyrrvw5PgFjP3A4fDh7r+XPL7rqjNfY0vIS8hu3qbV
	BWztMoaEFVFWdJl1hK7RFeivLJfYsrsW1/kQqM3/4gjQEaly0P+QQEHgOzLtEbBaAIaxLWXmeoW
	1V731KNOa23UOLTIB7m5lOYLSUuIoGirC9wb8FlLxBPFASlhKmXzks50aFyoqWAjhrFzv+POfx6
	H4xBvF895pubb9AZSn4Am7tIv456vVSsMrp8Ue5m340EVyHsXUKePudOlC501V2090qVChXPguC
	LKH9Ya1U0ifUt80VFkPjDQb1YKI6qODXTYcO+++4cG0KliV3W0wc=
X-Received: by 2002:ad4:5f4a:0:b0:90e:7f15:36fd with SMTP id 6a1803df08f44-9103efa4ef8mr334871776d6.14.1788830390337;
        Mon, 07 Sep 2026 18:19:50 -0700 (PDT)
X-Received: by 2002:ad4:5f4a:0:b0:90e:7f15:36fd with SMTP id 6a1803df08f44-9103efa4ef8mr334870666d6.14.1788830389220;
        Mon, 07 Sep 2026 18:19:49 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040694543sm104322656d6.33.2026.09.07.18.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 18:19:48 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 00/15] btrfs: remove the v1 space cache
Date: Mon, 07 Sep 2026 21:19:15 -0400
Message-Id: <20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJNin2oC/yXMwQqDMAwA0F+RnBeoZVXcr4wdakxnBlNJtAzEf
 7fbju/ydjBWYYNbtYNyFpN5KqgvFdAYpyejDMXgnW9c5xrsV02Gyu85M+YabYnESJFGxmugFFr
 qQhs9lGFRTvL57ffH37b1L6b1W8JxnGo76q5/AAAA
X-Change-ID: 20260906-btrfs-remove-v1-space-cache-45cf57c957a2
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788830387; l=4342;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=u+l5WqfZyP1A6ijQPmcJ6iUUh0+1QxN6dCzOI9I6rJ0=;
 b=NZ4iR9qmiYrMMFLAOTWBeJAnjZaNrQW/5vuNg+uIE8Zx155TWAom9CyMqs0kDXFdVYMjvsQMz
 H9+nPl4MohPArC2GBPBRnSKfDgXbtGntIyahWwxnKPg5BHJM+EZI0ka
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfXwZI0+4sNOefy
 nN1mKjhhnD3cbQba9QNYi6zpZNxB08voacXGS82nkjwXClJvGdXK4hiNoH9jDAAYkboB60KQ+Ub
 k3IPms2I5E1UZE+8FRwXhpo5qTR3j8KAXWuXCe6dTj2T3uKzBTt2O1avVjeQ3ciW7UDqtQ/XwUy
 2Q7p4zCk5mfWjkTh2hVp2ZVfOZz8eRASPCQIVdonoytwT68DK02+Et6YenWzmvh6LegKy/2UL4m
 yUMWI//TAw41WWAoBTq6QIuFZHOdrcNTC8wOLDguOs6ur01p9bVDAjxnAv97nRUQ2y9L0casqKP
 eZZbYeyKksnuyD2iNqYqcFYnPuFDqVNt/X70clg+iLkaUqN4pv11idrsDyES8uJOzXdNJWyWu7G
 CezAOlOPVxjocDNqzHXG9qMfYWMvt2p1r3NCa5sZjDLb7IbhgNIk3XVI856Ni4x3L0pvaZmqPHk
 /GUGGFjOy/sKn692e2Q==
X-Proofpoint-GUID: ITmgADRf-4w7Ev66DpyuIWANUYAiA-B2
X-Authority-Analysis: v=2.4 cv=atuCzyZV c=1 sm=1 tr=0 ts=6a9f62b7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=9ly2DDOFe41V05N6iNUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDAxMSBTYWx0ZWRfX16ZI5PTPMMqp
 QlXv7HJ0AUVzfPel55Mg00zvuL77kbUGDjjqDdmTDAkhXR7/vJ6wFHkgGuzqmas1vXw/k5ZBqSe
 +j2tk13/s5krqDy3egpfx0GOJtcDJoaZUZIeeLOYRwUTNS0yqWqa
X-Proofpoint-ORIG-GUID: ITmgADRf-4w7Ev66DpyuIWANUYAiA-B2
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=10 malwarescore=0 lowpriorityscore=10
 spamscore=0 bulkscore=10 clxscore=1015 adultscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080011

Since commit 545e560a5b0f ("btrfs: disable v1 space cache") the mount
options can't select the v1 space cache anymore, but the code is all
still there, and a filesystem with an old cache and no free space tree
still enabled it from the superblock. Qu suggested removing it rather
than converting its page handling to folios [1].

Patch 1 stops enabling the cache from the on-disk state, so an existing
cache is cleaned up on the next read-write mount, as -o nospace_cache
already did. This is the one user-visible change: the cleanup is now
unconditional, and a read-write mount fails if it fails. Patches 2-5
remove the write path, 6 and 7 the load path and disk_cache_state, and
8 and 9 the SPACE_CACHE flag and the unused half of the cleanup helper.
Patches 10-15 remove the trimming ranges and the free space inode
special cases in the write path, which only the v1 writer used.

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

Based on btrfs/for-next.

[1] https://lore.kernel.org/linux-btrfs/e1dd5a75-9a67-4bc6-b8d8-bfff79b5b907@suse.com/

---
Tal Zussman (15):
      btrfs: stop enabling the v1 space cache from the on-disk state
      btrfs: remove the v1 space cache writeout from the transaction commit
      btrfs: remove the free space cache endio workqueue
      btrfs: remove the v1 space cache write path
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

 fs/btrfs/block-group.c      |  461 +------------
 fs/btrfs/block-group.h      |   14 -
 fs/btrfs/btrfs_inode.h      |    6 -
 fs/btrfs/delalloc-space.c   |   13 +-
 fs/btrfs/disk-io.c          |   81 +--
 fs/btrfs/file-item.c        |   11 -
 fs/btrfs/free-space-cache.c | 1603 ++++---------------------------------------
 fs/btrfs/free-space-cache.h |   29 +-
 fs/btrfs/fs.h               |    2 -
 fs/btrfs/inode.c            |  149 +---
 fs/btrfs/ordered-data.c     |   27 +-
 fs/btrfs/relocation.c       |    2 +-
 fs/btrfs/space-info.c       |    2 -
 fs/btrfs/space-info.h       |    4 -
 fs/btrfs/super.c            |   48 +-
 fs/btrfs/transaction.c      |   37 +-
 fs/btrfs/transaction.h      |   27 -
 fs/btrfs/zoned.c            |    9 -
 18 files changed, 226 insertions(+), 2299 deletions(-)
---
base-commit: 69b26c13e520480d1869171e2c2b8a59f0c857ec
change-id: 20260906-btrfs-remove-v1-space-cache-45cf57c957a2

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

