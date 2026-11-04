Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793783995;
	b=i90PbGT4vQ2PRqVqtnOIdUlIKFzUf0cPRB/rta3bxthzJyTmt+3GAHvPkU99MtGulgMS
	 VvPO2/oyWsa/XETc5VPR0GExlhzXqvS9qF8xGcB0LBi8tGrhKcECB+P5JeobdaA9B/wQv
	 8R+yd+0MI+EGnw8Lhl/VR9jNJvX9AenYirX1vf4l+pZ0jYchx0i8RWkHTSC6LWCtTKUxE
	 j2woWuq0BGrdjz1UiJ+QIjNjdoox2P8OexFvZGTE1AjOSykJvhpangQL0Nl4sEksVVXra
	 FO1ZZbeOyuzLqKTx9q7rhhXjX2oYlNKavVv1WyMW8nAwTg9gJT/2nR0YOk/eox2myqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3wi9u/eNIRBlM7umBIrwlsoKNh7GC57CM/HYHoRIVHc=;
	b=QjzjbiD030pd9CgzusV3l9thLk8m2Fnqpb1NLrDLwdVtJiWRI8F4QgrkG0og8vTYybNE
	 5Q56k7w4kzHGJqaPbKJKQhaWube5oZay90OjUDC6Univl99Sg3EJFyr1FfuKWpGsNud2S
	 tYdrWYshQCYRLMlHV5DNIiR4yBfbYsh7vrsQkrZ9n/hDsVZRwP4EhQ/ktx3RXS+bZkW6+
	 tqr5XA2KOrm2KRfJSwUUUHkzrpS9rTAnMnce1baiFS+LZ2NZ7DHFBXSxxLIM0rYLLz+BV
	 JKoMhtNex5xawqtJnjsT43tGBTQ6zFoFtEzwutrJ3Qx9GUh30J1xxPHS2iv2VCruOXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qb7dKu04;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFF7606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEFF7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qb7dKu04
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48df160bb9cso24106f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793783993; x=1794388793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wi9u/eNIRBlM7umBIrwlsoKNh7GC57CM/HYHoRIVHc=;
        b=Qb7dKu04/rfXYFJB9h1+I83jaG8W95u36dD98yda3f1SRixyn1nPlYwS6XLyUCvlk/
         vTrjID03LALoWoYJbS3NyVS3RnYMp5mg9oaaJ2Exp+iWy9RcjNUy23dIcd4yzwGIPbZ1
         SSTSFmzjnW7LRvYvcWHkWBaFycF7R+MJtmHmwZ69d8Ly3Xs+yNaoEze6IRGUNnSaMDKy
         YPn/k9uXZ3xKMu4muI76Gqd+TSDBfRQpWcPYdDtgE4Xord27hzchDSvljDlzeCNdN/XH
         QSlIKN0aHMCgqrDDvLPyUsC01g3DCASpZEhSoKhXlP3hOW88kMklJ9wXCoxeod15/Kef
         9MGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783993; x=1794388793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wi9u/eNIRBlM7umBIrwlsoKNh7GC57CM/HYHoRIVHc=;
        b=zm9yiZIX0ZXBjRhQXY1JWcl1jQIts+Nhigx/8ywAiA93clKMVo7YT3bfWKCt1RqzH8
         mLNC+A7m87zXida1khDwaRzPfrqxwaCfxJ1AapNMWU/w270wQOGCaumez2rmVWloikwh
         xLCj48kYRv/3xOEu3PXufe0fZTQ78zCQWkvSGTzSv84hAIl1GOsSEHc+kz93WdrYLrrg
         /syTH47xpZHGly8QzhTz7VWEXo2bDhhAt5Lj8LA1o/410PQyFi8IbNI2JQswjRH3BkHg
         ngYm6U5GEFrIbCrY/9hbaAaXOQ35xBe4tOHlhtbKjkJ8tqm2u7AkqA1hCKwgV0tQeP6d
         +0Vg==
