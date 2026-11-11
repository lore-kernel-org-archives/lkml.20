Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415264;
	b=yR/KiePstk+9t8Jmg8vcJLxyfhYsKZlFzJf6xK6qkOJWU2vsCWkMc+HY8FmMz6w9O1gm
	 k3oCPz+9DpzucQOmDyorXx3RhEW1IISuI77lz1YjA3kIEuNGnpTEUgpbJ8xMqBW2EnR0I
	 f/iMrJGEyXfrQkv/klpZ1ruQ4D42CeH0Y/BrUgDSGMdxz28QwUJuL1+hq91GmEcdX1pXu
	 hqUyDuGp94nghH1sIDx+SRRWfFuW57jaT6SMrb6ypk3rz5szecZUVl+rdDCrXc8T04Yln
	 VtpaNw0UwG1tByoz8y5taqVtQRE1lQ/Kp4JNfh72ycTT3WNZQ9xeQspQMzeVNjgQ8FQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cx2GJZv0nPlyc2oGZvUNO5nAv52QpPBEMd8qDdNdp+0=;
	b=JEIocUC+oHj/3CHKD4NiS0hPjVaUq+4e09lpIbrdq/usFglLCg+ZNbdfsma87NWFhq5Y
	 NWuFLc35drYoJ+k/2Oeuu0eXl7rPLSwqseIxePQuvwdWaC5jUq6cBTnqdYuTRaRo03iiY
	 3KseqlgU4x1xqmQvUkQFwsmb7KjgG9nK7/qwR41ephi9ymWJoiis4TjY3wQpiRHacUbXx
	 0Nu/+zYIJlsAtP/gzrbgaFihWTV0ygQCG4GMkN7TDQGrviNz4FAFzQGtCmrvLsonrrVNs
	 PaHyO8npXWW8FiaohYldfT1DKy/jcA239/IZN3sz0gjUt/QbK0bTjpqtaQJ0kaUAHEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bARyq5AF;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF3C60A261E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EF3C60A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bARyq5AF
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3700ed8dbe3so5975671eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415263; x=1795020063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cx2GJZv0nPlyc2oGZvUNO5nAv52QpPBEMd8qDdNdp+0=;
        b=bARyq5AFbyOGkATwqw5u+y5bIeorjoJb+ZdCWCH4hIkcz72XXq36gjyWbLpPPlp9Aa
         umeY/AqAcpKk8/QUaqx9l02V4Csog8pjAYXBhNPwZhZqGdMbnVsYoGYpo3ulpqrGtyTc
         pcgSxEyI1+d+4w8+cB20bsIETRkPOxLMUSH5vreHxaX5wK8jqlZbWZmRcy2e7Vv84XSn
         nwiU/HxZqfDVLmChEk/8KGM2/LMcLfx9x2GUYkNETKs16mFrKgs0tP+Y+PMri3txMO1y
         jg+W8HyPqbm4Sy4gOSwukRNqot4Mf2ilCOds11vE99KUgIFvTm4QGeHBGvAKpSv5Ii/3
         4Zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415263; x=1795020063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cx2GJZv0nPlyc2oGZvUNO5nAv52QpPBEMd8qDdNdp+0=;
        b=ZHAFJp0gcRwPc3U0fqZumKg/37cI4vHRsck8bGcuXZkaXtcGYgXyNuM/Q6GcXqxYNP
         jJk/0N6rCP+GIIqc7m9Tno/FrPuXOXN0jspn2xro4oYPjSWUTLifXvOkob8KdVWqagAN
         a3XMyKx0KV6sPr43kvjQkKDfU42FSlG+QSDbkyBKx+FHNmH6/lljdvFnWvKbTtmxoruH
         TkM+n8jqefSNihB+z1IXA2uhTqIo8GnBimuk5baNRzz38MaGu9zlatTjaKFdgqIwodt3
         vEPh3H2+qY+UbKA471RH7DFVmyWfBzlNXUcK8zggHdU9Yjs2m/qwUDrp4z7e+oQ87Xve
         vmaA==
X-Forwarded-Encrypted: i=1; AL+hErFb4OVqJ0J+nBvDLWudwJn+64FxLQ44EHzRT7T82x+sAynnwPdV6WHRSEi/9V2JCeO6MBl6Y4RId+bN29Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e4mFUbvuH0bDsTLndPp60wfWH1ewZq0eoDHmuemdUCEmCKdU+
	orE/OjLiHPKE4mbdjWUUMZ6aIcFegt5s3TyneJy0QECNlb4t9h2qjaq2
