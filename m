Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382315;
	b=CUEQhEnSj8An8UvhkCSZxgKfCBW1ZHftVwqEEaPZxx3s+xsLz3+JVqAMXuTFq2wAITMq
	 U80CjTV3R2GhiKAMreHTGctHm4iqDHEPIrhYghsSswGKmZKL9iOFtAWons4x7C7zBGF8+
	 iqsu5aj/DboSyVdEruzVf7EP0B06TQ+pydEqxzf96TXu1iWSnyqIM1mNvenoJUbkPn91l
	 fmYCiNWLmJnKFXVLEq1iR4c3bdz+lrykA4lIlfBzWbL3e6aXdWCQDqWlYHtGBwlc7M0kM
	 V6C0o1s9gOMhtbEOKZCvTJM7tjiamgJPRc8rVSwlDZGx/V6I1NEdSnMCbar4JEKlHaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
	b=UAPKwgCJL21APcRxhkjBSAzGVe6O56cGgg0WbU7UZKuFZ3GRrH6/4HAVWZ2q45Bl/5pw
	 bQrhXmcRi/XIErshUMv6A4soHPe+Pm0xlajd0K7MOEg5tmJJTt4mlunOVMSzwevGlHbhs
	 kbTBKgeZiB6crb/VW8VKYtMxhUNnDEJ4a+SCN8+0PKwEa2h4PY1+7+xFvm4bh6Y1ntaed
	 azPcXaHESz9wBRKMAciFZGAvvcLvb1vQpyO6vxso2x9gufA+NB40bEtxQMdGKDZssrd/f
	 0dLWNvRD4Htlhb7OhI2L1ArVzlEPXf0Tsf4a/1AHF0c81Qw9WNyxTueICniPjv5Tqgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEC2sk9b;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410A260A382A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 410A260A382A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WEC2sk9b
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3720addb068so5266296eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794382314; x=1794987114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=WEC2sk9bZoSA0aHvh8bTBuuU4M6coFaD4OT396CaeqfwqYkgvmSrpYUXI5ZKF+k6mW
         ZHfBy8AEZSfptKFrMT35avYPKRVBqOzQtQjF0+u6q3GpT+2IwXsCRvlL6HwkYMqtYo2E
         LiuDVF0nRctc+Imgm8XBMBfl8BbmUwCgnC5/SmS0syEwoZbDeuBRj/MTfmqth3U2XJj6
         FF09k1O+J9AfDGDVtH1FOospmuB2+W9hZYnRH2D4IE76p10HhqczwozMJf0zoAebm8XA
         mQK9htvFCrRbT2cUUK/vmA+2ANr+sK1rDL4ErcnwxCc/zrLMbuy0GMdR2qHA51KEPEUr
         KroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382314; x=1794987114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7z8/qe+AfvmJGG4y2bRYtRiZGRNOq/Sl0ivxixfInc=;
        b=K7vYZKxfchqMRvn0+u82PqdZb6lKefB9mYH8brWT1EorIvtZdmlqwF2XUNm25xaE42
         gsBZWXJGznIxYSHa9Hqk4h8Md2NjoTrwGO8POReNtEeFj96rN4oP8t25/v7USP3xvoSg
         mYHY0s+9ZDuKViRHoRToXqxosfjWtTLX6fBnsWetDlYalTQO3eoh1y0ZszlpYkCg+p6c
         iA9dUa7N2ZK6f5ul/AQjcZRet8HLK6VyxQPHeUkK/T34DENnjnO8KQIQ8BVs0ewBACNd
         zHyOUjlWhm0/1xMxaC0b7z5Vbksas3WzieeFoRr8n3wsNtltRQExZES9t9dPH8sN44gK
         HF3g==
X-Forwarded-Encrypted: i=1; AL+hErFW3XVLFdHM9YikmZRCA59pTEdpTwIPxrPPLkLurzE2TRgIPnaxlZc/d7+txw4/+sFpO8OyN4lmgQBVBQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lQUgZAWnrHQ8UAGuJQjBTmhaRutHII4hpn32EFB9uJD471AXg
	EpKVXl2vjHQfInBZcwfYYo1GpyxDtuNeND73HRjjwXG8IF3cKREiyzBH
X-Gm-Gg: AYBFou28R1zJ3jqaMP3tlROC4KavGvDWschofassvFlKAEUtxIIVPIHBrKr3bV0Beeu
	j6951lkc/bUTUbwOZgkSgnfLGUcoBJe04va5dDWjGRpSNAee2KfJqexZRKcEfFcIJapCWJKQODG
	4DfuLlgE9IKYYxpzuGa+D4/ikJJceRRZBW/cKsdm6N2XCQN3Ir7pVP2i5Psl7Co+D0f2ERI1uLo
	oRNN1NnBsjlSq8XYhL8FmisMq3w6jSdroI8YZM1uwttbPhAzYSa1NKXn7tGFNytS9cALGQ6seqK
	Yi4VSzBrT8rbLHEeqqaogJ6a7oHQbd1n/11QywPcmpuc2/fxMGS51P6d2vpvLuzv7uS8ijvKU8t
	3/wZA6TZkmhDMX94WjZS1mYdESpt/47gz9ZcMndhcRh7UEivjrkYZiF2gnrJrK6Sz48MRTR96Yv
	2atNvMCjatYAuhbcVmQ91LwVhNAwP4d4FuKgJGseOFf4DWMLo0HH5KqDuY7vyRZObahVnq4DmXt
	oFzBaiKAog7P9IRtOeMJNX4zu8U5Wwn1DfXw3p7h/S6cOW7zMf02TUl/Ns/2Zuvcj46FFm5gLL2
	k25gjtwBBhET8xnL+BVLNLED5s/Q6WJNNFqwlXBVezW7kC1BDstEwDYl/u41iww7FUkzKVa/qMP
	2AguIxiz5ctba/cED7A==
X-Received: by 2002:a05:7022:8b:b0:143:26cf:8615 with SMTP id a92af1059eb24-1b3c036359dmr1596278c88.25.1794382314148;
        Tue, 10 Nov 2026 23:31:54 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm12640655eec.8.2026.11.10.23.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:53 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v9 3/4] phy: nuvoton: phy-ma35d1-usb2: remove unused linux/io.h include
Date: Wed, 11 Nov 2026 15:31:36 +0800
Message-ID: <20261111073137.381966-4-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073137.381966-1-a0987203069@gmail.com>
References: <20261111073137.381966-1-a0987203069@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver never performs direct MMIO access (no readl()/writel()/
ioremap()/__iomem); all register access goes through regmap via
syscon_regmap_lookup_by_phandle(). linux/io.h has therefore been
unused since the driver was first added.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/phy/nuvoton/phy-ma35d1-usb2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/nuvoton/phy-ma35d1-usb2.c b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
index 9a459b700ed4..0b9976fb15c1 100644
--- a/drivers/phy/nuvoton/phy-ma35d1-usb2.c
+++ b/drivers/phy/nuvoton/phy-ma35d1-usb2.c
@@ -5,7 +5,6 @@
 #include <linux/bitfield.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-- 
2.43.0

