Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278470;
	b=0xUxXgmI+PlJUDc7ULMZp73pE3X0PLHbj0VYebn4NUPY5NE9UtUbhAhyKqvKfOWZjiTG
	 4PN7gJ2wotAMNnPw/jRtTvMGbx/AFNi7qbRoHeKh/l9UMb2r8jcLz3U+p7aaOWUMa1Neg
	 Vrz1LCWAyk4231CJV8MEAMXvrm3lmZm/lqrxUxXP/eYQzz2zNiQRjtfeuSxPCwCoVm5Zj
	 HU+SIcb9h+j0uHtHZExXf/etXhtvWZEpC85LR+4P9qq5ne2xHyz8dWjXz0uGae7ar45uh
	 Rvfdj9tl+zZhuM7OFa60GhBvikthgBgE5t/E5pV+KQchr//srme7b4Czgdco5rcE7Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mDWvJ/spQ38SUWYEopGVk8Tl0kmsuPeTE8Bb7tZRtgU=;
	b=5r4Nw913raTP+9XzI/vgCoJN6+AqEcCkXT/82xQNXmuJOWE8qS4tZxWT7vK5ntM0W14T
	 Vi3t8dPbKZo85On/YBGWfpnPEChzs/1JLaeRJ4pWdMsOvarRJc8yXh6Hj1RkSK8Vuemzu
	 sAOGbUCJQvjeQdPnqvPfAIWX2ij3QXbHcMig+2A8n5gSUsvYlpOE4PNRkhZoO59pzDn/b
	 8IBkoXO8PR6VEgh3eC83ntGlrDzIwedA4PG2Hyhe4Yh3crf3HjFeIArI91fRbfO+Hw/lR
	 pQlenC+E8qwx0s3Ta/4Y4y6+NPMEJQZkuRqYYk1K47mdQm37jhzEHx7LsatVaAyp54A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DfDmthz2;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF94606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF94606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DfDmthz2
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b042c0759so1082116f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278468; x=1793883268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDWvJ/spQ38SUWYEopGVk8Tl0kmsuPeTE8Bb7tZRtgU=;
        b=DfDmthz203DVEilCItT2IWB9LdNbSNUFEdit0b4o8ZkhdWvDFU7dx/CUKR0IgwidIn
         dETTSM6gZmjbtpSQoLs+FhRB7y5IseeE510Mee/mi+LIAgqQpZuvqLDYRoV2spkvOOr/
         3q1iEi4AAnPb/IcnPzqFtMZEOrgZekkK2mgMuM0Nu56uojDOYgOveUwjagSBMYEv0h0M
         jCXEo7M34jXvgVOymcwdcVa+zHyuipa7lMWUYmXydd8WU4ccelVnXDtS+rGR9EKmwY2A
         gpS4CMxm4inR8ly56ug0xAvd874CfmImbS68ygmpbeuxtKtgzL21/fk0GlH7G3fnGSoI
         rTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278468; x=1793883268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDWvJ/spQ38SUWYEopGVk8Tl0kmsuPeTE8Bb7tZRtgU=;
        b=ijGR0xzdytnrEj8uhvf2gHdpswE4XXOh2crjcXcrH86KXvram9QLubi+8fEIQk6f+3
         7gWr2qKyT6xacwJXf6v1fmLWAvouIUxbsmWz+GxU93nPrmMfzDNOOFKQyq/Ljj4fDPZY
         1EEuqmbqNtMwgQWk9ygNcXKslMt3SHO53zFwmOeHu8Fcm/05bS6LWxC5SpyERJZ87bs4
         5tlRAlL4TkDeKTKD1NFcRTPJwstPS8sK1zOpy5V6ZviPOzlQlBmWLNUGSxNEoil/kYtm
         lY0U2Kr1Bc02VtpxWd862dPhIBDixrZgC1Gvh4zxsI9v9vzrpNo9k29X7SpCPeB2/kq4
         sVAQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1d8SEvoEuYFp958/NayVIYbNd6d/J0HWYZuQj3zpGI1dbSVU02VP2AHIjYogc6buQQV7nD4DEh5uKa8U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJZahz5d1JPqPOtAjyW1wqvaGQDCjS05t3lHCAz8f+RIV3/Ps5H
	GIaJ8DhmFUAoCrM11NNh5ZsYqO0p0JfuOFwOq3vhmrqahg4gC/rND//7pIMqE4kjXjI=
X-Gm-Gg: AYBFou01+2f/YzS7+GyngEmWCBpr9bIMqFrUxEgFuDWs49oLeW86EVcLLND+yPzaoQx
	LNozV5vz98IkzNqgknGLcTKXKI2HvkB+5pylaMYNGc6vbcOqBt7AjQUYTWLlYG84WbjeD6upn+W
	UyzZHYSQI0AZG/rj69naeR5l//gAygpN688dgEW10TcQyP1ZQVDFqpU2iQCOKwJSLfEZuhS8+0Z
	VLIu3Dvk7LUBTg6RnQcDCo+IhGcahz5fLCWhexlOH4blNsKizml6TDuVNKF5ev7NM5mMm2KyzvT
	jNzePGC7NKDy7RtT9nhVsx+Se6N5iFjMyd8xceg4fUAfwryy0KUrzEpxKuyCymPpC1GABv6rPy3
	NiFCx28rdR1u5e493tCpZ5/Jno0o1omNcHOWCBFH/OlxjkiQM9z7HKJdW6UiKi2J7C/pQBeLkBF
	Q0sJ2F6D0gVWsbRigd5PiGi00frQqoowfUFuPWby1yl4z3zCf/JKSRTrH0hLLERI2b6xIHBOgL5
	ffxkAwmGMsXotTun9tmdlln9JQBJbfzyi5wyEYJ/RX+KmZ7YV6nil2OxF5IseT4RRrAHNwyhAQF
	sB4cBS8FAOROeRke7Si65ngdIV61ag8r+HsyM6FqopDySdiB7/RRrj33GZO3Lj4to4xT1imq65m
	AZnrHSUQE8z0LLiNWcgaaNE1cXUUPSvmb/wNvTpYgjoZu5X5VrtwgnRE/NbgZsW7VSjUj
X-Received: by 2002:a05:6000:29cf:b0:48e:2a04:4ea3 with SMTP id ffacd0b85a97d-48e5d284e09mr8938581f8f.8.1793278467853;
        Thu, 29 Oct 2026 05:54:27 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:27 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 13:54:19 +0100
Subject: [PATCH v2 1/3] clk: meson: gxbb: add the missing HDMI divider /4
 alias
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
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-1-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On GXL, HDMI PLL divider values 2 and 3 both select /4, but only value 2
is listed in the table. Reading value 3 therefore gives an unknown
divisor and an incorrect clock rate.

Add value 3 to the table. This also avoids a division by zero when the
read-only rate-rounding helper uses the value read from hardware.

Fixes: 5b1a43950fd3 ("clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..8cb6404c0efd 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -350,12 +350,13 @@ static struct clk_regmap gxbb_hdmi_pll = {
 
 /*
  * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 

-- 
2.56.0

