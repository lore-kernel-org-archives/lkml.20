Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA573AF674
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621317; cv=none; b=ew83kqz982p7m4OTC9kAdBquieCoFCwiG8VKkWaw2hLomA1JqDOBrCRg5r7XojVrfyl0zfSVMqFwvKfpv/AtOIf9BCotkBSm7VVskPZTBEeo60fcx58JdCAAo8El9QExMDmQ6BIg9mBIFk/Ef8Qzsfuhek2sRbv0YPYDsgrCLgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621317; c=relaxed/simple;
	bh=UXN9VOFvMq7+7VebCjYri7BEGJJ1i9z2lzXas/g8iW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CuS11hSPRLTln+k7R1ynEUd+TIn4lxtpxoyRbxeh1DF9B12ORCZcYA/JmIqlnwbskmLT/rOXRYeGkjjtRCv9J3FVQklGMESf2mAgl2pkeGCm3TG7jsY3/bz6hhB4UkPbRkzh/8V/aybtzX43IavxwiiGpGbyOO9WIksxSdhynGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-351767ef18cso1464607eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:35:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791621315; x=1792226115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfwL6+ph0bSPFTbhiSeYF7NW6xzqMXdnkaVOG+wTVF4=;
        b=LPITnV47fWMW8ie+6FcIDppfZRRgilM97MRoFEwRLrwL/tuh/7b6f5pYsgv6rWgqLE
         Vbf8LW4hC37AK2+oM8TmOBaef04egYRZHw7RvzY7U8xsNspm8Zoa/klyufUN5bYyR98I
         ibHG/DxtEFZhNWgdPEhXmoSlGXZfwL5laisyHVaDt3JedbyrgzfL1nYhx3eBM/+r36xP
         P6CNkAGtI1FmT/Oc5UFkYJP6zxTvCKomJQ4GHrPrPQUgMwjGMcruVEjqVb99bm/H6/1H
         Mz88svUAE7zSiix5J57bQ/S2jj2xQJKn6BKNB1dA8hwW10ypMPjz6Kj9pfl6FcJDe2Vb
         Q3ew==
X-Forwarded-Encrypted: i=1; AKwUvBzLIv+DnJheoQjKqjiWMt4F2B1LBX44UuQCDNIyyLkU4EQf9uqRZcLpSlpKAWoSsupulxEMdJeERik08J0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSOfJ9Xuk/iTpNLsTv4x2HYvDrpbx2SsWSSevRKVN2+ki44zSx
	QQKukxz+xgeCI40B0Utb1dxOwnGHesQFRv8JJXydI2ilOk3WyPYpFxlk
X-Gm-Gg: AYBFou1sPO85NXxEsXqB7GdyWSI6mIqkcneDg0I65v5+4yCndQlzJoPus8c+rUyjiTx
	ZXbz3OWOx9y84My7ykvomdn4BvHu9p/sj3VvXW6XMmqjrSpBnyl9E0J7M54cKtfKy61Nf/qkgiB
	hSWt2z4qNMsoT8fZeAKsH3SIt7dVjmd1j5+EZAdnEIHQ+kDyzBKPHuui8CPHhXx0OprHru5f9Yx
	fb/l++Fjo5fTpep7Uk0QQsBwzT69NEVPtK+AcWvyhvGDMqlGrub0S5SuOJymsSKinkM1B5fzjHn
	Tay3quF4TjK6D4YTZk5N/VxPYGoz3yUBvDxJSV2K/Yqa71sQ5iiETfKPfxlABU3MTp9ohf7OFov
	+8UhDlZiJn65fEK8ghhXA7gvgj4FUHnIRFwJin8Vgj5wbg1DwaBJUNoXD+GPqIeUC75WP6cwWA0
	Fh9G4vOxGPtMnHmTk+4Vs2ETlRcNFAdu/W2bdupcrztYyyueLaNuDcsM3322kIHH8JD0E9w3U=
X-Received: by 2002:a05:7301:9f0e:b0:353:417e:aad3 with SMTP id 5a478bee46e88-3537e069fa1mr7792003eec.33.1791621314998;
        Sat, 10 Oct 2026 01:35:14 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm12689858eec.4.2026.10.10.01.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 01:35:14 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: Mark Brown <broonie@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <aayushkmx@gmail.com>
Subject: [PATCH v2 1/3] spi: tle62x0: Use kstrtoul() instead of simple_strtoul()
Date: Sat, 10 Oct 2026 14:05:02 +0530
Message-ID: <20261010083504.26261-2-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010083504.26261-1-code@aayushk.dev>
References: <20261010083504.26261-1-code@aayushk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aayush Kumar <aayushkmx@gmail.com>

Use the recommended kstrtoul() instead of the deprecated
simple_strtoul(). Check the return value and reject invalid values.

Signed-off-by: Aayush Kumar <aayushkmx@gmail.com>
---
 drivers/spi/spi-tle62x0.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-tle62x0.c b/drivers/spi/spi-tle62x0.c
index dd8bfb3f3..986d78ab4 100644
--- a/drivers/spi/spi-tle62x0.c
+++ b/drivers/spi/spi-tle62x0.c
@@ -151,10 +151,10 @@ static ssize_t tle62x0_gpio_store(struct device *dev,
 	struct tle62x0_state *st = dev_get_drvdata(dev);
 	int gpio_num = to_gpio_num(attr);
 	unsigned long val;
-	char *endp;
+	int ret;
 
-	val = simple_strtoul(buf, &endp, 0);
-	if (buf == endp)
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
 		return -EINVAL;
 
 	dev_dbg(dev, "setting gpio %d to %ld\n", gpio_num, val);
-- 
2.56.0

