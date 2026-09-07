Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE46A4949E0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781321; cv=none; b=avDfhC6zHgheLMGr4VPKEKKp9I0N+frbUpJ0dcZFyhRmHw1G1Zdh88x9R5wWj5S+uKZjlX/kvrnK4SMC1m2xgDSqG+8X0hj9ySPhkkvd0a/yR8g5SwWXafqI91AvP5rtEEdcE5xI50Kjg9PeiLHLTG8V8AE7IQv84zScsUhS/ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781321; c=relaxed/simple;
	bh=GRnzLxhwx+KMA8dQXbJF1nYICvespjRZ9B/xjnv89cA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SnL4oCCD1jye4bySt5/XWoSSQg/aTgmJuShgI1syrNwrgq6HlN4bihUMLopZAYfVDYEmZJYGDHVEOQsu6bdBick42M/fR9EMIsS+4dFbtE8GI9Kk8zFrvYJINjE9//Q9x6JlhS7ImYkQ/XE5lUrctwaPTlbwKxBb0OiQs32sc/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvJtqzZe; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvJtqzZe"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7f4ea388ba6so3310729a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788781319; x=1789386119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bFUDeuM7NKoY997rtTdkncg5XyTEw+2EJnhFunl+bHE=;
        b=CvJtqzZegIZcJAHGOsM4s44VSuu7n2PyC26YueBtmNLo5LPJ8aP02IHCWWszcR5rBf
         ZAtIekPmhrybrTyCAMZYDRCu2WGnGIWjpsKOjBKTDhatAvNWatzuHUJcBWy48ifkQODL
         Owjl9VHqOApQZF0Q+MvLNmj0hWyveQY0CMwcwXKb8D3u7SYQgQPrqBXIX6BMjffpFy9N
         ZzX7t3zFCZBJRUA60SZmUy4NTlZNbJJ7T+hIMgKsv3bIec1Qt9SxjbVm75GQyr//+LII
         JoVM+G47PuhZiukNWNddhf8Y4cWxQcnZgktPe8v/0aa7orsQRPnG/xsM8YE75JOZX3WK
         lzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781319; x=1789386119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bFUDeuM7NKoY997rtTdkncg5XyTEw+2EJnhFunl+bHE=;
        b=SLs1mliIA2M8PnjTxpfMcY5uVYG/8Tsw+dKu71KOyIAM/i/BfW8vUcu0B2iMOE945T
         HXmcHV79lLC7m62zb+NDQLqhVGkWQsI+8/0QasIrL03tX5YO1HuQKxSktS3THM07u0ZI
         bj+X+wzG1ZormiF6E/n/KmqYKn6pp5Gip7wAmBC5sDw5Gp+H/GXG/FyXSReJsvpX7Dlk
         OH9hZKG22iaLbrzjcj8Sk07+DSRbGW/4vNl1mIq+PmVvsVY3zfnEStam5xHl/OwjfChP
         EY8PLYt5h3N2LVZ8LxutwUOt1UAyj6k2jYnEu3H4p5V/tiX/owj+Msivs4qyv5FXIMyK
         3lrg==
X-Forwarded-Encrypted: i=1; AKwUvBz9A+L4dOsnEpUdw/091ZVzntIlSFmcey61Mymp3H4fg52YZD1Fa2qikUtVe6V+ATp0hY/zq1s8UUJmEyE=@vger.kernel.org
X-Gm-Message-State: AFuF++lb0lvgFL5OtfO7skmxoWNX4/zI8V7aCtl+zOnk8ku1b3R/ahi9
	+n0uDsl5Nl5IsNJEWvYhZWPwYGqlyW466Bq/oxyNlmUAqzwiFV4TQ00D
X-Gm-Gg: AYBFou3vaTcT0Il8VTTobv55aP90uSV0z68U7L9bIFinWampH0xPRetk5JgZYcRaozN
	7ogFpXPIv1j86Dkd8Rpo2rFpv6RKPvTdZlNcCx14Eza8vfgBw3tAaSYxx4vG01Udh89bb9SFAFA
	SEYuauRxLFpQ2LY/KXOyGRmx4FBd8rUbqruhKughM3Vvhf3B2q26rIo5umZClCDsoz/tsDF9RbH
	lFBcT0otoDeALyPkKRrD6eecol82yJxVb+Y7hyYcQ62pZhOuhQvAM58FycFfEMhdy96Y5cUpIZl
	yRtiTLkBjTbGVwM4muI6TW7Zmf0tgOit8DP+7A88h17xYUjUxmWXiaVmJR3wqFmUxVwsnvSlqJK
	ZJrQRr1XX4LFvKeUXbUhwVnMtCyMnjerCnkG8vtnhWVEOsTOCVq/nn99ONVpuhFG2Fh2uqgtXki
	HBU4az4C642XqQrn9VTFE3KRuMBJksqfVpNg7ko8EF6jzOPmI1L0CcLVrH4x72xtqNarF4Eao7f
	ISsNEfIuIaVKiUtqxSmu30k
X-Received: by 2002:a05:6820:f034:b0:6b7:46fa:16a0 with SMTP id 006d021491bc7-6b746fa1a27mr12159798eaf.53.1788781318569;
        Mon, 07 Sep 2026 04:41:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm23897074c88.3.2026.09.07.04.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:41:58 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: Daniel Vacek <neelx@suse.com>,
	Chris Mason <mason@kernel.org>,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] btrfs: reflow comments left awkward by the typo fixes
Date: Mon,  7 Sep 2026 17:11:53 +0530
Message-ID: <20260907114153.39900-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing the repeated words in rbio_orig_end_io() and
rmw_assemble_write_bios() left two comments reading oddly: one now starts
its second sentence in lower case and wraps early, and the other fits on a
single line.  Reflow both, as Daniel Vacek pointed out.

Comments only, no functional changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/btrfs/raid56.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/btrfs/raid56.c b/fs/btrfs/raid56.c
index 4f702dbf581b..47d6a313cbdf 100644
--- a/fs/btrfs/raid56.c
+++ b/fs/btrfs/raid56.c
@@ -953,8 +953,8 @@ static void rbio_orig_end_io(struct btrfs_raid_bio *rbio, blk_status_t status)
 
 	/*
 	 * Clear the data bitmap, as the rbio may be cached for later usage.
-	 * do this before unlock_stripe() so there will be no new bio
-	 * for this bio.
+	 * Do this before unlock_stripe() so there will be no new bio for this
+	 * bio.
 	 */
 	bitmap_clear(&rbio->dbitmap, 0, rbio->stripe_nsectors);
 
@@ -1450,10 +1450,7 @@ static int rmw_assemble_write_bios(struct btrfs_raid_bio *rbio,
 	/* We should have at least one data sector. */
 	ASSERT(bitmap_weight(&rbio->dbitmap, rbio->stripe_nsectors));
 
-	/*
-	 * Reset errors, as we may have errors inherited from degraded
-	 * write.
-	 */
+	/* Reset errors, as we may have errors inherited from degraded write. */
 	bitmap_clear(rbio->error_bitmap, 0, rbio->nr_sectors);
 
 	/*
-- 
2.48.1

