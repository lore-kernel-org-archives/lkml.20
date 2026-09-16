Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED0151FCC1
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572490; cv=none; b=rXCoinTJWlUmyd88hAIRHI25WlUhw1cMSjlguhUjba3cpD497ORqy3nOPd3WP1WgDLsI8+6rEXNeqgamSCgN7zKg7IhhXolv5kxtwyZXUacNmcXKBk6lzXHHHf3eZm87+Oapkjbcw2tP0faaY8/LZVIHgHlIEs0bu0EfPu2CeKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572490; c=relaxed/simple;
	bh=BNXdpYcV6rP8Kzo2tOByWtdS1/BlwS7HT763SKS2iMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u8XQtc+0E5caFEdhzPEMYZfrBFkl9IB29mxh9BensUDcuAx3enj6kQKDy1L1ZQ2WTUu1P6ycw/mzt8JU4IHIXd+QkefQ/T1QPJS/SqNzWTzndyHEyT86BcbKaZ773cEcf1TaaXM9Qv8WoUcXmQpuDmZdn9Si4da8RlEjeyUGVp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=W9gjuXhB; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="W9gjuXhB"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874aso791971f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789572484; x=1790177284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=W9gjuXhB/nuDHOWVpMdIBp4J6v9pOMGvpTv6C+68C3+LguBZOL96AWTXGOBxvTCFpH
         eY0PL2n6ovqLP+InAFXz3cgB5LDwBhSpj/PTUEK/dk9MW6nQwz5UaA4rHqEPVifxqPfj
         vgzc/Cv2kP6LdGoWmizj0e7CwGewfzr4BwojDKWxTRBoEpc1PBMGPzTVJbG9mjRGQZ9F
         yj1wYf5hkPWLKjMzd6hoc/UVwFJhhJixuOzvSjIirxenT5k13hnFxbrfSF6PSk88fQ8v
         py8JTF7shY8gliRRzghYQLqOrymlVuvHIxJi94wh2YVsHjzxGPr5pnM5TmCHK9fqyESr
         Y/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572484; x=1790177284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VkAqAr7Z12LCHxwZegG/ZILA0Oydr34Y894kuKUR6C0=;
        b=JUKpe4+VpKxGm+VIJihVjJ/59BxrqmQkc8gkTQbGNudJjg6z4R50zGB9rjqJe/hQmt
         qX7xeu8xM1wIhSc0SBUgMUDaeBrYttum1AKRtRrhuUugToHJFop+C9bFpWqRtr1OPkLO
         HjrxDBiPKJh0stOV8F5peC1kxYIEX5RM/9wcNFAgYUWB6H5TRpilV/WQlTtaAWVWvsjP
         N0ao0u0jB8KlG+oleDhy7G83Yy9dYjFtMVZdC1oDB5q037iOBvx9cZzJpW3Kc629HUcO
         XIug4f6Hnye7g3kb2GKMiAsDD6yf+VjSszRoHur983pVPteoAw5oF1IAH6OS+m2O5ud8
         poyA==
X-Forwarded-Encrypted: i=1; AKwUvBzKt/Hd9LEJ8OuVScr1Bi78EwIgrhoA7Zby8PF8UOKkMEYBpu0EoxTHAXHn7Bo95cz2UjO27OykRpyXWqk=@vger.kernel.org
X-Gm-Message-State: AFuF++mmeRV2pR+mSFsC8bYJb8w8OnZ5U3ZQq8TFI6lq+hTqULQRVvB+
	qeq6yQB4AL/fjSDfGsZIrePiZTp6EKxPhSChGZ57fE4FCnO6lMECujuInsiSU7DeeEI=
X-Gm-Gg: AYBFou2TgyFSi3Zp66DeXxE+06Ivd2bSBvdhujd1h0u4nOvKiHnKC/Ey2rNwuaeUltH
	mvu8BaRKiMWWDEg5M7i5QFgN0Qv5S0UOTM7l3n+XpOEg8gkQqIWYuWdIOJgiAOF2VMLut0Gwpv6
	WBow3p3T6meW4gOOOA+B3WHKWbQTLR7X/L0VjRuJdYmjC/hnsJ41AesdlkATD30Zsqn+Z+6zI+C
	l2gXiPFWryu/8Fr4ZDnvAdX/6MDh1P21tXGY6vKRT5soYLW4EVsfMtTAv2SbbfOdfjT2prpLz/j
	CYCNN64Ryt+57KScQHnvqHkH6xQO83pqMonEMN3neP3JHMChlQvRkV9vj/EC5fNCvoViYSpK/OK
	lPcrzHJrDAnipYPztgaojSBGPJzZLdRtttK8U7Y3Tcpn3IkKEAl6b6qKYNljKWxocfjtnEN24OS
	at+7POKeTnHMnjv+DHO5Gvml4cHhU3GJCcH1cbGiRF3K4050b6akJYhNpHoi7qmU0hyjFkiqmX7
	Ld7hAXbKh4jOElG9ovuGMdpuQ==
X-Received: by 2002:a05:6000:4543:b0:487:62d:37d6 with SMTP id ffacd0b85a97d-4870d062278mr6043828f8f.23.1789572484275;
        Wed, 16 Sep 2026 08:28:04 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:f89:61fa:af44:9a4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf37e69sm7886646f8f.29.2026.09.16.08.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 08:28:03 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 16:27:57 +0100
Subject: [PATCH v3 4/4] dmaengine: xgene-dma: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-acpi-dma-v3-4-0dac05654967@thegoodpenguin.co.uk>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789572477; l=1050;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=BNXdpYcV6rP8Kzo2tOByWtdS1/BlwS7HT763SKS2iMA=;
 b=AClNkxjacCjqu2lCKsZx+DsWrRbiQu6gec5tz+hmBFOqGuNzaQ14tthza4xwpktAZM7gOUuZa
 Yhu36sTa6osA945ATkMT1gSapeUJJUG5HK9qcNADI/uNELqdvAyplxP
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a designated initializer for the acpi_device_id fields which makes the
code more readable and consistent with how lists are initialized in the
rest of the kernel code base. Also drop explicitly setting fields to 0
where it is redundant.

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/dma/xgene-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/xgene-dma.c b/drivers/dma/xgene-dma.c
index fa1173e49900..8d1c58ca0d48 100644
--- a/drivers/dma/xgene-dma.c
+++ b/drivers/dma/xgene-dma.c
@@ -1800,8 +1800,8 @@ static void xgene_dma_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id xgene_dma_acpi_match_ptr[] = {
-	{"APMC0D43", 0},
-	{},
+	{ .id = "APMC0D43" },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, xgene_dma_acpi_match_ptr);
 #endif

-- 
2.43.0

