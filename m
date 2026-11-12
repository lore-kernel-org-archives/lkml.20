Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491931;
	b=bEEct+EvuqmLURP6OO0B8OfSkMvpWzWES2CziBhCH09Kawxe5NxLnFaLTjDKjXsHwtfZ
	 SqbgdKUYlu85jqkEg64tOR8Tg2ErsZz/ewX3ZpSPDTh3BUf/Uk+cSjMmNBBaMvtq8UQ4R
	 ZEc9wnON139BtBawWQC8Lzxm7rSNQt/9/lrQxjlwvs8h5UHrNMdkhvg6VBIyokcgScs4n
	 bN9heEww+L9QRwSiKP0y/SK/gELI67PoHvtfKei9dYzMd8A4DcscC6JGJdz84slxUUaMz
	 8ymx7ZOs5ixCYc3ATVDrcurqW2ovp05NXirMkSW5eVe2IsL/LDzV7KAyFeBwJVLGcUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/7uERjd+vF+nyqQq83zM6wcEGnCLDigeochUNNaCH1w=;
	b=ZJVwqqwZygsgGOurz1gG9nn72057sGI4z32JXZU4l0P+lPiKEZE7WBiq1MUvlLuthT8i
	 mrFTzBzgvVsSE2WGVy9moBOb9VHdiYR9G+zcKFeKx1UtfNw2NBImBo7FYx06yKw4peof9
	 UjO3N9vd+lsv8Oz49q3PmsFPJEZNopIMINyN2RwAlQ5hsF2b5COuqacz6saXdM4mPzVg9
	 ruEjRwDDqHJJO5sC+mucUnM4eCXS8IWMysRzs+c74BFIFmLFXTF0z6kePGc2RAQfgfRU6
	 iXk4WJ5Gfl2IISaByeF3700UrXLVaQepGhkRNiAGVvWnwbu05ybECw/1AfNP9HrUbYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=clKBf9sQ;
	arc=none smtp.remote-ip=74.125.230.201
Received: from mail-qk2-f9.google.com (mail-qk2-f9.google.com [74.125.230.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E0D606A336
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68E0D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=clKBf9sQ
Received: by mail-qk2-f9.google.com with SMTP id af79cd13be357-930f7b1eb68so401642085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794491930; x=1795096730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/7uERjd+vF+nyqQq83zM6wcEGnCLDigeochUNNaCH1w=;
        b=clKBf9sQ/O3MSHLwtjYLqIiIooFFSvL/NaVndDyyj0XEZ/79RsggmJV4ptuBIApdax
         b9CnqDkJyQF0ut8xRG1uro7s6+tQjAIR8Q3UxW1elf72oz9JYBb3s5i7x94Ev9vevp/6
         iS5zhiSzRhpBab7mYj6fcir0SnlWSm4XGbV1r8NgmsNrIhTBCd36i5FX6wvpxruQxhA7
         UHlwee3o4vdWC4j5QETOzvz7H+Qd6U/RE7zL/VDg5rdiTnqYPdHLToOcZQox21vaSZfb
         nZ0V//Eqljku1+OJOqlS7UVHji7FeYoK60YXmEkQ+OW+zyZzEp5HZzjLLScWpcCa4URW
         XBUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491930; x=1795096730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7uERjd+vF+nyqQq83zM6wcEGnCLDigeochUNNaCH1w=;
        b=aWpKXF/SE4qxrSfktjZuV0FlJGFkFaYsyI4yl44aJHtvdgJEO43c2norofwbIYj9HN
         RMKFJHqSYKfbGx2p77QoEj/56a9R/c4fQ/XQxDVRdm7dZCVxdkRCmzLZb704VHXmec88
         0KnIZQCG65zfbsHfpblEn3KbwLv7IYgSh5Tx8OSCdRXWEdwJuTTinBxZ+Wb0rnfhGS5e
         ZGAPhByYuLY3vNAW3M2CWmJ3RfhNhjptLFDZpBGL/xqSJ5HnG9qU3MwTd6IXxGwZ0gJ0
         ZqW8cxWW6rGYRj37eS9M0KtJbV1txAh7FcDoGD1rDFemC+ljai9kds9Iu01KX4WgnIvc
         KfnQ==
X-Forwarded-Encrypted: i=1; AL+hErF8Zwn1J21zqtrXBEg29oqg2JPHXQ9Ltnd37XPpUTyooZBMZ3bZXY1Jp8Oh4bE+K2EVcVAwXTto2X3YcGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T8v0xNF7SZC3FlTvVAKfrRw+RYrimpIU5q/xg0Ck912Sv/NDw
	XAkbRbi214wMvOXdgHPGdtCeh/JZ/S65vZqLDagjEmncrZRwwA8fEw1N
X-Gm-Gg: AYBFou3fPmigEwkr5EitSeOH1kCUylmFnJsehFvbLkSjMQLy4ds58mv5yyL2PbE3999
	kURou40IR9LP70lVg8UQ/OMFeGvQNiQYoTJ6bkXDUxu7SPwWJoiSkRUK0YkjVOYNs8FNo/7nFP+
	gcNjjCYQ9OMIyMiBjm11NVG2lKVZx6UAC9KDJstNmgEh9SZX8hl4QJshlHsefPPvIQ4j2gap2fA
	4FDg5FCB65rxd94Ge/jkX6c8cwkxxHef4tVLAs7APQK/T0ehd+osdVAReVohzms9NKnXLM632I9
	DFjQwveM/sB8HQkai0ETNSohZtzXEa5P8l9bfyROXlHRgIEqS80O9+1ITz0AVj9/NBLhSLrITF+
	F2lZev3iuF74escLo/ZjvY/PEZbiaxfKZM+UOdhXvlE73pUjlb5RnXX9yDhqc+fRztO8uPk6emc
	gsPtsgt+XcYkx/ShcfqXZNA3cHjPqqP/To/d5EmU9haiDJnY3cIU+gubUWrfOWsxkTQgaaRVEFE
	mO2hkMjkMfqLjqpDav9KrfHRtyOeKW53D1utDVJO3oqt2PTfBuuCwUKAXoLPzuXqufe7jiN4Jle
	X5jeL8zbThMD1hEjphZBLIiF56aEeX87LYrhswL7nI/A2NT+iVcAGiVZYu+7hRdwkGd6KhDoQD0
	4mDU0h5FK+ueanekxwRySi7DKjokdFe+KKlIZlQ==
X-Received: by 2002:a05:620a:28d4:b0:93c:c96c:a592 with SMTP id af79cd13be357-947affd32ddmr914915185a.36.1794491930088;
        Thu, 12 Nov 2026 05:58:50 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f20176493sm4610686d6.5.2026.11.12.05.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:58:49 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: richard@nod.at
Cc: chengzhihao1@huawei.com,
	lin.nan@h3c.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH v2] ubifs: account for short copies in ubifs_write_end
Date: Thu, 12 Nov 2026 13:58:39 +0000
Message-ID: <20261112135839.6451-1-dennylin0707@gmail.com>
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
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
---
Changes in v2
- Add Zhihao Cheng's Reviewed-by.

v1 posted at https://lore.kernel.org/r/20261104191132.89515-1-dennylin0707@gmail.com

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

