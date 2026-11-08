Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794125030;
	b=lFvMnMVWAbbxV/SxGIHqpC6paSQO57cyKC6imvjw1TI6w2T96TdLp5ykTdPY9ZNMr9Ws
	 gG7uKZ3VYTI0mNhD8yIiyia3Uygpb5oDVZ++gkjKcTB5orne+D1yQ62/1V8o5wlH4Xgkf
	 FttddhZq2AQbl57Ciydn6ryE3skSFGfjNgY3bXwC+GDC6aOwfFd6LXivrWBgIa6e1j43H
	 UR0H2GSwtNOgM4aBYON3jn4ZfiriKDPr+k8J5j4cmY/qeULJbbTPgLD67Yb1/i5Q15Kxr
	 Ck3ZUFNBv7d/tK8XA86L3by/xfGrbXossEQbgTHMbX8cJpLsCUFtkgSTO1Lxw7ZXHyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794125030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JOX77fus2x/eG1WoZO3OzTindRAi1WdAyfHFy3V4a8g=;
	b=z7X0takXg36qKrSqG0OFyA6oX2Cn/AOncGDXswQ2PE1gYWW/f2hJ1btxSQcB25e5eMxc
	 xAtQhSFKSy2EMhNhCw5jqA+fYccSZLxh5X4yBfcZg/vICDIqlBo34FOHrv6vl2VS+wiBn
	 P11wLWgB5EouW0p+f8zk1ezqOfkg54657oBOElhXmDOUB8q7LGoe8sPc3NdAF613613bd
	 wAsPepqmNuKNes0VNhW05iOZjvRTiem8CnJ8v8C3j2nY03X/gd6ME/hOuGSCnRGxZxgAh
	 rO/bNsZZwAsVp5Pf+188lQElTBDOkyph/pjvOtDrYBkUlUUOkZZha+PMIpiZ3w9Lerg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BF3Aubl4;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591FE606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 08:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 591FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BF3Aubl4
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1931ff67a29so614506c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 00:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794125029; x=1794729829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JOX77fus2x/eG1WoZO3OzTindRAi1WdAyfHFy3V4a8g=;
        b=BF3Aubl4v0ZUvg1OJvLO75TxuEO95rmneinKKX5J0RbJfN/Ff9dGx1miWCPrHpSLgn
         Nxtrf1xvhvtasGyQmYvJ+4K1HFeJVakAcsaf2YphGOKEdmIxyT1VjbJbAzXVPaNPPL4h
         izlqO/KA3+V3XZG+sZNMeH7eov/APDXg9Fyaol9YtOXtGqCQ4zR3fqtNgpXl3ScM/eJX
         q2JkcfPL1k3dRFxsk1x/EmrXaDA2tYLwqC3uhpbM79WUT4nZ2oe8mVZ3GZvCATD4Bv98
         Wcv5Aey9v/qAmtSdUtTaS5Ot2vLAw+Hf80sIccRHbcKQYuGVfhiueEAyuE8KkJRmj7D6
         27YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794125029; x=1794729829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JOX77fus2x/eG1WoZO3OzTindRAi1WdAyfHFy3V4a8g=;
        b=b3t8tZz6rwhXbuhrXi4ltPg5s3+ptZv/T8CUr+QhAbYJtxxsXeOoIivIxecOCgG+xd
         bsnIlctPBiHWSrHRnYWRNHDI5j+mTM2sEdYWwZHeVRqHghYc/4wRI9FizWtr+wmUfYEH
         NDzV5NpTBY6V8KwOyz9J//fxK1UXWc+wlOgAbcihXcBIBwjZ3uJknK0UoMCAahsLQzQk
         tgoYAf9xIXckkGOwQ9rVkA6CCh/RtF7Mk2ffb8kifUmS7BMPWWhYbb5DH/LtYfI2vvim
         xtDjw6olaXhE4b2ugq51nXWydasuwsl0jznfkxjkl3zviGo7GsYFX7pTZRIVGNYfWXRR
         ppAw==
X-Forwarded-Encrypted: i=1; AL+hErFIAF3j/6jvRyPzeVfjdQssQDqv5KTMDC6g4lxagQlduTQn+l5/biyo6fxs+IHM76TRo6zal3I7rnJBqpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yPNiiwPodfZdRQW8PxqFfEcYUI2mj9B7VuRM853zu4xHXaikj
	yqhZ268+niLoVvN86QflI5JA/nIOXf2puo9DaOaO+mL7iLx8oB8Ogori
