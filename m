Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB5A523781
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572489; cv=none; b=VFD2pFhIz1Ex4/qYyM8hnmkbSZfEFzEPFFRKfZl98H40/hIHB3wQmsu8XKmxw3zjgixWzhv0VixA2mlpetEkKCffrOEZSTLjHmQqcvkVqw4Tx3129pxsGWVM57ZAu1cdMd7CUFFuMLaJ3+bfHBnLVky6NufglOh26nRABpjcQ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572489; c=relaxed/simple;
	bh=fh4C/z0gOMcS2SxNxy2cC8TlLYkqOtVy2+16qwp+aMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eg+ItLfZhsJRePhm6v1qloNr0Ym7TF02bTQ7wt0YBSS6R5h/keatXgU8joKvX0wB6rMbnFaHbSSEcebYDLlPIgne418IbZuSQ2qhM/wEEyDSfeDpM0ro+RwBF6U12v0iiHlkgAz7MSHczbqtk+8dbvhn20WIGrZuzX1APgnGS/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=yYxo/qIr; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="yYxo/qIr"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4858bc96fabso772762f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572483; x=1790177283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=;
        b=yYxo/qIr/y9irKQA/QuKts85tjgCEpyHa5xe/+EqFxB8MfiQ4zriov3x3QtKI4YhWZ
         TNO4cV9T0LYVXAPIgirdwPOhQlaKRJ6VZa0HvQFo7ycltG/ZZoyzQx11euSEVpGqWowS
         tANoXe9VqqVys3G2pwxcLbapShE4q5464An5H3WMahWzH7RAV9Zhy6tw9ujX/XITZidO
         +Zd8vk4P7RAy6KiCpd1+l/b+7Ac1JOwKbVCM7dg8MbwBdcalFcCdNLTjZFFqi3iaqNBK
         5F1Y2vDJBIKzVdpRmkiTvc0Unaan5F5s7Hl2ASBcPb/A7H3LH2pCV4a30icGmCcnPTTI
         GJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572483; x=1790177283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvKdQrCWkYxqdOjbu2Fib0GGvdK3uXcjnoDDmIYN5Pg=;
        b=Qqx5ZOKQHiu/ZzOZNQA7pfvNv9bw+PefF2vlPuTX5D6yOAmUCExhh9fVdeY6flHTHD
         An+cPms1Hpr7pU4CK6NmtYgzJmZ4z3tOFRi465HIXP4n4xcmoAx/aAcMrKF1joYVcHge
         mZpDbtRtWtHZR2S3HRu3ycQvqAZdbfaE6k8ruAk49qajnnt24jL8D/5vKp2GNnoOOj7y
         fg7ZBuKXOscJAqyInUZKUbCgoI4Tc7cHcLhfbHUqz27SyeNvLgYPbYmlF3SUCqLLX7Si
         eLySq1W+YOEqqa+HEWkjGGho8yk58jg5oclOZUIrlYZaHVnxBIT3jDR1HMVsXjx7pEpk
         ipgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZbG50mynnFXHnsmhPJH0Jo+U/d9pVXcQVY3EHFwuVkOE5uFt40OGtLY+4SXRDw5pPrnYPoCgg3UGYRuI=@vger.kernel.org
X-Gm-Message-State: AFuF++kNc1dUxjOVSwaat7SRlCIopNXaoRPStfQmtePkPmQ5OU02dLHQ
	0sTYI5j5wzazUTq5ovgNonDQnHKNnC1hp2Mz57OPCP/AY9oP/SVq3bw5sBSrnR/co+EwOkVbXki
	NKqwzZh9PgA==
X-Gm-Gg: AYBFou1Um6Qhf/YDbToWBP5ZP6oAk7uM725ORKgI3PnKcTqUkz4viNZYZwfJ5oY2uo0
	NsnjGSQDfUF6Wjx4x/WgAe8SkEv4Xprkqb1IgIjMl/C5bcvmDqPmgcOT3XIE68kYTlO8UC8A/85
	eX1NRPn5PeHMthLibEu/5jqLEXTF7wWtG67zFpHahIX0uiaMnJsT0Ju1SYG3XnYWmPj0B3qMrvh
	P0LCBHSyJCwfYVb28IK0qOqCrPtkHmew2OYbWVA2ZWvJ5h9FA+xdAnMCH6/JVZKvVRTxDGbl45c
	1rEf9fuUOom7hsFVu8vbRIYkNzCSY8xo0xFotz9QlxBz2Flbem3LLDxfmQUKA08hB1REZgIltlb
	mj2Q3WLmekizxSq0fNlUydN4ZmOGEXWWKFlgNfaX7gox/wnFcRtfjMVczjdAfzL9plboMw/OATP
	Q+NylqVxsfuMrgYx2pQDl0g93k7GfW2d3R8wwSfTXBlPCoMucRTPo/0xVeYg6erfBkbyM4D6ICd
	oYh1y/DBZGrM4plPdWmp85CwQ==
X-Received: by 2002:a05:6000:4b12:b0:487:360:f17e with SMTP id ffacd0b85a97d-4870cef4138mr4081357f8f.17.1789572482988;
        Wed, 16 Sep 2026 08:28:02 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:28:02 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:56 +0100
Subject: [PATCH v3 3/4] dmaengine: qcom: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-3-0dac05654967@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1191;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=fh4C/z0gOMcS2SxNxy2cC8TlLYkqOtVy2+16qwp+aMQ=;
 b=RW7pP3MLxPosAiOITUM/7+vTicyGJZOPaExp0aJS5Zz/uedQ9Algz0ACDi+XTpXlvnH3IwPMZ
 zhk1eWRwV1QCsFVQsfSEBCIhKPp93+ZLpiA0+Il3hN17LG3DMcI23MP
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

