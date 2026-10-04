Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD7F4766BF
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 18:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791137207; cv=none; b=idaGx9IfrJPqWfEQhcRsKe2yjPLz57y/ijT1WSEFNrGZ8AtB1H4Q8cxpaTMyK7F3CeeqoHVJNDYv8l34ol2myhCzLyUS8pyN8wl/YFfyJrrs5eHDVvemrqC99dXjHQkxgxhiWWZ0oK4hnydjxTf2eX+U6PGvTzszzGrJTO/tSIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791137207; c=relaxed/simple;
	bh=J+rAe8YaV0xE6ynsuCf8y2AgnV7iwVIBFQVqkbHSmcU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aq028hhTd60wiPg8VjGV8ZGq4bqLfat46BWQYPbClLOL+8eBsjGodAGTgbER2TToYKWTfTAKZcfwC6Pi31fNPwMYNd8BXDPqirVTe3j2AJ6I4LhIsf7b/cNJjGCdZiTZ2Rn1Efv6m8uxR0li/26KITuSgfDgyKhbqvhDsMVXQHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iTn1sU2F; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iTn1sU2F"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so451470f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 11:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791137202; x=1791742002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeVyw0XFTEgDWZ2YAol6WHysCU6w9ObR3PQ8hHYNkL4=;
        b=iTn1sU2FG+AeaKQFCaZnQXTA7ahgpiGRlNcJY07y5WXJ7ONHksiIW/72dLZEKa19CQ
         63hQak5WvwLTQRoMTEKUBL1Pa8Yjdqn5hTVxiKLHwPxQHxQmuPhgSwbEnlGBN0omRthe
         frbwhqryNgDRRnaZm4sXC8k7kOD0yV9yxq8eTEjK2ji5P5gdJ4FcIm6cKjNzNXCHaAUx
         0EduLgP1xsnYLE3DxCHJII7Z7BlRvx14QAHs/Ol+VBar6DgI50BcvOJi80bjLwbN+q1J
         Ygj8TEH7JarECTpniXAmHTahNp65N3JBn1u9GIcNx2lmO8jIO7erRPyA75PpUyCom1jC
         EDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791137202; x=1791742002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeVyw0XFTEgDWZ2YAol6WHysCU6w9ObR3PQ8hHYNkL4=;
        b=Q2N26KD+6HanJYOq7L9UvhYNDnGwlOh1uZX9A+2YezGQ0mgNmcqHER3Dnd8Igt2mcO
         XA/FFdAUwwZJSVyAxPupD2xI9uGOw8kjUhpBSM6WE74BLIMfKwquy68hO4nw8S0mKD9+
         SRtzn0jKmKiwClnwf+RBfV1gwhV6g/glpm0M8q79W0714u61HifmBMXFGPzZ4NdwCfHq
         qbYZ8QAru0HjqZlIyYPYVL27q8QSI2JV0Ole437a9ouB/uoW5e1TRxQD/u7hxtgawqkh
         isNSIKenzIFZiDsipZ1QlVbGuOGmLx0uWXutqe9T2Gmp7mRju7p2ZQQS/p0KT0PamTdO
         VwjQ==
X-Forwarded-Encrypted: i=1; AKwUvByZw/52eFOrAq90Mn9dRcbELVJTg1CaNbfziGhaxss0dsY8IsBhMfvOhQPgiWXd9xal9IewK5m3ZsOA0UE=@vger.kernel.org
X-Gm-Message-State: AFuF++kx6zvf+MRlfksUOTyqLa6hx6Ywq/bJuXyfJJHTSvOSaYBbTFVp
	4p98oN5sVDQEtc/lYr9thMyxaajm8E9mI0yDJGzPPjFmReCwS4fRcJoK
X-Gm-Gg: AYBFou2JM9x77jnyPG3U5iOhAXp5huQxEVD8CDviMTCGSa3sWjGIjpsuLuS71qfYMYN
	AIkPyyhDnBLlQfvF8uOD6ThAVHxE93VFs8uy/o7I5sMNZvE07UiuXOy96lO+4JZRZFk5vn+yN/X
	+/4LMGpLtLC1KCvTZK7wLpy8bQHvSlknBxk3jqSGOZulT/5VCW3JyckqLmmkADeOpBvfB+Gwe0r
	GvjJfU+JtdT5YG7+sZ+bfYJMT95jxlSx2/PCF65Lv/rXBc0SFNHt2EGZ7sOjslnsBT3AMkQO0A0
	hK/6LHHzijP6PjzPDan1ZyzHQDh8XN3hTVNk1AgcEsWp5slKYThr8KYEoi2A4JEngkvZjvRN2y2
	gBcGfcpqK3uSxdnY0/6ofHwuq0elLnlXRk83JMNKTJrZFmBvsptO7L0rM6Xa1RDTKq/OU4z0NHs
	Wx5GCmr3JDVuq7eJbfdrEMpe8Cz5mYenCHso5pdq0NEWUXumdcoTcWKJG4fVKEHT8hOUhq1mVaW
	yVqyPChy47Bi4eFrAp28NwKKEkDCRE0MueySnIw0LOA3ORCGYaISrhhccacdZ2DzGOX9OmtcqN5
	6l36TJi8U432bRzTuZFx/RUPmE/gD4XtTtIa5BMOq0RVemMdrB/hZDYLVfWKA3nt88dltX8iRas
	y4w==
X-Received: by 2002:a05:600c:8b6a:b0:4a0:2391:6529 with SMTP id 5b1f17b1804b1-4a02757f1e4mr134280115e9.29.1791137197310;
        Sun, 04 Oct 2026 11:06:37 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a190-7401-a90c-9d77-a1b8-e6a2.310.pool.telefonica.de. [2a02:3100:a190:7401:a90c:9d77:a1b8:e6a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02752aeb3sm283644635e9.0.2026.10.04.11.06.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 11:06:36 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Jan Kara <jack@suse.cz>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ext4: return an error when a journal block is not mapped
Date: Sun,  4 Oct 2026 20:06:29 +0200
Message-Id: <20261004180629.27213-1-kmehltretter@gmail.com>
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
---
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

 fs/ext4/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index bca0dc87d0b7..3e7dabe45153 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -5967,7 +5967,7 @@ static int ext4_journal_bmap(journal_t *journal, sector_t *block)
 			 "journal bmap failed: block %llu ret %d\n",
 			 *block, ret);
 		jbd2_journal_abort(journal, ret ? ret : -EFSCORRUPTED);
-		return ret;
+		return ret ? ret : -EFSCORRUPTED;
 	}
 	*block = map.m_pblk;
 	return 0;

base-commit: e767a4ea70a3992c37ed604157d32f0dfbf9b1e3
-- 
2.53.0
