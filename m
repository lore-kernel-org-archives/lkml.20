Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD243CB2C7
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532536; cv=none; b=j/lmwd3PG96BoAc5048u6i29KBzv9iPgGRin8rL8tDcRXu3LpkUOR5k4eoH5ku8cdXxF9Ke83fypSC8E+JS+yprdgWGhoCniD8pKsWFeRjEj5jQ43P4cGgbyr188JarWlvRrznIfME0DM5c/sSzfNn4O70BmTwAIIXeO0FMVet8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532536; c=relaxed/simple;
	bh=GGWG3PvZ+dj8ILoMzIykvL89QNaM5P9n7sLzJHHke88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ez86JyWrMMdiU6x77zhgsF4pt5eTm7vcB8lSu9onVauaRBtvJ1zJ6tdyXccfKa1L5eKiSe+JhdSKTCbc61h5moEjTiSoi5C0TcZLN16EASPyroYnF6fSxujV9jtHu+Zuifu0QpEbokJljnH5yyIJ7lNdsVMBJN17rv3dw7M/hhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Me1jYUJW; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Me1jYUJW"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3159167a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791532529; x=1792137329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PldMFnVlgQbE+SWzFQzANLNCaFlxPpZ8LNtou8BYP7c=;
        b=Me1jYUJW6+ID5ofxJIM5YIck4f2Zbbg7cSY3k1EM0ciI2GRwE+lmbilw908W8OGl/d
         uRN5N6nSWIx+kqw7StKhifDa2RqwJrv59gRct+Ligu+l5WoY+W9woxmYqVLxt6w1Nz71
         TiZwhUIfG3AYjO22qo/R/AzQXnuKwAfTxfrMddC11Kv08GZoaiJ9wOojCJnWgExZ4C8O
         rinGuj4WzdI2Rg0vjenWp5f5rLstSMXkoA+vcNr6ye7MJfnrxFBydO2qnsYh5DXwl0en
         OuTkVLOdk3G1Ls43+wXvTbc955bAlKFWv/m5X6jEVz3Mgv0d8Mt+ff3g9g2Z8lUkTFUR
         ossQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791532529; x=1792137329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PldMFnVlgQbE+SWzFQzANLNCaFlxPpZ8LNtou8BYP7c=;
        b=WJ5qN9YZ0qlG2s1Ry7X18DAfgrqP6WJqvaYgjn7a7+DzyWgL2nRhtN2YuvPS5K1PRc
         8FBOnOQKC8gMSL9um7CVsKVemTO8+oLvqjTQThUzufElShP7HX4b2dfV5rgBeF2g2s70
         /E9olk6v7vZmGhZ142iKs/XOGw2q2fvdlc3BwNR6S0tK9jr1HUt5ZN7ds53ts5yE9qaR
         HlW5PbiL/a6vPeHOSiDpBndaor5yIH/WKbdRIqtFQShoZA5CMdOygnzK3X1KfuJMUQe+
         F6GbtP2PKQjIBNoSBJCR1n2VzU7/wqA9ZQGjXl0fJ+b6donHDY5jG3zm7w/+SbSJC5y5
         HQ7w==
X-Forwarded-Encrypted: i=1; AKwUvBwqNKa63jkpGzJZG1zBxn2eayz9BQTwTaOM6afwTGWvOAp42sTif6F6Yqy0Q/300bmDwvh4rxKN+CNteik=@vger.kernel.org
X-Gm-Message-State: AFq9FYLl6ufU59kKY/pZwCnq2NgKtdPlS8uRg4+411UlqIPE9XuUmfgQ
	4oAVyynffQOQRIlW04TmIZYWO3mcBmBk9xbBLMQwkA0kdLNwdMO/AdEg4amjdA==
X-Gm-Gg: AYBFou1w8yx+N+jkN3eLlxaYIkexXnpjy47XzPKZAOcbFlHWhL2TXgOcWr/lgcmYez9
	19k8VUxro33pfNz/98m8VVlBPvQascsSV2fLatIm3LuxnJNJtGIROyLAAER9PJBQkroz4+OMMWy
	lXFI1ovOcVAzBsL0Gh0kb/XC7UjfJZ7Ktq7E/J0GcXDYNiN+cJiGGQZSvSkTyyrymvb9zbWxk85
	cDPjI+xu+MlJW0nNDQoRITPYf3xGb9HxAUVGg30Mk9GdqmhLvTDAEe05k7yXFmdJQ//jy89lMHi
	8ns/zQhKP7lrp6sHAs4MB5zOas3JiIuSyqAKIakNad/XWQKKaM/lNVz6HeDSyEhRArw1b6e6vzv
	QuvuZoSCqpr9zKeSqLXR9VhxmkxmVIg1T/tz+b1abNo/hCHHOGNizTb+msNSTUR1aNzKOv3JeS5
	D4LhmI7riWxyMUNiCIgK5lL97/WcW/qn61IIbi3Bwob0JvKkuesJQsfSHic4SteLueh4ra0WXMk
	slK8NgfpCyF
