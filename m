Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDDA3254A0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790133746; cv=none; b=dIQzluAlECniWGyFl3Qr9P7KT7Jd5v5PKDD9ifk7CHQoC2tI2aiaQlF8siYP4+qUjRPm14LFBFQLBKLpS0M2VDBUj81Qz0UWn5DpAFh5uLzrDhvxXynbpQE53vTifZFMDsJQZTr5FnEZvFs/5ZRNAJKUlpMzh2ucIs4tUEduz5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790133746; c=relaxed/simple;
	bh=dReaEMLMAOUfB+Xbi4GNyHUaciiPTAVjXlxXODQA56s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmwH1lMkp7J6S0ZKAlfyvQb/q5/92901fxtxYaGXhekFVlej35tu1+PX01DUA814eXPBoI43HtMpHeVqGkPELcF1fURwHdLYoyBZ3zvYFAg6F1IZQ60z1SSGcEMNkq5SUrQYCX8dYrIvJEjOsZZe/ptWfsmjum5Y593OY2BmdFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=Q/9anoxf; arc=none smtp.client-ip=117.135.210.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="Q/9anoxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zS
	HmKqHcFnIUZKWVcKwiw19/wD5lM0klypYXugvrpJs=; b=Q/9anoxfMOfC7x71Te
	fR/VRcpIsCe8OySm04DQpvNtNiHzidRzi6v/+aGRKSPVrCVHdboT4LXhIoRVpblm
	34LyBmge/ChDe1dkgxpunzRCbWb2Qzv+mz9GmxcQGuspPD+BxRYzvqGEpNpGsRDc
	bSmFLL9nKnOxRANnyL8xuP5nE=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3t5m9RbNqKbJCAA--.1172S2;
	Wed, 23 Sep 2026 11:21:34 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: Re: [f2fs-dev] [PATCH v2 04/14] f2fs: support atomic file large folios buffered write
Date: Wed, 23 Sep 2026 11:21:31 +0800
Message-ID: <20260923032131.2227703-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <51c3f1f9-7e91-4f9a-9f22-d1ba8df357c6@kernel.org>
References: <51c3f1f9-7e91-4f9a-9f22-d1ba8df357c6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3t5m9RbNqKbJCAA--.1172S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF47tw1fGF18tF17AFy5Jwb_yoW8tw47pF
	WUKryDJrWkXw12grnaqa15Zw13Kry5Xa17AFZ3C3W3Aas8JasxKr45Ww1jkr45tr1kJF1I
	qF4UtF1ru3WDtaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRuwZsUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsB4I12qzRb4ezwAA3C

Hi Chao,

Thanks for the review.

I think I can extract the duplicate logic in a helper and the full change
may be like this?

--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4721,6 +4721,31 @@
 	return 0;
 }
 
+static bool f2fs_try_balance_folio(struct folio *folio,
+		struct address_space *mapping, bool node_changed)
+{
+	struct inode *inode = folio->mapping->host;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int orig_order;
+
+	if (!node_changed || IS_NOQUOTA(inode) ||
+			!has_not_enough_free_secs(sbi, 0, 0))
+		return false;
+
+	orig_order = folio_order(folio);
+	folio_unlock(folio);
+	f2fs_balance_fs(sbi, true);
+	folio_lock(folio);
+
+	if (folio->mapping != mapping)
+		return true;
+
+	if (folio_order(folio) != orig_order)
+		return true;
+
+	return false;
+}
+
 static int prepare_large_folio_atomic_write_begin(struct inode *inode,
 		struct address_space *mapping, struct folio *folio, loff_t pos,
 		unsigned int len)
@@ -4728,7 +4753,6 @@
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	size_t ori_off = offset_in_folio(folio, pos);
 	pgoff_t start, end, index;
-	unsigned int orig_order;
 	int err = 0;
 
 	len = min_t(unsigned int, len, folio_size(folio) - ori_off);
@@ -4774,16 +4798,8 @@
 		 * Expand the 4K-page balance decision per subpage: check
 		 * right after each preallocated block.
 		 */
-		if (node_changed && !IS_NOQUOTA(inode) &&
-		    has_not_enough_free_secs(sbi, 0, 0)) {
-			orig_order = folio_order(folio);
-			folio_unlock(folio);
-			f2fs_balance_fs(sbi, true);
-			folio_lock(folio);
-			if (unlikely(folio->mapping != mapping ||
-				     folio_order(folio) != orig_order))
-				return -EAGAIN;
-		}
+		if (f2fs_try_balance_folio(folio, mapping, node_changed))
+			return -EAGAIN;
 	}
 
 	return 0;
@@ -4876,17 +4892,10 @@
 	if (err)
 		goto put_folio;
 
-	if (need_balance && !IS_NOQUOTA(inode) &&
-			has_not_enough_free_secs(sbi, 0, 0)) {
+	if (f2fs_try_balance_folio(folio, mapping, need_balance)) {
 		folio_unlock(folio);
-		f2fs_balance_fs(sbi, true);
-		folio_lock(folio);
-		if (folio->mapping != mapping) {
-			/* The folio got truncated from under us */
-			folio_unlock(folio);
-			folio_put(folio);
-			goto repeat;
-		}
+		folio_put(folio);
+		goto repeat;
 	}
 
 	f2fs_folio_wait_writeback(folio, DATA, false, true);
-- 
Nanzhe Zhao

