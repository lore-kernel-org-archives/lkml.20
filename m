Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793496877;
	b=IfaXFwAaFoGDRXtkxhlU1BJnK4chcUcjlz2I307l1rgOfRf00o6Grug1aCSqwpX7IuQI
	 yzS/qtRXBJndSNeJdiQl3t8EboOwq/phRUy9z5jZ2o0Bq73pQCJUqkMSzSm3onMg5P2jT
	 U0ILDutX/aVOiMYy2vMLaHzeACY1aYfT7eAz3z8vEGlq7M+qtDUymtKtIo0X5lQywwdSf
	 4a8NFiZJ6dYABbGR6Y9LBuA617DR+WGR0+plsmer3pqNd7C2lfUfrbBdcirlyGggyyDbg
	 UC75J3J9Ict4UII1/rgRuQvbbZ+tLpHGslKfOa0TAOppUjJL+UPDiiBKC68q8HTQQmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793496877;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=9IJ5Kz5Zp6zRcvTEXTwAZXNkMiKdhVQoKzRKESsvxgE=;
	b=jqoM1rdu1QY3q/RWjf3+Pa6U+J4PcKwfEqRGSIls9nd/DnmZks01gNtCs5wNmrylBEfK
	 3VrqcpziI6DRLZhWnu439vc0XYprApWaxKbiCaMpF8efy91Cqbxf57UaTnof68n7psYej
	 1BU+TdgjQB0QADNNQ/DAx5s5Cs5GYlRjxH613I6c4WHIrHLUKen4b2dJkhWAyFNe+JA0t
	 7PDri+1qwBSQtTfH9RBQbUTqYSJt+4H6YK9fIgXr3EeRN8LRCeqXNEzk1RAYSmEc7lf/x
	 ZFLDYMUZn1955Fc4UpguDDrpq3suh1M/CvegHSwGZz2q9yZAr2KkRYhSLPzy5DEMgsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F62606A31D
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 01:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16F62606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e5378b281aso10630285ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793496875; x=1794101675;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9IJ5Kz5Zp6zRcvTEXTwAZXNkMiKdhVQoKzRKESsvxgE=;
        b=lDUDyrcgjqoea1jjgwYrZ4AizRPyChoO2SWJ6UuJ1KFkRLcTpRtWZv3Qv1yNP0Grqu
         Dndg4i6cc9uuBI42BNgx77RVGL1Fl1i2KbsTppSu7pzKkD1mBjkXLES13B5ms3oLJZN7
         EQWihXCOUYf8m1I0j4v+HI7g3RHvr8+x86r1Ks3DBOKa3KlupD4STLojJuVkFHJKBVrm
         jho9x0JLpGUMNTO8Eu7s3uAo8ptzr3ZZRfBXUlDTOwzfDdWVjLYCjVMMgh79d2nakP0M
         KdS2h5fWjKEDtp1wmG3WuxiSLNJxwJj9rjTeHZ8AeIJ01XJevE1m2dVeHbRH92e2Z5iH
         xLUg==
X-Forwarded-Encrypted: i=1; AKwUvBywrDtlRe08P0CK5EiptK5UIQBBefIISdeGyCk9sTBB1S8KhFNR9u2MuFEIX1fHqg1YO7iURdNkxyeat7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sBTx5Cla/RyL30GyBEnZiYeTo/3gbrO56RdJN+ROgOx/HKaaH
	tXScFFX7NCw15Gyj6GL/v7g+cAQZAMMQy+5FdDsH136aMpgaiVCCpgE9tmjXlhQtpjak
X-Gm-Gg: AYBFou2eLizqvLvI+YOIWibmIqiHIwDTzjPVXkr95qZs6VMUrC1gsM13REYEJvae5bv
	iIXzypvlHlnou2Q6SpxGmzYiOtp8fQHvPa6t91TfrAsapIFQkKWfc5VVLBWT43os3vXVTK5Y3/B
	+e/NLWVexn9YXQ+oAC2mFRWxMITymfIZ4Vgt7Rdo0vG7dKT8lk5Uax5tnhYHfEMk2gc8O/ZpO9W
	ppqGlSqjNRg4M9xxAMlaPErTZj5B8i5HxeQ9N2aGrcj8GbH2h8AeBcsC093ukHdwfP7CE9GyRrO
	QnVGLiYDmNTbuKF2gLwv0iRdujUwO0phk5MlI0GPEhPlcUPplyre5viunCCaweInyrw/jNppI5a
	t8vTTRCaT1YQleywU3dhO3wiNM4DQt8wgnusgbcw8dV0pGDoNp08N2nyGl5hMbMimjO0gQ9S280
	FIe/cz2r397OYiiltxmSgX/z+bRkBQSYpukSIk2VT9xcNNTb5TUtsiUKDAKTkbNqlDXYZ36j7V1
	3PmMMdDqt8Xk5fCJa0MbnMx98aDmoFkwGkeCAXFTObeC4JM1jfYFfyTvtM9CGBKxrkxcYF4sz2j
	Q9TyF/dayI56hlP7jAKYvcKYDrEqslZ6uyaYuCfT0n7sLLivU23yhflo6os3dvYaXIkP3C+mYSN
	/KMAfPKvE8nhWqrs7oY2e1l6b7iMRQYqOUUr8/hY=
