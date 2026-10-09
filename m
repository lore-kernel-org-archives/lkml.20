Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D214E235D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552981; cv=none; b=G90Y5XyXvEqv3FhrJZdb7F+XlmAnSkIqmZkzYLeCyvxcEMXXnX87h0ReIAH+y0GpzA9Oyo2zzEP4jwwIDmd1XB9dPBf/D7Chvw7B5p0W2ic9OOdrX7z09zq8rsF6gvJfIiH8ZATXrAUiGARWqCm5h9CVEHtK1Os3RgtmM8u3xYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552981; c=relaxed/simple;
	bh=yscaSuQX7vQbTKa5pF3g8bzBr8g6/JaNcPuIEZ7nE+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=guSic9Npbc7ZbUq/se5NPQ3fL62RQgqZMm9FTZBonerzPTsPkRnqafaHYsw3uv5tMTFvC4Kfstc47IOY+h8XJHQTlp5+aC0YXXUFZ5K7yGMHasg+RGr0b1VxF5j/MAlp8G619UcP+KG67jD2JgUXuMAQSx+PZwiSwWxpGBEs0LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d560775ca2so20823845ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:36:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552978; x=1792157778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdmLeBaeUGBjvsy2RLz1gC8MpSCDdRWZzQOsdvN3xy8=;
        b=o2OHjgmbfBTl1NBXNxih096tE0B/0bOJuReeNCzAvEYBrNu5u+KyJQQFY0Oa0vtoNA
         R9gtuFRVU60+/FEseaC0YZ52+RHkwezWyHI98jx9oqPPSlqBOWoXCimsAgXaqMDp2tOn
         wlUd09x360ZiEAjjL3Rcm59zP66lN5djKC6MVOneQw9mDxokPhfD7iCavK5M1NmC2+4O
         ly7vzW/td/haAfpiA44ITdSMbcHlw94JQyLdF97OukL9tFI0fb/Fg9p6MLLXdxduu4gf
         jOb/xyRLGG8O7ePbD8A6h3dZyKNKZPnEDTgmt2+PAGom76PqO2olynw9J8UpKXgW1V30
         wEhw==
X-Forwarded-Encrypted: i=1; AKwUvBxrHbOCZSULPcyPFZiMPPc7TmaGeyR7aHNtBWXERwQVRcfJOfZT97ZIUM2ar0Z1uclSlpcR1zR44v0vzHw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJ0a7Pa+dDfWmWgoF3RuYLjxP86eejzdJS5YpLL3sZ2MpiJc3d
	G2jR7fYzLu4cTk1TAW9RhRQct/oPZmbvMSYFqujU4KsdxL6Vil9RpFb1
X-Gm-Gg: AYBFou2pUOmtYOAh6tq5OXvlsJvaPd0mh9A4jneMup7sY3XxZTlCdLDC7MO/n/XxYzr
	Cw1pZVFw0JTR0303izhFco6ldO3dlgSx5yf2i2DCFFz+B9BE2xVMWBkDscGtJVtw4f2Hr1+LEow
	QvWaU3SRZKzwi9Fhz6Tc/u0w5ZNKggG6DIgjgMg45HcEVJ8JDc6x9qHZG12jKNupP+slhs9Wr7B
	izlLNs9Dv4mCeeD0Ylo79AvFTXnz2jzgeg56z2fTou5qn40WTNm4amp5Na91s/eKiIgjjcQjvcN
	LPYpdKeoGcBtbGxD27v+W1CLz8a8VytfS8TPmRFNGgT1nQC7rdlH8ghMkauBpXtkBbB4bOkCAlq
	gfc34VB/nHZWHnj5tiCfb4RK5duPmI9EywhFEdyKU5wiyGam3YF2ueJ9qd9xHM2xpjY2RrgdjpD
	HCSOOyRCKbWXqndoxtYJGrReiXdrhhAjd41aLPncn8dq4UzsZCDchv9clh+E5/
X-Received: by 2002:a17:902:c946:b0:2e7:e73e:7091 with SMTP id d9443c01a7336-2e842bc6d99mr18201305ad.31.1791552978397;
        Fri, 09 Oct 2026 06:36:18 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8484c1641sm7656985ad.15.2026.10.09.06.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:36:18 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <code@aayushk.dev>
Subject: [PATCH 1/5] spi: butterfly: Use strscpy() instead of strcpy()
Date: Fri,  9 Oct 2026 19:06:05 +0530
Message-ID: <20261009133609.579046-2-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009133609.579046-1-code@aayushk.dev>
References: <20261009133609.579046-1-code@aayushk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a safer function strscpy() instead of strcpy() for copying to
arrays. Only idiomatic code replacement, and no functional changes.

Signed-off-by: Aayush Kumar <code@aayushk.dev>
---
 drivers/spi/spi-butterfly.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-butterfly.c b/drivers/spi/spi-butterfly.c
index 84eb454ed..5e1e205bb 100644
--- a/drivers/spi/spi-butterfly.c
+++ b/drivers/spi/spi-butterfly.c
@@ -259,7 +259,8 @@ static void butterfly_attach(struct parport *p)
 	 */
 
 	pp->info[0].max_speed_hz = 15 * 1000 * 1000;
-	strcpy(pp->info[0].modalias, "mtd_dataflash");
+	strscpy(pp->info[0].modalias, "mtd_dataflash",
+		sizeof(pp->info[0].modalias));
 	pp->info[0].platform_data = &flash;
 	pp->info[0].chip_select = 1;
 	pp->info[0].controller_data = pp;
-- 
2.56.0

