Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804423;
	b=ZeJyXS84kmKYR7Hi4rPbpbpOGPGNPXSrq4GCOT+401ISgB7zeED/hlr4Tyh9DrT33lS6
	 cu6vDPUolYSQ3ySRxKvuzDbc8vYZmqDbuzIs16dW43rYUpO6kmLbotM/S/gnZ+uz3MVC3
	 VPEipiukuKr2AX6cdRiHMn0xxWSTRq9cmSsuYcOsZXXHFucmhDsutMPssvjBk57Mcj7V2
	 FVzE9AwKGVUKaa7oidTZG4yvcCMtCogU3Uy+2aeUQ5p5UrsPOsBNgdu1MSsiLWno+scHj
	 XTdiclywtKTepWIrCq0UZvhdifYEXmJ3lKzoOasAoc6IBjYajccJyNIJ8hMqoyzwpmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dJ5nNF8fJBCcyjpTvRB287LocZ9aEZbE3ISg2aHVauM=;
	b=3OtY4bQPiV1xVacQrii5oOrW4VYD3PK/5mNCAenHnkyllHm10X+zgjHGBJlCJ5k1a6IW
	 tN6aF7njNpO1bE/8tecIFFXtMaeRhsVH0ClfD3LTrCIJ6TWPJPH2GTKvLWQl6Euhf9Tji
	 +mtzzBVfy+XSxe7VV8qiwjN38/J+mM49StGWnIFKl166BQRiRVh9kCnTE88EIKtiifHOw
	 3t04dT8oJEtqHK5BUsZaiYv4vKr91IcE18Aw94mrIG1bM1nfA10BKnadFkCG1BRaOiz51
	 BcuMxK5/kYpOCn1H3GAeSg942Jix/llLKA89YH/thhycmAM7Z6Kovc4jrQz6/FBvDAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lzf+dOfr;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53F7606A336
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D53F7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lzf+dOfr
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b1a705b88aso121947b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793804422; x=1794409222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJ5nNF8fJBCcyjpTvRB287LocZ9aEZbE3ISg2aHVauM=;
        b=Lzf+dOfrGHScRBAfcGM2MmST2gZLT2E4ucniQYUtPQxQRdkQ9bUBAvBHNzcKew6exF
         3B/5Y7xLOsU8qoeGzb9qTfBYEZx4NKwN27DqVjYRSkgdgiHZ6ejsSqJeRscSAfKPEW4v
         wHaxPw9IYwdJ0PVwe7gInvDF5E+irsr278FWXaE9xOUK7xbPaYgsHHdydg2Wyji4+Itl
         1BAdLy8QhMpiS0gUY8YXbj6VVByDY2dwHgX+ozNE0kCo6prFsktr/1W2h1kMdacU3Szm
         UhtwGhKQqTEm6a0oH9wYPcwRRtD8mmQpgwiQswJAFrcpCRXa4CLhEeLl2UpjLZ4kwj2W
         AMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804422; x=1794409222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJ5nNF8fJBCcyjpTvRB287LocZ9aEZbE3ISg2aHVauM=;
        b=c7BdkgJVjatWp4bwkUaaLxFdg6D5X9nEQOx0CcfNLmvdhhzAnFP/foKBaFYErIdJsv
         U6V/Z4cy7CZlo0DZn10Q3JY0LgywL1yyScYOqD5ofQaTCUAN1X0O2dJ/R9dconmPrWK9
         H0qAEMKfnfNQPGHJV/Tk7xu1BYPAM/ArJVGHI0ZkU0InHduq6YEVGbZnsxoHTVr66VhD
         PLJfjcWKJtvoxEKq7Exp5hF9bm8W/a1MZ3LpJPXMYD3I0/rQa4xFqVoatr482668vXyK
         P/iBTVIxA7uLbMhAW4WoXWhPZjw5D0/BjvMMZ9a5OAYmaqwKa8U29+I+43ReFB6TAaDi
         rG5w==
X-Forwarded-Encrypted: i=1; AKwUvBy8EuskeTKA8r+qr0WotseVRNN5+UmOvRsP3GNEL/wuCOsBJ17mElhfEyB5++QwQWS5oMaPNFllq3MItOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CATX0sHgqldDPqsSyRGRubCKizmpNs5KtthYAq79GKls8OqWj
	webDq+0BD8ty5IcgmtANam7TuiRKPB41865S4XcsAMLXQZxPUZ3BauJn
X-Gm-Gg: AYBFou2aZ+PVbmzhB4j1wvgE7gjP9q2Rb1tUjtNBTIWtlPd6B/ceShBx+2avrIGqMqh
	lsTpTg8dtfU8i8HN3vxF24S/eKe5w0IyStqRbUC/LuBUM2nMdLcKKOKcLQY1mbuwqlE0Io7NnGw
	q0Zu/Eib62tk9A8H6z8MSt7sjlNj4vBllOmsqtXqLADZINeCOToBKP26okm2sEaUSEXP4tvqkvO
	PohtHLB3N1i/0rURVGi5oassaZJ9vtL5MfWW7BDzq2Pm4Mq6LwwynIp1Ledhk6hKb6ChFghISr/
	r+KtQ4BuolIFGEUVloBw2xtviu/4W5O5bRDsqc3juLRu6H+Jcu7SEqpO1g9ZQ3pUwCFV3KlYsTs
	wTQrantHU8Hoi+ipIVhwbumaCFfCoIrDEMygEEX/+jJRZjaEBE2uamRJBVDgamPK7R7nQMdoiXF
	TyZGo/V2JdgBkIXZjr10Xwjm/AXXAhhk0coCgOwL7yIkTE0yvgpLbp7QiMzdT4kC2AQvzorcTMt
	NXob3VAIahhRQ1EcL4GOePQCf51cbHWJUurtCRNSVc7j8a4ph6hlBjqDuLx4oHvY2bDrT6kfKQo
	Z69M5K0nECug/D6JZtGyZQ3DT7VRKx7Uycu3eNucoyUithrkPFHG83WRC9nSWaTlxEqlE6NgPiw
	C390YIL/WHB38upVwi2YjfTurUP8tb4XuaaDXzoTZMV9vldBM
X-Received: by 2002:a05:6a00:140f:b0:89e:f8e9:205e with SMTP id d2e1a72fcca58-8a9bf71c0f3mr13544009b3a.40.1793804422077;
        Wed, 04 Nov 2026 07:00:22 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:5040:8550:f5e4:709a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7cc077sm1062059b3a.15.2026.11.04.07.00.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 07:00:20 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] pinctrl: starfive: jhb100: use str_enable_disable()
Date: Wed,  4 Nov 2026 20:30:08 +0530
Message-ID: <20261104150013.32879-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Replace the open coded ternary in the jhb100_irq_set_wake() function with the helper
from string_choices.h. Gives same output.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
index 462a26697..329153876 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
@@ -20,6 +20,7 @@
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinconf.h>
@@ -1152,7 +1153,7 @@ static int jhb100_irq_set_wake(struct irq_data *d, unsigned int enable)
 		ret = disable_irq_wake(sfp->irq);
 	if (ret)
 		dev_err(sfp->dev, "failed to %s wake-up interrupt\n",
-			enable ? "enable" : "disable");
+			str_enable_disable(enable));
 
 	return ret;
 }
-- 
2.46.0

