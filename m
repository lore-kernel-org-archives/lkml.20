Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CADC1799F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789919410; cv=none; b=D7EKa5dgkFJ+okhbP0djKUWrcjpNypKHkgjiPl5gzIsZ0hyRYCx2ZMDqZFw8LyESRUK9xQOJujIpHI8qtVwAL2ayfi1pHWW0OKJuALd8CRohWPVCTXxyTa85yGvZPyf4dkb3cbFFxq0u6AYrWGidnwemvjcviHT2qzRixzycLGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789919410; c=relaxed/simple;
	bh=NddEH6CG/Vlp1Hf1nKCC6Z8cYXqBrE1udOtF6IlGteo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TNs5gTINQwdwy+8hh8vhxWBcys94j9LBtZwet8q9C1sAzfkXjUAEQ6I06Ys0Yw1MJuQC4BlIt+vh5QHvEQjupsqC3Lzsm6FJ89c2lmV+trO2MTY8+phv4D3PDkw1ezBdkh0BmngArmqOxYUrIa3oJNX4BuoN87/7PrlxDykIR/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuikgBA6; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuikgBA6"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a4aso249446566b.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789919406; x=1790524206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DY5Gw4WLBwhdsQnGaRXBVUTHKUhqsOU+itnrh/w7afk=;
        b=IuikgBA6xsP9gG16Qt+jvL1LWmhZ0l3xmq+fZespK3oOSWI4s+kv3bF0QJki/2qmHR
         tINmtRfvjA1tSbu0WUN+SMPqUhdlya2pIFKwhwS1sXFb+lk+SC1HR/SHw6e/tBG1fA6b
         YsgolE8iJfQOUZnsmz3SZdLF3RsTiPzCgT+lKBZtHk35smYEAZSemXf2RjGRHgF9Fyp3
         ptfvoA87TizJYP08r1edqIBKy/xGFrqugntCROGAWD9q/aE02SMP6XD0TZ9i6Vfb82r7
         qtyyDdUS/6DjCo/HaY1iiRBl3SXR5DNBHWJdVrJZe9hul3gfCJXl41aAtrtnkctcsw0l
         eziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789919406; x=1790524206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DY5Gw4WLBwhdsQnGaRXBVUTHKUhqsOU+itnrh/w7afk=;
        b=vdtSccD8A8QZj++MyLUeU97kWGDDCsi4zHT5CkS4bWKuoFDdN4lRqwA+82ldw20x6V
         3F/R3uMvamYw0Hd2oraQBpa6gvm3gZCfO4VatwHHaQIt+QcgUi+aAMKJ07wQuGn8kbcQ
         EtPYrqwiuHCyCXws+bTIH6XXIjbiQCDGMikAs6r4ZS3B3hgzBlR9xYS2y9ZgqVEhQafy
         uIoG7emMgsU1c33hVaxRnCeK/Dvxclc1uwsP7L8IUrXLvYdlvj60da9ckGjdBt8H1NtH
         CI5dNmE5PxVoYf2JGy87MfVZqouAHkSjjJbSOpWTATiJG4MbtljlhuPgxz6kCLbq80NL
         YPTg==
X-Gm-Message-State: AFuF++lI+DILossoOH8tEMxA/BqEmhltj7EkR1G041lPebnX+ZqWgvzG
	uhffNQiKX/dgyfQ6Cg79FkrI/0+o34pgojRaJqRK+eCpI1Iu5whXozUE
X-Gm-Gg: AYBFou3/NH/W7YPDaQnTjrPcv4+jd8/DalnjI+0Rnl2GKcz7ZRQiNsOCmeFbNInkqPx
	5riAxxgC81e7nvOQEFvHTUbCUDOAFuvzNP89mDuHPgT7LyD6E2ALyrhK41s1CAtrZgoeH3PRAN+
	lRFvsEXK7KAlAxg2/2g17ho3UKQvCjj6mvYXOOrL86OecP5x3O+/8kQjvw2/ltXKkqn6Jf/0Csi
	JO+mTZBJFuJSPdStqn6MLJECGMlBadOk9q+1jm+6jZ8Di8GB7wrWOkMBTibzYM3Fc97LbDq7N4v
	eCuPflESOS6S5xpuxKcW09KW7jmXsBJq1SKE/Q1NJqdkIiIVLhy6OwVF1gAMhMKIAlMPhxbrxh0
	LaVwta98dbKudF1sFEYXJPLzWHUmBEA5cWyHsWBm7Rbp30jKE4iU+C/6WLFzxQd5vmIycViz3p7
	IDTvRhhIBP+tMh+iShoMBVGpJPZt6nDlqeIEu3PAHfu30Em5iaZ+a/hlgWhZQLIAPeXFknmzNqc
	AKMvKK6nAxXylo9YiXDMjOj575L1jIMjeA2F1uMeWFkO4TrofWtfVbBrmw=
X-Received: by 2002:a17:907:9301:b0:c26:2b63:a746 with SMTP id a640c23a62f3a-c2a15cea371mr659191966b.49.1789919406284;
        Sun, 20 Sep 2026 08:50:06 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3590afccsm195356666b.62.2026.09.20.08.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:50:04 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	kasong@tencent.com,
	bhe@redhat.com,
	chrisl@kernel.org,
	baohua@kernel.org,
	nphamcs@gmail.com,
	shikemeng@huaweicloud.com,
	hughd@google.com,
	baolin.wang@linux.alibaba.com,
	David Carlier <devnexen@gmail.com>,
	syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com
Subject: [PATCH] mm/shmem: don't release a swapin-error marker as a swap entry
Date: Sun, 20 Sep 2026 16:50:02 +0100
Message-ID: <20260920155002.1030454-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A failed shmem swapin frees the swap slot and leaves a PTE_MARKER_POISONED
entry in the page cache. On truncate or eviction shmem_free_swap() passes
that marker to swap_put_entries_direct(), which warns because it is not a
swap entry. There is nothing left to release either way.

Skip the release for non-swap entries, as every other caller already does.

Reported-by: syzbot+23b25ba3c6bf971f9c57@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=23b25ba3c6bf971f9c57
Fixes: ac2d3268284b ("mm/swapfile.c: remove the unneeded checking")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 mm/shmem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index b572c60f2af8..94f2c59c8cfc 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -1184,6 +1184,7 @@ static long shmem_free_swap(struct address_space *mapping,
 			    pgoff_t index, pgoff_t end, void *radswap)
 {
 	XA_STATE(xas, &mapping->i_pages, index);
+	const softleaf_t swp = radix_to_swp_entry(radswap);
 	unsigned int nr_pages = 0;
 	pgoff_t base;
 	void *entry;
@@ -1200,8 +1201,9 @@ static long shmem_free_swap(struct address_space *mapping,
 	}
 	xas_unlock_irq(&xas);
 
-	if (nr_pages)
-		swap_put_entries_direct(radix_to_swp_entry(radswap), nr_pages);
+	/* A swapin-error marker holds no swap slot, so just drop it. */
+	if (nr_pages && softleaf_is_swap(swp))
+		swap_put_entries_direct(swp, nr_pages);
 
 	return nr_pages;
 }
-- 
2.55.0

