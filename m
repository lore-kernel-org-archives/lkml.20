Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011863;
	b=vq9g2UATKFP5MhgTagcxCbOJoagxSM0aej9NjIn+KFFO/jgcyMXQpSVZINCF8U5yBjPH
	 pkFqiNNa0oxpD5Yz0CIG7ML2Cjpbl0Bgcg9wwAiGxFDh//tGnWc/w6Q43ramd/vtV52eD
	 aNgGI06tvAq1ST48G2nYAQSFr7kquB/EUOXYvADov0hwaQ23k4u4bWquhWcCd7/6pQ/OF
	 Ia0iRiS5SJgcxp9ljl7RMIX9SDYtNP6nz5e2ht0XvsFpOLvDKQtTkGSpfYlh+BCgU2lLa
	 3JULSJOFCg33Rtwspf6m7UATd0xBW6+r0W6YSK02mqAOjwONyWA7ortcv2MJSSbFUhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yzSTm2Fji8eE3olX3VmRZngbwlC7i6ctxbW2rBhW5I4=;
	b=0+C6dXffuXlAl4Qcih35gyvEjXiRbA+CUUyj3B3uNFe79gmYL4WesgX7D4P9i6VSSwT7
	 yl4rA6WSLuHnA3lPT8WLag2/aiLIvYtPtwiiE1cpqYbmpQVaxwDcdEb34bFUUZEqopdxj
	 uGu8Q211J0aXhmDuYXX/pyCwW9/kPcuzosxzEVqkMtpy5knIHLnuC8t2Zn/b6Ep1x+yF0
	 LyX/XX6N+eJhipz870xYrHiCiEuoy4pYGbtbvdt1X6Lzw1sljmoKUjW8lbLgLAwPeg2rR
	 j3yY9mRuo/FUVTAB78q/rWGNNmIzpsePoz2GiIVDdZYvbXVFZ6qg0TsOwgAkH3riZmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f+IVH3Sb;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F0606A326
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 180F0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=f+IVH3Sb
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15ea896ddc8so4857552c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793011862; x=1793616662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzSTm2Fji8eE3olX3VmRZngbwlC7i6ctxbW2rBhW5I4=;
        b=f+IVH3SbG8hiisMXFSjhAeGotRyhQpy/OMWP+0tpxsHbOoWrTCsrDXHFZHQGU4/jw3
         zCPyecSnphnqpuD6xwIT6bT/2BWnaDsAXX+GNpepK88bg7AImzzRaEA+YR7zNJZzWTYG
         UI52QXKfZ1EF/mrHMS2itzQq7gLJb6+5H1dgrIePKQpTYBy2CKoWW3ki9esMSuWNTEWo
         QhV3lc6lymJOPyq6NXhoTg3Ok6fvw+71kBfjgXJBRi3LcXTN9eediER4Hb5gKaNmyESN
         i3SBSKCg6GfLQr4eq5KGfDzmwPhW5rSRd2pLTWagAsgM0e70DSenqbxY9wxt0LaiZQZN
         xuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793011862; x=1793616662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yzSTm2Fji8eE3olX3VmRZngbwlC7i6ctxbW2rBhW5I4=;
        b=qhe03NdoTtj0QJ/LVXPn9hwh/qtxc5LKjVYHi0ebBZFzAy49gloszbPGBUieKCdSqo
         YrdvmUEt6LqtbY5ONY7muxw9v6cFRMCbdJGV2Wy84VAAKxd2oXTdX+/1pJfyis2tvovp
         wcpXU3vhpP2Y73N48ybBOVmed7SOA+N3lvJKgTG1HkelhtVIPU9F1cPUwLJ33UN5v7rX
         3K2ylhY9o4/v0YhvuQGcjeKwsy7QPChlLc8b89sxXTGR1GZmRIAY0hLW0yyNZhg/XSxx
         Hp5Kz9FX2A1UA9cRNuj2N6QCdGzO92xwAJkr5woCZ5t/CN801PG8TRjFvfRkiKz2WNyl
         Umdw==
