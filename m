Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639CB202F71
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788396587; cv=none; b=LmpHOTQ6eIjrSxovSE1nOx3t4lHy8wm8qJUxB9V6Drqx2eGlMerCVjJj/fLY9q+ANkaUwR46WwZgd0L56yVHuCBcCu5uffAIsQJ/Kn8yIICFW08xF2cXTkTbNiQmj7aYpDMynHdbqF/IR0XqB6FXg14r3IuXYjOXeLed6uL7fXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788396587; c=relaxed/simple;
	bh=V61jU58dWmh9JU/HwKfKCIjKKdtyH97DAWiwdtm7cpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cAClKouoP4jpIra4qj1JZ2sv4bqCU9ugqzWIBXSFPXOoZv3+Uyu+qXdwCaN1A4zRH/4KUrR3F5EFHNcMKC3nmgHNxctgxxGJRItqjvDZoGc4eXamUyToQarvz8YZ01LmZQWDpVvjoPkmbE7batqjThfRUqYHgalP3DLBQFy1qCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BRz/TBgC; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRz/TBgC"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7f4df360cc9so536651a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 17:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788396585; x=1789001385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJg4fEtRIl54wQ0ZY6Uj39EgnebExxBTWGzyjxtO7Og=;
        b=BRz/TBgCd8/7KIL0T4VMV7aUkOvtVUPs+74RNw98v4eMSeIcPhmQ0n0qiiro+RGhaf
         ZzUpX4XW0YiH8IKHSF25Wr2IEX+1MswJOv4YGJL1yL/o3sW35XTVlDRdcb01ocnH9lz/
         UAr6PuwXmztHhpHkgMSPtq1JQYBzI5hPVgWh3BEf32tYqzC9m1Xaoy5BTLVcNe2JRkNg
         51rWaGcqknYRPqpr7mwwQoFd634zVVp6YdcU9MwRK2scCoVv2y5WAUXg7BIGPT3Ke4zH
         ICD9PdUTeJWJE6Yi4LAZIMwMM8LQ+RmG4fuJkIOrQCKZNRP6+sh9ER1uhzCR75Eu/VdD
         IzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788396585; x=1789001385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJg4fEtRIl54wQ0ZY6Uj39EgnebExxBTWGzyjxtO7Og=;
        b=OjJpyPpfTL6RugVTPuflMZt/5FBjk9dQ8FGNfSygzuRbiUlXliYPeWOxMFup6iPiJ8
         9lZwuQuGEWPlA3PPiVWBBrcrT5EOtp7dpbFgfJ6Y2NYIYUs22NzRVlk03y4r7+YZf0cP
         aQmDG0MuInGEAHX8KLHyzSz/4H1uv9tgP0ox5Ox1fn7erkDIbpulwsjtNGUkEki34Di8
         Yynx8O9nmuOKIWnU8fN/JQnfPmPRWFtlt6mPoiLKh7l0O1ZxGzobeZ/KskJlKcCLuSVL
         R4Lya8XD1fSKt8GGjAwXBiluVYfvDN6dWcAPd7DE9MsvkR1blTe6ioprNWCrpfPyF393
         CVvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxmwk7gcHCcieU+JbAl4c/5zajqxoqMR02KyiBHEeTR/5qSXPx/3ye41X9rsbI8/mz9PYDvHroOACgD+o=@vger.kernel.org
X-Gm-Message-State: AFuF++mc3D/RzMSEBDt/6575uDyiBmXVEZnF1oQCnoGeCIKyUbTjiFvQ
	LuEXQsfQExdT9ySFzC5wxeDf1Il+dQNeHgAdpPvY+uvJXjDPc3yR6e4Z
X-Gm-Gg: AYBFou2BTKPqeyFs5MHs+qTAi+EAsiIiU0bzr8gsOKxgv1KhytkjdGokYqTk9li9RtI
	kKNE4AbwHs0dqGkrj96tpr0yZsvPkPYy43ULvujR4i78AOO1IjM3jBpgZxkXHhCqEI7AD1eHHbD
	zzYuurkL1BrAX7AKEGl5LGA5sPHOItFgQXPkRkOSV10JyiZg5fUYu6ozVo5yi1ThiXl+psL+26+
	1pf51TenzMJIrsWZEmeCDgnHvZvVmu6WWJOSP1gxWwL8dgylC+YsuwAWcZgorrxevFY9sV8i+Nz
	o5NuPyZpOzubTJx1oUrFN9b4ms1OedXJOybgg12nYgl3AcnEQOBLYGNoWcMuaVBbt92KQi+CcH4
	qmWvTWJOpWpuDtFW8zO4BYKlusFm0niS/o/n9ktvTVhO2XgCHeyiItSLmzSNz3/y+4HQdhhXw4M
	XpG0lvPQnHrFXk/7gIBLycT7n1fm6hYH6bIeGyq/S7anAZH9lNT081rISbrP+a20cl8VRdro1a+
	ao=
