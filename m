Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567971;
	b=OFVitiYwDJoa8P/N8QFz+Q/f4CLiN52hEZ4FMMQEE4nQdQa95D/mwovHQPRKpeYL39rK
	 1HTwyzbP88s7kFSVAASSeBAuCx18EkXchiUXPAnJS7zQBzDj7rCLYmEU8/LZ0IXXhOIWD
	 oxWGsUwLV/SFQ7U0qNwTEY17f9v7/En/YKkn23BsdNqJkzJKJKGSO+fD7J8MnT445bkNp
	 FToPuINz9tbi6BJK8sfpCQitg1ORuumW3uD61bdTqbtR1Ac4eaQh/njmMBykCWBuzHQfH
	 RcixmUhiHMEdyV7aLNSGMe0Yo2N5JwvCLe2c4d8vMmDm2gQ37AZ1e+XDJMw4Lrp1J/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pCZoU/KULySiNKg5bHmPXpUGGQnjpXel7S5fY/ZzmBY=;
	b=FYrDLKnJFk+jM3+JganJ14uMZYFmIQaijX77HLhB2GYg3/Wv/V+4ArkXoy5bDUEGH1f6
	 mPo+/QHtiI3lVyX2vFkpTGlvmMxZLvSmFoys6rpeyt6e2/c9a7jPhngWjR0mrbuVf2rwa
	 e5Th5T2zgmwLLwohYytJQ7HtLUNIQwtTPubrlojNCXX0p7OnGKVrzqzCz30Y6nYOh6FJZ
	 6L8GJLvFRNUke6Byga70pHJRZhpw0eJbdE0hveCOlclTZ/Ezy2eIFtTyFAK1KX6F/51FZ
	 THl9AgY30xRmH83bwKyqARq9NDPoqL0RTfII/V3yzRIMOX0aMnI4AT3tGl/MEAAKY+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UDuJ5CPQ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A25A606DFD1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A25A606DFD1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UDuJ5CPQ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3801675e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567970; x=1795172770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCZoU/KULySiNKg5bHmPXpUGGQnjpXel7S5fY/ZzmBY=;
        b=UDuJ5CPQkhVaWhF8y7cwolzyOV/dEkEqQ2y+6MMgT31GPmTz2tqfg+J8D8KDOE8hoB
         KxVuk4PRpZHngV8VNZfk1eQvgV3kmDImoJ4WoCM9rzkIOrMg4zntYPy2WhXm6MmP3JEY
         /pLt8XMslBvb7ukDOlDfxZ8rohvoIPyP20vrfM6iQWLSi1bmfF+RZXb5ZFgHKbcp5Bmu
         xvg2YerBLP2pddlY6m86UuBdLyqEkAns98J4dA3WPlcbep7cgHHbwt8qCUQ18UWYRiC/
         vfx8R8adJ908HdAlgszDqBm8F77LstaSb95V+MjK+4KkNpWooWZwiLlQn9MfTNqcd3tP
         6ZbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567970; x=1795172770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCZoU/KULySiNKg5bHmPXpUGGQnjpXel7S5fY/ZzmBY=;
        b=aHwWqCwIoxCmTM89YG+veahop08T82CZTmv6yowEc6uQgNWpO0YkXFdPF62slmmkkw
         MO3frjd7thnDTiF3rPBgtMdbT66FXZTnZCAbWs3uoS3Anl80J+uSjtTMj+9chp9AVRKi
         P1U1au2r3Mi3AmYey64X9a1NRnTb7UTfSXtANvuexjADmm0jIDA1GVc1ntmgIkNYZmvE
         2riH3rKsSE1pvvHDCInIEmLlalsDwILJRLhy0+F/WzbBHuXua6eFi9xSfZwFTeuR1oPx
         8Sf2TsSCKEc4ZF658ltkchn2YdfqJhEVhMUcBT7yMzgWPyUUgvpbA14xXkhCNNdEHk5o
         kYOA==
X-Forwarded-Encrypted: i=1; AL+hErEYExr6a1LrSsORHZr4rOT7JOzfGtAkKeG4FVDygW9NCNRPwJKUtz1h2Xx4ikGlQDz/55R9ZbgJL40hrSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z85bGxc0PK9ryOO3zNNmS9Lwjf7FIsX+Y5no8R8ik4lqK6+MXz7
	2+MbOotPt47gRfquKmMzSrTyEPPW9UaqPx9oATIwx31dmw0QzcFFJnGfOo075y3wYMk=
X-Gm-Gg: AYBFou27SBQFDW9jqHKFBErD/lZNZhm79Ms0iE4zXMVJGk7Itp9VUt6jo9159jVurYQ
	wsT4w7LX/s/KCHzmLW86ivFN5c5CBMzsOm8MdUi5sTa1FigoNqjAOsLrwRLptB88DQr32GvjzAw
	ghZFOHb28iHv2JCiDjfL7ZOAXsDI/o6IHXe6rcZyzTSBsdFN7hPBSUrYey95VUdgS9qPloLRZ6w
	gOPv1vhe3GhdseL7GrTouSyhlQ7/D/yhgIO8Ni0p58CpdnJpE3mTf9s9LtJqCsaCc/iPMBlGEmk
	Z52tR3msUDWIR2PXxq6iOWU3D8iQ0N9+0/x0i6bMThKzl3+RB7Qc+WWQlrMyekaImTHquhIN/6X
	/EH1Y/GLYDsvbkh9w5EIFwYD7Jd3KOMZMBGmvmVZJcIaFZeSHX+PtMlk9cvC+3/EFFwwSYGbsvY
	yAF5IQ9vF1CXgyVuvMh7CNjE9YEW5i152aj5q0F5Z8KGBpMh9qKxZVOo/o92PtCPuBxx4N95be6
	5s3KZqmRmf0n+7yOvrBErJFYSrdH0Tx1VgaRz2N6CdwvQ3F6UQc4ORKC9szVUb8RhFFHUaKmNwP
	uSCE39FqPpObbzIVYf7x1Mt+nFZTA40uKixL4+VIHZDyprbuZuo=
X-Received: by 2002:a05:600c:1913:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb55a44c62mr47473995e9.7.1794567969426;
        Fri, 13 Nov 2026 03:06:09 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a68c65sm55915505e9.2.2026.11.13.03.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:08 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:34 +0100
Subject: [PATCH v2 08/11] pinctrl: scmi: mark the GPIO functions
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-8-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index af9c9575d4f0..43b9d67eb9e5 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -438,6 +438,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	struct pinfunction func;
 	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
@@ -479,8 +480,12 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 				return ret;
 		}
 
-		ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
-				  nr_groups, NULL);
+		if (gpio)
+			func = PINCTRL_GPIO_PINFUNCTION(fname, gnames, nr_groups);
+		else
+			func = PINCTRL_PINFUNCTION(fname, gnames, nr_groups);
+
+		ret = pinmux_generic_add_pinfunction(pmx->pctldev, &func, NULL);
 		if (ret < 0)
 			return ret;
 		if (ret != i) {

-- 
2.56.1

