Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648431;
	b=Acqa6L4Dq/wWaEwT2Fv8ifRBh/y3vNkOHdbJnPhQamW0D2XO/S7JSygfaAytf1l9JHGS
	 GGbj5/1yt0dXrdvf6IzyPNqTW1LuXqoQOSR7IAzmJySd9KqU03MZnPv5NxcRb3bl/ouKr
	 Tw1b0w58YLagDdnl6FG7cZIdfjhGIMx4fFfzKsNvxJwT7MAyHD7roZO6uI3Us5nFBUlLr
	 nFnRzFp1cnEn/YvqEgNa7O2pNBp5FyAAAYNuuaBi6KBAOALBzDVukQXd1CK6z9PSg/wSR
	 qhpT3d1br+JxsQktC+qpaRr8mvYN3EKSfbXnGQsJovgHeaekDErUpu2RG9r1RO/J60g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648431;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rd8V4N1evy9DczvQBg1wfWJC9W1eLroMus6O4D6BjKk=;
	b=ZOE/ucFJ2mT7gxqRjfKlGDTnPMcMG19CEj51bRLvpy1CZn1OqNdiI72iMvPA1+CZbMM1
	 RKrIfiHjnSy8XwVhSF10vw9FyHNN3MiECEc7ORz/Xcw1Q9Eis9g/o7ClimK7Q6eyqpYsX
	 EQXb9uDTFRqha1J4Met423MfBtt0P5GhCuCjYeQbp3Vk8eNsxNo48aJakokJpu/YQye8B
	 eLZTbWP7EKG+E7P9+nKiJNWsfF2NMcv95+Xlz5k6Wls8ulmLWYrhWQbDfd4bamhlzzsmF
	 9IC2f5bFnYEbo4psvqFXTj1qfxxjNGZlkaLR3Qt8+jwj1w8Sf9hf3NNyRKfTv9lhtnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqhffovJ;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6C6606D817
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B6C6606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CqhffovJ
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-89f639ba307so1210454b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648431; x=1794253231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rd8V4N1evy9DczvQBg1wfWJC9W1eLroMus6O4D6BjKk=;
        b=CqhffovJtQAvFyCXAi9g6p0yDPdJm6Itt2pZHrUNtof7Ap3Bh6Xi+ymdwni1H73/bh
         EdY4C4KkVQKmzCEaX0PZkxFtIN7zfBHGRBKVkOSIlVtREw4z8k2AKcaqS8QxsVdXaSLz
         bpq4czFcV9PN8ZZYfU27gZSQq6/5Wy484OmplUZMi3P4gANW9KXS0qLB7+LhuguWLLYx
         CYD27S6+R8XFa6pTfghC4OJhBqJm8SuEAgQ26c0NYXv1v2KmpQobeYIqFVM62eTfIM5U
         v/FV69513A2mXxAnp9KpVYxs2sz6PY6nc0j5cTvtK040eG5bIIDwTPxPJdHsr5pe115S
         SORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648431; x=1794253231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rd8V4N1evy9DczvQBg1wfWJC9W1eLroMus6O4D6BjKk=;
        b=imkq28HXo6o5JAg/eRvKY0RKSptP20ZHk3DEAuIPAxBu4dfhE4sZ+8YFCV+42/D+68
         SmCJQXGi3SE8p5fHezTX5eOmwGmdOv8jU0jKhqdYYfUwfnaYAUdVsy/rl9B/wtGPbXxd
         lHPk4hi4fC+DbXd+4QZmkG2mtTjcMb+70Lp+9mFg+lvc4Ch9dPE9b1pyjeX8b4fDxXWU
         aAStjXv1+0/P8SWjCZMckfg3qnArB8ctf5w4geE4w4R+AC3ATHiec0ScCmMZm/n7dlYy
         K1gkhV7E+MPPmdLBtGJlUAEjqAYUX3Nn2ppk/nFix00KsnSbPTYbOVh0W4WRxDjaj7Bp
         rlMQ==
X-Gm-Message-State: AFq9FYLeb65Gu/ZDZA0tDe+vFUMgpsxunfdfvT5mtSIzY6QAkJNh8vxb
	KQe8c5bBNTKw/B2DCFMwRZcIkpop9MR9lpUpukM9k0tY6Z7Ia4053E6nths4kEat
