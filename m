Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C585473C84
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521251; cv=none; b=Z/3IsxQM7+hbgJM/Qk+0S91UPC8phkcSKQCOARoH4WexsXRnXf6mFRlBJ9/9Kz7WdmFo/NUHYkpWG+ucxrOduJ72qvvqYUPa5u7JmDEKDeflIOFvYhJ23e3jeKLy9EmXKaIlGJzo4gBX7VffGa7szOwh6zMN0n0FDp9+k9HDR7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521251; c=relaxed/simple;
	bh=iqfElsXaJRgSBfylr8LqH0mszsAyVH3LytnZSHXWZPs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=btvHADV/HBI10luoMSjbsKSETO7zQENZgWSBVFTeXMqMnfjUhJZ3oxCZfk19OsmbQGVSxTzyq2xywJGBDRtiQZYPbDP/4B1clvu1tcRv/HsnLAQifoywTgSM0szTYmHreyqAgyYzctQNqAbmcYLEmL6agtmcTGNQ+QuxU39N7Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cb0sZSpv; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cb0sZSpv"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6b1b233ca8dso419458eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521248; x=1789126048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LMuldKzRZKnRRVnCUZ2I1QR7ouYQcPdcuex/lnXCBdk=;
        b=Cb0sZSpvuNA/RunzaiDMhQwNFQkOYrjzrmZnMwiFey6YBUVaGWC3aY8O9gLGTUcVk3
         PG/pA32PHi0RBt/ZAWBotCBrLHOLxd8jyv30ZWWJ64skfdMCJhgbeWJgfV7Oz6qhX4dM
         kpHZVJcyvY4YPvyemWKAYnRzBDMHM1FiqS8mJ5ly7/c8m+mAuO7xjln18VBC6Rxw/ce1
         G7/1ttn37NCN9PTVlb1/ZmrT2eTPlnihhC77w9o7WqbnOeoXRAQZlsHRqDlzXUeg3Zry
         mBFHaL60SnhPSk2Uuztb6fRgkLfMQYdFr9N8IBXkYuWEvKTYu2k0Ld0AkzqsRRwm1JRq
         122Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521248; x=1789126048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMuldKzRZKnRRVnCUZ2I1QR7ouYQcPdcuex/lnXCBdk=;
        b=G6oYUWDETYyDw4YUVfWdFIKqpsnJBT7YWIDh9e+oJt5LzE47OIlodNygEUdOrOYhJV
         hbLt04lH3o8SA2fFGgwP2NM793EFI7yXQ5gBitexPlhnahD+8c9CdvbwAtjPFsy6IxeF
         wgbxDf6DlfgJaVMGtEdXTH2lYLD364tqxq2lCPpMMh85bEUP/h+p9IQva/Q6m9WflXkB
         zCWUr8Tuh6mG7YKaiX9F1KlgdfMAuMYPX9sk/f+7R/sCF2HuwA0ym90D6EDX+ZUkRr/1
         LphfUjNpWt9S0QQNL/W9PZslpKtPay30nrZtRCEM047qYaGqxzSuza53HEqBxB5HAIn/
         qCvA==
X-Gm-Message-State: AFuF++kdJJ4h2gX6dSvjRv60vi1UfoKPGRopZvC++BS5ly9IDyPTKXF0
	+hli818xtkpK/ORb4A+Xh7YPDed/2pD7HqEzQX0lln78xL37n7w5Z/QRg+bPxVR6QPc=
X-Gm-Gg: AYBFou2fHdoqnuKrwUbJr3eoPgYP2zXy45exaRWUpy05A7ICfyBFdjes4zzsS5gLT7U
	jiILjhfEGvVCmnPoKE4kj12ETscoPc7I/LtKAcAxbYcM1hjgNZAm4Pb9L1ufX5BVDyIrSKXQVU8
	hNscWwg4jaoTVQ7IkURUIfcR88Br8KTotpZ2n6umbvz3OUwUKFmmYbadJTxO+QuFa5KJTZyvNhv
	+NZDwrC8JZUh60jMVXYPxbT5reaW6YI/Nc8V2BnYjpNQck1w0XU4Yy0UFJtG7zHmcCr0481CwPK
	9gK4poOT04DRbvwLKRaq0Uelks/kivqxDN+91DpuH9zF/o9TvnHcwzhFpJ6KIXO2STStVbzdQba
	jChUZmGW2bU7P6v5TouAL2DfoT3omnC9P29XTJvmYCSFXNiLjRmSgYO7ADBRqn3VddzeZ078XN4
	9CdxziR2F1zpuyZ+1jleWbFEOh/G831agOqZPzuTd9Wr6G0xTPxQjDxLPGT6TjRFe3tT0Subp6O
	qGCQRLt81bVzmSDHNHVKSXDCA==
X-Received: by 2002:a05:6820:2217:b0:6b7:8396:f3c3 with SMTP id 006d021491bc7-6b78396f8dcmr1217555eaf.37.1788521247704;
        Fri, 04 Sep 2026 04:27:27 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm7037586eec.7.2026.09.04.04.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:27:27 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH] nvme: fix typo "occuring" in comment
Date: Fri,  4 Sep 2026 16:57:21 +0530
Message-ID: <20260904112722.5618-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "occuring" to "occurring", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Only touches comments, no
code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/nvme/host/multipath.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
index 75dbb58286a3..4d931cb1162f 100644
--- a/drivers/nvme/host/multipath.c
+++ b/drivers/nvme/host/multipath.c
@@ -773,7 +773,7 @@ int nvme_mpath_alloc_disk(struct nvme_ctrl *ctrl, struct nvme_ns_head *head)
 	head->disk->private_data = head;
 
 	/*
-	 * We need to suppress the partition scan from occuring within the
+	 * We need to suppress the partition scan from occurring within the
 	 * controller's scan_work context. If a path error occurs here, the IO
 	 * will wait until a path becomes available or all paths are torn down,
 	 * but that action also occurs within scan_work, so it would deadlock.
-- 
2.48.1

