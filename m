Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1F44A3F8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186250; cv=none; b=iyeNT4hgKG6ebNJD9gCZdZaNjVhj7eU+pGVGPb136TXNim/3XlYhJgm7036K8DxJEfELMdM6OuMhcNCeFa6GLHqIyYEs3bdq9/gKrCgY3ST/3u22KDuCZqScaHVKFYna8LrQRgFQCarWWutuvgXO8gEdBNGYifQQovfXB9JEEJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186250; c=relaxed/simple;
	bh=O2SVbTHvj0WJUPLNYYsmSk7cCIYmPbczbK+T8dhHd0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UAKLsiWGIXj6h9fZLdb/NjWALmR588ylYOad0mEjNpV45/amQedcW51Jo89vs/MxPYsHxFK2zLqL9s1vWAMo/+bPwXxFchr7IsTcU4sXLuFPUTEEsykDfhsu41rpfN8+2mQ34oxouW8aeiACiRTZkUGjyB5pHDoKqHA3FD+8oPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qiX/c8zH; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qiX/c8zH"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so3680909e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186247; x=1788791047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XUygTJjgNQhdqNUISUim/L+lF4+6MskNxbn6GUClEFw=;
        b=qiX/c8zHFl0he9VhW1RAbcXmYQ/vRKc5vtwINgGOHk7hJTbz4LFN+WNlOFzzQdXGAI
         hpD74OFvTtS2hltKI3j/AonhohqwqWpWl8i7Xoo+yzGMNKVu7EqKvhYtRA8gaWhKMbFp
         mo3HrogZetSd7bnILj1ilKGM31Uru6rKJGH4MOq0TstQykFAVvfHIGjyfh5QWEGKUogt
         StkSMDQs7LjTQQPxfQtxGwIkKC0bdg95PGYbF4W1QgE96oeN10slepRPmw+1rPsRAJbI
         ho7U0N07eu6Oa1CQGIhOnnySBf2HEhL5xE/YEdvHi/vxgdesagUBRimB3ojl3DKVoIyr
         7E+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186247; x=1788791047;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XUygTJjgNQhdqNUISUim/L+lF4+6MskNxbn6GUClEFw=;
        b=bZAyB2npnbAQa5CDRwsUbEIVsXvryIbnIZ81zPUB5FdhuTLQG7WLp+D9paKnsIy/Rk
         IFIqauBFTLzlai+1ypG76oiyjOF4ajpb0dbRL2q3oGihn+94VKozqzTgDr+w9H1AruPb
         0TgbQQMGoIYtStuNMCpbCGXle0IjBaY0NyJU5dQp0Hxmmt/bMPQZ6y+fq4vlI/S7qmn4
         Jwl1zgXWfaaPMBDR5H+ROL4dvH/fY889rF7zBLrr+PGg2nK4ydZOmVMamWk8eUgnvAUE
         Xw15gZR3BdoIL1egnmwJUONTR2enF9FdhlueoaHDf8R63lQLLtoNsEE5s1DyZczfRHDF
         PSeQ==
X-Gm-Message-State: AFuF++kPCMw3Bi3JO6iVwAIoRxaTR318tA5RTjoaS2jPMTRcUywcCxEL
	wPwgTN5UefS8oLTdHJy9WhNt9t+VCvlBvvOhNhaBAqxpM8nUM55XzueA3Gk1CdoY
X-Gm-Gg: AYBFou0G5TmNQnnxJ+1KM9JlI1In+0d2ZppFz604I/GGe5tPaEttjiETl0Oxw3uREtB
	jrRIRkSADwImbl7MjcgodX9IiRDyA6eGWRGJeE3x/MssDgkGBei+EW+iUVshcLt0ZOTol4ajagU
	dunbNv1e9n6si7OY3yQ4MnDtulsRlCcFN9+pAnPc+PdpcjDuvyggbrlIkcDlgzq8bH4t/JlGNp5
	WmiJiboiiGhWB2iC+nyNgkTRIaigRJktEjV7OqlUSw+XGSCvBXBezd/NMnrVjfEIYjZIb8W17Z+
	v/cpMKuoyisQLGohNnYP4Katv2625In7qxWWxSJ3RFSXGj5QsXuZv6f1Bfvi1Up61qIMkKGeyGm
	H60xI4JHRdDsRT0VIZvtXW3X1LzW6h3yU8ldyP0uMWg1959lVdaDamTbMaoujUewXXKdQzQoYge
	3Q8vE+zBDAwkGP4YS4vIljM7gCpw9Tj6yCziY2mlDmpbPsQqQoDWu+zXLOn252bpgIeQ==
X-Received: by 2002:a05:6512:4605:b0:5b2:a6e6:8d83 with SMTP id 2adb3069b0e04-5b5e6b07d24mr8649241e87.23.1788186246778;
        Mon, 31 Aug 2026 07:24:06 -0700 (PDT)
Received: from kali ([37.114.129.26])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89c5c8fsm2292919e87.9.2026.08.31.07.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:24:06 -0700 (PDT)
From: Tabriz Hasanli <cybersec467@gmail.com>
To: linux-kernel@vger.kernel.org,
	ntfs3@lists.linux.dev
