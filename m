Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234280;
	b=q15vinJEDN1Il9A/q39CqtDrmJuK0zIKudj0vaaAAD3OsoFzmODHR302IIyYxKKldGw8
	 cMcZLticutcsnp5pDjWkXf6KIGDbo9GiQTyyIMnSNOZO2zvwggHBh8o1O/ruusI3KU+PJ
	 RiYCIFsXuFDwda7Th2aryf/7ly0wvbBEnAdDqTWBzb8eWYllVH5X4BDaYDI4fEbZ4E6yk
	 /798mmF+UaIKNoCg7AdzwX/TdPU4vwbP51Jkb5cylU0RSLjk6dHrEVp9HT+1kJ+j3XYD6
	 3XSsh1+bcqXc+KeICdCKrK4+xzb8TBRn2SNnKr0ZwCrrPGunarH7Y+whizOvA+zIp0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GYwROHOccG909lDTerjz3ghhZicoce+fR4uHFfH1Z+w=;
	b=sywvC3C/X4d9OjPtEN0nliSn85OwEYTHAtlzUcbph2gFuEgK4TOwidB/sqelRNYXb5Ys
	 IWNR+n3uVQozueWtcOuRhzNhjtKVft+4ABq1cyyn5zCepVeHH3FgnTGzysgAsXkWhTKdB
	 wl0CAhxh9p8HPN1zJjnChIk4zEs14wrILeLASDG4/D4mLnSMfOii54qKfTGyj2z0fzV0x
	 FuTTFGuXKaMZg+o2UfPtPKHO5QszX2F33jNbC9w6g7firbNUmFchDp+EPRDsWEw4WICrM
	 0Hi9/DFJJMQCMtAYnyun26Qi8d2Npp3mnDV4YDaDZ3nPY3u12ogLsSyap+zJo9sXNpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hd+OS/8x";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1135606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1135606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hd+OS/8x
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a8cc11ac42so722473c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794234279; x=1794839079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GYwROHOccG909lDTerjz3ghhZicoce+fR4uHFfH1Z+w=;
        b=hd+OS/8xH7+jGGw/f1ZW5oe+jTgQo1mcZTAmf5zkY9B6T0DkNRW7jIE76CVt9YKqPr
         +bfKKw3cDCZ+vZbvMepEwR9OqgdTiFck2q4FfAlhimejJZdyHgSfdOl4CwO4h9L5KcZf
         ie21AHSV5G1GPelUph9A7OHvFd/QggFbOpPOSKyMnCxVDK/06mPqnThAsVzL3od6aL5V
         SbjkhpGAKi8apdhO0UjT49Nbr/YttFEZM9Lf8jjLGo5SFHiOl/JVRxKbw55ptg2w+5NC
         NY3CD+pKIgDitLyANGs9BrUjXsz9A1oz84VAcf8mWtoJ8Y6J9IMseR6RQjQfzOIarcUo
         H6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234279; x=1794839079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GYwROHOccG909lDTerjz3ghhZicoce+fR4uHFfH1Z+w=;
        b=kMTrAnl1WvgTTXunZY8FhmRdUghxf0Rw9VGluaHbtM8Vk45/rlnfboEZ2Thda5fTZR
         7SmFVH7mJPbdM6KXA7/71h89zlYuybWpSWSzPYo2UWbvYeWdaBHfjve+QSxIvEQrhEEd
         IWMewuaw16TyE4Fh77PQRyGXVfM85bCaxDH9ExZ05L88gloIQh1Oi7k6L7HQ93m86HBj
         Hz7y9E7wXgUbMpqv7vZPlN//icKQmo8a2gM4krpL7nWa9XivZu3RgJLr0NUsTHDGKtfd
         EIhJkTH4zeJ9DRgBp4dH/ZusP3UabTB5GWG6oQFaK4FpwssxwT3DAG/f1uw33gyQ8zdx
         GC7A==
X-Forwarded-Encrypted: i=1; AL+hErEQst45mZbhpXKgUIbxQg7EHs6OOvwQpV7sN8cuh3L8ri/Fy52K0aT7VieWTYDzWuss5gZdRlStgQZdfO0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zRLTeVgrwhjkkmh2XJUhohvUOr0Qk4Ouy8cAerdkUfv4a8tJQ
	dUDlgUzthTU+FqlEckUXyTcDpRxnsBobVQQ9woV+MNgGVhLHSnC/ByTC