X-Gm-Gg: AYBFou1pYYbZUzkxG0ItFCYyrC4Nj3FD1oOdxG1t0A1OLxrAOPdpguZoMSdb2u2e4rL
	iAD+A/xduFTVp3OFhAlO73RmwyWvM4Mg6pxU1bvKWBRWshQBz3Qh9YH/VIpeT5V6nBJgkXM6T3A
	AnfahAefmLwueSyV8GPwfNenRN+h0b806H2CAvh3fbpPG35eo33V16+yVmCR8yAjVmdpPiyMHD/
	u4ALVR+/7iO7cHBTevpNnx4/OIY/4/5bNVKLU+x3RV8Jwicwjv1hG6KFM6+F3zRwuDMP+/VX83d
	Ldv0+qvCfBjJfTXAmrPBcQe3Aa+RcSaZELA4Xu8/B0goV354QJBQqdy+yvTEFyFM/H1fTrlaRHe
	tvfDbrEFZo11H3bV+0o4ChilHxmTdEzQj2o7GSpAgCtJq2V1XD+lxJuwNuFRIiuDmSwBZJ8Jtm/
	e8tX8G1gTw9c5rXoXwNDx4q5f9CARzlFQZS/tbH7/a/RXQktpVF+Q/lao5UzlMOOHODeHcF1zWm
	Z7nikAs74GsaoA1w/nThdCwIGjZBOB1mAaiEVTWMcHw/TB6X6liWmM4nSxes2yqfSHZn2gFb7Ur
	KhXLYw1lLctW6262R5ApygQ0odV7dOC9eHkE5y4KeOwPV2SdWIgaRqAnmD/SU2G8gw==
X-Received: by 2002:a05:701b:2616:b0:149:50cb:2175 with SMTP id a92af1059eb24-1b39fef4a85mr1364346c88.33.1794125029163;
        Sun, 08 Nov 2026 00:03:49 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b375604109sm4681740c88.10.2026.11.08.00.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 00:03:48 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wahid Khan <wahidzk0091@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v4] ntfs: convert a named $DATA stream safely when making room in a record
Date: Sun,  8 Nov 2026 13:33:23 +0530
Message-ID: <20261108080323.468892-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
References: <CAKYAXd-68oCuAU=x0TV6BMsNJZkmBcdVZTtOQXh3iEm6BptJSg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an attribute has to grow and the mft record is full,
ntfs_resident_attr_resize() walks the other resident attributes and
converts them to non-resident ones. For $DATA it always opens the
unnamed data inode of the base inode, even if the attribute found is a
named stream:

  tvi = ntfs_iget(sb, base_ni->mft_no);
  ntfs_attr_make_non_resident(NTFS_I(tvi), value_len);

value_len is the length of the stream, so it does not match the
attribute that ntfs_attr_make_non_resident() looks up for the unnamed
inode, and the WARN_ON() on entry fires:

  WARNING: fs/ntfs/attrib.c:2115 at ntfs_attr_make_non_resident
   ntfs_resident_attr_resize
   ntfs_attr_expand_locked
   ntfs_expand_for_write
   ntfs_file_write_iter
   vfs_write

It does not need a damaged volume. A file with an alternate data stream
whose record has no room left is enough.

Open a named stream by name with ntfs_attr_iget(), as is done for the
other attribute types in this loop, and keep ntfs_iget() for the
unnamed one. The loop runs with the mft record lock held and takes no
lock of the stream inode, so converting a stream from here needs more
care than the plain lookup gives:

- A reader of the stream holds the folio lock and then takes the mft
  record lock in ntfs_read_iomap_begin_resident(), the conversion takes
  them the other way round and waits for folio 0. Take the folio with
  FGP_NOWAIT in this loop and skip the attribute if it is busy. The loop
  only tries to free space.

- A stream that is in the inode cache can be open, being written, being
  removed or already unlinked. A write that passed its residency check
  before the conversion carries on with a non-resident attribute, and
  a stream in the middle of ntfs_stream_finish_remove() is converted
  under its feet. Convert only a stream that is not cached, and none of
  a file that is being deleted or has no links left.

- The lookup of a stream ignores case, so a stream whose name differs
  only in case from an earlier one resolves to that one and the length
  does not match again. Compare the names exactly.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
v4: v3 (convert a named stream via ntfs_attr_iget()) can deadlock against
    a reader of the stream and has other races with an open or removed
    stream. Each is reproduced with a forced make-room pass and a debug
    delay, fails on v3 and passes here: reader/converter deadlock
    (hung task), write continuing on a converted attribute (iomap_iter
    WARNINGs, recursive locking), unlinked file with an open stream (mft
    record reported corrupt), stream converted during its own removal,
    and a stream pair that differs only in case (WARN in
    ntfs_attr_make_non_resident).
v3: use ntfs_attr_iget() for a named stream instead of skipping it (v2).

 fs/ntfs/attrib.c | 57 +++++++++++++++++++++++++++++++++++++++++-------
 fs/ntfs/inode.c  | 19 ++++++++++++++++
 fs/ntfs/inode.h  |  2 ++
 3 files changed, 70 insertions(+), 8 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index ce7c1b524180..c824bd3ea9fa 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -1975,7 +1975,21 @@ int ntfs_resident_attr_value_resize(struct mft_record *m, struct attr_record *a,
  * inode i_size is that this is not necessarily uptodate.  This happens when
  * ntfs_attr_make_non_resident() is called in the ->truncate call path(s).
  */
+static int __ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size,
+		bool nowait);
+
 int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
