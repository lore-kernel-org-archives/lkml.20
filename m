Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A58568540
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000479; cv=none; b=TEk35kJYSfG9MD1lf45a9mc6E+QWZkyIlRLKciGUvtwCt51Z565dGGHKWVPoyn2MVNYkbhVx0MB0hHjA/8J1kfT4xCTtHwr4GLL1Io1sVQkHiGvZVwkegI3WH4j0t5qQryRDMR5JPkbqukLGp8w99HAoX7a8lC7/rhvxArOfQ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000479; c=relaxed/simple;
	bh=UTEcywKoFZD90m+SBWAiEojtxQjD/HhlRH5a5/aZPb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ETuIS+IZra05PzmKfufrxEg7cR1roDiYiUQdYwLHhw3lYxQvTwPLKn8lyfdz5/4p80f3b8gdRoW6/6qQSc2qQwOJC/nSTTTvJNiry1zqU4MLXEvL9AfwBFijzlfVo6kSlKtjf5v+r9WP7LRhd8ZcEPqvoXY1wikTtARaNyyy1dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=lvrC2qT+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="lvrC2qT+"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso4104630f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000476; x=1792605276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGoIpVElJWVjTezAvTp64hzKh5QoyZgdDO1ru90XKus=;
        b=lvrC2qT+8RmBO4KHcEB5Y0mZJYuC+JTDnplYoAQW0jMaL4ly3s3dNqhH8yi9OR0yXp
         9CdbSO85kIne+TQYIfQVj0T8RdH15GMfopyY8CnagGotx7wSUFUhCmJuFwf51HdUpAwj
         mwN5Y/lR6XlYkQt7XvSLmhaAUgtUboXv3q4ycjwvROSo7wAQKFo56CFDWbCB33+PKqJX
         +ts/MNPOAo/sRwyXxdBXxrqI56z0b8tgxMqw/ZqxngkDWV56YygcG2dXsSPJaZH5j3Vq
         Kb+myaCd/VMqxqpAnItXFa4W/Nw1vj1hYpRgKF9sRfk08y4DpBHMUdSBUdpcuBx6smW4
         rCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000476; x=1792605276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGoIpVElJWVjTezAvTp64hzKh5QoyZgdDO1ru90XKus=;
        b=biC+R10m76pKPDTzjcXwaOVewgPoZQJcd5xSrXDKzpTWARRdZVKI7CvrVtpDxyPWGC
         lvDqOhnJMjesXfehiaf+dJJN9N52W0XKtKCZP9FhLlFwWrJ3m+U92qJ2xCxaDGrEnwpe
         UUY7mhHonaorjB/8p1nkfm0ykxRanA0lT83JQGUXIPRqBZPdcRf4v0rZRzWgKPZdoqXB
         Byabk49wRU9msffmZLr58+DnY+9BT0dNCqMIxX4t7TZr/4bZcb4N6UU/2I8tQYu1dQG8
         HjZ3kpPORBN3guN/rFN+wA8igSxJXQlWpdVS9ji28OBNivM8kQtjQCrXMpOd+iK5RmpD
         TKFg==
X-Forwarded-Encrypted: i=1; AKwUvBxxfKE905PjfW00BWX61j985cNWBS6jiHK/2nYlyoIgudSbMxgXqEqXhMkSyaesh5C/1uzNydsxQPM5Bn0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLv63zITwcXwSaJgKf54EKbE+6oKTk41NfxAVTigbtdL9smol2f
	FVVYR2CnCTGccq9ZBRSD4tLTXb2Rm3vkwwLfU4YZ3DQYpNoMFGlK1lGxyNfEwWFj61SJZMYM/5v
	06nonT5g=
X-Gm-Gg: AYBFou1e3JByN3G3gk/82h9/UqhBWlvYcP9QazqxX1QY5MQ5nJvbx6ttf7B/070YWt7
	KwY5Wyr2DQnLbUSx5o/Eg5oPtFuru7fQKjLJxYWah1CrM1S8NGy/CAOQ54apeXM7I8PMhguRPRW
	rHARlJ+/Cxjtssuzp5B3nyHcXvA5s7BV5z5SZxk2/PenGGXtydbwZTX0Mqykf7+OPpKEWKRl2si
	SXlS9ZRbPWdGs6V/t15XRaaI5dibHoHja4ueact04MzBaXT5TrCg1gK7JFEn2PdKU/pvLrM6qRG
	8UE7FsXwmd6QTg4s/wQE30Vs9humgijlT938+P6fu36blmkBwembLCL4vjwbDiz8bLBRr7ZI6ko
	IMzexOosBr8jdhLPoL7CmCReOImNXa/QLtKmUjFkRzgZ29ND3MKMApXjc5LKHCTxAz89WwnRE71
	AUsz+ZCIwma8Rj2n8NSFMs0dG+Pv/xZ7aJLx9dim1MlHFvttcCqLamJijNnIv7MYba7CBSfjKZ6
	QICFwv/aVJOKbEmPn5YJDYNfqJEo0zUqAHhbFfzOLuBbZ/jhg==
X-Received: by 2002:a05:600c:5254:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a18e4aa11dmr338035925e9.16.1792000476408;
        Wed, 14 Oct 2026 10:54:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:35 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:28 +0100
Subject: [PATCH v3 07/14] media: sony-starvis2: Correct the exposure range
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-7-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The software reference for imx678 lists register SHR0 setting
the shutter sweep time with a valid range of 4 to (Number of
lines per frame - 1), and then gives the example of all-pixel
scan mode with VMAX=2250 and SHR0=2249 giving an integration
time of "1H + Toffset" (further defining Toffset as 0).

The driver defining STARVIS2_EXPOSURE_MIN as 2 would therefore
be contradictory, and doubles the minimum exposure achievable.
The maximum exposure is derived from STARVIS2_SHR_MIN which
is defined as 8, when the actual minimum for that register is
4.

Correct STARVIS2_EXPOSURE_MIN and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 72fb037d7dbe..4fade8671bb5 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -61,10 +61,10 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR                  CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN                  8
+#define STARVIS2_SHR_MIN                  4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN             2
+#define STARVIS2_EXPOSURE_MIN             1
 #define STARVIS2_EXPOSURE_STEP            1
 #define STARVIS2_EXPOSURE_DEFAULT         1000
 

-- 
2.34.1

