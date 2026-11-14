Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794619062;
	b=cVUKkQyAVvGf/2bCB+zHFp2E3a692rZTHcJ7ch27YCzTrMKda0qw6yGylogFVs2wOib7
	 cNXlIpny0nwdIU5b3gr5cur/JMUtzLZ7KzblL4/i3Ec8iX2HW89RZS2TS3tqUDY5J895J
	 S/zys+/GG0RHhaGJGs3BKPTkeV9bBvfTYLlvhK/9NGT1555mCDvmxzcm/Q9T3xFHYyksn
	 GBLvWq2odYY2kQNiuGxRQzkROWcAV1+ejWnn2PbACIVdkaVbvMCitD990wDz2rLAoFDbl
	 0BLFCwq+YsLcbIAFUav9BNA86c8AC5Br2xny8fUJxPjCAzd83zPO4FF/QRaCvin5mJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794619062;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=6UTFVXkWgy98qyxzLDJCgKeEPxYMOKuPd/fVMWkBbdI=;
	b=JtTYTJC3Zbv8743vukzEbJw3LEbsiJgZThwZanDnBhTaqyzRInaFo6gUR4VStdWIbCJE
	 9bDZcwKxFRiu7cgmWY9M0MnO9aAfmey2wSBbf3SX3Z1xh7UnsM8zt6E1a8sSUNLW34v7j
	 HP2o1Uq3sksaTxRuW+xBVCLWrqEXF3YY+1m2HJiYus7OuL0zNt4apo2QDPgpJFXyPQU7d
	 ckV3lFDZuEx1yS/oRObJGfZn1ugfZ3MCfoKFmBijYKv1quBA40WMsRqjpimSq04hXms40
	 VjDpS2aFpz4z21COYnwEo5eeRYZJxPcaRodcAiqelvU5YPElst30h75ns3xlUFlOYBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kX9hKh36;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E03606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E03606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kX9hKh36
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e9995ce866so20816815ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794619061; x=1795223861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6UTFVXkWgy98qyxzLDJCgKeEPxYMOKuPd/fVMWkBbdI=;
        b=kX9hKh36pxemNcexnCX39UEzfziVFKCl3tM4J2dJKuclvgLVd1Df0FoXZM8ZtUT2J8
         ROra1X3BWyd5gxl7YQRf8OXWveyre3U2ckVTSQ9PIqfbR2NDMXSEH4Q7GENO7izM93HX
         RsMkAuBLqNL6kvtrGJrlFIAgDridFz+1ihRXVtZ3sQuTzEWrqbZ8FhIQnLnAHXTQqsH4
         JCg22xA/YQbNv2T2HBv8JnlfHVw/ewZh0OsIUykflg1+2GtggnSalZHV1TuzfXAxihdm
         CouVDWTJSbGclOfDKXHUitvZA/CitXxiPgyK8E3GVLCB6UsRXard7F0Lz5ZRjJo45DSB
         GGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794619061; x=1795223861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UTFVXkWgy98qyxzLDJCgKeEPxYMOKuPd/fVMWkBbdI=;
        b=k5R10jjbBKpPtj6d8bQGtv5lrq/icSm42vXuR9FTgTW3sjDhqL+8rzOkGDEClmxllc
         YB0GSgOBeeOITLFJ1Jczehd6FCChdLB/VDS98r6w8t8ls4hZd9Xalwebkmi8aGFaKHb3
         0LTNWAHjL+vCfGIUnTIFRupxZrUeOsM2duNt5TFWHwdRMU85uDeHPL1I+ZyTSnESDjd/
         pbkIVlbdw0uRTBj/kYZudN/IYFU0E4ygAEw2T8phW84BgW3c+bev+Vv/mcTCpitpxlVY
         csD0REbSC40PTZfUD3/DN9xtlJa7ydkjGURgDT6u8mC1cXHkhvl+g0xvhfzA8QUx/v4e
         yrDg==
X-Gm-Message-State: APuU4Z9H/FP0FnShzulWkt9p9Rf29W5pqOaC7tYRG3c2p6N7jm70FC7U
	wtjuQro7/np8TPVT8gvziJJDg+vuPfCi4bN+EaJryp4kXNunc87T5oA+jiD3Jw==
