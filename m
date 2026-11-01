Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793536024;
	b=xUtyfeE07P3aYoHGRnuqbwznc4/xZaLTvqqpH/nnh8jRkYVFokcCoJ1xBiNY3K1VgjJS
	 O2rxsWv2PqglimtxlwSLyNBX/RonBbReg0m/Le2bY5v9khJ+I0G3/VYfEj6DEkjTUpdtR
	 FLRvYkntS9WEI6KnCCTooUcpDkSDZz2wOGKsUT5WqV3esyq8xK3MgihQJGwjZxw53QKVH
	 sLpz6hg/QocxS01r/0iigaTehnSuDjF51svwlqeRk+cMgp6U9YTlLBmlTc3M0sJQ7M7Dz
	 KCCNG22MmlZwCk/PrcvCOVEDTBa8t/c8dRd6KBsgxTK+ImEUmrgYnCffmEdTzxSrQXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793536024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dA762MiX0XGurLRN9b/6HziROeNi9rk6flm5jzR8jYo=;
	b=wfbGkQY5z3bOILxtnRvzTr72jB4YFe+5TtuMTRlRzKD5W2jgRk1oXYXRcx6jHSKAf+yu
	 2Ixtc1JcqgrBgPZrEW2Srx09WU6M1mMgyMbEg8tEhXt0Ua5S29LBpT95EL0B+6K7RMAl3
	 Xj6JNEdEeLiPVNEM8gVd7OxoZqECOWk2L5/v42Jv+l0IBSLmaiCMOY7QUwLgjJsBT5FyU
	 KDppgL3R5pOfAnNJpHJN2u0mR+tsdy4BlD3Kn/u/SBTedoBSmQvN01DEmW2Je0XAiUHoh
	 AEBHGYLjkCJDTMen6YD/PlosURtXq6Np68jDFT6SRCqPaSeHuZ3jtaZK99SL5GURNEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6D1uRfG;
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9289606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 12:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9289606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P6D1uRfG
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-36a1e794908so685075eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 04:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793536023; x=1794140823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dA762MiX0XGurLRN9b/6HziROeNi9rk6flm5jzR8jYo=;
        b=P6D1uRfG8WudZj/+HecnHpsWSnmftBDN7rVF8yIkxqhq2ChaZZKowDsM4BkO2na5Mc
         yLxxVJ7Wo3+FdtbcBiD6qiqfwa/QRFGI2gcSfYQKro3frJSMTyehnAlSRv3TlJGJx3Cb
         7YcC1tqaP3v+Tch2I/ty7Ts2xkLBk984B3KFD9TBN58x66f1YhN29BSCMqMjBgnHE8zD
         snsnDGDhg4XyIsUCXNSnjFBwaaPY6MhMt7vXXnc9DsA5CMXC+oSFOdkkSlAessETm3mk
         MALGFJAD89YXM+y+nODxqWdv0S/GEIij6llGIGzWEH2D09xjFndxNA20IOoKkcnX7Hwo
         zgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793536023; x=1794140823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dA762MiX0XGurLRN9b/6HziROeNi9rk6flm5jzR8jYo=;
        b=QF65Y+ohEGm0v017Sh8owtjPX7CH5jiUC8jFb/OMGMXyVTu9aQ5yK2HLHm1LKzwwgs
         EPktawObTwD93iDDR1yUaZwo+r8dK9XgCLSAbsCavz1RR45LOYKJWA3gamFjMMUdQ6iV
         P4sTFITQRgyNR4eKf3nXW9Hcfjhz7lBC+Yx+hNTrL2dj7TJcy079c/bQw4VACPiELYES
         TEbjYdsoT7uFVP0FpL6JbUPQ1KoHMiJ3/YEhZlcBKSsSp6xrafCiY1NMd7poavgn2g/H
         SunL7IWbI2H4YJQ8ojG8dbxdrjpKtxLOlA6hik4Vb+giaoaEXmoX0aHoDg4oAtMLC0aI
         k48A==
