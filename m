Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794805771;
	b=PrtDtR2B2q7urhDG/W1YUZl/gl3vS6yrG60yLWOflv+PFU1THp01WCUf1QRi0SJ5As+K
	 eA7FoaWrR52h8EKSChH75zdNXTRrneBZPEee7r4Au59Y979VFKct9p/n+a/TBrYKDwKFN
	 LFt1c/8RuJ/kJOrQOuJC7w8eCTWvIRZmMYbNnfDHH9PNFPCA6yOdYHdEY06S6lgCAfIp4
	 uxkqIhI9pFTlrV/h9l2PnC10UeNxhp4kbb4JnBwidYwdMShPCzOpW2cwyfihQH6xqbjs9
	 mmzqcgNT++xddsgRFKsqLNIl/8FXFQQ7WLTf1F2TPnJsQu1W1rtkkNlqRdiH4PqZAUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794805771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=apEooVHM/zxyQP3G0X4cdeJmjPk5PeY1HsG+4/IToxQ=;
	b=0LnmSmGh2/ekIy+6TNozv6UGV+uxwVrz+X6T+bSFxlWeY47FCa/BpdR53hnMT84ZSx7n
	 qIYbSN+g2nRWWhkOufZvWoMLzwvRVfC6PAL/+tDSl+OUsXLgqlMYXUhS+gGGG+S/Uq/5J
	 dkrB0PEGO5Qp14GVP9eZ9ZLsEZiyqzpAdWYHJYyRIeD5gip54H2DadMfHVFwHHPY84nG3
	 BCUbQgxQB2brfe9wSbGTuZF8I0uzW4bAJic3aPGLxDCpjE0lhvYzeauQsIfZjplTuC9rs
	 vgD+LeVcrxOGhTQs8A/EgXT0eDfSqs1fmt5/BqmwiJpjsGsrdTX9KV9etjqKL864CDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jBqQv1/l";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DD3606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57DD3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jBqQv1/l
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37628596783so5072163eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794805769; x=1795410569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=apEooVHM/zxyQP3G0X4cdeJmjPk5PeY1HsG+4/IToxQ=;
        b=jBqQv1/lxHMtL6SbibPfS0foHq4tzG7BNYDeNaSz1p0OHGeFxEoIPom1AKOIddGWuW
         U3q0TzRRgUsNpEDeRbrRUT6EroV7pKqlSNdH2RN71HSDHaTHPu1EvalXwOYJ22GuSoxo
         55fMfYfuntsxGX0B29uBAFO6FbER1e6suYUtJjlaw256eG6myI2xOvSoMcUlQseVnAjK
         Us3Jep/rLxGkKtTVj3RjQGvUbvHwvLweANrCoM4wwTTO7vITp5iSqaJ9lMionzkntPJm
         YbsUEGLNP1ne0amhgueWXq0NLaJyfTLDt4ytS5HANOjsRwpwyQ7csP5jeilDgFDPegcZ
         /RuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794805769; x=1795410569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=apEooVHM/zxyQP3G0X4cdeJmjPk5PeY1HsG+4/IToxQ=;
        b=S+zany+KEG6BUebcEVyNdL/s3KENxKPTwQ/lIqN7oCIC/fcM/3eyuzPsRM2DVQ3w0p
         h7csQvXX6aG3Skh/qBVkhQL3EsuL1rMPCb2DcwULH81CgxUxDN41vWCYL8+H/n6X5Ib4
         3zMyNe9SLI371caySfPF6yP76YaGiz6z1oP0MSKE8+OfSCfCuZS96ds7p7PvPcUmTKeE
         lqsNhE7U9chEaNzMVG1TbdEgr20xA7mi7GsWB9AgUoSEHfpp+e8Tu86Dk8QlPb/m17aE
         SR0eu4hOiHBE+Sn/vY4nkPLeY2bZHUVhq4XQLzWaPLB0dvEVvUgxLK6ZBW1E8is7xOyD
         Zs4g==
X-Forwarded-Encrypted: i=1; AL+hErE25f7XxyiKENJJAP7IgIkKgMO33+TVgS6EpRHHfgSskvqFUGYZhauQZKPvvJilSZqQl+8Ien4+16LePNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8s2/kB1AANkV5r6mCf1CYLBETXrrIk/ZhDV7oWiIOoqHhICSXs
	VX0CwAqVhlJKl6BnDywQIptLz5i6QcwrmO416aSZjpHav2lEUqWZ7CL7
