Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B550F3A2E2B
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107780; cv=none; b=mYOVp8OqBSYd/4i6JQImK8VlU/omitSdfVQG/G8ScPV4IDzO0H8dRIDci1t1L7TJfwLwRL0Uw0REGPBnbRbxYxev3yKz7s+kK7MX0WmFjseZ7PgRxhO87kBXct4iFuFCf01KLGPq2NgPEezV7ojXUCIseY1rcmMWcnXo6bd9ByM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107780; c=relaxed/simple;
	bh=vt2nIiQCTuAtlH470dtgkLlGm7ANZh3anMSq3rEFmEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbQi20ndwB885valRDLkPhuaB2MziVVrAkoEqSRCj65xarbEN+aE6q8esvKR+mSYr5RatmZSxFsvm1SALrNm/6uvwgQ/pfJvb1GVgbYrgI8LsDw86xazWk3IPQUnGJeA2zlHwp++H4MsQqg5hlvRqePmuOvVx1dalriqYYMpBDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f58HcBYz; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f58HcBYz"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-88b7d853b11so333972b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791107778; x=1791712578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NvUr8Pztb0lV2mGS9jKexhNyTqSHcH6Gdx3TiQSyUcA=;
        b=f58HcBYzolfkc+CgX9MD/Pp9emhXj3HCPgBcn43hNPbq3308/fNkk1ZaRFovZFdI7w
         X6H8UaXfDcjMBMAl5lLcYmozREC3Jib2qLASUR9UFtPYNu/+YC/M0Y51/Iy8HvhpslqE
         TCEy11Gs4XESsXZcFH900wV8zZ72D9ua4jCh2NgcVaKHMgcv/A/BXLvCYYX2SeTEe1CS
         k94Kq4KjoM8TmBCZI0kypCl3/oT5Nh473EvSHQ4UOkYdYdpfEPfCn8PkYZsdkXO7oD1/
         2W38O0pjCJu6qa9+emG9kPu/C+aCa2HG15lvPAHi6flsqmD5stgfQ4gNVir/JkBzMsct
         IfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107778; x=1791712578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NvUr8Pztb0lV2mGS9jKexhNyTqSHcH6Gdx3TiQSyUcA=;
        b=sSuu6MhjN1hG6dJ6oCJ2ThC3y8fCaSYmRVIrXqvBu2igYl0rFYqM/QJW4e9A/5ItTy
         h5sjzMjAZRgn7SchL/dxoK9nLESP/2+U5o95bA+tiCxIvFU1ARqy6+at8a1JA2lVF5S3
         p12rh2OROI3JKRXu5KhBycCiqyYWXNR7Qj1SCCIi4gmuQeWBVhjO6Q2QT/4qlnwPs43a
         HL8Wg9EudDFRaj+rzkG72atTFHwSLTgZdKiGW+B+HOKiWXKYiiM7JcXlYFwql3GHPEaR
         ahm48NQrcmo8Rah8dEpAzjIgSfEPPdXKP2pUlRCm3ixkpz99TAJTfFRg8H2IyKJ1n7+9
         MMqg==
X-Forwarded-Encrypted: i=1; AKwUvByWf/NKCdkw9FcsrnzABX+7EzjkDGkh5r+2cCT7VQf6EMEMLiFx1ZZ2qjX83Gl6YDmf8hsBAaXANal4q1E=@vger.kernel.org
X-Gm-Message-State: AFuF++mcXt5cZC0ZSbD83xi3fXVZooXCFCkw6bvu9ekfIYqaxYG0FAxA
	aZ5iDMCihTlTva84XuIsz2oHWPEbqGtglQOfinIn9iowQi6vKR9ZRQSD
X-Gm-Gg: AYBFou3307dCVTjNKyHbD4mZAadECOjlkiFXN9cwhDZ3Ebh23H0ruNR4spfxu0cvjY9
	Kdts9NKs/6NTnD1IcY7ZzRqEjFlK2jmKNjE1bJcv7hN1D2zEIH3XWGcyKmE8rFQRI3wrLREy//s
	prTcfIUEeokVk4x2xclZqRfonTEXm6Lyyskrr6f3Iqyh5LqEqNfbXtnuR2XaJemr4GZ8uCL657E
	AL4PVyO4NvChsnAts25CWLCqtOwg8ij/K7htaAbxdmqE+IKRHxqYNeWXlbDb2tDI7D88zvsvHsQ
	rnkS4sTPqDIL5uX3KJ+IVGJp9sNY0dFqRz0R83qCfEbjJzKq0ocpSvudME34q5C+9rrXwRGcOlK
	SsyuoJrBDqZ4OevjcxiSPNdG38Dql4HnRpfJnTOqQOECJHisxxsr8w0mMUQtJetsKT30kB2sdM7
	7srsKPxJw5OFiCKdv1xB5d1x3W0FSy996XjR6Jed42KCMru7LNYTB8fucTbcreFMOozaSKLf2P/
	QV7A0H91/q6iRh76y93FV1H2oldhPiKyHCeU80Kw2j7hyCqsQE2SU07omG2WvvRPTLdkHX5hm2c
	KfyZM6+eWQYYj1Sgxwo/BTJFcg4aNJEl+WNOQURv115eQVd66ljuJ8qE2Nql
