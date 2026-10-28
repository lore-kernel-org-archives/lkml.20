Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202308;
	b=nRhvcCjIIFEonufLAfVvK74cY5omPLVvnmNukw0nz9ySPqCINN0g8cLg/EaVj51HzDVf
	 hs+l6WLqx42naEo5B7joRHOHu4kOovI28WGug/mHLdHxY6gWNG6qIzEoh2LY+YKxkuqB/
	 wO3bDdS2vEm41pEu/s0X9up22y2BA7FpCibIQi3YuLQebNgU2tZPmNhd5myMiD0G4rfgD
	 SDfkJmURdqNqnbGyxJ7hvkR7B6QzckfMWbOqt1wqUgGuZo42Y8SRWFWvItBMMct7FD6WS
	 v7O0+V+izMiJCHu9UmdOGMoQqLgd3YV049yniY/HxNxdNH+auRe66qG8MnDLkVMWTGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IfQzdJuUF11P/NB71UB6Mk1gbvRuSZ4EX8Cfo5SAjks=;
	b=Dm3UIzIpLNhxnTapAXDxGkSIl+tGjq9siHIDWzyXULCSa/3CXvu5yHyE76kGTyak0UVp
	 emOZuXSkzJVQ6AS5dHfws1rS7Ine0t2qaZNPKfpwbF/UJkR1mXs/6lU8tQk0/o23G7DoW
	 qhePreINnVjp6kzCoJlXe5CQhvDgrg2rEN6GkKUEAliPE2+bWGXBs6is7XrFGRPDDrC10
	 gz/jupNJiJo3+vq+Gf7+V1bMikEGbBEa429vI/ZFT6A0IC85pbfSWLY4a9MVZt20kHj7i
	 Od/AN4uqUUm9wQdRJV9M2ivp4JTNX4gHvYi7Hi0pVV+MhgbGQP8KPm/GhWXlhcVKOpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ybiW/k0e";
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED7A60A3817
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED7A60A3817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybiW/k0e
Received: by mail-pj2-f10.google.com with SMTP id d9443c01a7336-2e934c6c20aso7980305ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202307; x=1793807107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IfQzdJuUF11P/NB71UB6Mk1gbvRuSZ4EX8Cfo5SAjks=;
        b=ybiW/k0e1wwwURwdV4SPwfptkI82Z6onyr6M1XuWInsUQ4EhNrGEH5Yj3FptgcP9SK
         S8+RnZEgUZzPekhxLeI/G+SJ+F9Xy9oUVVurIXPNflLR7ARomyJZ2vcAEAsCTwA67ZK/
         7f8/sxWcG3DZNvbPBfdDmkonaTK9HBZw9CF2VH+deB/re1K40af+oKcBprleIu1PCqPr
         PL7iecTcKsgYzFTZ24kJW1wfTovq4VyCAKkIo4g8RnYiuiJFU4ci5bYnF82vzx6UTbBT
         zVZJw8LkjFLTBpvM8Q5s3anTHtR+S6nQKQ138qjRp160nS5Q5RgDX5VyObvQ2pjHmtIg
         evgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202307; x=1793807107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IfQzdJuUF11P/NB71UB6Mk1gbvRuSZ4EX8Cfo5SAjks=;
        b=ga/9Uw5cVBamc6fZmtUrmMvQhp2gWiswF0e7Ux4jCK6vsoyTqorIEcmn/X4/4cRCYp
         M8XBz9bDu/U08Zd9Sj/4Hdh2lBUOOtrBgDvoiLCRMsv1oO0FWS/6LjC94HbHTe7C03w6
         IBuSAif866YjiSimCSUMTGfZPrQo/M7CZc6COTZQFVVlPpUEvNQcd2fd4oGKnvZ+YNPH
         rJMTfk650Nck12yQk4RY7/QoVa5zuU/62o5pD9CwaDXdMqqKUabheupR7EufuoMMMedI
         xK+OfRuBV7XdD3sByAnBOAmw3mWv9G6aH0w4GAv7aH2YNoijmgwP29hsJq/14pTAPI8z
         1u/w==
