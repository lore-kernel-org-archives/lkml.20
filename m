Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792478313;
	b=w3P8hmIGoFFfV1fqmUpcxSAQy471STuN/8k1hrwZxT5ljL1AeK5mGIc2jtRTXPXltq0a
	 slEgJ69NT3kllaIRwuZnCJZ1BOr1zmJmFr4edZ3etIE+P6mRJ5bVukAwvlKrxwlQKPvXt
	 xGg6Mx8H6SWEsyyt6BoDaoejs+MZVJW4YxOWM3uITQ/NcfGGvtxy4A8isk7p8wjMBT1Zd
	 UAC39ap4hEL8UKz5Fl2sOEkMEhsucc6z3AYoYs0UPdomLWJ6WuvX09chIbaLxRUPFkktM
	 2GS4Ohxr30Mzm9n50emWVTrPluAcnJ2cLL38Q0eFd9YA00LquDm9T2KI1s7f0dw98Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZfCKuhuFLFgY7+lDwr5/B266OUdv6BfsTvR8mFssGTA=;
	b=BU1ikU7EV6Q3O1nxmrbz2Bgv48WxgNIDiUoyUkCt2DIGyBlGY38QQH4AkttTP9h8yCs8
	 DTJWuhRZ7zkUrUwUc88KDuPD9NAl7sWAlpm3nZdNhvgKQp4TsUqzAPJSShYVWu6KUJdAX
	 fGPfXceuo6UwmYQX5uABVsIW5SyiEMpmkvaJcX/FDA3V4rwBRpbn2XoNUCrA9vFfZfktF
	 Hvx413hVBwZH+BfrmNnGb1NvGSavLdI171nDKBYnDY4bQnpfOxbUyVXMDJVkn4o/gBGPH
	 9cgYQMb+17OQRBHstuxERZQ4qxl0XewtL77D29TXZdUKD1gJ1cA/h/XOvA/eoa84hxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jyCX5E17;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECCB60A262D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ECCB60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jyCX5E17
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e20edd106so149676f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478312; x=1793083112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZfCKuhuFLFgY7+lDwr5/B266OUdv6BfsTvR8mFssGTA=;
        b=jyCX5E17hnjLXAhAwoXKBMXQVYu+tPW2CI+HH0G2ER6wB9MTmmSiAZpi/as4fOdclo
         kAXxM9PkY4H5JHdjsZ+4Bzx5HpHo2OnrZ1HwgLbj+bPwLnnqf70yEaupd4CLVASzf05+
         OWSWlR51HT6pmhY9gIzfGoDxulMeZ7F5ku19C7h7HDX7X1ERjFj6F5Vm0iNa7uXV1PFt
         NYQOfJoQQiaI/ISd6sVZIM0JKsBtHgJSriQUYmbyhsYlwRYCxSYdk4j45W35mPoYQWKe
         eoBwtsyp9MCCF4vac8+i04nXoIXyxJkMqmbtyDTak7n0J5c3tabeCTmLOTojUJhKN4tk
         yyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478312; x=1793083112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZfCKuhuFLFgY7+lDwr5/B266OUdv6BfsTvR8mFssGTA=;
        b=tcnNGsKNAWDCS8N8b/JiOmITUqoGFqJ8LUTf0SpzFSploNSwRoD9jKFHF6BE+zs9CE
         1QQ6/pvilLZoFwM2HY0X632N7gv292yi63PrQS6AnqiK20IwabhWFAd8kB1eUuUiKhTX
         MacLJ7GZkK+cDC6Jb5ABcj3ND3v89SeHkS2hxrI3WKOvFzlFcwyApd+GYFwaf4H8rWQQ
         Z+/u2DQiF2EdzfyX6A/0qQuyqni8QxjDA3Z4SieZTkBo5Ahf4JKfu9C1/Bmi5yxCFZwS
         0fQyDLyt0z2x+b/6ZQniD7Vv7InvYc0MKpTCoU8X6WCldOgj5FIHX9f5Q9KJUDepVJPx
         +hLw==
