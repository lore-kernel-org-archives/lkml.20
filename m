Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793496870;
	b=ZOH0TaeUzPezCKL/KnlAgzJC6olNdTlrggl4mZbtTl7mLMr2z1GktzXLv5fnGZRgqDxz
	 uFO05710cxg8JC0DAttFG0Pe94yaO1JVefpU08UIxHuxBIjVjhRpnZwrVW13tof5jbnJ7
	 O07TGpqyH0T30nZrBsIrnBteMieB/6YnPaJrHwtk3KFn0G6rxJzJV3ROvFWkfLpImqe9i
	 VaSPEO0ijxrOVnsYfJWGuHjDKM6wm6I01Zk221BQU6c5uANxF7l5ieRoJXQdRKaf6frgc
	 kWhvWl75C6rSpWfeViEs6/Vrjn/wEXlJyirq0JdPQW0TrKpuvxvwcusnEL8TRJ4LEXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793496870;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=pp6rXKSE5E3HxcF7WT8oNamyuZmfcfT+UhC0o/i7RWU=;
	b=qIKl9u0L8VT4cl5kwsdHyBbpf3Gsvb1gnBEhqSw3YuQIokMG0NyamUm0XtxTyX1LQ0qt
	 /xQJwXX8/dcR0O/4BLTpETRfW8HX0Jdvw8Zi8+m6mhkluAH1J+jIG/lWF229gEE4TNHJe
	 M5whBJdfnY7s455XYx/1D6LTCJgLcG6eSBZaiwgw9dlo3X3itCL4DSbuL28VLDw8p/sQo
	 m+fvwLLNVDfWWxBeTaOp8q5juOwFTJioRFywklnOPMgndUL6N/c9k7JgpCD8wu6VQv0Wm
	 95P53jDVkZCNkVid67c5qXsIGiXtdF1FdxxMZBPOVWcyqOdqGK2jJE1cShpql15PqQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F54F606A321
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 01:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F54F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1546830a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793496869; x=1794101669;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pp6rXKSE5E3HxcF7WT8oNamyuZmfcfT+UhC0o/i7RWU=;
        b=N/1jkiSJD2ckSaFKCFNwGjNpPBIIMdhZkkyQH64h8DT6BjeulxfmUR5/YMsfpSCz1L
         OHQUEQr/UWwmiUsE10GVxnLhasVeKrnDnUBaQLpjNytxCqGZ/1TUfEq4kYNaIuIxXmze
         aJCu6z5POknpwqTwb5b3uQBQutDOt1LQyO+H5IadfDx+SZSICyQrlWjyOmkwC+KsXkCv
         5MWs5E8hDUrJ2HZO6ydd2dszsB7DakVBIkLZcVgspsdR/r2GV+uo5EtSXE0Dlh0aoXUH
         8ByjqYbKDntPd+wmdz30DwZw+XgxFKFt4TwGzIjkOi1ia3YuNwzm1EMpBFbBYCo85pJh
         s9Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxkZlN3Ldon6yYavmGrrMl+SXKerkgKz9ZK8RoyCHm3pfbYOnewLUXaewYOLNvcRaUo5EBNhqyLBrgaegs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UO/4cM4aZUm3OszEd0jmsmhbJlx4wOcfY9lo85sNLMzwGlfkW
	Gbrmxrtu08J3aPkbL6PA3exFTNuy0JErYza/GizTJkYcQpQtlOmQiFPNKTJjPBvpFrU7
X-Gm-Gg: AYBFou0JTSXLZr7T9jEpbf3qGyrOOxfr5FDDCO7Y8ig2QV7E0q+tENR1TvYTQpM8b+I
	uBdGhgQ31QlKToquJqQ85fCo4W2xR8rN7G+ghuqguZKmkzqRA9SybkjQABhysnbfDMoyLmWrydF
	rnJeA2/xQU+PpVYi62EEvpPtDHhzIPQuf8BsvW1vuBcj7mtQuAw87U7DumEPUGpWHv5wDB1xXyC
	f4f68cJ+xjzQkIMdczwfFGfkKsD0SVlQiXWuhC+fCMEAr/t1aK//uRQ+XpL9+eNFLtiFChNkrZY
	TKJSSwJLIxdhJGyxxwECJhTtnHLK8UxGrKRI0mThFyqURiSamiC6iR5G1W13UAsFFOXbHhVzbnY
	Hss9JP/iL4MF/hf4d/5ttz6HOhNTknOTkIg7Zu6g9bM9GgEjkSUyydaPfv52BivOUg010H/OJsF
	fr8tni+qWFcQQ/buGL2CV/i7B+P5VPXyDP6Ib7jGvmopiOary75LZcv0a9xuvvrpmk6XLS7u8dJ
	lvDPmIU8VSL/A8h9fKoqIQ1CWYWCgiG3gmV+adrQ/dHxOEw2NwrVfDUbPZth+0h6fg3DeOFS7Tt
	kq3YH8s+KvOWzR0zfo43B5HEqCZ4Jx4hJtMXAK5MxfV6w40+kZKFx0jfNy4n0p8ouQzpPvws59p
	UgUpD/BYckQ1nA6/TKwbS4H4SZRhvo+8KJ0bGKrnK6J6ouCMgpwUtVoJiNRZM
