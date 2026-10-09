Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933654F30DB
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563369; cv=none; b=Gz9RK3lvhVdWCste9HEAWZbwRG5itRrY9XBiEY2J2WfUxnsBAVHQczbEyPWtqUDtAQWIiGcWtALr0RaZvdudoRYnT0VHCfC1tjwCpjxQ5zBmq4zym5E48X5Xybi8Jjm4KMBY0hVLjzuWJ0TvlboGQNCJYqE5k1NRBgpG0cPw9LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563369; c=relaxed/simple;
	bh=sLvEgbiTLO6arejuMHgg1E+s2vzm79Ide+972SXNph0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WoPzpI6+8J9Y/kO3STJCoWL+ItNAdF2SnSJhFK02bx7gbSZxxPlZrhH3mDX95cEL5mR65SWmgz02NejRWDDj36PHXg7gsTfWD1s38nnQIYFgenP5qatFs6HzaEfCNX/qDXW+tTIGfKCqXoPYwJexgV2t+UJs8Acbj6xOcHCKIO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=T/P+foUZ; arc=none smtp.client-ip=220.197.31.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="T/P+foUZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=1c
	Qk51XlykcZdSe2t0RhAhWZuNMJRxECXtGiWzf02L4=; b=T/P+foUZ4FinYEV80K
	CkUvzHYfv7Zt5q8NqtszQkie1BO+VW3vVtNEgga2IxMP5A3Oaz6JNkWbUKYQRV+D
	AK3v1VbMXeDrQnAYQ4KBsGz5KRKg++yKR2Ve1TmP3VduE6z93DZjF/R94tHpS8GB
	UvdJlAA/tl7gpNoyj2Gf/9Xsg=
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PikvCgDH3_w0FslqWTz5BA--.13078S4;
	Sat, 10 Oct 2026 00:28:42 +0800 (CST)
From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>,
	Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	linux-kernel@vger.kernel.org,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	kernel test robot <yi1.lai@intel.com>
Subject: [PATCH v3 13/17] f2fs: wait for folio writeback before ffs_detach_free
Date: Sat, 10 Oct 2026 00:28:24 +0800
Message-ID: <20261009162828.4188050-3-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
References: <20261009161224.4163796-1-zhaonanzhe@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PikvCgDH3_w0FslqWTz5BA--.13078S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7KryUAFW5tw4kKrykJF45GFg_yoW8Cry3pr
	WDKwnrWFWkur17WrnrWF4Sqr1rK3y5WFW7Ca97C3WxXFn8Xr1kKF1kt3sYgFW5trykJr9a
	qw4kAFy8XFy5JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j5yCJUUUUU=
Sender: nzzhao@126.com
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsRugcGrJFjtJjAAA3x

truncate_inode_pages_range() can invalidate a large folio that is still
under writeback, which can result in the following use-after-free:

 CPU0 (writeback)             CPU1 (truncate)
 ----                         ----
f2fs_write_cache_folios()
folio_start_writeback(folio)
/* submit bios */

retry_out:
folio_unlock(folio)
/* all bios submitted; folio lock released */

                              truncate_inode_pages_range()
                              find_lock_entries() /* locks the folio */
                              truncate_cleanup_folio(folio)
                              folio_invalidate(folio, 0, folio_size(folio))
                              -> f2fs_invalidate_folio(folio, 0,
                                                        folio_size(folio))

f2fs_write_end_bio(bio)
ffs = folio->private          ffs_detach_free(folio)
                              folio_detach_private(folio)
                              kfree(ffs)
atomic_sub_and_test(nr_pages,
    &ffs->write_pages_pending) <-- use-after-free

Wait for folio writeback in invalidate_folio, then we can free the
folio state without any other remaining user.

Reported-by: kernel test robot <yi1.lai@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202610081027.b13dcf10-lkp@intel.com
Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 138a77044e95..19072fe7dbe5 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -5347,6 +5347,14 @@ void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t length)
 	}
 
 	if (f2fs_folio_has_ffs(folio)) {
+		/*
+		 * The folio may still be under writeback with bios in
+		 * completion that need to access f2fs_folio_state.  Wait
+		 * for the writeback to complete before freeing the state,
+		 * otherwise it will result in use-after-free.
+		 */
+		folio_wait_writeback(folio);
+
 		f2fs_ffs_clear_subrange_dirty_and_test(folio, 0,
 							folio_size(folio));
 	} else if (folio_test_dirty(folio)) {
-- 
2.43.0

