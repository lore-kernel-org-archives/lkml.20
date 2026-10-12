Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ECF31F984
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791774775; cv=none; b=EwkNNw0qjJICSSEqe8u+dFM52sUOL4LoPEcasK+ZJ4yjryPE1D/phX6IgS+pyVV6DYgPN9N97PV9uTpUyShle3RMdtvOaurGtH/+WejSugL8cZ7bLrl680wiEmbuzoG4x1N0BDxZ8BCBGPGmrVPR2n7JIOGC1hja8OD9zalF/Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791774775; c=relaxed/simple;
	bh=CqRLrY7cBu0pfQpm954C5m+z2mDlO+62EotdTGqWiXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iAWSw+4WqkhbfjodAixgUT7DIiBzoWKY9h59RN4lMTqnOtja34C2bV9v2CkyUzGSein3PY+wMmRVSBM2ZYO8soHFk3F4gkL45QHygMiLgA2TQWeIzwHI0FrnD5FUfG6g3x0KA03aIn5XStadGrF2baHXjaMA4reTF2JgycugmXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=mEUe2QK/; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="mEUe2QK/"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917866225aaso25856506d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791774772; x=1792379572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TuOPx6DZfe3I+EYLRPeS51iVBzZ3ssHWUrzBdEIqs0o=;
        b=mEUe2QK/Ho0+ifiYg4X4mQF8ToQTT+Z5KLP8ai4vYAdwBiFFM8+P1C5YvmkXnG3ncS
         lp40ZndKsyenoiHqjsagswJluOA9TIr4OUsXPEs5fe2nQF7Radi7QtraMiEITsJG0T9K
         +gwiHlg9tJpq3h/T0WTl1RxGvz70f3vA054xOamCyk5aSJ2h1Jg5EJwDRE9IKVvrOztd
         Co526f5mG7lGFNVGMn2uUSUoMkppMrcOQ9+qCDYwMdC6Uxnzy/VZp6xjAFUcGoFR8zJJ
         gl50EY0FMd7PxnKv0xwn/xBkuwXngnY54ju5EXVY3XR7KKBZb1tp9N/8rc3MaUchMXne
         F4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791774772; x=1792379572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuOPx6DZfe3I+EYLRPeS51iVBzZ3ssHWUrzBdEIqs0o=;
        b=oIgZ2Bt292v1OJKziBoSrioKjQpz8ZextDVfF4GmwzXkSQ65n/NZLLfokubxaeq3Xz
         nEfTReVoSVDQWaNihWz+tXh8asK8PKSn3UzW6LJR/vjJUpWt0PjPS3ih7tTAqKSggDTK
         KJkC7blPqWCwM+e1Q8m2JoD/CAMfYcuv1z3NyJdj+MBqnmpQOxFOqP8YHp6IaIJLluwk
         BW13PCnRC12Owi2JWiW+nA2X45jGJqmlEPO5nsIkdu8cwui5zzqt198kYUiMsjvzyuAt
         zoGRslly+wGYcXu05aMEY8pyk3dq3VYwGh1QOdXK+IfXYNVTv6HVVw4Ungf6+ly0CjHc
         Me9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwItWraoU7XAs4Q2nGhYx27QoBjJ+vpm+qSOPnZw3uMs5JpsGD74cDwNM5n3621H7GnBUP0XCVhF9NXfZA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIAv8Zp+JffFzPOJl4FbsBGwhKleTfNlI3Me/ziRsmkcNwpdCP
	X5ABau5o/KdcG9NpsRKNomc+ltDhYRdImiN0G+izNAsKoTjEOjoqx8fOIyCe0N6nKQ==
