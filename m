Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793700734;
	b=JajE56ExrGAIIq2J9gPcGuTvNoIGO4Och63VAd8cCb+qVII0nLRm44vrJBGKbj/nlhVD
	 3ttrFujROpWHU2lq4e9+IRDOT/AAyYQVX4ZGro2ReL6KJX52XU4iyvXop/mxJ/xdDd/eG
	 KEoHXzdsH0ODCk1uO9RTocTQHZQ2h2m06G/d+8kRQeHJM2ClroWqg+O9bs2KuBSpPDsU8
	 bdgxGFt1QqG5Q8qQ4SfXGK6nS16TUi7nZRlOAAF0olnXOie43a8r6RmzYAaWwL0emAnHh
	 LWJwHYCRiVpbJ1jDSwgQw1P/VyXL1D2A4YGp89ma4aL3x24aI+QTIK12CvK4YpCY6wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793700734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FfNOitLIXBWU/EzJpPhxbyv+UkEWJ2JnXPpF+ZYiRo4=;
	b=1wctI9JTOC83+cReaOegwRPFJ9vbMG+YNwgwuHlhO5TKNBY3ssXEkhb6ejQLpDy3jYMc
	 +bUXnJ7rmpdy85N8KHzSpatbgf8g4v4RsvY02B4dajhq9EzEJ41VuzkpiVpZeW/NKmq0c
	 ZTYG6c3v4Ifm+/1FIggH4EwEgSFZ0+BytNDOkwbph42opCm7ISwi0lExWFSZaKgOFjWsT
	 cHjc+E0dhUvW6ztWcUIH9gY7Tm+h9ii8qdS3jFoPUsJKyNd0TO1Bn7b3QTe0fYtKh3bKP
	 P2X3343uhEwr5IZUEOCe1xbsRsb/qIOW3T0FmtMW+HyF/jCykiPwLSB54Ysdp4nfzsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C2gakbdt;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FA8606A803
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83FA8606A803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C2gakbdt
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e987b4a710so2797905ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793700734; x=1794305534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FfNOitLIXBWU/EzJpPhxbyv+UkEWJ2JnXPpF+ZYiRo4=;
        b=C2gakbdthO2ch0hfbmtxSmZ0Hirj4mIMqIv1yfvxzNQBGgoazOeSxau91fX9x0ovmU
         +TzPJSce3FNeiA5crKSeebOsG1PXz/49YYd6buyHWeuMAhlg5UEjYWETsQfFrWu6K93n
         KOPM8W7gDbYxfrC3jy3SAdq2AgQrrgFOGqLivpbr2cO6eWQF576MXVSlFnj/nV+lDkoW
         Nsa842j3LaYzltc50hJbAUB6k6+YdxOj45/GPiLX0OOeDk/n7DGMi8E3J8MdWEn4QRZw
         nliHY5Di3ljO25IUg1cW4QosN2WocV4Bq+kgpzUxQmB94ZXar0d4dvrflAl/eSe8Avab
         WdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793700734; x=1794305534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfNOitLIXBWU/EzJpPhxbyv+UkEWJ2JnXPpF+ZYiRo4=;
        b=fIjvYIYGiftL9kbvyAHw/JWctLN9qUmUWZPA1fdhvx3W7spK/6ttII6z/FLm1j1wYd
         hQPnQh41Ddy8TWPRt1/PKS7zBLP7ht7ee3LtI31sLClROPWuqZ0KogFRBXsHrKZa0dzu
         jd/Nnc2kzlRkOXSicQmBRJfVD51k1opmNeO3bxQzjo0vNe5j7ebs9Uj4hIl/30qslYdC
         3H3zbYVAPjijOPsfya5D6rLmXYh8v2E6RLNzJ7qMIVC6kTdcsRs5Q4kES95nishxX8sE
         YtnP50tDMdIlbR45WOtrr0Jqpns0R4t1gXOlKmc2RzAzmc1H3aCJ5PbS5IAARlCXj0/l
         eMwg==
X-Forwarded-Encrypted: i=1; AKwUvBwZguIsd8fHCb69lZZEumkSKSk08kTbIZNjk++Ck+P1kO5bYGfwZaTsGHWJumNvsZCPLlgZoL33/RGsAk8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7rmCq1yydRuA3Ya7TXqyJLamxw6FsayeVe6rZYfG9mutiGunm
	SvSLNEuNBnGShOTmtXx3ViTe/G2i68t1wc9OLny2NuXlmfmHm2qbZIDy
