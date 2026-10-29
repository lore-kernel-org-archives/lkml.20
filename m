Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793289526;
	b=hbAiUuaWfSZZ2UjE0SVj8YbBofvof74PZhM6KDzjqJPugQdrsMTdttbz27ulPeVeZMJw
	 Ewi/ZDP/Z1reB9fZZ7SfJs+sbPbCyZkBK4Zb84oH+I8D7CG6ossZs5br6DWUG27DdEudQ
	 PsJDvq88CpcM3DpbSAoqPFDZnCJKoSCka96llD8chSizmrYsyqSi5noUlMwSe0Ed/MB61
	 dc324Cn4CQMyxplkU/e+JpM5gYaIxYUFvmp8O1nmSxTJvF5Vl/ax9XDnj5i/e2Vp8RL69
	 grUbOyHXHAdDjN7fp9+7a8lDGhZyU/K4sZ7WOdjrPLreTCRLQc98M2ZfOYsOTF/MaVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793289526;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JlvxwwNyQO6n19Y10XHId6qvmxHt/ChSrZalCBx9Qp8=;
	b=HxciKLWOFOZ43WXCp1fXsi4BYFUUGjtPfw4rTuzwVD8hL/gzhG5lzkBD4Xbn7Nh6mno6
	 kyXD51xHkOqaMFB9OhlJgwnZS0NdkKmVj5od4Mn9xf9SzkymMJqybDMxuE4RMKGvF61+e
	 H2LX+f8vxRr6AHaeTCScC4q1Md0J30UUN2qUWDqUBGFZAYRqXnxhQQfEaUnOXyeaPuWVj
	 TxXBm+jbppFnL/dNMowKyzPb/pNgTXMDOYD7MfUhDcvB6M2HGZNad0ts4fLfTOvlDL4AM
	 osaeMoXWIJsfi5jWV6WWpIW/73iHpCCoQ2SKrhvgODSmW2uQunMtWCOYSNpEnygfmsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O6lJARli;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="tS17m/zd";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90736606A321
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:58:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90736606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O6lJARli;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tS17m/zd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793289524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JlvxwwNyQO6n19Y10XHId6qvmxHt/ChSrZalCBx9Qp8=;
	b=O6lJARliUBp/+Us5B4vCyNt+I40HKaNVpbK0o6rgF2XBCjIC1lk/LNmUk8OlNEd6jT24Ue
	Tr/+jyZjvcYa088D8tEx4hpsAEGyoVDz6BZaEpFcqNY9NzN1OxgWkHU1Z8V5/dFcjKI8Wm
	gp44mKxwRPxDBIydIYj4a83c+NHYJSE=
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com
 [74.125.82.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-0CxIm1AIMR6m8ljdJnU4SQ-1; Thu, 29 Oct 2026 11:58:39 -0400
X-MC-Unique: 0CxIm1AIMR6m8ljdJnU4SQ-1
X-Mimecast-MFC-AGG-ID: 0CxIm1AIMR6m8ljdJnU4SQ_1793289518
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1383723dfddso3780836c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793289518; x=1793894318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JlvxwwNyQO6n19Y10XHId6qvmxHt/ChSrZalCBx9Qp8=;
        b=tS17m/zd7hpZYlf+Myz7mmsRtsxJHHYG71/hoJ+U0TiMItLRiusnTPjlEqeGik8qF8
         wMYDxWU5Yz+QhLjTrqrWxdvWUNwHjFl3Uh2Kz1QWU2hGV0iOpHbAwPULEkd2LYcQWGxb
         b+jJavr5dh4Ly5732jfg6Nso5JBDamjUSob3xULb3ThPJL5ufOwqDexhfsTCOzqnPziH
         XpqipHbNomfcq9OxtcY0SEM91UughpP0pwJ4zkmMcmHYxdChEqnqpmdiWkcfBQ/l+JXB
         AA/+Aizx4jVlK4WwPRcoVoEJheXlWEVQ3tqZvpxibwjqw/TLKFiXbV53VlJGph9LJdnP
         EpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289518; x=1793894318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JlvxwwNyQO6n19Y10XHId6qvmxHt/ChSrZalCBx9Qp8=;
        b=q7URHKIUaBJHD9h+RwYpZO4QESOgECTlVfy6L4InxpokrfJbe85JyiEMZCD6m3SXGv
         IazF/wbZsUU70CXnC9lGZ4LKKIlWfaromH2bDdwajCgOTpD74Oa4v5sBQxA+i3iJtMIC
         RInigEE9fxLsncfPUtCi4bgHv2Rzo6AOW+8q33iCluMZdZkeOcOh/iHbzDznrAu6Wj+s
         CIwe4pPVj38+i9bqbD5Gw/LPktfnB9alw8gRfGai15BZ8+tXiBj7uhTvyXoO8+ZZEvGO
         hi+JDsG4tWqbOE1NdKG+139EZH0VEcpr7PauV9ax0w5dp0yyzZDUXGVKeUYI1KCkjyPD
         aZdQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5ya4pfTAYg8H5uC42oPK8rcmP7JD/N5H1w/3xewcxVMrNThF6Aq0dtoJOxmJXwzE8ekqrJXQTwo7MAtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3C7YlqYhZkk1RpJCtxCp+h2FbupV4mg6kqM/F0XYtla7V1Uyb
	pTvLtzjiBkfczZy/SeJAEpenaqdFysuHM4ey+7EiimuQ66eDwLCbcYxvwYbugnTIg15S0Iu2gHf
	3hVWDJePS2HDx5bunR8+4vOXNyeaMo8YHvWCBO/qd8ST/hTG2x+nfG4xpP+4k/h9Y6Q==
X-Gm-Gg: AYBFou1N+XJC2u34sFFtRC6mAvlCVCBOMWcpPDwdJ0v8+BBEXAElZrzOCjVpy/fBny2
	PS7m3kzLJv3dzaCj7M728ItT0StfYIY6q6TQDsQLtzM1bcVWQNW7NP5jktQieSR6flTpH/EP2jO
	5V8BKfT9iKX+EgB3i7rmBd4lb0xxGCiqyVFnKXSVJkdjovXH1nvai1odBDNTBI3ARwsoONm770/
	/tEAtXq2rPFDlQezrS4YXTO0p/VLLgr2gGH8CqKeTyyR7xmX4U0BDJhr3SSSaFvvt4j7eRjCai8
	9DCanzAtWtZjiioju9OnL8mLAQlBGpwmR4/7BH5q7c8GT8zdYYaP75/cu6wVTawB0SbBzd+hx/i
	W7AViGxL8GOl7OnvRlgoANfSP95KREp0WjAE6
X-Received: by 2002:a05:7022:ed06:b0:182:9071:3249 with SMTP id a92af1059eb24-1a6ced8ec45mr7441631c88.30.1793289518135;
        Thu, 29 Oct 2026 08:58:38 -0700 (PDT)
X-Received: by 2002:a05:7022:ed06:b0:182:9071:3249 with SMTP id a92af1059eb24-1a6ced8ec45mr7441587c88.30.1793289517483;
        Thu, 29 Oct 2026 08:58:37 -0700 (PDT)
Received: from alpha ([76.166.245.42])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1abea527afesm23753c88.15.2026.10.29.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:58:36 -0700 (PDT)
From: Kyle Bader <kbader@redhat.com>
To: Jens Axboe <axboe@kernel.dk>,
	Pavel Begunkov <asml.silence@gmail.com>
Cc: Kyle Bader <kbader@ibm.com>,
	Anuj Gupta <anuj20.g@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Tushar Gohad <tushar.gohad@intel.com>,
	linux-block@vger.kernel.org,
	io-uring@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] block: only fail dma-buf bios that need block layer PI
