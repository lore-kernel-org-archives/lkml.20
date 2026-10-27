Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793136619;
	b=CXI8DjXXRoEnNoWmIX3CWMdMhnAmk6gRM2V7SBBtthB9hYqbg6kjM9uo8rpY5EZh9uMK
	 IE0bHQzYZmgdjpNA+Ngwv1p+XuezvAIpwQqKgJODYGnLbsT6ikjp3Ua6XywXz1SW09a9o
	 DtdifxghuMMb1USdMsWV7fruWsTyr5MQz6if/8vcpZUyDP69V7tccD81cq7UdYVdVJUQD
	 N8siWYh/HYrMXopSKAhdyRDTamlGEbT/rJkNsgWGRvEoUGriS4TTTJQwD7M803fkaFwM2
	 JrTdi/N6NRB6FCkdZrFbbfY8RR9McG8Zf0YBjSXENu91AnnY54KyU0rF4vURd7g1CFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793136619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=52eH8NRxpy/xtwCvQ5Etkj+uy8ipBxuMgaO35J8aHsg=;
	b=2QRgG4KF2HPHs8t99Au48xF0fUCIdoTFLE5Y/Bdlv0a5RNEYjxqGVGA/87bjPDqjfyXy
	 2z9qyWaztDHNX3Vk1nuaVPc9qLtKzwE9QYC73q3t0PHgf/12rsZaSKMbF+PGZ/ZQRmqVr
	 1/47AbkxwQXWZCFdIvh5p4jJtau0PDhacz8PT/LzppDJOo613fg/AbVYZSz84al1bvMEk
	 tKDbGMb7VqjAS7LuizPm2SheEhCKoAXTgAzAxvWDYOHFnuQabA7hoe86J3NHkqyPpCQSP
	 WJSgP0AryC7OlxZbgK7JL4K+3l5alhsqQuWuGIxPj89nJCEDKFAvDamS49g694elqcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=keG5JBZl;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5110860A2600
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 21:30:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5110860A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=keG5JBZl
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so427854c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793136610; x=1793741410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52eH8NRxpy/xtwCvQ5Etkj+uy8ipBxuMgaO35J8aHsg=;
        b=keG5JBZl0nTGVltpuTatYIoi3qNoqZou5gb4907/eOMsOuNXtlXGuXtkF0QX9HmRXc
         CwTOyXMEUcUXj1YglbBixDpMchtPd5Ugqt7qKbqoeXmkIdVUiWTeewcsJO7e/q8VNSqO
         aX2DfjcxXju6aC/HViqwYKunrbVbpCAnNPpgEYfEY3UpSRPotskbSw01/j5RKuXeWFHi
         MtRoepAxL8nRAhRnW5E5RMUQ3AAGxyU+xbKDMjyfDmVHMqPk4/JFmmZLwKTDzi0vCB69
         5yE5Jb0D/+s0BZugDZsoNjJm9AZrihaqIYIL0m2YpFMTHPO0xrRdsc1Gj5/i7uuHeCed
         +92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793136610; x=1793741410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52eH8NRxpy/xtwCvQ5Etkj+uy8ipBxuMgaO35J8aHsg=;
        b=1YM4ilCmwZrFmZkkdKMgrpuiCnnvbOe67zlvrjzhq9En0EHi6YZ0SNQMjEj2+MZvNx
         8p5l4Sc5KLingzM3p+SgCMOO3XOZpkO77iwii1Ze0wwOVI4hUcBQYm4kApbiv9sulY4C
         wkqVm7wg58qu1P6Q9tnzMhmLzCSVgI7I2/QsmETqleJgU2G5MBGgjv/SGWyJlW9OZpO0
         C7tKUkcnbl+hkUS+vrXQsxrXaCS4lKXsLbRkRHTC7bghA0tzYc4fYyY15JhWGaSGrF1z
         iajTh0CBzIp5r8NQMBPC3Mk/Dy7V89i/izMUZfXpFLM6JztiTYII0fJw8j6zKg2a1Ajx
         sqAg==
