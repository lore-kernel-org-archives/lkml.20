Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680682;
	b=E+QTy+tecwHDWoLr0SeEzXOJ9MLFusVOjGWSt8DI3fMhJzqJiESR2bcho5d37l7XgFyH
	 C6o4r7D+av0FBFGNqRnRutDKp3rSbrp64rJUhYlfflkm9doaSXgKnFkX44BNodU0+iyVC
	 A4AAum5z+THt8sSCRd11m0m8MENZusgJe+Bc7DOi12Gl4nOesd0JSqK1L4XGVpZkVAtQd
	 oM/c/hSEPxPE679VIJNUe0On0LlWE7HzwlCyND3WRlfuaWDQfZGYhzpEypHOhGFYIY9sy
	 TbB+RvOWJZCgCM21xfo2iBPiB6ikAHDSvo+vbqZj+c1rql3zlZIRKsfroZzxt4jhwUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
	b=3ixWQk3woY6nbd3z3uLGTWGgXAhP0cag+FbzpXYo7gvLgPVKRMhkEvh+BdRJnUFoJ5Ol
	 Ahg/axAl6/+3Tjop9Zd6/aDMv22SF2rYHIPEk2eYj5wC+I854r2c2LJL2ZRLiK9MLNFi3
	 pV7bU69w0RsLMgYrD0Kjy1wVJAlxsXxcwUMTw6cg93sT9jk73M+naUAfdECzL83Sr7wDu
	 JdUgyFmC6UIfVwea5bTTsKn5/sDF6rP1dPzQJDHsT42dMVHCXTToSpS9gnF3JbFkOkSec
	 RCg2B/4JGEWyhQmyBfLbT0HZINSvEu+eYnT6/h13AA0DMXZKGC4jwGq/gQXXNiZojIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EjfUq8wZ;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5794E606A33D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5794E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EjfUq8wZ
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc502d509c0so1462841a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680682; x=1794285482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
        b=EjfUq8wZKD3R/dDZ+kWoTopD8ZmC+9X4+EPqk09OXIxHyQJwsEL/xubPSC4orNaHsC
         +j/c1FlnEz1/o3R2o9ojMrNKFQ23qP0jDRDia+XjPzd6TuMFnBBOo48A9RaL8BJ7KaPx
         A1VcrY6HmIkHZq5Rsrz+3DJJmNd4RqZiZbUUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680682; x=1794285482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jwXE6HVPE3u8H2VoPGvf+65Nm9Ko3QG6ghTmXH3WIyI=;
        b=P+iK8jqwacWVTqP2xJgr4JcT2BX4j6PGurv+DkmuOCGMrLTmetCY/ybAsoqIanKkEg
         uDC6hn75N7/bDzzcrzfaeLAXiMyvEb1qAVRKpVl/J9v27+Okykv8tUod3B+aXYqM8E8b
         TZYHUT6uDHqwVrZ9t3Uevlb1YRCiCeW0PLRvy3CNO4cAwwh7tZVTyag01odM4U3BLCsZ
         feqGvSAaV5xGSOTtYI+hzGJIqMv17LH0wXbIojKzOUqhmoNUJyFogbeQzkkrMt/7enUf
         8PiXzsOjaapvJQmeIpCnanK/5XOL6Z7ejWb89QQSYJfAY/RXjkTwoxhsOZK0oB1E0SAb
         DWxA==
X-Forwarded-Encrypted: i=1; AKwUvBz3HCgziMwzCtZ/RcdvIx/5SIa4cBeJuS7U+iBruIPSPkUUrKwXqQBzrEBM4+2SPOSTYuJ17CQryNFcFx8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rqtSUOh+u+sCxU8lZVsKAG5fH70Vr6PSqxxrauVgNy4Pjy09t
	UOx1ib9mboL2CGcvbY3ruGXlT+8oEzxjXQ2WDm2+XvLET11ovEL5/P0SdgdMvzG2Bw==
X-Gm-Gg: AYBFou1sh99XwkgFCkqnn0icgv+7/+D9CzvE5oBav7pS6rMzajmG9lQeklFSGqJFz4q
	k/V4L7bQ5qOPn6guPnC55DQaEB9iI58wY3lmh1KzNuCsGPe0ZuD4gbUTGrAfMCuVY9K9Y3QRJtg
	fI6M7B/ME3LQByz6WyNstuvX/ZoAcxBdZGc4CM7ezB+knlUoBzsYi4KEuW2UeT6FLdzMdYiUj4Y
	RIPOWan2BQxGbVvnjq+PdqL3BnHV2W65uuiOR7Y60TpYdZ34c0r6S/uYp9I2tBgM16SiENbeWiE
	NWLLC++1a6lTSfB0EaPE8nCHbAjVbxspaLmuOTfpyeSUEbRw2WYA76zyP4d3G+ftULPTrlx1HPH
	G/c23ncX10laMZieU8PlzGmPF0Z+4mBDBc4/J/LSsWMRTZPA7vHGMuScQqqlLAusLyhtFCPKOXh
	NCfNzJ1RqNlp72Iz7Bg9HkdUnVKOnCcTQA1a5yGRo3uJmzZ83VO+TbiAvyxHTCepue7eyF9M3U1
	N4Cl1TY2QHUkKRqmHDWvf6pAfqEnQ6NuyP48VT5QAKQV2hEFssgjSzx+zLZ2Pern+TAnUiaHVgy
	TqDkz6ItnrC5ORYP6susgSyKcElQLZilSozmSA/8aXAH+ZYHpGbWwc7wmNJ1Tin0f5W4RToOK3V
	VuVCSWUn1nwWZ
X-Received: by 2002:a17:90b:2fcd:b0:3ac:a7ee:6780 with SMTP id 98e67ed59e1d1-3ae8986606fmr10535707a91.66.1793680681667;
        Mon, 02 Nov 2026 20:38:01 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:38:01 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/8] i2c: of-prober: skip post-power-on delay if powered on sufficiently long
Date: Tue,  3 Nov 2026 12:37:28 +0800
Message-ID: <20261103043734.2179858-5-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
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

On some devices the I2C component is powered from an always-on power
rail, or the power rail has been left on by either POR defaults or
the bootloader. By the time the prober probes the device, the device
most certainly has finished initializing and can respond. There is no
need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree and the component prober. This is undesired, as the device tree
is not fully describing the hardware.

Switch to the new regulator_enable_and_wait() function that makes sure
a certain amount of time has passed since the regulator supply was
actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_enable_and_wait() API
---
 drivers/i2c/i2c-core-of-prober.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 6a82b03809d4..f9f3c0ef93ff 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
+#include <linux/time.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -226,13 +227,11 @@ static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_o
 
 	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
 
-	ret = regulator_enable(ctx->supply);
+	ret = regulator_enable_and_wait(ctx->supply,
+					ctx->opts->post_power_on_delay_ms * USEC_PER_MSEC);
 	if (ret)
 		return ret;
 
-	if (ctx->opts->post_power_on_delay_ms)
-		msleep(ctx->opts->post_power_on_delay_ms);
-
 	return 0;
 }
 
-- 
2.56.0.385.gac671c819a-goog

