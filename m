Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030793644DB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414866; cv=none; b=muP18UCzI6FAt/210RB+JlwmKV4xqhw9ZQtpfewVhVEqeSW+MOJWL30qgIcROa/BMMz2YhquRL4uDzprgq1fBWCPG5EYq//cvMNl/pwYjsH0bIBUXOPHMs1LzxhoYqo/2Am4BERc+Jmm4Koony/3yAPcwC54b1rU84/hfvVLRHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414866; c=relaxed/simple;
	bh=Aax4s15Wmtzs7eX7pK0pP/ihq72/I4GA+KRdZN86pwo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l1Wc7ler5mKLIfOUgj37nyQux/136riGjeDeC10TzqNic93FKiySBIFzXNIZZx05MuPUE9kj+Ka0Zem+IPzbJU4f24K+Q9QQfXXsLfnd8n48MmdIbztNG1nQS3INLipHxm4A/MVPjzSTavgB9SE3NuUZ7Mvs98X1te5wYeTGMF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFA7e9Vv; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFA7e9Vv"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6056796eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414864; x=1793019664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uF0K/ISANlcRJVgbX3KWpFeOAEFaBPifEi/Tk1Z5Lrk=;
        b=HFA7e9Vv0b5Lfv137OoMI9NgIJBQwk0yrY4zFA5brnSEVItWvhKPF8rOjZw/JLsz0R
         UM2ELFed26I2Keoj2VhmJwhnUXJbHxkTIij0JTst2Hj2OdkAGEhcv9LefmNIjeMURhTZ
         yM2vDvHtf7WhGPEiu0VlPBBg0JREZzhhPpLD2pHtQcDQ6upsYs4oepq6RS1XQyKlvw/I
         ozP8e0rJK3ZZEFZTnzewlKcq/zUDhoD89kcAJhk2yGVLnVNh9larUdmwGwW3og3mr402
         iRbLqUh2ZExqY88RwCbPpP0UerjzQTIfaoAMOlRlG4gZzmt2kW2TsILIhTdRro4FAmOF
         +VJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414864; x=1793019664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uF0K/ISANlcRJVgbX3KWpFeOAEFaBPifEi/Tk1Z5Lrk=;
        b=S7oNuQEbD6JwGa6Xc9VTQYSCLRXIf7a4N9J5j01xVq8+6UhYxe4kDhVkimEjn0NRue
         I0ntW821y3Blr0TR3PRdYX01AUm3PE+Gryaz2NN0Wk5q35CU/07R3pYwQTVpVuYY+N3E
         Gi5RfU2ZzT/3ejJicy0xlTlTBcmHa1j4GwQrNyCOoCJr2Lc4p5K5t6onCKMxkVb9DFJO
         hVuZez2jhZhM4vpJxmh3mwrhv32VFYe64RlOuMF4RCAwshZdV522m9bGaRAdsSBu7t/h
         Ik+wNsWmCdkmEhlMbaniVt4ertQqyeCXAiGCnd2xofWqseor+PWJDPe+j281JvChc5nX
         oYjQ==
X-Forwarded-Encrypted: i=1; AKwUvByn2QSjHJBSd0k4/XKMYQx5RnqcpUBpaad7HaNqSi8dz4zKTOe2/JxcEq/rLwIrjXxQPhKXY6/TiUIE1qk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIN6XxH250Dt66CqYC33TSfrAbHHIzW6f31sFQsJcWk4U0jSz5L
	jqRJU+azKYDgOxzHKRHTr9A6oFy88zXJEJolzz9nJQSzud+mbizSb0PD
