Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65882D322E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789823394; cv=none; b=JuH6NUvGV7Hvs2TQDDca77P8hBmoojf6emKAePNHzweXvremYfacyiqEh3kud/QtqLyNba6ml4tZAeRJrG3JxI1KJ2+rvokFtKzCBl+vIB+MW3jfgFCzUPfgIsj/g2S+J1ZXYJ3VFC+KI0ulq8EpKGkS3EGgdKeAEMNVQIHDNYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789823394; c=relaxed/simple;
	bh=kvsVjbn5MX51Sg1KdLJbDsyYlb7eTlx3AJQ5a8S+a58=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YWkfrmOHraxaqmfX9mpa8yZhRjAkocnGJREfMPHYlnT4HiXvvzJpnj+TyhJdIMWGvJzmsPIn/u7vR2Fhp6/ZSlK1tEdLtq5RacaKXVpSmRd+g02fPaZrHW+VxqDvp9j86spIUlNxrR2I/6XnGb9R9MO0i+51cR/hAoAEYi5ksBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/9yBzIC; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/9yBzIC"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b35601so980827b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789823392; x=1790428192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y5Tjh3GexCBzXdpLVPsyPNiT6yr4CdLK794OeNiom9k=;
        b=Y/9yBzICjTqn3xUtfV8PAU3AaiiEbJSKGTfWtjtYnxQ7dfLzRVHiO/xezI0UhDbVCP
         6HJuoo7xdYb1vAqCz0mTKqmoK6/YMBCKAAZO0NTxTmkODV9sE4I3wE6uzaNR4G0jAII/
         9RPYoOw/XxMqJtwbnU7F/LCn8GwfEqw04ghB1Wx0H8kp4qdgUqbbzCS/IcDxQCudU4qK
         Uu9DrmDPyagIkfy6fZgORZo/p8gKes3PdBBLjR8pa6MKDZdr/F9k1K+msE9VKytKq12M
         CwR7KmrMfQI5bsg71dJMUj59dKf7wVIbmXWfL1DBTx8enXZUXAS3Gq4hX6nd5dpDZvom
         evhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789823392; x=1790428192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5Tjh3GexCBzXdpLVPsyPNiT6yr4CdLK794OeNiom9k=;
        b=b2dfjazgX2SG9HFTYJfA9t5u8OqVBvbdOVj/5aU7v9SyC+LpnbalsrFAtHAPDkkjXe
         EYZXzu/K0QrYPRkQU/44kVKRFY0+8WXk8yoDy8i6BHA8pXJvThKT0K9sFQ2sNQKFHI2f
         u1sa2VpV3MsCK//kq/xUouE5hMlFmH7eg8EeiAMyDQQUnQdUaEJ8b3+EiFCDTSjv7h5v
         zmNRUWz/brQzk4m8wta6SV8QgyQCIWaRmOzphFn8g7uGGzyn94csz3tObOT+h2psyKwU
         waGYUL/ljYu9dLsdRWclTxSAXrha+AVtSeFEf+6nUlhz9+W4PpO3y2TY32pMjjhr05Tf
         1Xdw==
X-Forwarded-Encrypted: i=1; AKwUvBwfhApu0BT+T/81FlBtJ1E7G8BLGrqeJW0InizPcsMguK3gm8nwxL7Q43GSToCR0f1EUiryj44LYdTYrso=@vger.kernel.org
X-Gm-Message-State: AFuF++mIc43zJNqK4sAbUQbyfxMSIJ1JhE6pPqhi6mv/uF8mSaqTZmVB
	o8TWlz9PZ+y11bcpjQCGh0rsQxfqz84swGSeHQq3efoGD6VVJEgmAmfa
X-Gm-Gg: AYBFou10D91kIBTMiaawtP7/eBh18rvM0vIgCN859fyzFLFmPLr3z5FGr7X9efd9Fmo
	K/1xuYzxuJdm3TidmY9G+aikQxVItCce0FEfhp0PKHo8I6enQXGHzu8yJhIYrWnoOtBkS/GdUyc
	+yZ9Y4u7dOTQVyAwz7/Mq1EZcoxS3B0XlAkIjjf7vaLuCurGwL6iVIA3paaaDp6RDD6zYjCN6zX
	wIKZ/JPXkbMOfNFSwNrPCh338PYw9FHdp5d6PM68QO+CXSY7iLh4mnH8feOwIFNVr/QhQoDIYMF
	EsiTKEu6QzmifhbJdjPye9D6Kihq6oIo+c/WM5b89ogDrLrtjjhY8NeJrPIqsx07T9kyQH5Hh/O
	NOqBM0Sql7va8uaShQqatHEJ0uRQWtPSKcZJBfUPeP6FfXBgppWRWYt24nGZPcOMBt2UOVjPHmy
	xHK8OXK6uoGF39b7G9eqP5JSVUYQXL6TdVO+MXZhs23Qn7JcaL4kw1HsYmuRV47B6GsU+F9VGW9
	u5v3/Id2HW3ZATGKRIfG8+42QNjTuBhfTtz
X-Received: by 2002:a05:6a00:94e7:b0:878:34d7:6997 with SMTP id d2e1a72fcca58-87834d76dcfmr1434910b3a.39.1789823392057;
        Sat, 19 Sep 2026 06:09:52 -0700 (PDT)
Received: from csl-conti-dell7859.ntu.edu.sg ([155.69.199.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa6fd3ecsm1025493b3a.59.2026.09.19.06.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 06:09:51 -0700 (PDT)
From: Kaixuan Li <kaixuanli0131@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Kaixuan Li <kaixuanli0131@gmail.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] f2fs: bound the SIT/NAT bitmaps by the checkpoint pack
Date: Sat, 19 Sep 2026 21:09:24 +0800
Message-Id: <20260919130925.1899994-1-kaixuanli0131@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Fixes: c77ec61ca0a4 ("f2fs: fix to do sanity check with {sit,nat}_ver_bitmap_bytesize")
Signed-off-by: Kaixuan Li <kaixuanli0131@gmail.com>
---
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