X-Gm-Gg: AYBFou3fi/YjpU/PFQJkC3K3kKCSMh8UNF76LDOvwKUqtOOPoeeFy3BbkfpuDDpsCxL
	o1Wn30Z2DI4T4ix9OWJFLOIvTc6ee4jIbyVTiqDQ3fycJozeH/qoe/1ff5gPLmTPsNMx6CoUHX5
	bVmBjYCfXW++PeNjGgBWVoKzrftNAvoXOW5KPAAvOrcyBHqxGJSyuNyCHjfD+pbGd453VbD0e55
	d7VuyNSBaubvoiSy+lS6lclj/ys60t/R1AfEcF9iHBLzX7myPbS5Z4iL0Fr34G+KQejcf9W/lDX
	fHvBCUwaXhgkIH94KjviFUCcaPNqoYT9PB1pQ4L2E4ha6XVAaPnpSIl2FWP2eLGYbhtnuy0jDBk
	hwDEM75JAEYpj3ELZSxgUt4uByCUw0wtwv1Z5X24ZVEGs+dvhpKubjmL1mOevpxcDCCeFcjtfbi
	1FFxHwnlNkaV2+P2CKfy4bKmxOBxjYZnVo+WfAwS3FwwfL9Nf9cz2SoxMZ3RyVBTmESgdlseGHX
	J3ori9wpn1/ebjUJv6643BVQNCVKcJvvYWgJ6F+I6f2XKwW7nSDSH1R1xq+neIadn3y42xoJAun
	N8WHsfDS5yBMCXGOBObqX/EhSEf17IZdbVizaUArrrTL35A/zkAchtLEuRM=
X-Received: by 2002:a17:90b:1cc5:b0:3ae:3d82:5d88 with SMTP id 98e67ed59e1d1-3ae8917bf84mr7426716a91.0.1793700733700;
        Tue, 03 Nov 2026 02:12:13 -0800 (PST)
Received: from localhost.localdomain ([106.101.10.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aebc89475asm4934624a91.0.2026.11.03.02.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:12:12 -0800 (PST)
From: Seungbum Ju <seungbum.ju@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Seungbum Ju <seungbum.ju@gmail.com>
Subject: [PATCH] f2fs: wait for node writeback on the first fsync after a checkpoint
Date: Tue,  3 Nov 2026 19:12:08 +0900
Message-ID: <20261103101208.4550-1-seungbum.ju@gmail.com>
X-Mailer: git-send-email 2.55.0
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

f2fs_add_fsync_node_entry() numbers each fsync'd warm node page with
sbi->fsync_seg_id++, and f2fs_reset_fsync_node_info() sets the counter back
to 0 at every checkpoint. The first node page fsync'd after a checkpoint
therefore gets seq_id 0, which f2fs_do_sync_file() passes to
f2fs_wait_on_node_pages_writeback(). That function treats 0 as "nothing to
wait for":

    while (seq_id && cur_seq_id < seq_id) {

so the fsync issues its cache flush without waiting for its own node page.
If the flush completes before the node write, the inode's fsync-marked
node block (needed by roll-forward recovery) is not covered by the flush,
and a power loss can lose data that fsync reported as durable. In our
traces the first fsync after a checkpoint returned before its node write
completed in many trials.

Start the numbering at 1, so that 0 keeps meaning "no node page written".

Testing (kernel 7.0.0-42, f2fs built as a module from the same source,
QEMU/KVM, block-layer FLUSH/FUA model with dm-log-writes replay):
- block traces, append+fsync after sync: FLUSH issued before the node
  write completed in 29/30 first fsyncs unpatched, 0/30 patched; never
  for later fsyncs;
- crash-state replay (28 cells x 3 recordings per module): SQLite
  WAL/TRUNCATE/PERSIST, LevelDB, RocksDB, LMDB and an append log lose
  acknowledged commits or become unopenable in 24 cells unpatched, and
  are clean in all of them patched.

The same code is present in Android GKI android12-5.10 through
android15-6.6 and in the f2fs dev tree as of 2026-11-02.

Fixes: 50fa53eccf9f ("f2fs: fix to avoid broken of dnode block list")
Cc: stable@vger.kernel.org
Signed-off-by: Seungbum Ju <seungbum.ju@gmail.com>
---
 fs/f2fs/node.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 1234567..89abcdef 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -361,7 +361,7 @@ static unsigned int f2fs_add_fsync_node_entry(struct f2fs_sb_info *sbi,
 	spin_lock_irqsave(&sbi->fsync_node_lock, flags);
 	list_add_tail(&fn->list, &sbi->fsync_node_list);
-	fn->seq_id = sbi->fsync_seg_id++;
+	fn->seq_id = ++sbi->fsync_seg_id;
 	seq_id = fn->seq_id;
 	sbi->fsync_node_num++;
 	spin_unlock_irqrestore(&sbi->fsync_node_lock, flags);
-- 
2.45.0
