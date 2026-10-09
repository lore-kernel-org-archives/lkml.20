Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B605013B4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571304; cv=none; b=KDOlrWHNceHTC2H65PuxBoULRRfW3AzRthq8+azh9xdMNagCtSXfBv5I0abhVtHgN8wnQA+ZIvzRk0S46ELTYQxd4M3JAbQloZHPQGG5fM8pVcocrW7SRLy5c8+ooSQJ3NLrdn0nFBcldeSB7I7P2YaZhp8vXaOG4tbA0Z0wDGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571304; c=relaxed/simple;
	bh=m2hW86t73Z61y1E4Qe5OIGQnu8oxYi3FHfoxX/depZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cwmY0HlX47lbqYjlZbl8flazS4zm5qCYtbGuCXJwAYJBDyGzlXpMr/RcscsCMtvvqb0Hgua63wAqPocGWZx7+1EirRchgw4RhaesP1OfccNxRxCQfTRZJai1YrYTwyo1LypeMz3aUF3Y2t/AGtQYjdykp/Pa7lrNMSN9/zJWTjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9gVdX9r; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9gVdX9r"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so1670245e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571294; x=1792176094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tW9nxfGnLz8J5bzFvumGC/5zr3/WbJDa5A5l/9bJW1c=;
        b=V9gVdX9rbLwfx31mTRZ3kya0qU7XR098v7EAGl8PsSteqrN8lbJTlTTRtr+cWgWJwQ
         wnyz+Tzhb5M/AL++Uxfhb8srY9MXOlIQaAr9jNcus6qIkGHM14+F6t3ICT1jN6pkhYNz
         HYuMrH8lspCMrCV8zzilfDSwGtss74Qr3jG3m/SJ8edsNp9feBIoh3jOgyIsTBIXOQNl
         IN6keZGTEBrdqM9WCLeM5W2OZRM84nIsezDWG2icXlDiUvEoKTRsF5gnW04hS1MenWE7
         KhHdFCcA4jCa19k3B9NG+u4pygxecfTJljjop+O6Y3Jw9n14oPoYVTfzthv96NeVQv3K
         awBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571294; x=1792176094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tW9nxfGnLz8J5bzFvumGC/5zr3/WbJDa5A5l/9bJW1c=;
        b=JPjsbq2ydbE3hWI7l/zCer8xha6stQr/wHK5oVP2k+GKE8FKwTQGGz9vDdA/0WlI+a
         7A5ZGUmcB4hKBVIbZWcX2CXM2kVv9U1FtlpdawGkHF19g/pxJo9IO/q6CNOKN+Aq04+j
         R27gat0azmsCIGOJKqaIzUW5+qCRMbymBwe+3NrcGtyKxHj4MmXH51zIrd7LVshto+pG
         vPZO/1rhtWVQO6q6GgBljJhmShUFnQsTngMvBSOFyh8ORn7qQrWgXQ7jfRC4nQdyCuwT
         IX7fE88PVriYAHuvswL5rc0kvUtDJFxKF3RBw5fUPnOrYpMYKONXaygsXgmb2QmvwLCM
         UquA==
X-Forwarded-Encrypted: i=1; AKwUvByRTMYbUeH1JMn9o4JTrdCzODbuBvK038nzvncu1JeX0GorRA54F3zrVbu8G7WHKjyzcaQnlFskKZyso9k=@vger.kernel.org
X-Gm-Message-State: AFuF++nQwoSM2lbaVbpmFBkpTbpkFcjsftDM36r6DbfCbU0qZxgPVDDr
	Xh8Jae6mFRfzsqEh+CvEMpn4RvuBiDAsuW42Q+HL6XCUFVOdarUfqPPk
X-Gm-Gg: AYBFou06gB7plpGhKxzKVBPiNY9M4qnMLFZy7l9vAiF2IQsWFmdY9/BHNYcC9Ke3Eaj
	U3CV76fcaXRwEvupvNwzyz3mfCIfCOL5s54qY4YdwFRS5IV64bjl9mF1Gqb8Cz24QseRhGWhPJk
	kZSKA68joxCgSMktPanOvSO2sdgeEhQuCezNQcryTcThUF0jeMqsSKn5JKIvJrAsjfVO32+zPhZ
	o0TEb6daYODOhTR8uAqoxeSGaZYtNVjBTEC6kMco2tyPlrcO/y6GI6TwCn5WR0YK5rzwLf7Fq5P
	gXkS/LPiWV1U4ZBuqPS2bkONIrzKqnIfMUYnmfHSNTQQXcP/SfsaUuy1UVXswamiCERbBYFw+E+
	sh4OF0jywm8UVrf1wCGfdAAPX/aXoG41pqFs8wAkFbHG9N2wNpvPLXBNiNwKWW3yvIC9vkXbYvG
	4HOcUAEfVxwfYO/tTtavWbu9ryzo7iUgcQYABnnhN+tnVMyjLIxGKmcBVeZdTEbAjZY6JW2F+wH
	sFbo3X8vl+LeA1aRNCiP8MlwJT/vudtBiR4v7rnvWxozdTjVu20VL2HJ9bZDqZMj2f3WD3aOOBr
	y4sxZuArqYx2Vl0xyA==
X-Received: by 2002:a05:600c:8b74:b0:4a0:2847:b6ee with SMTP id 5b1f17b1804b1-4a18e4fb8c1mr51194335e9.35.1791571294101;
        Fri, 09 Oct 2026 11:41:34 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 6/8] iio: adc: rzt2h: Prepare for SoCs with different ADC info
Date: Fri,  9 Oct 2026 19:41:20 +0100
Message-ID: <20261009184122.1378797-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for RZ/V2H(P) support, where the ADC supports 8-bit and
12-bit conversion modes with channel configurations that differ from
RZ/T2H.

Allow each SoC to provide its own IIO info structure and use the
chip-specific configuration when registering the IIO device.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 9f027d524997..041566f3059d 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -68,6 +68,7 @@ struct rzt2h_adc;
 struct rzt2h_adc_chip_info {
 	const struct iio_chan_spec *chan_template;
 	int (*sst_to_freq)(struct rzt2h_adc *adc, u8 sst);
+	const struct iio_info *info;
 	unsigned int num_channels;
 	u8 features;
 };
@@ -764,7 +765,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 		return ret;
 
 	indio_dev->name = "rzt2h-adc";
-	indio_dev->info = &rzt2h_adc_iio_info;
+	indio_dev->info = chip_info->info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = adc->channels;
 	indio_dev->num_channels = adc->num_channels;
@@ -779,6 +780,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
 	.chan_template = &rzt2h_adc_chan_template,
 	.sst_to_freq = rzt2h_adc_sst_to_freq,
+	.info = &rzt2h_adc_iio_info,
 	.num_channels = 16,
 	.features = RZT2H_ADC_FEATURE_CALIBRATION | RZT2H_ADC_FEATURE_SAMPLE_STATE,
 };
-- 
2.55.0

