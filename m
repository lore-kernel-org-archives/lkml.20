Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE22396D13
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856789; cv=none; b=mcXeFhihOTfEBz9spbf8N0YCEYDxE6oPk692P5E9RSz6pMHBETsrteSr0sT/QKv3nISFeVARwtUesMgahoy6lQWmSDL4ykQ2mQWS9gPOgpEF0qQP7mAa4Bw7MXSunS0fDMMxX2XfJCc0dqNtXNb754BIVkcJvR4gloivjccJmRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856789; c=relaxed/simple;
	bh=l+cZ5RnQezSJqBE/UyFFt7hxjbdQOSwBbQXYOdjohsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dRbd3WxVjhX1Y1lnEJdTXJX2n0P1Ib4maJ9SM09/3LP/X5nBl+5sE9OSqz2tc5SMdMkOrQ0E3MOg2/Q6KKHT/IM0NvE4ShhW5MMpgJjXlUZLMaXfw5PYCwqfoc6h/Fuk7qSIn/1DbidU7ld4xaNbXzv97VLj57WlT6LbVmiuMMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TomsMDiA; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TomsMDiA"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8686f46e4adso1594840b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856784; x=1790461584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJTdXVhPRFNVOuFEoF0cnUAxxkqxs0nKM5uVJ7VwjD0=;
        b=TomsMDiAC/w6OOQW/s8+XG04BoWE5+lZLVMpXuzovAc4NIczIH9mOxFAZw97Pmp3JF
         TT5eTJ0lSf7ewhSJq4UXr4+GHkH+YDZYQWNXT2wCD9QVaj15vhWQEgTCU1aX8NUrQaGA
         +yjZcsMGAuaA6BFLzj3e1fBiJt0X4RxN6z/1F5aIG5DDZEme7uwHcwfKpeT+xvad4xQl
         gXQjO4WuCwqDvMo/VIwKcsqT4jBBJqkwyj/+8BQDAkK/Zktyt1Ngan7zMv3lCkT+rLB3
         B8YkvHUTHf/bqk3Jp/zG19KAwTNLWtquX4nkPDDh0ZRQoT9MiKvUlC9kmeIZm5FlpIwY
         6VqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856784; x=1790461584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJTdXVhPRFNVOuFEoF0cnUAxxkqxs0nKM5uVJ7VwjD0=;
        b=jRw56zuq976LXrL8drd+QpJKtNPZkkqCydb4sl5kB7aC0WKZHmE+zgwMavddxCgMnW
         FLU8WL+qtFBmMoCd52rjg1t8KC2ZluN4bg/ig5qDDQsmwjd3P0IE5LKwA2PKPAf410/h
         ZdNU1yb87lQgmpTK6HQleFyNpWJZywYwTYP9fL2ZXyxReYrHWBeEctxyc/yrC7fOnnmo
         t9jYZEEe9wjmcQ5p6CB586srUL3IF4cV6R9I7ediCfrk9jeg1bnxnPMKoEiuDtrKqbtH
         vbwruHOyFlwiqW92umNjFBKL5LZkTjUybxaZDki6ByEZF6qeyFynSug/aZArdU33c8f3
         /Neg==
X-Forwarded-Encrypted: i=1; AKwUvBwb9k6UmB+wCQadq121/r69jEsYOdcECi/ihFQ8+2/Ne9G3IDd4YLhlQdHgJW7d3VZCv1nzCJGx2WO+RP4=@vger.kernel.org
X-Gm-Message-State: AFuF++mK2r9DW23R83dB7orslFA3G+8Pr8GFyhU+5bCKofn8yeaI5xKW
	C+eeV8NRS+IjfAfo8wRItZFrF7wq8bCZIsaYTcKqFu5sEJEzV/7HvMTd
X-Gm-Gg: AYBFou1Q6zKWSYDYgKLJqyqFwlArQiMarS+F6DnMVfHja5JLX421jsncSBkw1PqA8T3
	SzNpYXHxSaoPrzipYnA8kKS+3tZ+o9gEkBc3eIuOAg4JMPaPuFxsdmz6dmCZEszqcw9YrM7XX21
	wxWMr/S+ozgT7dr2syyBzqYGczTV0tho4qgEhMhP84986ZH9s/QJCthNOMoKzmCjcaO7/jJlsgT
	A5pSH7Hn4noZbF/QCO5spXK2U/H6xIFkboXSCdg4ERhjSA0QfnTMWoEaNwUoA5MygNDjPsptGN8
	E+ML4okibExAYIUzj+a42MaQSBtXkBRYRLRIAtslzKgLMaCCg/opBwdKF6aAEXfNOppEboGoWuW
	/YAxfntOLAi1ncinvnlCyBt8rTuOw8HLOnm9xFr80NNOBonxw8vl4hmuQt8Stnp93jB5CPzIwtb
	sFhOuKqpnL7BYyWYSoVz3X/BvSi1G5Hcu6gFQ8mHXZqUfc7FZtybVzkEy+UcDk08Lptr+ZkgiKi
	mnFgvqL1v58798732xCWihxn1+59+WW+n9KOOZgRXZFWHB3SvKnX32IWuqaM7F6tm0QrDFvUugu
	kNP153sx5otWA9AIhQTz
X-Received: by 2002:a05:6300:278b:10b0:3dd:a196:53a8 with SMTP id adf61e73a8af0-3dda19654d7mr3108334637.74.1789856784240;
        Sat, 19 Sep 2026 15:26:24 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae8bf29sm1346750a12.12.2026.09.19.15.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:26:23 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: al@alarsen.net,
	brauner@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] qnx4: validate xblk_num_xtnts and rootdir size in qnx4_block_map() and mount
Date: Sat, 19 Sep 2026 22:26:23 +0000
Message-ID: <20260919222623.3797296-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In qnx4_block_map() and qnx4_fill_super() (fs/qnx4/inode.c), check that
xblk->xblk_num_xtnts is between 1 and QNX4_MAX_XTNTS_PER_XBLK (60),
return 0 instead of (unsigned long)-EIO on error, and validate the root
directory inode size on mount to prevent out-of-bounds reads past the
512-byte buffer_head.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/qnx4/inode.c b/fs/qnx4/inode.c
index 42fcd500fad2..f6eb08cac09b 100644
--- a/fs/qnx4/inode.c
+++ b/fs/qnx4/inode.c
@@ -104,12 +104,15 @@ unsigned long qnx4_block_map( struct inode *inode, long iblock )
 				bh = sb_bread(inode->i_sb, i_xblk - 1);
 				if ( !bh ) {
 					QNX4DEBUG((KERN_ERR "qnx4: I/O error reading xtnt block [%ld])\n", i_xblk - 1));
-					return -EIO;
+					return 0;
 				}
 				xblk = (struct qnx4_xblk*)bh->b_data;
-				if ( memcmp( xblk->xblk_signature, "IamXblk", 7 ) ) {
+				if (memcmp(xblk->xblk_signature, "IamXblk", 7) ||
+				    xblk->xblk_num_xtnts == 0 ||
+				    xblk->xblk_num_xtnts > QNX4_MAX_XTNTS_PER_XBLK) {
 					QNX4DEBUG((KERN_ERR "qnx4: block at %ld is not a valid xtnt\n", qnx4_inode->i_xblk));
-					return -EIO;
+					brelse(bh);
+					return 0;
 				}
 			}
 			block = try_extent(&xblk->xblk_xtnts[ix], &offset);