X-Gm-Gg: AYBFou3FXP4jKHoREzbBb9pIgLbq6NuelGXgB4/tqx0oZhnpLbVqsd0EQTG5e8WjwkH
	h4oUR5Yz++gY1cbogVmiDk4V33APaL1wOudJNFDpNVeBMNMvK+YsS7yPd9od+/9Ep7ZqEjjODkb
	Og85W5Rt8XRAodtn8CJ11KRXlALjeyNWimnT3tESnnf+Va8KGBRm6eyYPwbtrgWGwLsB1v5qADd
	n7JS1wyZWo3rGjiwSwqc2q5uH3gwW6URcg0kG+384DxQe4Iz/JFiMbVskiOw9NFfj4KMjOw0EaG
	vNp+7OqCB/TYaTyxyIlqjiwVu1dfMDLrD6QyUoTgy1LRx2BpS0HDv7NCrlOM6AhAknXnnWu5CDJ
	/LXvyO/esUMzeME9RRveEv3p+9z5gSYtNPU4Y1BfKgSIsl2ExDV2TLW5NPj9u1LKtg8sRvjunod
	EktFOHE/gMHvYRkRyBdfEOFRWS43iwQhlh08xSXbbi5FjjDugAJFihz5/CLTD+pnMyiEfmQ+3Zm
	ywwiJnlkcFC9Fv/h8F9i99gAmLFnu98/eGg15/pCdP+ZzhOUgczVN2nCWTe52gqd69ur2xKzvQM
	3UN24ZOs7K9d5JnHv0obqU2hUQEpg1/DOd3mK6KCgfCwDFTqyTdLBlr7aX0xNX+esw==
X-Received: by 2002:a05:701b:4594:10b0:1a8:9857:2102 with SMTP id a92af1059eb24-1b39febb1bdmr5985420c88.30.1794234278454;
        Mon, 09 Nov 2026 06:24:38 -0800 (PST)