X-Forwarded-Encrypted: i=1; AKwUvBzOnElS9Pe4ySmDgampNBtDckzvYpakMhZZjNom/4HhzZznwZaMw11xQuYF3sMzyT3F9HRC7CNSDBu/MI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvMXyZogfUYmDDaht5iQDOVx/KIjHoc3AIWdJhIrdgCPcA/NmE
	zylgoG8ir/KXfBO4nfoMZNsDqbo0/ixplrqRS/DuG/K9N62Bq5ic5U6I
X-Gm-Gg: AYBFou25rHFGwatPq/6mUExKyjmsC6DorU6bswj+X9xeerX5OJDWpdUl9lrnyw6PwHY
	8/rLMWyRAcX4GaO92LgH50HcPg6YWrm8cmwH2AQCNmdk9kMpojwYmgjKmqoTZ1mgDrtKHfHsOOi
	mSjq3SBCEmOf9viOdK0hapckqRTn4FimauNvLy68O16krSVzoNPO9jYC4QRdwb1TRRQ6YaSNJ5k
	cp7YkQEBypQleqSn9BkGGezEMaB/101gszLPFbge5e7Lf3YmRaXn9RIoBNr/Pv9VINtucrZb6Px
	Lo62b3H7f0npi3QDhVN1L9coMqb0FWENxOuXn1tZV/F9GiwueA45uEhK+PgNX0mdbLa1c+4S0iV
	PivnYTYh5iAMUS67Pza00fMnbPoUfVTOsdHhQaA6sRznM+3u3O17RvricGT2J3E87IegevRqPZu
	Bz3cj8pjk0I7/igJ6EAgPlXF55OW+EdYIifQjSiDJlbwFVdtsLq9w01hsntahuwjjUFm8xvtF3K
	Hk7U1QON02H+SecgQ8xyMtVMpWV9kgpl96HEWC4wHecn2SDb1YbxA3pZeoyhaOWAWSwlz7peSPR
	/avlloYFe/0lOMzukK0nD02rm80lFhJRz7qNjU2sPIG4THStw1LKP35UWlqWxtN8U9w=
X-Received: by 2002:a17:903:120f:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2eb004888b6mr26038415ad.14.1793202307198;
        Wed, 28 Oct 2026 08:45:07 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:45:06 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v8 10/15] f2fs: support partial uptodate large folio read
Date: Wed, 28 Oct 2026 23:44:01 +0800
Message-ID: <20261028154407.1601430-11-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
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

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

Buffered write can have write bytes smaller than folio
size for cases when folio minimum order is not zero.
This can left partially uptodate folio in page cache.
So we skip uptodate subpage read in read_data_large_folio.
Also mark hole subpage uptodate in uptodate bitmap.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 102 +++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 95 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d2c9e9d2eb9c..d76038d82e16 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -154,6 +154,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 		struct f2fs_sb_info *sbi = F2FS_F_SB(folio);
 		unsigned nr_pages = fi.length >> PAGE_SHIFT;
 		bool finished = true;
+		bool uptodate = bio->bi_status == BLK_STS_OK;
 
 		if (!folio_test_large(folio) &&
 		    f2fs_is_compressed_page(folio)) {
@@ -169,6 +170,9 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 				(struct f2fs_folio_state *)folio->private;
 
 			spin_lock_irqsave(&ffs->state_lock, flags);
+			if (uptodate)
+				uptodate = __ffs_mark_subrange_uptodate(folio, ffs,
+						fi.offset, fi.length);
 			ffs->read_pages_pending -= nr_pages;
 			finished = !ffs->read_pages_pending;
 			spin_unlock_irqrestore(&ffs->state_lock, flags);
@@ -178,7 +182,7 @@ static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 			dec_cache_count(sbi, F2FS_RD_DATA);
 
 		if (finished)
-			folio_end_read(folio, bio->bi_status == BLK_STS_OK);
+			folio_end_read(folio, uptodate);
 	}
 
 	if (ctx)
@@ -3163,6 +3167,70 @@ static bool find_next_valid_block(const struct folio *folio,
 	return false;
 }
 
