Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637276;
	b=P4PvQhAVo3bzyoooJp66ZCy51JkwUL2a53D+QcM5dWDZ5iqjg02KLEu4PTmG2dz3QBrk
	 9PcvvDCj3HNmmP+83R/C41QO5N8dWooYJJIgSzcg/W1D4rsyLfRy9Xwx0NEgzq0iww3Kp
	 h9yVUjQd4rbfwx1wjhpIPgAsLnqzFjdxZ4MEwCHXjAoPvcwCW6HiQYrHiPqlYETBdrCre
	 sEp0zCtQYRPJdfYb2W6Z/8BKKmzLrWEcwwO5cNdlPt2e3NrrKxHV0PLy+OTGsWF4ozV+E
	 1kPC2I0SbVhcaBBh4XsUofnrKubkD45hi34XAwshxeyW/noSM/WJ8uUYPnDu6mPPWuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637276;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xLdqkEXbr821eUwEevYaKavqiARQLpJjtFlplh7xwMM=;
	b=szlrZ0i8ZyMKREGu14vd7i8oQjfoc7IznuXa0lWot8q+Kjf3lXcuo9mlwUv/y2qoBX5O
	 blkAw0HgRlfW/a0Lheg3UNTzj465l1DyPY7frbYnOTqGvWiDazPYrScWJKDFQ/2/DkLEA
	 6cp/KRszhkPT5ZK8YFq20sbw5N3Ds7E4r+xfAkSt2hRBFioUNpRVqlo3S5GXUZtsB7Wje
	 6+lxbh1hwi9tpPWkeNzo6Db7wqUksniXOdidi21iWu9ITi/Em5hHz0Ufm4rccUqmNWu5D
	 5M9mmZ3Rbte4+A0TaJcvdK65sF6dHcuo6PY5aUimeuqxXxnYd6QEt3oiF7cke/d7MeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=VH8TW2Ve;
	arc=none smtp.remote-ip=203.205.221.233
Received: from out203-205-221-233.mail.qq.com (out203-205-221-233.mail.qq.com [203.205.221.233])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21110606A91D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21110606A91D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=VH8TW2Ve
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793637272; bh=xLdqkEXbr821eUwEevYaKavqiARQLpJjtFlplh7xwMM=;
	h=From:To:Cc:Subject:Date;
	b=VH8TW2Vei8DDZnRmlRhA/bvGIPdEL6iApND5xOYRLuMgQ8WIDZxP4qxDSUnWXzd6K
	 w5Q/5XWcdg7fYxI0IGFc/6vz3xQp6M04p/mOpN7jUwJxv8RyNghRtu7IKcYmTWx38I
	 tyvoYOqs1vAbUB3+/8u9qC80nPHl3x5Z96rP4zWw=
