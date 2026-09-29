Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F455221CE
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684731; cv=none; b=bYoimAbYY3yE/Xrf6bFHoUGdnHmpEAxKYMrICl/V62F9xbrTgPE8hZDpzGmUXIF8sqoNDpmGt4uWftNEidy1nN8Mq5Fmn8StE82rxjBAxYsib3JRXsJT1Vl+sQHtCRS74i3uropzr8tLzY3qIr1zXbxMq81NiI3H8LAERWAWozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684731; c=relaxed/simple;
	bh=Pj6KvNqBjDZrYnWKrO2uDDAWtlmglraWFZNgjyxk/Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iXsg5VeMzWn4yqUS1Ywv0S4wuXaFotOpL0RCoH7Vxw3ceoGZZhfewQmu43QXApvslw1DM8EgzIq/5rX5nZsDNakS70vrgceiQ+AXq+eyqyX1ItOp8GNQGL8RsAhcF55MvVu2zCknudkgNruk3wRVq92hWYx4p3Adu8Jyc3oAuzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C2AIWsch; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C2AIWsch"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a48e359e0fso796566a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790684729; x=1791289529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JwHhpjVu6BlRKWyBSGHgYpAs9nS3uWumWH8uIhfw3wA=;
        b=C2AIWschWmL7gndlMRM88JryybRhr/eo+10Qzd0O4zvXc6RRxfH67ed13X8YKRraep
         i1MD2aMrHxPqN1XysEbVCyWKit+kcIquw/Q46XJzlIsjbzDNsJL+k4HxJ1QJWcmuKs8J
         isPoNn4MBJL/gzBkSWCGB3SOYclAK6gTaDw88KnOhLcgA4vBv1hpWpLg1nuDaXZcQtkL
         EDlaufoXhF6d7Z3xan5LlvQhrkI58qS3ETdZUp5U5RlP48DrMyPcwxXuQtMWoWt90Xum
         crkDYFNtYAlT+nslV4TESnbIhRnv99l6jziOAkjcDojPu9v9xyLMs781pvagGIk9W6f5
         WOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684729; x=1791289529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JwHhpjVu6BlRKWyBSGHgYpAs9nS3uWumWH8uIhfw3wA=;
        b=vJHDytV0pg/nkxCgNQBmhYArUUbrEheWaX9ip+lt2/K1YERZzp7AO+D0jyJfq5UeyF
         47UJ1776M7+wQMhu+WAWVFqQ/2d7S3KtaVtY0f1wgw/uv8yHw0Ykb6X6pp5aMasVcsZm
         +cxz5T/bololLImr9IJoS8OFwOHwKz0gNxrAgFtaEBToYwyw3NAFM4zwc0P93TR4A5q6
         hByPao1EocXKjktVxFWA+6i55/hajTaRs/Y7mbr77B+9QwGo4BvxoxsIvM3QJTANbRn0
         Iops+BArgrfjpiY9coEPW57eZLu2f7EF4Q3SOmdGMR5D8mgiUrDk0jH9og1SXlhNIP1N
         g9sQ==
X-Forwarded-Encrypted: i=1; AKwUvByjJig06Eu5nlk4QdDsSKObM7Qd636uQgoxaMKDVWHgalNhPhuc7BA/Nrv7+YYlscPlm+sqb6oPz8VCsvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLY79dpdLJbncRHio305MB+yJBHP6ECr37sTsg97BOkDI8ivd2y
	Gc4frFSpGapDEfpHsW1J4RBMQ1yvYvbM4jn1TRbxkVxd6J7+5miMR0B5ps2pN1dp