+static unsigned int ffs_next_uptodate_subpage(struct f2fs_folio_state *ffs,
+			unsigned int start, unsigned int end)
+{
+	return find_next_bit(ffs->state, end + 1, start);
+}
+
+static unsigned int ffs_next_nonuptodate_subpage(struct f2fs_folio_state *ffs,
+			unsigned int start, unsigned int end)
+{
+	return find_next_zero_bit(ffs->state, end + 1, start);
+}
+
+static void f2fs_skip_fully_uptodate_front(struct folio *folio,
+			pgoff_t *index, pgoff_t *offset, unsigned int *nrpages,
+			unsigned int *max_nr_pages)
+{
+	struct f2fs_folio_state *ffs;
+	unsigned int next, skipped;
+
+	if (!f2fs_folio_has_ffs(folio) || !*nrpages)
+		return;
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	next = ffs_next_nonuptodate_subpage(ffs, *offset,
+					    *offset + *nrpages - 1);
+	skipped = next - *offset;
+	if (!skipped)
+		return;
+
+	*index += skipped;
+	*offset += skipped;
+	*nrpages -= skipped;
+	*max_nr_pages -= skipped;
+}
+
+static void f2fs_truncate_read_extent(struct inode *inode, struct folio *folio,
+				      pgoff_t offset, block_t block_nr,
+				      unsigned int *len_blks)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_folio_state *ffs;
+	unsigned int next, end;
+
+	if (!f2fs_folio_has_ffs(folio) || *len_blks <= 1)
+		return;
+
+	if (f2fs_is_multi_device(sbi)) {
+		int bidx = f2fs_target_device_index(sbi, block_nr);
+
+		*len_blks = min_t(unsigned int, *len_blks,
+				  FDEV(bidx).end_blk + 1 - block_nr);
+	}
+	*len_blks = min_t(unsigned int, *len_blks,
+			  (unsigned int)fscrypt_limit_io_blocks(inode,
+							folio->index + offset,
+							*len_blks));
+
+	ffs = (struct f2fs_folio_state *)folio->private;
+	end = offset + *len_blks - 1;
+	next = ffs_next_uptodate_subpage(ffs, offset + 1, end);
+	if (next <= end)
+		*len_blks = next - offset;
+}
+
 static int f2fs_read_data_large_folio(struct inode *inode,
 		struct fsverity_info *vi,
 		struct readahead_control *rac, struct folio *folio)
@@ -3195,6 +3263,19 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	f2fs_update_read_folio_count(F2FS_I_SB(inode), folio);
 
 	folio_in_bio = false;
+	ffs = NULL;
+	if (folio_test_large(folio)) {
+		/*
+		 * Allocate the folio state before doing anything with the
+		 * folio, so that the block mapping helpers below can rely on
+		 * it, and fail early if memory is not available.
+		 */
+		ffs = f2fs_ffs_find_or_alloc(folio);
+		if (!ffs) {
+			ret = -ENOMEM;
+			goto err_out;
+		}
+	}
 	index = folio->index;
 	offset = 0;
 	nrpages = folio_nr_pages(folio);
@@ -3207,6 +3288,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 
 		len_blks = 1;
 
+		f2fs_skip_fully_uptodate_front(folio, &index, &offset,
+					       &nrpages, &max_nr_pages);
+		if (!nrpages)
+			break;
+
 		/*
 		 * Map blocks using the previous result first.
 		 */
@@ -3239,6 +3325,8 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 			len_blks = min_t(unsigned int, nrpages, max_nr_pages);
 			len_blks = min_t(unsigned int, len_blks,
 					(unsigned int)(map.m_lblk + map.m_len - index));
+			f2fs_truncate_read_extent(inode, folio, offset,
+						  block_nr, &len_blks);
 
 			for (i = 0; i < len_blks; i++) {
 				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
@@ -3257,6 +3345,12 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 				ret = -EIO;
 				goto err_out;
 			}
+			if (folio_test_large(folio)) {
+				spin_lock_irq(&ffs->state_lock);
+				__ffs_mark_subrange_uptodate(folio, ffs,
+						page_offset, PAGE_SIZE);
+				spin_unlock_irq(&ffs->state_lock);
+			}
 			continue;
 		}
 
@@ -3264,12 +3358,6 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		 * to prevent from premature folio_end_read() call on folio
 		 */
 		if (folio_test_large(folio)) {
-			ffs = f2fs_ffs_find_or_alloc(folio);
-			if (!ffs) {
-				ret = -ENOMEM;
-				goto err_out;
-			}
-
 			/* set the bitmap to wait */
 			f2fs_update_read_folio_pending(folio, len_blks);
 		}
-- 
2.43.0