+{
+	return __ntfs_attr_make_non_resident(ni, data_size, false);
+}
+
+/*
+ * With @nowait the folio lock is only tried: a caller that holds mrec_lock
+ * must not wait for a folio lock, the read path takes them the other way
+ * round. Fails with -EAGAIN if the folio is locked.
+ */
+static int __ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size,
+		bool nowait)
 {
 	s64 new_size;
 	struct inode *vi = VFS_I(ni);
@@ -2056,10 +2070,11 @@ int ntfs_attr_make_non_resident(struct ntfs_inode *ni, const u32 data_size)
 		 * outside all ntfs locks, we need to get the folio now.
 		 */
 		folio = __filemap_get_folio(vi->i_mapping, 0,
-					    FGP_CREAT | FGP_LOCK,
+					    FGP_CREAT | FGP_LOCK |
+					    (nowait ? FGP_NOWAIT : 0),
 					    mapping_gfp_mask(vi->i_mapping));
 		if (IS_ERR(folio)) {
-			err = -ENOMEM;
+			err = nowait ? -EAGAIN : -ENOMEM;
 			goto err_out;
 		}
 
@@ -4933,18 +4948,44 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 		if (a->type == AT_DATA && !value_len)
 			continue;
 
-		if (a->type == AT_DATA)
+		if (a->type == AT_DATA && !a->name_length) {
 			tvi = ntfs_iget(sb, base_ni->mft_no);
-		else
-			tvi = ntfs_attr_iget(VFS_I(base_ni), a->type,
-				(__le16 *)((u8 *)a + le16_to_cpu(a->name_offset)),
-				a->name_length);
+		} else {
+			__le16 *name = (__le16 *)((u8 *)a +
+					le16_to_cpu(a->name_offset));
+
+			/*
+			 * A named $DATA stream is converted only if nobody has
+			 * it open: an open one can be unlinked, being removed
+			 * or in use. Its file must not be going away either.
+			 */
+			if (a->type == AT_DATA) {
+				if (NInoBeingDeleted(base_ni) ||
+				    !VFS_I(base_ni)->i_nlink)
+					continue;
+				tvi = ntfs_attr_ilookup(VFS_I(base_ni), a->type,
+						name, a->name_length);
+				if (tvi) {
+					iput(tvi);
+					continue;
+				}
+			}
+			tvi = ntfs_attr_iget(VFS_I(base_ni), a->type, name,
+					a->name_length);
+			/* the lookup ignores case for streams, ours does not */
+			if (!IS_ERR(tvi) && a->type == AT_DATA &&
+			    memcmp(NTFS_I(tvi)->name, name,
+				   a->name_length * sizeof(__le16))) {
+				iput(tvi);
+				continue;
+			}
+		}
 		if (IS_ERR(tvi)) {
 			ntfs_error(sb, "Couldn't open attribute");
 			continue;
 		}
 
-		if (ntfs_attr_make_non_resident(NTFS_I(tvi), value_len)) {
+		if (__ntfs_attr_make_non_resident(NTFS_I(tvi), value_len, true)) {
 			iput(tvi);
 			continue;
 		}
diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index 62dd5bd5bb81..ec9c7b219192 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -287,6 +287,25 @@ struct inode *ntfs_attr_iget(struct inode *base_vi, __le32 type,
 	return vi;
 }
 
+/*
+ * ntfs_attr_ilookup - find an attribute inode that is already in the cache
+ *
+ * Like ntfs_attr_iget() but never reads anything. Returns the inode with an
+ * increased reference count, or NULL if it is not cached.
+ */
+struct inode *ntfs_attr_ilookup(struct inode *base_vi, __le32 type,
+		__le16 *name, u32 name_len)
+{
+	struct ntfs_attr na = {
+		.mft_no = base_vi->i_ino,
+		.type = type,
+		.name = name,
+		.name_len = name_len,
+	};
+
+	return ilookup5(base_vi->i_sb, na.mft_no, ntfs_test_inode, &na);
+}
+
 /*
  * ntfs_index_iget - obtain a struct inode corresponding to an index
  * @base_vi:	vfs base inode containing the index related attributes
diff --git a/fs/ntfs/inode.h b/fs/ntfs/inode.h
index a18cbcf1c631..7ea52c59c04b 100644
--- a/fs/ntfs/inode.h
+++ b/fs/ntfs/inode.h
@@ -326,6 +326,8 @@ struct ntfs_attr {
 int ntfs_test_inode(struct inode *vi, void *data);
 int ntfs_test_inode_rcu(struct inode *vi, void *data);
 struct inode *ntfs_iget(struct super_block *sb, u64 mft_no);
+struct inode *ntfs_attr_ilookup(struct inode *base_vi, __le32 type,
+		__le16 *name, u32 name_len);
 struct inode *ntfs_attr_iget(struct inode *base_vi, __le32 type,
 		__le16 *name, u32 name_len);
 struct inode *ntfs_index_iget(struct inode *base_vi, __le16 *name,
-- 
2.56.0