X-Gm-Gg: AYBFou2QANxeLEEMSo5bonLJGfRCM3UDPOPDzd7LDaWEFQdobKTKbHiJ2xwz3PkR+Lp
	97Pd8oQU72qFR1KF+c3X0I5MuAbO/9JFVWE9rTNpeKUmL83ByUTQJIDQeJhrqsvmuwrSVdigVY4
	de1LQ3uWIxlaWxMEKU8CEmsPLPmD49MIRqY2STH/0104oFiyR/jEbTS3HXciwkmo28seQjvAkoO
	BzDW/+xAMjUCORcD+JlkfXuEBevKYANtMWScSnKf6bNN6MZ0gVTYVKs3BCyJhzZ2ihugjiqKFtJ
	P50pDcx0L/9mZpEC1lwWj0R4L4poJqpzy1A5K7moIJ3zRhGJ7OvI1p28m7kvkR6wcQpu31Zq3sH
	d5ed/PPWVgQKxCMytqJmj53WtXPHD38vt9OxcuSlaz+SraqfM7AZhGb8K9rOZz2UOFAlPrk+kgG
	zVpjC5SgDmxBBnowlq8CZijjbPzPW5/M8FoY0GAt44UaMnoqrUiLAVu3qjVQuVq85PRsRU+GlKD
	VrQBzCsW0S5j6SBF/ueommsQmC3dnT4j3OfB8NknKiqUBsuDhcpDoPsb2tReh+d6w9cGovov/XL
	opDzG7TCU3DF58kzswhaY/0loLbgz/2rw8OU4+zwkp5nP3TCImt1upORr8nf0m989aeiTK7/GEa
	X7q0gydHsja96RlSVR3prWTV186exUjHXaDmkTn9ITSO1Kb8=
X-Received: by 2002:a17:903:41c4:b0:2ed:cab:e977 with SMTP id d9443c01a7336-2ee0da966e7mr44417145ad.12.1794619060990;
        Fri, 13 Nov 2026 17:17:40 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4acd77sm16792445ad.3.2026.11.13.17.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 17:17:40 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	stable@vger.kernel.org
Subject: [PATCH] f2fs: avoid underflow in get_available_block_count()
Date: Fri, 13 Nov 2026 17:17:34 -0800
Message-ID: <20261114011734.3806377-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
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

get_available_block_count() subtracts current_reserved_blocks,
alias_reserved_blocks and root_reserved_blocks from user_block_count
without checking the result. Only unusable_block_count is handled so
that the result does not go below 0.

f2fs_ioc_reserve_dev_alias() checks the free space with the root
reserved blocks allowed when root calls it, so alias_reserved_blocks can
overlap with the root reserved blocks until the reservation is turned
into valid blocks. For example, with

  user_block_count = 1000, root_reserved_blocks = 100, valid blocks = 30

reserving an alias device of 950 blocks passes the check, since
30 + 950 <= 1000, and sets alias_reserved_blocks to 950. Then, for a
user who cannot use the root reserved blocks, the available block count
is 1000 - 950 - 100, which wraps around to a huge value, so the check in
inc_valid_block_count() does not stop such a user until the reservation
is done.

current_reserved_blocks can make it wrap in the same way, for root as
well, when reserved_blocks is written through sysfs in the meantime,
since it is set without considering alias_reserved_blocks.

Sum up all the reservations and return 0 if they do not fit in
user_block_count, as was done for unusable_block_count only.

Fixes: eae3faf210bd ("f2fs: support dynamic reserve/release for device aliasing")
Cc: stable@vger.kernel.org
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
This was discussed in the review of "[PATCH v2] f2fs: reserve space to be
shrunk during resize_fs" [1]. v3 of that patch is sent separately on top
of this one.

[1] https://lore.kernel.org/linux-f2fs-devel/20261022165526.1539629-1-daeho43@gmail.com/

 fs/f2fs/f2fs.h | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 50a5f845176d..59bc3c2fb70a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2710,23 +2710,20 @@ static inline bool __allow_reserved_root(struct f2fs_sb_info *sbi,
 static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
 						struct inode *inode, bool cap)
 {
-	block_t avail_user_block_count;
-
-	avail_user_block_count = sbi->user_block_count -
-					sbi->current_reserved_blocks -
+	u64 reserved = (u64)sbi->current_reserved_blocks +
 					sbi->alias_reserved_blocks;
 
 	if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, inode, cap))
-		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
+		reserved += F2FS_OPTION(sbi).root_reserved_blocks;
 
-	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
-		if (avail_user_block_count > sbi->unusable_block_count)
-			avail_user_block_count -= sbi->unusable_block_count;
-		else
-			avail_user_block_count = 0;
-	}
+	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
+		reserved += sbi->unusable_block_count;
+
+	/* the reservations can overlap each other, so do not wrap around */
+	if (unlikely(reserved >= sbi->user_block_count))
+		return 0;
 
-	return avail_user_block_count;
+	return sbi->user_block_count - reserved;
 }
 
 static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);

base-commit: b9d7379d10d43386b59082da8c9a0b111e054781
-- 
2.56.0.611.g1030f0b940-goog

