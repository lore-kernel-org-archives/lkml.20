Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46AC349CD6
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 06:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093743; cv=none; b=Y9F8E2uW4W65r++ey2gdmmQr2piG37iAPXGs+98ZT18Sl2bP3kRkarjLHGE125ubYBmn7b323VEirWDB7zoaSIGvys75B2uO0V3i0FOdwYBgIehCH92RdFYkl8BgQjeOkPTxECse4Dv+QFsiJgiHV5JAYR3t0O9J8ODUy9f5iaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093743; c=relaxed/simple;
	bh=MrZM1fuqy59R1SiQ//tw2gC/QW3wBRMI9xhn7nRK87s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fVLMuFMOPhovn/bL2R68J4pZriemhGNopT1x6KFH5MO+4eVnDcj0kki0vDmbP5ce3yLQOSwCz7tqfKKbsfgL8lZ/favFkSup9m8McpnmXiUb8pMY56hlKxxtyh7OFlIhBlu/YNCQ2gwjP7MzjmeWoEpAaJHRq2uIPWIG2kDgZrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hq8txJ/2; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hq8txJ/2"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3396cec93b6so849967eec.3
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 23:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093740; x=1791698540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zw3spXruW5eAr/BaWFnAydpO0+AS612TDMLy0c5P4Rg=;
        b=Hq8txJ/29AGnohleRIX/g6+wcywCzjrNZlUIqVR2sZnQrdtBTO+YwgA2KyKFDPk7j9
         kkyVfO7CPdu8edwxhdixs3O+NN/VY8su9Bh3E7GTqQrwAC66HkI71bjwNAGUCAqfGE9x
         j+BI25sEK1ccGivZM2wSCYuOLUpxskHrJoyPpxYu0BAJmCQXHlKLXdw0c0Fhc0qp8H8w
         xTdQKit92YQ8EZGZ0C9TeafNxrZOwe4kw3b2XXirwytBdEJt2vpmapuVnZhyfoEDsfCH
         BVeakReLGN0TqjAtH4fBoZ3n/6ESstvOowqLo+7DFU/VdFch6341GDtRNXKZc6tVzxFV
         MLsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093740; x=1791698540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zw3spXruW5eAr/BaWFnAydpO0+AS612TDMLy0c5P4Rg=;
        b=OW7I/F8L6Ujnt2IoJ92LmVhq6UGQVjVzhw2TjXlppg7SMzwjKeVYVuny5efX3nq6NJ
         em5s+v7lKnDWXLUREAPDWy9GY8+89mPUVhLKXm4/MmQxDEPD4r2ZAQTTxh+ohGMC78i8
         Utq174uJzwIbkvLXnnKPs3ex6RzbfAx7gyoMu321zGKdtptXdUT8JPVseCXO0l/lUQi7
         07CuSfmwiMGy6QwV9EptkYOkBJJP5pgImpXQ2RVVGXABxzw5jUECu5xCi/chIt7MR7A4
         4rYUg9xYdJmeYIfca0NGDSLZvPi0sqIhVu+gMXS9BP1pAaXGq8M5WpAM3KmstLgeB5Km
         MXGA==
X-Forwarded-Encrypted: i=1; AKwUvByi4o6JXTE8RWB+cS+gsMDUOSmU4DLB25ksbkAsmh+cU8fZt7fzx5WVY6VPWwnn8xDGE4p64xoeDBKRQhw=@vger.kernel.org
X-Gm-Message-State: AFuF++mXqAavoCx22I1XPFIJqy+9R5dK/t/VbCxOVlXN80gbXoJYx3tj
	RAiGcNG8kNx7+OwgrAxGv3P7NZ/SAfMvrkHsZtzZIEfi0SaqzB1lOpsQ
X-Gm-Gg: AYBFou0t+89BYCMUATIi0w8YWBBFRxSsk9Ve2c4Nha1r3U9DB8Pw6RnBHYmX/wfO+pv
	xReyzTV3Mk15lcEaJ4bk1i+xKGSJ2yRFdS+hFwe2nt3MhKFtP4t7gut1N+XCwRt6yPsod9TVpDo
	GZfnbcvOBA+IY32bMEL8QeNvSYDPaHwu73th3A7uze9JXvFmAGxLbVLF8TZKRdz07e9jEkN0TgN
	gFr6rxXPiTBXS7DhElLhVnA5pJaGCCiM+OJ2LyQ6uFI5r1gHOBdrVmR2/Ftg4LunNkE8x7x/gxT
	d4gCofaurMiFVqcK/An5xGPo0MPibuhThZAgDeB6GSO6gkaTiiGUrK1Md6Szvqabpl+K7iPl+ml
	XLDdFphzXtBpUbILGD1K8gW8fEMTdTvcMGRbvqEHd83VGxEtIEb6+CvHrdK2R/sjJl9u51wqReK
	5d1G432Y21TAa27W4kUkS5DFCObqrTjHxqYG7W72Okvjg8keYPJ2QO3iwrXeKrdM0IdTxWlo/JR
	+O5Qd4RZRuD6H3La1dRqbM=
