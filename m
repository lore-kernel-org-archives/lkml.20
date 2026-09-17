Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C74D3B7750
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789617635; cv=none; b=cIM2GUiqiljznonlRGi7sCKRxMf9KYbCfzXCYZ/h8XXu7TIfWXYOGkaFWEso4NvaOvzkWXU/Mo9N8zXtjjQTw1A8hLE97+//NRhsp7AQdiMZwDcpxZfdKTYH639oJqZkR/Xw61AU3rUCQNPYc3FwQH+Jf4k+Gm9fdfSI2BipJZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789617635; c=relaxed/simple;
	bh=DiozgMR/ICapXx8MBD2toeCbM/4lq8wJDPp6LEj8JSc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LtyaRrS4OyVhiPqZWD2dG+cjMdWuHmbUcVQ0gqfcyTqqepycN7jF8/zGA8T+bRCAgYrfi3sttWOcrCjn6Eg0ohTXrQhe8aD0eZnleQ+Xfen2xzl1WWwClBun9wt6FfJFCTQAU1ME2rGOaNDcAjjOO2PXhi1CQqPtUR9DU6HZwoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=iY6BK0nQ; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=GJP8x1GI; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="iY6BK0nQ";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="GJP8x1GI"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2YYbF1938732
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=bhJLqbqf95E9IJAGnTjETl50E/
	hErPUFqcLv3tZTRfY=; b=iY6BK0nQ60jothWfwPihV+XzRhXbOOYSAnjd9R0zm5
	9nt8NFN6kPG7gWqvmQm6aEXKh9WQLs8wqiVPLUpa08earBg0U3B0s2qs6atm5SVa
	2PRiNjlAIPrzLTOGZsczs965rV7ytsUlRmI0ySsmsPw0gx7jNgC8y3nnPaMHDvBw
	S/gD8BosyDS0Z0xUZa8aLGID+7H7RlsW6EQeXbr6y8h4DqOtobRKZ2KOMO/bMhpc
	4EP1ats0yDYaC95BvgLC7rSagCihn8V3WABh/P4sk80Zav4MlfSusBdUM86Wa0Yt
	2pefh3rdQ7caclX49ZOWApsVFNb4fRzmHGzH4ZQM1QJg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gr33qssbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:00:26 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91043af01d9so8881706d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 21:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789617625; x=1790222425; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bhJLqbqf95E9IJAGnTjETl50E/hErPUFqcLv3tZTRfY=;
        b=GJP8x1GIa7qwt+VAfwH/mgrUAzh14sUVLbSwx4EJfK9FiH35ojtzFk9IzsKhDSRH6r
         PiURogyXNFgml7cbzzXwAZcwPqMdCPQ8PEJlFIYakeXd2yGE5gn7mxiRpshwkhHXSyN5
         LIuRx4jKvGNXlU9KyUhju4WqhCGnxBSIlGAulR8K6o3j/4LgcayKbKMEucgLM5lmbhuX
         NPXfv6XnHCf6bIlbtvRe56g9Qs7OzJ6jJUjRWH0B2rHJepMBmvJ48sGAXSWqeAelLAMK
         fHrmVS712VlONEBS1kLkChHC0/JY2EvDA7ud9krLcaawIBmX4fh+38cTvx0YTv8bcLNY
         gtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789617625; x=1790222425;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bhJLqbqf95E9IJAGnTjETl50E/hErPUFqcLv3tZTRfY=;
        b=x+Q6AEp7RSwSgG6Yet+lxXOMNKovB9P968BlYbYwqUBxyVZlXiOaOCDz9Ani8Pb6bB
         q5avkPTe8xftZhjb7uPPkkj2siHXHyVcz/K//JyhPWYlvBG6dnXthC/K/XxYZQkR0znj
         uM7sVRhQhtT77Rug8aNL9MbOHYB9YCu9cK/kolX09sdDEpuC3nMmFMWImd2/wbCTqKLy
         LaKIqK5hRcOTMoP3AAvH+7PW613X58SNHmTBv1Wzf0LTiytFit9YTWKHW7nMQZgUWyDn
         PBWRO3KijlvKWiZFzqwyyDgwSFuail1LMRhHgo+rttXGh4T7WyKgRIa8h4mlAociBWcY
         1EoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYkSa+N0tlsi2dBUxa3GFwmljfSlyyUMiD2GG/vDQ4mDEHrdTsIAeQp6gjOGn2yjR2H3hotaGRavGcp98=@vger.kernel.org
