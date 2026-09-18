Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA22F37A822
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707670; cv=none; b=V/vsa4BaOXqbdjbixPv1d2Y9DOsXyHeG0UhTgAcRpEc67wyZxXjHPDvDRsKh3+b5vKgoi7DVWkoOvLg1hoQ84gfWr8P7P5gTIM0aX8wKAvD7YvOdFwqsbQROnZb3NNlq63If+2ownQAMbjAamzuhLfXU1LsQpUyaXzt1BKo1tG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707670; c=relaxed/simple;
	bh=vLKslen7PBG3nSXhKe3ByGeSxA0QEtveFGGqGO5IELs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q+PSGnLkAA4vzEVMwa1PEejkcJFLihCzZeoYGXs/G57R648IljYrIjutHB9t/nXTvRC5JmX/BR82pkjqJhM2c3kNISJo0/7gqfsGD26mvF7AQ4xIChDkn3Bv6I365xTZ/D7cy/Msr63NBktEDBLtKR0GjvSwXXm5F8CERxI/mMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iZ+XPbyH; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iZ+XPbyH"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86212a185dcso406479b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789707668; x=1790312468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2PEaByhKxlg2O+w66oiofCngOTmz8xzHYd1tomOchxY=;
        b=iZ+XPbyHcwvl2IXnDQdTCMOA86Tu0bhFLGQYGXSlK/d5kOEFQND1AJ0SUhUJbdUqtT
         F8MH81ucTtwVGyCJKk7h2lakfXGICclBYS3Yy16Wu2yRBGtrtdPye12HAt6xHxvWmgyl
         oeim8EX+sNhQubNXnbHZ/VM1aMhOpi+PUFhMUHMF4fFn1mMRFKWUe5LB+FKz5kEKM74a
         Jja9g0Ata0lZA1XrnKZ23MAUyhdj8XZl2NoK1Z1NWpqCFDqmX8XW3O4+GOM33ieC+9+5
         52LZL/m3BxYex7V9uwpb3GUvqCQAz2+jSEmNQ6ilopmK4bLvrpW65nTlPF4ziJy6DnpL
         iQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789707668; x=1790312468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PEaByhKxlg2O+w66oiofCngOTmz8xzHYd1tomOchxY=;
        b=nLgwGuUHARJkVK9AwuktEz3dl98jRCfLI2NVv+R1cDN5vh/Pj+3g8jhq/jb1dGGDFr
         ivLzIAsixYXErtSRzThiLTFDUUvt0LN0K89mTyGV5zjzN0W4yzAuNsXlY/h/QR6FkoBc
         jJnceUXXv62wzuuPl4ojXgel4Wb5sfB0Q3YO3wSn00YYpQk3IOkQ/cQEQW7JWWhdKp3r
         9mlT5qYwB2aVlwuLUTA3UIPR9VbhDqsZ0bDsu3iLnTK8C+yWwDks3ACYz5z6jg5qgyMI
         2UF3LukftoikSwpnd+gqSvyeEz0EbSkjvwLxKa5Ykk1T3jWziY1kDa61wPMLh10nu4Y0
         iYxA==
X-Forwarded-Encrypted: i=1; AKwUvBw9e1xOcg9caB8qaFvmrtr/yU74qLhKykg/roAx5PH8UbvAc3eL1xC6sPbEBS5S2NVAkB4rTpqr2Z6chTQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kXe6PRI/4MitUxGzlUu76fwRWhRwsjEcXBbklk3INuh8tCI6hj
	d8QUvaTzqOvRJR1HnxxEf/7HW/KSV2aEvTRnsUcBuRDf6mfjpSi04V2z
X-Gm-Gg: AYBFou1j08HHbdgwiEKbotqHlYfioj0Mfw/eDDvfxSoNvjZlid1KGz4EiGWctfnoYEC
	80+DXGWMFsSJIoxxIAv0VhZH/8kKub399sXGW3wy/+0dL1w/8NxLNCGNHdlAX8zsMVR8p0Zu75W
	1R5he2mRYG1xzegddVyn2Qq2KNiN2Q7qMcQDztXDbLsBVe9ShBPm5ysqpYziY09tRQsRDgaNBVI
	DU6TY8ICTAtne1SRGTiRB1wtyZTegKOvR1H29p+z9Np/x6WUMYGBmdem4Z0D2zjgJa/UGpRfMY+
	98KPY4mIpNGysfaUIuug+VCxmHVSUg04cpPyewkY0zEUk3fB3mMBH6BDFTfmhMpHKI4WgAWqbpe
	7Du5xQExdGeMIpQ4wLsFVDgdo8sXVSbyYBGsH3I/G8xXJdvyLRjNUQQLWum+L8aBv3RQ+RTnATY
	ZR8EakPSWbryEtARf3ARnGzX2wnBQZutyVW+73idT354sNndmhlQAChcCr2ZJdf63E3HElxmNRa
	dgNLbBgmoVRQOCeblq3VaF8Xdp8rGkvz4y8R+b8mS3V/JUY/7bo6HB5QEETRLw/1tmeOa31q8uh
	Z+Ixludm+Z1a4L0=
X-Received: by 2002:a05:6a00:1da2:b0:857:726d:270c with SMTP id d2e1a72fcca58-874de8faa1dmr2970590b3a.24.1789707668021;
        Thu, 17 Sep 2026 22:01:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8fa6acsm215958b3a.13.2026.09.17.22.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 22:01:07 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] clk: starfive: jh7110-isp: fix pm_runtime error handling
Date: Fri, 18 Sep 2026 12:00:51 +0700
Message-ID: <20260918050051.14986-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

pm_runtime_get_sync() leaves the runtime PM usage counter incremented even
when it fails, but the error path in jh7110_ispcrg_probe() does not call
pm_runtime_put_noidle() to balance it, leaking a reference each time
resume fails.

Use pm_runtime_resume_and_get() instead, which automatically drops the
usage counter on failure, fixing the leak.

Also disable runtime PM before returning from the error path to balance
the pm_runtime_enable() call.

Fixes: 81279f5d0812 ("clk: starfive: Add StarFive JH7110 Image-Signal-Process clock driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-isp.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-isp.c b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
index f3fa069db193..860c9ec897e8 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-isp.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-isp.c
@@ -130,9 +130,11 @@ static int jh7110_ispcrg_probe(struct platform_device *pdev)
 
 	/* enable power domain and clocks */
 	pm_runtime_enable(priv->dev);
-	ret = pm_runtime_get_sync(priv->dev);
-	if (ret < 0)
+	ret = pm_runtime_resume_and_get(priv->dev);
+	if (ret < 0) {
+		pm_runtime_disable(priv->dev);
 		return dev_err_probe(priv->dev, ret, "failed to turn on power\n");
+	}
 
 	ret = jh7110_isp_top_rst_init(priv);
 	if (ret)
-- 
2.43.0

