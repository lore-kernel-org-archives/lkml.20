Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125BA51476D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572489; cv=none; b=rny5H57F+f0fCiInwyS2TB0qe/6pSTWG6/ldmRbyuyx/Tjif+46VsSsNtpioNYTACPkvUJFDeniL6xlvNQStxHUIeOTxo2eUMUN5yvHgCfxCDEk5nn4S9SkiqwWcjUGzZN/qof3zowP/qMWy6pZd0TmsP5FPtvXuBmohkWKLO8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572489; c=relaxed/simple;
	bh=mcQe2swm15Nmq8Y4i0Yhh/Z95MEtTy60FNwFlQB0qyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WiozmKLz4s2CDWQoA1+GScrfR7v9RLsFM9i1YLc7gbCcR9L+CuPiU7kHrsT9Kj2X9eO3QGa3XvMJ52Gf6MwOkUF4YcSNwEJAYyFl/FuYa3Ts1Q3DJvYlZfZT6++ANuE7iJiXMjwM3pMPKw0+MgoKsB2hRdNZeef7rE0646P3iJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=nEMottUS; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="nEMottUS"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cc7ab1so439972f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572481; x=1790177281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=nEMottUS/2of7FwGantLzGAw7/e4uhpb8PC5byzmMcX7WMXFfaP5szv5HJtKrYeD4k
         iihxm2XskTpCBLT5+AmTa6IbAEzDJfj9/4unC6LZrtd/SDx4+/zv9Q0oag1fslT7vboa
         e8oUDgBX4SZUra6AT+XNCV/QUYSRCISLUEytLHoSZBaPvAUu/r0kmOmC0uiX2YmRke78
         vVkPllXQDCz46oolRMDimck+zeeVOGrFuQGdw7/I3zeZCstkf78kTV4AYCECKovXQm0d
         gQ/M5/1lX5m/WEx0qphIzHZu5t1apsMVIihhCPCKVbgkUISAeR98eGARH77LrY21Mqd3
         J7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572481; x=1790177281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/+QTxJeld428JJetLUQ3w0n69IV3ON69coAVWlYDS8=;
        b=I4oF5MQPJEFteZiJQ3L73JBXdW5NK8xpdlH/6HwCf65mYzWyX24B/zl84nkdUH90Rn
         WBx5Mn3rlv3mJlFKy4k/wnHAetdox0IHQ1cwyWx1eIPwXjM5FngArqdymDaGLQyVcDGB
         2Xa8/Rh6pOuk/MiPX/l40My9sy0o3XmIwvCh8zEW4kBPUw2kp3v++Xxlrr2HBFsGXML8
         aM6d5JIwLKeqBY+DNoo6kKyMp/R2s5pHmyUFFHmwrdLeRKZnxed9bn9TP5GdUK2ihdsl
         5rsPoBRDOs8IXZvaLwZE6FdiIlOiB49/Dto4Oj32790sfrrXAKS6o/gmDvWjDwm2BIfd
         f0XA==
X-Forwarded-Encrypted: i=1; AKwUvBw4+6BEj5jF+muYu/3go4VjUCxSWl3j8m/IJoRHuSIzqi91W83QhR/oW7ptQHaQmZYuSnPkRWb5y17tkJI=@vger.kernel.org
X-Gm-Message-State: AFuF++nKr2t+OQoDP8Gp/wNVYwKqXu86GZ2JgkGE/9QQIYSyJ2yWN/8Z
	ojICJKTK1hpw4Si1dQ3BfX4UZbEaCE+hlPfTtrdrHCHFPaGN1HSHatYTFm8lzqzK4YE=
X-Gm-Gg: AYBFou1OaBysEHa8JQHJVRHHjM+AdSWoNWy9iG8YxBVKjGFPWzVcUgdsdHT16AOBwlC
	EfisvKI3uR7pIqgGd5EtlKy9J2lcJ5CG6DiqynNNku6g3luDeaZODUxRGwSvq69kHTgBs9j5SXB
	t2bp/Sf/TpLJfIP+jPOyjF0VWYsTFMftt0o8xosypna5JxatWzoE6RveDt1UWY0ykb3hqnstmJk
	1ffVgHP7scL65DUnsJTFsTg+PaS655hT9SU6QYGXRWmZeahPurO436QFz08X4aI2eD1aUhhk7zG
	uz0RyurmicXWRuEDmp7VEN4FufKg8gEw/1yoPjbukJL7UWvJFLoCIzbxaqzuYsEjkt6hB+bUpnm
	S6hjog3D4TOrwNS0LoqNddeo1Jkg8m/gqMTxybCtSeCqmzKz5deMsJQ5iZ/tH0fFCarGqYDLXJa
	RdcIYHerxBkBVVFSLRR4fKgMYrXoA63F4KhY9DWrJAAu0OwrRWolniBrm6S+XZ6VTU2d5MG5mD3
	b3j9Zkeg3X4+2c=
X-Received: by 2002:a05:6000:4690:b0:487:d2e:144a with SMTP id ffacd0b85a97d-4870d2e14damr2660370f8f.4.1789572481423;
        Wed, 16 Sep 2026 08:28:01 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:28:00 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:55 +0100
Subject: [PATCH v3 2/4] dmaengine: loongson: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-2-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1307;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=mcQe2swm15Nmq8Y4i0Yhh/Z95MEtTy60FNwFlQB0qyY=;
 b=mCAMVQGsOjrzZnlE1KDLWefw6z2YDoXVc9+9UX4SNJa9SUb7C+WIzubLJibyTbBdmwrLp9uRR
 BUqsHUJnqkiCke3WPg7G/XSghdGEVnHkp6NzQewgkYj4D37bFTu/4N1
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/loongson/loongson2-apb-cmc-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index 1c9a542edc859..70880625c6e92 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -709,8 +709,8 @@ static const struct of_device_id loongson2_cmc_dma_of_match[] = {
 MODULE_DEVICE_TABLE(of, loongson2_cmc_dma_of_match);
 
 static const struct acpi_device_id loongson2_cmc_dma_acpi_match[] = {
-	{ "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
-	{ /* sentinel */ }
+	{ .id = "LOON0014", .driver_data = (kernel_ulong_t)&ls2k3000_cmc_dma_config },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, loongson2_cmc_dma_acpi_match);
 

-- 
2.43.0