X-Gm-Message-State: AFuF++mKJPQQTuNEcr7tqrSTdnuiBc5bm7VCSZgOrlaFxAsuiV1tOAM9
	LvnddhORr6UDFC6XGl3XTwhZjdSW9jz/oprr5Ps52hPkyuL3DgS2qGMe9hutokGswZLim53NT7Q
	eXXw6x+gGEpLDaDCuUz2Uau4NASq2xGHpSlDK1kK4z/hAVGXhMMbjPJSfKq3WDA/RLvfG/A==
X-Gm-Gg: AYBFou1a3AvLk3oNwzVtI7g7aBvnT2xARgT8lTw7CdywBFA4YgPaihyaaMgnm/8OCwU
	W4GIzYD83+LNKjNB43yvdTSqEoa3awvao9KwTSzvh+0T/kt1oDpecQlIm2kjBTJw/adKXdzCOPO
	WvlNsxIexJgOi8Sxe/uqF8UH1TJciqC1j1OBRTMBL3BRmRwcxxaEnHxaSEQnejFUkYv2PY/nks6
	5No8skW/O0z/MILUuGyK550HAyHeMFH5A1g0Psyk9jMNE1mFmvBiUYJ9RzBpzSt+14kBJ4WENg3
	1XVlDd9OqQCXvzWreqh3a9lMaJKfYYcWUmc8z2hOncuUpqqwXhPHueesqu4+VFcQ5rDByf4TRkJ
	D4EYvw86LzzXVTbncrrJu8rAD/TFjwfRa0tnTS25JRej/Og==
X-Received: by 2002:a05:6214:21c5:b0:910:345c:b7e5 with SMTP id 6a1803df08f44-9123d8e461amr100771656d6.36.1789617625208;
        Wed, 16 Sep 2026 21:00:25 -0700 (PDT)
X-Received: by 2002:a05:6214:21c5:b0:910:345c:b7e5 with SMTP id 6a1803df08f44-9123d8e461amr100771026d6.36.1789617624539;
        Wed, 16 Sep 2026 21:00:24 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123beadde6sm41748766d6.35.2026.09.16.21.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 21:00:23 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v3 00/17] btrfs: remove the v1 space cache
Date: Wed, 16 Sep 2026 23:59:56 -0400
Message-Id: <20260916-btrfs-remove-v1-space-cache-v3-0-10ebde03b96f@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALxlq2oC/33N0Q6CIBiG4VtxHEcDDMiOuo/WwS/+Ji3FgbKa8
 95DW1vrwMN3+/Z8EwnoLQZyyibiMdpgXZci32XENNDdkNoqNRFMKFYwRcvB14F6bF1EGjkNPRi
 kBkyD9CBNLbUppAZBktB7rO1z1S/XT4exvKMZFnJZNDYMzr/W+8iX3fdJbz6lZFTWBcgScilAn
 417jG1pYY/VSJazKH44nm9zInH8qLTSoJEz9cfN8/wGhtOgmSoBAAA=
