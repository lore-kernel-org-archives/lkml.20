Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105406;
	b=5HMWCuetAhG2lO5El5vlKYRTCWdjK0EDeBEsxnc1HKCD3O0rw36QRu62Ub/J1HlNAzY/
	 fZ2tCf2JSuFuv0DbbpnOYKngSwWqTX8Ylyza8Plu6w0GSlMphTHjbCRMc19sjmJB9U2dE
	 IqPvc86yuCrZ9IRf2f4FdVG77/Em7zh9QJPUaFtoSPUmJceyGtgCCv7OygJSSE4cd8ix3
	 ILjc1nNbpAbeoJSaJwSBNCFLeLrRX6Zkagowh1AGdAmprn12fEoFiEyDAo2xM28ZcolBs
	 6U5GHWU9PGXFQF9+DymvOYYAKEtxO7IvzHA2ksHY+sfca1ABnpfkrlzKCKtak9APHJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
	b=1Bb8I2Z0xndvS7tvJdKu63NaX/PJj1cfILx4JbW0sOZPxXEd0C/Q5vWiir/8PDwzo3ev
	 GoNV72G9SKg+1Y34WOUlEDSS4BELKfjR78pcsWxM04pAIu/znb0aX8fJ1Kz6aqgEWl5o2
	 o3/5mShM7JUlIrUgyu27yo+Bnqyn1Kv1M0ckjDLUYPrIhnL5jrwscxnsPhx5TkPzZtdE+
	 6mEVN6y65Q5X0d8zeNGxRTQUvK5UYIQd7EcB5cqv/9+UH/tw3SnzHS9ZVzbzC+bIvVPXX
	 evf8uW4aUeozGv5x3ma0eeM1C2kCV2RcWh8bE5D3eTuabaKT1gV7a7wfEs0ZpqFpm+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HisGQ0qh;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8395606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8395606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HisGQ0qh
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be416e603cso2452891e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793105404; x=1793710204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
        b=HisGQ0qht2PJXTGw5WAvL5jvm2y81pQfxwwDQ4pzxV7qEjKiv/cqetdgchEhFLiQLm
         ROP5GV/aiLKdwUS5yrc42cRdpfbWE6g6/AZoVTpM3DOxB1HL5tKE2Yt5IkGDO4waVpbk
         awtdsgY7FcZ3vowE/ptcyBfXU2C336wcXkxZ7EMY2GPg1Bl/VWuYLNep3txus1W61/Ks
         uCY26n0GZGaAgOEGI1fvCI8j1vekzG/24grSoR7ldsnRPwon7x2Xrfe2Dm+IuyclK8B1
         i0l7aoi1lkIR4OxsL5LDbEJ9nIrCcBli6PE0+oWTTTNIXk3EFHKTG0yEoxJwFwqMR14s
         puDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105404; x=1793710204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pkcAkMdCRwIuT9szM2gCVVjCSXFflqIHrQQCvrEeeZg=;
        b=tpSKXtC3BAWHQNSwnhLsqw7c0F2fovrex7wybyymP9Hn2t+e7I1x4qYNl6g5lQjWzL
         VFUWubIM09Q6seyO66dhHAuK166eKFx57uAYGvHTNhr1IVNH3KKLmYK62GzIPiuOPKf0
         07sa/3o9Lh3WeWRWRqLlz8guCGky/T5dJrHSqokAl1MMI3QSWlE0rNNmdtq6aV236Uz+
         Ow+3ZeLgTASawATJC2Ifqe3dKiAzP+/11tPD7JG74FgIkCfaT8Nlb2+BZGfiGAb3IIUp
         sWuB4hN/CghhoXn6+R6kGLKm6aKgVVII1II9ulDa0Uuppstinwjn2V2+bUo/QfYVZZYU
         Dqsw==
X-Forwarded-Encrypted: i=1; AKwUvBxWoxN93OcUrCVB8KQA2FZeUzA/eGMHwgSE7N8+nnNHzMAn7/Rot3D6WWNVKXPmZik4nay8no4vhvxzSGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ/TC9RMBC+tHBthvQMhf4V7JAwBPU/GWmTDTh3QcmuSq46hXvk
	bxPL8ziZIIndX8LvLKdErLI7eCuXD9I5kbWIb5atH+11neio1QjKOBPd
