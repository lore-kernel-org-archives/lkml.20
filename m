Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649ED477289
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787771464; cv=none; b=CGe0ovXSA6HE2NdtM02cuZosREmB1EAv74o4wXHg1C8qmvmVNmGlwHD/C2EyJmpt9UL3iJW/y/9wTIJohDwINNB8ymWsxkWla8PyhJIi6zgSZF//r1jyapDOn12IS39rLn21qIzLp0+FzDkJ/WaGL9nnxxnqL0IJgh1ZB2yqsR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787771464; c=relaxed/simple;
	bh=kMutbCctvKI2ONfbZdpKGilOJVQLCwIgirUBy4IWnBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZdnuwV8Sai1CD938Wn04FlZnLTu+WKHsFL4O3V+bUhxFDNp4q3Xrz6NQSqcQfLzou5ksQDmeIPmARL/xQrLx/hSa3j/3NQC55pzSvSA/WO+nmbyEZSgcQ1eaeKPvr6KTnBLuZMQY4EQoxaCheola+M8pud3U0s9HTJ0Z6AhiWEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1JIJ0KA; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1JIJ0KA"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-44cd237446cso1671729fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787771454; x=1788376254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wr7Kgi4pJ8f9GYLacdQizDaUoUly/2NGcfgRTpFBAes=;
        b=H1JIJ0KATwJ/MG4jCa4tOeoxOsgRhr4eKziXcoE6fUeW1Umo6ZoSbbllnE3KS/4xDl
         +rpgbxzlTLcDXH4hHPCJBDC3EYKM2sFF/p12FrJsixk0VGz0guBp0bOVvmPUrnMOakiT
         8hGaL6hHmb1W9UyX78cz+pgkc0SmYQT/1zsJIHKcur7Lq79vLwrIqE39U4SPryyUJZCY
         YxnDCk7HVm6qfXDZY6Bw5dY7Wq6+Von8gAZrYRcyIqYqdIo35icVTJKSfur4RVfiV583
         gtvFm4MDCjo/9RJDd6RPjNC328WvCDKDazWO3vzxGuULsMStAZtqjCB0HN0DAtm58zac
         wxUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787771454; x=1788376254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wr7Kgi4pJ8f9GYLacdQizDaUoUly/2NGcfgRTpFBAes=;
        b=lciMFXPjyB7YnqpbRqvmAgRqu5oy1qwFoXFf/qkdLx/+Mtx5sYKEhvfHjD9TWzy5sj
         ZfZf3gr3na799phJ8i8WX/FGmmBftr5Nb7V2QfaYLf6uSikJ45cVwEKvMHLGihJ9dI4z
         wYdgeMktkJQZYOXBYrl7TnTyA4wEEA+I0LjRQGpcd5GXB9rv5JxVf5N9OGVYu53YYZdm
         KTedBdyKFo0Yftzr6mBXyLRDqhDNWqg+WLmsWLZGT1ydYctn/BADs1LmzN/veTLD2rrV
         d0qr1HysvSE/RXWqWVPkrVdyLdDOHxkHCdQtoI/JHgVEKzalnUq0sWIupjtVEga8zGtK
         EBrg==
X-Forwarded-Encrypted: i=1; AHgh+Roo8VqlpBzU5YqzRP02BZmORKNpUW3Oa8jIW5Q5W5GPoPoFSq9GtN9jzpknUdvIy1eKBTSBhPJuKYEGyrI=@vger.kernel.org
X-Gm-Message-State: AFuF++laWyD1kY0ihrPPkSVZCiFLfp2c4IR6nPOiJhzWqmQjjQqJNpLE
	rvXjBEAZqd/Yaf+kgvYFNMCNX7NrONS+mKxlQuEBzGImcWYxWrbERlx3
X-Gm-Gg: AR+sD11/z02nkxrUBffa11ayGBsnnJIPZw53KtoGgq88rIHZCUGtHYj9duMJzRssIbl
	UW0xvVaYQkn4WGRqHm15JvL1plND0hBN6xQ+QO41OmsnCGtHygPPcnzFh2sGp2kmyT+mPT6iHK3
	u1Li0Uq0WzlUiczK7taiy4lBEeNTyJUJYKmbE5rf8eefg4AdbxoSOy+16tzdopk79jV7rTaQk32
	DKXwIxWVlN1FiF0DlCdTCNzaJ29Lq1bXElwtektbrJwJXxjj6RxkrIskFQ/sjK4ZRlgOZnU+51d
	QseMo0V+6MMUjYiWGrSWEkVo+XPYpF6EHNTlidG2mcQ38c7s64TD9m3e+Qm1N8YwzMZyoWipSU1
	V60OjtlY2d3BVR0eWw8SonbZlePlnZWQ4zziinJFDao+C64mbDjjTTw42GkvtFPg7zWkWEtWIts
	xUiQwFD045vjQQYgE4AM1qVE2VrBaELGLdzb7DvnQV1AWlM2BRdyQu7nJ6m+cl2RfAbPMbCUBhK
	Q8OpZj4LyXPim0=
X-Received: by 2002:a05:6870:3190:b0:45e:2de4:95f1 with SMTP id 586e51a60fabf-46597c39c1dmr10876532fac.2.1787771453791;
        Wed, 26 Aug 2026 12:10:53 -0700 (PDT)
Received: from FredPC.lan ([2600:382:3107:46eb:31a7:8fef:9fc6:7e8b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-465ad9ecc2fsm3060369fac.4.2026.08.26.12.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 12:10:53 -0700 (PDT)
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
Subject: [PATCH 1/2] smb: client: fill cache fields after populating cache in copy_ref_data()
Date: Wed, 26 Aug 2026 12:10:32 -0700
Message-ID: <20260826191033.162320-2-fredric.cover.lkernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826191033.162320-1-fredric.cover.lkernel@gmail.com>
References: <20260826191033.162320-1-fredric.cover.lkernel@gmail.com>
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
 fs/smb/client/dfs_cache.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/smb/client/dfs_cache.c b/fs/smb/client/dfs_cache.c
index 86dba25b7a5a..b0388c460499 100644
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
-- 
2.53.0

