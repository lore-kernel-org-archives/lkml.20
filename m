Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794544767;
	b=xa9QaLwh2a5Abmqetud+TJD7SJ0QcJr+l4H3MDhhZFF+n8QVJkPzMww0BkggNs/IyxAJ
	 cZn9FNASmJ9HFMOJYOfa6wiXPonrMExaISQ5IJiMObdiT7UNeyoTd0zQhMmeqSd+GWoe6
	 lefvNRKtFnSKw4VFMymif0jWCicy/HF/UGuZktIwVSVQTxXBeDo3iV719Cwgm1byPWnoK
	 aMnuAkuLGGM+TTAQvU1DwGuzMb1kOBOCy99Uchj+gLjw2ns9r6A9LTODzDLYxwGLOsryp
	 FMP9V4SUOumgpXR5+LzPIrkZJO47+CCfeNe3E4A5WvrPCd62OV/5H7436y43SLm+3Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794544767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tFaT0DZ6F3QRjTbdaYV7CT46FZwUMHFmzpgE4p3kzPo=;
	b=QxVTTA9G0rWoWBIwOTrypO0ykUoDE8VC8FCX5FVO64r9mgBa+cQnsdDAJluMPvzAtayX
	 q9S06a9wboiyyY6QB+S3RQde8hmiz1r2QMVLzgOTY3oXgsmVZ3pqc05kl2V7f5mNosVo3
	 6aX2KH8ZDZPdEH79LFOdJ8k0EdzJCoHN0CwIFcbDzdLtUPbvHob2eNwO1nFo2VeNBJs4k
	 5WmxfzCALnf0jlK2L4kSid9moO7M7Q2nzNhuVNvdqXFKSNjk0X+nVAAKmOAoU8dAoEPio
	 dTA9k7vqNpX2djlU4jcVb6d3DHeNW8FwKfjKCprfLXJyq6XpdwUfc/TAw1cmAERpbAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=KBDxmF3I;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AAD606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30AAD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=KBDxmF3I
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67bf3c6654fso560184d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 20:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1794544765; x=1795149565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tFaT0DZ6F3QRjTbdaYV7CT46FZwUMHFmzpgE4p3kzPo=;
        b=KBDxmF3Ij+U4FfCQaLZjUdUB1gdLJ8WW7JSEB1K9WgBXkrcD+fjhYsRfR7O2ntRU40
         4Sibb6XwHj7eji9fKO6U34e0ySQ78CBBZ95skC6WYKplQlA6NGMIMg4/2+Iqd5cmrOgf
         fIyLWWidqZz8ZQ/NH6dwFveIb71lB7Z35q3suSPUSrrXy2QNqN8Nek30GPVsJWIz2mog
         E0o9/W6EVQdStIMoXqVC8qTuUUXUwcY05BtZ3/5pn5iziA/T1hZktg6POXiRa1VeaMKr
         3H1ypnIvXjCIG/v31j1a5a4ShozkqRvGzd05bQZSPqO9/3hgK+ZcLxv7WAG9nJB/mRJt
         GppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794544765; x=1795149565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFaT0DZ6F3QRjTbdaYV7CT46FZwUMHFmzpgE4p3kzPo=;
        b=wKzb8gNrNgNHWfc4o5z0mf3cqam0GW4Y8AqLUMO0VVV2nAc/VjacaVFX4mjQKilpFF
         Ej6xInFrl+HS7mwFDCFOww56cqQ2Xx5Bf2zLvtAkP5RFj4NO/9hXutWqQsfFOD/EPNT5
         QzmTmifJqlYDUix9SMxLUjjnSm/8Ig+NNoUCv/g6VlqicyaaMcImUdWqF7HnjrTeXXy9
         WpYhIFWZjOwzgL2yv/wEfhsyvlo1ikTkf+p6dgbCjeb84UIwsNmQEOOt05/Ko6hBTXQp
         0m/7lN/fqIcMKuR/1/FEi5M6iPmbM+fIm35yl1t9HxeJ4cFOSKfXxeJt7OnB3kq6yTDh
         rvgA==
X-Forwarded-Encrypted: i=1; AL+hErFSuRAgLJNREUbqn/dqNLIfHXwWUiLFC3TYOTqsiGUvthA9rWF7UEukyBxw2jlEOIHbIThprrE3BMxmhZg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XvaDQxzacepPZKfd1mO89FdHZG3Epo+nlJ2RSHEioubUUABzM
	cDZi7tKcf3ekpDMqNzDkri2caWNLEfA51dX3ch+unIA3lKAdy/lvskEwQHWDe1DX/w==
X-Gm-Gg: AYBFou0dNfXi0DRxZvjdflVW4N2iPhZWiKTqEfl8kM3CXyYxCtD3e/KRg17WOTBHivg
	uML9kclxYHxuKi/18dMshrnJwAFuyNTah2p6OWtAhIqIdyKkxvGRNkGy30F1meqjA5o3IAYOPTc
	LfbDyU9MKX+lTvvMUsNNHel54OF1iEHHQB/Bud6qEddB+AiWtbmdR4IdMAnIad2X8iHwf+tjeik
	+arHHxjdogmeAK3NRM5gMIw8pTKhjXudy2jBCFNkthcrH3JYkZKg7z9BWD17WqmthWrG5YPXYfl
	L3IkIMm2FGCFUc99rbE/jQMuhn5NryB49KZSKPbaYHVjO/gdLxBgZZ/ZKVBPSuBMsoywLoEchoN
	sDPwC3xJ4Osj8XId3wPcJ4o63XCeSip80HZ3qW0YYLN91O8z+QBiu+YPYFuUN56r5Mtk2BXe5m+
	HfM5LJBS/+piOerUP/BCNQNkGHd/Bn0opRrjALE2h4mYZEALY8738gQJBL21tB6xJ/SMgThLVO5
	nZWEpgSP8qaTHlJWQ4coWM5C/2GsAWfiZ76y/sPQtC6aHfYu0dC4mGpUB80ygTMFIpUTYtiu+Sj
	REQTTGXDWihRwFhemfVcX6v8ZkziVctHOHacXpA/oQx8UJOwhU/rHQd1FoLVkwLqdLthD5D5
