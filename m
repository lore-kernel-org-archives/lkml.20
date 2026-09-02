Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE27378D93
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335996; cv=none; b=kTkX+KGejdUYNDR/ajQGGzbpDcceEEL7k7ag8HmCofmruHHlx09jSiMQAWuQthYY2HiPXBpa18kut2wothG5EXlpe26tKLTxga9KnVQfuYpXRjuZtQTpHxok+AbeAiFiPsQKTMnuB166lBmwA39SLC1/QXKDCOfDoETv9wrJO6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335996; c=relaxed/simple;
	bh=yWFtaBEVrKAueRI2gNoPJn5Yh36X2MMWvNYy/ukBlh4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iXtTWt/jETvTsK1MWfGy4XkKAWcwqmHgG1OwYOkkkksCmshgSD4QVYcNRK3ksrUAZbrttIToGDSl460wEtt5YQQ2grrax4HOGP7BjIFdY1bD5IkB1YsiYg+54NCf5TZawYDlhPw+nVtVvukQN6S+B8HYjkd0F787Cvt63ccM8YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H1X7gcf+; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H1X7gcf+"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso583751a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788335994; x=1788940794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5YpQCAyGRMzg7W5xJsgx73Wgp3x7Yj1lZctIlmSQaA=;
        b=H1X7gcf+4RkMX6Xca24bXtTS7CB/kMIuJht+sp1zNDNaOlid9uNs1A2dEnDaryc2zA
         CBsK5DZtR8qUq0HYv7V67qxN0FTuU5BQUGrLMq7w26hcd4rGybWr8sMK/Dg/uhl3rjwS
         OEXkFCvuu5n/59upexfvuVpqruVdXLv/iDLJ2Idetnxl+sQ4dkGllDkwjutWCzw4oahc
         J1xhS/CU5Jatvhy8b1QwD9B0B48MZP7gKHTFZh3j0wYClGXAfQX8XYqxAJ3YGciPsshm
         KWMWzpK9BCqHDeGaho1J+BiGhDi4rPLZwMSPXJlaojJ3RUUDxmk3/xH+DlHmwI+tGhvZ
         v0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335994; x=1788940794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5YpQCAyGRMzg7W5xJsgx73Wgp3x7Yj1lZctIlmSQaA=;
        b=L9gwPDqPxWiM2dGV2uP2nSIJ4uq8+rEyqQctxnZUpxEi/DJ9GcL+Qql6dYlPP9yVLN
         xa3RN2PZFYuMA602MoeoPSzXt2xHGjl+Vb6+zf0T6ZM25qxAEtPVCK75v6+YnGPFh27G
         KBBl7ESQXlBozp8CLXzxNF4j+/vWDl5VUTp9V0nIPXHBasmcNAWdtqCd+yoH76q3byBU
         S3irkTexCyuW8tQTa3qRpM3Qla2WASfmsa2yyvdZmxbIJsnk950aNqTeo7bqoWdGcy4k
         nFPgRX1VzJAbsk/Q0+mkOEMdPz+E9odUTGysLFUNnoymcfCLcz0nqWFhmZju+4Uzr0+d
         x2Vg==
X-Forwarded-Encrypted: i=1; AKwUvBzFNd6a/ZvVPydWlYj7buEODe50ZDEayPCw2xe8kD5CBgojEbLH8/lzBSS/orGx11AVmWNW2ZblB2wZNTU=@vger.kernel.org
X-Gm-Message-State: AFuF++lPvP3i2RYSbU+vMnG+sgl80hKI47FmDWH/F7RTINoJ7sgxWTNJ
	FdtYzECYWBQ1uVeEx4Vp12sXKpA7e/9+aa5D8/B51GAYenb0e3tIAuKt