X-Received: by 2002:a05:6830:230c:b0:7e9:dc11:5920 with SMTP id 46e09a7af769-7f908b27acfmr205481a34.8.1788396585093;
        Wed, 02 Sep 2026 17:49:45 -0700 (PDT)
Received: from FredPC.lan ([107.116.101.17])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f74caad7dbsm3488138a34.2.2026.09.02.17.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 17:49:44 -0700 (PDT)
From: Fredric Cover <fredric.cover.lkernel@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Tom Talpey <tom@talpey.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Bharath SM <bharathsm@microsoft.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fredric Cover <fredric.cover.lkernel@gmail.com>
Subject: [PATCH v2] smb: client: fill cache fields after populating cache in copy_ref_data()
Date: Wed,  2 Sep 2026 17:49:01 -0700
Message-ID: <20260903004901.135233-1-fredric.cover.lkernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In copy_ref_data(), struct cache_entry *ce has its fields populated
at the beginning of the function. Later, if alloc_target fails with
an ERR_PTR, free_tgts() is called on the cache, leaving the cache
metadata populated without any targets. Critically, this extends
ce->etime, making the cache appear valid for longer without any
targets.

Also, free_tgts() does not set ce->numtgts to zero. On error, when
the cache is freed, ce->numtgts is not zeroed, and other cache users
may attempt to access nonexistent entries.

Update fields after copying targets to prevent partial-state updates.
Set ce->numtgts to zero at the end of free_tgts().

Signed-off-by: Fredric Cover <fredric.cover.lkernel@gmail.com>
---
v2: (per feedback from Paulo Alcantara)
  - Remove redundant ce->numtgts = 0 in update_cache_entry_locked()
  - Drop patch 2/2 as redundant
---
 fs/smb/client/dfs_cache.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/smb/client/dfs_cache.c b/fs/smb/client/dfs_cache.c
index 86dba25b7a5a..611e18fe8204 100644
--- a/fs/smb/client/dfs_cache.c
+++ b/fs/smb/client/dfs_cache.c
@@ -123,6 +123,7 @@ static inline void free_tgts(struct cache_entry *ce)
 		kfree(t);
 	}
 
+	ce->numtgts = 0;
 	WRITE_ONCE(ce->tgthint, NULL);
 }
 
@@ -388,13 +389,6 @@ static int copy_ref_data(const struct dfs_info3_param *refs, int numrefs,
 	struct cache_dfs_tgt *target;
 	int i;
 
-	ce->ttl = max_t(int, refs[0].ttl, CACHE_MIN_TTL);
-	ce->etime = get_expire_time(ce->ttl);
-	ce->srvtype = refs[0].server_type;
-	ce->hdr_flags = refs[0].flags;
-	ce->ref_flags = refs[0].ref_flag;
-	ce->path_consumed = refs[0].path_consumed;
-
 	for (i = 0; i < numrefs; i++) {
 		struct cache_dfs_tgt *t;
 
@@ -409,12 +403,19 @@ static int copy_ref_data(const struct dfs_info3_param *refs, int numrefs,
 		} else {
 			list_add_tail(&t->list, &ce->tlist);
 		}
-		ce->numtgts++;
 	}
 
 	target = list_first_entry_or_null(&ce->tlist, struct cache_dfs_tgt,
 					  list);
+
 	WRITE_ONCE(ce->tgthint, target);
+	ce->ttl = max_t(int, refs[0].ttl, CACHE_MIN_TTL);
+	ce->etime = get_expire_time(ce->ttl);
+	ce->srvtype = refs[0].server_type;
+	ce->hdr_flags = refs[0].flags;
+	ce->ref_flags = refs[0].ref_flag;
+	ce->path_consumed = refs[0].path_consumed;
+	ce->numtgts = numrefs;
 
 	return 0;
 }
@@ -634,7 +635,6 @@ static int update_cache_entry_locked(struct cache_entry *ce, const struct dfs_in
 	}
 
 	free_tgts(ce);
-	ce->numtgts = 0;
 
 	rc = copy_ref_data(refs, numrefs, ce, th);
 
-- 
2.53.0

