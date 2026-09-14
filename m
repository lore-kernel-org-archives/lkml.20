Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F6A331EBC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789357792; cv=none; b=QpO0vdhExIptlzkr7a7EUHDk1/SzS+z9Dh69WREynHkqye+BrSaqVZ0QUTLB29W0845nwoHRUZw1YYy1p+gxB+1KAy2CmW7KEX8pnPQQRxIiVTFMoBsZCeRrR//5pZdHBe2kwlyl0Q98iToy4CA0Q4p4ldhSfSrT9Uf5c28WtYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789357792; c=relaxed/simple;
	bh=q9WE6+wjyeX7fXhtEn7zhcbfhcZOIuWB1HXG6rwgnXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGnFVlaAJYKmzYq6Skp121hoUNa4D9S6WauviWOo3d//VPpKwHwyVn2PeW0UZhsexile+/gSmXXUVERCU0JsUqWLDdvC3awBbLJBrPzQZjzLxLVdbRMPYlhl9fwOkJASoiLotSZxDpJCQ4WOaJV3hIXPL+ZCWyiPiaW1b4XZX24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlcIzXp7; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlcIzXp7"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2db710396ffso31638805ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789357789; x=1789962589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kio+heX6pPEISSE575Nmco9JmkqcOqgMUE8R7TgDTQA=;
        b=YlcIzXp75ndJdloetlLD5acX73t3Ehq4BiDeYDgIZA/vwbHJ8Gqt01PMCKWfnuRsf4
         9XeqkilF9Xq8NOjs7qWgUHtS0F+N70C8vpfxhZ0BjFlJUcW3QGLvwAfNYZ+Pm1/sZQ3b
         LUeW8wFkT96brcD6iqxGpIEhuQvTjhFx9U6OJ/aHH/ELgqyQfF/VGmmPLBbcLlvK1wIs
         SZ4UR5f6TBd63LViiBeMVIQRQdKyjAS4+ThKIL4qsG+OXJ7kzOzUQzbNzX0a+gu/DwYv
         tgs7FLTPpD1Pz+YmJxJdJIFBMop0nrMoMUxDIHOjUUypLw/HB0DtzQRXTdvGdKaOMZYQ
         9otg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789357789; x=1789962589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kio+heX6pPEISSE575Nmco9JmkqcOqgMUE8R7TgDTQA=;
        b=lWPxA5u0EqJGxU+kRj/8loDNT7RPdaK3dwXenaFyhz31H2hBF7xJEiYvsSVR0TZEok
         bWbUBbaRIN2wSRiMBPXn00/ES38UYOD9umwjlJgQNiWhl282Yc7RzCXYy6zbYbkEdwCL
         w+HahvKxHPEWCLdFCn4mFLpojEVfyAdiHnuU1sT+oqFhX3wZt6Wm5zHYRnOnUj1+0k6d
         F7gpXQ3GoILOWWP+W3SHRVE39WhrfLsuokv3FdZfI8mrPaI6ftMMbmIrc1y3DQPd+kK1
         +KMaZZRGlbM5293/LThfQQab1MBWXuViHko1sdkzqMREfMEg7+NGIvxJEWh2DHqQ3YrH
         Cixw==
X-Gm-Message-State: AFuF++laLDRHxAPfFI32umvI37eqqaKYAnlzFb/WXIrXD/1KIut7nuxo
	raBwASehdtcEP+VtMpoQRPM06MWpeSzrDOksiCi9V2YP9i5JRH7u54IrRcZkq5Rw
X-Gm-Gg: AYBFou3Agc6rA93J24Qv5fD+TT+gLZBOXVTWOG+v1dhvOwqJzNLumh5iamlcjSkCXh1
	Ut1flv9f3Rp01XbII7mVMJLoKOQhb+e52NU3UKy5nfSg5KFOH3N+ZS+sBoAf/vLRFLFqv/yWwn3
	0UiHeZuwcRVLIhknLlvwoZW0p8uS/mC4qbDp/PXVguZRtDI3CHfyKJKHN/giCsUysu1WZdF3qCp
	Ci3D0qDNL4v80EjPMGWlfldlYC6pGUQJGDSetQy3rbIXQ52UKESSrghXmCpjPT3MYUhTeysVdnr
	bvaPtpEx+iuJNafvefM1t98viaNmCtUdeqFP/NyEbQd8Aey9AzbP9dapTNT2OIM4gJMZnrHSQ1m
	KYD87rnZ+DEW5yfYY2niOqZfXVE84HmNlqyEDJGIX+dRhNBuc6txyoRqS885XXnrLSFGUTx4Yr4
	JcsOJR7aMt0Qzbfcu/b9HgAUKt2Om88umhf3IyHokMS3SLatrJCdmDklVnL/PyDtJZ9HHTD5q+L
	xMUFpUjUg==