X-Received: by 2002:a17:90b:224f:b0:3ac:8af9:4a6a with SMTP id 98e67ed59e1d1-3ae8976f156mr5587601a91.42.1793496875276;
        Sat, 31 Oct 2026 18:34:35 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845fb9f6sm8727943a91.17.2026.10.31.18.34.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 31 Oct 2026 18:34:34 -0700 (PDT)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>
Cc: Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 Richard Cheng <icheng@nvidia.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] cxl/edac: Mask DPA flags in the event record cache key
Date: Sun, 01 Nov 2026 10:34:20 +0900
Message-ID: <20261101013418.87326-3-ai@linux.com>
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

The low bits of the DPA in a General Media or DRAM event record are
flags: bit 0 is VOLATILE and bit 1 is NOT_REPAIRABLE. The trace events
report the DPA with CXL_DPA_MASK applied, but cxl_store_rec_gen_media()
and cxl_store_rec_dram() use the raw value as the xarray key.

User space reads the DPA from the trace event and writes it to the
mem_repair dpa attribute. If the record had any flag set, xa_load()
misses it and the repair fails with -EINVAL. The raw key also lets a
repair go through for a record the device marked NOT_REPAIRABLE, if the
DPA is written with bit 1 set.

Key the records by the masked DPA and skip records marked
NOT_REPAIRABLE. cxl_find_rec_gen_media() now reads the record, so do
the lookup under the xarray lock as cxl_find_rec_dram() does, and
return a bool since its only caller tests the result.

Fixes: 0b5ccb0de1e2 ("cxl/edac: Support for finding memory operation attributes from the current boot")
Signed-off-by: Jongwon Lee <ai@linux.com>
---
 drivers/cxl/core/edac.c | 43 ++++++++++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 16 deletions(-)

diff --git a/drivers/cxl/core/edac.c b/drivers/cxl/core/edac.c
index f0c12871bd..94d44a3dc1 100644
--- a/drivers/cxl/core/edac.c
+++ b/drivers/cxl/core/edac.c
@@ -918,24 +918,37 @@ struct cxl_mem_repair_attrbs {
 	enum cxl_mem_repair_type repair_type;
 };
 
-static struct cxl_event_gen_media *
-cxl_find_rec_gen_media(struct cxl_memdev *cxlmd,
-		       struct cxl_mem_repair_attrbs *attrbs)
+/*
+ * The low bits of the event record DPA are flags (VOLATILE, NOT_REPAIRABLE).
+ * Records are looked up by the DPA user space writes back, which comes from
+ * the trace event and has the flags masked off, so key them the same way.
+ */
+static unsigned long cxl_rec_key(const struct cxl_event_media_hdr *hdr)
+{
+	return le64_to_cpu(hdr->phys_addr) & CXL_DPA_MASK;
+}
+
+static bool cxl_rec_not_repairable(const struct cxl_event_media_hdr *hdr)
+{
+	return le64_to_cpu(hdr->phys_addr) & CXL_DPA_NOT_REPAIRABLE;
+}
+
+static bool cxl_find_rec_gen_media(struct cxl_memdev *cxlmd,
+				   struct cxl_mem_repair_attrbs *attrbs)
 {
 	struct cxl_mem_err_rec *array_rec = cxlmd->err_rec_array;
 	struct cxl_event_gen_media *rec;
+	bool found;
 
-	if (!array_rec)
-		return NULL;
+	if (!array_rec || attrbs->repair_type != CXL_PPR)
+		return false;
 
+	xa_lock(&array_rec->rec_gen_media);
 	rec = xa_load(&array_rec->rec_gen_media, attrbs->dpa);
-	if (!rec)
-		return NULL;
+	found = rec && !cxl_rec_not_repairable(&rec->media_hdr);
+	xa_unlock(&array_rec->rec_gen_media);
 
-	if (attrbs->repair_type == CXL_PPR)
-		return rec;
-
-	return NULL;
+	return found;
 }
 
 /* Caller holds the xarray lock. The record may be freed once it is dropped. */
@@ -949,7 +962,7 @@ __cxl_find_rec_dram(struct xarray *rec_xarray,
 	lockdep_assert_held(&rec_xarray->xa_lock);
 
 	rec = xa_load(rec_xarray, attrbs->dpa);
-	if (!rec)
+	if (!rec || cxl_rec_not_repairable(&rec->media_hdr))
 		return NULL;
 
 	validity_flags = get_unaligned_le16(rec->media_hdr.validity_flags);
@@ -1130,8 +1143,7 @@ int cxl_store_rec_gen_media(struct cxl_memdev *cxlmd, union cxl_event *evt)
 		return -ENOMEM;
 
 	old_rec = xa_store(&array_rec->rec_gen_media,
-			   le64_to_cpu(rec->media_hdr.phys_addr), rec,
-			   GFP_KERNEL);
+			   cxl_rec_key(&rec->media_hdr), rec, GFP_KERNEL);
 	if (xa_is_err(old_rec)) {
 		kfree(rec);
 		return xa_err(old_rec);
@@ -1160,8 +1172,7 @@ int cxl_store_rec_dram(struct cxl_memdev *cxlmd, union cxl_event *evt)
 		return -ENOMEM;
 
 	old_rec = xa_store(&array_rec->rec_dram,
-			   le64_to_cpu(rec->media_hdr.phys_addr), rec,
-			   GFP_KERNEL);
+			   cxl_rec_key(&rec->media_hdr), rec, GFP_KERNEL);
 	if (xa_is_err(old_rec)) {
 		kfree(rec);
 		return xa_err(old_rec);
-- 
2.55.0

