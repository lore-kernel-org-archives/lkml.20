Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0F5357D1D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790052378; cv=none; b=hVmKnVzr7m14EuM28/IwA6QtaaFoBnuGTn3l4oifNb88pCnvsfSxwXur6oVUsVOBvO4WQeKPX9W4dZp6W7YSjsHhpfbmQa0IZDeBUMEdSxc88bGy344laUp4d+BNtAmOeRy4FJh5+DnYXx6tW5xXlD6PEtbVGoeP06PdjIgnvP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790052378; c=relaxed/simple;
	bh=LmqjBasxDWd9/DMzUXY/MJPkJcpcAJYfwEVP/qtHFmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BgqLKH4OEh2dxnRq/ax0ncQUUtf3n8fdNKR5e2zdt1Cziaj0VouC71pkEZseeWfx1X3tVWpFSNm7x8J56agU7j9QJWRVSw2/+ox1cQidiGK4sAxWBR96sm94fTJU/MDF4b6gR1UD+TTlFRY6189/zk9E17zID9JH4MHN+QEaFDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6TKSxS+; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6TKSxS+"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccda24afso2664212a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790052373; x=1790657173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3E+ocT2Bhu1iX7K4xkDhu5H7aG48frP1ov4mPcFNMD8=;
        b=p6TKSxS+3n5KXKvQNMuj1ceiHogZzRt+Ix9wwUuBtRE6VKdXLY1K07u6E3k8FtSd/p
         lfiSIe8ZE/Hvvc/rThv38IX4jMepEQwojMu5p1MG3d6dFrZ17/yNmGIVuLH4wVhEFjpr
         dr2Dn/JCKsBYl31lFQ8u5M2p8qb5++wn9pkynZs65WZ7I7TqeLHJ3FH7U6uY9pB0fORT
         GU0tPU8y3cbXzLEr8J9QuTiP+iw7CFObuGTBPPjGGvIlXU7plTGIsH6TBEvENXulG6ef
         s6RCyFO0+l386GOYfzh7dRpDIhjb2X7EOPXRKRC5yLSM50CG6cWj61ra7HXRKnuwZA/4
         XySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790052373; x=1790657173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3E+ocT2Bhu1iX7K4xkDhu5H7aG48frP1ov4mPcFNMD8=;
        b=nRm1qCfCW6ViaYz0+AynxPDf7tEFNKkBzxSj2dtZjSwONRL/fZeDH7DEhYeZisxff+
         88Fozc+8k8YUjUCgOv1uER+7H1Hxd7+DK+VyXpm2sH5ou9/RFG3311yD6TmCciyuhUFK
         UDPI30hE0nMHTp3DeX9GMwwjt1FWI/Dk7BLVcjAilx1c4EAMESlHICJtkxdhcuO0qR9q
         eBUaWd/CDtmsYRioYVR7piu5xiuFgqtJtS65KM2HNNChf/ZQxs1b7P7IhNhOBtc43Wlz
         oE5iqlVZjG1e9InHZq4qQZ7jfOcW0laDFoJULnnIYb0F2GkfvKmpG0a0uxm8fKwfXis/
         Ry+Q==
X-Forwarded-Encrypted: i=1; AKwUvByiqrrqkGLhrdel9Zbfx2uXE6JgGndbZ8B0ZiEAG5HmGJn/jhodrRVXwPaRc4XQDa/6uWn0jrjfj5CckKg=@vger.kernel.org
X-Gm-Message-State: AFuF++ktrQ/Uh3skn0hHyQJF2Cj5p461nMy523FyjcXHpSbsaMa0TiS5
	K5fwS7AbrDpuopYEIqHpzaHFxs7fI8l1MkpgiaVEu5kUuPCIwnmpQ7o7
