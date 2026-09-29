Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707B653ED16
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714470; cv=none; b=TqjiePFRmwOfEqCzDJYRcTbmdCycUah/Z5Ncg3IwqQuu2TTrACQHHQmqrs8XcyZNu+mJC7R19dDuKwJALdH87Odema6OQrChf2ku69gxwCDcZmfW2HkahU8wsuuko31x5b107Jkh0LtFMwq7qSVN86D+nGKkm/95vqExYlU2wOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714470; c=relaxed/simple;
	bh=Slvyu9DiqG2WkoK+wCk7NMUEKZWwNVoV8NyAOHiygx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p0hnseJwX2HUkqJJjv6MscPeB/E1ap9dmJGFNTRHuV0UlGAOpuex5QHYCRAivDbORKDzV/mlfrFPj4mTivlzUIk5v0RG+qtxp5xaoH8d2rmLCH8TBg8RNhGgAt5Dg2APcAJYRn5+7sfi+zj+Km7lWbBQBnPb+9ZMje0tGGswZLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Irpk+/F8; arc=none smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Irpk+/F8"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-346c612c7a8so1975661eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790714468; x=1791319268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwQ1SxgN+pXJaELo7dyIAhb9rYmD56HQJqLQ/gzjhs8=;
        b=Irpk+/F8s3p2wn2LvXqrNwJ/rAK6JsHXPMwNMN2XF6muKnJt0q4PvrtqvJwqNDy0Ym
         9f6JFXekJUnE1fsEGDsIR6xFyZ2hFverQV0msR7STAbKZ0L8PlZ8iyUIDR6ChkFmbmbH
         hG89p152huXZI1uQkM8TA2xemmtkCOQgDDD/0TAJf6CEJbbCv0+QkXAYEK8uLvn4SKqe
         olGonI31AvL2Kpb0nuoEM/tG1eQ5VXLkR+sr3LMjb8ygyXbaWh2Z6VEAZGxlwLOAtXlT
         QZnVjIFjrZnzATDG2SuO6b/1+kQlKsWJzQUh9mlP84xP/JA8wIfDx1CQRbPbCpeGeHGM
         j0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790714468; x=1791319268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwQ1SxgN+pXJaELo7dyIAhb9rYmD56HQJqLQ/gzjhs8=;
        b=oWkiXYkl89lR3q8dfw+Pi8WcmT5h8j/QuTrdPGBC8gw0Thd9nOXlyzv5T9eDxaNVV7
         VvkVyTaAPrAqSqLq9WPwy/WDj87WV8zwstTi6XlgmoTw2ZT/crFN3G0X/cXWhO6GgaJo
         NLBxNs6+lPJN52lkPQw2U7kyp+vgSZsz0lbW5KWyUKYGh6Ff+fMIEm5Qxjks1fcVt4Qx
         Q5tMN+FCIP0JjWtNsTuC4iyFa2efvaD718v9YladnXb1jwAQWe8iji1vAcW/z6xT5tPx
         kGoKlCWd1Ie7CCRAC7ka237OrLpYaO2USi8p+YcOGIIz9Pb1Y24Ch3AQuY9SHpPs7ZXz
         xXwQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaLhWoHkDqneeXV7+vePrAf6yaAr/cfImkJ+dBXxNSPN5hit9TgXTtLVNrz56aRURucKqH3B3vZWUOFAM=@vger.kernel.org
X-Gm-Message-State: AFuF++ndwawLes/QotUFNI7/fcqK/+IrrIMvWG/DqZX1nJfxj9jvVyqr
	KAukGBd6AfkmJ42GBonWc/Lzy2JhYxmK8fIMF7khEySLnmhvQkzIOmTaojMzyw==
X-Gm-Gg: AYBFou3Skl+5R9JXhN1Z5qQdJ8Mb3EWjqa+5XRz4ALhDzcNh4YE0KPdrvU+A3Ot92MU
	/JgPZCDmn9jyRjoF5ftD8zPhm9tbQ1Nk6o3MmVOKvYzospQ4aBNT+jAvJlnNj8STFUyPskps5mw
	cl/pNvjHtwQOYSNZKvgZJb2JAriUDC9fcGizbbJcxhlhady6DfQWlLa9tXdTrDijh/7rXfRBszB
	AWOyrr0DjzI0AgbZcig5RVuLFhQX6Wz3yI4Er8aHjxF76p8qZxfRg9t9h/kKfYbm04SmHQdVBKz
	L0sKDJxvvIBzCKUFWUm0nRbCpl2Hc6+sRaMbxiVIscvJR6xEiWOWvVbvZfyABSerPP10eThZLxs
	3LzyTxdWHslsPES1ybAnk+PQ6xKX3O0V1c2JWHPfyRtGf/sXq36UAZd94CZE6gJjtWmDaR5S/mc
	zQzWk15zHYj7b46p68ZWosklOZV1gBauAaxBbzqIJq+9iRKTCok3cSVpSKB427ukiCd16qVV3hM
	vO+CEpyvIlmGVTuI5mo8NW/XA88LXAA161YoWlkbmB/e8ZWzHKKTTNoMnRPicjpk6g2r4KT
X-Received: by 2002:a05:693c:4092:b0:33c:e82:70c7 with SMTP id 5a478bee46e88-34c63bfd154mr573060eec.30.1790714468139;
        Tue, 29 Sep 2026 13:41:08 -0700 (PDT)