X-Forwarded-Encrypted: i=1; AKwUvBz3EtrU0mfpZ5kyFWCDUuCiuy6Q5COSFieQMEA2tS0OyODtdjps+h9NpeJMwpXVNcGw4SWzsfASagvHlyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mVIDYSPFaS0hmHCeCU6gTar8UnIEzJr79j8bASW5JT2aNUdDc
	ovkdklZu1bEIBTOic2Hb6YgXch6ElNjV1cUJyLDUd6SnxEd/ir2zPLEk
X-Gm-Gg: AYBFou0x7i3JNEdh82EyBCioezXECp88y+u0jycsI1k6xMVa2k3mquvmW0ip/AEht2o
	wICCdhcyN20U53femzfXuEL9IQoQi7O36n28IUB0+bFQXTDem9oWJAoKj4GZMFn7akRZmWtv2YQ
	HlZ3mCeUAQK4YRhB9WApp5t8nYdMXU51cBwHasZfxJFE8hSXg+Qmp8RB07Yj1jFkUi62AhAwm6W
	5oWf9IZtMFHRTB5hr/v7J5RbrwaTasiW+lkeW9FpqTtrYbnTd7Ze6jpTeJHshso0+afOQwSoRTH
	SItjBvkwzLLT8sgAC394j4a1++be+k6fmNHCM/jQR9b6n9TLz83rJyrl6VzpuyrP/PJwazwKOKK
	i7t7W2cW0roDadU1CPJGe9F9a1ZMgR3GGJ6OEX4Bvztgt8BwPrRwpnj+gEeZoIrtgimPO+V+mPe
	uxjexzZ/1KPi6dk+m2hPRrKneq4ez7iePHHl4+GJwLUck4g9M4rhUCo9c5Tr0PncQmcgWMLdPCk
	9RAo7yX1iLQoXymZI9v4xHCWK30hlaqAW9OHGb7xfUjId8myRdNw4cVG5xg8vzqjf1lKc8vq52K
	vruP70DWQcDhf+5i5O8z6vExK/bpx5v+YET99fotbXHhkg9NaYpoY8KxtgKhiLMxAcKlKHhzkQQ
	SZFuvw7WS2AL7L3xTNLajx/xyiFovafoY3lHlyIsu
X-Received: by 2002:a5d:5f48:0:b0:48e:6ff2:606a with SMTP id ffacd0b85a97d-48e6ff2609dmr38662659f8f.6.1793783992626;
        Wed, 04 Nov 2026 01:19:52 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-006.paris.inria.fr. [128.93.83.6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fea18175bsm2720804f8f.7.2026.11.04.01.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:19:52 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Yifei Gao <gyf161023@gmail.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Maoyi Xie <maoyixie.tju@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mmc@vger.kernel.org (open list:SONY MEMORYSTICK SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] memstick: ms_block: fix double free in msb_ftl_initialize() error path
Date: Wed,  4 Nov 2026 10:17:25 +0100
Message-ID: <20261104091731.16500-3-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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

When one of the allocations in msb_ftl_initialize() fails, the function
frees msb->used_blocks_bitmap, msb->erased_blocks_bitmap and
msb->lba_to_pba_table but leaves the pointers set. The caller
msb_init_card() fails and both of its callers (msb_probe() and
msb_resume()) call msb_data_clear(), which frees the same three pointers
again.

Do not free them in msb_ftl_initialize().

This bug was found statically and is theoretical.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
Fixes: 0ab30494bc4f ("memstick: add support for legacy memorysticks")
---
 drivers/memstick/core/ms_block.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index cd4ff1b79a6d..26a04cecd94b 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -1351,12 +1351,8 @@ static int msb_ftl_initialize(struct msb_data *msb)
 			      GFP_KERNEL);
 
 	if (!msb->used_blocks_bitmap || !msb->lba_to_pba_table ||
-						!msb->erased_blocks_bitmap) {
-		bitmap_free(msb->used_blocks_bitmap);
-		bitmap_free(msb->erased_blocks_bitmap);
-		kfree(msb->lba_to_pba_table);
+						!msb->erased_blocks_bitmap)
 		return -ENOMEM;
-	}
 
 	for (i = 0; i < msb->zone_count; i++)
 		msb->free_block_count[i] = MS_BLOCKS_IN_ZONE;
-- 
2.53.0