X-Gm-Gg: AYBFou1wYGHXX8dN2WXeZJh2V6UPg6fQxxuGho7XAw6KcvZkhTdn9JQrr5nFAPY1ORR
	JOl5q3V15/FoVFwDGUgjsZMxDr1duOgdcZSUkFObbwnP8RIxCQz761WW2WjCqHaQVklPXHwH2I4
	kvZeTasIwc2DKVRYvvhsYVEWj7U9AMJ618191hQAbs8zozmHbcG8MSHLU+gdM8MaT4WXHTmeSze
	rCA3c4gZ6yOtObkcDPK4VQoCNGxfA2DFYYl/qZBjuccIH7UpZLdiet3yuzdwU1E9N4v7YU0uxRY
	N5HBkdu8pI819g6tpXmw79Eh+TGz63YqvfGjx1gAKPhNInShKuwtkgRHqQIZtllkGkwfjfAnXYH
	o/KYeZjX86KoeWRY+b7yH/fci8dKGTqkbYuUz211BFwrhiuTS/FNsYtcyyr/8EQ8rbx7fa9awTh
	0GlwgKbSKGVEvZmiJvJZC/6hJRmIUV76Fzw+f2K4Q9EToTfU7LvtC+oCjOsUtpW8NNnRn9HSb+y
	RP3ssUsEgkUXIJT8hQDcSYGEZkFjooeY6I=
X-Received: by 2002:a05:7300:ce16:b0:351:45a4:7dd8 with SMTP id 5a478bee46e88-361a2843701mr10814906eec.34.1792414863570;
        Mon, 19 Oct 2026 06:01:03 -0700 (PDT)
Received: from csl-conti-dell7859.ntu.edu.sg ([155.69.199.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm32263303eec.10.2026.10.19.06.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 06:01:02 -0700 (PDT)
From: Kaixuan Li <kaixuanli0131@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Kaixuan Li <kaixuanli0131@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v2] f2fs: bound the SIT/NAT bitmaps by the checkpoint pack
Date: Mon, 19 Oct 2026 20:59:22 +0800
Message-Id: <20261019125922.2568859-1-kaixuanli0131@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260919130925.1899994-1-kaixuanli0131@gmail.com>
References: <20260919130925.1899994-1-kaixuanli0131@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sit_ver_bitmap_bytesize and nat_ver_bitmap_bytesize are used as memcpy
lengths into and out of sbi->ckpt, which is sized from cp_payload alone,
and nothing compares either length against that allocation.

sanity_check_ckpt() has checked these two fields since c77ec61ca0a4, which
added them after a crafted image overran build_sit_info(). That check ties
each length to a segment count; it never compares either against the
allocation, which is the half this adds.

Mounting over-reads in build_sit_info() and build_node_manager(), and the
first checkpoint writes the same lengths back through the same pointers,
so the over-read's contents reach the on-disk checkpoint. An unmount is
enough; the filesystem does not have to be used.

Bound both ends the way __bitmap_ptr() lays them out. The three branches
differ, so a single sum of the two lengths would still admit a small
overflow when cp_payload is non-zero.

Fixes: 39a53e0ce0df ("f2fs: add superblock and major in-memory structure")
Cc: stable@kernel.org
Signed-off-by: Kaixuan Li <kaixuanli0131@gmail.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
v2: Fixes now points at 39a53e0ce0df; nothing bounded the two lengths
    against the allocation before c77ec61ca0a4 either (Chao Yu). Cc
    stable. Add Chao's Reviewed-by. No code change.

v1: https://lore.kernel.org/linux-f2fs-devel/20260919130925.1899994-1-kaixuanli0131@gmail.com/

Reproduced on v7.2.4 x86_64 with CONFIG_KASAN=y. Two crafted images from a
plain mkfs.f2fs 512G volume, with segments taken off the SSA area so
main_blkaddr does not move:

	cp_payload 0, segment_count_sit 20 -> 220
		sbi->ckpt 4096 bytes, SIT bitmap at +192 for 7040, NAT at
		+7232 for 3200, ending 6336 past the allocation
	cp_payload 2, segment_count_sit 20 -> 520
		sbi->ckpt 12288 bytes, SIT bitmap at +4096 for 16640,
		ending 8448 past

	case                    kernel    result
	crafted cp_payload=2    stock     mounts and unmounts
	crafted cp_payload=0    stock     mounts and unmounts
	pristine mkfs.f2fs      stock     mounts
	crafted cp_payload=2    patched   rejected
	crafted cp_payload=0    patched   rejected
	pristine mkfs.f2fs      patched   mounts

with the patched kernel naming the numbers:

	Bitmaps do not fit the checkpoint pack: sit ends at 20736, nat at 3392, pack is 12288 bytes
	Bitmaps do not fit the checkpoint pack: sit ends at 7232, nat at 10432, pack is 4096 bytes

Setting sit_ver_bitmap_bytesize to 7040 while leaving segment_count_sit at
20 gives "Wrong bitmap size: sit: 7040, nat:3200" and the mount fails, so
the field is read and the only thing checked against it is the segment
count.

KASAN does not flag the copy: with cp_payload 0 the allocation requests
exactly 4096, so there is no in-object redzone, and at 12288 it went
unreported too. What the cp_payload 2 image does produce, on one of three
runs with a freshly built image each time, is the corruption landing at
unmount:

	BUG: KASAN: slab-use-after-free in kthread_stop+0x23/0x390
	Write of size 4 at addr ffff88800a329fa8 by task init/1
	Call Trace:
	 kasan_check_range+0x39/0x1c0
	 kthread_stop+0x23/0x390
	 f2fs_destroy_segment_manager+0x176/0x9b0
	 f2fs_put_super+0x635/0x10e0
	 generic_shutdown_super+0x13e/0x440
	 kill_f2fs_super+0x24e/0x500

Which neighbour it lands on varies.

Mounting a crafted image is not a Linux kernel vulnerability
(Documentation/process/threat-model.rst), and I am not reporting it as
one.
---
 fs/f2fs/super.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4180,8 +4180,9 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	block_t user_block_count, valid_user_blocks;
 	block_t avail_node_count, valid_node_count;
 	unsigned int nat_blocks, nat_bits_bytes, nat_bits_blocks;
 	unsigned int sit_blk_cnt;
+	unsigned long long ckpt_size, sit_end, nat_end;
 	int i, j;
 
 	total = le32_to_cpu(raw_super->segment_count);
 	fsmeta = le32_to_cpu(raw_super->segment_count_ckpt);
@@ -4308,8 +4309,31 @@ skip_cross:
 			 cp_pack_start_sum);
 		return 1;
 	}
 
