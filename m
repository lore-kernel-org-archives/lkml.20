Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D04501F4E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794289; cv=none; b=DcmVx6hRXk3mhTFGM7hpeYbgygQVvIhRRZ98qseFOLqk/qCUmxGUd2WE7JscH/6nxinIXyhS7X9E8vQ7WQuIhqifJzuaCHU4sO27P4PSgnKiX18nf1GX7iEQvxz3s+2VgjvGV8I4iRkRlmmdzvcUe2HsRmKhQ76uiAlgpY87DjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794289; c=relaxed/simple;
	bh=va8ns/bBhpmYtLXNPiYEfLUAZMKLwaGubpO1KCldYUk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAJ9/ugpyiFzJq76kG4tetPsqPjMFEHNfxULdaKFy39z58p81icLMIoRNy/iqAmErqjPMd1uixn4CijCyr/Sr5jFc+/PFvcKh3z9US39sXw3040aiJJ1Au55N6NkhSbGr9UrDE5miEVD02Ogm5JF9VhSH8w1bXOSrc+ya2yCTss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=V22U7rax; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="V22U7rax"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6b1b766bf01so1517844eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788794287; x=1789399087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9+l4S9i2/odgsmU25aLrv/j0FQJOeyHwyvML57y2qNw=;
        b=V22U7raxB5IsMGZxib2SXg2+MAj9Ieisrxl9mjjzeoddV0b57yVAdkkX0VeZFBOPd2
         NzZP1rXjsHbohsSyy6J84cFPoppXezcO+wd0q0p3drNK8Ca63FhvlxCJ7AMg9X4MAhtZ
         q1qaKFUi3RYwgRGoOE3izgl9YjgxA83CPvs6ACx8DiomyDXtdxqXCLiDfXvzKv3zJLi7
         z9OHeli5eKAXjdazfENKu3BFZg817JnbaugLGgq4RN6qwm/25ke36/y0UBDKcFrmIF2C
         TsVJ0fXl3ej+cYarPoJHhukNk2awlnljdqAKSQP9KpQ2+gQydOlQ99UVEuDeqhuEr8JG
         nWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794287; x=1789399087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9+l4S9i2/odgsmU25aLrv/j0FQJOeyHwyvML57y2qNw=;
        b=r39kHFN8KCrlEhIRU4n976InALjD5t8UMP68GPkmz198fO9cNmVBecgxuflSY2GSjO
         rVe/VRkE36K/p3tPAmHP4+RqjOrOBOa9GyXfEUuQFAzrjTv1SuJXNb9mlEORwM4fq2WR
         TCD0//KLaxikNLbaWgKntcetEex1OdDD7Jjbp+Ojao0WmzksJW5ttOd4fIGVzj5sk6eX
         LxfGhEqE/9B0jK1xxncR+EPby2HyUXtVWTBDusv2U7CxsJigIvpuaHjWOxTINCVxQJwy
         5ZcrKmdJta7F0zB+j8omQNltvWhNDwR9omE6qfySJ4h4Drvo/7a7VkzIw22s/5wfUCfR
         FFOQ==
X-Forwarded-Encrypted: i=1; AKwUvByo+GZ+kqsCQXtTXix4P8Wp/Tv7bAZiHgMz9lJECqan1L/JtY60nDdkdHnLLGXzVlBQHfH0Y1OwVptyls4=@vger.kernel.org
X-Gm-Message-State: AFuF++lSPKuWKUTDqN6ZvjkoMp3Nd14PjU3mth4GVdeuv6WE9+MJ/jMX
	NrnMbFD5kGNVvDi70X4Ti47fNSBuWPWyKiQlJ8eqjXtpe/quY5KNtsRDtMcS2niV6xk=
X-Gm-Gg: AYBFou2lfFtC4bH7iIx+2tBK99aPV/81U1KhN5TqI9DayX3WgoX6V3z+MFD4orl1WkL
	P25Cu355DowPHGerUiXCTUO8vRNiUgSsXHnJHaRNO20oAqCohzS9hU3vSSVLjWULb5krt6WsfwE
	WqDK4ZhE84prmbZfIJ0bY3BveXkxCg2Xh80Sivmhi5AsCkH+q9Y2O3BStb93ij+1IMRK711Y0kv
	IXQ41n+Ycl/WH5dunHiuSzqOZthoL/Hrou9hJp2NHcGPdyAgAKP74fstB4Slkvf5iCeVXExB1Ln
	b1KAl5odCS9HMDsSuYMA8iQGPgF74rp3fDYktUqwkLL2EX0FWtZxmBCjL3cntMFgrYwpXFgJqpV
	Z7rC4DP9sTFMXQt0w1+L2UjSCFaQodCgtVo8XzPjUgH4cLC7RuWB10vTob/M9w9Q0Moa1MU4XY2
	Pu2RA9dLrd8dPnNqED4W5fY+VKTDIeHrLkQ8zbux1sreCcn3JveSxYgTiv3xHw3rJhBAxl97Oty
	e04IA==
X-Received: by 2002:a05:6820:2014:b0:6b7:8396:f3d8 with SMTP id 006d021491bc7-6b78396f894mr11053124eaf.58.1788794287156;
        Mon, 07 Sep 2026 08:18:07 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:9f74:2a4b:1c38:e2d8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm33474770c88.5.2026.09.07.08.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:18:06 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 07 Sep 2026 16:17:43 +0100
Subject: [PATCH v2 1/4] dma: dw: use designated initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-acpi-dma-v2-1-0ffe4a007992@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788794281; l=1594;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=va8ns/bBhpmYtLXNPiYEfLUAZMKLwaGubpO1KCldYUk=;
 b=TedocPl1NreIF92NrfJkqDUsjvEsPgxpyubESs8DTRbFl2CC9mhepRIdAzRhAo6g3W9NBuj1q
 76+8Ig50mOpD0kUrR3X3JUTL5YwCFkjht9NSZxEezIGieoocqZ2v9m+
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/dw/platform.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/dw/platform.c b/drivers/dma/dw/platform.c
index c63fa52036d7f..5c1c97eb28a4a 100644
--- a/drivers/dma/dw/platform.c
+++ b/drivers/dma/dw/platform.c
@@ -141,14 +141,14 @@ MODULE_DEVICE_TABLE(of, dw_dma_of_id_table);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id dw_dma_acpi_id_table[] = {
-	{ "INTL9C60", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "80862286", (kernel_ulong_t)&dw_dma_chip_pdata },
-	{ "808622C0", (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "INTL9C60", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "80862286", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
+	{ .id = "808622C0", .driver_data = (kernel_ulong_t)&dw_dma_chip_pdata },
 
 	/* Elkhart Lake iDMA 32-bit (PSE DMA) */
-	{ "80864BB4", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB5", (kernel_ulong_t)&xbar_chip_pdata },
-	{ "80864BB6", (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB4", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB5", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
+	{ .id = "80864BB6", .driver_data = (kernel_ulong_t)&xbar_chip_pdata },
 
 	{ }
 };

-- 
2.43.0