Received: from kernel-lab.tail5e91bb.ts.net ([2409:8950:57d:63:3bd5:e9be:8454:44da])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 89E356E4; Tue, 03 Nov 2026 00:34:30 +0800
X-QQ-mid: xmsmtpt1793637270t9okhx66p
Message-ID: <tencent_3607215AB97AF610D95DD29F80FEEB7D8E0A@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoeZOwKN5FEjzUV5xhSOYliEbQ6zyr6HqCCn47vNqEMssYVaNsNlS
	 GnmdvCpiJTpUN9J9ertC9HmAoQF/N/WKAUbEkTIH/OGqCkKEpHuErWOzaaOPoFn/kQiKJIAt4VMK
	 Y1YxUKg6SPd9niR5bpNqi245+mBt4INrZf4FPigK4mOIWTgBHYJcAZQw0C06482mK6r+Knv2y1SY
	 wftPd7MgEE2QyqrhTtCtLhj2SE3jFRe9tg6MTVvKRfkSR79kOS1JWbe88+zUkrzwuGnfaSiIG81y
	 hBzena0QeuOyb5OoHqZMqkkQ89LKpzAVPzIquBmInv5MuPj5+cWAabLB/GhUjM8n1IFEe+hcURcw
	 roIPMcPXceygJCXvgoiSSzMbFK63aYm7iKsLGY5UbtPIJFTD23dguhD8MODxuy8lHBE8IMGNFQda
	 a7Oz/qJYrrqI+ktny4iDxP3BkARlTAsPC0+F5wIULjD1tmq/J5MhMr0e9Bhr3wNMKsQUyWT+kDyY
	 GlCmZjVWaM9dYPB3jSTuh4CCT5wVhl/j0wCVEz4RPzUJDNht7hTX6NHwLmwdG9eEhYOe2THNrWK4
	 QdBtCKaCWKeIFmWZmGcznmzZ6JZhK+Tt8RHzoD/FSrjEiGl5hkOm+Y7nwbbKQggdQ+V2/CzalTgd
	 3aU8WmXeeZl4x0Qf2dk9fH5jjKLG76wUgPd2CFlTpPQ7FW33zjpFdP884Wuf4JrSWrx+l3NGEo48
	 CVcMZGF3Q2oMegTO3ymPhNY7n9eQQwDMwH5ynx58PlDBhuMINieikgo+ihgx5lfpeA63VfWxQgr2
	 OPQ89QGhC5kf1r+1qen2v/5KJT22luFziqhBL15hdSC5U4kp7BktbCa+IXMaJhiPcm2QMkCku4q3
	 rUQykw3FO2YUN7vPf/wvuevhlc25trCyGosRlW0fMStOikn0vEZcq5LWmgGaimWPee0PtTZR2Jf7
	 rt0nTNCd8tNaItS3tiuVtW8uBO5kWwp62RkRP1GoV5UGA6IWvHNUdARN+tXbReMyIWSZ4qnheruF
	 j3oQLRlsJktwrBZkS+mYMOAviLe6VoK3XmUZSvyQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Yingjie Wang <1075151112@qq.com>
To: dm-devel@lists.linux.dev
Cc: Mikulas Patocka <mpatocka@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Alasdair Kergon <agk@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dm thin: avoid wrapping no_space_timeout
Date: Tue,  3 Nov 2026 00:34:29 +0800
X-OQ-MSGID: <20712bf55592c216a17f6e63bd5e843ef37bf5e1.1793637263.git.1075151112@qq.com>
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

set_pool_mode() converts the no_space_timeout module parameter with
READ_ONCE(no_space_timeout_secs) * HZ. The usual arithmetic conversions
evaluate the product as unsigned int, so it can wrap before being stored
in the unsigned long delay. With HZ=1000, 4294968 seconds becomes 704
jiffies: a pool that runs out of data space switches to
error_if_no_space and fails queued writes with -ENOSPC after about 0.7
seconds.

Widen the value before the multiplication and cap it at
MAX_JIFFY_OFFSET / HZ, so large timeouts no longer wrap into short
delays. On 32-bit kernels, values beyond the supported jiffies range
saturate at the largest whole-second delay not exceeding
MAX_JIFFY_OFFSET. The timer wheel's existing handling of very long
delays is unchanged.

Fixes: 80c578930ce7 ("dm thin: add 'no_space_timeout' dm-thin-pool module param")
Cc: stable@vger.kernel.org
Signed-off-by: Yingjie Wang <1075151112@qq.com>
---

Notes:
    Tested on x86-64 (HZ=1000) in QEMU with a four-block thin pool whose
    fifth write runs out of data space. The base kernel switched to
    error_if_no_space and failed the write after 804 ms with 4294968
    seconds; with the patch the write was still queued after 4.6 s in three
    boots. 4294967 seconds queued and a 1-second control failed after
    about 1.1 s on both kernels. Also built for i386 with W=1.

 drivers/md/dm-thin.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 358ed77ffb2b..9287ee5c00a4 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -2542,7 +2542,9 @@ static void set_pool_mode(struct pool *pool, enum pool_mode new_mode)
 	struct pool_c *pt = pool->ti->private;
 	bool needs_check = dm_pool_metadata_needs_check(pool->pmd);
 	enum pool_mode old_mode = get_pool_mode(pool);
-	unsigned long no_space_timeout = READ_ONCE(no_space_timeout_secs) * HZ;
+	unsigned long no_space_timeout =
+		min_t(unsigned long, READ_ONCE(no_space_timeout_secs),
+		      MAX_JIFFY_OFFSET / HZ) * HZ;
 
 	/*
 	 * Never allow the pool to transition to PM_WRITE mode if user

base-commit: 334714e4bdf8868c17a7650a7502ba1c90a8721f
-- 
2.43.0

