Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794804350;
	b=dr0iZ1pE9VVn/BlQJoYk5sDvq783cQzIQhntwn0mY/XryqUxcotQ3r8zym5x4f7mjYrc
	 eF4i9VWPdXY9cwETz3dmgos/ZSJJosvfqvPhoL/BOAhxdunwpvJ6fYAsFTXJdAhXZ/1SF
	 /pDpynLgXPLoEpaut4vvIGwq8LjeQBxEyjVaHJmqf9dmcT+xeXOCqxsMV4nJCuJ3iCuvo
	 rK9s5q5T59uC3zKrWS/wPXhzP+yRwv71OX4HRgq4qgZgMCbLA+6krxWg9OZkv80NRnWGi
	 xIFTm7yFVidE2NWhfGwb5c4Ahux7iIQVufPQ9pNX+SxNJnuBdmVBEgz/Z/0X31wTRmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=UGuM+GPpkioXjAM+mOf4pqTWILy+sZBNY2NJm0f6pw8=;
	b=GQzutKqls3jGLlToRmliXG+0JXTUv8EKt9jUlY8Iq5WBNvMykOOPLEuV4352MHu6hWOw
	 avvdK/EHxifoXj8CuuFeDRaj42xzc5+Oxq8oUK+sTse7CM1ZTvtKyDxno0t8yDgSn7YiS
	 vZgzZzSOQgRxOH/IdIZ0yWufLi/aNiw6SW3LGT30sBLD6PcCZmIZxoQU8Yn4vFf1lDAD2
	 jFrkeVPwHCUGFtgOxMLCfppPJCebavY+BH4mgQrYFB2O+I8WSvUnHQP/ELn/eUz/+zdQk
	 TPoDYk0+Ll9GHbQbniQQJuyC9BiqdVkC3+aZjsCo6itOXhDJoJRuJnREpOn2xJElZng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0EDANjT/";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03A6606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C03A6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0EDANjT/
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1438d9363fbso1422327c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804349; x=1795409149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UGuM+GPpkioXjAM+mOf4pqTWILy+sZBNY2NJm0f6pw8=;
        b=0EDANjT/a6/tIlLr5krCZTGw+nZr7wNl/9kxqE8XxywgSfc7DKpZ6dyvgHZ7OiA32a
         /QK0SJ/nhzxdRl8zEv6kroRO8DydgCi7FFHJbXdRTjWOWNZSDgSOXO4eUq/j7KbrFOPc
         cHPM3b1JG1hlpyMoSpObqbvjkoglB1tLVISIQiPcUB4aGOokJMdMPN26Hr4qvlFhFLTr
         4xHDwfjJrCn0BfkSEZYcp+pn9g+WC2KIee19UeqZkytzRdeqMQ2cmLoVq2aRji16DSNr
         nj0SMvELgDd1OOV3sh4kmSQgeHDyN7XCPmgHp4EvOwJA6rT8rG7faPkznZLleDFSqmGc
         JHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804349; x=1795409149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UGuM+GPpkioXjAM+mOf4pqTWILy+sZBNY2NJm0f6pw8=;
        b=dX2Jz8E1w1X101pgnA2spPM3HRzx1A+xe64J8NB6gL5obhm2QWqC3/GDzXyX6zPjFt
         FPcMviZgRSK513RFmEKxdmVpff0v1YkaThO7eqGhfMMEC183eMb/W3zR+VNqzOUQMtea
         SHnTbW607r2N4iMZfGCVWvX5lCpdD2RWiH8ONrth1Yojz7H/zXnEYNxIl9RfiqfKstHi
         MBqxyUXVFSmluh5l22vJiWsJxvBgfAYdjRtU9sBymGoeXhrb1pEnCyhu+JAwYE0d3hkB
         Q+rXqmawGT7S+VXx0NvAA52B61hEJX0UGJirVB5IxSKJjsWdwkUUNgTK3H48I6NzQlRS
         paGw==