X-Gm-Gg: AYBFou1cpGv/cRNOn9/LZt6b9A6/PCGn2tl1+jzChqLOIADIfbUMw0Rh94RFVyksfdz
	MrsLNMgkm760trzoaIn8BxuMzkoavehFHzHIDS/5bcF40bi/tDIdTgLAF3bHoAG3lAPvDK1Juwx
	70qIZFTAtmRiJ/MLK4Cs6Z2QiB8roT6fPgXeh3pK1N/MPuxNsQVwFckBrJpWwx/tLy89p13Tjq6
	aDsBKAWvFJ6WfeXlKDSl7hFaNXhfRAqY81RVcHDIbdNUWx8oHA3kWmgP4RMyhF9oLC628FGQNjx
	33NYSu+B3QYPG4oNZkV864m54ZC/OykOgtt0sIVMT74M/OGMkfrJ1Vy1Z+p1FUWryYs/msHTOMH
	IFXRNQcXNEoGF1LB8jZENLzZeZQuYDKPhPvpdmsUnzUSqewN94p7AGCYUXpbE3ecKeSb57gEfdx
	LQzLMaZ/pIq65wErI0NxEn5ZjEjb5WCvynKC+m3ufVsfOUalmKuTaqdqu2N38kOsMC85BayYkaX
	FFecV2+xafUuZeyZtPskY5pdhXu2w2zFWrQfk3A2xWRAugh8/5nNJyoHTd82kEaSJag/Mn6BVXU
	SJ9G5pZRnoLPtYJn2Lw1f5I6nn9YePdAdyK6Bvpu/TxxRCVRU+JwlQ/xGSF3mR70ySmJIpJMB1Z
	xKyUHdli00nTliqfMFLr3a3SJ7HgQtRIVIxCIP96xaUtmpQ==
X-Received: by 2002:a05:6300:618d:b0:3e2:8f64:e500 with SMTP id adf61e73a8af0-3e928e26560mr8796626637.62.1793648430787;
        Mon, 02 Nov 2026 11:40:30 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:29 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 12/20] f2fs: support subpage blocks in defragmentation
Date: Mon,  2 Nov 2026 11:39:44 -0800
Message-ID: <20261102193952.3002018-13-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261102193952.3002018-1-daeho43@gmail.com>
References: <20261102193952.3002018-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

Mark only the target block, not its whole page, dirty when redirtying
data for defragmentation, and read a multi-block folio once instead of
each block synchronously. Remove the -EOPNOTSUPP check. Reading the
folio once also applies to large folios when the block size equals
PAGE_SIZE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0fad86267256..29cfc0e2719a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3312,6 +3312,20 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 						cnt < BLKS_PER_SEG(sbi)) {
 			struct folio *folio;
 
+			/*
+			 * Read the whole folio in one I/O; otherwise each block
+			 * of a multi-block folio is read synchronously below.
+			 */
+			if (f2fs_has_multiblock_folios(inode)) {
+				folio = read_mapping_folio(inode->i_mapping,
+					f2fs_lblk_to_folio_index(sbi, idx), filp);
+				if (IS_ERR(folio)) {
+					err = PTR_ERR(folio);
+					goto clear_out;
+				}
+				folio_put(folio);
+			}
+
 			folio = f2fs_get_lock_data_folio(inode, idx, true);
 			if (IS_ERR(folio)) {
 				err = PTR_ERR(folio);
@@ -3320,9 +3334,13 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 
 			f2fs_folio_wait_writeback(folio, true, true);
 
-			f2fs_ffs_mark_subrange_dirty(folio,
-				offset_in_folio(folio, (loff_t)idx << PAGE_SHIFT),
-				PAGE_SIZE);
+			if (f2fs_is_multiblock_folio(sbi, folio)) {
+				size_t off = f2fs_folio_byte_offset(sbi, folio, idx);
+
+				f2fs_ffs_mark_subrange_dirty(folio, off,
+							     F2FS_BLKSIZE(sbi));
+			}
+
 			folio_mark_dirty(folio);
 			folio_set_f2fs_gcing(folio);
 			f2fs_folio_put(folio, true);
@@ -3363,9 +3381,6 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
 	struct f2fs_defragment range;
 	int err;
 
-	if (f2fs_has_subpage_blocks(sbi))
-		return -EOPNOTSUPP;
-
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-- 
2.56.0.317.g454f8302e1-goog

