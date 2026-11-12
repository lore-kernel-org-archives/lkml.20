Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503376;
	b=WtM/IdZnafIOOJUTloGslmLXjqLkr1QfTObDXo6pH4WKrOmT5pFy/PPV9xQV3pVHz8EB
	 MvD15upfWWFiiCejKEYlQQRlYlgzcxn6dQ7IenfsIdisWIGIPe/ESLqrZsA6gWRGZb8P7
	 gDUpTjEs6JHltmVsf4uC1/r8WTGJeAbIdTCuyMsB9rey16Tr6pAOSSzoUvP17IaRzcu5n
	 3oSSr07hKbiEXDzO/zi2mbloHInaatyRKEhxOWJoh/Fis7uQqW8RLDt50W3AFERbQA3Ir
	 nR9c2WsXllxIt1IdopgEwPdiqZv6YbJFg4kPAFQjHvrUVebQz81sK4vJ/FG1TlQ89Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503376;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KP1JdI3LAGwl+0wH2rIIsGhgKcmcgw/sG8waMUn76dY=;
	b=2ALVigaZeuSmndC2JeCNYeNes1yv2mWESGfPc8ZlXoinc38cKUbe+ez7lshPmKHGvpcO
	 0aLQlbHK0gAPY5gpcsCkbaQzWg1Z++Cr2TZprLlgFesOZhFVLDVEEx8B1tHd22kuhVkwW
	 LEgk/MnEbSKTl3qz3RMs8DpaYPlJ0ragfMZNpglEEU23pPx8aK5HFosIus0R0xpKAGzVl
	 HgCfCKw5HVR3m5sSvqdt28LH3dbddLnvyLnkm9PMjXyfHjrLqSy2taiIUwilhuzT8uENk
	 4YUGUvghol7S4dlRKQMzlLQVXggbkArA6Ckf9wvozH0+HoPDZDLA6Yd9PTQHuPWlgPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=F7eXa39Q;
	arc=none smtp.remote-ip=95.215.58.192
Received: from mta1.migadu.com (out-192.mta1.migadu.com [95.215.58.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DCC606A32D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4DCC606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=F7eXa39Q
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rHBbY6wUiRXUSIKaXV3BHpBvZUXlc1KXuZaN1eMIdp4=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794503374; v=1; x=1795108174;
 b=F7eXa39QL7GO9Vl2RceT7cGbxLQDZn6LP5mOSTmicdPRyEGQO6TxhvJFh/zlDviKZrDob0k7
 M8wBrXzGlXpx0UFORAGxdjc242BuMTPFoq9XPiIIANfQBI7xZLbd4D+Hi/dwzLc0Gi0DynKrcj7
 fdwIFFYP9/OJeRK3RnodAzHrt0DJ2N9oL0BE1b34kLYtH39zmfBArC34uqAL+djSK389RFD1Ky8
 9DhJPkQsvEKnQCFe3hzQ1ZjwyetLxgncuLV23s9a1kLu963ravg87mXTaOJbKjuYQL8Z670/+xD
 4pPYESEKNwyKHhCBeJvwXWyQd8BtC5bybi2TQv0M1WMUQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id be20e513b24f0ae8;
	Thu, 12 Nov 2026 17:09:33 +0000
X-Mizu-Trace-ID: be20e513b24f0ae8
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Marc Lainez <marc.lainez@gmail.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] iio: adc: qcom-spmi-adc5: Add ADC5_BAT_THERM_100K_PU
Date: Thu, 12 Nov 2026 14:07:29 -0300
Message-ID: <20261112170841.2189322-4-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112170841.2189322-1-val@packett.cool>
References: <20261112170841.2189322-1-val@packett.cool>
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

Even though it existed in bindings for the longest time,
ADC5_BAT_THERM_100K_PU was never assigned in the driver. Do so.

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/iio/adc/qcom-spmi-adc5.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
index d57ba8526e0c..c27ff89429f5 100644
--- a/drivers/iio/adc/qcom-spmi-adc5.c
+++ b/drivers/iio/adc/qcom-spmi-adc5.c
@@ -542,6 +542,8 @@ static const struct adc5_channels adc5_chans_pmic[ADC5_MAX_CHANNEL] = {
 					SCALE_HW_CALIB_DEFAULT)
 	[ADC5_XO_THERM_100K_PU]	= ADC5_CHAN_TEMP("xo_therm", 0,
 					SCALE_HW_CALIB_XOTHERM)
+	[ADC5_BAT_THERM_100K_PU]	= ADC5_CHAN_TEMP("bat_therm", 0,
+					SCALE_HW_CALIB_THERM_100K_PULLUP)
 	[ADC5_BAT_ID_100K_PU]	= ADC5_CHAN_TEMP("bat_id", 0,
 					SCALE_HW_CALIB_DEFAULT)
 	[ADC5_AMUX_THM1_100K_PU] = ADC5_CHAN_TEMP("amux_thm1_100k_pu", 0,
-- 
2.56.0