Received: from anon-laptop ([103.187.196.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771f0e0fsm19324404c88.20.2026.11.09.06.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:24:37 -0800 (PST)
From: Wahid Khan <wahidzk0091@gmail.com>
To: linkinjeon@kernel.org
Cc: hyc.lee@gmail.com,
	ntfs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v7] ntfs: convert a named $DATA stream safely when making room in a record
Date: Mon,  9 Nov 2026 19:54:29 +0530
Message-ID: <20261109142429.1741882-1-wahidzk0091@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109070704.1430784-1-wahidzk0091@gmail.com>
References: <20261109070704.1430784-1-wahidzk0091@gmail.com>
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
  only tries to free space. The same inversion exists for the conversion
  of the attribute being resized, which waited for folio 0 with the lock
  held and hangs against an mmap fault or splice reader. Use FGP_NOWAIT
  there too. The resize then fails with -ENOSPC while such a reader is
  stuck on the lock, instead of hanging. If the attribute cannot be
  resident at the new size anyway, the loop cannot help it, so fail
  right away instead of converting other attributes for nothing.

- A stream that is in the inode cache can be open, being written, being
  removed or already unlinked. A write that passed its residency check
  before the conversion carries on with a non-resident attribute, and
  a stream in the middle of ntfs_stream_finish_remove() is converted
  under its feet. Convert only a stream that is not cached.

- An attribute inode of a file that has no links left is evicted on the
  last iput() with its dirty folio, so what was converted is lost and
  an open file reads its extended attributes back as missing. Convert
  nothing, of any type, in a file that is being deleted or has no links
  left.

- The unnamed data is converted through the file's own inode, whose
  i_rwsem only a resize of the unnamed data itself holds. When a stream
  or an extended attribute is being resized, a writer of the file can
  have passed its residency check and carry on with a non-resident
  attribute (iomap_iter warnings, recursive mrec_lock). When the
  unnamed data is the attribute being resized, its conversion was just
  tried by the caller. Do not convert the unnamed data from this loop.

- Do not convert the attribute that is being resized either. Its
  conversion was just tried and failed, for instance on a busy folio,
  and a second try that succeeds leaves the resize to go on with the
  resident layout of a record that is now non-resident.

- The lookup of a stream ignores case, so a stream whose name differs
  only in case from an earlier one resolves to that one and the length
  does not match again. Compare the names exactly.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Wahid Khan <wahidzk0091@gmail.com>
---
v7: Sashiko's review of v6: when the resized attribute cannot be resident
    at the new size (newsize >= mft record size), a busy folio (-EAGAIN,
    mapped to -ENOSPC) still ran the make-room loop and converted the other
    streams before the resize failed with -ENOSPC anyway. Reproduced with a
    forced -EAGAIN (setxattr of 1500 bytes fails, two streams converted),
    fixed: the resize fails right away and nothing is converted.
v6: Sashiko's review of v5: when the conversion of the resized attribute
    returns -EAGAIN (busy folio) and is mapped to -ENOSPC, the loop could
    reach that attribute itself, convert it and resize its record as if it
    were resident. Reproduced with one forced -EAGAIN (the EA is lost, the
    resize fails with -EINVAL), fixed: the attribute being resized is never
    converted from the loop, and neither is the unnamed data (its branch
    was dead code once that is skipped).
v5: Sashiko's review of v4 found more, each reproduced with a forced make-room
    pass and a debug delay, fails before and passes after:
    - the WofCompressedData stream of a WOF file was converted, and the
      file read stale clusters until writeback (249 of 250 bytes wrong)
    - an attribute converted in a file with no links left was evicted
      with its dirty folio (open file reads its EA back as missing)
    - a resize of a stream converted the unnamed data under a writer of
      the file (iomap_iter WARNs, recursive mrec_lock)
    - the conversion of the resized attribute itself waited for folio 0
      with mrec_lock held (hung task against mmap fault and splice)
    The six v4 scenarios still pass.
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
 fs/ntfs/attrib.c | 94 ++++++++++++++++++++++++++++++++++++++++++------
 fs/ntfs/inode.c  | 19 ++++++++++
 fs/ntfs/inode.h  |  2 ++
 3 files changed, 105 insertions(+), 10 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index ce7c1b524180..f6d6bf9007b1 100644
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
 
@@ -4895,8 +4910,18 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 	/* There is not enough space in the mft record to perform the resize. */
 
 	/* Make the attribute non-resident if possible. */
-	err = ntfs_attr_make_non_resident(attr_ni,
-			le32_to_cpu(ctx->attr->data.resident.value_length));
+	err = __ntfs_attr_make_non_resident(attr_ni,
+			le32_to_cpu(ctx->attr->data.resident.value_length), true);
+	/*
+	 * A reader holding folio 0 waits for mrec_lock, which we hold. Do not
+	 * wait for it, try to make room some other way. That cannot help if
+	 * the attribute can not be resident at the new size anyway.
+	 */
+	if (err == -EAGAIN) {
+		err = -ENOSPC;
+		if (newsize >= vol->mft_record_size)
+			goto put_err_out;
+	}
 	if (!err) {
 		mark_mft_record_dirty(ctx->ntfs_ino);
 		ntfs_attr_put_search_ctx(ctx);
@@ -4913,12 +4938,14 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 	while (!(err = ntfs_attr_lookup(AT_UNUSED, NULL, 0, 0, 0, NULL, 0, ctx))) {
 		struct inode *tvi;
 		struct attr_record *a;
+		__le16 *name;
 		u32 value_len;
 
 		a = ctx->attr;
 		if (a->non_resident || a->type == AT_ATTRIBUTE_LIST)
 			continue;
 		value_len = le32_to_cpu(a->data.resident.value_length);
+		name = (__le16 *)((u8 *)a + le16_to_cpu(a->name_offset));
 
 		if (ntfs_attr_can_be_non_resident(vol, a->type))
 			continue;
@@ -4933,18 +4960,65 @@ static int ntfs_resident_attr_resize(struct ntfs_inode *attr_ni, const s64 newsi
 		if (a->type == AT_DATA && !value_len)
 			continue;
 
-		if (a->type == AT_DATA)
-			tvi = ntfs_iget(sb, base_ni->mft_no);
-		else
-			tvi = ntfs_attr_iget(VFS_I(base_ni), a->type,
-				(__le16 *)((u8 *)a + le16_to_cpu(a->name_offset)),
+		/*
+		 * The attribute inode of an unlinked file is evicted on the
+		 * last iput() together with its dirty folio.
+		 */
+		if (NInoBeingDeleted(base_ni) || !VFS_I(base_ni)->i_nlink)
+			continue;
+
+		/*
+		 * Not the attribute being resized. Its conversion was tried
+		 * above and failed, for instance on a busy folio, and
+		 * converting it here would leave the resize to go on with the
+		 * resident layout of a non-resident record.
+		 */
+		if (a->type == attr_ni->type &&
+		    a->name_length == attr_ni->name_len &&
+		    (!a->name_length ||
+		     !memcmp(name, attr_ni->name,
+			     a->name_length * sizeof(__le16))))
+			continue;
+
+		/*
+		 * Not the unnamed data either. Only the resize of the unnamed
+		 * data itself holds its i_rwsem, a writer of the file can be
+		 * between its residency check and the mft record lock.
+		 */
+		if (a->type == AT_DATA && !a->name_length)
+			continue;
+
+		/*
+		 * A named $DATA stream is converted only if nobody has it open:
+		 * an open one can be unlinked, being removed or in use. A WOF
+		 * file reads its stream from the device, so the stream must
+		 * stay resident.
+		 */
+		if (a->type == AT_DATA) {
+			if (NInoWofCompressed(base_ni))
+				continue;
+			tvi = ntfs_attr_ilookup(VFS_I(base_ni), a->type,
+					name, a->name_length);
+			if (tvi) {
+				iput(tvi);
+				continue;
+			}
+		}
+		tvi = ntfs_attr_iget(VFS_I(base_ni), a->type, name,
 				a->name_length);
+		/* the lookup ignores case for streams, ours does not */
+		if (!IS_ERR(tvi) && a->type == AT_DATA &&
+		    memcmp(NTFS_I(tvi)->name, name,
+			   a->name_length * sizeof(__le16))) {
+			iput(tvi);
+			continue;
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

