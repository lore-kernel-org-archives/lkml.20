Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C864AA001
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531060; cv=none; b=SrPbtQa8Twps0UReiJ+ia+ocOY0wgOlLnfd3xIIoszIDfrPPtFThj76zqcNC1XrQZZRvzIbcfRIv2uYR5LFMXVxyLEl7ce4SMrDlJSVCyMpl6iD/MBemauRRrHePSZsOGsEa+J+n6bAISxi/NGKyuVKRAKLACc+kGYZg/9VcKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531060; c=relaxed/simple;
	bh=aQFEA3y1X11okBv1IVhRwHPokxBF08MtJtdbM64IarA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbusZtuDftaf3eK04efvCnoiU/oM7awrduUU8YitUyBdc8aqEGPPumnMLus5pytI8ALWCJ19M4ZZRviO8g42tuc63gt3mJtyGO+Ro3VDAc+QU4I9Ff5z8LWEa6NAq28MO6cPLakal/g2YAHvlcV+GYUv/kESn7Hs0y32O30Cbmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=ypaBJMHp; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="ypaBJMHp"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b60bcf9051so949379e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531057; x=1789135857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6e/qZqWNu7/NIcUOvkEH6TkAX0V7d4LsbvVhn7euaQ=;
        b=ypaBJMHp1XDOANgmjvC4oC9qR6VUJ+ncHk0Cty0ie3gYgRFoGTh8SAa4b8nU7phhby
         QLEnRDscPNsS0TOsdPe3/ijnpkTNuYN9OquoEghkPxzVrKIh8sfF3ccLit2tPqZoE8d1
         IyFOoyDTnm0w7lyIWCRnIt7FNv19MtxWQ5N+qu0tCZJo8aWTdNfXqKuDiXNVxN3joPVE
         jil38YmTVkRra0v+zVjFcht0qluIqd0DzuRByMyVsFlsnz9VxpRmpFswBeorYbJgIY4p
         WO6H4JMelAwcYVpb5BQNW/kaV8rAFWPL35TSZou33hGtOceOivxx3NOpEb+W1J8rqc7k
         nl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531057; x=1789135857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K6e/qZqWNu7/NIcUOvkEH6TkAX0V7d4LsbvVhn7euaQ=;
        b=kXnT3PBnL+X+nqnxdk5t94Vc1piilukw3UWm4f/4aQX6TNWz8sBCemfmxUb/5VG3hF
         sLfJ8F+kObqg8FCLwRXozilNVXAjchgezOjpQtuv27/TJSwRd19oLJ6Y7RNq4OSCFlP+
         nFhsA/CYWt4H+waSYK0x11hu96bcMxq85w1LGyuv4Wxbv812rbfYaQOPhmpa58nEJHLE
         i+313R2Phv5TG7H1+ZRmwHKIELJ1U+sPxxrgUFVs0MtbrCxCf4V4RSiSbFFWS3K+FYcJ
         NfArjb8YHGYS44VuWfWXERG0fxVG7I0A1DohsIcXpoQMvT7hYCbh+U/TItFUvuVyJSzp
         /0dA==
X-Forwarded-Encrypted: i=1; AKwUvBy6raRj/S4KnQxQL0gSn3TwXBfg0weFf2BhNchm2dW6EQDVtkNmmfr2+oqnp6MrqY1nHa1ByHKK5uU/soM=@vger.kernel.org
X-Gm-Message-State: AFuF++nCXWlCj3x1HeNoPfnkf93ciUvJZLFeDEBnWpR4kGgjY3mwJUfk
	71QsfAfAv8IKMX2JfgjGe9QNqJgoMJ6SgkamTFRtTgPS5KYAbx3I+PJFLagrHoStZ9o5/4bTzRs
	Xviyt
X-Gm-Gg: AYBFou15UsZKyRXBFf33fLCCMLHbv9jkN2yypEORROdKzLLL7O8lDL/cJD/x/DgXn27
	+sFmSvBFSEdYeqI2Mjfhans1oGCvK14wEVPimkDnkoYrXORmEwlxwJYjvGPfNWk1xzQSmTmXiPv
	cXmjeYkUGJpgLdKBnNDELQph/yuIRRAYS7oMJ73ZgxmTLIifBQW6LktMiNvjUR9+u7TOuYq34uc
	kV4lI64d4qmpbIqpAv4CnsWOh8NXCHL9Jdn8eDzEgU+9oIZ4ex+VGCoB/Hqy/vC994k0KduH4GV
	AszEuH60Z7mqp7vnkn3XNx0jiShYI8s2yyucdoWRRzFup1CvoSBVkd8PUBe/H+EJoNkm5Qu6DMy
	LE44SPx8DYlKjgfZ/5BibeQS3FRsAnUiFhNd3o2dZxlHUw17HKo7zYoeX3da6lvWBxrI/HqIc0x
	/yR00OtqmtfgMdvBvMLVzE7H/wZLAvXJQrk3qC8B95kCsAoGdSH++nmM/H3VU2nRr7/miP3gjT1
	5cZ9w==
X-Received: by 2002:a05:600c:8b11:b0:49c:edfe:d525 with SMTP id 5b1f17b1804b1-49cf82417f7mr123193155e9.10.1788531046019;
        Fri, 04 Sep 2026 07:10:46 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:45 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:40 +0100
Subject: [PATCH 1/4] dma: dw: use designated initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-1-0fcc63d65d4b@thegoodpenguin.co.uk>
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
In-Reply-To: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=1528;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=aQFEA3y1X11okBv1IVhRwHPokxBF08MtJtdbM64IarA=;
 b=tyyOQHQxn3xZTIwpXhIMj6SJta67xRTd+ISo1iTYGpKgjWvUuVu1brMOnuUK8WgtSIWS8O4K8
 lKUl70Fitp4BMp1y7eYgsmIfq9Ht+bjFbiM1Jh4heAF8v9mXQ/WDsNm
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which
makes the code more readable and consistent with how lists
are initialized in the rest of the kernel code base.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
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

