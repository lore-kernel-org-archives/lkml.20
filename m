Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788131;
	b=gWHv4dnyLkdrfh8ZwejS3sn1H9SjSMhQQ900zTKWiblpUoGftFGogXnpkxizJ9hdUOKo
	 svcEoud4+VxQZPZv5O+rzQjaNSCHDKuuesQuKwEnVRqbm8IaQiOPlaBP+RNvdQdRi5rId
	 MtZZMAQfO7j4qJcsGqNE3KClSpaz+7MOhMw3C7ybEBAEbqH7yNlcjUMbrrf/7rp7kgToJ
	 oIDq6BUQhgo+2RLMHSPrJJM/b4asFVteUptW5kX+IGbXimxX07tppFFsADoSkmP5aBYRk
	 TQDY7CkWUULLTIkcA57UqMEaSrMiox5Tk1qjjdmWfO4mwU9rF4reiPYlY4FSqdwm+tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MnyZYcAhN5YB+BHIBPYmvkepdfwjhDJxK6kMr/d0yZA=;
	b=jmAo9wIfakGFW8AELy6uzMbDDIrrfbO/ddU5klQK47HI+pA9seEaXcn3d+QKZIUAtuvE
	 Li8ro8knaZVFpfK4EF6zFE7lvRP9F5xIRMx8isOOaNMyjruI/Eha77t6UtO418JuDmO8D
	 pdEw5bXVLfgR9OhtSlWDJ9qfemSd9haZRFacL2CWnaR4zxySBmlq4TRCx2OsPfbmB+HCx
	 TbBHioW31vlO+B9f7lFBZP1l+Hq4fY3YUcVcOjcSByjBwaa3ghdCi6rtEKh+2dAiM6n1v
	 7QHbXef6dxImj1rgcRVr4AnUgwQit9nuHIsu4e98R4zR95Adpm1yD7eoMNy9I/BJjSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ZpQxJ+0u;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01514606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01514606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ZpQxJ+0u
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so7088335e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792788129; x=1793392929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnyZYcAhN5YB+BHIBPYmvkepdfwjhDJxK6kMr/d0yZA=;
        b=ZpQxJ+0uZbQIi+Xorn0rFjJHsq5lajm3IKxrTWKEkqGRPXjr/5B54mREeeJMnSNIuk
         9lQgiyz2BahObsl1bIdB/YI91tO4o6M9xAPyeC75U2nZuHQDRC6IY2+IvkeXMjxHN/ud
         bL8Dwq/U9aepGAnKxsj5DECrYnlK7y9qMeLevcrIG8FS9nM0lo0rW6v6d5xfUlHaspM8
         L7ksoD01ddPprAMYmCDsBQV+E3rQVR8FcF7DyK2kQ98SJkDnOGFur2a9GeTeRgm/mBc8
         Q4JfKqOwoRSyhdIgohPAJTNMUEKz8ExOQF8CcuURYu5mfuC41G+Vf0MHt5CilQ1GjOPB
         Wm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788129; x=1793392929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MnyZYcAhN5YB+BHIBPYmvkepdfwjhDJxK6kMr/d0yZA=;
        b=cWXmoCuK+NJUaeGcgEJi9e/JSbqZe/DVmJOUYmZos7/I3dEyoNCwQKqpxcFXng+GZL
         J81Zp25gxHuAH4hbj6FJYEv6WDcOkZi8rTESsk6HDtZguR6BQ/d5D0dq6fgyC24oxt5b
         8G7E1HLgMgJueWfNEUMy5RZnEDdodXwjTz3ZKvEKsnJitA0zwf7pTnaqlDuTd2FymTID
         onXmaUEcspjYKwkB93CLXJ0B8jDuwefieKOUQt8rOJQGVHxOC5HT50TTeuanongHDCa4
         x5CGJqypowjJnY/lMiHfImLwluMC89r7CNFdXrkhiIJ6XyM6gPEnZ1N1ZgCMeGeLmf8r
         ydmg==
X-Forwarded-Encrypted: i=1; AKwUvBxVkfK6oJLdrkXDpmmk6rh5mV89O2Dfevil4AAZbdhQHXrVGUpynAGa74CKBiHITKWkD1Bu4uQJt3+ZYnM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJf/sJ5JL/di9Sb48f2i1lhpMQ3RSM03aEQr6R5h5m6gVt9yjE/
	eKCKauW60YY2Z/ALJXAzVt0ezNVxzMZNtpZFau3ON7bLEnNqTDk/lqa93WwwYk37teS3QwZ0hNT
	fPSD2pKw=