X-Forwarded-Encrypted: i=1; AKwUvBwKpzgADZQDewgFMkE+wBYHWQ0IwfVSKujGYVfPqv7GfAeQ7mxR1pkg2N2efKgsrC2lEx9e1KjEX1PaLrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB2b4OM9aH2uf4u3CpchbyyvPwAQfPC1ugFLW5mKm+ABS1s/mv
	od27974j7OEHJOFdPCT6GIACbOhs8S5iT/E8UtwDioMt4Vfzi5rb1oIA
X-Gm-Gg: AYBFou03DuttvVs5YyozmLqs9OP56Uv2JWPwjJPOHTBbrvcFIm57QZ87xMVsIO4pyuU
	gyVvMwePtbkv8Xdcz87EVaYr9U5XMkACfaz6GpiviPDFNSgJUd4N+4A2HDrDMZu5jkil3rxfV+Q
	AajOLOjhKKngIl8cR6FNTw24eIXAaEY9wcEaj+C/z3EE//2vDHqejz+2h+3oeUly4T1zsKwoFmn
	ZPw6f4HAz3pgA83R/lFpEyFhB0QFm7hlLB4Jyrp7pmVjQ2ztopsP5BIqNZNRMO57X3APEVaBuVA
	UgxwyrJo25tyWFaCc1LOdb4+ZiLlTbCb/yfHe2SK13nefhpI7zLNxO4nKg3/k7tlS8WFA8RGxlx
	oQ5tEhtTl6vBTI5VHsqU3LRyQEM37YsH5hUHRtcJJAA7KtxRsg1O9doOcF+PxobIbhS/USr9mwv
	SqpMlid4g9BQ2kbavssAzKcscZjOyQWyY7WvX6ieTWDHAgwSPkEyAC/nIa2V1tyWsKMaO+2yCRd
	IkE5buBDYsOOWPlUuuLsHt4wl/x3tDxAAjH4kfYWUjbJ9J/NVhniy1GS/6Mezl7MryK0R+w3JS2
	xrhftL//+Tcp2tzizpZklNSFHDulSGBjEN07z4v/e3mCKOgMNQZmzAL50GsHOgm2q+lngbDqPdO
	+NA==
X-Received: by 2002:a05:701b:4206:20b0:1a4:9eaa:d01d with SMTP id a92af1059eb24-1ac5fd08905mr10832402c88.45.1793536022578;
        Sun, 01 Nov 2026 04:27:02 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm27845234eec.9.2026.11.01.04.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 04:27:02 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] hugetlbfs: report inode limits without a memory subpool
Date: Sun,  1 Nov 2026 12:26:53 +0000
Message-ID: <20261101122653.53982-1-dennylin0707@gmail.com>
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

A hugetlbfs mount can limit inodes with nr_inodes independently of size
or min_size. hugetlbfs_statfs() only fills f_files and f_ffree when a
memory subpool exists, so an inode-only limit is enforced but its inode
counts are reported as zero.

For example, a fresh mount with nr_inodes=4 reports zero total and free
inodes instead of 4 and 3. This hides the inode limit from tools such
as df -i, even when creating another file fails with ENOSPC.

Report the inode counters when an inode limit is configured,
independently of the memory subpool. Preserve the existing zero and -1
results for unlimited inode counts.

Fixes: 74a8a65c5261 ("[PATCH] Fix hugetlbfs_statfs() reporting of block limits")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/hugetlbfs/inode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 01c4d6f44ebe..e94ee8e17004 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -1113,6 +1113,8 @@ static int hugetlbfs_statfs(struct dentry *dentry, struct kstatfs *buf)
 				- sbinfo->spool->used_hpages;
 			buf->f_bavail = buf->f_bfree = free_pages;
 			spin_unlock_irq(&sbinfo->spool->lock);
+		}
+		if (sbinfo->spool || sbinfo->max_inodes >= 0) {
 			buf->f_files = sbinfo->max_inodes;
 			buf->f_ffree = sbinfo->free_inodes;
 		}
-- 
2.43.0

