Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400545;
	b=F/8XA0jS5JpMLO0lUe8KeLr8mTeExLBdYO1FmkpIw+TFBUwU8spFTpQhLBDAVJ5LfwwL
	 a5D5yzC+BOLUAu5F+7Vi1fE4/ZnuDhsrPTyIQPjdEF2suuWc58Xvipayp97HhDrkUGOwN
	 6v2PoqgNgpkpi4CbSI/ZaqWVYb+5hbvL+6Cgz7Y4/SAXJGSO/NWRjTh6ju6c/E07uYKo4
	 uJlx9aqpjKOOhuOA76nxdsRAZLlLTW3Tpi51HB0wgbMvtm8gaUlpvHB4L92FV8TxLe03I
	 NXEcZLCCW7mzHGFo4xTeWjRn74JbZIMr7CBSIroNUPonymE3JfyMwfbPvrYxV2TAKtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qEns8j9TNQ6X545oefisWAHMaLi6RDahAOhPC5RfDi4=;
	b=OZ8XGXB5CliyCL5vfZGSLImiXXB9A32uujTKtKDBP9uK+dJGv5xlDvkyS1GxIV9J1k9z
	 9PIx/2TXCYWZjvHpXanU0IMvZdPH8ARSsmlIa3KbcCE2EAARCyU9LVx1dudaTyG09NK1c
	 7nT+JUNfj1bx31px6AyROeWC0HuVTrMPTmK8nvWdGR0f+oMnbfkQtmysHfea454cbsZ9R
	 SVyMNJ9sv7y5bRdHR/ZecZoda217Yf3RRGz/S6y/NKAzOovRj74DUJX0hE4j5DgzhIJ1G
	 +1YfqAl0KFozN+LfdbFvRF3lxdtmzRhGcGYohLQo28tTyFcq/+HmFw1L5JmWPhm1nRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMO6Sf42;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D86F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D86F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AMO6Sf42
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdab938dc83so1246627a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794400545; x=1795005345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEns8j9TNQ6X545oefisWAHMaLi6RDahAOhPC5RfDi4=;
        b=AMO6Sf42HMxpa/RUtsNsKu9oaktHRowsQ1OjLfufSbUd0H/O0bVGuGJFnKUj/kMcE0
         L43cgNELZGL1x/unT80EVCikKU6iWTVCoDRY2SwfO2ll4Ptxw67R6bVko8s9Wtqoaztp
         m/MTROlVppiphLCrdWLtwz1X2FSxcUUDStFP8ygQHfPlp+wSXq2MKMJe7RFX1msSa+r9
         YOtAOhIC6zg2UQthwdjD6Rj+r+6em3LVdGQyvzj/Tqf7VBEnolw7CZ3iDFnuHT5bRfr7
         hBf84SgQ2TW+DVT8kii5kKgtG/lmvDwvtZesONwtOnjfwzqUeuqh0KUrFRBQ1TbfM7GV
         e8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400545; x=1795005345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qEns8j9TNQ6X545oefisWAHMaLi6RDahAOhPC5RfDi4=;
        b=o4A1h0K3FEZPXNtE8SfYanQq+kzC9D4I+r/97s6XDJqEHI62LyKlLy/mx3NKCYaPXL
         2hdfGoqfhxXNvQsZPwvf/pXgnALaX1/oeBY/TYTAIkKTPndpaqmBoPHZJMfIjKJp8nEx
         wTcOMkAJ1uGZFE3YJPBmGjWjiURSMWC4m4Pup0sgrWmVKISZTxEowdvE77m9BR7xwVGL
         JDSAcuSJe5KFKkHtKMpYpMxmZkD5yAEyovlrZr+XVjfeq02mrCiTHZByHQJLK5YPwqOq
         lG241LTwwNsJniZY6Q2KMCfcPfW/Nxwh2Kb4Kw3UPEpb+ep6orYfzDxNpgo4hHXy66l1
         7plg==
X-Forwarded-Encrypted: i=1; AL+hErFzrGAUSbO+iHG0JvojoVkiwsLRqn0+2ZKxn8nfSrzqnqQ0Sc+R7r7ksHuM+rYDkfJX+q1OGqGVJZs5U3U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/d0gT0AJN+dVF1jpdszM1elZNVBFfrZxMYtREm7p1Dt3yyz1oC
	HvZ4mJ0uv9iZgA9jPE7VHOLI6Cprub8xlUBipgDGBCCBjGvKmDSE0D8o
