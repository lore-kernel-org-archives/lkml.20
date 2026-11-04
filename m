Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801307;
	b=AQLyXkrs7I6f5/eQhMMo9HWgoBx7eiQ4o+98dhWiblJiNa7eDkbQUFFHmz2ByU8gc07U
	 8KVlH0rEDvYBCE0HmRX/asdwoOeV4A1A5tRNcrZMRWbhYaFvWaoDuLyLcVpFfi+snyqPO
	 6IaODZ1pZFLIhPIbP8oQaHeecbu3/fK6ojGwzVSU43EEW4oFC1EFpw8bdDu5rwkzrinXt
	 Rm8EI8um2iKNatN6rntl82gdXHlsuiUY96Soxbv7GujrXZ5/5TYW5PbNYLehmtfjFlTYJ
	 +jTBlLZOAN1E3rCaF537m2u4r9JYU4S5b9aT8ces4hIdtZJeaaXMNhLJfvTTcTEWF9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zot0p/bJWPo7oa0Gnp4k28/7YcYDzdg0GXScIZ3/7js=;
	b=natJxt6b0shFjdo0RJnxEBfY8hVgVOuqVgBS5I7xBDzz46Eyit+cGkxSMf9ZUZRfvQek
	 f5ajLnENYN2+WGLCI8AJdahN5vs2ZFd5aNQx0LgDes3wC0lJBHYrdtEcZ5JHQQ7cWDRCh
	 qUg4Y4pQW9RixoGPPpC2ZHIGTcxQ3i9wiKSxkPBRUt5mEDu9AhaLuWpOIFxCh7g/j70KM
	 YEHvF4ZBCcfQ8UgDsQq+pjYCDalgcRgq9yLe4PEaiLeZLpa7mtnHohspABYoQZ2OnCHiw
	 h2agmcR3KICCb3sLjZlbievazDSvy8AdZPNlok2L9LpB0JaSKVf07mWHlpYrYjpzLeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qPu3MPFF;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9065606A332
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 14:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9065606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qPu3MPFF
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-89ff475a152so334144b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 06:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793801306; x=1794406106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zot0p/bJWPo7oa0Gnp4k28/7YcYDzdg0GXScIZ3/7js=;
        b=qPu3MPFFhU0BWwtGyqRZXHNJi51GUHxalGD0O/IywHF/g8VJphTlG2cN9eBFt2l6LI
         AYxGvhK+uQMoQwe/JS8N7yB5wtOQgW1cD0g3Y1GORKKZHsvnlMa0PDyeuTGaR7sXkqpO
         uX9QGPrePXmUZd8MstFZr/j2+zO7DHUT/HYlPWKqQA7KqYWTbd5G4afFXxuSCqHX5dRp
         uLxxWDZ1+vlkMudYLON0ybHJ2gyLPnG7y8zk00nmHLDytNFpPUEhLUL3RWFzjrUveMsS
         5vXG7acMVwC8JDgPgkbOuQynoohv8Ilr3go64jWdTqvLwxPo28qHkT6guCTjOqunkpr2
         cUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801306; x=1794406106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zot0p/bJWPo7oa0Gnp4k28/7YcYDzdg0GXScIZ3/7js=;
        b=Rvr4AapZ5vhmWIOCWZOhYPULrkVHRE+kIzew+u57/BABJ6KhItNRvMHgnjb3SA+Msm
         g/kJOqGgWYYwOIj2B6dkrbPsCenVeodeHVT33BCJjd3CdxnLltbl9FTwVXj7Egao6M5I
         e13atwzoBtwG4l9KGn5NX3dw4TUSfbm3TBsKZHy7w+jwuAD7RJq857UE/zxjDNko4htr
         1PEbO6tzGxphVAJ/SCbYA/0gj0qDBqFn2SoUZJEXr4XMgl1xwB6fNPZqAWuKQeWYKE/b
         gS5GjUZoM+jSeJEKB69SFlN3HqvinDyqCZ9JqEz5tZ9seWsTycsQ+SbhtroNX4dWmXLh
         eJzg==
