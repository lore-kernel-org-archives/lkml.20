Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F86351D514
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790679050; cv=none; b=sxWNV8jcSSNN3szVEg4JajYWhG0RoPNpoCfPaz2rrBMeWXzhKks+PwYu6P/FPOF9ApJJNj2IQlhLxqoe5ehNdeP+JsRfWspXgqZBtiXCowHeQ6V5wLpO1Topul/fGVPgIhP3D43+Gr1XQJE3c8ZqDCK115PcY/tB7xZKB9bP7iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790679050; c=relaxed/simple;
	bh=OVUnuKw1VfCIL/x+Su3R5aFMSSrygI/xzkVcJpV45Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QrrQv7PbU6SZDeCn1NU+v9a4X5Gwa1ek8lt+wTgZnDmzDUkJxrtXwzGg/qlqN1rHIPOqe/1GH1A6WGY+mj2wMYfPR5ZBQ50vaC53mhSSDmEqkM6/LIZOlgj95KbBImmjkG3ft1QcoBymLvFCcQkCnt62ox0LjKvT44UP8J27vss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQDlseh/; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQDlseh/"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4888129c46eso2256557f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790679038; x=1791283838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vs/A5b9nR+JVsXJC9eeh3ISdiCZQozid18OwQ5Bg02U=;
        b=KQDlseh/uVbz8y5rI7OG4y7TbD0mCqR8rBXZ1KfsBM9HOEmdN8ZZHrZG6WAVV9CdBS
         dwYcWr5Ds7zUHpQ9J9+ySkM3r8T+FVB9qYgNW0VVS/s7DqfW8eU3rxX1KPOibOU3B2F8
         EYHgOrF8d+s1ShKoR/jTIQaJ4ysaBSlJ9caFMfHoALHz7Lb5oo8tUxaG2MU/yn0JxCD1
         xjv8xjE+KVHCzPMh5+heE3u2WiiR+ibKMXZNd9LTG0C195JizkoU54545fhwLTFLu24D
         O96DdzonON2mYEkpXdj5UMSlj1CagaE5ZJgslGJ8x29gfhGNx5i93Bv/PQo1CMfuz76r
         IJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790679038; x=1791283838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vs/A5b9nR+JVsXJC9eeh3ISdiCZQozid18OwQ5Bg02U=;
        b=24PiQ80hh/O22wPKFxDzTAAHru0kHnPDCLuz87A/oFu7OeWr0ujVoOgUe5eqrOVBQI
         O9u8UV107iVT4m9PQROlnZnhbCI3p524Tldaci0wVu9DT6sljbnwPv7DOsZaRBbxxqKP
         NXNwMmibIqfDmqX5lC2wgbMqHykrX9RIsIqXh5+03gKwp6N6rlgZp29thfT8F0N7olit
         sXseazXFPmAC3YvLRCjAH3eDJMflMigRKCzfvjD1p6WZrZ8AzYhBt2o9QyRmUXhZwkPg
         Cuyv9otXNjd0uUbulOtpJhCzxszsP00eAWNm29NvyIFz23Dv2ttkfLz0yJ8JbNJbyyZ3
         hu5Q==
X-Forwarded-Encrypted: i=1; AKwUvBx9wzQWgV3VhzUMqS3vrC80ySGgt0lO/3Bb39p3SBxcxZ/kFUR/vLywjawfPD+VLaldaZ45Qr6l4hP9Jbo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbkFJwHSi3qhup/ZvEUfAbVhuOLAawFZ+tYL0U647JlfwS3tgU
	G8uOz750jKpxVvBrdiHwMcQso3x5go42Bfg/xL0J/eJExYtdg+zh5GqM
X-Gm-Gg: AYBFou26fadKBhB70aC7KjOx6YXjxGB5LHjhdJYpYJJWH8Z7sg6cOujxICdXZPsbCY2
	KSYj+wQvOVCUoCv2a30jjjg632eF5MYiQi4R0Lrs5S2g8LjSaP041JaizAnYx/dDjrv5xrCy1KD
	2Os611S4d3LFuv1O0F/KOp2IAgL5EWaYK9Qa2Z6Xxqt8E9QVURgDaGb36cYl1KVtDsOs9BjHRmf
	mtcmGQU30bgnZNcT2XL0vgbXXQWN20tT+EidefUNIirVFn4Rg99n8/RirqNFpTcgfgnZqIh7rlE
	cMf5UJO4dJv/BZO1Wwrk56uVwS4fSSvGK+xRcV2fbLkzK8AwVzXRIikSYqXZQZ7Fr4l7NPM6FgG
	ZRnFNVMhOi8JJ8cQBeXcQ5wWu6kalPC0THxz0UjH1g+LvpXbzDvLyp18y1faWOXVYfeBGUf9S1v
	1+9kdOBz1nbGe0U2qsVCVTWkbQVdle+qP1hLr2ndkXmcoZp/W/tfeQLpkjbsZpx+e45yRqNIzFj
	4wM1CMg6MlXzUkxCEKm14jwvBCf8HLp6v9X9P+CF5GEZADOsqbPpIiEq6K5Fuk620KpLq/JDqKq
	DyDdbaWbFj3qNlQUtA==
X-Received: by 2002:a05:6000:402a:b0:488:89ed:4430 with SMTP id ffacd0b85a97d-48889ed459dmr17158130f8f.33.1790679037535;
        Tue, 29 Sep 2026 03:50:37 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:10d5:21e1:1aae:c9d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5058c52sm3516303f8f.19.2026.09.29.03.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:50:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v7 2/8] watchdog: rzv2h: Use pm_runtime_put_sync()
Date: Tue, 29 Sep 2026 11:50:15 +0100
Message-ID: <20260929105021.542730-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929105021.542730-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

pm_runtime_put() may trigger the idle check after pm_runtime_disable()
is run as part of devm_pm_runtime_enable()'s cleanup action, leaving
runtime PM active.

Use pm_runtime_put_sync() to ensure the idle check runs synchronously.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v6->v7:
- No change

v5->v6:
- Used pm_runtime_put_sync() in rzv2h_wdt_stop() function.

v4->v5:
- New patch
---
 drivers/watchdog/rzv2h_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index a8db85e85c73..f247e42d54f5 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -175,7 +175,7 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 	if (priv->of_data->wdtdcr)
 		rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(wdev->parent);
+	pm_runtime_put_sync(wdev->parent);
 
 	return 0;
 }
@@ -269,7 +269,7 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	pm_runtime_put(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
 
 	return 0;
 }
-- 
2.55.0

