Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBEE4A92EC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531053; cv=none; b=Ei3MI6BHoXI7nLMMO/qGUMIhRVvu5LsZRMz9ZAH2Yv4fgH7+kjcDoyLTNq9hubiYFBARD2ikVduemvXFrmCLqxyzC9ADZM/XgQ8TuX08Cz4NsmROwN/zqqtA4mGzJPkjjxnoeuF1GS73hgCl1cv/fcBKpWELCS6oaKB5sdn9g14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531053; c=relaxed/simple;
	bh=YI1OpqXpFveygflyZ7spNdU2ImPBQOBvJey4mLcCyjE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OrWpkRJHrne1yps5A1g+11pMDuVWw9KEeLyIS83ulvaXVuiDZtSSPlQnfoFnrChmBV0crTJWcdBG/vhJGxge5eMLhoydgxjRoCeIg4FDqFSmRmW2jeVClebc+v37cGHlDEnkZrVqbXsXe7DFYpin8h7UKp8JvLifROTqrgCz51w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=r1fKACFQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="r1fKACFQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so11056455e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788531050; x=1789135850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VUQuboyMNJgx1gV4X+dcroiSZBt7U++vQNPSBw1f83E=;
        b=r1fKACFQEVjQEv46f2kaqAGtxufPxmVgO3F9IO59Z9Iq3x0z3rT4MeYjVUhTzt6V/3
         ekAhsb8WIUAUcr0Tf9aEmR3S6QqlloRHvHCScAA5RO5n+1tGhq00Nj+N072oAmas6JJo
         L/owmmZ2AF6tg3JVRjIGfTHDrYy8jj29TDiqxS2Q1pNu0Usr3zSHNO+2NGd8MnbcgKMA
         0SenqW6SOSlY1VburWykZpP26HpC4NakjhTwmiL3HVJK7xtVr7DF8We6hQU5FN9fQIls
         iOxwuWsf16kZXczumo8NKqeWtoSnJbyBhqf5tlkoizg4yNyXRnxxp56HYQPD6OkAli91
         SN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788531050; x=1789135850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUQuboyMNJgx1gV4X+dcroiSZBt7U++vQNPSBw1f83E=;
        b=UOepBFRx1462b4KtJ9EGs+Asunw06o16i2wJOe3g6abmv9tPfhtCFjiL1bTKRVxkPg
         gEkL2tBxa6ieRECwvAmnoDDh+5a77tTNZmcRZV8WGT6+5OjjrUDRGor+OINwhiopAMWG
         FBMvt8Xzt9q4Mnml9oZi/cdx2KM6vEz4MaCmQa6E6cDoZ7qstM/6T/MRjQCboZbfJi4p
         hFS410J8Wht9bOV6NNVSLkX+afyoIeSVO+cF3oBMq8iQEJ+lA7+kqlxyzy6xU3FF1oUF
         HY+oGbRgoq2KCjSAgFZytBVuePGmkudoeT04azeO2iBtQDCm2iYwHVmB2GdPRI8Rx1q0
         T3yA==
X-Forwarded-Encrypted: i=1; AKwUvBzfErFd1eN18ck7LgxlI7Y66irGe5lEMw++Zn5CK3WLqffZvftffvk9nGmw80lZ2jOHPlIAfxIk+pc+B10=@vger.kernel.org
X-Gm-Message-State: AFuF++my9k1re/wMqizPbyRQzHes2Y19QUqMBQJpG2LC3/lTz5mbC8wP
	o0MAFSD+jSsJEj6sTfDCC7Cal8bFEVX6ZujpmKpzC+57r0RfY3RdYjS6hTiWkae7v7UAFzMTrGq
	zn7i9
X-Gm-Gg: AYBFou28Td54dZg0N6pb6bTCdlXOh3ew1WicHQ+5XhRbo3I+//l/Jay39KLphReCqn2
	2BxwtkbsZZFCJeBsr9ADbpc6DDSHKTKgs7mVyTi0uabw6ajcudIiljOvHMXyeVQWDtyVn+zTzA0
	WzQnbEaVOSD0/VOIkFdHOadSJQ9GSMurnVqT099Dzj0rFi7wfwoWANtDKq6V1nP50J6EvNs/mxs
	eCq/4m+Bhqj/rNJEI1VO3gjcVo8Rr2cLSKjBIoUTuARzZy+HzKM7LkyFBwvZTDSdtKGSU9WEHW0
	AHWjxEGrfdOWvpTZlmFGnFYY2NrSs2WmlLuGQZiB7Udv6E8XqpxIB2UMQYNAjBbiyoeRosJVWZd
	aO7f9qJdpzvIvzfzGt3YyQUON99JVB8PMgBXqTGvH/iSrS+LNhj1A1pDo5WbV83OTA+e/o45qwL
	/87yxyiMdnADLC+qGbhoNI+UwQlbN+tV0rYnTSKTdocby1UnkDOObZv6XDUryWy4b0q0uwoIk1g
	AznUg==
X-Received: by 2002:a05:600c:608a:b0:49c:fc6c:bdfd with SMTP id 5b1f17b1804b1-49cfc6cbfe7mr36426485e9.20.1788531049864;
        Fri, 04 Sep 2026 07:10:49 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm138287045e9.0.2026.09.04.07.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:10:48 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 15:10:42 +0100
Subject: [PATCH 3/4] dma: qcom: use named initializers for acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-dma-v1-3-0fcc63d65d4b@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788531042; l=1212;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=YI1OpqXpFveygflyZ7spNdU2ImPBQOBvJey4mLcCyjE=;
 b=+jWpb9zoHZPf04DHZ75KRlkA9qQYrBTOnieAY7Gxd2mvQ/1U/LI4RfXElHT7e7IMRJ0Wf6aYt
 fAc6tSNVnY1BFsbQ5LNTLeX1XyLY/oK690JWA0i99VWhR2UDOemWfcG
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which
makes the code more readable and consistent with how lists
are initialized in the rest of the kernel code base.
Also drop explicitly setting fields to 0 where it is redundant.

While we are at it - unify the list terminator to have
a single space between the brackets and no trailing
comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
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