X-Gm-Gg: AYBFou2kXyzIivVrxwYgUfkOb9Rh8Kr/+1qLScoCED3y35WeblLdPDs5QNIR8xE4WyQ
	zEjxkjmDSjcs6gU+Gax+LX/ypdOhY9Wyeg8oL0nMCqXmPQcosXUIHtsaGeWUJV/YByXsKnD/f2w
	ePaBzQXh5RoUKf2pNfyI/18gs9idYw913JHj0g8WOcxoeJ8/8RKTxDWkvQvYLo4q4M0wIZw8sLL
	EDV6B5WbIrKV70xO8OsZRVn1K/+CBGCJdaLSOdfjz1bl67SO71Ir7NW95yyw0dPbVN+u6KoVtQT
	IPT5/xWjtzf+XJFYdZDDeIlRuX1P6vWCsTxI2iYWSsAL1xjlt3IfDGU8jrSoc603X55qbrGZdF0
	zW5DaSyA91EQVKhDzQ/CRlve3lJbqMHmnL3AtA+TKv5PXVio7QZWb2m9t1LVHu7UlZ26v0FdrBz
	PyT92FyjvOOzP37kM0EnNFSzL/qpdai40yxxeBEU0xejkmaDr/+EoDD3rLcpRXiPlgFm96
X-Received: by 2002:a17:90b:2e4e:b0:3a0:a515:c450 with SMTP id 98e67ed59e1d1-3a0a515c806mr12143744a91.27.1790684728865;
        Tue, 29 Sep 2026 05:25:28 -0700 (PDT)
