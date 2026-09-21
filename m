Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B62383304
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790018555; cv=none; b=oOGiBBEtkz3d6GRnlB404kDX+3D0yfpQuL/EKrQZIuj3T5rDDAaoHe2kzmF1RmzJJODLnewoBJqbnsbiGy8p2N7UgRFRZRPBjPX0esMuqpjbqQzpxnFETcaZERE/nyTvdn3pUUzbkcTbkmxJQPb0E9xMue7gJQzUfuEiOaMnnLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790018555; c=relaxed/simple;
	bh=1Vln5AnR/u+M091VrCo4DLzJl69oZOZDH1fIZSxbeZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9MM1u31aG0rwtBIGDMAmVYKkx1xQXXu14M6JvuGaVxwkAjtHoljkiSqVm/GqINplrB9+uTQW9GkXOVRYNV03ikcsTg1ppKmXAj9nJCNjZWOT37gjCv5gHaiSl5bC9LtE2hBlICuwTsPHedzpIljopXk4BZsLD3HXJfu0a+qIVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io; spf=pass smtp.mailfrom=bynar.io; dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b=ZDhrrLm2; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bynar.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bynar.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bynar.io header.i=@bynar.io header.b="ZDhrrLm2"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b1eso533130566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bynar.io; s=google; t=1790018551; x=1790623351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NR5tPh32B4WBEE8oYN6wKQK61Annl5nRH515L8upHQ=;
        b=ZDhrrLm2QAEPg8l6tmNfxLSyqKWz8GfirZmefGTQPZZJFyxsD7b9fjvb+J3tCCGcol
         SyW/5hHg1/mpbKBketsefq8p8CK6Q/bEpbUKZupjcL6rhD8O37H8quI117bK5030lC8O
         Pf4OCVwiISlgCrhDUxy/4jyqjQune9+HrGP+Fz+Mlp2+5vktZrDiZ0EZmAG0fMU8b6Bh
         k0MYeWd9YMvXcMDiLgd+2x3bOqlCILXy5j7ZM/yGw/RypF98xF2EeXnF9lidks0RWS8r
         nLqw77KxxUAQu/ry1b7x8wZbpA6Ya14D+ddEeFIzQdhTml8qx6xwGaerJZ8eP9Fy+0mN
         G9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790018551; x=1790623351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NR5tPh32B4WBEE8oYN6wKQK61Annl5nRH515L8upHQ=;
        b=m/DaYfRwbigk/xW0Cv5idx7N20lY5W+WR83WYMMGqtX7OSEq3tB3N3FdOQiAuLS21y
         llN8C6i3xc+doEIFPobG61XiGWOPdEPKifQMjVwJDGfKIdYrvU0cA4wpY2WoNhz+XSac
         n7kO95EAtCuHd7UoQ+bC3SGPW2g69SzithGG+7KlRKNrxWewaz9jEfHoC7L9+neLlEt4
         kIrHx0vEN35v4nq/4Pi/n4QY/cQXFOecd6AyAm6qiQvEax/dZXn7yQUblo67flNxRBbS
         To2KEYjeJQX1GN2+N5vsqx0GcqLloT2uSpsXjwx38CmytKqwO2KaDiDxqwI7csh0Udm6
         FErw==
X-Forwarded-Encrypted: i=1; AKwUvBwWfT8FV5ZirJw75Y0cKzl/U6+pzX5K3y2rSLQV4B3GtqUR0KEgCpVk9jZE1J6LRGKrEdXxu1nfSFLwVUk=@vger.kernel.org
X-Gm-Message-State: AFuF++lxzDdeV2p569sqMQgisuWiwVjY09kcD75S03gKBhgY8zeSEdXd
	4ExvLl8xlXBPqUxbmVv5rXaPEWWEJ7as5dqrTCYaKChCsidPhQabwliUxRQz5ClhZZri
X-Gm-Gg: AYBFou3d9lmV0/PnXwJV4f4/vTO9IunanH9xlB1Sf8cW3lCb5dWHGdtLert201uodmR
	jIq2yF76Ke5tt7Vgaf4cs44MqLdzX/QvVq3mnwzWqdQIsw0r03/zN1jwg4dd8dTAU59eOtu/GOG
	vQPYjT8txRudZmw9GdCNnIaaTebaAn8A4dUL/kLRRrqAtRMNixgYmdSLsweJloABvx9ky+ZOTuD
	yu7eC2/BAYBB8iEMQo0rrOtNb9AFrckmw3H0yzzXEEHjseh3KiVDYdP2u20pLnGjfboOPqZiwoA
	dQ+vxI7YzclPR0eQMZnPOtV7KnhabLOC3YhuXqODlQNDxf81pSxOA6Au6p+IFxTACHxpKSbmHzD
	CbCJclSr5t1h0G+R9FLqK2yBS3b1U9+seTsJO5EvjtouoQMAO+OKT/OYWHTR5yVNxKQGR/BTRAH
	sXSgqX89LtSVOVRvWDwlpwpZwktNi2EKJvSacfNQ043wuuy98=
X-Received: by 2002:a17:907:94cf:b0:c25:5114:c832 with SMTP id a640c23a62f3a-c2a156a37fdmr950115566b.3.1790018550970;
        Mon, 21 Sep 2026 12:22:30 -0700 (PDT)
