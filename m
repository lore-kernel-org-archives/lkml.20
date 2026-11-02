Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793580530;
	b=A9E/YwtGhpFxrnQbbegSB+3Z04a2J7RYz1p4Z0EIu6urbI2RgfIQqYM7pAKMWODCdA2D
	 vCDfmJNKbZ2tdnhK72wK42Wja264gEQbxev9A28Ps7reDmNH4AId3KQZEKsTR1ODEb8K/
	 A5PTpXBIWEl5/Z3Z8KnTjNPBVBgHXFKzqxSxFV+BLtLVSdNEA1QkylsFhjVcUkg9cSFDF
	 MVXFMUZAkzTsVjcrQe0+9kgLdqguWJHbHhz/x8tw3Vks7tW7LPtksOBx9HaGVkrmMieE/
	 c6UVD7m++rD/AMBw/CNropWCTbrKZKUzfkO7KDRYzoqOrCd/JAhtCamJ+PfdQne7ePw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793580530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9fErfkULxtwTRPKMq6WDcnHnyNfqKUVzTDigvp7MrnI=;
	b=mtkxUnDYfvjxl0/UH8M+ctanWiorTbZwqgeYoIC2mfOHYS2gD7c7xRSZ11YfOrClrwF0
	 LhKlGPvsQy43FE7Y5E/A+S6iFbtZJB5hwtJNYMMtx4uIK7+OzRyo3cMmCvnkw+d5XeteW
	 urwFsrx5ZCrBQta7eGfBJd+NQNBZK+yiHNFXu7ydcqsdtOF23O3oK9HnJhVhp/EOQu3Sa
	 hSA7ShXyf51S7e3Z9TXDhPYI0Y4zuZCIQAzLIrz0wcYxsuaFg5hnHFVepRi3eGd4IF1bh
	 1UDjcmfiOAKKO3SqvXuFhKfxH2PA3+rFAd6HS3r4pdfGLPCsL+oGq6D1muQokcoEO5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y/JmE3mx";
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80253606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 00:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80253606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y/JmE3mx
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-3535a54c09bso2540934eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 16:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793580530; x=1794185330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9fErfkULxtwTRPKMq6WDcnHnyNfqKUVzTDigvp7MrnI=;
        b=y/JmE3mx+s9vTjOrXpvEBIfp46IRRdqM+gja6cdtpqCavFQEEx6cwmmLkdNDpAdrnW
         q5KHtTI+8ZjK+1c2MtI1bIx5/psnGl8gVImnLMkcLL/eZFzqENkc+gjSmyH2rmSWoVTo
         o1P5sSDgQsG8rTEUMPefAyUmWgxB9AsdozoaPPXougyj4aBI0xtutiwWNlhMgvVO0h8L
         Y7NYjrTnh/WiuizvdI1ieQWFS0purkCJXRC8EgBFizlhp/AQb1kF6DKl2jXmShn9oKRx
         NUTHR6OvuUT7aDoMmSLwB9AN4fjQpoFogsV77gXzrn3/uJlOs7+eun0M26UWBebh1Daa
         3HXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793580530; x=1794185330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9fErfkULxtwTRPKMq6WDcnHnyNfqKUVzTDigvp7MrnI=;
        b=hCyyx31yiHOX6Xk66kfBHliSGIBEcA74jCWXmvWRk4irzhNQWdxg2/wYGVZOKIT6u1
         h09tEtq4O9EwBlAQuaSY8wuT6SKz6ahGtO4ikIfkaisoqeme/FQzQezRPn70o2+RDfIq
         cwmNNevk3avzE7sMpjsLCyacL9zpSel4jc68jVS1acj0E0WWBF/sb+zQHNWOQfQZHGoZ
         t5nZx6SgZCZJsqSondC/NlpAvPEpAu0TLcO4vUsNUKLxNpOF10SaiVPOJgaaYdCSo4z0
         GvUqGq21syp3Z9qHwNANM5/jlgaT4jWjFwjhfQ5p9gtjsvNGxVBcnjWK/umAuZLG3v9B
         3D5Q==
X-Forwarded-Encrypted: i=1; AKwUvBy9ZyKKgdmgkn2+Si3M9Q/AqFHVr+/Mpr5xeoiYqvGWWB1CD5mpuJ1W1GtyLaV3MDZsBiHGPl36ZHycCn4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg2HPWSo8EnKB3oJ6y2MLLDrTUJ/dM6CexenoFSmdivokcqDZ0
	7M4WZrsqyOTYd2dzyvY+POHSKLYA5rAzCiAwCgfvWGSoIOPy2VH5UtUo