Received: from gmail.com ([111.55.96.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497ebd6b0sm5442941a91.1.2026.09.29.05.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:25:28 -0700 (PDT)
From: Xue Boyang <fuchen.dust@gmail.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xue Boyang <fuchen.dust@gmail.com>
Subject: [PATCH ntfs] fs/ntfs3: fix slab-out-of-bounds write in index buffer replay
Date: Tue, 29 Sep 2026 07:25:00 -0500
Message-ID: <20260929122500.362486-1-fuchen.dust@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During $LogFile replay, the allocation-op preamble in do_action()
computes the buffer size as:

	bytes = max(oe->bytes_per_index, lcns_follow << cluster_bits);
	bytes += roff;
	bytes = ALIGN(bytes, 512);
	buffer_le = kmalloc(bytes, GFP_NOFS);

and then sets ib = buffer_le + roff, so the index buffer starts roff
bytes into the allocation.  However, all six allocation cases pass the
FULL allocation size to check_index_buffer() and
ntfs_fix_pre_write() instead of the space actually available behind ib
(bytes - roff):

	check_index_buffer(ib, bytes)       // validates entries up to ib+bytes
	ntfs_fix_pre_write(&ib->rhdr, bytes) // writes fixups up to ib+bytes-2

This lets check_index_buffer() approve entries that extend roff bytes
past the end of the kmalloc() allocation, and makes
ntfs_fix_pre_write() write the last USA fixup at ib + bytes - 2, which
is roff - 2 bytes past the allocation.

Reproduced deterministically on rw mount of a crafted $LogFile with
oe->bytes_per_index = 2560 and record_off = 1536 (bytes = 4096,
ib = buffer_le + 1536, available = 2560).  The USA fixup write at
ib + 4094 = buffer_le + 5630 runs 1534 bytes past the 4096-byte
allocation:

  BUG: KASAN: slab-out-of-bounds in ntfs_fix_pre_write+0xb4/0x100
  Read of size 2 at addr ffff8880044891fe by task mount/70
   ...
   ntfs_fix_pre_write+0xb4/0x100
   do_action+0x1c67/0x1e09
   log_replay (fs/ntfs3/fslog.c)
   ntfs_loadlog_and_replay+0x2cb/0x300
   ntfs_fill_super+0x1375/0x22d0
   ...

Pass bytes - roff (the space behind ib) to both functions, matching
the intended semantics when roff is nonzero.  With roff = 0 the
argument is unchanged.

Fixes: b46acd6a6a62 ("fs/ntfs3: Add NTFS journal")
Assisted-by: GLM:zhipu-coding-plan/glm-5.3
Signed-off-by: Xue Boyang <fuchen.dust@gmail.com>
---
 fs/ntfs3/fslog.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/ntfs3/fslog.c b/fs/ntfs3/fslog.c
index ba61767cab3f..4b83a21532a3 100644
--- a/fs/ntfs3/fslog.c
+++ b/fs/ntfs3/fslog.c
@@ -3624,7 +3624,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		used = le32_to_cpu(hdr->used);
 
-		if (!check_index_buffer(ib, bytes) ||
+		if (!check_index_buffer(ib, bytes - roff) ||
 		    !check_if_alloc_index(hdr, aoff) ||
 		    Add2Ptr(e, esize) > Add2Ptr(lrh, rec_len) ||
 		    used + esize > le32_to_cpu(hdr->total)) {
@@ -3639,7 +3639,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		a_dirty = true;
 
-		ntfs_fix_pre_write(&ib->rhdr, bytes);
+		ntfs_fix_pre_write(&ib->rhdr, bytes - roff);
 		break;
 
 	case DeleteIndexEntryAllocation:
@@ -3653,7 +3653,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		if (!check_lsn(&ib->rhdr, rlsn))
 			goto out;
 
-		if (!check_index_buffer(ib, bytes) ||
+		if (!check_index_buffer(ib, bytes - roff) ||
 		    !check_if_alloc_index(hdr, aoff)) {
 			goto dirty_vol;
 		}
@@ -3682,7 +3682,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		a_dirty = true;
 
-		ntfs_fix_pre_write(&ib->rhdr, bytes);
+		ntfs_fix_pre_write(&ib->rhdr, bytes - roff);
 		break;
 
 	case WriteEndOfIndexBuffer:
@@ -3694,7 +3694,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 			goto dirty_vol;
 		if (!check_lsn(&ib->rhdr, rlsn))
 			goto out;
-		if (!check_index_buffer(ib, bytes) ||
+		if (!check_index_buffer(ib, bytes - roff) ||
 		    !check_if_alloc_index(hdr, aoff) ||
 		    aoff + dlen > offsetof(struct INDEX_BUFFER, ihdr) +
 					  le32_to_cpu(hdr->total)) {
@@ -3705,7 +3705,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		memmove(e, data, dlen);
 
 		a_dirty = true;
-		ntfs_fix_pre_write(&ib->rhdr, bytes);
+		ntfs_fix_pre_write(&ib->rhdr, bytes - roff);
 		break;
 
 	case SetIndexEntryVcnAllocation:
@@ -3718,7 +3718,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		if (!check_lsn(&ib->rhdr, rlsn))
 			goto out;
-		if (!check_index_buffer(ib, bytes) ||
+		if (!check_index_buffer(ib, bytes - roff) ||
 		    !check_if_alloc_index(hdr, aoff)) {
 			goto dirty_vol;
 		}
@@ -3726,7 +3726,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		de_set_vbn_le(e, *(__le64 *)data);
 
 		a_dirty = true;
-		ntfs_fix_pre_write(&ib->rhdr, bytes);
+		ntfs_fix_pre_write(&ib->rhdr, bytes - roff);
 		break;
 
 	case UpdateFileNameAllocation:
@@ -3739,7 +3739,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		if (!check_lsn(&ib->rhdr, rlsn))
 			goto out;
-		if (!check_index_buffer(ib, bytes) ||
+		if (!check_index_buffer(ib, bytes - roff) ||
 		    !check_if_alloc_index(hdr, aoff)) {
 			goto dirty_vol;
 		}
@@ -3750,7 +3750,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		memmove(&fname->dup, data, sizeof(fname->dup));
 
 		a_dirty = true;
-		ntfs_fix_pre_write(&ib->rhdr, bytes);
+		ntfs_fix_pre_write(&ib->rhdr, bytes - roff);
 		break;
 
 	case SetBitsInNonresidentBitMap:
@@ -3789,7 +3789,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 
 		if (!check_lsn(&ib->rhdr, rlsn))
 			goto out;
-		if (!check_index_buffer(ib, bytes) ||
+		if (!check_index_buffer(ib, bytes - roff) ||
 		    !check_if_alloc_index(hdr, aoff)) {
 			goto dirty_vol;
 		}
@@ -3802,7 +3802,7 @@ static int do_action(struct ntfs_log *log, struct OPEN_ATTR_ENRTY *oe,
 		memmove(Add2Ptr(e, le16_to_cpu(e->view.data_off)), data, dlen);
 
 		a_dirty = true;
-		ntfs_fix_pre_write(&ib->rhdr, bytes);
+		ntfs_fix_pre_write(&ib->rhdr, bytes - roff);
 		break;
 
 	default:
-- 
2.53.0