X-Forwarded-Encrypted: i=1; AKwUvBxdAfxkVd5QHWmHo8oLxmaoXqPDmTFXUiA6xAXxZx/y/pRfD5MYdOw61+Ao1bZ1MPJWJDjw+zZGSR4jB4w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLusZIYX0pQXPPdH+DdFaZe3/bj3mgdaXQMRh/9mRteoZnBLJ5D
	km7JvKlUDdaJKEY+5XuNBBvqqETI0OEH6jRMnm1YsQSrilnWMM0Qxu+L
X-Gm-Gg: AYBFou3NFmTnaody09CVQY2RLuqycuNln/t/cGJ5HYLap8LDxVHUlXmJc/jgMiT+vVq
	9W9kcAc/AM62oR8ZU5BEM5TgY6NYU32fRt5UJuktdZXYZUyf1WCYRf+jQk6F25Ks7bri6GZOY+g
	Cn5z4DMU1v1WysEm0PmLx4GUOQEPT1cIT9Manpx+CD47PnMZzymkNtlILsNo2wLPaoLx7pzi7wp
	DFBgPf5veSN5mbvFlGTZhXEbSalHcAIAXjIS8SfbyZlJe7szNNmBOe3wOLS5UaiI8GycW5RnkSp
	5/6CXHzT1HcCgPvJxHSUF9AZ2hkCCoUKWEsSTLgfwdl8GIDMLVgJ6fPz/fTEbpqoRniVrU/+zjx
	o5YIVxl4Sg8GWUsovu32tMkXyDJibi/9d4o7TFxriI6L1k5/gK6BVrKYfXGqAePunFK65IDgkuy
	Mthra2VNlB2HBLUP7uMx8GKnpts43QfR3SF028lkCF8NkxRArzpk3g2uSgnD/pI8PkZxvF01/CD
	Lq0lE7T4peq/MWL2O+SAzjaTTuOQ8ickkXn6fBtDeL8CON0YBDy+R4WjTWChZChlxsDdBTxrVox
	JaD6qyb9b8uh+SNSgtGueLZapSmzU13CZk/ChliP
X-Received: by 2002:a05:701b:208a:b0:13b:3132:6e99 with SMTP id a92af1059eb24-19934a96a8bmr9053500c88.20.1793011861911;
        Mon, 26 Oct 2026 03:51:01 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a020df20sm27897863c88.6.2026.10.26.03.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:51:01 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 3/3] f2fs: refresh superblock CRC after MAIN_AREA alignment fix
Date: Mon, 26 Oct 2026 03:50:41 -0700
Message-Id: <20261026105042.1148554-4-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026105042.1148554-1-teel4res@gmail.com>
References: <20261026105042.1148554-1-teel4res@gmail.com>
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

sanity_check_area_boundary() fixes the on-disk segment_count through
__f2fs_commit_super(..., false), which does not refresh the superblock
checksum.  segment_count is covered by the checksum, so the next mount
fails with -EFSCORRUPTED after the alignment fix.

Recompute the CRC over the modified superblock before writing it.  Use the
raw superblock's feature bit: sanity_check_area_boundary() runs from
read_raw_super_block(), before sbi->raw_super is assigned.

Fixes: fd694733d523 ("f2fs: cover large section in sanity check of super")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/f2fs/super.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b90831e..7dcf15e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4023,6 +4023,13 @@ static inline bool sanity_check_area_boundary(struct f2fs_sb_info *sbi,
 		raw_super->segment_count = cpu_to_le32((main_end_blkaddr -
 				segment0_blkaddr) >> log_blocks_per_seg);
 
+		if (__F2FS_HAS_FEATURE(raw_super, F2FS_FEATURE_SB_CHKSUM)) {
+			u32 crc;
+
+			crc = f2fs_crc32(raw_super, offsetof(struct f2fs_super_block, crc));
+			raw_super->crc = cpu_to_le32(crc);
+		}
+
 		if (f2fs_readonly(sb) || f2fs_hw_is_readonly(sbi)) {
 			set_sbi_flag(sbi, SBI_NEED_SB_WRITE);
 			res = "internally";
-- 
2.34.1