X-Received: by 2002:a17:90b:4b85:b0:3a0:f4ee:d2a6 with SMTP id 98e67ed59e1d1-3ab3ac54b32mr1040897a91.19.1791532529056;
        Fri, 09 Oct 2026 00:55:29 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38dd5864sm2246769a91.8.2026.10.09.00.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:55:28 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] ntfs: widen the sub-block offsets in ntfs_decompress()
Date: Fri,  9 Oct 2026 15:55:23 +0800
Message-ID: <20261009075523.3135206-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_decompress() tracks where the current sub-block starts and ends
inside the destination page with two u16s:

	u16 do_sb_start;
	u16 do_sb_end;
	...
	do_sb_start = *dest_ofs;
	do_sb_end = do_sb_start + NTFS_SB_SIZE;

*dest_ofs is an int page offset masked with ~PAGE_MASK, and
NTFS_SB_SIZE is 0x1000, so do_sb_end needs PAGE_SIZE + 0xfff of range.
That exceeds u16 once PAGE_SIZE reaches 0x10000: the last sub-block of a
page starts at 0xf000 and do_sb_end wraps from 0x10000 to 0.

The zero-fill that pads a short sub-block then computes a negative
length:

	if (dp_addr < dp_sb_end) {
		int nr_bytes = do_sb_end - *dest_ofs;

		memset(dp_addr, 0, nr_bytes);

A sub-block made only of symbol tokens reaches this without consulting
do_sb_end on the way, because that path just does

	*dp_addr++ = *cb++;
	++*dest_ofs;

and is bounded by dp_addr against dp_sb_end.  With do_sb_start at 0xf000
and eight literal bytes emitted, nr_bytes is -61448 and the memset()
runs for 18446744073709490168 bytes.

Getting there is cheap: fifteen sub-blocks of eleven bytes each advance
*dest_ofs to 0xf000, since the same zero-fill pads each of them out to
0x1000 while do_sb_end is still exact, and the sixteenth one triggers
the wrap.  A compression block is 0x10000 bytes with 4 KiB clusters and
the fixed compression unit of 4, so all sixteen fit with room to spare.

Phrase tokens are bounded against do_sb_end and so return -EOVERFLOW
instead, and the

	if (*dest_index == dest_max_index && do_sb_end > dest_max_ofs)

check at the top of the sub-block stops firing for the same reason.

Use int for both, matching *dest_ofs and dest_max_ofs.  The narrow type
came in with the original import and survived the removal and revert of
the driver.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Fixes: 1e9ea7e04472 ("Revert "fs: Remove NTFS classic"")
---
 fs/ntfs/compress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
index 075b57fc1de61..82c7c7d290737 100644
--- a/fs/ntfs/compress.c
+++ b/fs/ntfs/compress.c
@@ -182,8 +182,8 @@ static int ntfs_decompress(struct page *dest_pages[], int completed_pages[],
 	u8 *dp_addr;		/* Current pointer into dp. */
 	u8 *dp_sb_start;	/* Start of current sub-block in dp. */
 	u8 *dp_sb_end;		/* End of current sb in dp (dp_sb_start + NTFS_SB_SIZE). */
-	u16 do_sb_start;	/* @dest_ofs when starting this sub-block. */
-	u16 do_sb_end;		/* @dest_ofs of end of this sb (do_sb_start + NTFS_SB_SIZE). */
+	int do_sb_start;	/* @dest_ofs when starting this sub-block. */
+	int do_sb_end;		/* @dest_ofs of end of this sb (do_sb_start + NTFS_SB_SIZE). */
 
 	/* Variables for tag and token parsing. */
 	u8 tag;			/* Current tag. */

base-commit: 6c377d19d4a5116d9bec5203aa3c6c11523e7898
-- 
2.43.0