X-Gm-Gg: AYBFou2EwVjkLDnpvlBolV7Ycy3DDBFutV3UZo+Bd3qnb0u6bbFQtzjZM1N8fZNIojU
	S19Y9kq6O9Mf+Leya+9pcZkMfMlvIkxFIkVo0r2jaD6E5kZS87My4lmmkFPTcAj9Z2EULzzcT/Z
	lO3/MS2OA0sXRVWDScFlCpmKu5eqJJxY+FNoFtn08eRPpd3FxldO5BGpz5+/qc9KvNw2PlrXCT2
	6N13Tage15bDPJY/i2YrrmwWmaX7LxmRUHidR7dNlv4wHDfv5hHOz5A88LpWHwskbZgdq7oZgcQ
	8VNlsesfm8CN0IexMBiCZdFc58o/XUjmLfKtm4ae4yosDHjbzbz1H1PzLw+zma4SlRbSWJG29mi
	onYQrCGM961t1+iQr4ji1zgbRIc0jXVZWWugn9unWhLiR2c7R9flEGXA9FOsiEX/fG3GHNgw7JV
	ByXQtzzagY6ZXsyTpQJ9UWIn/vb5P/C4tIo4xatvta7uOLnIR/hlI+L+HNkuR6vFKMq5RKe1KbM
	Hmlb78EfL2rpFnKJg0BSIl8bI+YReqouUlrIy7sDHVtoU6gNbYKjm4T2jVK5hiWHN0FRwOjYj6C
	+LYvKBvI2kigch0DjITZz0dhaW3/R0dxhyc5iUr3CUAp/zxxcZOtGGNY9S1+Av0iaDRL
X-Received: by 2002:a05:693c:820d:b0:36b:d3dd:2e85 with SMTP id 5a478bee46e88-379676f8641mr9410862eec.36.1794805769280;
        Sun, 15 Nov 2026 21:09:29 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm30962114eec.5.2026.11.15.21.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:09:28 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: Chris Mason <mason@kernel.org>,
	Qu Wenruo <wqu@suse.com>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] btrfs: tree-checker: reject file extents with oversized disk_num_bytes
Date: Sun, 15 Nov 2026 21:09:22 -0800
Message-Id: <20261116050922.310476-1-teel4res@gmail.com>
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

Reject a file extent whose disk_num_bytes is above BTRFS_MAX_COMPRESSED
if it is compressed, or above 256MiB otherwise.

Suggested-by: Qu Wenruo <wqu@suse.com>
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
Changes in v2:
- Use SZ_256M directly instead of adding a new macro, and leave
  inode.c alone.
- Shorten the comment.

Note that kernels before v3.9, without 24542bf7ea5e ("btrfs: limit
fallocate extent reservation to 256MB"), could create preallocated
extents larger than 256MiB. If such old extents should still be
accepted, the uncompressed limit needs to be looser.

v1: https://lore.kernel.org/linux-btrfs/20261116044543.282187-1-teel4res@gmail.com/

 fs/btrfs/tree-checker.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/btrfs/tree-checker.c b/fs/btrfs/tree-checker.c
index f021ac14babf..6bd1dfc58e7d 100644
--- a/fs/btrfs/tree-checker.c
+++ b/fs/btrfs/tree-checker.c
@@ -244,6 +244,7 @@ static int check_extent_data_item(struct extent_buffer *leaf,
 	struct btrfs_file_extent_item *fi;
 	u32 sectorsize = fs_info->sectorsize;
 	u32 item_size = btrfs_item_size(leaf, slot);
+	u32 max_disk_num_bytes;
 	u64 extent_end;
 	u8 fi_type;
 
@@ -377,6 +378,19 @@ static int check_extent_data_item(struct extent_buffer *leaf,
 		     CHECK_FE_ALIGNED(leaf, slot, fi, num_bytes, sectorsize)))
 		return -EUCLEAN;
 
+	/* Compressed extents are at most 128K on disk, preallocated ones 256M. */
+	if (btrfs_file_extent_compression(leaf, fi) != BTRFS_COMPRESS_NONE)
+		max_disk_num_bytes = BTRFS_MAX_COMPRESSED;
+	else
+		max_disk_num_bytes = SZ_256M;
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