X-Received: by 2002:a17:90b:17c5:b0:3ab:413:49b1 with SMTP id 98e67ed59e1d1-3ae897c0a0dmr5789728a91.48.1793496869337;
        Sat, 31 Oct 2026 18:34:29 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845fb9f6sm8727943a91.17.2026.10.31.18.34.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Oct 2026 18:34:28 -0700 (PDT)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>
Cc: Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 Richard Cheng <icheng@nvidia.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 [PATCH v3 1/2] cxl/edac: Read cached DRAM event records under the xarray lock
Date: Sun, 01 Nov 2026 10:34:19 +0900
Message-ID: <20261101013418.87326-2-ai@linux.com>
In-Reply-To: <20261101013418.87326-1-ai@linux.com>
References: <20261101013418.87326-1-ai@linux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The event path caches DRAM event records in an xarray and frees a record
when xa_store() replaces it, when it expires and when the cache
overflows. It runs with device_lock() and cxl_rwsem held for read.

The repair path looks records up with cxl_find_rec_dram() while holding
only cxl_rwsem for read, so the two paths can run at the same time.
cxl_find_rec_dram() reads the record after xa_load() returns, and
cxl_mem_perform_sparing() reads validity_flags from the returned record
again later. Both reads can hit a record the event path has just freed.

Move the lookup into __cxl_find_rec_dram(), called with the xarray lock
held, and make cxl_find_rec_dram() return whether a record matched and
copy out the validity flags the sparing path needs. No caller keeps a
pointer to the record after the lock is dropped. The event path frees a
record only after xa_store() or xa_erase() has removed it from the
xarray, and both take the same lock.

Fixes: 0b5ccb0de1e2 ("cxl/edac: Support for finding memory operation attributes from the current boot")
Fixes: 588ca944c277 ("cxl/edac: Add CXL memory device memory sparing control feature")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-192042@kernel.org
Signed-off-by: Jongwon Lee <ai@linux.com>
---
 drivers/cxl/core/edac.c | 69 +++++++++++++++++++++++++++--------------
 1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/drivers/cxl/core/edac.c b/drivers/cxl/core/edac.c
index 34b81e8dfb..f0c12871bd 100644
--- a/drivers/cxl/core/edac.c
+++ b/drivers/cxl/core/edac.c
@@ -938,18 +938,17 @@ cxl_find_rec_gen_media(struct cxl_memdev *cxlmd,
 	return NULL;
 }
 
+/* Caller holds the xarray lock. The record may be freed once it is dropped. */
 static struct cxl_event_dram *
-cxl_find_rec_dram(struct cxl_memdev *cxlmd,
-		  struct cxl_mem_repair_attrbs *attrbs)
+__cxl_find_rec_dram(struct xarray *rec_xarray,
+		    struct cxl_mem_repair_attrbs *attrbs)
 {
-	struct cxl_mem_err_rec *array_rec = cxlmd->err_rec_array;
 	struct cxl_event_dram *rec;
 	u16 validity_flags;
 
-	if (!array_rec)
-		return NULL;
+	lockdep_assert_held(&rec_xarray->xa_lock);
 
-	rec = xa_load(&array_rec->rec_dram, attrbs->dpa);
+	rec = xa_load(rec_xarray, attrbs->dpa);
 	if (!rec)
 		return NULL;
 
@@ -1029,6 +1028,32 @@ cxl_find_rec_dram(struct cxl_memdev *cxlmd,
 	return NULL;
 }
 
+/*
+ * cxl_store_rec_dram() replaces and frees records while the repair path only
+ * holds cxl_rwsem for read, so look the record up and read it under the
+ * xarray lock, and hand back a copy of what the caller needs.
+ */
+static bool cxl_find_rec_dram(struct cxl_memdev *cxlmd,
+			      struct cxl_mem_repair_attrbs *attrbs,
+			      u16 *validity_flags)
+{
+	struct cxl_mem_err_rec *array_rec = cxlmd->err_rec_array;
+	struct cxl_event_dram *rec;
+	bool found;
+
+	if (!array_rec)
+		return false;
+
+	xa_lock(&array_rec->rec_dram);
+	rec = __cxl_find_rec_dram(&array_rec->rec_dram, attrbs);
+	found = rec;
+	if (rec && validity_flags)
+		*validity_flags = get_unaligned_le16(rec->media_hdr.validity_flags);
+	xa_unlock(&array_rec->rec_dram);
+
+	return found;
+}
+
 #define CXL_MAX_STORAGE_DAYS 10
 #define CXL_MAX_STORAGE_TIME_SECS (CXL_MAX_STORAGE_DAYS * 24 * 60 * 60)
 
@@ -1298,9 +1323,9 @@ cxl_mem_sparing_get_attrbs(struct cxl_mem_sparing_context *cxl_sparing_ctx)
 	return 0;
 }
 