X-Gm-Gg: AYBFou2QDQLX9QLXOf5k/cdlm7IOBT/EXprN8++sR0wNDEjT07RJtkeYiJGriAST+C+
	mLDtrEJJfyvnXTwtkPLrp9jK3D3nvkmYMTm1bn85Vp542r9s/x8K2TFxkslR4NbRJhJjg5mH6cx
	6BxpbehWQzeYNCiDdiXO64gqdA2blhv0E398APbqwhtK297MuObUUihaVB1X37DzqWOPfs2x+t7
	2ldrgIgeCQYOcxo4aMJ4pAbyqdYSYNRSzzu4x4RRntrfobWbWkwx8pF+/oaDiWVTKp+dxMEbI6n
	a93U2+lSH17Ei0Tb2gBS7h8HV71hQHk92zsSCojXwGokhHvrB7+1BlsVleZzrrKvTS/DMKf9YL8
	o2+UqD356lfW8QJEfnut0/Q2161L6xwvvdC9FxHoreZoLi8WEjjLUXGYzR481ExwMBDi0192Jm6
	FPISt0gOBiRKlDIlo9vrNxfvTDfprS19AaN68UvZPeI76qVDbGy6aiHuWB+Dli+oEbRitaTIpt2
	jq2gywfW7FT1gc5gN/R3F62aQTMjS13QkJKrT1iD6nz4pDmPMmHxwbvcg141HpR1QQkukAlRiAw
	eXv4cv/BQXKe4/zBH/iqtB8yYN0uuFK/PlMBy18DPPNk2BvbUjuLfKhs
X-Received: by 2002:a05:701b:4505:20b0:154:fa0b:6df1 with SMTP id a92af1059eb24-1ac5d69f9c1mr11829668c88.37.1793580529505;
        Sun, 01 Nov 2026 16:48:49 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm36188295eec.2.2026.11.01.16.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 16:48:48 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] f2fs: update inode ctime on exchange rename
Date: Mon,  2 Nov 2026 00:47:41 +0000
Message-ID: <20261102004742.55105-1-dennylin0707@gmail.com>
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

When two regular files are exchanged with renameat2(RENAME_EXCHANGE),
their ctimes remain unchanged. f2fs_cross_rename() applies its explicit
ctime updates and dirty marking to old_dir and new_dir, which have
already been updated by f2fs_set_link().

Update old_inode and new_inode instead, matching the ordinary rename
path. Keep the existing parent link-count handling, which dirties the
parents through f2fs_i_links_write().

Fixes: 32f9bc25cbda ("f2fs: support ->rename2()")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/f2fs/namei.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index ce5d536d892b..880dfd44c04a 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -1287,13 +1287,13 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 		f2fs_i_pino_write(old_inode, new_dir->i_ino);
 	f2fs_up_write(&F2FS_I(old_inode)->i_sem);
 
-	inode_set_ctime_current(old_dir);
+	inode_set_ctime_current(old_inode);
 	if (old_nlink) {
 		f2fs_down_write(&F2FS_I(old_dir)->i_sem);
 		f2fs_i_links_write(old_dir, old_nlink > 0);
 		f2fs_up_write(&F2FS_I(old_dir)->i_sem);
 	}
-	f2fs_mark_inode_dirty_sync(old_dir, true);
+	f2fs_mark_inode_dirty_sync(old_inode, true);
 
 	/* update directory entry info of new dir inode */
 	f2fs_set_link(new_dir, new_entry, new_block, old_inode);
@@ -1306,13 +1306,13 @@ static int f2fs_cross_rename(struct inode *old_dir, struct dentry *old_dentry,
 		f2fs_i_pino_write(new_inode, old_dir->i_ino);
 	f2fs_up_write(&F2FS_I(new_inode)->i_sem);
 
-	inode_set_ctime_current(new_dir);
+	inode_set_ctime_current(new_inode);
 	if (new_nlink) {
 		f2fs_down_write(&F2FS_I(new_dir)->i_sem);
 		f2fs_i_links_write(new_dir, new_nlink > 0);
 		f2fs_up_write(&F2FS_I(new_dir)->i_sem);
 	}
-	f2fs_mark_inode_dirty_sync(new_dir, true);
+	f2fs_mark_inode_dirty_sync(new_inode, true);
 
 	if (F2FS_OPTION(sbi).fsync_mode == FSYNC_MODE_STRICT) {
 		f2fs_add_ino_entry(sbi, old_dir->i_ino, TRANS_DIR_INO);
-- 
2.43.0