X-Gm-Gg: AYBFou0dLRHfxVtJWcl7rMiJhxgEGoC2ouD9uoNM/l0h+5M4cOH63jNMBCPyu7sau1c
	J3efCEHTACJPpnIWcj30W53cZuttKsQEmS3PJ4CSfK2D/hvNgiPudotaPHPWqbV2AxuG0vM2hEQ
	PD6G393IRwo+yezdcsA4+7ETk2ax1jvoRHxgtv3lZAuVypau4RK5eAt9fzCvylhMgml9qlpw4Ou
	dRew5CefK5c0nnI322BDFbbDGVboh1ZJjbhG7tN5AWrWPlOUVCTAbFGv47YCI9V42bTFZTPZ8MH
	NlaQ1Xn2HAAK4rb+T1RzDJOWiCXs7M0Ya5xhd5i+ca0WokSMtRjRuBS34U0VE7Ci1auKyyhbXM6
	erTIzEG93uoIIKQ6cuXT7vYqNf8XxLW+pwwuvA8HdA/efV3cL00Ee3TUIBhOr2HgnxFtzlVdieW
	GH/zD/pKsnpqlKm+f6RcF3pwhCr6TejiQNKsgXNeEeEVRS/Lz7c8N28RyDrQ9fZHFp/Ygh2dJfN
	TVpOH2LKRbODzNiO9uIVy6EnVGfWDE1NLuXf/yRCmjb1LUCL5te3alkCXTgHIwzEDNA5UIwWNl/
	oLCszEn93KFjrRwOx7TnI5+ZhHvQZeKrGqGJjvkTCQ/GaktMWWLfD4HZHO36ym4f0fKOP9jhnJW
	JH17TUNWMsr8TxJ7V11/9ov8+W9fTKVDDb6Vg+0avw6eeKdKnwDVaurDVmhSSyvQku0Xniz5kkd
	AQcoIUg0zXu0xTsuTjO9btqAGD1xsZzW6gmyPk+hZZAw==
X-Received: by 2002:a05:7301:1604:b0:376:a6d7:8f6f with SMTP id 5a478bee46e88-376a6d7908bmr2936467eec.17.1794415263376;
        Wed, 11 Nov 2026 08:41:03 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e76e2sm19158013eec.24.2026.11.11.08.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:41:02 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Gwendal Grignou <gwendal@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH v3 2/2] iio: proximity: sx9360: reject out-of-range hardware gain values
Date: Wed, 11 Nov 2026 22:10:37 +0530
Message-ID: <20261111164041.341776-3-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111164041.341776-1-kapoorarnav43@gmail.com>
References: <20261111164041.341776-1-kapoorarnav43@gmail.com>
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

sx9360_write_gain() passes the value from userspace to ilog2() and then
FIELD_PREP() into the 3-bit PROX_CTRL0 gain field without checking it,
so some values silently program a gain unrelated to the one requested,
and the write still reports success:

  - 16 to 255 write gain codes 4 to 7, which the driver does not
    advertise, and the next read reports gains of 16 to 128;
  - 256 and larger wrap around in the field, e.g. 256 sets a gain of 1;
  - 0 and negative values write code 7 (read back as 128), because
    ilog2(0) is -1 and a negative int becomes a large unsigned value.

Return -ERANGE for values <= 0 and for values above the gain of 8 code.
FIELD_FIT() is not enough here, as the field also holds codes 4 to 7,
which the driver doesn't support. Values between the supported gains
of 1, 2, 4 and 8 are still rounded down, as before.

Fixes: 1cdb4c47f7f5 ("iio:proximity:sx9360: Add sx9360 support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 drivers/iio/proximity/sx9360.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 2a9b37df8f62..22b6b751c0a3 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -68,6 +68,7 @@
 #define SX9360_REG_PROX_CTRL0_PHM	0x41
 #define SX9360_REG_PROX_CTRL0_GAIN_MASK	GENMASK(5, 3)
 #define SX9360_REG_PROX_CTRL0_GAIN_1		0x80
+#define SX9360_REG_PROX_CTRL0_GAIN_8		0x3
 #define SX9360_REG_PROX_CTRL0_RAWFILT_MASK	GENMASK(2, 0)
 #define SX9360_REG_PROX_CTRL0_RAWFILT_1P50	0x01
 #define SX9360_REG_PROX_CTRL1		0x42
@@ -625,7 +626,13 @@ static int sx9360_write_gain(struct sx_common_data *data,
 {
 	unsigned int gain, reg;
 
+	if (val <= 0)
+		return -ERANGE;
+
 	gain = ilog2(val);
+	if (gain > SX9360_REG_PROX_CTRL0_GAIN_8)
+		return -ERANGE;
+
 	reg = SX9360_REG_PROX_CTRL0_PHR + chan->channel;
 	gain = FIELD_PREP(SX9360_REG_PROX_CTRL0_GAIN_MASK, gain);
 
-- 
2.53.0