X-Forwarded-Encrypted: i=1; AKwUvBxn3Wnpy+AqkHoj4Lfj9hGczMVm7qwHbvYyfxPgUDW6eM0w4fKriDlAT27BLLHlgH55J+FrUVxripHe0BY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5tEYkhjCiAlLmzG4TC61aZUUHy85gJ0ZcJboRrh1jMUfNO2dZ
	N91IWxstVH+9yDWlLh7kt47qjDLWmer3JQyq2KLTJdWlrwvwHzl8c2AY
X-Gm-Gg: AYBFou14WHj4JYRpsBRmrVqr7R2KBYpr+Mbv/0wOiXTUpCYShEGBAX5PZQNUjkcIbGM
	IHF1HD677nQ3dxP4FHk3ae0nIkZWMgwy4SSS8MHkmGJ2S93cK5i3+GTu4mOp34U1IgSVFbdFQjJ
	8Z/gIbBU9Lr8m0vwD8JzToxHOAsP4o/EW/gz1K00U9DcxTofIyKU+fjUeqMtcp4fvxWmOWsR+cT
	Z1JxFCpze7tQQROi+EpY27TfaiXzv9s7cjE+fkE5indqbBIlpColw2aPmY+DMTdSZ+If3JxmTwk
	hfDwG1FtcYfH8f9A2Ukt5WhirbSPF/LIOYVeUt0Sqx5m9wZZ2IYxcqfZvV2NJK1kW6VlnhtN0Ec
	af+aBsF0zZjBWbOJappBhKnfKSy78Iu7MtaE1anFTaAAnCGt0JbNQpxzYXCfET1K5yI9Lb3Sp8V
	b6HixU2DvsAOF83nD7Tob8Pr436VlymWXVejPtokvTs7XTvtq2/uFnEedkjdZiSpFMX/Fd41WFe
	HUhUQkzWuFks1NfofAZsJh1koi/+QeZ7LsqcoSJ6ivFBnW3QYTfGhPlJR03GXmN/nNl2t/jtczo
	PvHLIyeO4u/Mr/joFNqpMtGVy9ZEpJKDgEPtCqzVLoQ5Oq/tXc33szQGJ4JO/X0zlnKkSSy1YAq
	83HJ0FwlesXN7gwl3rw==
X-Received: by 2002:a05:7022:3b8d:b0:144:c128:4c4b with SMTP id a92af1059eb24-1a6cfde6ed5mr616780c88.36.1793136610258;
        Tue, 27 Oct 2026 14:30:10 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:9958:9525:7799:82b5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a6d7ed488fsm723725c88.7.2026.10.27.14.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 14:30:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2026 14:29:58 -0700
Subject: [PATCH 4/4] ARM: s3c: crag6410-module: configure wm0010 interrupt
 trigger type
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-crag6410-module-swnode-v1-4-2f885799b6ad@gmail.com>
References: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
In-Reply-To: <20261027-crag6410-module-swnode-v1-0-2f885799b6ad@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

The wm0010 driver currently defaults to IRQF_TRIGGER_FALLING when
pdata.irq_flags is unset. Unconditionally set the default trigger type
on S3C_EINT(4)'s irq_data to IRQ_TYPE_EDGE_FALLING in
wlf_gf_module_register() using irqd_set_trigger_type().

This configures the default trigger in board code in preparation for
updating wm0010 to rely on the pre-configured interrupt trigger and
dropping struct wm0010_pdata altogether.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/arm/mach-s3c/mach-crag6410-module.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
index 55f55e9b9a46..440f19d5c64f 100644
--- a/arch/arm/mach-s3c/mach-crag6410-module.c
+++ b/arch/arm/mach-s3c/mach-crag6410-module.c
@@ -8,6 +8,7 @@
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
+#include <linux/irq.h>
 #include <linux/spi/spi.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/property.h>
@@ -463,6 +464,9 @@ static int __init wlf_gf_module_register(void)
 	if (!soc_is_s3c64xx())
 		return 0;
 
+	irqd_set_trigger_type(irq_get_irq_data(S3C_EINT(4)),
+			      IRQ_TYPE_EDGE_FALLING);
+
 	return i2c_add_driver(&wlf_gf_module_driver);
 }
 device_initcall(wlf_gf_module_register);

-- 
2.56.0.307.g5fe7bd680c-goog

