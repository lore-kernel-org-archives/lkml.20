Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395653AAF42
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075416; cv=none; b=uuUaMxQhYGetbiy45oUUTn/lod0mPt9TsDl2lApRfuJAtzWpqxnvyrraxgucUycyIDVQxKjHMwGxxO0f5ia17NhGlMRfn0GrurPq6dWQhFLVGNjnnu+FIxPCLBTfnhOVXfd8W23Dd8NWnCS3jDJid4YZ2xHSe33VNowi1+2Hc4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075416; c=relaxed/simple;
	bh=7N0boFm4UgABe/w22qf1vHvkOKH3/KVQts/XUigHtYM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AtFzumGk4dTDzyezbYIyVYEufpy5uzt+I/iMThiyoI6kI28SY7dprZrEWanqXEwg0qP2peUWo6X7RavWzbdsMQ+TzHkCJ7D5Z2b6IKhZWCo26uTRs11WtFbdtLEpujs2reW2XFWrki+dL3MH8665lG6CPDEA9KW62zbJRlCn9qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=YPGIALys; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=dOJ2WnGv; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="YPGIALys";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="dOJ2WnGv"
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FEYBIG854780
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=3Rf8
	JnmeRK93mEgyVPUqenEJOl6UTxjmJdOdcJbWSSo=; b=YPGIALyskNxKRzjenaww
	1NQnsj9X7KNfcP8qrkCP84g3qyJ6PR0jbBb8ctvImaMBtzPJch3JIr/ADnxpzbn2
	egYaqPBsIuORMSyYyxGnypIZmcz8Hm42ZAoWUFPAKsztlpx6Gqo/tSd90cRz5x/3
	zBT/ygXJe1m9vmTbWAiiPMI3KWPS5gsZdWcaoclG5nVGk/SDMPdb9d09vrFGk36L
	XlL6yuQXPlK+PzilhpTV7PfrNAQ4klCbXdO7wcBk8AlKzkonz90vQAvQfENO2r/f
	hNRL3Vm1GcdE4Pcv6vWhEaY22IDusNKCOCJKtDPE0DuapKnWWg+A3woun5+4K+P9
	MQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hatthjc9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:43:33 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91961374299so156851076d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792075413; x=1792680213; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Rf8JnmeRK93mEgyVPUqenEJOl6UTxjmJdOdcJbWSSo=;
        b=dOJ2WnGvIycM759yGIPsBvTcMZQ63aOSKecOh86a5tFluEV64H09CpM5ACNh2sa5vL
         01cEtiCYuThbyjH+XxW1gPnoyIHI7kK3KW2QmQEXwKiYFU19v1sJqjE/H/tZb20o7Dwf
         4qMVOuGcai0rVxR3aR6AIHi1IWA2o1zucy0yiR0Gfhl4eGID9RQfByz5GFFonvGsUcix
         c/mpUH73YLli0/AdPSJ0nEDwfKdZvH6HbjbhNDEUn7EcwaeVVkZjPSUhKT6WOjnO/0pb
         jgb6QDc6gB+OWXDSZ16wn+rk23Rd/RQdrLbGHRqBNFMTGkx5o7lh7pUq3HKdbWMWbinC
         P9hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075413; x=1792680213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Rf8JnmeRK93mEgyVPUqenEJOl6UTxjmJdOdcJbWSSo=;
        b=dbeQHpBHtOZw1yFvMBVQBNBweBFxue/sT28IFtx7DSAn58N/kl4W72TN/viXqjt/pH
         BbneK4Nd/Hx9ga9oPmyPnYLO1QzKDPbCLq3WMRDhAtlc7ysWU4otK4NU0t3nNEJLG1Xm
         AuSe73S7APDuFP9Rc4c0hrZ+gLT4oHlPo6uA/RyHsxFq1e0agumBiiIxxV55eSDsQQpJ
         txk+URcIrXyu2jPkCNVysjrFK8esghLDWrKh1VY4bp6pppvoik7xvS5PK8dGCTZ0qpWh
         7dTupJ0XAMYqB2ygAPIZNgzlLai/YsdwboyRipINbFArqKfMcqUOzAITfKg8uPW/4Jwa
         xiRg==