X-Forwarded-Encrypted: i=1; AKwUvBzztEhQi7GXs2ceLuLpnF+x2cQb4BDG1SUHzmI1yibIDZRMNLCyf3LqQjZ49dEnYnUoQmt4W6mZf35iuqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBn6ZobeJME+il1NCz3J5qkDS5VMiLdX1QXsP9KXIGF3mkUdbj
	yyfm4jWcsgTYzwnAK+hbx9nlaJE3IrKouIsnmRED8mDDWhtnd4X5QdQm
X-Gm-Gg: AYBFou3MzJ4GXbV8LUGRsSHcKTB3Jkmv455Ps7mKWpDzcqbH0vQ/RpvE/A+QLMjkAQn
	OfuA1IdoecJwtzWI167R7x5qkh3h9jF09Teo9mc5T+N7tJ8graBx0N6VL1eL1iTfuzdwK0eKgTR
	BJ2Vdhbxx8o3WKp6qgOhuptEK4lvKeaUoKD9zOWyJtbTILjmEViPuWaFlOyh/263Hlxq4zp4+bv
	HOJsfcwGP+VKnpQcYiISU/x4GftOjJwcXar3JjJJcHpBf/FFIC/gBc/ivZFWHLC5opI2zntn8Io
	/qeAniRTQsYuKwa2Fbl/Mot2QvPR8p5bbhT5YHDthuUQkIluP3XQm5sxuUO1iSGbhRP9wPHNOem
	sKnVQKR0mxrxha4F6IzadGLmnM9EQSFV+D1wlUEP2Ofdohn+vmHdt7T6PpYIaYAcVA6dQQbpSr9
	k7gg20Km1uAUUgs9zEDLI/OKhzvnkhabHtUjnnvFIL/HfMsBtXUvp4437X5eS6kGim+ZBvMGsaR
	evdWzpIzm3AKR64AOHU+MhtmjsXA743pkfdk6UT2FaztuSKADBgIrz19L9qIVY8CX5S14JUnLT1
	kqpaPcmvJgg/DAxPq6a3C7+Cv0nDtbZZKWQTY6iBxI1Sg664aqi+6GVJwZ+qUkQ1wxQdEgB1ncC
	zTA==
X-Received: by 2002:a05:6000:490f:b0:48d:f99d:a0d2 with SMTP id ffacd0b85a97d-48e07bbe6a1mr21638509f8f.15.1792478311632;
        Mon, 19 Oct 2026 23:38:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c92-6501-2169-eb9c-7ad3-f5db.310.pool.telefonica.de. [2a02:3100:9c92:6501:2169:eb9c:7ad3:f5db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d820714sm3916393f8f.35.2026.10.19.23.38.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 23:38:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	dri-devel@lists.freedesktop.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [RFC PATCH 4/6] iommufd: Keep the pages mutex alive until DMA-buf detach
Date: Tue, 20 Oct 2026 08:37:43 +0200
Message-Id: <fdb5d9715d7f278ac24f05246f09703edb283525.1792477872.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792477872.git.kmehltretter@gmail.com>
References: <cover.1792477872.git.kmehltretter@gmail.com>
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

iopt_release_pages() destroys pages->mutex before removing the DMA-buf
attachment. The linked attachment still exposes pages through
importer_priv. An invalidation can enter iopt_revoke_notify() and lock
the destroyed mutex, including when exp_phys is already NULL.

Destroy pages->mutex after dma_buf_detach() has removed the attachment
and excluded further invalidation callbacks.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/iommu/iommufd/pages.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 76d8803d6..59ee68a1a 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1667,7 +1667,6 @@ void iopt_release_pages(struct kref *kref)
 	WARN_ON(pages->npinned);
 	WARN_ON(!xa_empty(&pages->pinned_pfns));
 	mmdrop(pages->source_mm);
-	mutex_destroy(&pages->mutex);
 	put_task_struct(pages->source_task);
 	free_uid(pages->source_user);
 	if (iopt_is_dmabuf(pages) && pages->dmabuf.attach) {
@@ -1689,6 +1688,7 @@ void iopt_release_pages(struct kref *kref)
 	} else if (pages->type == IOPT_ADDRESS_FILE) {
 		fput(pages->file);
 	}
+	mutex_destroy(&pages->mutex);
 	kfree(pages);
 }
 
-- 
2.39.5 (Apple Git-154)

