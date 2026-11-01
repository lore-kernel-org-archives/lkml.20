Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793574367;
	b=1/WWi8u5VPpMKDFju+fRLx2vXtJbWcV266yl50tE7ID0k1eqAjJdNVS2VGpwThi4HPzo
	 mAM6owflbJVW6f02SK4z9QKEvIk/jWOpnSmMSwMxRJ+Qg7QUfj75+xk0lKE54xVgoimbb
	 H26xXa+f1IHkrSDQtlJFxI4++J+t1YpuPQaPgK+bN2ZGA/VDom6ORQKmNLMeRAsaTpNa/
	 S7+tugFdRwn7OiTMGoAoQXvB1yy48VYZlztxhxJM5jpY7d0nQyYryEajplSncjLV46FtH
	 lIJvY0n9c3MvaBTHjzxTxYEtCosiNqpfkKnOgtvmwW8x3u6WvC/TVQfxxVQJCbaQ9Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J+cmiI1xqp/ujbUXhzswjXBwhXIt5ytt47fzXP5lFa4=;
	b=Scr9uU80fyNdPmzGfE3pXIskg7rctUFqPdZqpCloVc92B8+c349KZHSeJWSag+4P/E6i
	 b3JyuUoDsXnTwXs3Ji8yXGhQulazZHIhUolLvt3Bk1/jN+PO/YQ5He7FshQ9M1r64rrSI
	 BlDiM1UbIipyCHZ6oSo4Hyl2HY/nCAY9xSNIci76oFjcdcKkUlL1hOkfIWwbkPncZV5ri
	 V6ihyqF5YURhjvav7MkGXISsZW2QQdhlnB+QnHBWy0I63vryeks0/g3cx4s/lohSRLS19
	 S1QURYaYUo37lSRW4ERjGtOBY9ezoriGbgxVLtYLoVeUq1OUH5AXsfjcgkacrp9tLkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Omt3zbvf;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A5F606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 23:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A5F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Omt3zbvf
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-368c26de2e0so763954eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 15:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793574366; x=1794179166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J+cmiI1xqp/ujbUXhzswjXBwhXIt5ytt47fzXP5lFa4=;
        b=Omt3zbvfgimHpy1ErdH+EoWCEvfYw63Pm/ytO+WpqncRijUa0nvY6mUgTNoelQCPr4
         6Xraz+q4b7Le5akJnGM4L7Yqf4jV+YAatoZlflu6VVMGHUyYbu2AHEBB9WKBQ7L6n9pT
         Q2Te3jH/ZM+fw9lOTXVwK5cGLma0/rfcisjAfiox5diH3nAGJP+ehTB2XR8wx8uDen9X
         +NO/ncQnv5moGi+KlSt/BBwxqeDK9LJ85TGhP/4C0HoLMI0vWo0JcsLgx98KTOxzWImW
         ae9Fg2V/uY7AqySM+ATM7M5UAyOLtMCufIEj/mPhj3wDqJfvNcF2rzYrFxGm/3GAZUhA
         xHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574366; x=1794179166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+cmiI1xqp/ujbUXhzswjXBwhXIt5ytt47fzXP5lFa4=;
        b=IQ/I5m1DpcKaKC2G0NSPzD5Zj92fLpcdQWyq4oNf7u4JdYbKB/TX1iotgj6UuMNiCd
         f50FmfQxM6BlFt7aKWkvADcrDKVkgQQOUNMtHqFV5ei3CzIPmWEsuwJ1GdJfmgOXoag6
         fYslcd1pr0mpH/SG0LC4znPCBPjExBcb6o6Fggy8009nYFvLNzZ5JNXupyu2H+5d1qUq
         nQZgAQzK3pVgkXFuKe85Sr6cmOzfQfLSuMmaU21jIFdQX7uSZQ5Ce7dMIDLW5tkdRPyp
         ML7BoEdRLqjc0KjDIXcPSzEmcEtBn4KqfMqvUZajiNg9M0A9bUaLtxEWm6KDLcA5fVCH
         zS5w==
