Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778372;
	b=QwLsWPs1NeBNk8HDopYqWEzsTQ0O1a8WpMOhIjz0Leop6BHuP9/u+gcrZZlm6r7faBu3
	 UcCekSbGuxbhpMk1dA0p2U7RL98as7CMsgHlGgOQ8WcZAemcRDK4gvdUZ34RMcai4zIER
	 vqBXxXzYvvCvDCH4VGhh4bwbVsilmMiaMRDqfH8v3DC2CSEss7mFDrCEgFDcvCdhphDaO
	 tf4pf/aKONEaJa8OuVuotmoe3lJV5scK3Fi9WeQHzlhfX/pjHntHGkqIAskNh/PREZIF9
	 l1hx+wG36++cqO7jwijiMUzsY8ib4QrsnCifBFiqwNWJwfgZ/uqbJbkDAJ1A8C3b+6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=3LNah5Hnc+oQiOU9iUKOLyS8ViKTo8ncRQPeNAx1Os4=;
	b=Rv8Tbq8C65eg6dzWb+oB2wy1XeE5DXSvJSwLfCSUMPlnQvwfQLputCd+9d5H329MUX+k
	 9S01N74hZKb5ynF1a07pPGzOzr+aUfzhyhimz3TaReuQonIUamo+15XcpjJCBrT4zkSRC
	 G8f6fz/bfrvHUFHvAxF1mS1Pnb1s11Xuy1ojU1+0LZglEQf/tTR7CPyYguOuZMtYxVNmu
	 9BeYHAWNWZlJ9c0rTPQRD9KYFHIQtXWe90lmxlxz4Fm9hQeT7yh6SaWEgEiQqfnIcrzsk
	 mWVHkvpmUCBPN2sOu77TY4wPixP86zmRphbVvowmE6CdLAAWSk/3kG9O+fFKTdYgv1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OEbZgL1k;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03860A2621
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F03860A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OEbZgL1k
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48dee593f18so826205f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778371; x=1793383171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3LNah5Hnc+oQiOU9iUKOLyS8ViKTo8ncRQPeNAx1Os4=;
        b=OEbZgL1kulvSCIS4M18Jozd+OJn2wgmMdz558trPyD8wLQqmEhq4RCR9o0T1MX89nD
         HMYKXZ5hetATa12c11uKpQGbcYiyf4uupXTyEARTd9JRXS20WpY55CrrHDU+BnDZTPM9
         fGn2jZVVmV8nzcdTby2mitvPxU4QT8Ff5wK581l0nw4EiwrnEmuO766l3cItnCnEjybp
         h6akcUcHoLxgmhx+aWpaj8X36ireJPrN5YS9Eb1DdlrIAEecZMRPiauctTzqnVbTvMXy
         KBk/0sNqn3rJBxGMztCDm/kxKzMJSGinAxjMUAG4S87Dmbbuo6kZhrc/ukc/l6YH9VQF
         mWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778371; x=1793383171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3LNah5Hnc+oQiOU9iUKOLyS8ViKTo8ncRQPeNAx1Os4=;
        b=hrU6ovusxkTT+wDPp/R8vEPR4yGG7+RZ9yJyQwmJ3fnl/5+AdX5YLTWrroZVXaRwFS
         B07DURUiFPkqzvbawbt7Y7Ru9HmyUECArYzc6Q/wn2RcZgWZlgFSS2EqptFFXWsCmCFL
         BXimpucNVahDY0fkbdtDyPnWqQqjfGbbZLHIKW9p/Q64rA1NRolr6GTSa5t1rucLNzPA
         eftbp9U+zTuEnZzUwRg+1h5jtcwpvU6tF+zbYm2OD8FFvhafetYWdxewbddoXl34lhPH
         o/GZEVFHiyaUtSFuA8cqT7DcmTVBWMH3Qn2+/JO5HwaK29QnTTOw5Q8LGZBf5236D+iK
         I9gw==
