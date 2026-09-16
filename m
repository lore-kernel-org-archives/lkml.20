Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7E13932F7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572487; cv=none; b=tOuD49ZyfnGYZccyP80Zo8XpIv8O9lRmHfmyvAglz4LneVAEQUaiYkRfgjUFTQ+uk14yhai4IEJwAKxlGH2e2+6u1FTwu+7FXeqZxIeUr8t8edscm/5pEuHN5LPmSwqRb8bFMZ4BkCNzKlqjXaRv7HyYuyjX/po5Ef/tmVdEvr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572487; c=relaxed/simple;
	bh=/JpbrBR+OVjJpbG1LD4MSanTICNv4h/sWdJw0dgCPcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nF2pcymEjfjIOWtJwWrRjRDB8gbMP5/Vf4q5bTo3XKXzKqD/GDJb6RzsPUbRErJCXiPohG7Qi3m+SskhBaOUHWmIb/ZZsHXRpsMSjaiuwjY0Fc7E7IKWn9CCHtQdfTRlD/d+AfTaXB/llSotpwZ6nvB5sJHeGqzH+oUKLt7D4tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=ey2bpWat; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="ey2bpWat"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so6091755e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572480; x=1790177280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=272OvMcHmohpZ1MgcLqkDT/DpXSmh2FGVJu3ZCPDf88=;
        b=ey2bpWatG3D6ewyK/3VWY/RpAA8CVpKHJHALVRbUaMVNEs3z04zPqPqe4Iu+0WTMWf
         NvUXQqm9fl07zyNxouWfNRshtbeJHDFqgfPwa0TJabuSPCvq8iVKnBm0HpZZgGsFb9Qz
         QRY65A2oJj5feU6sDC9rKyJRRsltI68T5NlDDlJE/oQOXhnfG1jjZURipTp/R7v/fcPS
         D8OoEOhtKD5YNlBoQKVTtFLLIZCoUGVz1qdR+gc86t2tTD3TasLLQ+i9jvdezpVk35/k
         NRWR1F6UF2p0oj8f2jN/1s1kJ6Mb+S8ods9PlvCwxwR1cuDum/QmhWBEks4tKyIZtUgZ
         t9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572480; x=1790177280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=272OvMcHmohpZ1MgcLqkDT/DpXSmh2FGVJu3ZCPDf88=;
        b=k2EhTQkkovC6mY0nvue0sLn0iGVNlz9OPJFZhX1BTuYOtWkuu5sc2+T0vTQSO/KR5t
         ACZlwa/nRKGY/03bHFUsST1PQ9kV5OKzda17fzcfkKONq8d+6ccK0/uJrs/juCJBR5Eu
         lHqXBqLeoohs9eCp+R4tSAt8zzfi87WZRD8R/GWtnnbe54DMaKnfSLt+bIju1nG0OAWc
         aoacdLX0tHUtYzDAX/f8x1FWUcwrpgWqIc7Zb09suf+tUwqK8KOIXOjKFtvRb2CvQN/5
         m2Xl5ZCiW2o77oA2q2T3JFVkA8ZdnGZhguFLbL8nsB9ZbroINNsNj8Ry2WnLW5Y8Jxzz
         +iGA==
X-Forwarded-Encrypted: i=1; AKwUvBz7UWSaADjLsOSamqaym3X3RR7BByngFrHVA/hxWzV8AZnNKfllgf+XvrcIKPJgDZxmz9CIQ1BkJGafjT4=@vger.kernel.org
X-Gm-Message-State: AFuF++mh3dtZ+3yfi8CeQBM0lUjC+JhkKGfR8tovFYmLkSORlzzniYra
	FHwg6CkuwcwyTM8KKOnB/H2pvZLBrB7bsI0ACR/DkovTM/Rx7be5HMB0Bu/2kJgLLME=
X-Gm-Gg: AYBFou0KvYp8jbcrVPad2lwjV+S+SsJ7uYvn3+eW6i3PrqxaLMD6aknxTVvFvDUyZQp
	CwIee1dkSyE6g0mfvu2mPLH4K+E6n5FKVYkrqchAh410tN3eaOjV1vdbqvXlG0cj3TbqqdhO5G1
	D0fNyYMNZtiNbk7Mx2vHUw+d17uPoBMahchETEjj0d4yp8uF2TXDeoSZMNzBbX22hLXN4cFwoH8
	bQ+Hlo0K6TtyadyywueCwFTSTiIwIVgZf+S+yg30p44ZdbnKhJOsA3lBKPG8/LZc74uHZp+MGI0
	ZaCdPTxl7tWh7E4FKdQmajx2ORRHLJjVmipU/1X3e87AicizNc0hIuHL496O/No9OKQCSASud15
	yPTNW8fOqv/grgFIhzqcq09IOc8gCa08JAO1QjYvkowPrywf7rczh98htiLnJzkygDk2lpYfbhT
	+eTeaj6QLL+r9GTnnSChQk1A4uOJkNRWWx2wdPcTKD4goZnQr74UqDGDWwDoz3xG2dQp760VJnq
	ieqVhDPwC0pIwk=
X-Received: by 2002:a05:600c:8011:b0:49c:ffe3:2b3f with SMTP id 5b1f17b1804b1-49eac45c233mr34194015e9.3.1789572480413;
        Wed, 16 Sep 2026 08:28:00 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:27:59 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:54 +0100
Subject: [PATCH v3 1/4] dmaengine: dw: use designated initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-1-0dac05654967@thegoodpenguin.co.uk>
References: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
In-Reply-To: <20260916-acpi-dma-v3-0-0dac05654967@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1636;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=/JpbrBR+OVjJpbG1LD4MSanTICNv4h/sWdJw0dgCPcI=;
 b=TI2PRLu+PWJwKb49U1K2vwZ2j85bEZfhXEHR8NJ+d63p/wSMy7K3t4wGWHCvZRvfhjdfwrpJj
 mt4OqQOoSpSBmb96hvLhHcQlKlhLNCaAB/spt580AE9pnNsSg/0wgfv
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which makes the code
more readable and consistent with how lists are initialized in the rest of
the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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