X-Change-ID: 20260906-btrfs-remove-v1-space-cache-45cf57c957a2
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789617622; l=5648;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=DiozgMR/ICapXx8MBD2toeCbM/4lq8wJDPp6LEj8JSc=;
 b=qP/XBQJ0XBp6ND9b1EIG92HzSSJZC+qcsvdgwtuYW5bgLEDEv6cqhsG8MWdMyEEjTf/qymI/Q
 8LMUIsZuDYMAjxFuGDAakiV3AHy03q6RJaDwOdq6EwoZtfyQcNlDtZY
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: KXY5H2fxyI8KHYOwsDQyu0Gz4GlJxj9Q
X-Proofpoint-ORIG-GUID: KXY5H2fxyI8KHYOwsDQyu0Gz4GlJxj9Q
X-Authority-Analysis: v=2.4 cv=O72sLx9W c=1 sm=1 tr=0 ts=6aab65da cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=bC-a23v3AAAA:8 a=DYtDhnsrSwqEHnwMZP0A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfXxAJeqf80O53J
 jx+Uo3WjMSHA7XEYUmgkp7FJgAWdNxifgEAS4RfjUkZcfVvrcNOry/vnKqdzf/RWY9l1p4zuh+6
 253KqeQqaq5AgAGbWwb5tGxo9cgjujq/jVxfKDAwtw//8fare8Ora2el7+zk6uiaCHDHVuxBozN
 3wck/5QPwWJd5qmE5jBikXk+dIZgp6fXK4swo9u6/yAKX18HQdd1x2wLqTvU6Jnp2DIbPJJYtdO
 TgwAieND0YpzZBB4CL5UnWBwWN6Xu+aM17YXsEyzOfYH0vSdiP+CBTNMn7UgJJKSD4xUgaHHQ/o
 ux46TBMwonh69si1F8tePhLGVYza2w80FJS79kOPhJoFLa49vnFcPxytxTwk+YXmvZ1+UH74rlK
 yVG76D40M+8SdZJ+epq6fFipzxR7LYSlNE1LofQGLwIwG9XYD8KRodISfr4am8SwjAs75SgeWWs
 0BYD86SukT/rlRvax9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA0NyBTYWx0ZWRfXyVoV5EDqxysq
 DxJQQDsBTYm/eFEqG+9EVJc2lG9emTgQ1FO8OeYh9XYozd9oeXjqHEXG6nWpa5++qjQ8vUqTbrF
 tMa55RfScVX+bJUqmH71OwxjN/9MOO1Yu0DxE/SiDqzeKu+yD1ZZ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11907
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 spamscore=0 suspectscore=0 lowpriorityscore=10
 priorityscore=1501 bulkscore=10 adultscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170047

Since commit 545e560a5b0f ("btrfs: disable v1 space cache") the mount
options can't select the v1 space cache anymore, but the code is all
still there, and a filesystem with an old cache and no free space tree
still enabled it from the superblock. Qu suggested removing it rather
than converting its page handling to folios [1].

Patch 1 stops enabling the cache from the on-disk state, so an existing
cache is cleaned up on the next read-write mount, as -o nospace_cache
already did. This is the one user-visible change: the cleanup is now
unconditional, and a read-write mount fails if it fails. There are two
ways to fix this failure:

1. Convert to the free space tree during mount (the recommended
   conversion), but this could fail for the same reason.

2. Run 'btrfs rescue clear-space-cache v1' on an unmounted filesystem.

Patches 2-6 remove the write path, 7 and 8 the load path and
disk_cache_state, and 9 and 10 the SPACE_CACHE flag and the unused half
of the cleanup helper. Patches 11-16 remove the trimming ranges and the
free space inode special cases in the write path, which only the v1
writer used. Patch 17 removes TRANS_JOIN_NOLOCK, which the space cache
was the only user of.

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

Based on for-7.3-rc2.

[1] https://lore.kernel.org/linux-btrfs/e1dd5a75-9a67-4bc6-b8d8-bfff79b5b907@suse.com/

---
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
Tal Zussman (17):
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

 fs/btrfs/block-group.c      |  491 ++-----------
 fs/btrfs/block-group.h      |   14 -
 fs/btrfs/btrfs_inode.h      |    6 -
 fs/btrfs/delalloc-space.c   |   13 +-
 fs/btrfs/disk-io.c          |   81 +--
 fs/btrfs/file-item.c        |   11 -
 fs/btrfs/free-space-cache.c | 1630 +++++--------------------------------------
 fs/btrfs/free-space-cache.h |   29 +-
 fs/btrfs/fs.h               |    2 -
 fs/btrfs/inode.c            |  149 +---
 fs/btrfs/ordered-data.c     |   27 +-
 fs/btrfs/relocation.c       |    2 +-
 fs/btrfs/space-info.c       |    2 -
 fs/btrfs/space-info.h       |    4 -
 fs/btrfs/super.c            |   48 +-
 fs/btrfs/transaction.c      |   61 +-
 fs/btrfs/transaction.h      |   29 +-
 fs/btrfs/zoned.c            |    9 -
 18 files changed, 273 insertions(+), 2335 deletions(-)
---
base-commit: 09f1294ee2abee7fe1c2d600671498b7642e0fe0
change-id: 20260906-btrfs-remove-v1-space-cache-45cf57c957a2

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