Cc: almaz.alexandrovich@paragon-software.com,
	w@1wt.eu,
	Tabriz Hasanli <cybersec467@gmail.com>
Subject: [PATCH 1/1] fs/ntfs3: validate target index entry in check_if_alloc_index/check_if_root_index
Date: Mon, 31 Aug 2026 10:23:44 -0400
Message-ID: <20260831142344.472594-2-cybersec467@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831142344.472594-1-cybersec467@gmail.com>
References: <20260831142344.472594-1-cybersec467@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

check_if_alloc_index() and check_if_root_index() walk the index entry
chain to verify that lrh->attr_off lands on a valid entry boundary.
However they have two gaps:

(a) They do not stop at de_is_last() — they walk past the last real
    entry into the trailing gap between the last entry's end and
    hdr->used, which check_index_header() leaves unvalidated.

(b) They do not validate the TARGET entry at attr_off — the walk exits
    as soon as o == attr_off without checking the entry's size, flags,
    or bounds.

This allows attr_off to point to an attacker-controlled "fake entry"
in the trailing gap of a crafted NTFS image's $LogFile.  Four do_action()
cases then use the unvalidated entry:

  SetIndexEntryVcnAllocation / SetIndexEntryVcnRoot:
    de_set_vbn_le() writes 8 bytes at e + e->size - 8.
    Crafted e->size yields an 8-byte OOB write up to ~64KB past the
    buffer.

  UpdateFileNameAllocation / UpdateFileNameRoot:
    memmove() writes 56 bytes at a fixed offset from e.  If e is near
    the buffer end, this overflows by up to 0x50 bytes.

The sibling DeleteIndexEntryAllocation case (commit fc4626bb3656) and
UpdateRecordData cases (commit 3e127829e57f) already carry per-site
guards for the same class of attack; this patch closes the gap at the
validator level so all current and future callers are protected.

Fix both functions to:
  - stop walking at de_is_last()
  - validate the target entry: size is 8-byte aligned, >= minimum
    entry size, and does not extend past hdr->used

Found by static source analysis and confirmed with userspace ASan
harnesses transcribing the kernel's exact validation logic on a
512-byte INDEX_BUFFER with faithful check_index_buffer() geometry.

Signed-off-by: Tabriz Hasanli <cybersec467@gmail.com>
---
 fs/ntfs3/fslog.c | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ed50c1d0c..d73e3ff1e 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -2953,10 +2953,13 @@ static inline bool check_if_root_index(const struct ATTRIB *attr,
 	u32 o = PtrOffset(attr, hdr) + de_off;
 	const struct NTFS_DE *e = Add2Ptr(hdr, de_off);
 	u32 asize = le32_to_cpu(attr->size);
+	u32 used = le32_to_cpu(hdr->used);
+	bool has_subnode = hdr_has_subnode(hdr);
+	u32 min_de = has_subnode ? sizeof(struct NTFS_DE) + sizeof(u64)
+				: sizeof(struct NTFS_DE);
+	u16 esize;
 
 	while (o < ao) {
-		u16 esize;
-
 		if (o >= asize)
 			break;
 
@@ -2964,11 +2967,24 @@ static inline bool check_if_root_index(const struct ATTRIB *attr,
 		if (!esize)
 			break;
 
+		if (de_is_last(e))
+			break;
+
 		o += esize;
+		de_off += esize;
 		e = Add2Ptr(e, esize);
 	}
 
-	return o == ao;
+	if (o != ao)
+		return false;
+
+	/* Validate the target entry itself. */
+	esize = le16_to_cpu(e->size);
+	if (!IS_ALIGNED(esize, 8) || esize < min_de ||
+	    size_add(de_off, esize) > used)
+		return false;
+
+	return true;
 }
 
 static inline bool check_if_alloc_index(const struct INDEX_HDR *hdr,
@@ -2978,10 +2994,12 @@ static inline bool check_if_alloc_index(const struct INDEX_HDR *hdr,
 	u32 o = offsetof(struct INDEX_BUFFER, ihdr) + de_off;
 	const struct NTFS_DE *e = Add2Ptr(hdr, de_off);
 	u32 used = le32_to_cpu(hdr->used);
+	bool has_subnode = hdr_has_subnode(hdr);
+	u32 min_de = has_subnode ? sizeof(struct NTFS_DE) + sizeof(u64)
+				: sizeof(struct NTFS_DE);
+	u16 esize;
 
 	while (o < attr_off) {
-		u16 esize;
-
 		if (de_off >= used)
 			break;
 
@@ -2989,12 +3007,24 @@ static inline bool check_if_alloc_index(const struct INDEX_HDR *hdr,
 		if (!esize)
 			break;
 
+		if (de_is_last(e))
+			break;
+
 		o += esize;
 		de_off += esize;
 		e = Add2Ptr(e, esize);
 	}
 
-	return o == attr_off;
+	if (o != attr_off)
+		return false;
+
+	/* Validate the target entry itself. */
+	esize = le16_to_cpu(e->size);
+	if (!IS_ALIGNED(esize, 8) || esize < min_de ||
+	    size_add(de_off, esize) > used)
+		return false;
+
+	return true;
 }
 
 static inline void change_attr_size(struct MFT_REC *rec, struct ATTRIB *attr,
-- 
2.53.0

