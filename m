Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303527;
	b=dywwhR/LL/1XqZikMvr67wTrfG67QKOH65+nhqeBRHZKtdxv65WUsKMJ/h93v5c2g5RJ
	 dQjSx2v5XTBLOVnkH/KwlK7vNWLR6VNwMMHVkQsxM4j7ywdVzhY1c4SOUG4T+qEdUkBKZ
	 mEkCd4sJ8m6zod9nEeZdlg8NCTmN+UchvBwkvJwN4WsXHqJ7QvfnqJegtaXelAcdrynqa
	 4UPtytUe/J4vnLt5gHwVAkKoKBQqgr1rjrVP5YbP/6NCji2qseRE0lhSdgbtVY+QCrIWv
	 7T79HLKapGreDlU2pI9s5ty63wfZ+b4hN07Gqox5mRURoxtIWiXlxqFzSeG9vpGrhJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h+J3J0epLuUim0gFkWCnrvjgBBaMOJi50a7zUOpsEaI=;
	b=R4k5NDQPipdVL93ewbIrihoTdKcEY36Jak0Tfm1MmGuo6wFIqkMqqyRn2JO5inh4Jugb
	 7Vw2ODrVxXQpV+iBHuSkLk13Q5wcjry5i0P0cFWYq+TJ0RBkY5JVbtF8ERPlyt1QGisGv
	 a7s6E9krKNvlGsNxcpjCL6tVP4DCPShWLLeafvVIs7WuNJuVSWsxnEwTuk+725oh5nWKh
	 N6hxxVBGsBF/sb3mZ4YWppO6cXk5m4uYoQIyxdEzMtdag22ii2qt8uXHObHAABPSpsEps
	 mqsONRFHdoRnntbdGn9D6KqOlVtmMzy4PlNiH1nVrZmUWhvSIZoCYIlN37t8HTKeztg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aeiS47eX;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B10F606A930
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B10F606A930
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aeiS47eX
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so2664525eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794303526; x=1794908326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h+J3J0epLuUim0gFkWCnrvjgBBaMOJi50a7zUOpsEaI=;
        b=aeiS47eX2RAlloEV5TbLKxN8HadOSwzbwZxfrumaatbz9mTX8YhdUMlIVqyh2SZ9zN
         gHNzBBrJSYM/5iQ8UCoJ1Myhq+WTgi/3nM5+dBl33le91DIY6ChPiene272uJNyGcULt
         6aaEWz4ScHNiqT4CRS6OW3zUhmZhw5WBrmt5geSwk45+LMRdExhjHo5t8OhQjg/xbjLf
         YZkwzwvSRfEoDjVyD2uY814yAwBusqCi3tSPBmXY7FCZmnucSgXBCV+1wiXHqUjdB71h
         4ZJw7EE5VFbTTCpf0/jig1sCt7yEPG2I2fwZsWatIOXFMTXMQDD5hHlVOKntpel8S2Zo
         8x/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303526; x=1794908326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h+J3J0epLuUim0gFkWCnrvjgBBaMOJi50a7zUOpsEaI=;
        b=jA+9873ZHZISn9brRJaepjIhyfa/6NFhx5jbDoUnk63L5rcydftkrtK97CE/CTiPaf
         InTDrFaNQITYjb6EVBRobRLfO3FsQk5qzmfa6wPUojqbVhoCgZin8b8ybFLIJySVc9lQ
         mOFJmQDcmjpi8waAqzNJPD9gcN//QvLH+/ouOZiWk5lO2QkO/j3UGeT6B1PjWzbSRmDS
         M5coobiAvts2pX6gnGcn94QiATCJFBLR8H2n9BZ7xJqPXGnLN334kiEMnsSRhfaw7U5m
         WuI5qTHaFx4P/8+cKvgnSml3iAE54AlTZbDcUSNNKII0o2Y2ik+XTBluvwwe5MiqAbQX
         Y/yw==
X-Forwarded-Encrypted: i=1; AL+hErErKwD6ul84QyzJ/LSEPTOqB34dnfxkNnZ0RyRn8BWAzdPp+d8xExXq6pGISlD7bgOcbBDUuyHk5AA/IV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8f7tRu5tS6iTn9hcQuBm0EIiO6BOcz+YBj8b6w8SxZtinJEdN9
	gdM2AvXtPKgHpHx30fd93W+ZLTVi9tdXB5Utdt72p3Rg36BQ5ResmYwE
X-Gm-Gg: AYBFou2+EP26M0WRVnyUJc16TLQqXhmTjTb0LgCQ0rTAYmKCO2iXWF+d2MuWj2/cPMT
	wFSu3mGsz+FMZulhjnsA/h/bA9FtCbyBZLbGzgVBM0FHrN7OkjXkjbaa4dZ6oMCvImk+cwz5vW+
	9Tl64DUrbAn4ZGm4Dy0Z+5Hi4ABamTeQOu02Vf8+zx/TI5HgBlsnYq4Xta7qItXyehSnzlr+D+/
	Y/T9D623oZwl6boei4d2l5Ia6e4MA96CjBBaC6KFeb0yA+g26u2sVj+OFMq75ms6SHv+zKxUgYT
	xcv6E6ybxvC0Y58fUz72VKYZ2Zu9A7w6B9RSYkt3EfhCSrx2utnPVqZiMllTHvjQC1ZrGyZexfV
	4xeLdvtt8A53obws+SCEr7ugqLn31LjXpUesJzyu11yBxSe0YD6v5pf7kFFhpIXsz3o5oKRkSHj
	2Re2fPCWFtPiVOfIVI88pDqQbJiSk9pSuO4R0lafzS9T6xvyCVaIJY2HyE5CAgWIaIGBlNJxP9J
	gtP9721O+utKw1MSYdGbSGW22ufdChRS227tU/RJKtkoiQoXnIOc4QqS1XHUQdckua/lFloYqyE
	BnvI7pdnDjGVIiNidgeNEUkXnPcFbiGPGpeX
X-Received: by 2002:a05:7301:488c:b0:369:ff7d:840 with SMTP id 5a478bee46e88-3751ef7bbefmr3078034eec.21.1794303526196;
        Tue, 10 Nov 2026 01:38:46 -0800 (PST)
Received: from hanzj-mi.. ([157.185.136.247])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm4996931eec.0.2026.11.10.01.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:38:45 -0800 (PST)
From: Zhijian Han <hanzhijian1991@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+6cc93ec9a4035badb85f@syzkaller.appspotmail.com
Subject: [PATCH] jfs: hold a page reference on log pages while I/O is in flight
Date: Tue, 10 Nov 2026 17:38:41 +0800
Message-ID: <20261110093841.2470586-1-hanzhijian1991@gmail.com>
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