X-Received: by 2002:a05:7022:b88e:b0:14a:fe37:cdf0 with SMTP id a92af1059eb24-14f5d5b661bmr9362314c88.45.1791093739832;
        Sat, 03 Oct 2026 23:02:19 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.132.231])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35128156e6esm1952256eec.20.2026.10.03.23.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:02:19 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Hannes Reinecke <hare@suse.de>,
	Logan Gunthorpe <logang@deltatee.com>,
	Yogesh Gaur <yogeshgaur.83@gmail.com>,
	syzbot+270624bb31d478afe62e@syzkaller.appspotmail.com,
	stable@vger.kernel.org
Subject: [PATCH] md/raid5: set conf->mddev before the first setup_conf() error path
Date: Sun,  4 Oct 2026 11:32:03 +0530
Message-ID: <20261004060203.1379-1-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

free_conf() starts with log_exit(), which falls through to
raid5_has_ppl() when conf->log is NULL:

	static inline void log_exit(struct r5conf *conf)
	{
		if (conf->log)
			r5l_exit_log(conf);
		else if (raid5_has_ppl(conf))
			ppl_exit_log(conf);
	}

raid5_has_ppl() reads conf->mddev->flags. setup_conf() only assigns
conf->mddev after bioset_init(), but five of its error paths -- the
pending_data, alloc_thread_groups(), conf->disks, extra_page and
bioset_init() failures -- jump to "abort:" before that, and abort: calls
free_conf(). conf comes from kzalloc, so conf->mddev is still NULL and
free_conf() dereferences it:

	BUG: KASAN: null-ptr-deref in raid5_has_ppl drivers/md/raid5-log.h:54 [inline]
	BUG: KASAN: null-ptr-deref in log_exit drivers/md/raid5-log.h:128 [inline]
	BUG: KASAN: null-ptr-deref in free_conf+0x81/0x5d0 drivers/md/raid5.c:7549
	Read of size 8 at addr 0000000000000028 by task syz.3.20/5681
	Call Trace:
	 <TASK>
	 free_conf+0x81/0x5d0 drivers/md/raid5.c:7549
	 setup_conf+0x1720/0x2ad0 drivers/md/raid5.c:7885
	 raid5_run+0x8cc/0x2560 drivers/md/raid5.c:8129
	 md_run+0xc3d/0x1cd0 drivers/md/md.c:6779
	 do_md_run+0x35/0x720 drivers/md/md.c:6880
	 array_state_store+0x958/0xe90 drivers/md/md.c:-1
	 </TASK>

The faulting address is offsetof(struct mddev, flags).

conf->mddev is a back pointer that is constant for the lifetime of the
conf and does not depend on anything computed in between, so assign it
as soon as the conf is allocated. Nothing between the allocation and the
old assignment reads conf->mddev -- alloc_thread_groups() takes the conf
but never looks at its mddev, and the rdev_for_each() loop walks the
mddev argument directly.

All five paths are allocation failures, so this needs memory pressure or
fault injection to hit, which is how syzbot found it.

Reported-by: syzbot+270624bb31d478afe62e@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=270624bb31d478afe62e
Fixes: ff875738edd4 ("raid5: separate header for log functions")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/md/raid5.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index b91545ce090d..f98d3bdd3484 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7675,6 +7675,9 @@ static struct r5conf *setup_conf(struct mddev *mddev)
 	if (conf == NULL)
 		goto abort;
 
+	/* free_conf() dereferences this, so set it before the first goto */
+	conf->mddev = mddev;
+
 #if PAGE_SIZE != DEFAULT_STRIPE_SIZE
 	conf->stripe_size = DEFAULT_STRIPE_SIZE;
 	conf->stripe_shift = ilog2(DEFAULT_STRIPE_SIZE) - 9;
@@ -7743,7 +7746,6 @@ static struct r5conf *setup_conf(struct mddev *mddev)
 	ret = bioset_init(&conf->bio_split, BIO_POOL_SIZE, 0, 0);
 	if (ret)
 		goto abort;
-	conf->mddev = mddev;
 
 	ret = -ENOMEM;
 	conf->stripe_hashtbl = kzalloc(PAGE_SIZE, GFP_KERNEL);
-- 
2.55.0.windows.5