X-Gm-Gg: AYBFou1g9OR9EBEz2KrBV2EIyUl2iwASjcKVc41Pt+G2MHxydg7uyCEP4Cwq1jofAJ7
	5ZtHXpx7jn41m/lmZlDoLh/MMdDdcw2fqZ7iT6VArnWk9y49Ab4/qfz9xEDtY2BV2wY3TzQsV3j
	ulGTmZSuKQFcqxlTTxiQCRYZNqBQToseE5uYyLX6VRya7jx2YanE5JN8bC1rYwo9erbbvyRHOk+
	EPp0z7qlPvoR8Y2VQA+xqhTegQGJGcdsBikUtOnm2KbRUnOoVLR6E3e04aBp+j0EtQo5fEysIEv
	L0c/jEc0xRPxBvESBKZZ7V4lIf2sN1zhaCwJtnMcmUEJ7xZi674waFbb+EjYyzdDEMsfZqBGoLE
	/wOYHras3/FuE0HsmpZT7JOCz1r7IRXn/a3mCxHGvINKAlLUtu5BfRGoA4AGoNw/3THttno3Qd5
	MjTycOsSDC6RQqM6Ck6kQsmUmNybaswICHdExPk0ieCChXENdxCHrdlEBRG87q9Jop9CdrhB9KW
	scbtdyLjmZW4AHM8gasTwJEg6E9V3a6JelJuPuUaXSF8Eh7WEjImUEcc3jw6TlNFcLW5eL9H3rd
	4F/uvnhowlBuXR1yGJCUPbuZoFDPBIz4Ym9oKdKboeIpdtx1K5T5
X-Received: by 2002:a17:90b:2e83:b0:3b0:ada3:b505 with SMTP id 98e67ed59e1d1-3b182efad80mr2416852a91.19.1794400544724;
        Wed, 11 Nov 2026 04:35:44 -0800 (PST)
Received: from localhost.localdomain ([152.136.45.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e0d550dsm4364082a91.8.2026.11.11.04.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:35:44 -0800 (PST)
From: diasyzhangqing@gmail.com
To: axboe@kernel.dk,
	linux-block@vger.kernel.org
Cc: jack@suse.cz,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	syzbot+d4ecb9a1e5b3dcf8baec@syzkaller.appspotmail.com,
	diasyzhang@tencent.com
Subject: [PATCH v2] block: make bdev_freeze() mutex waits killable
Date: Wed, 11 Nov 2026 20:35:29 +0800
Message-ID: <20261111123530.871952-1-diasyzhangqing@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261110132118.11265-1-diasyzhangqing@gmail.com>
References: <20261110132118.11265-1-diasyzhangqing@gmail.com>
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

From: Qing Zhang <diasyzhang@tencent.com>

Concurrent bdev_freeze() callers may wait a long time on
bd_fsfreeze_mutex while another caller freezes and syncs the filesystem.
Use mutex_lock_killable() to allow fatal signals to interrupt this wait.

An interrupted wait returns -EINTR before bd_fsfreeze_count is
incremented, so no freeze reference needs to be dropped. This does not
make the filesystem freeze operation itself killable.

Reported-by: syzbot+d4ecb9a1e5b3dcf8baec@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=d4ecb9a1e5b3dcf8baec
Suggested-by: Jan Kara <jack@suse.cz>
Signed-off-by: Qing Zhang <diasyzhang@tencent.com>
---
 Changes since v1:
- per Jan's suggestion, move the killable wait from a new ext4
  per-superblock mutex into bdev_freeze() itself.

block/bdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/block/bdev.c b/block/bdev.c
index f20f91b3176e..e57be2320423 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -301,7 +301,9 @@ int bdev_freeze(struct block_device *bdev)
 {
 	int error = 0;
 
-	mutex_lock(&bdev->bd_fsfreeze_mutex);
+	error = mutex_lock_killable(&bdev->bd_fsfreeze_mutex);
+	if (error)
+		return error;
 
 	/* A device being removed from its filesystem refuses freezes. */
 	if (!atomic_inc_unless_negative(&bdev->bd_fsfreeze_count)) {
-- 
2.43.7