X-Gm-Gg: AYBFou3rlTy8uojB4+v21O4cG+K+6baZNptYqTOe2sjjjZyIBQ8jLJguTWDcR1wMnV0
	54k4xPG0mnmxxgEnrKfkzgjSbsTyrpZgdZS/VxDjkC6ciX5I4X8Ukcy7oHOLz6BhPgCZmMKb59N
	1/lCXd0CfDDd/RbUKlRsULjK3nydZe8K9IgFlyKfRL4qfqtuTrofE2yZ3T8zmmbVHu0kcjZBmIF
	fAbSfb8YUEOcurkVocxKjyAFBRB+FkSjxpH5sZlnI3MmvbuH3YnM2U6fmF2cWXc4dF/LF729Kri
	Aq34lKCCQ3mdB6N3cFcM+wuJOAqhn/fAsZoMTtt+tivbq04wNpFY6KE1iJJoe67o3WvNDENtIAY
	otEBEy+CvAQdTj68csBjyClOA4PSWz/ZBMvzKJldRl1E0nusqxsKIoPNQZRTOA0T5zuQr2IP0Ru
	nfhW07FT8bQUON2Bfph0FXJodM++LkYnvQXtp85g4iBkTjg4w8shNLZR6A/3Wdm4DgPYFKitly2
	VM0phGE5TCg1wZIOtljgawlI/uC0aTzUuEWULo=
X-Received: by 2002:a17:90b:55d0:b0:39e:6a81:c921 with SMTP id 98e67ed59e1d1-39e6a81c9bbmr14597347a91.20.1790052373331;
        Mon, 21 Sep 2026 21:46:13 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:3443:b4ea:307f:cc4a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06e570d9esm937101a91.10.2026.09.21.21.46.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 21:46:13 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Yu Kuai <yukuai@fygo.io>,
	Song Liu <song@kernel.org>
Cc: Xiao Ni <xni@redhat.com>,
	NeilBrown <neilb@suse.de>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH v2] md: validate bblog_size when loading v1.x badblocks metadata
Date: Tue, 22 Sep 2026 12:46:06 +0800
Message-ID: <20260922044606.30774-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <fad92649-e362-443a-93ea-205b11247e6d@fygo.io>
References: <fad92649-e362-443a-93ea-205b11247e6d@fygo.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In super_1_load(), when the on-disk feature_map does not have
MD_FEATURE_BAD_BLOCKS set but sb->bblog_offset is non-zero,
rdev->badblocks.shift is initialized to 0 without validating
sb->bblog_size.  The same field is validated in the
MD_FEATURE_BAD_BLOCKS branch ("sectors > (PAGE_SIZE / 512)"), but this
branch bypasses that check.

A forged on-disk superblock (malicious storage device or crafted
image) can therefore carry an oversized sb->bblog_size.  When bad
blocks are later recorded, super_1_sync() sets bb->size from
sb->bblog_size and md_write_metadata() issues a bio larger than the
single rdev->bb_page, reading beyond the page and leaking kernel
memory contents to disk.

sb->bblog_size is never modified by the kernel between load and sync,
and the MD_FEATURE_BAD_BLOCKS branch already validates it, so checking
it in this branch is sufficient to cover both paths.

Fix this by rejecting an oversized sb->bblog_size with -EINVAL,
matching the existing check in the MD_FEATURE_BAD_BLOCKS branch.

Fixes: 2699b67223ac ("md: load/store badblock list from v1.x metadata")
Cc: stable@vger.kernel.org
Signed-off-by: Yuchao Zhang <ndaugoing@gmail.com>
---
 drivers/md/md.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 680b34a63cb3..1caa92b40f9a 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -1934,8 +1934,11 @@ static int super_1_load(struct md_rdev *rdev, struct md_rdev *refdev, int minor_
 			if (!badblocks_set(&rdev->badblocks, sector, count, 1))
 				return -EINVAL;
 		}
-	} else if (sb->bblog_offset != 0)
+	} else if (sb->bblog_offset != 0) {
+		if (le16_to_cpu(sb->bblog_size) > (PAGE_SIZE / 512))
+			return -EINVAL;
 		rdev->badblocks.shift = 0;
+	}
 
 	if ((le32_to_cpu(sb->feature_map) &
 	    (MD_FEATURE_PPL | MD_FEATURE_MULTIPLE_PPLS))) {
-- 
2.53.0

