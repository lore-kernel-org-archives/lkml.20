Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37093EE1FD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147075; cv=none; b=enyNsSOIOGqmJRsPF705r4ULdwpwBTkwx4b+p5RSHG4Dilaw3SSBLnm4lbRh0XV/Jmej+51EyjYgUX8+dmvgnEp9k2X70ozPABFSKdISyhjtM+Mxa/cghMRq3f4ZXJHhFE4Fgoiu182eo372kBD4EDIYSrxUnEtbS5PRQjZBd1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147075; c=relaxed/simple;
	bh=UsTtGHRl7YsiXbTcd8vpkD3E/t43DTNiHhxmC8Bxs4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rghjxfBSfjpCZyNzf4AEXzJa+4XfnZgaLYN96tXQWyIiWUK8ZrwG/z3np8im/HOI9hRr+TcjqIW5cSZkDQ0E069bixZdnO6NWFr5wWk/gZwQtrnfr+8Ip2l0WKPjmUrMatgRtH9K1pOqzXFAVw84jFkSNe9+Y9JppQw5FsxlYgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VL/qQZUF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VL/qQZUF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49e73611928so5422475e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792147069; x=1792751869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=J1cLBp+fIudU+J+n4s6nKX2nnwxELgfGqb7A1F2ozo8=;
        b=VL/qQZUFx/6hBK9uogVlXcQTd8l3L3ifl4rM1ahUEW1y+jbpH0zrK58xdiv7ic0Vhl
         7D4uhuA5kb/HEJXf5fhveD+HglfJcDISodvzvSkRg3nJ/bVValOFKelrB94eoSFF/ZqE
         lpMcRkg3wuYK1jH1llvFBzP7mdf8dfUk7kcAPxxeTgikeTh0xTZLTDKXxY4+UuhQ0Nel
         7ak1M4dkBLfSsxeKuMFpalIUVQdynLx0QsoKKJiwUqk3s9a0Ob/z7kNSMa2Xh1zsmepQ
         peYgZwqZv1oZdN2nuaRWZ7wje1sLUVru1av83w2iOtwE5fUb4WrEQFaI272b3SHNOzjK
         NmFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147069; x=1792751869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J1cLBp+fIudU+J+n4s6nKX2nnwxELgfGqb7A1F2ozo8=;
        b=Fi/0quJMzYQ975LUP9Fk0dRK3o6j7dRJkRXoFi08lGrA7QWtQKrHCp5IT+zRVvEXmO
         yMhgKmMeN3KI61nxf4MzU2SI1lb8JfyFNsE+aH9CpuI6wL8qqn64XU8aSNZkUIsVMpU/
         YxqVIrGVNiEeKUkG9RqgfmqRbzHql1ckw5vPdeNam8Qe3fJ+Qc/uKBG+OGOjz5BQKipP
         Qg/n/aW+Tms9PPLzXb/HJAq0Dcbim6n7FIrnzYDtjbo0buI+iJKS31OUGCuSYiMdyp/z
         9GpmmJMYmAGtTS5UT6rsgc0nw0DMeFyLz4kUov1ZcQNvfSAxnAs3DNzSPGwEbeOgfQjH
         IIwA==
X-Forwarded-Encrypted: i=1; AKwUvBzyyeZZg4Uffn/UQwwjOwfJvTXoUpoyp0ZF+roI4fmmx2enDD2iRpokt/yO7HUulporgZlVLWRJaIsbLtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYK08BctBvbU4b/ZaVwarQ5+nEjEdJWDPEX9GyWbcEX9+I7tTdL2
	tdKGfNCTfmbkSd06PfdQgZzoW/VkkVAJJxgB7U2lBlBWEHhlQS299dmx
