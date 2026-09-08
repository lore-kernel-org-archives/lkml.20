Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78CE51C32B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860455; cv=none; b=l7EvJqdS9634+ynCQcXgs2l5Jpb/NnqqSuOtYNrljzYb2GDjn8jyFjR9lotPyHCZUsGkGdDABzQjnHS+OTGfuyyJp4GFA6QailI5OCo4nh9bhqmCkRgBcEDP9QgjG4cG/cgCVYIEV6TocYohXYplrRhDTB0YikAmTuHCC343IW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860455; c=relaxed/simple;
	bh=yV7fthqeihMaFTza7JqJdIeblZJsWjLB3f4+8mC5yxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JndtVFNaUcjLl61jayylfpB5+I3Ca3L+Q8XSzUujlrMzNynHBzw567XtXBLE8dHpn1mxV2wPDqIq65G8YXIOi7/k3IfEBJGuQMN2YavgiKJmgQOM+0aI6JLtlkEttNwHsEIrfGyw1SxiN/yU2EJdMLdY3AVW0Wqu3kwWsBX50hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CcqcHrlL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CcqcHrlL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso36864765ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788860453; x=1789465253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqYy1ey2qQ44WsfCEFpPhp0ddQp9qQBHXmGlUorARUU=;
        b=CcqcHrlLt5NZRxjVZE4FHVSGVj/emalG28dXgKtb8SyMq+HHn9rs9IEmR7lrOTl5Gt
         J0Vl+Kl/UpTBc2d5DsDoGDcFlU7Sm+SfYt9kDhDCG10RUGes5T23eUJEytmlzsL+97Jg
         KL1qT7YKWNbuDz0MQAyLOmt5OrPVuAhSKOXLtBmOOtJtbbU0he1NIONyu00PPbhyIxzw
         inAIPNaay+Mi3gRzKFye7ci1MkUN6DSdSQjV+ll6jNlD8o+bZ+bt34P+D7wHWT0K5SMH
         gk8bHtD3KchKAYLkdVLNajCuhGXZyCIuWkfG7u4ETe21Ll53goXf+cXPk1K7s45/7XRg
         fmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788860453; x=1789465253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bqYy1ey2qQ44WsfCEFpPhp0ddQp9qQBHXmGlUorARUU=;
        b=g6+29ZuKU6gSJ4UWKmSQlbVa3RZ+4SEOGG0kK0Ie3Cc5eoS+VTHAR3jdB65k72ySn+
         f8eA9/gFM3uYAnkyudIrO5B3aoatnsTmSOGQUt7veaQ2Ki8gM7FecK0pCgmCKuvdT6sQ
         WBh/klBJjJs5aBqCUPr2T2YPSdCiXatrpN59qFqkeyf23j2b8UgSoaRsXP4lBXl1kvYd
         t0kTNZYS5IXAZ6bVfmvTou+PLHRCNbhrnlbcFsc/1R33rCmC85+idxvoZzg1s+KZKKxw
         oi8Cq//8lkmTd2M7CaRZFKCKdAcg9W5HKn90WLvuPLpY0q7fBLgsM64cg4uu++hFCeVw
         Gn6A==
X-Forwarded-Encrypted: i=1; AKwUvBxluCx9YLXdKKcIHnQmvzuIKTa2kAwYRL9UPLB/eixq+qoCgyYLYauy2wtX9FJhZ22Vm8RVwAzKvUDE/K8=@vger.kernel.org
X-Gm-Message-State: AFuF++n6TMXBeeMESd8lryps7adyKChBXr2hN96XFIPp68aKFgRvFxmt
	q+i84zfvAecPjZwkGniYxQR8Nwhfr8RXcOhVVv9s6f3+JqMCJvsI51PsYW/v8Q==
X-Gm-Gg: AYBFou0pmkHT/hWH1wJ23upGBJ7cMUwvM2LX+szI2e+4qk1QZs8StBAQ2pa08v2gkKT
	9JYUcZriRPoUwlw6JJAWYv0a3jY9piS0t92Kwg7IU/QsuPuVI4JFfd7PK1t+e3+XxnDqru8g4Hv
	rpjiiw1CbJOyfuCDMXwTZMRc7/n5qcqbuBOxxzZcoExwd0Ynq5q7smgeddMKPta/80Pa8Qg3n83
	R6GLxoAAf/9lNLBcV3ShY8NlbPRbZQ5ykzdihApLxn/u7vVPCs8Fxzj9w2GCJOZXjrGuVB7jkaY
	W3a8DKi+0jE/atOOqooUmOEv4ujRtF+M4H05QPRvBvauPEbhYsHXz/QTKKiSkvzvQ9RYHnvj5Y3
	b7Z12MP88ygD5DEhF15BAjWDWG7gqqFU9TDz/fopHp+iT6m/3kBvgkFEU2b63Yt6WAEMNA2qX/v
	x5Gm0vFwieWufMjaH0TZZByjCy+RbB3Kad7zcaxsXmT9Il3CVi1lUbSmulXDn3ni0fanr0o45c+
	M87a2xf4X7y+b3YMI/iIcYNztk/500T7NbxiTWYDBWeBfZvL5EKwCyXwYQS7K1C2Q==
X-Received: by 2002:a17:90b:264e:b0:398:9bd1:3215 with SMTP id 98e67ed59e1d1-39b262e28cdmr44675483a91.22.1788860453113;
        Tue, 08 Sep 2026 02:40:53 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm31999240a91.13.2026.09.08.02.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:40:52 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: geert@linux-m68k.org,
	tglx@kernel.org,
	miodrag.dinic@mips.com
Cc: radu@rendec.net,
	zewenchen@google.com,
	jamiechen@google.com,
	edwardwchen@google.com,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 3/6] irqchip/goldfish-pic: Allow selecting CONFIG_GOLDFISH_PIC on other architectures
Date: Tue,  8 Sep 2026 09:40:13 +0000
Message-ID: <20260908094016.1997918-4-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260908094016.1997918-1-visitorckw@gmail.com>
References: <20260908094016.1997918-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the MIPS dependency from CONFIG_GOLDFISH_PIC so that other
architectures can use this driver. Also update the file header comment
to remove the MIPS reference.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/irqchip/Kconfig            | 2 +-
 drivers/irqchip/irq-goldfish-pic.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 20b77fbc51ee..a0f0f3a0e8ea 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -513,7 +513,7 @@ config MESON_IRQ_GPIO
 
 config GOLDFISH_PIC
        bool "Goldfish programmable interrupt controller"
-       depends on MIPS && (GOLDFISH || COMPILE_TEST)
+       depends on GOLDFISH || COMPILE_TEST
        select GENERIC_IRQ_CHIP
        select IRQ_DOMAIN
        help
diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index 12113ca90872..8d40df0e3a88 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Driver for MIPS Goldfish Programmable Interrupt Controller.
+ * Driver for Goldfish Programmable Interrupt Controller.
  *
  * Author: Miodrag Dinic <miodrag.dinic@mips.com>
  */
-- 
2.55.0.979.g7e5102b832-goog