+	/*
+	 * Nothing above ties the bitmap lengths to sbi->ckpt, which is
+	 * (1 + cp_payload) blocks. Bound both ends the way __bitmap_ptr()
+	 * lays them out.
+	 */
+	ckpt_size = (unsigned long long)(cp_payload + 1) * F2FS_BLKSIZE;
+	if (__is_set_ckpt_flags(ckpt, CP_LARGE_NAT_BITMAP_FLAG)) {
+		nat_end = CP_MIN_CHKSUM_OFFSET + sizeof(__le32) + nat_bitmap_size;
+		sit_end = nat_end + sit_bitmap_size;
+	} else if (cp_payload > 0) {
+		nat_end = CP_MIN_CHKSUM_OFFSET + nat_bitmap_size;
+		sit_end = F2FS_BLKSIZE + sit_bitmap_size;
+	} else {
+		sit_end = CP_MIN_CHKSUM_OFFSET + sit_bitmap_size;
+		nat_end = sit_end + nat_bitmap_size;
+	}
+
+	if (sit_end > ckpt_size || nat_end > ckpt_size) {
+		f2fs_err(sbi, "Bitmaps do not fit the checkpoint pack: sit ends at %llu, nat at %llu, pack is %llu bytes",
+			 sit_end, nat_end, ckpt_size);
+		return 1;
+	}
+
 	if (__is_set_ckpt_flags(ckpt, CP_LARGE_NAT_BITMAP_FLAG) &&
 		le32_to_cpu(ckpt->checksum_offset) != CP_MIN_CHKSUM_OFFSET) {
 		f2fs_warn(sbi, "using deprecated layout of large_nat_bitmap, "
 			  "please run fsck v1.13.0 or higher to repair, chksum_offset: %u, "
