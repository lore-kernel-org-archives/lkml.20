Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFC6482D4
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 04:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791607487; cv=none; b=RtV8ASIKnAArpNCCe8uNTpHLpnPxas6nmNWQXLPVILjUWYhsqw+OxTrnRuSicYbxFuyLJHHCTiiioaNCszMQgLwnzhScZInBfFHmJ4uZcj5mP0Nq1rHe8xqE9LYPG1XkUsLTxQG5DT2O8q9gLEcgGu7NrLsdNAYOazwtHCjxfVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791607487; c=relaxed/simple;
	bh=NJ8Q7R+kkyINmmcbmlNU2P6jcWurAscUCSHGvHNdJNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/jkg/DU1bpGk2zSQrZ4xtD23PFnE/4rtEfWuQUI77D4+whMfldv+mm5IrFVIKOICzckaM0Rj+vRGE+fdnCLacFuzHhCg/ED20sgbNYu+lMqmab18n2gJXHHCa14PSTRHKctDX4DQZCs56CF7rE7U/tyzJhEyl5d6xXpfBBRuKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=IUUW6suD; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="IUUW6suD"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-533778ab0bdso4364191cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 21:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791607483; x=1792212283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hiI5l1WO37R1trlnFJLtpLJkrk+sQLsTydeW4SAQCdE=;
        b=IUUW6suDysPlluXSFSSxoHoxtdLdEv48BVakQp9F7JJYxagW9afj8j4kYtV5/1V0uS
         xI4xxVNT5vSuZjgqu5AFINEvfA9UpF6P1EgLYB7io6GlVhihEfHUqsNApwU+0cf8nuHR
         WhI3uxKjefQ+qpE6WdthpkpoDGDEMKzIQ9/YqmPlJaZJS8yPi0h9pMzgExV0TSBajMp4
         YGO1ZLm9BtIpW4j+cN73O690UM77CktUvn6yPiDY3XCCsB4mSzCxZuVcBWiDiCE2xOgC
         KUxABVefnYrwfaNl+DZIvKbeD/+W4f35mRViqujeOkX2YXgxIJB+OGPH0tgNtuAzsbRX
         72eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791607483; x=1792212283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hiI5l1WO37R1trlnFJLtpLJkrk+sQLsTydeW4SAQCdE=;
        b=G1MCdIxAAgZOt1MG4NnGmxtVuSe8x+PBXlpQGrnBJy36AkCnbADs9sOkqcRaOJQJgk
         tZ/RW5jFm/Hl1ffewNkfyyPQsyMwXL+96KgedorDg39vmrdjFpV/PvqZ52s5eym9Fgfe
         w4kHB8sm12liAz3dqQuJ5P1bqua+IfJvc8lcKF9uNqxeEB2m23orH2jptexkECH4YUJu
         Oz6qidR7lIbtbYOzm6bG5dWd9wvKeA+IZhNwpUoV2Jl0a2N7abkxSN3ft/eujQSKW9V7
         FWhxQ8xF7lOP1UVBHF8OhubA5gWnaT/wdc22YmSCN0QpovBfOn4RXXS/oHYop98o8Khv
         O7DQ==
X-Forwarded-Encrypted: i=1; AKwUvBxED7rJ96njgTF5w4yJkf/lMOIbrRfrveINM4S8kMB4vG2yb64o0xiC5yY2uP2/hzylnHt0gJBGkStksDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsQwcURUR2fVYOQkRIpyKbPG+rkvybS/pVklhKFvyhcjuLbQ3f
	3X/s7H+3wkCqS7EB9d5Q2i57qLI5hMrLRSLouHk1Qf9wWY8fXV3ZcSyjaLvylzS58Q==