Received: from localhost.localdomain (c-73-241-100-55.hsd1.ca.comcast.net. [73.241.100.55])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38beb048sm1364712eec.24.2026.09.29.13.41.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Sep 2026 13:41:07 -0700 (PDT)
From: Stanley Shen <stanleyshen1886@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] fs/ntfs3: fix out-of-bounds read in the index root ops of do_action()
Date: Tue, 29 Sep 2026 13:41:06 -0700
Message-ID: <20260929204106.41921-1-stanleyshen1886@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The five index root redo handlers in do_action() (AddIndexEntryRoot,
DeleteIndexEntryRoot, SetIndexEntryVcnRoot, UpdateFileNameRoot and
UpdateRecordDataRoot) read the index root before anything has validated
the offset the attribute was derived from:

	root = resident_data(attr);
	hdr = &root->ihdr;
	used = le32_to_cpu(hdr->used);

	if (!check_if_index_root(rec, lrh) ||
	    !check_if_root_index(attr, hdr, lrh)) {

attr is Add2Ptr(rec, le16_to_cpu(lrh->record_off)) and rec is the
record_size-sized buffer allocated in mi_init(), while record_off comes
verbatim from the on-disk log record header. check_if_index_root() is
what bounds it, by walking the attribute chain from rec->attr_off (which
check_file_record() has already validated) and accepting record_off only
when it is the offset of an ATTR_ROOT of that chain. Until it has run,
both the attr->res.data_off read inside resident_data() and the hdr->used
read that follows can land outside the allocation; record_off and
data_off are both __le16, so a crafted log record can push the access
almost 128K past a 1K or 4K record.

Once check_if_index_root() has passed, check_attr() has already bounded
the attribute and its resident data inside the record, so run it first in
all five handlers. check_if_root_index() needs hdr and stays put.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Assisted-by: LLM
Signed-off-by: Stanley Shen <stanleyshen1886@gmail.com>
---
 fs/ntfs3/fslog.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ed50c1d0c23..c7c2b477643 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3471,12 +3471,19 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 	case AddIndexEntryRoot:
 		e = (struct NTFS_DE *)data;
 		esize = le16_to_cpu(e->size);
+
+		/*
+		 * check_if_index_root() is what validates lrh->record_off, so
+		 * it has to run before attr is dereferenced.
+		 */
+		if (!check_if_index_root(rec, lrh))
+			goto dirty_vol;
+
 		root = resident_data(attr);
 		hdr = &root->ihdr;
 		used = le32_to_cpu(hdr->used);
 
-		if (!check_if_index_root(rec, lrh) ||
-		    !check_if_root_index(attr, hdr, lrh) ||
+		if (!check_if_root_index(attr, hdr, lrh) ||
 		    Add2Ptr(data, esize) > Add2Ptr(lrh, rec_len) ||
 		    esize > le32_to_cpu(rec->total) - le32_to_cpu(rec->used)) {
 			goto dirty_vol;
@@ -3498,14 +3505,15 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		break;
 
 	case DeleteIndexEntryRoot:
+		if (!check_if_index_root(rec, lrh))
+			goto dirty_vol;
+
 		root = resident_data(attr);
 		hdr = &root->ihdr;
 		used = le32_to_cpu(hdr->used);
 
-		if (!check_if_index_root(rec, lrh) ||
-		    !check_if_root_index(attr, hdr, lrh)) {
+		if (!check_if_root_index(attr, hdr, lrh))
 			goto dirty_vol;
-		}
 
 		e1 = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 		esize = le16_to_cpu(e1->size);
@@ -3526,13 +3534,14 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		break;
 
 	case SetIndexEntryVcnRoot:
+		if (!check_if_index_root(rec, lrh))
+			goto dirty_vol;
+
 		root = resident_data(attr);
 		hdr = &root->ihdr;
 
-		if (!check_if_index_root(rec, lrh) ||
-		    !check_if_root_index(attr, hdr, lrh)) {
+		if (!check_if_root_index(attr, hdr, lrh))
 			goto dirty_vol;
-		}
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 
@@ -3541,13 +3550,14 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		break;
 
 	case UpdateFileNameRoot:
+		if (!check_if_index_root(rec, lrh))
+			goto dirty_vol;
+
 		root = resident_data(attr);
 		hdr = &root->ihdr;
 
-		if (!check_if_index_root(rec, lrh) ||
-		    !check_if_root_index(attr, hdr, lrh)) {
+		if (!check_if_root_index(attr, hdr, lrh))
 			goto dirty_vol;
-		}
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 		fname = (struct ATTR_FILE_NAME *)(e + 1);
@@ -3556,13 +3566,14 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		break;
 
 	case UpdateRecordDataRoot:
+		if (!check_if_index_root(rec, lrh))
+			goto dirty_vol;
+
 		root = resident_data(attr);
 		hdr = &root->ihdr;
 
-		if (!check_if_index_root(rec, lrh) ||
-		    !check_if_root_index(attr, hdr, lrh)) {
+		if (!check_if_root_index(attr, hdr, lrh))
 			goto dirty_vol;
-		}
 
 		e = Add2Ptr(attr, le16_to_cpu(lrh->attr_off));
 
-- 
2.50.1 (Apple Git-155)

