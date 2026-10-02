Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBB12EEE80
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 00:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790901704; cv=none; b=jbzLmtAzcTFhrCFaEOkD8VnEKvehZI5dr/bzdCw6BvrO55IdRsFV+33fRJjwzRmypZZwd/nKVdaov5kKADSq5DEmiCW6kVigSr6J9hkY4tYQlWdmIPDBR54SFnCN8iCMaVf+vW+1miqWb+ltliKPiSLdsvX6uud8KLespniNets=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790901704; c=relaxed/simple;
	bh=coPbEVU635kTDJ5rpJpWSMLlxl5aCTdBTQo8PREAd1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rNSf9TdWr6P5AltXOiB2Sifz5+Ag/1BCPMi30L6Xh6IG55HPYMh5OgcRBj5a4yk0s6aJtvKfMyZlWzoZ+K7yGMvxH6mE6Lhofi0JE0M4TjNLsHHWJE3XGi+8JS7Kw0eeKRaZwM9RMyXhxTwQGrfHpNo+r3Azjja9iNFf6FVhcT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvwDURJd; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvwDURJd"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8c8602so3899778241.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 17:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790901701; x=1791506501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jAwTn9q8SUnFiLbMogXfXDX+dJCQYDVb282KSgjxcVA=;
        b=SvwDURJdw2pLdZZHZvhlvgXlHIftDXyrQ8tZ0LBWejuZ0ca/YXuHnVLpoOuiOmblQw
         95Xs3VhwqpQgbPEwFWJHGO5JP+lyo9AUG69TVsh7kwFQZ+nVN9HVDQLU7hUoJ+8mDVb4
         HbKW3HmYWUuE0L50E/new0+md5mvd+GMPYDKOsonXAFlH8bHCIee6O7Clob7VDw/dqLS
         AM4gur1znNwwU/22etNZn2MIT1OX1RRZq/9aTR6HpIYfBBGmY8i7h+zi009X6PXtaOxN
         ECElefUSXdHrQ5WKzgL0kKRQgVAKN65FWqH6+EXG7iqeiBbHeiZNMxJNM01UH62nwvQM
         Sgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790901701; x=1791506501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jAwTn9q8SUnFiLbMogXfXDX+dJCQYDVb282KSgjxcVA=;
        b=VYtH/OAyq36BeeUQPntH8YCdmWtBzMPi/yq+z//lUXTPi4yVSRN61nE6i68NZ4hq7Y
         EaOMoUyOn3XnCIUfOwDuk2r0HF7d8WBJGb9cGoT98qFsnFoK1NyQ5cQYqI6hj4KI+0fQ
         2PgD3ATTGNWsH0SaZUun7sWq7WTc7dB8c1xLW/yBqlqCWMEgqF2tmQWMWGqlg/K+Asdf
         J0KCdxQrAZ9NA2vlApCQrTwOUCJTvBPcWNjb5OmPnrQl3AhcQp3Rd8lReCEjNihx2/H8
         +RnTeBoGZ7abIT2t1eTxR7ECG8lqbVFoiyO2+b60SMJ5V3QsJbzasvQ1aNN5xiuST3At
         aIWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxR+oRGJgsFQ/eQ038TWqZZivojNGqjCGB9PNXeHfISxYPbY2pImrghdb9b38RGQMn7wZM/UL2Sv5IAmxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKg1+uWwUhpeaEazXjAlbiucJ8REx40mptGxY8VHiZgx2ns7qiK
	2YDCLoZegfgr3rZQ5t0tg5G31/b4abWGG+0ZAktsdvnBdkqpMXYl6TWL
X-Gm-Gg: AYBFou1elGMg2MnjzVU9c7mH7w2j1MnCNF8CHt39IIbz+c7da8/pUmf+E86AgaOl7fM
	dt7pxMRyJZ4wNVNgib42Myodj/KLZe29dYsfvuVywJs2f+cqJ2k+iSTQ0xclgftD/xFJ7rplqwx
	toLpAkgujgWDEYo6odBQURCAk8F0hxN52tyvHES76ZolJf+VO/A9cy3SfLF7BQtU/YMRBembsxB
	ZnKljWKpiBfPWNbMUalJMGkyLMaE9VDm5aJ1staBH2B0WfWjUL1GJ3j3KLrypiYk41VEnInPFG3
	VZLRtR9oIiwD+tC43pkgaYbt8sLiD0+OtueMwyR38g1LWWXgipM69kh6ENJhEMJ/TbQCM5kiB+b
	fhgD1bm7ng3c3ejMe0RqRXorhIOie2QlMPASqtbcOzlDbS0clacubhorYQJ+Axl+iX7VMjDBFCL
	g0uy198miUVFfrkWAmyq5FR9QM+3hQBvdRmaDOFrtcp6O/Xx0nlN1w+MmSc4mSD4Xh
X-Received: by 2002:a05:6102:5cca:b0:7a1:f7d2:e81a with SMTP id ada2fe7eead31-7c0f4c9f080mr378970137.19.1790901701501;
        Thu, 01 Oct 2026 17:41:41 -0700 (PDT)
Received: from adriano ([191.118.25.221])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7c0ffaeedf5sm1025960137.7.2026.10.01.17.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 17:41:40 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>,
	syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com
Subject: [PATCH] ext4: wipe moved dirents with their real length
Date: Thu,  1 Oct 2026 21:41:27 -0300
Message-ID: <20261002004127.1332310-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After copying a dirent to the new block, dx_move_dirents() wipes the
source entry using the on-disk rec_len.  Use the length already
computed for the copy instead because the on-disk rec_len is untrusted
and a corrupt value makes the memset() run out of bounds.

Reported-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=09bec78ee77613a3efdd
Tested-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com
Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 fs/ext4/namei.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index a6386c1d237f..71e9e7c9a7fd 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1860,10 +1860,8 @@ dx_move_dirents(struct inode *dir, char *from, char *to,
 
 		/* wipe dir_entry excluding the rec_len field */
 		de->inode = 0;
-		memset(&de->name_len, 0, ext4_rec_len_from_disk(de->rec_len,
-								blocksize) -
-					 offsetof(struct ext4_dir_entry_2,
-								name_len));
+		memset(&de->name_len, 0, rec_len -
+		       offsetof(struct ext4_dir_entry_2, name_len));
 
 		map++;
 		to += rec_len;
-- 
2.51.0