X-Gm-Gg: AYBFou1vlB0Wp6NQZk7DL600Zo1qPXQALw2e/aGIQzd/rMcx2ApbZiyBu6x5jIqjMho
	bHPgGD2OZ8H1wl8GSGvjAgnoiyLSUHHkYKvBPLH7+ocGCqXUpdmNUoJrzD5kGERpQvd9Tk6Kvim
	o70OrGocKDgyTboZKVGjWyEVCJL/Ge9h5IDhKcts5+bnJtLklVV/QgEgDH107J/SwN4TZme9PEt
	4sAxkxQZMFOT6VJiSTP6hHKruFhDaAMlWJh1r1G3SCESPAo1yULUHuMQ5XTpCngCisLYukTf721
	lWHhyuoSkitD5D0oQ/wEJ5x8L+RlGDtkjeu1V6lrsXQR/SrGzJ2GpEsEXt7xNR7HEHb+iE4m0Xc
	G+kUMvEaZMff8On+I1xx1J0OnSJSy6nfjqirRyxUHWHNzQ8CRkIxIFekeattXdh8wTWcNSouR+g
	gg0985RV0Mwz+T8igW4VMrqsc9lBa0s2o7kIsnPEJEa49uaPA4eusy7JT288+IGseRMRI2HzKt+
	ixadgADXFd0kYKrrUw4TA==
X-Received: by 2002:a05:622a:1453:b0:535:a5f8:a5bf with SMTP id d75a77b69052e-535a5f8b4f3mr56134281cf.63.1791607483187;
        Fri, 09 Oct 2026 21:44:43 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550de014sm35943476d6.44.2026.10.09.21.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:44:42 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>
Cc: Yuezhang Mo <yuezhang.mo@sony.com>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] exfat: fix a large buffered write failing when the volume is nearly full
Date: Sat, 10 Oct 2026 00:44:20 -0400
Message-ID: <20261010044420.4045884-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 82a81a7352bc ("exfat: add iomap buffered I/O support") made a
buffered write map the whole range of the write in one step, so the
clusters for all of it are allocated at once.

However, exfat_alloc_cluster() returns -ENOSPC when fewer clusters are
free than it is asked for. As of now, a write() that is larger than the
free space writes nothing and fails with ENOSPC, while it used to write
as much as fits and return a short count.

The issue can be reproduced with a 16M image made by mkfs.exfat that is
filled except for 256K:

    mount -o loop /img /mnt
    dd if=/dev/zero of=/mnt/hole bs=256k count=1
    dd if=/dev/zero of=/mnt/fill bs=4k
    rm /mnt/hole
    dd if=/dev/zero of=/mnt/f bs=1M count=1
    wc -c < /mnt/f

Before commit 82a81a7352bc ("exfat: add iomap buffered I/O support"),
the result is:

    262144

After that commit, the result is:

    0

This patch will map a single cluster when the clusters for the whole
range cannot be allocated, so that the write goes on until the volume is
full. Direct I/O is not changed, it still fails without writing as it
did before that commit.

Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
Cc: stable@vger.kernel.org
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Direct I/O is left alone on purpose. exfat_alloc_cluster() could
instead take what is left when it is called with contig set, but direct
I/O uses the same path. As far as I can see, a large direct write would
then allocate and write those clusters and still fail with ENOSPC at
the next mapping, and the clusters would stay beyond i_size. Before
82a81a7352bc such a direct write also failed without writing.

Tested on v7.3-rc6 in QEMU with 512-byte, 4K and 32K clusters.
fsck.exfat is clean after several writers filled the volume. The patch
also applies to linux-next 20261009.

 fs/exfat/iomap.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
index 8911aa84a730..22facb240b85 100644
--- a/fs/exfat/iomap.c
+++ b/fs/exfat/iomap.c
@@ -74,6 +74,17 @@ static int __exfat_iomap_begin(struct inode *inode, loff_t offset, loff_t length
 
 	err = exfat_map_cluster(inode, exfat_bytes_to_cluster(sbi, offset),
 			&cluster, &num_clusters, may_alloc, &balloc);
+	if (err == -ENOSPC && !(flags & IOMAP_DIRECT)) {
+		/*
+		 * There are not enough free clusters for the whole range. A
+		 * buffered write can be short, so map what still fits.
+		 */
+		num_clusters = 1;
+		err = exfat_map_cluster(inode,
+					exfat_bytes_to_cluster(sbi, offset),
+					&cluster, &num_clusters, may_alloc,
+					&balloc);
+	}
 	if (err)
 		goto out;
 
-- 
2.53.0

