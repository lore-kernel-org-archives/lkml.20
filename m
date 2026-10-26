Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974238;
	b=xdboFTqxPBs0EJ0Xto+JaT64Dh0d32UOYoD1WkF9CNPBlSP4c8sqdRMcbYOe+80N9KWC
	 JdubUpRVQHgqD2Lzc7nwBgaTGDdF7CDFSJ8Lu0soIM6Mt10HIxsA0dBdDRvWNP5TWohgm
	 UUF5dYoSQiZgU4LjPV4a0SVdzo5DLjwDqdE2mqrs69sLmnKQIn1lTAYjcb0d03vzBZGBe
	 SlVWZr8Md54GDfNHMuZcunETpE/rd0yTkIVUdKaXFLADS20vNRCWwqxrkhWq8Tvhu0wUq
	 mHKm0Ss8GeojCAkJl09+hH730qCKM6etJ7gcuwRT5ZlTKkEGNgrWq/f/CCvwy1JXxEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974238;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dqpn0VOvid0Ccj1QalYb9m3wlp9UzSVV8m4iQZQdUq4=;
	b=4H01uICGmFIzoxH91f3b8uW6rfh3hsMQUOpeCWp3VH7uoy52NRPgvp38cU/cI1JmunrY
	 PKQYkYafRMJpObkmwweg2CafCk7ICBZ2xMcHO7Jh2EpXyFAnpI97RuJHXIotmn4R+oUp9
	 L3aDZmYoyjeEDDUsZyqviUcRTozEt2SWg14+Dq1lMoW6ymJwLxZXPBIfl1nqKC0Ygsjgd
	 57w44bnfmYCF51H+mmvWQw6itgBRGKL5dlLsT1AagAE4dzDm268eTErEPaXMhHxE+apOH
	 TFKCJ6yIt/lvuBwlpzfT44Y/rPj4HLcsT1SRciFxExqqvtipW3OMOigbCHPWVGGI0tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ViDZsyXi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29F1606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ViDZsyXi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E11E1F031E4;
	Mon, 26 Oct 2026 00:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792974237;
	bh=dqpn0VOvid0Ccj1QalYb9m3wlp9UzSVV8m4iQZQdUq4=;
	h=From:To:Cc:Subject:Date;
	b=ViDZsyXiu9itni2pmBDvfVFt2UQgOqOn0q/0SlyWyPyIAU/YKzMGQL0VZtxCUTH0r
	 UtywuKmYkhq0PzMIfQcmWtnddwWL3t0xD1R+U6PqyJR0AFaWoBMjMajngAoucdjcl8
	 ggqo+1I9QiAdqQhZWnRxl1astjjopA3pWp2BK6dTo8G82hW/RnUmKKcGG/6lWeujXF
	 po+2oTSuANocL0h2e0SxQpZhZ/Z/hYuGYm6WNDPzPcDVMjh1lHytcPr7v7nY3LPLQT
	 50zNORp8pwZuBj0upDXhaQdcSrl5I2B9L9266J+xno/hircS42lv/ODY+uDStCTvy1
	 dFSN08jL74PSQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH v2 1/2] f2fs: fix to fetch ino via ino_of_node() under cache lock
Date: Mon, 26 Oct 2026 08:23:49 +0800
Message-ID: <20261026002350.1451587-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
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

From: Chao Yu <chao@kernel.org>

In f2fs_writeback_node_caches(), it's better to fetch ino via ino_of_node()
under cache lock, otherwise, node cache content may become stale after cache
is unlocked due to racing w/ truncation.

Commit 493b9dc8b52c ("f2fs: cache: use node cache") fixes similar issue in
f2fs_flush_inline_data() introduced in commit 34c061ad85a2 ("f2fs: Avoid double
lock for cp_rwsem during checkpoint").

Cc: stable@kernel.org
Fixes: 2049d4fcb057 ("f2fs: avoid multiple node page writes due to inline_data")
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- no changes
 fs/f2fs/node.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 424e95ca5878..44f94000d452 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2195,9 +2195,11 @@ int f2fs_writeback_node_caches(struct f2fs_sb_info *sbi, long nr_to_write,
 
 			/* flush inline_data */
 			if (f2fs_cache_test_inline(entry)) {
+				nid_t ino = ino_of_node(sbi, entry);
+
 				f2fs_cache_clear_inline(entry);
 				f2fs_unlock_cache(entry);
-				flush_inline_data(sbi, ino_of_node(sbi, entry));
+				flush_inline_data(sbi, ino);
 				goto lock_node;
 			}
 
-- 
2.49.0

