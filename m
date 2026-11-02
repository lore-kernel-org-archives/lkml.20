Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622770;
	b=oNZmN+EYys2Be9QSrg3PcegfIg6YbcgGoUfpuVfTu7ffneLq8rsEweos1nASNmYqZjgI
	 XwKVruuo8vDv80vSrFOewGRVHXx8gMdXFkbQlngpXTC1IZpTp5BQz+00DC46nPxErkjlc
	 GMlCvZS0W05XwFf4rPwmA0ZjyQCGLhQsDUlDM/6bgXBXY4r8xaq3+hiIA4Fmog1TQwQV2
	 kBQZERAyqd5+GV/ou0zZPkb5dp3MO6LUCR/hdJawUs4Uza6TYw2H2yvuQX4QS8ogQ4pL5
	 /QIROwF2+Yz339WUSSo6EjVLuPfVTIT4mryYRX2Uh/i/AgYH8Ha/7B+UfoiWUMEoI8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622770;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Fmx+M4AB2hm825WG5Tk2E+M0SAzq97vo8VARk3oiOhs=;
	b=wsztxOz3xzLkXL4B9wi3Kh/UQXuAGqwboz1L5ydTCRoJw+dX1zaZ8F9OurXLExKlEFPc
	 Sn6PMJibtrBULUfEaFSZVyYQnELzPYDW7apAy9/U2FApPfufO1vXQTvS/A0m9ztjf4qYS
	 /+760TQELSwbrcnb0Mp0UJkUqlgnBCz0XeL2E+zU+xoQKVaaRC95hqkQ6ceOLOSsw8Bmf
	 h4+a5xc4Gp9CxeJcl7d3meoIKwAjLP7TzSAbVFZJVD/2PfjwRyX5gZ5jgK8v2jJ3ygIgB
	 ACZZYik86J6cA9Xncl8QjkjL/h5BbRZR/zP960ymNsfLy4i/C/hbIhXf6KgMqRjbWYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98095606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98095606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ea94541adbso12295425ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622769; x=1794227569;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fmx+M4AB2hm825WG5Tk2E+M0SAzq97vo8VARk3oiOhs=;
        b=FD1OPLT11DpGbX1r33o8L/gB/QaNxljimqw+aLwjmLvAVomtMBiU7hHqLpiIGXBJpk
         m1wFY+6jIpE2Sng4zwYbkMzzDxB0RLsDz2Ef0Z1eo8MVCl58BAWEfrFQZUYoUos6OOsL
         DT5B6Cm0jL3DjmJEkQaD938j+9S1edg8lD3GXSwQAcAFfXAcJzB0pMaKX/FhJ84apn/X
         XVM+flExSj3h9/MvFJ4CEWk0CZmVVOmFUe2h6yK/YYGtd0pCWcsHNKO2PIZNVcCpGAMO
         s1ntjtqbDYJfMV9ZxVdThkARYqN/Fl9XMLQ/BXq8NHK9r6i/35k3CwLslPq/2NyMqoUp
         8GPQ==
X-Forwarded-Encrypted: i=1; AKwUvBziSHTImp3m/EVbb9JWBvNf5/I/XS2vUcp35tSM60l5EeenKLDYJ/O/AZTJsyr3yUhOOTRdQ1mPswhAujg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pc4cf5UfPeoVQWHJXoNDMoH2hBFyxNHh+MVG/gvrnm8tlzzQp
	VrLPJF+eO7agBx2B2eevblC1klW6NJCp7xmVn+pMRc+vQZgT3XYX+fGp+D2D+ZlnVyNp
X-Gm-Gg: AYBFou3Lc4eEG06g8+RzJa27biYRj53K0kx71iSLsT027rDH9kyTaz1/ZWhMbj7tKpt
	hON9ODL8ZDnSpWEQx6sQGcnanJ2l69x/Q4TyUomTrwr2FTdUt68EiUWsMvkzm1QTw7d0gCUQKOE
	Gt7R70gDB52Kzb5UfYbzTLHTZ+TPCgC4lS7qRUjqSUoPyppDS3B5/dnK7XABKoijIF053chEB4f
	xRQytFTSX+SW6M5UYO4PCmlMKXidLAipZEQyfvXwtn1lzcjxTwRcG2RW1xqApMZBaYQbOkXMkcv
	iNmqKB/rwanBhI+k/uB1U5YomUKSqu5H7TjDScCV1VpvgSAgk2zZt5ov9o5M+R0/bqVUe4gVTTg
	JXpIFXRvnoRyOLvTCC25k0OmpYpMSuHbsi9Qom2rtsDZFqXpX3kx7CTYvc4mwh85KfCT3Lfc8Mk
	nKqhc9MvizLA+nDc3dtx/nKbtydrfr5werkcgn4zPGJV+VMYZ0ZYoVTKQkPECiqkNa6m3LrIuCC
	KpJGqzIoTa2e3AIN+AcdjzkS9K4YfhxHFQJd+glROWik+7ZcABN5XZUlkPvWsZ3BbBu0z0OKL0k
	v3EfbXvt2qChcVrjCVnHVEbu5WIEpFkRDm2PbAfppPr/YKFb38wWyuWZv0aOo/fTI7PqsV2Cwvf
	AN0uQwVsjbaG8C7mBwYBqIsOdDmu3+bFZ4izHNoofL7p+QEn9/Q0evLx3iInz
X-Received: by 2002:a17:903:4683:b0:2dd:b837:48f7 with SMTP id d9443c01a7336-2eb3649f118mr95564035ad.25.1793622768735;
        Mon, 02 Nov 2026 04:32:48 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392492fbsm27101845ad.32.2026.11.02.04.32.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Nov 2026 04:32:48 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>
Cc: Ira Weiny <iweiny@kernel.org>, Li Ming <ming.li@zohomail.com>,
 Richard Cheng <icheng@nvidia.com>, linux-cxl@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] cxl/edac: Mask DPA flags in the event record cache key
Date: Mon, 02 Nov 2026 21:32:35 +0900
Message-ID: <20261102123233.74598-3-ai@linux.com>
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
index c5c8dda20e..a5f198b561 100644
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
+static inline unsigned long cxl_rec_key(const struct cxl_event_media_hdr *hdr)
+{
+	return le64_to_cpu(hdr->phys_addr) & CXL_DPA_MASK;
+}
+
+static inline bool cxl_rec_not_repairable(const struct cxl_event_media_hdr *hdr)
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

