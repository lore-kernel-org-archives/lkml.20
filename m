Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEEC38B7BD
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789334496; cv=none; b=Nu50g0OKs8BaeN8LCSxJP0vsPMIcLsBbAyPXsNMwKXu/bEffu1BtumQ399EkgDhJM/iCDDHBagqdLR0BtYm184bl6jA5uv9pD+2ESfD0vrCrt12KLv1Win7L9/rmKFANKOcfALtr1C8Xt/0AKEFZ/9YRjvinZBFkR4LNVWZeBg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789334496; c=relaxed/simple;
	bh=YUwqKXRVO6ne1LKlYOwUs/QSfP1dqPFMWzTGGWffy3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PUmmYq9o09v1tXluxtUt9Zcf/N2c6J9lPeKtIt/VqqJ/eUKWfTWihKLBUCqhFgvRN5IUEVTNleWjv5UyxeDCpA4qGDDaGpD3QL4EVTfU8kPSkpSDI2EPJdEtKptijgZTZo3NajCGdHrmyEqZ7VvjLGe/RQscK92CjHfg2q6mjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=m6nEUUrc; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=tX+bAupQ; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="m6nEUUrc";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="tX+bAupQ"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DKYHvM649023
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=sP9aSVh36R4NKXyAt2xFOt4st+
	TewWr2CQVSF4wiG9A=; b=m6nEUUrcydjKMBa0+p7rMRxa9EjouOUVC20zZ9djD+
	Db22EwcO4RGPIlwiZZDOfTcpXUZe4Frir9AJ12N7tR2KZUA/RuRkdGsUPu8xq+kY
	YJQJx88fcsFK94UcQN8mUQliiyogDXEahh70vsmMBW/L3C7/5Cb4wZs48zwmMKCT
	Vy9ZHD6fm50pzm695GZyjUpGd1cjCnz5Et5flGSQGCZQvmQ/fmkqhbTGJajB/MCw
	HFVDuAoFMpIzhc1UtkW8GfYqrwdMwCN62KUmW9eZACy+SAav+9gB4Nn5BKxWmFGG
	jt3bzt1JIWqTQmG0/r6I9qGC9fE9riC6kyedQn8B06ag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gp0qmgpw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 17:21:31 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0312937eso142671985a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789334491; x=1789939291; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sP9aSVh36R4NKXyAt2xFOt4st+TewWr2CQVSF4wiG9A=;
        b=tX+bAupQNkqWioilfd5T/z8KNP6IeB9HdlRogdYVH738DwZum6u1ZIZgVG49Am8Phy
         mhBXOHO3k3AV+31x0Kx5nYv5PZmDsoI+3USmtwmmqT+jseOblmUcK+8Z6Vk/h4moaCKy
         7NPcSBINc2E0RE3ta8z+RRnFx1lCLo4j3quS1fyij9GMvj+/af0gnVh3OtY8fRd1F8Mh
         492VS0NbQVU2LGFX1FmJZ6yWlpZ/OQ04Mrf8sRd6ASxQz8f4GbzW9fktDxC+U3AsVKwP
         uOIKv2C56p4yvjREE6jSvsrzo77Eh/MH/MdYoMz3TYRKd1Zx8+l0sNtmwYR65K8liCIG
         8WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789334491; x=1789939291;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sP9aSVh36R4NKXyAt2xFOt4st+TewWr2CQVSF4wiG9A=;
        b=fr6Us+4b/mjR/iYnwAuVCJqlFfAT23p+jWShp0FSZTr5kjacJinPpv9LsmmGz66WD3
         crBv2wUvUoUngoGWVtcVREs1q2jlD12ZtIEkpDgcs29VHlF6OCvr5fhlh7P2B3mNjSnr
         c9BvMiPBigd98FDL9X6yaLTYQXKvo9a0BHNt25MmucqaU+Q4y9GWQvWJfTXHg39ZKMbt
         y1RRbaCl1H+5AciEo37dVPWvygJcWgYRL51D/Z9CXimoZNy127LYgmh33IzDYkEUd8D8
         YmW9jFgR0YwarmpOPb4Oj8CuK12vSoeCf2y6qgrALTkQLgIgHtM3vZoQXRX8jRs6m0YF
         eH3g==
X-Forwarded-Encrypted: i=1; AKwUvBzqrzD+7apwxUaXNIKEGWxOLTWw/CGpwjaCjSy/C44v2icV83JNtuFA1oCHcP/xZDX9mvqyUlVHW2Zh0Nk=@vger.kernel.org
X-Gm-Message-State: AFuF++lD7TmVarkEiqfzpcnY2/tmCmxma5vHriznPEXjkVkPS5jHp+hf
	8+lwyP4wm4yMF6x81m5nnxyu56RJcXjU9g8ZoM+g3n4LHOSn2rNrCaCYLLAQO9Cn+m/IOXrTxvR
	oafFyx+qIcVQ7TpfOOCP32U6sv0rCKSM6MRuz4UlFffQbWU8OA7bt2Qz+NyAVkg==
X-Gm-Gg: AYBFou225+BR4ibLkUPD/DUarF5xJZQTm7hsX5NzgxzbgqdwWeZVxMYVbYg5UkyLdfF
	a2MgXap+CsFKa4+CBA1BTxz5PHWKI7DYJgR68SdSc1XABJxnX/DyVoelktREun0TQZ4BBooUrcj
	rz9DuGO6TSj6OKQQXUVkczQL5yOft3mdOEwdINZSzMGRGVCm6leyw5Ek05AW3yDZmycZvcw7tKP
	bolv7NOacwJvdggAYf3XudjfzyytY2HTS0kSK8UCX64Rr+U8PjMDogREo3A2o8gzUSn5NsRnlZN
	A5KvpxwtgOBZf8jbgM6WTvZSZHCmDncnbt852LPxwXQHw4kt/VvOmLTdC4udB8XdP0MUqiXe7Px
	dedZkAromkXcABQhLPS575XJlb6/7H5o+trBwW3BlYYMX2icHV6Db9w==