X-Gm-Gg: AYBFou09WedY8H94+nnLgxxtFud8Ml4K651CXNdiMYyHIgHaJvkRVTgRhbMToHlpOhu
	cb36AxefRDitkdoQ5pw4W1XoDKPPrZ9+GbmU/xpqNWFlrO4//VdxOuumOIROeALP7ryQJY9/wak
	4ziU+eztN54kM/l57XC606miioFlO2pVeG6vFUOiwbEh/80/lfCzAfmW8NYwNFyNkyazglqg132
	9WG700Kfy3VivJqTDRcrOXfFJNJM590MFeNNNPsAo6FsPvalJJKG15eiXxuu21HGkMh0sJA70Ph
	tlEdKSsw8/80DDnJT7a2v5TOS/QI8ioWQkwVtMM6h32DXa5YQ1HdQBzaJgkK/B3k4SCMz/IfeTt
	liODd5DUGT0bnN0kqjEfTFOUXHdeiUkb3L4u/UugvbRaXV4UVhRUX+ebhuiErdQC1TqB7Ra58KP
	cWWITI7Zp+CKegKll6a2iXFRBYmvJVTQ38sJiiou8di9micfAQyJ7su4xmcp7f0xyaPm015k8c1
	Nl8QOWnJxpb+RFBBYsjsAhJCb0ze0PEaTtMbEGfJcPRiOYayvJB1gQo181sy60iTN6y2y8hIKNU
	+T+r0wSfwD/zhnBT1Gc0314LjIraR+Xxox9NdWhbSSimSmsich0bPRAemkyj07F613tgeCgt4u9
	CGR29Y+usrw==
X-Received: by 2002:a05:6512:1047:b0:5bc:d9de:d75c with SMTP id 2adb3069b0e04-5bfb71e3343mr3417911e87.47.1793105403789;
        Tue, 27 Oct 2026 05:50:03 -0700 (PDT)
Received: from yantra.. (nekmmqtcmoboczbkdcs-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:55c8:a52b:6ba2:979c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7e7cb24sm2052803e87.25.2026.10.27.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:50:03 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Alex Lanzano <lanzano.alex@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	Guenter Roeck <groeck@chromium.org>,
	Jagath Jog J <jagathjog1996@gmail.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Remi Buisson <remi.buisson@tdk.com>
Cc: chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Marco Elver <elver@google.com>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Subject: [PATCH v4 1/9] iio: adc: qcom-spmi-adc5-gen3: fix lock annotations on mutex helpers
Date: Tue, 27 Oct 2026 14:49:46 +0200
Message-ID: <20261027124954.110697-2-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027124954.110697-1-zoone.rupert@gmail.com>
References: <20261027124954.110697-1-zoone.rupert@gmail.com>
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

Since commit 5b63d0ae94cc ("compiler-context-analysis: Remove Sparse
support"), __acquires() and __releases() only feed context analysis.
Their argument is parsed before the function body, where only dev is in
scope, so with analysis enabled for this file the build fails:

  error: use of undeclared identifier 'adc'

Name the lock through dev, the same way the bodies find it. The analysis
then also checks that the helpers really take and drop it.

Suggested-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

v4: name the lock through dev instead of __context_unsafe() (Bart),
    now the first patch of the series that enables the analysis (Jonathan)
v3: drop Fixes tag (Jonathan), trailer cleanup (Andy)
    https://lore.kernel.org/linux-iio/20261025191510.22261-1-zoone.rupert@gmail.com/
v2: __context_unsafe() explained in commit message (Andy)
    https://lore.kernel.org/linux-iio/20261021052435.112686-1-zoone.rupert@gmail.com/
v1: https://lore.kernel.org/linux-iio/20261003214516.128573-1-zoone.rupert@gmail.com/

 drivers/iio/adc/qcom-spmi-adc5-gen3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5-gen3.c b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
index c68c6c5f6aca..09013c6e44a0 100644
--- a/drivers/iio/adc/qcom-spmi-adc5-gen3.c
+++ b/drivers/iio/adc/qcom-spmi-adc5-gen3.c
@@ -663,7 +663,7 @@ static int adc5_gen3_add_aux_tm_device(struct adc5_chip *adc)
 }
 
 void adc5_gen3_mutex_lock(struct device *dev)
-	__acquires(&adc->lock)
+	__acquires(&((struct adc5_chip *)iio_priv(dev_get_drvdata(dev->parent)))->lock)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
@@ -673,7 +673,7 @@ void adc5_gen3_mutex_lock(struct device *dev)
 EXPORT_SYMBOL_NS_GPL(adc5_gen3_mutex_lock, "QCOM_SPMI_ADC5_GEN3");
 
 void adc5_gen3_mutex_unlock(struct device *dev)
-	__releases(&adc->lock)
+	__releases(&((struct adc5_chip *)iio_priv(dev_get_drvdata(dev->parent)))->lock)
 {
 	struct iio_dev *indio_dev = dev_get_drvdata(dev->parent);
 	struct adc5_chip *adc = iio_priv(indio_dev);
-- 
2.43.0