X-Gm-Gg: AYBFou1Ez68MqwsOJiYK4l9C8KuRZvedJoT13GX5XG7ArGURVfbx5LTV4pGjQUMvnOu
	oTHKcVxO1N4tNrUkYcRQvP2e2osaGtdHjPcgZ9RSGbtV2QFJWAFJzBDp5CZIpT5qigzu5gM8lyj
	d2UOYDnNFgHa/woxqQf20p/oTP2CJOVG9xIUPVZXViLm8CXZuymFBW7SfjHLgvZBezIWVJYdLkv
	0pIJu+FNV6wY5xjchEPpoDXXV1ULTXmUU/p7iO9WqDVElHWNlvZ6wJQIeKf3j7mnzmEUZrcv7Om
	pZfQH1An5XmF5AHebuLl1j1AHm60lT8UBwCmsUgk7rE//OM7CC0rPbx1jRDDSnLQkVRRlLU3YmF
	Bx24o9n/AWPdR4yU0M3IlDpjagJRO1F68D9Z9+DY0uCNPLBEMO/aUjOK96OcnSCmIVGS0h1Nwk2
	56RGPqv5IHiXSb+ssTAcb4TWxm0WrENy1VEJH9OpQzyZ+4rYP4YEH+xCoOZEFlkIGKzwCKZQj1H
	gFRducXPRE2EJfZC7YZX9P4V4oNj2WSsZUdFz8vsBNCj3FXdDwIdE/VFVgfvq9UHj9MTSAh1Ko7
	l/jV5ydeUFVNv4H5HzGygKivP6r6gZnF
X-Received: by 2002:a05:600c:8519:b0:4a3:59ee:86b with SMTP id 5b1f17b1804b1-4a35ac3b22amr1048415e9.4.1792788129204;
        Fri, 23 Oct 2026 13:42:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm253565f8f.38.2026.10.23.13.42.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:42:08 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Linus Walleij <linusw@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 2/2] pinctrl: ingenic: Add an X1600 group for 18-bit RGB on the top lines
Date: Fri, 23 Oct 2026 22:42:07 +0200
Message-ID: <20261023204207.48277-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023204207.48277-1-olivier@mgcrea.io>
References: <20261023204207.48277-1-olivier@mgcrea.io>
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

Boards that wire an 18-bit panel to the six most significant lines of
each colour leave PA0, PA1, PA8, PA9, PA16 and PA17 free for other uses,
which the cumulative lcd-16bit and lcd-18bit groups would take. Add
"lcd-18bit-msb" for that wiring.

Used on a HiBy R1, which drives its panel this way and uses PA0, PA1,
PA16 and PA17 as GPIOs.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/pinctrl/pinctrl-ingenic.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 28e7f1852054..8c424db27fd5 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2442,6 +2442,17 @@ static int x1600_lcd_24bit_pins[] = {
 	0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
 };
 
+/*
+ * 18-bit RGB on the six most significant lines of each colour of the 24-bit
+ * bus, with the clock, data enable and syncs.
+ */
+static int x1600_lcd_18bit_msb_pins[] = {
+	0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+	0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
+	0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
+	0x18, 0x19, 0x1a, 0x1b,
+};
+
 static int x1600_pwm_pwm0_pins[] = { 0x40, };
 static int x1600_pwm_pwm1_pins[] = { 0x41, };
 static int x1600_pwm_pwm2_pins[] = { 0x42, };
@@ -2503,6 +2514,7 @@ static const struct group_desc x1600_groups[] = {
 	INGENIC_PIN_GROUP("lcd-16bit", x1600_lcd_16bit, 0),
 	INGENIC_PIN_GROUP("lcd-18bit", x1600_lcd_18bit, 0),
 	INGENIC_PIN_GROUP("lcd-24bit", x1600_lcd_24bit, 0),
+	INGENIC_PIN_GROUP("lcd-18bit-msb", x1600_lcd_18bit_msb, 0),
 	INGENIC_PIN_GROUP("pwm0", x1600_pwm_pwm0, 0),
 	INGENIC_PIN_GROUP("pwm1", x1600_pwm_pwm1, 0),
 	INGENIC_PIN_GROUP("pwm2", x1600_pwm_pwm2, 0),
@@ -2549,7 +2561,7 @@ static const char * const x1600_i2s_groups[] = {
 static const char * const x1600_cim_groups[] = { "cim-data", };
 
 static const char * const x1600_lcd_groups[] = { "slcd-8bit", "slcd-16bit",
-	"lcd-16bit", "lcd-18bit", "lcd-24bit", "lcd-no-pins",
+	"lcd-16bit", "lcd-18bit", "lcd-24bit", "lcd-18bit-msb", "lcd-no-pins",
 };
 
 static const char * const x1600_pwm0_groups[] = { "pwm0", };
-- 
2.39.5

