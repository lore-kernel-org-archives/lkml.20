Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792673909;
	b=CmbIUWmxivCby03/6dY6m58DC5e5ojeJmQi8ut05TmwDrkGvyVvI4qs6PCcLHxGhX3Ov
	 2Q9CiQ4XdRNuHbowI3doT3C/PaWPRaSwBVVjV7CAHY1PQbp4x3BDUsuCI0CINpLBTj2XS
	 Vh8NldQFs4+C6mXNnTkThDiWHuKLBsr3W0htFmHItNMHCgGIkDyiFPJFjI93ubv0L5jbP
	 rI2BIeN7igcXdUTF0MbzRQVnjm50f9rEI142k8JVaY8usx+/1vZmCdTbczMBgdlOwx1NR
	 +srvfw+TdUnNuU4OuU6ZGHHZnjh2GtLAjAVGe0as4zOly4z+dkk9TUeaj206U3eBeFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792673909;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jZNTFDjvlc2OSdmDcua0wTZOBCzRjuz7YZGbODInL38=;
	b=ynqwmsPLZ1XVh0DzH+16ueuN11OFI2CUJAW2w+zQl3EjoB57NVAPMx3CT9l32eZNOe4E
	 SlZTw1Mq5K2PFZhcWEBdfycdFHCXAyVZbgZcFOOdb6jM4moAB+wJPugkN0461vdxYCR4w
	 F8lYJD/gu5NP7Tb4o+M2qgoWRVZXNqePykDX6gC8JObp1MtPbY6ucLB58v7zf0AX2p+24
	 HIFX1/9buGCk0b0f8KQmfrUgcCfz3M2FT5Qw9tz0oTGNwROblMXvNKjLi9NUW0/1M3y5n
	 9hBJINFQSb+tGdREL86DsZHW18jaLGVqCi5iesSjc3urSmjg3IOp+MNvxDBc1yE0qEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="h/bENH9G";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F63D606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h/bENH9G
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252961F000C3;
	Thu, 22 Oct 2026 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792673909;
	bh=jZNTFDjvlc2OSdmDcua0wTZOBCzRjuz7YZGbODInL38=;
	h=From:To:Cc:Subject:Date;
	b=h/bENH9GFm9FOHVlIydlO1kTVa/4DxCpbz4uyKCed+52CcwccXV5SdAnxucl9bSQ9
	 cEemWV5IYwHPD+alsmzV6qCwljb2FyeLINidynzLIShcMERyvdVqXBY9SWbj4JPpIN
	 TEhlY14Q/9YdvJlPcDdvfOpxD2ObuQFvW59C5mdWVVrdyTka5zjRsFzdMHuHx0+t3u
	 fTnUAejYY+HDDEnu2rFRe+zmXLL93gdKh++BU5yo6tci62qt/U0rSTKeyjzV6G8Q8n
	 d67H3aDYRsUDyWoPrU0uAIW4kIom6VW2CZcjGnRTW1xBLj59wY0iTA6JXnnwH8mFln
	 c+jWhKg5uAYDQ==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Chao Yu <chao@kernel.org>,
	stable@kernel.org
Subject: [PATCH 1/3] f2fs: fix to account entry_cnt for all write bios
Date: Thu, 22 Oct 2026 12:58:18 +0000
Message-ID: <20261022125820.2210579-1-chao@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
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

Commit f32744a8b83d ("f2fs: introduce max_atc_write_bio_entry_cnt")
tracks the number of entries queued to a write bio via entry_cnt, so
that f2fs_write_end_io() can offload the completion of a write bio with
too many entries to sbi->wq if it is called in atomic context.

However, entry_cnt is only increased in f2fs_submit_page_write() and
f2fs_submit_cache_write(), it misses below write paths:
- f2fs_submit_page_bio(): single folio write bio.
- add_bio_entry(): the first folio of an IPU write bio.
- add_ipu_page(): folios merged into an IPU write bio.

So entry_cnt of these bios is less than the actual number of folios,
and a merged IPU write bio, which may contain up to BIO_MAX_VECS folios,
will never be offloaded to sbi->wq, then it may be completed in atomic
context with high latency. Let's fix to account entry_cnt in all above
paths.

Cc: stable@kernel.org
Fixes: f32744a8b83d ("f2fs: introduce max_atc_write_bio_entry_cnt")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index a8d39add5cbe..16ab2c693aa9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -870,6 +870,9 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 			fio_folio->index, fio, GFP_NOIO);
 	bio_add_folio_nofail(bio, data_folio, folio_size(data_folio), 0);
 
+	if (!is_read_io(fio->op))
+		F2FS_BIO(bio)->entry_cnt++;
+
 	if (fio->io_wbc && !is_read_io(fio->op))
 		wbc_account_cgroup_owner(fio->io_wbc, fio_folio, PAGE_SIZE);
 
@@ -940,6 +943,7 @@ static void add_bio_entry(struct f2fs_sb_info *sbi, struct bio *bio,
 	bio_get(bio);
 
 	bio_add_folio_nofail(bio, folio, folio_size(folio), 0);
+	F2FS_BIO(bio)->entry_cnt++;
 
 	f2fs_down_write(&io->bio_list_lock);
 	list_add_tail(&be->list, &io->bio_list);
@@ -980,6 +984,7 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 					fio_folio->mapping->host,
 					fio_folio->index, fio) &&
 			    bio_add_folio(*bio, folio, folio_size(folio), 0)) {
+				F2FS_BIO(*bio)->entry_cnt++;
 				ret = 0;
 				break;
 			}
-- 
2.49.0