X-Received: by 2002:a05:6a00:23d6:b0:882:1b4d:1847 with SMTP id d2e1a72fcca58-88c632c2abcmr3416786b3a.39.1791107777902;
        Sun, 04 Oct 2026 02:56:17 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c3a39f6sm2418175b3a.28.2026.10.04.02.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:56:17 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] ntfs: restart the zone search when the allocation hint fails
Date: Sun,  4 Oct 2026 17:56:06 +0800
Message-ID: <271a56763c9c63de326e93906ee8686fb03270e1.1791107674.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1791107674.git.matthias.goergens@gmail.com>
References: <cover.1791107674.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ntfs_cluster_alloc() is given a start_lcn, it first tries the
clusters from there on.  If that does not satisfy the request, it moves
on to the zone's current position, but keeps the pass, the zone_end and
the has_guess state it had.  That loses free clusters in two ways.  If
the search had already moved on to pass 2, whose range ends at the hint,
it scans only from the zone position to the hint and misses every free
cluster between the start of the zone and the zone position.  If no
cluster had been tested yet, has_guess is still set, so the cluster at
the zone position is tried as if it had been the hint, and when that
cluster is in use the rest of the bitmap buffer is skipped.

Both happen when the hint lies at or past the end of the volume, which
ntfs_attr_map_cluster() produces when it extrapolates from the last
allocated run across a hole.  The allocator then finds nothing, shrinks
the MFT zone to nothing trying to satisfy the request, and fails with
-ENOSPC.

To reproduce on a 128 MiB volume with 4 KiB clusters, extend two files
in turn by one cluster at a time, alternating between fallocate(),
write() past EOF and truncate() up, so that the runs of each file are
separated by holes.  When the volume is full, truncate both files back
to 1 MiB and start again.  During the second round a one-cluster
fallocate() fails with ENOSPC while 40 MiB is free.

Start the zone over as if no hint had been given.  A contiguous request
can get there with the run from the hint already allocated, when that
run reached the end of a bitmap buffer or of the zone.  Return that run
instead, as when a cluster in use ends it; going on at the zone position
gives the request a second run that its caller does not expect.  That
could happen before this patch too, whenever the cluster at the zone
position was free.  ntfs_attr_map_cluster() reports and zeroes only the
first run, so after a fallocate() of 20 clusters over a hole, with the
hint 4 clusters before the end of the volume, 16 of them read back the
data of a deleted file.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Suggested-by: Baolin Liu <liubaolin@kylinos.cn>
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
v2: for a contiguous request, return the run from the hint instead of
going on at the zone position (Baolin Liu).  This also fixes the stale
data after fallocate() described in the last paragraph.

v3: unchanged.  The other ways to a second run that Namjae Jeon asked
about, after the search has left the hint, are fixed in patch 4.
---
 fs/ntfs/lcnalloc.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
index 0d6cd08ee2e7..c58e689fb585 100644
--- a/fs/ntfs/lcnalloc.c
+++ b/fs/ntfs/lcnalloc.c
@@ -506,13 +506,32 @@ struct runlist_element *ntfs_cluster_alloc(struct ntfs_volume *vol, const s64 st
 		}
 
 		if (!used_zone_pos) {
+			/*
+			 * The run at @start_lcn reached the end of the buffer
+			 * or the zone.  A contiguous request gets that run
+			 * alone, not a second one from the zone position.
+			 */
+			if (is_contig && rlpos)
+				goto out;
+			/*
+			 * Leaving @start_lcn for the zone position starts the
+			 * zone over as if no hint had been given, even if the
+			 * search had already reached pass 2, whose range ends
+			 * at @start_lcn.
+			 */
 			used_zone_pos = 1;
-			if (search_zone == 1)
+			has_guess = 0;
+			pass = 1;
+			if (search_zone == 1) {
 				zone_start = vol->mft_zone_pos;
-			else if (search_zone == 2)
+				zone_end = vol->mft_zone_end;
+			} else if (search_zone == 2) {
 				zone_start = vol->data1_zone_pos;
-			else
+				zone_end = vol->nr_clusters;
+			} else {
 				zone_start = vol->data2_zone_pos;
+				zone_end = vol->mft_zone_start;
+			}
 
 			if (!zone_start || zone_start == vol->mft_zone_start ||
 			    zone_start == vol->mft_zone_end)
-- 
2.56.0

