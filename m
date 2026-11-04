Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819560;
	b=Xd94Fd7SLT0rOZqQZklunnHYd048RznoKU0xDQxudVZBA9WOt3LbTmsnosRjodZCT+Q7
	 sM3hOaaIh99cMe94bF80U86EOBMB2TWEX4WMYQ01G/fbDK/efRf7hZNUi54h/apcr4LAK
	 d5VRZn/WKbvpcsz16eRwvEbQr4EiRr+BySNs+4HrBEtt0wPPZ2U6SNf04Lor8L16jmUOO
	 mIdBGtCXpe2FC6QIw1b7/kBiW6aw9Mba2aU8fgxAdI55o2gxrA+2XhKiTKF7eWGDZ0Rre
	 lDfCMPYnPKLU7ootPfmHol8C+nXYuwI2hm0EwIMgDHZhKhvrUjDRpgrB8agWHYOVc1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2eBasa7agXmVq6bqhWG9P4J2rj64c5jg7X5XSFiq59I=;
	b=WAGIl4k6eTbjv57ghz/yBMM3Tfc4HEGAT76s41vXir5CL9ay8D1dVmqyNnf2ORi7wSqK
	 dJLiZv5dqVHzbRL6oMAd7HKWhmKGuNwnHo06Yu4zW+xTGV3/S1yTMRWQIiGDCzJTlCJfl
	 e2EJji+jVZNokUm8iaNhicjlAk3FSAHdTLK1iAaK8xIf9wa5SFeBKSEkCnyl6m+qD0TM2
	 QSAug86HR+DmzRCk7OCeUU1546euUIe37YPcBvCKhlSb4GK/jn4G+kNHZ4iOSUv141Zgn
	 7JqqOySM2jyJePO7Xt9OoPy0Gz/Lkykm2CKT50B2/IhoYfRpbEPAdO2Cx6pZbGLNRtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eqj5Og8j;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBB3606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BBB3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eqj5Og8j
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so12456eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793819559; x=1794424359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2eBasa7agXmVq6bqhWG9P4J2rj64c5jg7X5XSFiq59I=;
        b=Eqj5Og8j+BJqXcySMWz1SZiTErQxINNNlbsUZj31hS7lGoG6Gq9yCzn7VNE6Om5jkB
         kOR/Wp5R7NWosG0U9+7d8IAIP1sv4mt+75u/LDEIaa20TqtV4Ul83r/2HgwP0B10j0+V
         pvaOhvJEZbZ5eAGpy9LPLKRGp40zyGTb3678OrokeIryxlwDK3f5uUw2nAEFNFjZWazt
         wGwi+9gouE314rfJTQmK3m8GFxdq+kOnUNcIQoNk8YQeF7zg1n5UXZXWtIbtFAjfsKUo
         g57vlJFrdxiyU5wSrlEijhSz1DSvlhKvPoHNLF/BG/9+9zLelsLukMg0MYJi7JMpGp9L
         Gfmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819559; x=1794424359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2eBasa7agXmVq6bqhWG9P4J2rj64c5jg7X5XSFiq59I=;
        b=Ce3LT4IdCB6lwT5/49iDzcIA17TECbvBzzEbMxHrfoTUFVmcZ/CC877pppVGuaywRu
         9LcvSDOhRGztvc4Mq1Ky/eMrfKBNhc7w0JvQcwF/oXAoFVIyuptXyEF8zVK9jyLvIUgJ
         eMyeJNhtUSp69twjdFhUoGe2+09ZuCaFfgrPxx4JA6FaNYqaHA2NZr25HSakBMuwUWj+
         zwhNJ3u2qlwb8c8y5R8JeQtFaTfdRwjrg0gTpqtm/mkFSEnZC3ApUpgRA7JdvAcKsakt
         Fo6tRJ3zMllSN/I5poSWEI6cxfYcu/IE91rABUUVh1Ld4ND42V//z3nJr0kKnVOaxcjx
         KEgA==
X-Forwarded-Encrypted: i=1; AKwUvByuv94D6FGmA7atIAUTJ55ZBf7cElQ+kmPF0hpKEPGCq1r/xh7KIkUCI9H55kCKpb493ZPplm/lvDts7kQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NM6QK6mFR2mE9nTSrIg9CjE9zTpq+ktLaXI1zqUm/Copps8A4
	nJIpplg9UvzBZNCyffgZnLoK01z7QUymzAXhidjCvFemvDBkX5sTu5Ot