X-Received: by 2002:a05:690e:1917:b0:679:ba40:efaf with SMTP id 956f58d0204a3-67d895e5adamr679117d50.46.1794544765076;
        Thu, 12 Nov 2026 20:39:25 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a64b04bsm1078108d50.23.2026.11.12.20.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:39:24 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] fs/ntfs3: do not restart readdir() when entries are added
Date: Thu, 12 Nov 2026 23:39:20 -0500
Message-ID: <20261113043920.2583254-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
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

Commit dffc7f2f177b ("fs/ntfs3: allow readdir() to finish after
directory mutations without rewinddir()") made ntfs_readdir() start
again from the first entry when it reaches the end of a directory whose
version has changed. This helps programs that remove the entries while
they read them.

However, indx_insert_entry() increments the version as well. As of now,
a program that reads a directory while another program adds files to it
gets the same names again and again, and reaches the end only after a
pass during which no file was added.

The issue can be reproduced on an NTFS volume mounted on /mnt:

    mkdir /mnt/d
    for i in $(seq 3000); do echo > /mnt/d/a$i; done
    for i in $(seq 10000); do echo > /mnt/d/b$i; done &
    sleep 1
    ls /mnt/d | wc -l

Before commit dffc7f2f177b ("fs/ntfs3: allow readdir() to finish after
directory mutations without rewinddir()"), the result is:

    5489

After that commit, the result is:

    1837538

This patch will increment the version only in indx_delete_entry(), so
that added entries do not restart readdir().

Fixes: dffc7f2f177b ("fs/ntfs3: allow readdir() to finish after directory mutations without rewinddir()")
Cc: stable@vger.kernel.org # v7.0
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
The readdir() + unlink() loop of that commit keeps working: it still
empties a directory of 20000 files in one pass (298 files are left on
v6.19).

Application impact (Ubuntu 26.04 user space): "tar -cf" (GNU tar 1.35)
of a folder with 3000 files while "cp -r" adds 2000 files to it. On
v6.19, tar ends after 1.2 s and the archive has each file once. On
v7.0, tar runs for 29 s and the archive has 200434 members, each file
up to 48 times.

Tested on ntfs3 master: without this patch the archive has 261512
members; with it each file is there once.

 fs/ntfs3/dir.c     | 6 +++---
 fs/ntfs3/index.c   | 1 -
 fs/ntfs3/ntfs_fs.h | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/ntfs3/dir.c b/fs/ntfs3/dir.c
index 7ee1a5d4189e..defc84693e39 100644
--- a/fs/ntfs3/dir.c
+++ b/fs/ntfs3/dir.c
@@ -476,15 +476,15 @@ static int ntfs_readdir(struct file *file, struct dir_context *ctx)
 
 	if (!pos) {
 		/*
-		 * ni->dir.version increments each directory change.
-		 * Save the initial value of ni->dir.version.
+		 * ni->dir.version increments when a delete reshapes the
+		 * name tree. Save the initial value of ni->dir.version.
 		 */
 		file->private_data = (void *)ni->dir.version;
 	}
 
 	if (pos >= eod) {
 		if (file->private_data == (void *)ni->dir.version) {
-			/* No changes since first readdir. */
+			/* No such delete since first readdir. */
 			return 0;
 		}
 
diff --git a/fs/ntfs3/index.c b/fs/ntfs3/index.c
index c06b36760448..29884bf3d35e 100644
--- a/fs/ntfs3/index.c
+++ b/fs/ntfs3/index.c
@@ -2100,7 +2100,6 @@ int indx_insert_entry(struct ntfs_index *indx, struct ntfs_inode *ni,
 					      fnd->level - 1, fnd, cmp);
 	}
 
-	indx->version += 1;
 out:
 	fnd_put(fnd_a);
 out1:
diff --git a/fs/ntfs3/ntfs_fs.h b/fs/ntfs3/ntfs_fs.h
index f400cf94d05b..12212fb7a2be 100644
--- a/fs/ntfs3/ntfs_fs.h
+++ b/fs/ntfs3/ntfs_fs.h
@@ -198,7 +198,7 @@ struct ntfs_index {
 	struct runs_tree alloc_run;
 	/* read/write access to 'bitmap_run'/'alloc_run' while ntfs_readdir */
 	struct rw_semaphore run_lock;
-	size_t version; /* increment each change */
+	size_t version; /* incremented when a delete reshapes the tree */
 
 	u8 index_bits; // log2(root->index_block_size)
 	u8 idx2vbn_bits; // log2(root->index_block_clst)

base-commit: 0c895b1f6ab37a7c72a437818f307ef6e629051c
-- 
2.53.0

