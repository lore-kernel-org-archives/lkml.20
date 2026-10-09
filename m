Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070654746CA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791529960; cv=none; b=m+V8QgCbH0O0/9PmifZwbHzeP6OwkZ2qJW6vlOmIRgEERo5pUVYklveqPkMr+MHZQDWr7izic6tpUocPg3obG+YiuzFHzSF+g1axJt/M1BRnF8MG3JgTZQlKqrw83m0EW9sRCEOP/vOWgeLsipbSsldYh86shnAWXw7KZx7MwzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791529960; c=relaxed/simple;
	bh=cIZ5wySzXVsfbNVLLCrYh4d0J0tD5oflgi7yvqgVSm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fklLgXPzBm/xiLpkz1UYoOwMV+plUNbHyeGVtv5b/w1Sl/Ieo+oSMyRo2B+BLlsIdaTRa259o+SapmEHR1yKlp/7WhWU28pFKzYPLRO3TDsPK0J340UPnthVZGRZHKbGLrRzCMn0xbSlUsk799AFwynR0YNVtqUxAyf+txtf8uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gM99JLGR; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gM99JLGR"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8246b13cbso9430095ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791529958; x=1792134758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O7Z3LGH1ZkWROJK0VS9Mt3KioBTwm3wp4tjW9v7CFlU=;
        b=gM99JLGR5/PmkP8vVCiudFhx0o1zd3Fg+5HfwCJdhZDhyRw59USM6e4nl6sbH2Nn1I
         8OhhEKxEIPp/Nbikt8aF2+y7IxtUIYJr85Xs8KZ5c0pi4Csm3XEshlrYVfzddxDFETN7
         mEN/ywYZXWUfwnXBP+0TVyuSsJv4ODuUs0wG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529958; x=1792134758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O7Z3LGH1ZkWROJK0VS9Mt3KioBTwm3wp4tjW9v7CFlU=;
        b=hflFDgRozG5lvc9rlB6ahKARDz7PocjIq2+0MQc53K2fnuRNlGgEbALJPzJ8vP6Z29
         c8PLkpqjCHi3tfysG4uyLgLhZJ1GgIle5E9dLDZ6OV7r/137oYke268colDsQ8br65eU
         O/oD4swiauKES/WAdR7Iv9li41qIaPzNLtPAejg+vHhz+sSGhiuSg/y1cKio+94uZGzR
         Qy940xAqmmTbpZozCa3pIzh51MxhmPR6qjRocFeBSbYOORUX89lcy5+VPLmjBZ9Z7jKg
         UH6XRMCXXbV7pR5MkbDaN1I1uSddtrSGUOk1c9I3A5ECZfxnsrihXvMUCHWLiwCOhr46
         U86w==
X-Forwarded-Encrypted: i=1; AKwUvBwUqv0usmMHWmY6A2BtE17BQ63W3+WBNVro8+kzVO4PmzPrm+O3lqFQTnnRaW4ZI55/DBXdBHi0S2jc1xc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIScOahHP5ktkk/cqwH70Vxs1uM9vb+TEgmgBygeLjJUQeKnNaJ
	9KA5BSAIaysJsQLuzJmGUZkSRkbnhwcq/6UzRHC+0esTXi2rdKAJA1dZEGOUz+C0gg==
X-Gm-Gg: AYBFou1dJD1bsvCWCy+beKjapqmp4IbbiWMvCtXrV0Pe06wHLPGh3j6T+G1F+GqOeuU
	a6YMCiHv91p2BkeBOwozbYxHLMmPLkeqlqEIhSVyB7g7ROwymX5WVUJRJgX6h0m5VJXJCIadgtN
	LfdBSufHlw9xB2rQs6QcONkcrjxHy3bd8mhVlh5eUtoaOtRrQysrvWzUB+DmucLVVu7vQd+E2Ci
	0t6mWuH/BK87aHji0keqT1fCrNu9USJkD+kbRkSjZBnhWTpQ/ZpOoSZINUqpTzZ305XTEFouYnc
	ZNqxumtdVQNLisoMyakDDuC/pUK93AMzn0xykP1f3tEKvzATMYSuIQ6zGHbgOGr2vXsADZkD7tK
	xzUuNcK+i/0eXwezFttEpIBXw0kZqPsNCxpBm1lcLyt43WnXPB+xbW5Cpld80RW+KQOosP0IXZl
	BOeYYmY4ASys45utPAjo2VhBhLhqyqxsbvzZV1fDNJokPpmWUt7FbK2H02mpjxrisTl9scKJdyH
	Fuqlx6Na995xtIrH7sllYXO3I4oAn3G/Ca8NfVkHSeiswN1cKiGkwYk0LrZDH8=
X-Received: by 2002:a17:903:2ad0:b0:2e2:c3a2:9b15 with SMTP id d9443c01a7336-2e84280d558mr8568925ad.6.1791529958517;
        Fri, 09 Oct 2026 00:12:38 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:383b:5817:8167:5051])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b19a2sm4483535ad.46.2026.10.09.00.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:12:37 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v2 08/11] zram: reset writeback state in zram_reset_device()
Date: Fri,  9 Oct 2026 16:11:31 +0900
Message-ID: <20261009071157.3730698-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261009071157.3730698-1-senozhatsky@chromium.org>
References: <20261009071157.3730698-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reset all writeback state to its initial defaults on device reset.
We used to keep writeback related data in zram->stats, which
zram_reset_device() clears, but commit 1d69a3f8ae77 ("zram: idle
writeback fixes and cleanup") moved it (along with the newly added
wb_limit_enable) to struct zram, after which neither of them was
reset anymore.  wb_batch_size and compressed_wb, which were added
later, are not reset either.

Fixes: 1d69a3f8ae77 ("zram: idle writeback fixes and cleanup")
Acked-by: Brian Geffon <bgeffon@google.com>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/zram_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 593fa4ae47c4..0e1aa0da11aa 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -694,6 +694,7 @@ static void reset_bdev(struct zram *zram)
 	zram->disk->fops = &zram_devops;
 	kvfree(zram->bitmap);
 	zram->bitmap = NULL;
+	zram->nr_pages = 0;
 }
 
 static ssize_t backing_dev_show(struct device *dev,
@@ -2881,6 +2882,12 @@ static void zram_reset_device(struct zram *zram)
 	zram_destroy_comps(zram);
 	memset(&zram->stats, 0, sizeof(zram->stats));
 	reset_bdev(zram);
+#ifdef CONFIG_ZRAM_WRITEBACK
+	zram->wb_limit_enable = false;
+	zram->bd_wb_limit = 0;
+	zram->wb_batch_size = 32;
+	zram->compressed_wb = false;
+#endif
 }
 
 static ssize_t disksize_store(struct device *dev, struct device_attribute *attr,
-- 
2.56.0.385.gd3acb90ef8-goog