X-Forwarded-Encrypted: i=1; AKwUvBybIXS87rKMD226yd2K4Ttgr3p0X8PZB5+R9hSxqdr6byjrADP/EJJOHKVZ+o5F0wOKckinC2vbWWEI+yw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qdgdjyoRyErQVJxdFMcyfTfgeoAZtBq9bmKZN4DyLAjJp+gyO
	8Yufj4Rba9kpnQIYgL0D5Ve+crwNPYn3MzIE9l0yWUDNCxYvTSxO3MGj
X-Gm-Gg: AYBFou3GwvDHxjkbUEClirRZ0CqmetwEesymNJN7ekAzn/fEyTziU/MdD45HIcMP1oa
	kj+Kp2mcDwzrcCJbdW56L2WPJnDMGtxLcnYv/v/XxkKccV1LDHOc6oj+pCubPa7+Bkw8VrBpPHq
	zC7FKDPUJXHtSGSGX9a1K1MmRcwCzlUvKM3OrxoZsLfqIsLBcyGIb8rgJOcHiV82KXRq4oV73PE
	Y5W4AFMiYjRkOqXVqhvtDDrV3wvjpJTz4iEaWBVtHMnqawTS4dm3J3SubbdYHTZ7KcM08gq7yc/
	n//I1x7R6Yk6m7K8K0xjNsrpt6PpxfUY5o0mpGlVxKOQnqL/+60GovY9NXE/LyHYNMG4JakMM1D
	7q1SjSwa0hYQl58voePhivalLF9JA/xhVNzLQXypBKu03Rj2zit6YawLI2GKHTH2DQ3jMuRjCKf
	tDNgz/WkBgG/6Snuox7uFGvyjfpIccnpY485PbCNT5Ml7/rynwapOArpvuhR45xP+lxIzp+r8Qp
	cAbDcrmrGAQ7f6s0YpQJw3gS+Hb9z1lwKtsHk3CRsIyoq6hz6pLCQzRIkcukwQM4+gqXl0OMDpw
	DmaXPI2osqQTVOOj2q5Qo1WaEGNFDk3DyV1vE1Emosh0bu7Siy4G4HKa
X-Received: by 2002:a05:7300:d0a5:b0:36a:1b23:a1cd with SMTP id 5a478bee46e88-36a4239359bmr12353084eec.9.1793574365578;
        Sun, 01 Nov 2026 15:06:05 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm35600582eec.2.2026.11.01.15.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 15:06:04 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] f2fs: report sub-block project quotas in statfs
Date: Sun,  1 Nov 2026 23:05:52 +0000
Message-ID: <20261101230552.55034-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

f2fs_statfs_project() converts the selected block quota from bytes to
filesystem blocks before checking whether a limit is set. A nonzero
limit smaller than one filesystem block therefore becomes zero and
skips the project block statistics.

For example, on a filesystem with 4 KiB blocks, setquota accepts a
1 KiB project hard limit, but df on the project-inherit directory
reports the filesystem-wide capacity and free space instead of zero
whole blocks. Quota enforcement still rejects a write that requires
another data block.

Check the byte limit before converting it to blocks. This distinguishes
a sub-block limit from an unlimited quota while retaining the existing
rounding and free-space calculations.

Fixes: ddc34e328d06 ("f2fs: introduce f2fs_statfs_project")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1071059f2cc2..f1e98f5fa350 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2228,11 +2228,11 @@ static int f2fs_statfs_project(struct super_block *sb,
 
 	limit = min_not_zero(dquot->dq_dqb.dqb_bsoftlimit,
 					dquot->dq_dqb.dqb_bhardlimit);
-	limit >>= sb->s_blocksize_bits;
 
 	if (limit) {
 		uint64_t remaining = 0;
 
+		limit >>= sb->s_blocksize_bits;
 		curblock = (dquot->dq_dqb.dqb_curspace +
 			    dquot->dq_dqb.dqb_rsvspace) >> sb->s_blocksize_bits;
 		if (limit > curblock)
-- 
2.43.0