X-Received: by 2002:a17:903:b8e:b0:2d6:ee34:c043 with SMTP id d9443c01a7336-2dd5f16afcemr63293405ad.11.1789357788987;
        Sun, 13 Sep 2026 20:49:48 -0700 (PDT)
Received: from ustb520lab-MS-7E07.. ([115.25.44.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfce707sm41361815ad.55.2026.09.13.20.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:49:48 -0700 (PDT)
From: Jiaming Zhang <r772577952@gmail.com>
To: jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	ocfs2-devel@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com,
	r772577952@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] ocfs2: fix chunk number of the first chunk in a local quota file
Date: Mon, 14 Sep 2026 11:49:40 +0800
Message-ID: <20260914034940.4070970-1-r772577952@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANypQFZ05tpth0Xc33gmP6jgPnkY4VuezyHcsajV-SqCsmN_gg@mail.gmail.com>
References: <CANypQFZ05tpth0Xc33gmP6jgPnkY4VuezyHcsajV-SqCsmN_gg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local quota file in OCFS2 is divided into chunks, and each chunk
begins with a header block holding a bitmap of the quota entries that
chunk has handed out.  Chunks are numbered from zero, and that number is
used to convert the file offset of an entry back into a bit position in
the bitmap. ocfs2_local_quota_add_chunk() appends a new chunk to the
in-memory list and numbers it one past the chunk that was last:

	list_add_tail(&chunk->qc_chunk, &oinfo->dqi_chunk);
	chunk->qc_num = list_entry(chunk->qc_chunk.prev,
				   struct ocfs2_quota_chunk,
				   qc_chunk)->qc_num + 1;

The predecessor is looked up after the new chunk is added to the list,
so if the list was empty, the prev pointer is the list head itself.  The
head is the dqi_chunk member of struct ocfs2_mem_dqinfo and is not a
chunk, so reading qc_num through it lands 16 bytes past the start of the
head, on the dqi_gqinode pointer that follows it.  The first chunk of
the file is then numbered with the lower half of a kernel pointer
instead of 0.

The list is empty when the local quota file header claims the file has
no chunks.  ocfs2_local_read_info() takes dqi_chunks from that header
without validating it, so an image with dqi_chunks == 0 takes this path
when the first quota entry is allocated.

ocfs2_create_local_dquot() turns the bad number into a file offset with
ol_dqblk_off(), which shifts a 32-bit block number left by the block
size bits, so the top bits of such a large block number are lost.
ocfs2_local_release_dquot() turns the offset back into a bit index with
ol_dqblk_chunk_off(), using the full chunk number, so the lost bits push
that index far outside the bitmap, and clearing it corrupts unrelated
memory.

Compute the chunk number before putting the chunk on the list, and use 0
when the list is empty.

Fixes: 9e33d69f553a ("ocfs2: Implementation of local and global quota file handling")
Closes: https://lore.kernel.org/lkml/CANypQFZ05tpth0Xc33gmP6jgPnkY4VuezyHcsajV-SqCsmN_gg@mail.gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: Claude Code:claude-opus-5
Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
---
 fs/ocfs2/quota_local.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/ocfs2/quota_local.c b/fs/ocfs2/quota_local.c
index f55810c59b1b..d351cda9211f 100644
--- a/fs/ocfs2/quota_local.c
+++ b/fs/ocfs2/quota_local.c
@@ -1071,10 +1071,13 @@ static struct ocfs2_quota_chunk *ocfs2_local_quota_add_chunk(
 		goto out;
 	}
 
+	if (list_empty(&oinfo->dqi_chunk))
+		chunk->qc_num = 0;
+	else
+		chunk->qc_num = list_entry(oinfo->dqi_chunk.prev,
+					   struct ocfs2_quota_chunk,
+					   qc_chunk)->qc_num + 1;
 	list_add_tail(&chunk->qc_chunk, &oinfo->dqi_chunk);
-	chunk->qc_num = list_entry(chunk->qc_chunk.prev,
-				   struct ocfs2_quota_chunk,
-				   qc_chunk)->qc_num + 1;
 	chunk->qc_headerbh = bh;
 	*offset = 0;
 	return chunk;
-- 
2.43.0