X-Forwarded-Encrypted: i=1; AKwUvBzZN9u+lzJL67l7GeTXmoS/PHCZXPX3ddOGKxpsy8r32JuJeAoYUkHAgQaRxlP4E/+L/e/utpJmZlY4X8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA0vhWGjLRumSnaB9m9PxSe4K8WVn6oAbXqXrhI8B8OqQixT7g
	GgGDv8lr6fJinJS5gVaHNlrw4yBSMMu0AVnkM/lxv9FpyYx9E7Gku0qdPJ4RLF2oHED3oEm223Q
	k1ZzVDkzIEIlb2WPHBR3WdsW0LD/167oQuRN4aWWqyxekmmzxXoGvqWydKPRk1A==
X-Gm-Gg: AYBFou2LR6MglSKoS6x6XT1imk1b/wJ8sM3sISVMhWTReC4pN9nj6WDxhLlsX/DGM7F
	ovMS0qbG3QwqJcHA9tzmM2sM7w7JUxnBHX6mwA6LOwdGJWz0E9b++nNTy/hy07AOXz35n/5GWVV
	CoH4F9ZyH66q3nDW9DctAB0mfGapM36Cd4a05n+wkSI5U9HEmhCEonGqNKW/JSKcIclHHPT4yJv
	8juHL6+/icXp2vXt7cO99V9twM42Wq7SBVg40bgwnDtObIo2b+n61iSRIJQtxrSrI66NRi5AGmU
	B0/2JjPKQjm7mkqwRgAABIKONt4cQPw+6/HdUKAfzMFKRn5VCQ//b3AD91k9dNJaPjHZjwLtQpv
	yM9SXERzQU2KUP1beC5ozW8ErUa+mIWjnOnjLToGCnPyb
X-Received: by 2002:a05:6214:2b8b:b0:917:924a:d4eb with SMTP id 6a1803df08f44-91b55575e40mr325475036d6.36.1792075413333;
        Thu, 15 Oct 2026 07:43:33 -0700 (PDT)
X-Received: by 2002:a05:6214:2b8b:b0:917:924a:d4eb with SMTP id 6a1803df08f44-91b55575e40mr325474606d6.36.1792075412885;
        Thu, 15 Oct 2026 07:43:32 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-176-51.net.columbia.edu. [128.59.176.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b5f323sm83026476d6.20.2026.10.15.07.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:43:31 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 15 Oct 2026 10:43:16 -0400
Subject: [PATCH v5 03/19] btrfs: stop enabling the v1 space cache from the
 on-disk state
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-btrfs-remove-v1-space-cache-v5-3-6b31347d9998@columbia.edu>
References: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
In-Reply-To: <20261015-btrfs-remove-v1-space-cache-v5-0-6b31347d9998@columbia.edu>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>,
        Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792075404; l=3785;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=7N0boFm4UgABe/w22qf1vHvkOKH3/KVQts/XUigHtYM=;
 b=/diXBcaswzDmvJGVMEtWFaCDCvpMABrBOsVAmGdUVyguAyyjnlpvGQjhvEc2ooqGCuhiNcA4A
 1o+bxmgaa8RBPoohwfm2t6Ce8OCg0ojfNOwsRSIn21WfU77KTaypQyI
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: VOPkA_mfLg9_GrMXtBe4jNhe5xN4Oe0g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX1eAu6vSiUuNZ
 LN8LzO2URNdlQqrMaoczIkA0owT9wsaETOr24+4noVdHuavBhuQaKBrcskfKyie7Uayw6z6ieFk
 d2z8rRnk0jEYl76vk5nN5Pv4oKfI9eUNvz7cjhdisO09eYItJmP0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NyBTYWx0ZWRfX4T9XnUKIMZg7
 AyCEhFuIG5TUl+6f9gVmcY3y5Urz57txLkuF2hvnGyQcpiXabkiuas5v4aRx7j1LGl3yBR/ktz+
 YHTS4Q8CAjX2tY+f1aHtV1RxvPj09poEAmJKwBIu267T17yhyvcO+TZ8XCW075n+KxRKmrCzea7
 zNJ69LVy4yl2WqaDl0f6PRF9fcfoK8XxxOOQHtidr1NMvjtk2FoIu/iEpyc2eeWgoz2a6mkBMbk
 0P92EJJ9G9Zp4XMkW8pGWeVM/s+0yN7BHKiYztZ4JdrAjoRoZ3HsyzhB/gGhmDw1PKgs0ErAIOI
 cLFgtMRBYW8t7ZyUPTVGFRsu9t5/lKuED+vV9I0EqjnPN22nzf1bSMCdewmH7LyPEPwzafDeZ8v
 /OWDjB08oUHjfrkm7sY621S2Fa8ywZ+5/YN53v8cddVAugJU9qa/l+Qi1Mg/nDY0jPHCbenTqQf
 sJcXlgnBwSrr/QHRQUQ==
X-Authority-Analysis: v=2.4 cv=WJvqzXsR c=1 sm=1 tr=0 ts=6ad0e695 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=NKoNGjn6KhAaSQkl0TXC/A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=6xji9QrKO1GPOBtlZsEA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: VOPkA_mfLg9_GrMXtBe4jNhe5xN4Oe0g
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11936
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=10 lowpriorityscore=10
 bulkscore=10 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150057

Since commit 545e560a5b0f ("btrfs: disable v1 space cache") the mount
options can no longer request the v1 space cache, but a filesystem with
an active v1 cache and no free space tree still enables it from
cache_generation, and remount does the same. Drop both, so SPACE_CACHE
can never be set.

btrfs_start_pre_rw_mount() then sees the on-disk cache as active but
unwanted and cleans it up, as -o nospace_cache does today. That covers
the read-only to read-write remount as well, so drop the toggle in
btrfs_remount_cleanup(), which would otherwise start a transaction on
remounts of a read-only filesystem with an old cache.

When a remount that isn't read-only to read-write asks to change the
free space tree, btrfs_reconfigure() warns and keeps the on-disk state,
but the fixup that resets the options only ran for a filesystem with a
free space tree or an active v1 cache. On one with neither, a requested
FREE_SPACE_TREE stayed set and the next read-write remount created the
tree. Clear it whenever the tree is not on disk, which also covers a v1
filesystem once its cache has been cleaned up.

The cleanup is now unconditional, and the first read-write mount fails
if it fails, as it did with -o nospace_cache. This also lets an old
filesystem mount without options when the page size is larger than the
sector size, which btrfs_check_features() rejected once SPACE_CACHE was
set from the superblock.

Assisted-by: LLM
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 fs/btrfs/super.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index 7fabb775d4e3..af7aa9adbfc3 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -777,12 +777,12 @@ void btrfs_set_free_space_cache_settings(struct btrfs_fs_info *fs_info)
 
 	/*
 	 * At this point we don't have explicit options set by the user, set
-	 * them ourselves based on the state of the file system.
+	 * them ourselves based on the state of the file system. An existing
+	 * v1 space cache is no longer used and gets cleaned up once the
+	 * filesystem is mounted read-write.
 	 */
 	if (btrfs_fs_compat_ro(fs_info, FREE_SPACE_TREE))
 		btrfs_set_opt(fs_info->mount_opt, FREE_SPACE_TREE);
-	else if (btrfs_free_space_cache_v1_active(fs_info))
-		btrfs_set_opt(fs_info->mount_opt, SPACE_CACHE);
 }
 
 static void set_device_specific_options(struct btrfs_fs_info *fs_info)
