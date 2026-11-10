Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294910;
	b=Lw0LjUABL3cUKwEg1nwMPXYZt1IwHoNnA2F+2Itw4GZn5TgjcU4wGehBfSDolAqfM9JB
	 IOUTxNzr0Ay7ILLaHDM8xx1N1rZRWCcUdoIZ+e7T90Hbpdzbs056yj7xZte5LCIhwh8Qx
	 ZTa0ND/71Bv+h3RbtlobZrN+C6AnUQfBAKPqfgmZ4O7v8C3NPiuVaxjJX5cVnykL2pg9v
	 dI5Whxy4+8UCwUKG9PXQJhbycGJsefT24raWdvrvES64OKfIghcl3NVCNtX81jMbRf1mM
	 uEJ7jkKdIQzDLsz/3qnJjdV+X9/oQFfvYzjuULnO4/ZEUb0dKFv3FmPMpmiVx6YTpzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h+J3J0epLuUim0gFkWCnrvjgBBaMOJi50a7zUOpsEaI=;
	b=UWoX20GtH0O3IXaYP/6zEaQ733+IxfsD7WaKOk232TssGJUlucx8VqzyDyWhUqh4Zxpk
	 bLtAIB9jYYmaJ2Q47hPrPv618IjEcZvvib/bYp2KcQen7fpZqjN27xN5WRAtVcZ6Fch6A
	 aBhGoWZLd8XFXQET/N3//q5p5EdRSeANKW1F0l4CfwyVaCATZ0tfrrn23r9p4W1dQJFPw
	 UT37R/PxuXz9ZZ0KDDWCvuqCtLCym9rdUU3g+mEBULQ8yE470bDzWhrtu06T1SAaCFZoR
	 UENE9Bw5lokywtBxuYz7wgbqdR+eqb+HjYU7NXlUVsV2pIR++eEqmQ3H2CaNO/yrk2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IC6s7YNj;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC15606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC15606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IC6s7YNj
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso3446870eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294909; x=1794899709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h+J3J0epLuUim0gFkWCnrvjgBBaMOJi50a7zUOpsEaI=;
        b=IC6s7YNjlZ9PztkV+z7oGAXqHLNbg5AWY68TafBW93FK1CXQrcPpNVR5skIHqL/ZOA
         fhO3AYcgJLmIsI6FcUUKphIsZkb1RKjz3RU/HONs0Y+rhuJZgS0HsMAlQ4s6VlujCYQn
         KyBAz7Ubu8KPdqYMupcB4NsybMOpTAmHDh+a829OJth3ZYv/swcKQAhmDKoQGr9hOL8K
         9LVkhQsTck/UYcj0vaUVZEtJ2T13mqmBD3+Rfq2LsZ8xegCO1lOP91SrOoBKZ4VwcE+f
         5VMBjkUOGWRkxtk2jI6etAKvSs4AHgY85NeD0iRwlRkaZDXvmPegTZMNZWBW72twXWjx
         Lq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294909; x=1794899709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h+J3J0epLuUim0gFkWCnrvjgBBaMOJi50a7zUOpsEaI=;
        b=w9vzuBIauHddRsKDVDGk+fe2xqcT7qNCtIlZvpLSaXQNxygNbZmuS5ra75WOdismFf
         g0N3wXxUJmRaPA/9HnvAQ3C+Mi9fy00Cymf2APT9c4CePnWyXxIQOHJOgjiFyYroMO3j
         5v618wEdHifjjBk61d8GacbBDsV/k+xWxFDwZu6HpCSsuzXvp49G2JIT+k4bquB12vGq
         +4qrrvA9xMOiPvyN3H/hmDY76IKCRnAfzk6TglkgiV7EOcTnvUDbnvWbZO1rpGASpPUd
         uDnp/3rqfZs0x8ucruvFcQE1Mmco3f4fLiPraocRTee4+15Bh1m+F6dWICRQSL7+F9Ce
         +FxQ==
X-Forwarded-Encrypted: i=1; AL+hErHwyK9QVrWGAzGhVe6KYGMJhkIKRouAPrGZHNpckjg6G8fKhgfeEHAzK/IoE2FWanDkiFCE/c+GLNKn0fQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z3NYzP6G+mAbgPztG85fkrFe1ymmfRroHusIr0cX0wXD8ZI4F
	2s4MIdxk9RRQ0ILgh+ZCxdm5jWbPSEPaAsl2KAOLSmxCFv0Zf0xNeD7/