X-Forwarded-Encrypted: i=1; AL+hErHESwgYxwXdnHSqD1br7811Z0zKnBGHvi92+Ph5W0fX3GPSFflTOoSrGSdQce28pfgId9x0uFK6LHq/0BQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k7ZyjqSPZnbWYG5VYFV0JC4hV56yiqcMb9u3kt8yB6Yuzwi/u
	uE4SlMmhWcMhAK30w8Ckzk1BorhaEu7iOFyptUqZWJWDCo9OJfQNw2Lb
X-Gm-Gg: AYBFou3UzfEvC++J2KsRYOu8DMLdMXQmQ+eXNUomed57tmWu6OmmVJ4JMIw5+UMiiwX
	EEntGxdYmJSgTZino7xQBSsOEbPXlPHkEcTy/VogE2RsyRDL8//cZnhUeJhB3tPOPYDu6LeB51F
	4EpueChKeS2NG4+nOmpmeKlXtLvErOjJoMitcG0MC94C46yZonVvlvd/HSXQoVEKv3AZRj3b2Xa
	j0OcrdM/Fugnq3N+vnCQbjMByRowwX95QG4WgmNXi9N6jsFTg7I19QOMM9wd3crZb2tTZwg0r9J
	qOeywSkq1AoLVhIGXSRrM2J4OkhjM17MW5Viybkj5t1RNO8G/ZfXDR/bdzIsONJqDaMkt77+ZLv
	askGRQP7gXCotxBs9kYGOsyry3M9dEuEBrFzo2qAnp8Xibz2j8/tZw/qqlqitZsS+gBWtOBeGMi
	TkMEQwFZHbewHw53SS0iaAZRNehjDNco9wJNLcI8ccYUKXZPVgvV65kS2MIf04TEUnhJbnhJ2Sb
	LV96uSpaLFmfLsl9T3Xvp7mBtcgPBkQVGCs2dv+t3MnMNmPaN0pMYqOIn/6VRBiSvMRJyaZ276M
	w/4mLIIwlmmOMQ9kE4l6yXY88vAtvLnQjwettkbexHjdQhHHQ3GzcY2nKIRpOczzmiYa
X-Received: by 2002:a05:701b:4549:20b0:1b4:facd:5311 with SMTP id a92af1059eb24-1b4facd5aacmr10402552c88.8.1794804348767;
        Sun, 15 Nov 2026 20:45:48 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm2649066c88.0.2026.11.15.20.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:45:48 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>,
	Qu Wenruo <wqu@suse.com>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] btrfs: tree-checker: reject file extents with oversized disk_num_bytes
Date: Sun, 15 Nov 2026 20:45:43 -0800
Message-Id: <20261116044543.282187-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

check_extent_data_item() only checks that disk_num_bytes of a regular or
preallocated file extent is sector aligned. A crafted image can have a
compressed extent far larger than anything btrfs writes, and reading it
goes wrong in different ways:

- With disk_num_bytes == 4GiB, btrfs_submit_compressed_read() truncates
  it to a zero compressed_len and submits an empty bio:

    assertion failed: IS_ALIGNED(logical, blocksize) &&
    IS_ALIGNED(length, blocksize) && length != 0, in fs/btrfs/bio.c:895

- With a 4MiB zlib extent whose num_bytes and ram_bytes are above 4GiB,
  bvec_offset + bv_len wraps in btrfs_decompress_buf2page() and memcpy()
  reads past the zlib workspace buffer:

    BUG: KASAN: slab-out-of-bounds in btrfs_decompress_buf2page+0x3e0/0x650

Compression and encoded writes never create a compressed extent larger
than BTRFS_MAX_COMPRESSED. An uncompressed extent is at most
BTRFS_MAX_EXTENT_SIZE for a regular write and 256MiB for preallocation.