Date: Thu, 29 Oct 2026 15:58:21 +0000
Message-ID: <20261029155821.2983229-1-kbader@redhat.com>
X-Mailer: git-send-email 2.56.0
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

From: Kyle Bader <kbader@ibm.com>

All dma-buf (P2P) I/O to a device with integrity data is rejected
today, at registration and in blk_mq_submit_bio(). Only a bio for which
the block layer generates or verifies PI needs that. The block layer
then walks the bio_vecs, and a dma-buf bio has none.

Reject only those bios, and remove the check at registration. Then a
submitter that attaches its own PI, for example with
IORING_RW_ATTR_FLAG_PI, can do dma-buf I/O to such a device.

Link: https://lore.kernel.org/all/bbb87d6b-b7a3-487a-8be4-27f3f9ce4a1b@samsung.com/
Assisted-by: LLM
Reviewed-by: Anuj Gupta <anuj20.g@samsung.com>
Signed-off-by: Kyle Bader <kbader@ibm.com>
---
v2: a shorter commit message (Christoph), and Anuj's Reviewed-by. The
code is the same as in v1, so the tests of v1 still apply.

v1: https://lore.kernel.org/all/20261028181412.1919506-1-kbader@redhat.com/

 block/blk-mq.c | 9 ++++++++-
 block/fops.c   | 2 --
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 7fff1305b..3fc9fdeb3 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -3138,8 +3138,15 @@ void blk_mq_submit_bio(struct bio *bio)
 		goto queue_exit;
 	}
 
+	/*
+	 * The block layer cannot generate or verify PI for a dma-buf bio, as
+	 * that walks the data pages.  Only fail the bio if it needs that, not
+	 * if the submitter attached its own integrity payload or if PI
+	 * generation or verification is turned off for the device.
+	 */
 	if (unlikely(op_is_dmabuf(bio->bi_opf) &&
-		     bdev_has_integrity_csum(bio->bi_bdev))) {
+		     bdev_has_integrity_csum(bio->bi_bdev) &&
+		     (bio_integrity_action(bio) & BI_ACT_CHECK))) {
 		bio_endio_status(bio, BLK_STS_NOTSUPP);
 		goto queue_exit;
 	}
diff --git a/block/fops.c b/block/fops.c
index 01bc8afe3..5c8024011 100644
--- a/block/fops.c
+++ b/block/fops.c
@@ -947,8 +947,6 @@ static int blkdev_init_dma_buf_io_ctx(struct file *file,
 		return -EINVAL;
 	if (!disk->fops->init_dma_buf_io_ctx)
 		return -EOPNOTSUPP;
-	if (bdev_has_integrity_csum(bdev))
-		return -EOPNOTSUPP;
 	return disk->fops->init_dma_buf_io_ctx(bdev, ctx);
 }
 

base-commit: 45b716456dd99488a0cef58482120dc0474aa696
-- 
2.56.0