X-Gm-Gg: AYBFou1Vc9j2JV83fyvQY3lJZdaSXVJ7Htm8JDY16TyJjJu5aZ/lTRneHvVarrifYj/
	FuqRaG7Tm5YmmTsXak3u5TzfFvIppYoJK7A1Pa+lpGLeIY3Tw7jzXQRLP94b134Wv3geaL3PICB
	I0FYLnJPbU9qaf4lpo6m0EdiWtdB2jDgg2BG5OhUfgA0e7BmpiYJP5AxoBAWdLSFT1Lp6cwQKC9
	80mvUCUM+ZJCnqLVJ4QC8l/im3LpDSoDhvSRFLoj3S/1K9VvpTcc+tfW94ySmxTBBCmCZGxhBYb
	jwmJsFMAIUEvwIeiKEVcmRVd4sFVmAQfymWU271j990GNcacrNvwN880zzuX3uh6a7TW23kujiS
	qEVuUfOmdo406p3JMzzwTzUYjO6algZUWqPvWR1WgmRf9JtZLfjESSjov5mWOCY9I8ag+EqRRAv
	FYPVCj2uvW/qhyhnahMyN0VQe6MST/Yc8VI9dseI7XibWYD8rbRPkjaH9Zf/y5F04E92XH0/6Xc
	bA3QfHiUSXtFX0OYg==
X-Received: by 2002:a17:90b:2705:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39aee084cd1mr4681912a91.13.1788335994476;
        Wed, 02 Sep 2026 00:59:54 -0700 (PDT)
Received: from PC-2B0BA31200898.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae0f28b19sm4496659a91.6.2026.09.02.00.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:59:53 -0700 (PDT)
From: Meijing Zhao <zhaomeijing100@gmail.com>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Meijing Zhao <zhaomeijing@lixiang.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Wandun Chen <chenwandun@lixiang.com>
Subject: [PATCH v3] mm: memblock: show all region flags in debugfs
Date: Wed,  2 Sep 2026 15:59:44 +0800
Message-Id: <20260902075944.3742866-1-zhaomeijing100@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Meijing Zhao <zhaomeijing@lixiang.com>

Commit 493f349e38d0 ("memblock: Add flags and nid info in memblock
debugfs") made memblock_debug_show() stop after finding the first set
flag. A memblock region can carry multiple flags, so the remaining flags
are hidden from debugfs.

Walk all bits in the region flags and print every set flag separated by
"|". Keep walking beyond flagname[] so that a set flag without a known
name is reported as UNKNOWN rather than silently ignored.

Fixes: 493f349e38d0 ("memblock: Add flags and nid info in memblock debugfs")
Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
---
Changes in v3:
- Rebase onto v7.3-rc1 and send the former patch 2/3 as a standalone
  patch.
- Move flags and first into the reg->flags block.
- Remove the redundant flagname[j] NULL check.
- Keep the existing NONE output unchanged.
- Drop the debugfs synchronization change. As discussed during the v2
  review, proper locking for runtime memblock accesses needs a broader
  design and will be addressed separately.

v2: https://lore.kernel.org/linux-mm/20260821020910.3428585-1-zhaomeijing100@gmail.com/

 mm/memblock.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/mm/memblock.c b/mm/memblock.c
index 9ce86349a29f..021db49eb7fc 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -2908,14 +2908,18 @@ static int memblock_debug_show(struct seq_file *m, void *private)
 		else
 			seq_printf(m, "%4c ", 'x');
 		if (reg->flags) {
-			for (j = 0; j < count; j++) {
-				if (reg->flags & (1U << j)) {
-					seq_printf(m, "%s\n", flagname[j]);
-					break;
-				}
+			unsigned int flags = reg->flags;
+			bool first = true;
+
+			for (j = 0; flags; j++, flags >>= 1) {
+				if (!(flags & 1))
+					continue;
+				if (!first)
+					seq_putc(m, '|');
+				seq_puts(m, j < count ? flagname[j] : "UNKNOWN");
+				first = false;
 			}
-			if (j == count)
-				seq_printf(m, "%s\n", "UNKNOWN");
+			seq_putc(m, '\n');
 		} else {
 			seq_printf(m, "%s\n", "NONE");
 		}
-- 
2.25.1