X-Received: by 2002:a05:620a:d96:b0:939:6de7:8765 with SMTP id af79cd13be357-939ea280838mr2190227185a.44.1789334491238;
        Sun, 13 Sep 2026 14:21:31 -0700 (PDT)
X-Received: by 2002:a05:620a:d96:b0:939:6de7:8765 with SMTP id af79cd13be357-939ea280838mr2190194685a.44.1789334486013;
        Sun, 13 Sep 2026 14:21:26 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3a50sm78432696d6.40.2026.09.13.14.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:21:25 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v2 00/16] btrfs: remove the v1 space cache
Date: Sun, 13 Sep 2026 17:21:12 -0400
Message-Id: <20260913-btrfs-remove-v1-space-cache-v2-0-186767a7e106@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMgTp2oC/32NQQ6CMBAAv0J6dk2plgZP/sNwaJet1AglLTQaw
 t8tGK8eJ5nMLCxScBTZpVhYoOSi80MGcSgYdnq4E7g2MxNcVLzmFZgp2AiBep8IUglx1EiAGju
 Cs0QrFdZSacFyYQxk3Wuv35ovx9k8CKctuRmdi5MP732fys37ndTfU0YO0tZaGn2SQqsr+ufcG
 6eP1M6sWdf1Az62WXvbAAAA
X-Change-ID: 20260906-btrfs-remove-v1-space-cache-45cf57c957a2
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789334484; l=5050;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=YUwqKXRVO6ne1LKlYOwUs/QSfP1dqPFMWzTGGWffy3M=;
 b=/wAa6N4p3FWnP3kg3Bcs4e1DcKNEf6V7H9oeL/EzbT22/GXJnfU4gLMyPQhEK90h7KQoEP/uD
 wc9FXskVlsNBJ32Jebbxj6e+x4g/1nDiYMaHfLfHDr+/WM923Tv+4QL
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX8fyMZuAigI3a
 rb9boiVU/YYV+I2LowxIsg1P4KIsDqy+sdMX13yC7npoO9sUuk/YCxIB1sRbxlokjXUCVSnCtEv
 RB2b/mOCKdCp1jzAOXizu/qPVvIujHv96cH648je40k/XuffK1a5
X-Proofpoint-ORIG-GUID: ZB-pPvHV8_K8IBOzOULJn95gxXFoi0Bw
X-Authority-Analysis: v=2.4 cv=EJ6TQFZC c=1 sm=1 tr=0 ts=6aa713db cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=VwQbUJbxAAAA:8 a=iox4zFpeAAAA:8 a=bC-a23v3AAAA:8 a=9ly2DDOFe41V05N6iNUA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=WzC6qhA0u3u7Ye7llzcV:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwNCBTYWx0ZWRfX64j1YsuWMgeC
 Ga1pA5zCcxlW4nOMm/44fREw3ry3LbFARLNha2g3dPr6V6ITK7xIKeAMQYxL7h6WcstbDlUDC5t
 BJUMzUdkGV1P/NDRG0NvgPQ65AljltbLjK7SuauVnNl1i8SJiVkibd6nCbEffDbREW0H5KKJXKq
 FiYtjg+3sTwsSjW/R25Ro4N9K0wugZbJWVUFo02ab911SQqAY0vLm5JwZ2j5ZVOJBf8IjyFziAD
 Nw57DjHp4TWZgcEzlNU2aRj9+MC+ZIIpiyFJWW5vK1VghNUMoWM6KFSQW4ok0Gt7QKaBFwvV+l7
 AnI34+RrleqlM+BNu0nPq8457sdjbcugWyCsSGGYpDywmnAjCGOaz/cSmMs21IOymx/XCwuCKcA
 GoK17Swf4rhGiok9qrpinY2uFylmCQLYlFePdaS6tFhgzhl5ggHLb2lvrI3LiZ/T7dUQGwOi1xE
 JNK1fynY0gi81DcesHg==
X-Proofpoint-GUID: ZB-pPvHV8_K8IBOzOULJn95gxXFoi0Bw
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=10 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=10 adultscore=0 lowpriorityscore=10 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130304

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

Patches 2-5 remove the write path, 6 and 7 the load path and
disk_cache_state, and 8 and 9 the SPACE_CACHE flag and the unused half
of the cleanup helper.  Patches 10-15 remove the trimming ranges and the
free space inode special cases in the write path, which only the v1
writer used. Patch 16 removes TRANS_JOIN_NOLOCK, which the space cache
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
Changes in v2:
- Split the TRANS_JOIN_NOLOCK removal out of the ordered extent patch
  into its own patch at the end of the series, per David
- Add recovery information for a mount failure due to patch 1 to the
  cover letter.
- Link to v1: https://patch.msgid.link/20260907-btrfs-remove-v1-space-cache-v1-0-5f9a5ba352a7@columbia.edu

---
Tal Zussman (16):
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
      btrfs: remove TRANS_JOIN_NOLOCK

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
base-commit: 09f1294ee2abee7fe1c2d600671498b7642e0fe0
change-id: 20260906-btrfs-remove-v1-space-cache-45cf57c957a2

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>

