Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792550573;
	b=DUojDpL3QRMi9j0a5X171in4Hx6K97SEjFmyIe5fuqZoHBzyOcHwjvVnooxFf1p6zfS0
	 FXa3ovJAZENPknpLEMsqo+VeMoCkesNjHBz0xBC3BRKVx0UbAk8ECY3D556XsKgXVp16s
	 lqA9Of1iwIf0y7fj8AlT/ejH5KLeaoAPelZ3mfFDdmXXnQ/NI3yVbMWB7U3y+HJW3x4O4
	 8uXq3XvY2S5yONj2Yj43vUTjLsnpXrrhYkQENlAXNAkg1+zzTteHJh+ZH5HumeCbMMm8a
	 76kNfCdoxVguWcMMG6T//jAfT0gqvS/rcrEKTQk0t3Sg5ad9vP+KvMcCP4jdt6+JeUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792550573;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YqvLnWab+0OyPrxtGw/AiXaMLQ8o5EGXMAvfXVZT4qc=;
	b=OW1v+CfhLbKYlgGdNzCnpTOmEGw5AxV4LMGgns2HE2DnemrIFjvnnCLR64dIEHrgRa8h
	 n/GN7OKfDR5nzNoKzij7y18ImPzlFfUROyGRL10EG3/gI1yiPtVG2Sq2ah+OmGoDRQxqe
	 LvMApd44tTYOdmuBdHfL/e7sekajhFhPfgqsihKQjEMQkleQEgwotF92O9NsTNA/RBrK0
	 6xAkU4pWHmAtIw7WLQwGftLhQDQfdOElIBhmq3O06+ca7OUGwW29eoc9P01sKhrsWHVqD
	 6iE+bTT2KltKsiG32PPt9arWAyDsl01ONjki4CqvJSC51uHnfG5RYtPhHquKrjBfenA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i+6SmKo2;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24042606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24042606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i+6SmKo2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso447548eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792550572; x=1793155372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqvLnWab+0OyPrxtGw/AiXaMLQ8o5EGXMAvfXVZT4qc=;
        b=i+6SmKo28Gg1aPBkS6PGSq82QgA4fNC0EU0f3IriMkfk7D5N9WtCEzsIMr4IDj94Sx
         OCLTp1T78RG57mka7X4Td1p41LIPW153wgplWHFpjnDrlaFMfSiVzmQFWSFRUbuPdr7T
         3CRr+VQhlXvFJIs6d+1uHU5h0dCPH95GqUZCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550572; x=1793155372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqvLnWab+0OyPrxtGw/AiXaMLQ8o5EGXMAvfXVZT4qc=;
        b=Z94eCt196UYYIBc3Q6ORkdcc64W5pnPsrYqHHqbwUA6TkZojjQWhEM3r47I/GmUw9m
         q+aW10qijm+RhXH2gqaVxvjvg+aOyCXGg5f78ojvxMDO+UMCmXd/JcLwkHrMuJjz9bKV
         wGOyKaDRFdjH724Ml4O0EFP+2PZ7RMN/lxQozIgwCtiSmche7VpH1pa0RiDYANvGa4r0
         uZcXM9vkZabs03TMi/WWuuKk3osVEyqTkQRx/ZwgqpipqxXcx4Y2zpclXxI83Vc3/Y8E
         NBprLIS+RGVZMWaJXjfT458WdvoJIeCtvTQW7aM2K9uxm2Lsb1aZuFYQOzoQ8qXF5sTt
         /RaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFrojeBcphGSskvB1aXXuKrZr1S38Jz0glIvS8UiHM1/M4U28+NIVSiy2gQS6g8HxRunNankeqZ+bVl9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmmdyh7lep6eFZCKxOX+1iZFe4AmN+ef9a9SL+3cYaPMsVeHnf
	BZoCSpZB3eOPkJhjSF7MRTaOsTXJ/5XuE0R0OegqDbcrtTaR6YvTm+VN3xzxW8fNUA==
X-Gm-Gg: AYBFou2iLkLr2/6NKHE/KLLR1NTZokdJ7F5nBN9+U8lTOkbZFlsN1rtaG2nVMI25esl
	rQuBEVSsQc+KBBtSF7ZOgOflUopt8zEea5555+j+ykmWMj4FXSluiEe69B0Nl4refK+Z2/6Bsxa
	iiX4ZoGqbcCp3JGstkAW4ysTr+NBXTG0LRT6xiu7cqoUphg2hfwpeFTVamJqoFrgbOaCkRvqzJI
	TE1qzsw1HnQb8GI33UJgf3xVNtxOCc1xg/zihOCvLDqM+8Y6Vbd1XfqvfCpp+TUjc6J0rsBpxZq
	rx0lHgzbSOvYse3mkwjdyJZMfOQPPrP/WPa77UK1SaJBM0MKQQmAnF7AWvgqXHPsctajhb1PGwy
	DSFrCc4Y0XC33cVkOWbyLCZDYFrM+PEpuzNDqJdhJRAoTDx7iW89Wg5R50dFnZ/UBzJi65aMcn/
	t4nX1KjWM0qkyQ2Rv/p/ksEbEdoQm8fRtJCicFcyU0jN4kGU+JiLr2WjTBt8vniy3qMHwLxuOws
	EeR347tuBTFir0w+AlZulu4D7N4wfET+teiDqxT5WE4b50MLojxN16AWyf0tYfNWfFPKr3D0KmH
	79VfZkq4lHDlUsiBoT2C4kigkC33F42vnYaPFi+xk858
X-Received: by 2002:a05:7022:f515:b0:155:7721:3a4c with SMTP id a92af1059eb24-190a660fd4fmr846137c88.35.1792550572267;
        Tue, 20 Oct 2026 19:42:52 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:97d1:a8be:236d:bf79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm2392047c88.3.2026.10.20.19.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 19:42:51 -0700 (PDT)
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
Subject: [PATCH v6 03/13] zram: reset writeback state in zram_reset_device()
Date: Wed, 21 Oct 2026 11:42:13 +0900
Message-ID: <20261021024236.1787884-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261021024236.1787884-1-senozhatsky@chromium.org>
References: <20261021024236.1787884-1-senozhatsky@chromium.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reset all writeback state to its initial defaults on device reset.
We used to keep writeback related data in zram->stats, which
zram_reset_device() clears, but commit 1d69a3f8ae77 ("zram: idle
writeback fixes and cleanup") moved it (along with the newly added
wb_limit_enable) to struct zram, after which neither of them was
reset anymore.  wb_batch_size and compressed_wb, which were added
later, are not reset either.

The patch is more about just being pedantic.

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
2.56.0.212.g129ede20d9-goog

