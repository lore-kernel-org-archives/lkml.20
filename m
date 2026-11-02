Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622764;
	b=XpdWVtOlkwpDGS7vt8bww0ClEfIkAMfTdl/S0lQMkJlD89kR70k2eLbmhc6OTe83n+82
	 yumtcO4MCmhWDIdgpMybu9+T+K/7+vumP6tA7LlxLBkgxwj+yzXb+NHXHOPzw1X/UG9t+
	 a4gH3avG9KY8eHSnFhWHlroYd/92h33Q9j5lGvBmvzXSePFI/3iHrWNLJPI+/Rz2pzhrE
	 /AWPUEkTD9cTXyj8tii3WqOlbpnzS0urZ3aYTtLtGH3WaW1Whm11wMsgqthO7YICQg9Dl
	 bng9TyMaQJXrE4BGP2wecIYsHGgGidS8ng3WdD/YX+3+8b1ackzu+Oh25ON3JvdXBCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622764;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=IjYeh3X1hcduPrXpVcU6amqO3SvOcMqOuBKtjXeRmGU=;
	b=K5fVKny6pLH0pmAEmFA+pAUVXT4BhCMcjla3Hdid3uVgv4OYUyrk3DJYlj2qzCeKRQHp
	 0UzNq/rAWbsrFCIpoSMrts6bzd/wPBpQLriDXb+yHua5SPB0oVD+0ptWbS1G20Uqqqpd2
	 PjCosgoNrz0olfT2KPHLHPFOD7ngtrLsufSCaM17G0/e5ugxSBd8zcled3pTdc5OBjSw4
	 df2I3j4KkNvZks8lHPmJdKi5P2WofzM2OVgSSMVVs3IYW6vGXjeRUwUCDUp/yVtGyM+9m
	 RWz/s8lpv5F1iS4/aIBipHfetnjdpqrcuf7+d2fO5XsRYU4J8LzedXqPv8S8+i8sGog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A8560A260A
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38A8560A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2eb0f1b592bso9648845ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622763; x=1794227563;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjYeh3X1hcduPrXpVcU6amqO3SvOcMqOuBKtjXeRmGU=;
        b=eYVDjQKK3fK2kEteR6zzwHIhrEOLL8ViT/OGsugVDKHmWBAKZun0LZUCch5a1faVnY
         sKcidYry1Qe9b0Pfk/uLpFotfc64SymoTWJSBGfFBPDm1Uy3OnEEoKXZGaLoLUZAVYFO
         WEsosJ0yMo54mnGkRAZE0CeTwWUKeCjZ7rYsAOBJzdsyG3+djryThBWGxH6+aY+beary
         Kk/KEd/QMM3U7fg9rSGYfnaAwHtf953iUtOzWr5q0Q+1/v8cJQfAFoBLJFnFDgx/p4eT
         7jA/umDazhS/BKKyV8O0D57fTEFTN2nsc5QvdpxwNtQ3J9bJfy4zvWLmHXXJhn5x0x+Q
         hY7g==
X-Forwarded-Encrypted: i=1; AKwUvBwd3/lrvjMp60pegoxATf6futqir01wL9bUhOqSYcPRhvDxSpPiYFRn+ne37Aud4IXwWJWPdoHXMgNRE54=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lDtRPbaTUyfqQ4gGKOVaJuMgok1dmBa0EdtQ3WzMJ2o7CRMQx
	0+t3/R0U32moHEj3C6sgAoOBPTWl95k0QKvhks9LLV5EJFOvhX6xoZjhMQsuY4OSLfAM
X-Gm-Gg: AYBFou2W920sHeje5nDqx4qNBhQE5Uaj15fOONCnFX5alsjsTVZf9s2iZzvZvIwY3nq
	SuPlECPnJXftcCvWTAYrBJH8HwPf2zpYPF3BTNY2b1tA2wWYPD85hxt8TsxBkY7TKMlBR/UZVWH
	fBee9Jqqh3tiZTfwreI0R52uToYmPmTgynT0h1HRuaxM1j3PzxD9xKG2EoVa7H8N+K+7qouuH4p
	2Oo37wjOR/BtpTxq96J46NXlzUktCCBFneUlsxWyDsJr2b6aJQQvumhEsYlF9Bd3N9R2rtAdKgv
	AUQYwtlaeLCEQZHt8QNCJyvbWeEfe3moCWBCIbSMLy8eryuy0PL9oO3O2Z81uK5zoYu0mmMNtsu
	CZj0CUVyvIDXFI7GeUeIyTGDIp2lYjOAGeSAkiSTfJ68hYsrZa9SDC0Qb1oavywlss27D/vZg1B
	mXMRIpRzEOGTKIdZyhUKqDJ1KYYjqG0/yp1IYlxv0574oUzfaoz2YmCuSGnPJxm2/zNMzpz8Mcg
	R94kLT+SCYP8QyaGAMtgKhHSW/joApqL4DHwA21sKXi0BsYY+lCWwLv11xoimTpgJTcxyj/fChc
	jgxs/tyadiBIwvZYtpTIy6kQzpyQRb7T0G2GYn+GIz8b/g12TAsdWVAkPF5ojOm9dNvDGIv/gIV
	C+odJZQTf1EgODoIYdDTinsZVOijpuCTh7NnFXs4=