X-Gm-Gg: AYBFou1lnBvP5cAYOu5VMxBImyEdRRJMjjVIRlRe1pV1fxRD2DBk6SB7JY9yYfVATiz
	izOoxEzuEVxZ6A1FTXMMTw7HwAotupUInBn2xSPrl/L1F05VWcQgUcBY5LgJ02axUBAVT4SNfSS
	JoDcXI/5UkScvsPNfcrCGJ4kNwk2qsfJwOtW5yRUNivc+fz080osRvcu8/ZD+3zyw+6gs4KxlH+
	L9U2DveKJlWQ4w3Q6fycU8LxSCSUBLbAHQNzAKkdhi29G6vXEgEFgvpZAxAgO02XeHCS383jZ3f
	b7vVR5XRCSwUumZl6Qa6N323Hiiwmpd6byx0OzW4Iqw0QqRa6n9hjfwACTGxTTaY1pCBU9M13IE
	t7tb5/Zi+TohLQrjuFHjACD6SlF3ks5tWFr48rgMUfYdxzYVI7po8FfMP8PHlhmXo7JvDfV1UYn
	NgqwpHxW29iOv01C9IiHTv1pQqkZaF2bKfUgZD1UxmiYEJPezB6xuXFCNnmvtIgKSMi5EvgWD/3
	3KkTPdOuDQJb5RWA2qALQ==
X-Received: by 2002:a05:6214:1d28:b0:91b:87cc:6d52 with SMTP id 6a1803df08f44-91b87cc7740mr14383666d6.0.1791774771901;
        Sun, 11 Oct 2026 20:12:51 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b54e80353sm84864796d6.1.2026.10.11.20.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 20:12:51 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fs/ntfs3: zero clusters allocated below the valid size
Date: Sun, 11 Oct 2026 23:12:24 -0400
Message-ID: <20261012031224.2237300-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
made ntfs_iomap_begin() allocate the clusters for a write into a hole of
a sparse file without zeroing them.

However, everything below the valid size is read from disk as it is, and
a write does not always fill the clusters it allocates. It can be smaller
than a cluster, or stop early when a part of the user buffer is not
readable. As of now, the rest of these clusters shows old contents of the
disk when the file is read.

For example, a volume with 64K clusters is mounted with -o sparse, a file
has a hole followed by data, and 4096 bytes are written at the start of
the hole.

Before commit 099ef9ab9203 ("fs/ntfs3: implement iomap-based file
operations"), the other 61440 bytes of the cluster read back as zeros.

After that commit, they hold the contents of a file that was deleted
earlier.

This patch will zero the clusters that are allocated below the valid
size, as it is already done when delayed allocations are converted.

Fixes: 099ef9ab9203 ("fs/ntfs3: implement iomap-based file operations")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
A test program is available on request. Tested on ntfs3 master and on top
of the 11 patches posted on 2026-10-09.

 fs/ntfs3/attrib.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index 3b4ef15162da..49ed2b06e7b8 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -1015,6 +1015,7 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
 	CLST hint, svcn, to_alloc, evcn1, next_svcn, asize, end, vcn0;
 	CLST alloc, evcn;
 	unsigned fr;
+	enum ALLOCATE_OPT opt;
 	u64 total_size, total_size0;
 	int step;
 
@@ -1245,10 +1246,14 @@ int attr_data_get_block_locked(struct ntfs_inode *ni, CLST vcn, CLST clen,
 	}
 
 	/* Allocate and zeroout new clusters. */
+	opt = zero ? ALLOCATE_ZERO : ALLOCATE_ONE_FR;
+	if (vcn < bytes_to_cluster(sbi, ni->i_valid)) {
+		/* What is below 'valid' is read from disk as it is. */
+		opt |= ALLOCATE_ZERO;
+	}
+
 	err = attr_allocate_clusters(sbi, run, run_da, vcn, hint + 1, to_alloc,
-				     NULL,
-				     zero ? ALLOCATE_ZERO : ALLOCATE_ONE_FR,
-				     len, fr, lcn, len);
+				     NULL, opt, len, fr, lcn, len);
 	if (err)
 		goto out;
 	*new = true;
-- 
2.53.0