X-Gm-Gg: AYBFou2FprOuCOpLh1AJadQeWs+e0G8P0CjVm/ksuYkEmsrozhubfeWBNgadJRhF01O
	617mwrn2ge9HdRbEo1995uzfuAVpys9UHsxRb8PUmPjfPmaUUDRmq52LusNsudPrSjpvUMvOSm/
	ZFrwnFhpMpcALc6W5pavLkl1XKhyoT+a2mWjTysByfw2gX2gSZdbjOs+sIVGAfSiDVNFm1S/ZnI
	v8LnHSi/NDFHGoR0qpa0It7GeRq4dLhFG6gR6lsoIBcBeAV+mjfNMzEbGDnyRzWHakN6gzrUFGb
	2D91QHE6RL8PMfxDUtr6iGaT6/6dadWyBZ3/WikF6zP0KNztmN1KxCyqI23wBKCErjn9xDv4ULU
	hlCfBLYU+1RNsYkF/mZ+sCJRRt4cR1YlFuacpSxfYyPl+eGMk3JM3qjWnB+9p2UpiVU/hrdwWr8
	Zp/mhKfJvFqRu+4++V/6YE7WZHmfZ++A4+PPtGXnSffxhB0mkSkJWo5qxgeQMD06svJk2HjIT0H
	abIKtHbXe25o/dPkSU8W7+HE3C897il29Ref0qTvGGZg1KNTsGDUD6OHffQUdPtxQWUzdW2s0SC
	6PDEm8a4vWg40tSpACO/hNh3sTRzht9jI9Q7rDZFzGjFJX9AnuO7772SR0muCzgKlm+wf2LrZ/D
	zmQ==
X-Received: by 2002:a05:600d:82f3:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a1c65b9d1cmr74177055e9.0.1792147068524;
        Fri, 16 Oct 2026 03:37:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9c001dsm136875975e9.12.2026.10.16.03.37.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 03:37:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jan Kara <jack@suse.cz>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ext4: return an error when a journal block is not mapped
Date: Fri, 16 Oct 2026 12:37:26 +0200
Message-Id: <20261016103726.98553-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the internal journal inode contains a hole, ext4_map_blocks() returns
0. ext4_journal_bmap() logs "journal bmap failed" and aborts the
journal, but also returns 0 and leaves *block unchanged.

jbd2_journal_bmap() takes that as success and uses the unchanged logical
journal block number as a physical filesystem block number. Journal I/O
can then overwrite filesystem blocks outside the journal despite the
abort.

Return -EFSCORRUPTED for a hole, matching the error passed to
jbd2_journal_abort(). Keep propagating negative mapping errors.

Fixes: 62913ae96de7 ("ext4, jbd2: add an optimized bmap for the journal inode")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Zhang Yi <yi.zhang@huawei.com>
---
Changes in v2:
- Assign -EFSCORRUPTED to ret before aborting and returning (Markus, Jan).
- Add Reviewed-by tags from Jan Kara and Zhang Yi.
- Rebase onto v7.3-rc7.

v1: https://lore.kernel.org/r/20261004180629.27213-1-kmehltretter@gmail.com/

Found with an experimental clang that warns when a function returns 0
right after reporting a failure.

Recorded QEMU A/B testing used x86_64 kernels and a 1 KiB-block image
with a hole in the journal inode starting at logical block 40. The
unpatched kernel overwrote filesystem block 40, a reserved GDT block.
With the patch, none of the marker blocks changed. There were three
runs per kernel.

Both kernels logged the mapping failure and journal abort:

  EXT4-fs (vda): journal bmap failed: block 40 ret 0
  Aborting journal on device vda-8.

 fs/ext4/super.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index d636b89090a2..1e959f196ffe 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5967,7 +5967,9 @@ static int ext4_journal_bmap(journal_t *journal, sector_t *block)
 		ext4_msg(journal->j_inode->i_sb, KERN_CRIT,
 			 "journal bmap failed: block %llu ret %d\n",
 			 *block, ret);
-		jbd2_journal_abort(journal, ret ? ret : -EFSCORRUPTED);
+		if (!ret)
+			ret = -EFSCORRUPTED;
+		jbd2_journal_abort(journal, ret);
 		return ret;
 	}
 	*block = map.m_pblk;

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.39.5 (Apple Git-154)
