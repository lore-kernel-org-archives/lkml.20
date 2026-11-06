Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002437;
	b=SRMSN9HEsP4P6Tn5EsYhUtdzfkuOlkSOsMoJQ4c0vQNw06hvLJzUXbDqcUmkFj7wNQ7d
	 8AtgsA8jFKOJCaVuiGNkaOCRjCTfHljLzse0FnMCGUJcWZl0ld6FAlDXqz2QVovIzmxzo
	 rbBahaXZnA46tWcaV4R2v+2S6bBxDhDFxW3qI6CK3+VK6j5eP51fKcuCjslCnfiROfTvK
	 /AWGcrSK5gOw8H//7Nh1rZxisHEz09dzQ3tsTrfB9KnUFeSzZdwlS3kjXAbauSptG+Yqy
	 YZVNg7eEOwGr/folQjs1AfIGtMRLKREOV7ezPZASiGrairDOTrllk5f7eFPpEhW6GIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QwdyqSAwt9ZXHa8EQmpcI9Z+hA8Eo7G2vXgq9LpZuac=;
	b=ASC2Peoa/W8J+Ql3fYtN1ZdaH0V1uvC3xg+B9+t3ppAyG1SAC6PNPWQkmWRelQQEN7fv
	 THVzRi7f5t+v/GfkePg9EmTAMoLA70cohfqOtqRKAS/bYjeTx9lsq2qGpcqMAmicZsvJb
	 esQ+1//gRtbzEt3FLCL+YM+H4C2B9JTdztB29mKO9ittrmLWyMjsiiljaV3PG+eLL9BPW
	 OE4UTnyg/YsLbecOcwEyK3Twq2cOdlxZNqWWMufgqYAUtYtYP7HKPZZyD6OmClzpo7rwR
	 9sIjap/W1oIN+hjf++k0n0H2a9JHFzKMeeOygfaDWbAAWGoX6pGkzao/tNyyPIYwTMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nTBEYaHo;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBDE606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EBDE606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=nTBEYaHo
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-843cf077f10so1563300a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794002435; x=1794607235; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QwdyqSAwt9ZXHa8EQmpcI9Z+hA8Eo7G2vXgq9LpZuac=;
        b=nTBEYaHoVkzmnBAHvYI0qR8FPBCAJQ1DiFUscEZsjBiIRAnNsXpQ2nc+3X4mA6shXz
         JI8KBzlPNz5NRQz+VzI4vg4qHPK1UH/PcxZgUKn8tCIDaWchOxGAkljMoStGDHn/Zgyx
         GttCgSxB6uNoC/k+p6/P/qoPE1wkI+U4Mk3V6CHpsJkvh1vRPUIP03ApW0Wwh7iitMAF
         lQoIm81NtdqfiKxiYo4F48bYGw992KUS1e5MvXHVUUgKXwkbmfd7tXLYn7wTii2V1Cgv
         J+vxKG3aZjZVhlbeowlDHGAKOsE7p8GwQBMTe4xysyFBzd858K/wi8C/Hpol0vtvRAws
         LX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002435; x=1794607235;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QwdyqSAwt9ZXHa8EQmpcI9Z+hA8Eo7G2vXgq9LpZuac=;
        b=xb455LXHj1HcmfssCLDizqXFM13PSypKZ6mxMjL5tEp3fyquZAJGfnOA7a9gzK1x1r
         ruEfXWnVfy6yeKm5hpyNDf58YSuycm5O92xqiMmY6tSBAePQB8EOOlbx2F2eFgOPrep9
         GtBLWPUi0m30CGSklALoDyFfG1vH6bNl7jYtLdKGJX88IT17OMmM7vN5dtmqTEodz7sU
         IIBm2RMNrxCDFQNfPbHe6y4MnbZbchfYvPVMBBP+5o+e/eNU8m1+2UeF/HwGJW7nDNuy
         SxC+Br4/yZQZ0ouuLBnZVlr+6wV1GQKHZMTWpEwwRNIYTSpXzFtZQf2VuAWIKm6lIpI7
         P1vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEzx65RaKiXbTFszhMk/23jEoQnJ1ivffFYvk5+MX40yoJVpMJme1d4lS3CJUH/eKFMGHhLiGG9UsooTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lE8N9c+SvLtrDeRA9c5GbmY57+FYAKam1jL3+FZ//a/nuUb9V
	7CB9YWxPIqNn6kwrsO9jm2BwyC6mdtKbYJxaryYNYqUfaR8IKxa8lzj1wyPUjz1ZnHY=
X-Gm-Gg: AYBFou1WPdHkZ1Bockj6BpEe9fIYKL4p2iJ2nuTiX6lUFvk38Y8ZhsGimW7cHVap6l3
	sQ97DOED3l8tIHWN6ax3n7Kmt6oQGBMJyCPWADbedJP3+6XkMOcz8VmUtGGUh4Vh4LpWbEPw77z
	eoE3qKFlgp0zuIfKKEUWUqtBnCqFBUvkzR10Fajjje3B7qqOga85HZ+FweEHp/a6c/SBb7P892C
	7GmFeEGrDExWIsccLu5NrS1OUsWG8DHCoi4xe5+gXZunNOZHSnMmj/sHmmk4aQMv73mdF9ipU+g
	nNyO57CVg25PMfWSCMG7sJE+p+wK6MQrF2nEBbWS/7fRLLikvwzBdeHvOWe2ZsZkjxouSDyvIIT
	rWfGNQl0oKICnaFRe6EBymh6z14wepA8Yx5/HsvT3TDr7Iz/spKmk36GtjyFylkd63Ff1FGAYch
	L4eozF0CSE+N4UHo/xLcuLBVPv3LWut90BX3dr2ehTbQXtIc8q7Zfj+1bMmghq1fFimCYbVVZV7
	hk5ngAQ6L+UZc4u0+VEp1fYzAYu4vGYyk9E1scI5T2dMhZ9I0IIlv94VUfG5lqFiQU/9sQVAYPG
	5pqX7O6/6BoU1DXttD4tznBB5XaW+bAkMN8=