X-Gm-Gg: AYBFou0m9YX9shw6H7e2p/pwNszyC4M+8GjsTgyz8VWEmg/M2VUQzFF+HzZCZhloQlg
	ZWbM7OpUjlSzeFODnNr4t3TLliHmAKvm9cIzhGdyUt9m4FmPgf238ayBr8qK96wGUZajmKqk0n/
	M/RPJ+s4QYN38PhWbj9JuAcN2N1DpfAHlRdfmw8mzptr5RByRemCfnGCZs3YIT6hRfmSUvtMhAM
	VbufQLbkdiChVH8UX0HGauXPLMHVZvU8XMwIdWZDW6Elga8blQWWmh4HYTXRblHXqhl+CB+I7rR
	Hg0eQNmqQJ+Jf/ciqRfQTKbSPTRO8uaXhIr8xyvJ3uSEwVFsy4YmBlSnE7FYvUVfMei7o4zQTbO
	HJqiJ/hWCJUNrf5mNfXNEHHxJWD6KOASxr6sAAN+JVrQ3Y8hXPEk159KAiL6aghV0kiD+Z89E4r
	ls1sG/w+BMvUZghB++g545tuTsP+YUPCjT48TyqM5mVwalUXO08tT8sVJderFC2fPOZkiMcRODg
	fJRcus0g/bBHQ+/xyROQs2wQ9bIt7DDO06W0vz75jOhJmyoV+knLFWt8Vc7GRP/S54U+vo1kmOU
	3EBcUKnio2kWUGYSEJGeU4DGDtEqFiuHcbpURKwDqHV1MEaLKTrCqnuIV/1FXO43YC/dvU6H9wb
	XmKTYp26BG6iKyAnKrp0VNVV7G62JXf9nTXBUdw==
X-Received: by 2002:a05:7301:6189:20b0:358:ec5c:bef1 with SMTP id 5a478bee46e88-36a42425486mr23614256eec.39.1793819558461;
        Wed, 04 Nov 2026 11:12:38 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dad72dc52sm1916864eec.0.2026.11.04.11.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:12:38 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: richard@nod.at
Cc: chengzhihao1@huawei.com,
	lin.nan@h3c.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] ubifs: account for short copies in ubifs_write_end
Date: Wed,  4 Nov 2026 19:11:31 +0000
Message-ID: <20261104191132.89515-1-dennylin0707@gmail.com>
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

ubifs_write_end() updates i_size and ui_size to pos + len even when
fewer bytes were copied. A one-byte write at EOF from an unreadable
buffer can fail with EFAULT while extending the file by one byte.
Partial writes can also extend the file past the last byte copied.

Use pos + copied for size updates and cancel the budget when no data
was copied. Keep the appending decision based on the requested length
to match the inode budgeting and ui_mutex locking in ubifs_write_begin().
If a short copy ends within the old size, release any unused inode budget
without reducing the size, and still unlock ui_mutex.

Fixes: 1e51764a3c2a ("UBIFS: add new flash file system")
Link: https://lore.kernel.org/linux-mtd/20261027061226.3506517-1-lin.nan@h3c.com/
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ubifs/file.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 99dd52715ee..8ebd3f4cddf 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -523,8 +523,8 @@ static int ubifs_write_end(const struct kiocb *iocb,
 	struct inode *inode = mapping->host;
 	struct ubifs_inode *ui = ubifs_inode(inode);
 	struct ubifs_info *c = inode->i_sb->s_fs_info;
-	loff_t end_pos = pos + len;
-	int appending = !!(end_pos > inode->i_size);
+	loff_t end_pos = pos + copied;
+	int appending = !!(pos + len > inode->i_size);
 
 	dbg_gen("ino %llu, pos %llu, pg %lu, len %u, copied %d, i_size %lld",
 		inode->i_ino, pos, folio->index, len, copied, inode->i_size);
@@ -552,6 +552,11 @@ static int ubifs_write_end(const struct kiocb *iocb,
 		goto out;
 	}
 
+	if (unlikely(!copied)) {
+		cancel_budget(c, folio, ui, appending);
+		goto out;
+	}
+
 	if (len == folio_size(folio))
 		folio_mark_uptodate(folio);
 
@@ -562,14 +567,18 @@ static int ubifs_write_end(const struct kiocb *iocb,
 	}
 
 	if (appending) {
-		i_size_write(inode, end_pos);
-		ui->ui_size = end_pos;
-		/*
-		 * We do not set @I_DIRTY_PAGES (which means that
-		 * the inode has dirty pages), this was done in
-		 * filemap_dirty_folio().
-		 */
-		__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
+		if (end_pos > inode->i_size) {
+			i_size_write(inode, end_pos);
+			ui->ui_size = end_pos;
+			/*
+			 * We do not set @I_DIRTY_PAGES (which means that
+			 * the inode has dirty pages), this was done in
+			 * filemap_dirty_folio().
+			 */
+			__mark_inode_dirty(inode, I_DIRTY_DATASYNC);
+		} else if (!ui->dirty) {
+			ubifs_release_dirty_inode_budget(c, ui);
+		}
 		ubifs_assert(c, mutex_is_locked(&ui->ui_mutex));
 		mutex_unlock(&ui->ui_mutex);
 	}

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.50.1 (Apple Git-155)