Received: from cachyos ([151.38.78.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a358868e1sm341089066b.47.2026.09.21.12.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:22:30 -0700 (PDT)
From: Giulia Aloia <giulia@bynar.io>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	cenzhang@linux.microsoft.com
Subject: [PATCH 4/4] fs/ntfs3: fix out-of-bounds access in alloc_rsttbl_from_idx()
Date: Mon, 21 Sep 2026 21:21:39 +0200
Message-ID: <20260921192157.102738-5-giulia@bynar.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921192157.102738-1-giulia@bynar.io>
References: <20260921192157.102738-1-giulia@bynar.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

alloc_rsttbl_from_idx() walks the restart table free list until it finds
the requested offset. If the requested entry is not already allocated,
the old code expects to find it in the free list and keeps walking until
it does.

A crafted on-disk restart table can use individually valid free-list
offsets but still omit the requested entry from the list.
When log replay asks alloc_rsttbl_from_idx() to allocate that entry,
the old code keeps following the list without bound checks.

This is reachable by mounting the crafted image on an x86-64 KASAN
kernel before this fix:

KASAN: use-after-free in log_replay+0x8986/0xe690
    Read of size 4 at addr ffff888102477828 by task mount/67
Call Trace:
 log_replay+0x8986/0xe690
 ntfs_loadlog_and_replay+0x3e0/0x500
 ntfs_fill_super+0x1fd3/0x4510
 ...

Validate the requested offset against the table entry size before using
it. Then bound the free-list search by rt->used and reject invalid,
allocated, out-of-range, or misaligned links while walking. If the
requested entry is not found in the bounded walk, return failure instead
of continuing indefinitely.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Cc: stable@vger.kernel.org
Assisted-by: Bynario AI
Signed-off-by: Giulia Aloia <giulia@bynar.io>
---
 fs/ntfs3/fslog.c | 66 ++++++++++++++++++++++++------------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index e3b5a19f0e30..1793dd9ccfba 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -947,12 +947,20 @@ static inline void *alloc_rsttbl_idx(struct RESTART_TABLE **tbl)
  */
 static inline void *alloc_rsttbl_from_idx(struct RESTART_TABLE **tbl, u32 vbo)
 {
+	u32 i;
 	u32 off;
+	u32 prev_off = 0;
 	__le32 *e;
+	__le32 *prev_e = NULL;
 	struct RESTART_TABLE *rt = *tbl;
 	u32 bytes = bytes_per_rt(rt);
+	u16 used;
 	u16 esize = le16_to_cpu(rt->size);
 
+	if (esize < sizeof(__le32) || vbo < sizeof(struct RESTART_TABLE) ||
+	    (vbo - sizeof(struct RESTART_TABLE)) % esize)
+		return NULL;
+
 	/* If the entry is not the table, we will have to extend the table. */
 	if (vbo >= bytes) {
 		/*
@@ -968,57 +976,49 @@ static inline void *alloc_rsttbl_from_idx(struct RESTART_TABLE **tbl, u32 vbo)
 		*tbl = rt = extend_rsttbl(rt, bytes2idx / esize + 1, bytes);
 		if (!rt)
 			return NULL;
+		bytes = bytes_per_rt(rt);
 	}
 
+	used = le16_to_cpu(rt->used);
+
 	/* See if the entry is already allocated, and just return if it is. */
 	e = Add2Ptr(rt, vbo);
 
 	if (*e == RESTART_ENTRY_ALLOCATED_LE)
 		return e;
 
-	/*
-	 * Walk through the table, looking for the entry we're
-	 * interested and the previous entry.
-	 */
 	off = le32_to_cpu(rt->first_free);
-	e = Add2Ptr(rt, off);
-
-	if (off == vbo) {
-		/* this is a match */
-		rt->first_free = *e;
-		goto skip_looking;
-	}
-
-	/*
-	 * Need to walk through the list looking for the predecessor
-	 * of our entry.
-	 */
-	for (;;) {
-		/* Remember the entry just found */
-		u32 last_off = off;
-		__le32 *last_e = e;
 
-		/* Should never run of entries. */
+	for (i = 0; off; i++) {
+		if (i >= used || off == RESTART_ENTRY_ALLOCATED ||
+		    off < sizeof(struct RESTART_TABLE) ||
+		    off > bytes - sizeof(__le32) ||
+		    (off - sizeof(struct RESTART_TABLE)) % esize) {
+			return NULL;
+		}
 
-		/* Lookup up the next entry the list. */
-		off = le32_to_cpu(*last_e);
 		e = Add2Ptr(rt, off);
 
-		/* If this is our match we are done. */
 		if (off == vbo) {
-			*last_e = *e;
+			if (prev_e) {
+				*prev_e = *e;
 
-			/*
-			 * If this was the last entry, we update that
-			 * table as well.
-			 */
-			if (le32_to_cpu(rt->last_free) == off)
-				rt->last_free = cpu_to_le32(last_off);
-			break;
+				if (le32_to_cpu(rt->last_free) == off)
+					rt->last_free = cpu_to_le32(prev_off);
+			} else {
+				rt->first_free = *e;
+			}
+			goto found;
 		}
+
+		prev_e = e;
+		prev_off = off;
+		off = le32_to_cpu(*e);
 	}
 
-skip_looking:
+	return NULL;
+
+found:
 	/* If the list is now empty, we fix the last_free as well. */
 	if (!rt->first_free)
 		rt->last_free = 0;
-- 
2.55.0
