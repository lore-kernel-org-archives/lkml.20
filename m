Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9161D3D524F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506648; cv=none; b=Fho6Xi0ziVdxXsKi0zaVYLQKpKF39kNGaWk4+H6X6P/UZmrsI1z376hrns/mI8moWv2cqBtk+ycowjiTZejTFH4q+aZATV9wv64Ljszfixzl77YdgFd9RDR0xlTcPBPsJ9HZl3ZQfcrWNzEyhMhUf2S5ghpVR2fUleTWIdjExUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506648; c=relaxed/simple;
	bh=eNwhT3ZGqjB2HEC8B6HN9G+Zq0SEoGTqMnOPNZ4zWJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fuEuf1toxlpqKjA1GEeYXnnGw6yqwIC+Rcm71LhgRDQVK7t2WO10uNdPKjfeTRXA+sy4GQNYbdzziumtD/dCggUamsx/v+NWb/lzc7xPSaOb3c1ooOcWTxVlnJfN46o5xALWX4D7CsQp17pAxqZ4jKVFyx2iE07PzvHueDGx7xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNsWKm/a; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNsWKm/a"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0b6200eb0so1630733a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506642; x=1791111442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+ZGzG0bURFDXcZw30n7m4Md6MGV3VzuOyyLqAT8l4iw=;
        b=bNsWKm/a6NZTXpJRxyydE5LQfLaEuvvSrhel58zmBZGW38QaoR2mS8ZW6q6xqwgvpg
         Ww+gmHpvbyxepXRwQwgwWGdi0tsbEAIcVPaxAVpYrp5Ww/g79oStKymo+AkjROvp6L5O
         DesG8xZFLG+IEWP0rqwNDjxiAVEouhizVAOOg8iDC9BIZr03bwftXA2C3e44vaBq4g/3
         LMP5znpVZaszIuK0bKPB9ZAY2xCM3Dd23yPc8Gg9kcOXiiPBE5e6jabifbEVMdYBTVWd
         9KaZLmncCI6mqggZRVjOVDyXWVBzhcsntnuFy+UwaToWC1CgcYkhAU9QKDtu/2bh/hVe
         2Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506642; x=1791111442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+ZGzG0bURFDXcZw30n7m4Md6MGV3VzuOyyLqAT8l4iw=;
        b=Z1bI5ApMrQaeI4AucvDSGbrYn915F/Lo+s6NVtApT1vV1HhAZPpD7C6uccdUM7NSed
         DLLEqH3uTuMn7BONlwcQMRrNcVb1yd5rdt41UY7txyewxfvVVNQ9n9dCW44VDJW4wVYL
         rzqC5lTI4wCN2Mxi5/ezeSw1mj21X2AURdD5CGo1SrEEBXyy0V93wS1Kom4LEENWFfU5
         2j0eF+Po6coiLrzTHpCbGFG42JMkqhB3lEMd60fyXO7fo/hmXGvNdUyNzCQCEgSEnp0C
         XBeFiVBLUq1yfcqM0976bgJFq5lNRQD+ClugD7pCxqz9LyAUM9ztwmStNuQb5sdPQp5U
         N24w==
X-Forwarded-Encrypted: i=1; AKwUvBxTgdI1Ap5mTG4T87RVf+gqXUmdn4hy3wiXMc7P/JETNb5ucoQUW1Z7HQvZlkbmRthkfnj2eIQSQD9eQu0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHKfd8vKStmsqVR2oMRqM5NpWwrrlz7+TPSHKSu5lMsVxAq7Du
	/DJXcgA/l4agCpho6+zy06Pde7QdWV4LzQdKAmb1yx2c3KPnjU5b8BrUMAmc3MkJLcyzPQ==
X-Gm-Gg: AYBFou3nmhMqEJ0QLdyL2HVGleLCoEM+0BNWFTKDWJZ0GD4DCMqBbDzkLvyeFt0IJLd
	Qu3Napt010Sj/PX3iyCP8kOcDC2bITKAMLwcU4+ZGqfLMqUS58jvJJuo7LjJ0F4zcS0Vmwr3yNT
	56OlO1XjnbeJmbPGjfhaH5EY1jUi1lTfcPZX56pdOsH9ZoXz63xp4Z9p+rRQkZk2z+TZ7TSEMwA
	mzPv/slZSxFQx5wpej5zRQdlb5LPa5yyZk4FraEn7pcIiWa2EtvsZ07OmM40di4L0yzuMhCr4Kl
	4rJhmeP3BGrgvMfAcuZf9AYvIsflPeayP6slfx5133TBWiejj1wjpNt+lwOQAwV1f376i2FZwHR
	EzJIxUx30e41ngI6jwzoV3kuNLRRH6I42H5eMRed5u3Rl/67cd2k/P/6+Jw/1wnkoVqN6c95pjC
	DgmcyuT319VAo32+2WjlyMYQdJsw4cOvCR8ffkBlmB8PQs/MSVfZr9xGsvBP+TOI/jns55wViNs
	/bAl8QBOBvwKilCQevsyIHGGNa4Hfpetrn381v0Z3rVoAMJqzvX/jME++T1/SwftecbQf/9OGYX
	6Xe9CKveY6baxaCfG772JtjoOXDjMOiiNK7N2gIivwdhnm0fKZUmygAwsz0=
X-Received: by 2002:a17:90b:4c41:b0:3a0:2ffd:1a51 with SMTP id 98e67ed59e1d1-3a0bb553257mr5933522a91.10.1790506641575;
        Sun, 27 Sep 2026 03:57:21 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5220sm14419192a91.16.2026.09.27.03.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:21 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ntfs: restart the zone search when the allocation hint fails
Date: Sun, 27 Sep 2026 18:57:13 +0800
Message-ID: <79878c7323e37a500c540b3b140102b73d46bafe.1790503811.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790503811.git.matthias.goergens@gmail.com>
References: <cover.1790503811.git.matthias.goergens@gmail.com>
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

Start the zone over as if no hint had been given.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
 fs/ntfs/lcnalloc.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/lcnalloc.c b/fs/ntfs/lcnalloc.c
index 0d6cd08ee2e76..30faf422a5424 100644
--- a/fs/ntfs/lcnalloc.c
+++ b/fs/ntfs/lcnalloc.c
@@ -506,13 +506,25 @@ struct runlist_element *ntfs_cluster_alloc(struct ntfs_volume *vol, const s64 st
 		}
 
 		if (!used_zone_pos) {
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
2.55.0