-static struct cxl_event_dram *
-cxl_mem_get_rec_dram(struct cxl_memdev *cxlmd,
-		     struct cxl_mem_sparing_context *ctx)
+static bool cxl_mem_get_rec_dram(struct cxl_memdev *cxlmd,
+				 struct cxl_mem_sparing_context *ctx,
+				 u16 *validity_flags)
 {
 	struct cxl_mem_repair_attrbs attrbs = { 0 };
 
@@ -1332,10 +1357,10 @@ cxl_mem_get_rec_dram(struct cxl_memdev *cxlmd,
 		attrbs.repair_type = CXL_RANK_SPARING;
 		break;
 	default:
-		return NULL;
+		return false;
 	}
 
-	return cxl_find_rec_dram(cxlmd, &attrbs);
+	return cxl_find_rec_dram(cxlmd, &attrbs, validity_flags);
 }
 
 static int
@@ -1344,7 +1369,7 @@ cxl_mem_perform_sparing(struct device *dev,
 {
 	struct cxl_memdev *cxlmd = cxl_sparing_ctx->cxlmd;
 	struct cxl_memdev_sparing_in_payload sparing_pi;
-	struct cxl_event_dram *rec = NULL;
+	bool rec_found = false;
 	u16 validity_flags = 0;
 	int ret;
 
@@ -1362,11 +1387,12 @@ cxl_mem_perform_sparing(struct device *dev,
 			return -EBUSY;
 	} else {
 		if (cxl_is_memdev_memory_online(cxlmd)) {
-			rec = cxl_mem_get_rec_dram(cxlmd, cxl_sparing_ctx);
-			if (!rec)
+			rec_found = cxl_mem_get_rec_dram(cxlmd, cxl_sparing_ctx,
+							 &validity_flags);
+			if (!rec_found)
 				return -EINVAL;
 
-			if (!get_unaligned_le16(rec->media_hdr.validity_flags))
+			if (!validity_flags)
 				return -EINVAL;
 		}
 	}
@@ -1376,13 +1402,10 @@ cxl_mem_perform_sparing(struct device *dev,
 	if (cxl_sparing_ctx->persist_mode)
 		sparing_pi.flags |= CXL_SET_HARD_SPARING(1);
 
-	if (rec)
-		validity_flags = get_unaligned_le16(rec->media_hdr.validity_flags);
-
 	switch (cxl_sparing_ctx->repair_type) {
 	case EDAC_REPAIR_CACHELINE_SPARING:
 		sparing_pi.column = cpu_to_le16(cxl_sparing_ctx->column);
-		if (!rec || (validity_flags & CXL_DER_VALID_SUB_CHANNEL)) {
+		if (!rec_found || (validity_flags & CXL_DER_VALID_SUB_CHANNEL)) {
 			sparing_pi.flags |= CXL_SET_SPARING_SUB_CHNL_VALID(1);
 			sparing_pi.sub_channel = cxl_sparing_ctx->sub_channel;
 		}
@@ -1399,9 +1422,9 @@ cxl_mem_perform_sparing(struct device *dev,
 		fallthrough;
 	default:
 		sparing_pi.channel = cxl_sparing_ctx->channel;
-		if ((rec && (validity_flags & CXL_DER_VALID_NIBBLE)) ||
-		    (!rec && (!cxl_sparing_ctx->nibble_mask ||
-			     (cxl_sparing_ctx->nibble_mask & 0xFFFFFF)))) {
+		if ((rec_found && (validity_flags & CXL_DER_VALID_NIBBLE)) ||
+		    (!rec_found && (!cxl_sparing_ctx->nibble_mask ||
+				    (cxl_sparing_ctx->nibble_mask & 0xFFFFFF)))) {
 			sparing_pi.flags |= CXL_SET_SPARING_NIB_MASK_VALID(1);
 			put_unaligned_le24(cxl_sparing_ctx->nibble_mask,
 					   sparing_pi.nibble_mask);
@@ -1814,7 +1837,7 @@ static int cxl_mem_perform_ppr(struct cxl_ppr_context *cxl_ppr_ctx)
 			attrbs.repair_type = CXL_PPR;
 			attrbs.dpa = cxl_ppr_ctx->dpa;
 			attrbs.nibble_mask = cxl_ppr_ctx->nibble_mask;
-			if (!cxl_find_rec_dram(cxlmd, &attrbs) &&
+			if (!cxl_find_rec_dram(cxlmd, &attrbs, NULL) &&
 			    !cxl_find_rec_gen_media(cxlmd, &attrbs))
 				return -EINVAL;
 		}
-- 
2.55.0