@@ -1285,8 +1285,6 @@ static inline void btrfs_remount_begin(struct btrfs_fs_info *fs_info,
 static inline void btrfs_remount_cleanup(struct btrfs_fs_info *fs_info,
 					 unsigned long long old_opts)
 {
-	const bool cache_opt = btrfs_test_opt(fs_info, SPACE_CACHE);
-
 	/*
 	 * We need to cleanup all defraggable inodes if the autodefragment is
 	 * close or the filesystem is read only.
@@ -1303,10 +1301,6 @@ static inline void btrfs_remount_cleanup(struct btrfs_fs_info *fs_info,
 	else if (btrfs_raw_test_opt(old_opts, DISCARD_ASYNC) &&
 		 !btrfs_test_opt(fs_info, DISCARD_ASYNC))
 		btrfs_discard_cleanup(fs_info);
-
-	/* If we toggled space cache */
-	if (cache_opt != btrfs_free_space_cache_v1_active(fs_info))
-		btrfs_set_free_space_cache_v1_active(fs_info, cache_opt);
 }
 
 static int btrfs_remount_rw(struct btrfs_fs_info *fs_info)
@@ -1557,10 +1551,8 @@ static int btrfs_reconfigure(struct fs_context *fc)
 		if (btrfs_fs_compat_ro(fs_info, FREE_SPACE_TREE)) {
 			btrfs_set_opt(fs_info->mount_opt, FREE_SPACE_TREE);
 			btrfs_clear_opt(fs_info->mount_opt, SPACE_CACHE);
-		}
-		if (btrfs_free_space_cache_v1_active(fs_info)) {
+		} else {
 			btrfs_clear_opt(fs_info->mount_opt, FREE_SPACE_TREE);
-			btrfs_set_opt(fs_info->mount_opt, SPACE_CACHE);
 		}
 	}
 

-- 
2.39.5