Add BTRFS_MAX_PREALLOC_EXTENT_SIZE for the preallocation limit, and make
the tree checker reject a file extent whose disk_num_bytes is above
BTRFS_MAX_COMPRESSED if it is compressed, or above
BTRFS_MAX_PREALLOC_EXTENT_SIZE otherwise.

Suggested-by: Qu Wenruo <wqu@suse.com>
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Report: https://lore.kernel.org/linux-btrfs/20261115163724.226922-1-teel4res@gmail.com/

On v7.3 both images from the report are rejected by the tree checker
with this patch, and 256MiB preallocated extents still pass.

 fs/btrfs/fs.h           |  3 +++
 fs/btrfs/inode.c        |  2 +-
 fs/btrfs/tree-checker.c | 18 ++++++++++++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/fs/btrfs/fs.h b/fs/btrfs/fs.h
index 2dd167c32d61..c65051a9f018 100644
--- a/fs/btrfs/fs.h
+++ b/fs/btrfs/fs.h
@@ -72,6 +72,9 @@ static_assert(BTRFS_MAX_FOLIO_SIZE > PAGE_SIZE);
 
 #define BTRFS_MAX_EXTENT_SIZE SZ_128M
 
+/* The maximum size of one extent created by btrfs_prealloc_file_range(). */
+#define BTRFS_MAX_PREALLOC_EXTENT_SIZE		SZ_256M
+
 /*
  * Maximum length to trim in a single iteration to avoid holding device list
  * mutex for too long.
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 19b1eba2dd84..3f8889378d6a 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -9175,7 +9175,7 @@ int btrfs_prealloc_file_range(struct inode *inode, int mode,
 	u64 end = start + num_bytes - 1;
 
 	while (num_bytes > 0) {
-		cur_bytes = min_t(u64, num_bytes, SZ_256M);
+		cur_bytes = min_t(u64, num_bytes, BTRFS_MAX_PREALLOC_EXTENT_SIZE);
 		cur_bytes = max(cur_bytes, min_size);
 		/*
 		 * If we are severely fragmented we could end up with really
diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index f021ac14babf..6e57f5969bf9 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -244,6 +244,7 @@ static int check_extent_data_item(struct extent_buffer *leaf,
 	struct btrfs_file_extent_item *fi;
 	u32 sectorsize = fs_info->sectorsize;
 	u32 item_size = btrfs_item_size(leaf, slot);
+	u32 max_disk_num_bytes;
 	u64 extent_end;
 	u8 fi_type;
 
@@ -377,6 +378,23 @@ static int check_extent_data_item(struct extent_buffer *leaf,
 		     CHECK_FE_ALIGNED(leaf, slot, fi, num_bytes, sectorsize)))
 		return -EUCLEAN;
 
+	/*
+	 * A compressed extent is never larger than BTRFS_MAX_COMPRESSED on
+	 * disk. An uncompressed one is at most BTRFS_MAX_EXTENT_SIZE for a
+	 * regular write and BTRFS_MAX_PREALLOC_EXTENT_SIZE for preallocation.
+	 */
+	if (btrfs_file_extent_compression(leaf, fi) != BTRFS_COMPRESS_NONE)
+		max_disk_num_bytes = BTRFS_MAX_COMPRESSED;
+	else
+		max_disk_num_bytes = BTRFS_MAX_PREALLOC_EXTENT_SIZE;
+	if (unlikely(btrfs_file_extent_disk_num_bytes(leaf, fi) > max_disk_num_bytes)) {
+		file_extent_err(leaf, slot,
+		"invalid disk_num_bytes for file extent, have %llu expect <= %u",
+				btrfs_file_extent_disk_num_bytes(leaf, fi),
+				max_disk_num_bytes);
+		return -EUCLEAN;
+	}
+
 	/* Catch extent end overflow */
 	if (unlikely(check_add_overflow(btrfs_file_extent_num_bytes(leaf, fi),
 					key->offset, &extent_end))) {

base-commit: 3aefd67f08f8ed59ed0fa90619b25856df415031
-- 
2.34.1

