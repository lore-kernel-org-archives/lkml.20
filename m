Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8959F3DAAD5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 03:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792295526; cv=none; b=c6nHfQsRJFwWjdeV2vKz3KZ+xckAt+MYQeJZhYAkSF+xQpueMEq66UU8+erttFkdzwJ0xlJu+tS5pXieirqko03VctKDfZFHs9ZVFyAyqx0Hr6PITxNvNHHVraxegXHFawukVayxfjc1j7wRpHLqbi88p1gmfxvtM5836UiqIKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792295526; c=relaxed/simple;
	bh=2L1l2WEmVkTr1X/Pc9b6FfcxdiaY29ag5fDryoDzPpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJnpCRUdOwIgvO6z9OC6wCwoCDpkqkPvwgLNKUiKAySBNQHmRBRT+xLU8e4ITMCM7aGrUD+FoVbv9zdxUsuiWG30XfoPkEfFEI/75bfWJ9zpKMEAAav/P8+xVs1uvk+q7htW5p7oPSXl960YUHUuY5RgE6adsRHs76V99HrFvCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GEtUzgK3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GEtUzgK3"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so594461a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 20:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792295525; x=1792900325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6B418+SzCM2Ac+ZkuhfOdHoqL+9AUQAlnO0fG1JXa14=;
        b=GEtUzgK3NQEwuOYRXTbgXpgXpcT6O3rok/7pICSBKVAwcZSfd+PVtPrJe4bhnIjNJG
         7tQAh0KBm3SFNsEAV+z8TIIerMIphmO4dlhbcuRUHA0oYYzWa6LLqvKgEY2OZbTVlKKS
         ebG3j/zbID1El1K30kDSoyo01t5728xG8sIuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792295525; x=1792900325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6B418+SzCM2Ac+ZkuhfOdHoqL+9AUQAlnO0fG1JXa14=;
        b=mcy/65lvS/r+x6Ekop4KMgtE5NFsKUAq8/97aWpSZ+VDfc+kE5S9nd0l4x1n1EFOGJ
         y7lJd+Pg+nOnbh4cAtYIZk4iKjDliI4jOiw3GSCp0YC8Hx++0wLTIn9ZpIUwkZezSMmp
         G1HwSnTnVBtTlxEWLg0IHCYR/ACfXEDBlGkiUmRoX/Rzfqxg3NT7z4eq7fXqLJByxkwc
         IffQqSTDAVZFqXAUcRdNrowqv6TS4wkmN8eeUt5ra0iwnEQdtgWaE2SbvdHtNgmdCmVg
         avJIqf7XSTxWHAIFBT6S6AVXJ9a31mwoXma4niGQTzVJFQQYaZJmjRpfmFSWmrs0vuWD
         lWIg==
X-Forwarded-Encrypted: i=1; AKwUvBwfgQnyVsjQGHD7CtzL2c02MNcljmpjGXKVQK79JjQ7OifLhM/qeq85XYuSY0Za5dBSuT2TdJPlOPLt7+E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRZXgo8L9GmB33YlZBeDrWASME+FtL5IWiqq3aPrJ1efvrazV3
	vDEX+m0XbDCHIc1zkWb/vA6bmYpPtlXjKw0vsUNfvqxEHtWKzePVDgT1UN/vXsQ8h2xK2HptiE2
	EFQY=
X-Gm-Gg: AYBFou1d0OecPX+a0NeU/NvyveSRjXD/jeYkfd3iRyxUKJu7y3DWU37oQdnhLYfN/FN
	WEeVUObFqTZQBeMzfRFHiBrZs+BO+JOsYROkpR/JY/P6KGSFvWuMSdcO7EK7fOcDnnpypFN6bBu
	zjVW2IP6nl9sznN6HiUAPmt78D/5B/QxurVY18A21iyyjAkNAqZo4QM9pl8gh5ObFI9rqH8h6Kv
	ad3zOX1ndC3HSSeHQZ4X3EbsdtDvO/uINXELziTx0HyZixtyRch2Mnn1O2wO6x/f1RVUryfoYGt
	047vj3oWLJvUFB7/udL+eQ5ian7p9yi8Mm7Ex8HJGyft2O3lD0/WGCpxPnf3xk8ldK8ECKTsKJq
	87+IECl4ssCqdOMjuVoEZokwFxDI4zA3urEohW059zWC/LdNf6valkDrtCF9rb3QHzI8wu0jvYf
	fyR8SHoj5+S7Xdln4XE2+x7HixJjpJtm6ImjVKYiFIb+y4t7cn3b9xHcA0sDv9jlZrE51tvVros
	8zjlONSG1Bw0AWahmwU420cLEswsg8rozHpU674QDgAcO2vYM7rFGa8D/YemdQ=
X-Received: by 2002:a17:90b:2886:b0:3a0:9fe0:3aaf with SMTP id 98e67ed59e1d1-3acef3dc81cmr3308976a91.48.1792295524943;
        Sat, 17 Oct 2026 20:52:04 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:4569:b311:f3ea:5f8d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad25d5d1b4sm253024a91.16.2026.10.17.20.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 20:52:03 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Barry Song <baohua@kernel.org>,
	Bo Zhang <zhangbo0325@gmail.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v5 08/13] zram: reset writeback state in zram_reset_device()
Date: Sun, 18 Oct 2026 12:51:10 +0900
Message-ID: <20261018035125.3120704-9-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
In-Reply-To: <20261018035125.3120704-1-senozhatsky@chromium.org>
References: <20261018035125.3120704-1-senozhatsky@chromium.org>
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
2.56.0.176.g3575e65682-goog

