Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792743382;
	b=ANGXvSg2zPWiF43wjkrU3CY50sOFXvCnyQGmkvCDUjxKY5umUnksTchlcov/J2mflFNV
	 N8wXwPoTKe6riPCOjizPVx2U4k/uuOpGdQ6GTV4uFSH9P/IOYYcv39ce+EgtGyFsA31e6
	 mnt+kG9f+U4o2focKwxwwd1EICNoyR+hqENYIYYmTJFf7K+wx2NNAd3aFDb+Y1AWMRZkK
	 59s11MqOJaWsp5n3pf2ehIcyAu18AKNWEddYQVUgHw1Pvn2+Ysu8yUEyAuxUxWqujQdaX
	 VwaHlEG2ka8CRfOCR3Zce3gTS9Y/qpDVAEi2Tjrl5SVtAIJ3vXcQC8igG+uhmcOUzqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792743382;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=OJBm0kdro8PQFC/77dWApGE9VNnnb7mDYElFO9G+ddk=;
	b=IsZQMjLj+ypYWcypjuyg3qof/G4V/BhN0EEN2ljfZklXufJItfUKUuYTBgOKYwFSCPcX
	 THTv3eGbSODm+FXNSHb+31LqrqLxswbNLP1amReH0dttSwgbk/5mbAFp4zav43yMIKlb1
	 YhFm180/7cojPNo1EmWI2AhBf+TOH5Zns3UxtOgReFMHMohFKJFBL7rxG+QmnB9GVM1QN
	 jBoaVPIhttemFoX+bbHznle8XL5bfghRzDN2KbCF7ezUwhGysqvg+c/JbXWhBPG+Bzfi5
	 gfiFArNom1MOSDi5aCWOPHfsfPaV+YH6TzRPirRUYWERfJ4jOLswzVKAVnl86fzNWhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="qUnPm/q8";
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9B9606A322
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:16:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A9B9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=qUnPm/q8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792743370; bh=OJBm0kdro8PQFC/77dWApGE9VNnnb7mDYElFO9G+ddk=;
	h=From:To:Cc:Subject:Date;
	b=qUnPm/q8qUPaV6/qRUL+o+LQDrnnv1sJYe2v5sCY3Nkn7aZdB+wRCbh7N3bKZMqNX
	 rQuWInbhm/kIGZwoC0RMsAmb9UHDyeVtTqqGTjsbuoFuWwAHYFbl2z9eL+RTbLZIze
	 Ns8yJ/kUKygnoFWdwLmu890BTYSv4PCDt15fNDfA=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 407AE242; Fri, 23 Oct 2026 16:16:07 +0800