X-Received: by 2002:a05:6808:3501:b0:55b:f88d:6ebb with SMTP id 5614622812f47-567e13d24e7mr3005347b6e.54.1794002435026;
        Fri, 06 Nov 2026 14:00:35 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:ce15:58eb:7458:e922])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7f010e4sm2432116b6e.14.2026.11.06.14.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:00:33 -0800 (PST)
From: "David Lechner (TI)" <dlechner@baylibre.com>
Subject: [PATCH v3 0/2] iio: adc: ti-ads112c14: add gpio support
Date: Fri, 06 Nov 2026 16:00:05 -0600
Message-Id: <20261106-iio-adc-ti-ads112c14-gpio-v3-0-7578ae66ee19@baylibre.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42QwW7DIBBEf8XiXIwXnLj2qf9R9QBkjTd1jAvYS
 hTl34tjqYceqp5WswxvBu4sYiCMrCvuLOBKkfyUhXopmB305JDTKWsmK3msWnngRJ7rk+WJ8og
 A0kLN3Zy30DbG1LapagCW788Be7o+2e8fu46LOaNNG3BzDBSTD7dn+Aqb7z85K3DgUksj4RVNr
 /Sb0beRTMDS+gvbolb5A4Oqav+CSV5xJRXopj30+qh+wR578YBfS/6btL+GGR2Rp4DYFUNKc+y
 EcJTKTwwTjqUPTsyLEdFexEjTchX7weYRZ7JSiVyozKpI3gV0OebxDTuvqsaKAQAA
X-Change-ID: 20260925-iio-adc-ti-ads112c14-gpio-197bb4c70411
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Chris Hall <c-hall@ti.com>, 
 Patrick Edwards <pedwards@ti.com>, Kurt Borja <kuurtb@gmail.com>, 
 "David Lechner (TI)" <dlechner@baylibre.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=AAn9LaE7F/d4yAucPVkMomfREi1LmOdcpZ2HvlQO6tI=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBq7k3rrCL0s3mXdauPd7B7xU2rKla6DHedimNuQ
 lnC3TfJVPyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCau5N6wAKCRDCzCAB/wGP
 wEs3B/9BmDD9G1FrqSBvCM9bSJQIOTtu16lRWEbQtrzz+603zfbQgh2VsaNCGP6plkHLvAGwpFi
 ubTEJUc1FjhX/xuV5jt3ePJUiblJDPVJuFBYCuJAIHo5FjYOnDzG3tV/VDWBT2zchzmtOb4j99o
 hOSc3ThpDVXpk6YAtMlDEaMv87hkv1XAeOfpUkKx+5XMw9N5QiP5nv0QwHkBpHCajrGkOVxPuPG
 CJJPJckB514j2BQuduOPtZX6cVbghAEYmRSIRlxgL/lqGmTj9AOptz1zmR2Oq49g8lYR41u2IG8
 FSa071Buh5ck0cdtL+h3H9WbdpdLhEPiTwiE7XHclmzbwpGW
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add GPIO controller support to the TI ADS112C14 driver. The first patch
is a small cleanup to make the GPIO register field macros usable with a
GPIO offset. The second patch adds the GPIO support.

Signed-off-by: David Lechner (TI) <dlechner@baylibre.com>
---
Changes in v3:
- Rebased on iio/togreg.
- Use device_property_match_string() for fault interrupt check.
- Use device_property_present() for gpio-controller check.
- Picked up Reviewed-by on patch 1.
- Link to v2: https://patch.msgid.link/20261009-iio-adc-ti-ads112c14-gpio-v2-0-3231a795fa63@baylibre.com

Changes in v2:
- Split out GPIO register field macro changes into a separate patch.
- Make ads112c14_reserve_ain_pin() return ain and use it in assignments.
- Shorten names of GPIO reservation helper and mask.
- Set reserved bits directly in struct instead of copying from probe.
- Use non-atomic bit ops.
- Drop unneeded bitmap_fill() in init_valid_mask().
- Add GPIOLIB dependency.
- Link to v1: https://patch.msgid.link/20260925-iio-adc-ti-ads112c14-gpio-v1-1-2a2b218ebf3a@baylibre.com

---
David Lechner (TI) (2):
      iio: adc: ti-ads112c14: parameterize GPIO register field macros
      iio: adc: ti-ads112c14: add gpio support

 drivers/iio/adc/Kconfig        |   2 +-
 drivers/iio/adc/ti-ads112c14.c | 191 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 171 insertions(+), 22 deletions(-)
---
base-commit: 1390ca4953a7400ca932cb49635f02c727f885a6
base-tree: https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
change-id: 20260925-iio-adc-ti-ads112c14-gpio-197bb4c70411

Best regards,
--  
David Lechner (TI) <dlechner@baylibre.com>

