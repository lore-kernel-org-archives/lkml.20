Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2393C553B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794295; cv=none; b=Erx9JhlsVta2NTUmkVX0wwAAbkIlrTXCqAnzb0qeWJSRrlIppPt/UO+HRSZCNNlx93Z+WqgL0sscMZE1OJ3208WymmeQJmIYUkwFsVNm5wWa/za1gOo7kYSe5MFiNvAwTlMT64YHdeH+xGMttmNdLgeh2aT+GkhBz/3RMEVK8GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794295; c=relaxed/simple;
	bh=fh4C/z0gOMcS2SxNxy2cC8TlLYkqOtVy2+16qwp+aMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CI8HPGb1j0y3675S5fnX1J2o1r/EFFbjN+N0oEiaxWL2kEkym1KrJg0W0AYFwMgGylNUPxY5HHvSMhmLqtXDoYX9Zex6tVNHJQGKUHv2v9+qggk5NplMIO7QD8J5Ajj4isXy7SR0UeURtrEPsAy1326Ly4GoxMRQdvSU5aZ64E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=eME5Hkm/; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="eME5Hkm/"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398e9698a70so3137164a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794293; x=1789399093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=;
        b=eME5Hkm/RBryDwHnhCIuHVbMPVfQuArZHHF0RlazoFeo7ywvJs1nnqLf311e3cudZS
         vIW3N9wAQVv7aXPaFJOudLEuIlAC5C+Ie6wS8QLCwuNbPWQCM5I9Ey726BF7Nj6r4rvq
         ldcAoEoasW5zrXgajl3foG1x5tzzuQJ5blVIeW3vjkNpryarNMWbahBGA4oQnSQLuXeH
         lQ2lx2J84clTZGk2kARplr8GtHdxJTiO6k1NAR4wAc6ZocjlVyuw1ElgtsGtff4feFCZ
         6x4+CbkN1E8zyqrJFelmeGzLPtwmhfmHQqdoKkGwGqBKRtSOLIHh8EaUFnA0UHnAYQBY
         DI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794293; x=1789399093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=;
        b=WdP46op1t8AxqEum8y0Yit9COuULHz/W8rX9dy3IYcfVYBY5THm/Kl09UyH8oH8zck
         tjcDei3v44XrJ2tDqSUpGaG/vqJbpnCjSvveLvkotmY5/N8YeLgr6Asdce2+XyiBY4pQ
         rjBmOE9HFagoRx8sKQLHqnFZwufKaB1olZ2N6tXmIkFK/F0YMz0MtPiFH82y1uDTja98
         +R4025fOCwvCdTbZaNAN1ACwvG6Zt5PuSVPxVUznPCGD9bnjLgE9DJ1oTPCA+EiuYZvz
         rQu0VzKEH+dU3B0ib47sGq9VxEqSayLyh46Er6D7kOS3TIuEaH0IEfgiibQ2MYz8GcH0
         Wwhg==
X-Forwarded-Encrypted: i=1; AKwUvBwnCU5aaequF1kAApvhjZihF0EqjkeuDLY7rP0LXGTAKMq9AzT0PNl6CB4cbSihMu6APW2witCVDHXy9xc=@vger.kernel.org
X-Gm-Message-State: AFuF++mohrRrqiLIF3tKZ3mnqOXGfvojDgqy8ploS1AsOO1R9ggORK++
	L4V1/xdgl2AD30Bl0ezyP9LNV0F2J9DEfIsTLsZIK9zUQNM74/UQ3Xpe1JlbIP7zPvA=
X-Gm-Gg: AYBFou3T3JQkr5lW520S9oGzzmXEeC6YWTjjdFV32IqPVfgw0Onq0U+hHiWB4zb4Kky
	AFxJVWJL4uuGE9q6N0ekkrwGWJ+Sy1mq/P2i+FpXPmtffq/jtUSYPWJxemZ/cHUB94WIdGudlYN
	RbEb8sFnhcbEiAdCM/ZOBjE+uL1xd0puNG7rkOGjeAVYL/VvdMmD2Yv62ItWBtffNkKxGBH5Hbf
	bVNvdv5nIkcukNgKjmZmgQawVFVZ1ceo+1VoumvVlyn8e6ImovQXIDMalrDlY6CORGn16CQuwqS
	+uh/fauibVNAUNrex5lBwaWhDgWGh1jei19hE/6+yEHopX/LYsauNMvhW4ta3gSn+6AN8hotHzZ
	Tp98dbTX78VPC2dxH3qgkflT3rG7qRm32miq+vYrAQ90i4B/Yb8LFChvMHx6lihC3Q7X3Q5TtMB
	KNIn61AySrWXtLAtGr0PCyaKwnOeQLxsA2OM4yUros9lYFt0EK3sLUMPZRNNwqFrbV9P41STUpP
	gyHredOohQ64skn
X-Received: by 2002:a17:90b:264e:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39b262e28cdmr37304540a91.22.1788794292966;
        Mon, 07 Sep 2026 08:18:12 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:12 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:45 +0100
Subject: [PATCH v2 3/4] dma: qcom: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-3-0ffe4a007992@thegoodpenguin.co.uk>
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
In-Reply-To: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1191;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=fh4C/z0gOMcS2SxNxy2cC8TlLYkqOtVy2+16qwp+aMQ=;
 b=lEzBJa92p79RXBpbg9r5dR33uOutrn5E0hxQ7UxPS98ZaD2IkJ4e/zkFY35j88BW8cf9ythBf
 J/jneLU7bDoDs7qzGYXOIFNTn627bmSfgSTZmlRaZKicK3+XFUoz2k/
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/qcom/hidma.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index c939635be21d..1349066b1544 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -935,10 +935,10 @@ static void hidma_remove(struct platform_device *pdev)
 
 #if IS_ENABLED(CONFIG_ACPI)
 static const struct acpi_device_id hidma_acpi_ids[] = {
-	{"QCOM8061"},
-	{"QCOM8062", HIDMA_MSI_CAP},
-	{"QCOM8063", (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP)},
-	{},
+	{ .id = "QCOM8061" },
+	{ .id = "QCOM8062", .driver_data = HIDMA_MSI_CAP },
+	{ .id = "QCOM8063", .driver_data = (HIDMA_MSI_CAP | HIDMA_IDENTITY_CAP) },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, hidma_acpi_ids);
 #endif

-- 
2.43.0