X-QQ-mid: xmsmtpt1792743367t24639m9l
Message-ID: <tencent_90082E9C18DB04917B9F74368BBAFC695306@qq.com>
X-QQ-XMAILINFO: M1rD3f8svNznrOjiZ53lu7yt9BFmB+lFO5xkRRJHXifRU9rhP18oTP8RL7gHc8
	 /lGAbQ10QIPd7UsMOmMwGJ5qCKTcllNec1PPzVwN9Mj5zThzWqnfKc+/3I74f6jhhiMtmBnBhc0Y
	 +/+iap4FXURogXI/P64OecQnm40FtIWnfdpgHITraJw89gtaUQWdEM62vJL4QghYnXbFXt4JvU8o
	 iSOYhQckXjXUTzH+zvtVVtYFQnK4Eg6AuJS8ZnC0baf1i9rIEK7uyqiEQCaUzU3iZo9AuTt4sd+a
	 MVFP2ZtI5opaeMMBCKZ57Dl/BrmfenNHT9V7FVon2mxySxiVMv/H1aws0Aw36ZAJu3D8lcLlYrtm
	 hM5JvbledUIwTsMlJAQ7wyJOcovI/UrOuCgCmSZyrtStwBZouLmp/SgkkMs+45ZRYBxxuawMMTb7
	 g6YGEjrBg7eHgBpAd4fYiv2DqnldPYkVOlAZ0z2RU3+hIa8RlDGeoTlqc4L2mfqkgPPByH4wBtjN
	 bSZYaX4zQxXhCgqiWNbKnM/e5T3pCUNWO+TR+CYjfMkEpzQjtFU/nSUuMnBMmG4fkgXdiIf1NVKZ
	 E1/wAnMzfLz+hJAhb8VqkdoGh+BzdP5hxNjhn+SJOA60fKPpBHxvKeQdrLpccJxLKpZYtz34lq1b
	 E0SrYwIg0lqDDJPAJNF1yb1KQHso8aqjA/wYQFwnsFdKZs8uLZ5Oq/1LYUzKWeqIwiW783OjLJgU
	 hpt3mDbi2g/9rxRk4En6grf+AGGHSZRqPthyvnlfX5YwVox4pl+efaOc9u3pPDt7TOS00/knIZqt
	 7Uq4q1Rp5Hqwi+cF5nEhKBKy4rz6CGlgfZ7HGch3k5q7Lgk1i2W1wq2yUwyQPja7zuecq6APH8rb
	 J2ILuIs55rnTGoMSArWVD8/UX1bkNxFFoYqsM7X7NJtu+iOzfqNd1K5eo4U0XmDbFQHOAlEEWeJj
	 nxUinSIFEeJXYlunAonyez2daAjsx2zDfUHm4TJP+OnlY+IPneeeeCwdwwtC0BsLraU8A57uZ2qQ
	 fMTVKm2R/T5Af1UC5m/G7osllcNnCx+Hlj1ws7Trb2B/ulRTdX6WekF2ErMAUCeCR+c5afEG+7G3
	 1KBGxh
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: Shuai Liu <847807867@qq.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org,
	kevinshq@163.com
Subject: [PATCH] mtd: rawnand: samsung: fix pages_per_eraseblock calculation
Date: Fri, 23 Oct 2026 16:16:07 +0800
X-OQ-MSGID: <20261023081607.3836052-1-847807867@qq.com>
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

In samsung_nand_decode_id(), the division by memorg->pagesize binds
tighter than the left shift due to C operator precedence, so the
expression is evaluated as:

    (128 * 1024) << (shift / pagesize)

The shift amount is at most 7 while pagesize is at least 2048, so the
integer division always yields 0 and pages_per_eraseblock ends up
being 131072 regardless of the actual chip geometry.

nanddev_init() later computes mtd->erasesize as
pagesize * pages_per_eraseblock, overwriting the correct value set in
this function with an astronomic value (e.g. 0x20000000, 512 MiB, for
a chip with 4096-byte pages).  MTD then rejects partitions not
starting on such an eraseblock boundary and forces them read-only,
breaking the rootfs on affected boards.

Add parentheses around the shift expression so that the eraseblock
size is computed before being divided by the page size.

Reported-by: kevinshq <kevinshq@163.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=222140
Fixes: 629a442cad5f ("mtd: rawnand: Fill memorg during detection")
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 drivers/mtd/nand/raw/nand_samsung.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_samsung.c b/drivers/mtd/nand/raw/nand_samsung.c
index 0be6b7563..765c0a7d8 100644
--- a/drivers/mtd/nand/raw/nand_samsung.c
+++ b/drivers/mtd/nand/raw/nand_samsung.c
@@ -63,9 +63,9 @@ static void samsung_nand_decode_id(struct nand_chip *chip)
 
 		/* Get blocksize */
 		extid >>= 2;
-		memorg->pages_per_eraseblock = (128 * 1024) <<
-					       (((extid >> 1) & 0x04) |
-						(extid & 0x03)) /
+		memorg->pages_per_eraseblock = ((128 * 1024) <<
+						(((extid >> 1) & 0x04) |
+						 (extid & 0x03))) /
 					       memorg->pagesize;
 		mtd->erasesize = (128 * 1024) <<
 				 (((extid >> 1) & 0x04) | (extid & 0x03));
-- 
2.43.0

