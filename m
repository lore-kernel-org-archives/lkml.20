Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC66521203
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866191; cv=none; b=F3m5DwgT4SybLhq1UTGfW1v+qI3+2iT0S5Fio0LVZ+Mfn7A5lZhM0HpgLbDH94G1ryqVWC0lyjdI8oaFnnTUb0UeIMuPsiLUhBA5bsV+OUL7Jbhc6++K2f4JbXQahThmi3ui2saqop2IpZZOQEZjgbEl6LgvBpnuRGvy+eYVKDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866191; c=relaxed/simple;
	bh=cakvKhsl5eoMRP2BRapw+CA6V+bKMVx0udnly4hraEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSrUUuD60PMeynB+Ri8bI9S3bsh05sAXa7Of7XIVAngvsCdTiIKoHKxsSbiKXjp0kwwIp4bIuiS6nraStLZ/AVJ5FDvSEOvUuEr0bhu+g2L/t3Ssgseil0eq2qvOLN54HOvjPRqMcl4ba1l8BkcogY/by8kcGdtSXpCqyROWIgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFD0LWwE; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFD0LWwE"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so43754775ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866187; x=1791470987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qSjgAlkXQv8MXGqZfLAg27uITdisEmnV1k+2Gszlo30=;
        b=HFD0LWwEihG0zPdj0UseEeiYSoqitOWl4//T1Rh1GPTvGWg/wjYe4vRLjM7GXRd8v3
         HC27MLUZjzsz8UV071bbq8SiUChdlZOSxjcVg4OCebDEww3myYhp2nHq5/5nKpWFdHWP
         AFzVU5r/Sw9lNubOdgsHroO1EQ9vVxbWfBWe+Lmi9lp1XOIk3FXmM8BnmXryYIBIFi2A
         7U5Beu6yzu9Nqd9CEEBjOhyJOOYW+2M5V+8zJ+svjJy4TIma15mJZlqGrtalJeOMMOA4
         qjw6WBVHbAnd1DnzF+kWL5WlEzhN6xU1Nlau0lRZNjpCmVL4UkdxpK9TiNi1zSH5d2G8
         LJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866187; x=1791470987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qSjgAlkXQv8MXGqZfLAg27uITdisEmnV1k+2Gszlo30=;
        b=e5zZcUPJ7yXyjmLDBKH+5yp+5xFG8Fb/a3U/fHWD/gHQ0owbQ47OqxmRPRwpD+fkZE
         WWtKA5/ILErejD75XswM65T0bUysAQVW4QZkW4F6A9uJJkKgAMtoBP/oQ+qNi75oZNJP
         B86NaU3zLoEmCx8Wi8c/dRoXyCLu/T0ZCnihqKzvzPQCSGPSdL7j5z6veMd+E5tPuQ+J
         D5ncTdRauJWagpeehS5hYiTPPxldSCWhjS86Io/XJccCeUwKlVyr93RRHvRMxqWL7C/n
         hrKncQqB3VWow107t6zAZrDkAbv57p0L2lyWnSU3w6HvgpcrW7Q5AhF3ZwBuiQQ18Pyt
         ICpw==
X-Forwarded-Encrypted: i=1; AKwUvBzu3jqA2XqsimhEpgbVJDQGIZQK+QuVzafOUnYGlgYpiKNSuFqevOAdjRKC0FX6h8r224Aju4KmxYzLrSA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOmcFdvwUTsS4trXh1bQ8OIHbV2qcaRyMMsWbsPy5dRu0gH+ug
	ydWxESe9EmukyRH/ZGXe8tMvWHT1CpGU2HnOD/2ThdwNRFBrMbLDEkY6
X-Gm-Gg: AYBFou31MYtoH39ANmADIW+CzF9HO3HQBKvPp+vmheD4hNQcJ4NOxR73s6TSQ/uEn82
	rQENXzXIPOwDi+qnzr8xjEy02F8z8nBPdCWGRPK/uB95NjXvLUEqd5VWFv+EOB5T9w8q1kDqdHf
	kTtyEzvfCtvJihptw/0gMCkTzzRNQK7N4s0pWTPZoLU4VAbh/l38lWjmq+6+fzyhn/Cns8kbb9N
	T2as/Ml+fe5p1T9aPzR3zzqGtjyuJJ5HP+V2afs1jgSIvxANmmIOEM0+XNThASrCLETj8mfQSaG
	45fvbb9Dp+EWV+dIY3tgbGDz51Sa4We9bD9mQmfbpL6vMa+kb4hGL2ekB0yVeFje/2S8yEMLLIe
	JjXEvrH5EOdJ5tUh4uzoi7eTQyu0EYJAbVjYenbf72j3fHI3vtU0Y606fcjt67T+/J6JgDfL9um
	jkUpwjOX5iuyosHMkZCbZKo/Ompgm1TT6YoPw1LhTryaR8zjekx8ZAYs4bq0F5uHGbRKpusDyu0
	iDS42OvU5pXjZ1cSS/f6Z8Lg0SDHLbRe5FUv2OWYfZv2rmWn7QkSqmcSiNDMtGIpfcJasPdGj5Z
	7li7wxRbbrai+0gQbk5n4DJ4OxRqAwNxpPEOGPo9yVrPistW0IsmORQnQSwU
X-Received: by 2002:a17:903:3888:b0:2dd:ad73:c983 with SMTP id d9443c01a7336-2e2e4b35641mr41899545ad.27.1790866186801;
        Thu, 01 Oct 2026 07:49:46 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e317cd0624sm6636775ad.30.2026.10.01.07.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:49:46 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	liubaolin <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] ntfs: restart the zone search when the allocation hint fails
Date: Thu,  1 Oct 2026 22:49:37 +0800
Message-ID: <10fbacf8091e8e5aa7210b1c64750f20b655d960.1790853718.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1790853718.git.matthias.goergens@gmail.com>
References: <cover.1790853718.git.matthias.goergens@gmail.com>
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
---
v2: for a contiguous request, return the run from the hint instead of
going on at the zone position (Baolin Liu).  This also fixes the stale
data after fallocate() described in the last paragraph.
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