X-Gm-Gg: AYBFou1klrCKRMesVVmprIZYwODlD4RPem1Akvlxl4pY0KhMEOZWoGO/cgIAHgFoEnF
	/Ea6dv17D6ax6/xJPetJQN42tpC0+642bWy8IDq/DiBNixmHp80QyeyE1UuJBhvRSUCY1enSd49
	eVSHokXX2XtAtSc5snLuWjZuRvXOeI9sBk0R43fW3f79MgD3xUXIkjlSnHRH6Cgre0odoLpoC1p
	0MDYrILNSkyZy+ScO4BVwnfopbbTEWOJO8ucxCTe5KmOazwB0pLYdBcy00EVao5FeAped6SU3ds
	bZ+k9jC1zgoW7MebrYAjDOm8M5OLyX4THvcoDA0ncfpIix1Bd9tlgCozyb27mvqWk3eFG1zyK+C
	xvsS3gecZ8h5GebhUOyy2jZYvs/bj2q+wEIVSvbECdGISnRcRTDLcEQ1dyVr+psJxRYhxGKsJiF
	fWDKu9f5K0t3ac1JmRwq3tgbdDaPOSPPxwU2PpU5uEfNQ3pI008RxMY+SCYfcwoDIuNsuBTT3Ym
	1e9/tKglmoMAhAtFuN785tDdquzPR5VmaMZJ1KlGD55/yjfogNR+jQ33zfeSnos5WXHIucGEzh/
	6SdHJNPGgebA2XpXtc3e/CSLsPC+5kFMiPBQ
X-Received: by 2002:a05:7301:fc10:b0:36c:a084:30a4 with SMTP id 5a478bee46e88-3751ef77c77mr2325949eec.21.1794294909109;
        Mon, 09 Nov 2026 23:15:09 -0800 (PST)
Received: from hanzj-mi.. ([157.185.136.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm5034648eec.24.2026.11.09.23.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:15:08 -0800 (PST)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+2cec257b63d85bb983fc@syzkaller.appspotmail.com
Subject: [PATCH] jfs: hold a page reference on log pages while I/O is in flight
Date: Tue, 10 Nov 2026 15:15:05 +0800
Message-ID: <20261110071505.2411506-1-hanzhijian1991@gmail.com>
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

syzbot reports a use-after-free read in copy_folio_from_iter_atomic()
that has been reproducing for almost a year:

  BUG: KASAN: use-after-free in copy_folio_from_iter_atomic
  Read of size 4096 by task kworker/u32:9
  Workqueue: loop0 loop_rootcg_workfn
    lo_rw_aio
    shmem_file_write_iter
    generic_perform_write
    copy_folio_from_iter_atomic

I reproduced the same KASAN report with the C reproducer from the
syzbot page: the loop worker reads a log page that jfs has already
freed.

The jfs log code builds one-page bios for its log device in
lbmStartIO()/lbmRead() and adds the page with __bio_add_page() without
taking a reference on it.  The lifetime of the page is instead
guaranteed indirectly: the lbuf that owns the page is kept alive until
lbmIOWait() observes the lbmDONE flag, which lbmIODone() sets when the
bio completes.

That guarantee is not sufficient when the log device is an asynchronous
stacking device such as loop: log writes are pipelined through
lmGroupCommit(), and lbmStartIO() marks the sync-point write REQ_SYNC.
The block layer may complete the REQ_SYNC write before an earlier log
write has been processed by the loop worker, so lmLogShutdown() can
free all log pages while an earlier bio is still queued inside loop
and about to read the page it references.

Fix this by the book: take a page reference before adding the page to
the bio and drop it in the completion path (lbmIODone()), so the page
is guaranteed to stay alive for the whole lifetime of the bio.  This
is the same lifetime rule every other filesystem follows for pages it
submits.

This bug was found and analyzed with the help of LLM tooling; the fix
was authored and verified by the signer.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Link: https://syzkaller.appspot.com/bug?extid=2cec257b63d85bb983fc
Reported-by: syzbot+2cec257b63d85bb983fc@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=2cec257b63d85bb983fc
Tested-by: Zhijian Han <hanzhijian1991@gmail.com>
Signed-off-by: Zhijian Han <hanzhijian1991@gmail.com>
---
 fs/jfs/jfs_logmgr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index 306165e61438..ef9ef11ddb1e 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -1971,6 +1971,7 @@ static int lbmRead(struct jfs_log * log, int pn, struct lbuf ** bpp)
 
 	bio = bio_alloc(file_bdev(log->bdev_file), 1, REQ_OP_READ, GFP_NOFS);
 	bio->bi_iter.bi_sector = bp->l_blkno << (log->l2bsize - 9);
+	get_page(bp->l_page);
 	__bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
 	BUG_ON(bio->bi_iter.bi_size != LOGPSIZE);
 
@@ -2117,6 +2118,7 @@ static void lbmStartIO(struct lbuf * bp)
 	bio = bio_alloc(bdev, 1, REQ_OP_WRITE | REQ_SYNC,
 			GFP_NOFS);
 	bio->bi_iter.bi_sector = bp->l_blkno << (log->l2bsize - 9);
+	get_page(bp->l_page);
 	__bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
 	BUG_ON(bio->bi_iter.bi_size != LOGPSIZE);
 
@@ -2184,6 +2186,7 @@ static void lbmIODone(struct bio *bio)
 		jfs_err("lbmIODone: I/O error in JFS log");
 	}
 
+	put_page(bp->l_page);
 	bio_put(bio);
 
 	/*
-- 
2.43.0

