Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E164248032F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791863540; cv=none; b=U8Zv1ScSpdLlX6hhuy3SZXUBnMNhSBVHxlsxY+kvPwbP2GokMW4ElHNJJsMz6zaCJMAUUih6d3I8fc36pxpsogni8zuy6tZ7i6RoDtyD8pIHI2cyeW2BUchmvW810RVBNydHpXChQwQC0mlA3s1t/Z2rBwXLNBKj5oos/gZqSt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791863540; c=relaxed/simple;
	bh=nMuXVhYe39gJuCALMb5O3ireZIWC6v81e/BXOQPu0jk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lV/BGuvNwG6801vpf313B93LOIBYdU45r3uBiPlbKIn5s049NQNhsSkhrGq1TKHaj6eTFGJMgujqxM/oRnNX1GoqyY+4cw1YxklEmDQfb4KCGW2z+5GH3hBv8Wco6cDjkXHIiXTEW6skFMJdCFpwYMjWQghynOSgGG1NB2MkECs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DwlJzmZG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DwlJzmZG"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-887beafb714so1163665b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791863538; x=1792468338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bA1flR9Lu8v82O37oxNarBOltKmvw8qroUoydC4mNOA=;
        b=DwlJzmZGMWY3HRhKCJdem60xcuNmtaaX9Pci+ZBMWrdjnYGoVdY6T756lux+0Iljro
         8sH97kAwJTlxG0LjpG0/iANCtXr3E3k+pFdGmNMSf+6vFDCKZSXnhiDV1gSMQ1MJtYt8
         rgOXwsNszrMIprw7pfMhegQ8oAAdTQRs8vtIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791863538; x=1792468338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bA1flR9Lu8v82O37oxNarBOltKmvw8qroUoydC4mNOA=;
        b=e9er/L/Jneg6KAHwP/uTFm6Ujv+EQvYllc9JJcgu1R3RTg0WoTeDZPL8Kxnp0Q84Oy
         5tT3Fuum3qO8SH3CElPExDWaM/iAWZsCvdvljujVFDLO2E5YnULRQqWrf5xfTYjW/A7s
         8ayiPXDxiwHTlCKKGFJiQn/VeUR2vkPw28qrR+n1+O9DYi8q1sfwhF760pH02JZhP9c7
         tKlalNr8RiyVyImouD2Kx7j2tMZl/jhup0Iy1e0ACZlxvk7A5VNnSpLVSbDkpGw1/Qrm
         NlhvgpGH/BniZ+PhdGcW/kChi2/whYHflqt1hx+W7M3KL1eZTvHmgg53NCBF0vx9fyNX
         uwgQ==
X-Forwarded-Encrypted: i=1; AKwUvByz8CF2qRpHI+KiSYHT1V0xOeqBhi+3fOzmVdDpXbraWJOUCJqef2ECkB7bVtPKBoCbE4/E2cfa2hiZKps=@vger.kernel.org
X-Gm-Message-State: AFq9FYKipbiI/aHPLQAP8uY4bUt/ctjtL2TF6aI2CApwKlSJ3k1DM+cj
	eeweiRvvg/6CWTGAEPcgEReSG0aTk8vFWf3bkx9BO3B4ERoIXYXVDcKBjLXKstqJnA==
X-Gm-Gg: AYBFou2u03bYm962AgCByNi3IlUiDyGsEqYuEmRhhQmSIhRXT3tIsPv7eaYnM0TP/jR
	68V7JRc5SpLL77yjPCTHyJKyE6zZXB3u9WoSoYQT60IiRZxiegZxmniDEtmwiJsHPddLb4jmbPq
	eLmm0nBOUjAA4XFHBlkGd9+bF/cwGnIzpjggxZCXLx0hXYW2Z0KR47XG1QxoiAOqkJjkRQDwJMj
	GRoBNSfB5qtxnZP6tQVZYnPOu4UgXAlpTOkDU5OKbRaDzHzfEpjT3XBv0W3VTVI1msEQZs1qBJE
	ENT9Rcsk9jG7cryNTjoVRJL76WeSGkdm+b9oBiajhCnFL4fYUEaNLjUGwtOHU3W3q6Ehv42sT2w
	mH5kyXPrUBJENs88jIhENvRiKgwFjb98rhK+yTb6tRTLlHdxPeTzpRZABWDxpxZ82MdOs9898jb
	RxVxNmCGq4n/zRrtsyQr6TyYTtywlV8O005B5tc/NXeIbVTM7Ud+6ivWnU39n884deorbFFSmFL
	8WMEZSQ6u/qJcVeITCbdahfFgSmKgnMYY1UOsVdC1hi4+NAO9kwHbJFcR6ZWQ==
X-Received: by 2002:a05:6a00:99f:b0:886:61e5:cfbd with SMTP id d2e1a72fcca58-897c79d7cc1mr9570153b3a.45.1791863538092;
        Mon, 12 Oct 2026 20:52:18 -0700 (PDT)
Received: from tigeriii.tok.corp.google.com ([2a00:79e0:2031:6:476:d384:7c2e:1579])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c41bbb27sm4326818b3a.40.2026.10.12.20.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 20:52:17 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Brian Geffon <bgeffon@google.com>,
	Minchan Kim <minchan@kernel.org>,
	Richard Chang <richardycc@google.com>,
	linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-mm@kvack.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 03/11] zram: zstd: do not allocate empty C/D-dictionaries
Date: Tue, 13 Oct 2026 12:50:50 +0900
Message-ID: <20261013035201.2809924-4-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261013035201.2809924-1-senozhatsky@chromium.org>
References: <20261013035201.2809924-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not zstd_create_cdict_byreference() / zstd_create_ddict_byreference()
C/D dictionaries when no dictionary was provided in the first place,
because zstd still allocates internal memory for such calls (~96 KB at
default level 3, and ~160 KB at levels 9+ on x86_64).

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/block/zram/backend_zstd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/block/zram/backend_zstd.c b/drivers/block/zram/backend_zstd.c
index 127976b5455b..b367049f131d 100644
--- a/drivers/block/zram/backend_zstd.c
+++ b/drivers/block/zram/backend_zstd.c
@@ -76,6 +76,9 @@ static int zstd_setup_params(struct zcomp_params *params)
 	prm = zstd_get_cparams(params->level, PAGE_SIZE,
 			       params->dict_sz);
 
+	if (!params->dict || !params->dict_sz)
+		return 0;
+
 	zp->cdict = zstd_create_cdict_byreference(params->dict,
 						  params->dict_sz,
 						  prm,
-- 
2.56.0.385.gd3acb90ef8-goog