X-Received: by 2002:a17:902:c40c:b0:2e8:e617:18 with SMTP id d9443c01a7336-2eb36476bb8mr92618095ad.48.1793622763454;
        Mon, 02 Nov 2026 04:32:43 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392492fbsm27101845ad.32.2026.11.02.04.32.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2026 04:32:43 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>
Cc: Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 Richard Cheng <icheng@nvidia.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 [PATCH v4 1/2] cxl/edac: Read cached DRAM event records under the xarray lock
Date: Mon, 02 Nov 2026 21:32:34 +0900
Message-ID: <20261102123233.74598-2-ai@linux.com>
In-Reply-To: <20261102123233.74598-1-ai@linux.com>
References: <20261102123233.74598-1-ai@linux.com>
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
copy the matching record into a buffer the caller passes in. The PPR
path only needs the match and passes NULL. No caller keeps a pointer to
the record after the lock is dropped. The event path frees a record
only after xa_store() or xa_erase() has removed it from the xarray, and
both take the same lock.

Fixes: 0b5ccb0de1e2 ("cxl/edac: Support for finding memory operation attributes from the current boot")
Fixes: 588ca944c277 ("cxl/edac: Add CXL memory device memory sparing control feature")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-192042@kernel.org
Signed-off-by: Jongwon Lee <ai@linux.com>
---
 drivers/cxl/core/edac.c | 72 ++++++++++++++++++++++++++++-------------
 1 file changed, 49 insertions(+), 23 deletions(-)

diff --git a/drivers/cxl/core/edac.c b/drivers/cxl/core/edac.c
index 34b81e8dfb..c5c8dda20e 100644
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
+ * xarray lock, and hand back a copy of the record.
+ */
+static bool cxl_find_rec_dram(struct cxl_memdev *cxlmd,
+			      struct cxl_mem_repair_attrbs *attrbs,
+			      struct cxl_event_dram *out)
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
+	if (rec && out)
+		*out = *rec;
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
+				 struct cxl_event_dram *rec)
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
+	return cxl_find_rec_dram(cxlmd, &attrbs, rec);
 }
 
 static int
@@ -1344,7 +1369,8 @@ cxl_mem_perform_sparing(struct device *dev,
 {
 	struct cxl_memdev *cxlmd = cxl_sparing_ctx->cxlmd;
 	struct cxl_memdev_sparing_in_payload sparing_pi;
-	struct cxl_event_dram *rec = NULL;
+	struct cxl_event_dram rec;
+	bool rec_found = false;
 	u16 validity_flags = 0;
 	int ret;
 
@@ -1362,11 +1388,14 @@ cxl_mem_perform_sparing(struct device *dev,
 			return -EBUSY;
 	} else {
 		if (cxl_is_memdev_memory_online(cxlmd)) {
-			rec = cxl_mem_get_rec_dram(cxlmd, cxl_sparing_ctx);
-			if (!rec)
+			rec_found = cxl_mem_get_rec_dram(cxlmd, cxl_sparing_ctx,
+							 &rec);
+			if (!rec_found)
 				return -EINVAL;
 
-			if (!get_unaligned_le16(rec->media_hdr.validity_flags))
+			validity_flags =
+				get_unaligned_le16(rec.media_hdr.validity_flags);
+			if (!validity_flags)
 				return -EINVAL;
 		}
 	}
@@ -1376,13 +1405,10 @@ cxl_mem_perform_sparing(struct device *dev,
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
@@ -1399,9 +1425,9 @@ cxl_mem_perform_sparing(struct device *dev,
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
@@ -1814,7 +1840,7 @@ static int cxl_mem_perform_ppr(struct cxl_ppr_context *cxl_ppr_ctx)
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