X-Forwarded-Encrypted: i=1; AKwUvBx5IgeCmqMgCBoZ2Kf1BvC9KURVDvglGmKEu2Ox9QIHCVT38FbR/+aD2m5sy5ebngn3sYC2xmX8B/7DJr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNIJ0TwKrKiC8bG/IUIpxTJoVbLAhRYSp87AHsXW8RUGAdvEi5
	bb5SeBht3X6gwM0XG5ain/jQJA+Y10+r/Dhxo3k0mk601ddAerLsZZ2M
X-Gm-Gg: AYBFou2fP3P6FaAR9FgUu1uf29tK5RTQ6cUmtQKzJVC1ya2MtbcpXD6xc+JC2D2xy/j
	hyuqCMG2Oy92bH8NPZoAe5nLo6CiAxisQrfj1Bkgd+3qM8v/ztt/+X2Gy7jqFFICjnrVuNA9Hjd
	TCo2ESZV7yEMTwKySxMLM/ORzlUxxJTMEvKCYIPPzTjX6RSMnr6/MeVlt5V0e+1isqW+3UYlWdt
	zGVgVkOIwgfsGkBjj1Zc557klNeM67wPO6b9DTxImg59SgSq+3fNsLhjF4pChm9cFK2/DnVMuMt
	Zeb9SzQwMSYjfVoJlvx8IwPkQw2cRpuJeT8zNz2UzA5lWWBj37D7EYPJEnFdMKho+v/GCpbsfs3
	f5jSkZZ5NWiRPt6wGnPU5z4wRr7nq0HFejLTOmS8P5d21VonXCQ3i3RfEpStByV3IWFoLLxII3d
	Lh9cELrYjMsRDBRQ/MufAxSgDVHSS2ABHIw2yI2wZY6EFg7JkcVSpXnGAOBx+PkNC6TBE1fiv85
	LBjeIGwhIZmu1D5x9N17qc0BAEY0+MmAcpjkrh7QI8U66+uWYXVc+4eUMLt1IYsUpXTJSxWKhQ0
	mBpEfwM2NGt1WQkbvVDoMjijW0HqlPr8FUz0WmyOY6E06DoHpBYUaQM+968KmS3iSeggWpcxHrV
	8GEVPfe4/CIbRMosO+2eH18/KFBjlkLP/Cem8O/V3PC7+mw==
X-Received: by 2002:a05:6000:41c8:b0:48d:ff71:dd9d with SMTP id ffacd0b85a97d-48e3859451amr5267524f8f.23.1792778370853;
        Fri, 23 Oct 2026 10:59:30 -0700 (PDT)
Received: from iku.example.org (host86-133-9-17.range86-133.btcentralplus.com. [86.133.9.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37ca2asm1342800f8f.8.2026.10.23.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:59:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
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
Subject: [PATCH v3 6/8] iio: adc: rzt2h: Prepare for SoCs with different ADC info
Date: Fri, 23 Oct 2026 18:59:17 +0100
Message-ID: <20261023175919.160103-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261023175919.160103-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for RZ/V2H(P) support, where the ADC supports 8-bit and
12-bit conversion modes with channel configurations that differ from
RZ/T2H.

Allow each SoC to provide its own IIO info structure and use the
chip-specific configuration when registering the IIO device.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change

v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 94dad479abff..dbe82939acc2 100644
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
@@ -763,7 +764,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 		return ret;
 
 	indio_dev->name = "rzt2h-adc";
-	indio_dev->info = &rzt2h_adc_iio_info;
+	indio_dev->info = chip_info->info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = adc->channels;
 	indio_dev->num_channels = adc->num_channels;
@@ -778,6 +779,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
 	.chan_template = &rzt2h_adc_chan_template,
 	.sst_to_freq = rzt2h_adc_sst_to_freq,
+	.info = &rzt2h_adc_iio_info,
 	.num_channels = 16,
 	.features = RZT2H_ADC_FEATURE_CALIBRATION | RZT2H_ADC_FEATURE_SAMPLE_STATE,
 };
-- 
2.55.0