X-Forwarded-Encrypted: i=1; AKwUvBxqosLmltalFAcPhDzPpFa0aFv9306T5rzZMyndcJ16Qim70BQ++ZJaRE3vIop1DAID7ik4el82yBJu+es=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cdsWCHUc2sIEmBvkAB1WAiGdL6ZqXbzqKJsG3Cydk0o6L5DwW
	zqINv83fBUSbl18RSnkGNvzjDHZmTOBLkSFMNiuY6FF9o36Y+rarNiVK
X-Gm-Gg: AYBFou08HSTl9ZryDO9B2LPukjLIOYqAGxKoHh59tAwwzYGHyM2zwrvsc5s5wG2kPkh
	Jd1IWLcrLkSApM6HVM0pYC7+e80YpDOe+ZEQLXO4bxucru6OiuX1EsdPRPyXYsyfoiLrQ0DsJmB
	4IkGGxRI/hGeOWk5PmehbjPkFrytfjxzREYdLfVcSZCRStAbIHYV0z195IxIjDBugyW1kudgc6+
	vXW33WooAu7Mz2suR1yo4jXbXrn3g/Nvo1bJURynVqb18hq2xhKmofxBE3kd0gl1myTdPKOMp8Y
	zHhpOae6xYGYxXclHHzjDSlaF2V9TxpfJP1PzyKSPUa/VwwwOkkEYIXdil9U9P00y3dRiMkfgYg
	h7fkgJFSt7TKvEqyrYgjMvEJy+PgcSeL3R6mDRFP1ON8nsZjvJEOxP/tvWgMkp7lgUbSrFWB8aT
	eGcQHtRziF2FuZZkY585Y+CkfKNi6dxfvAhRttmcHYM+wS0+9nO+m39HXermaET/ZQ4s7oo0/d7
	K+0Vy7RpSYNzJDbR6Fy2IXwdIL0MzIta2gSY4g+YzUiT+I3ORrf9h8OZtsmr3Nn8MRbLDXZcqKC
	WzBK5fEeRba/AuYrRi/E9n+UlJt25L21KhXnlokqvinBwcPxqTjhHHw80uVUhHV7H1l0KhJ93GQ
	YaJhagsdw57fUNqGR5B74s8A=
X-Received: by 2002:a05:6a00:3a1c:b0:878:34d7:69b2 with SMTP id d2e1a72fcca58-8a9bffd63e3mr12245408b3a.57.1793801306022;
        Wed, 04 Nov 2026 06:08:26 -0800 (PST)
Received: from junjungu-PC.localdomain ([223.167.147.108])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8b09ba508fasm990259b3a.48.2026.11.04.06.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:08:25 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 04 Nov 2026 22:08:11 +0800
Subject: [PATCH 2/3] spi: ti-qspi: Abort probe when clock lookup fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ti-qspi-v1-2-c286943c22c3@gmail.com>
References: <20261104-ti-qspi-v1-0-c286943c22c3@gmail.com>
In-Reply-To: <20261104-ti-qspi-v1-0-c286943c22c3@gmail.com>
To: Mark Brown <broonie@kernel.org>, Felipe Balbi <balbi@ti.com>, 
 Sourav Poddar <sourav.poddar@ti.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@linaro.org>, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793801296; l=762;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=U1vEy3+juZhyTrIqOxrRZ1JMnCL1ydXUqwk9hAcTFPk=;
 b=1xsyVh0DX1/bSsScN6Dkd6waeaAiNYoHU1ya1DzzvCp9qWG6F1BbUqxIV6L9D/XJj8MNY7ufN
 zELMF/ORmY3C4UeDn28s3Sfm0UXYzNkkW0LU4zeiMo279x6EmE8SO1p
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=

Return the clock lookup error instead of continuing with an error
pointer that subsequent transfers can pass to clk_get_rate().

Fixes: 505a14954e2d ("spi/qspi: Add qspi flash controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-ti-qspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 0cc8c2d52226..2026fbcbeb90 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -844,6 +844,7 @@ static int ti_qspi_probe(struct platform_device *pdev)
 	if (IS_ERR(qspi->fclk)) {
 		ret = PTR_ERR(qspi->fclk);
 		dev_err(&pdev->dev, "could not get clk: %d\n", ret);
+		return ret;
 	}
 
 	pm_runtime_use_autosuspend(&pdev->dev);

-- 
2.53.0

