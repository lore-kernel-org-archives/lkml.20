Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962E6357D0E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787996885; cv=none; b=lcvBu6z9lrINqP3HUIWxlVy1RWX3p1zuEC1efbbQX2ytaau6ZfVZzSyBsZQzvzHm+fJyIfRbFPghCeA+J2glbfW89OMMKNhh3Drhv/6IKi0tSLhJxESQI0rPFQB7IGmQo3pplHB6JARj3b8S8rQ5cXXKgQWNLELbtn1+ixE8m0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787996885; c=relaxed/simple;
	bh=4ndvc2eILuxEmOTjhb8/K7C6peesQ/1CAdTSpcZCAGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mYHouUJubyQatJzGedYBqYTTDVfgRiAnyWvFrCojuu+NDO0zb5pF0KcGwsmvRdiHQp2I2GFFRwI6PSRGuCjaScagJtFRfZgbdkE6+1i9q5wpupMUd2Sfh9Ot+AyAUJmL6wLCHyyHr/UX/SSKU5P+YZbwNLxnm5cqlk0NecW1wNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fe89fb333so1045233f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787996882; x=1788601682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gisI60aIRI94sbsFoXYOhSYGpkylj0kQ6heuxGTepDA=;
        b=m5N5lfnkHvcBH0+8SDe3rd1n0id5lBoxsnCOza63GD/vgRRiqh2kN5jgVQwkUcUwTX
         4qZIADD9n5Omo4WFIFB5q4lY0PbNBaA7Wl6qQn1LkegvE17/c7k/UQ6C4+55c/GaYkUH
         fTXghOSbwJ/TcRQWteDINCRF178gWoHVgRQFPogLyBQEhWKhNgPBDNmMNNEYm+Wm+lyt
         vok2TQf3nUyBcZvVBB4pYR19z5BCrK0F3aLU+WSkkxNFGdoDggF64kqGMSYY6JsTdIpm
         +FQQMARB3kBUg8G/nA3jAzwXgNA9hXkwnFFFFrRzXuhGdnp0ww9pS3VUMwaZ7AaLfS1W
         1WAQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr39mMsOP196nP6Ge+nB3n/wrJaQkDa/uwLPlxTpfDlzftip9IYs584pPSDkf2lVBIdTvysyCqKhPR1pj0=@vger.kernel.org
X-Gm-Message-State: AFuF++ntkWx50++llIZ7WHXZ6dICJSq/tl3ElZDvPxPQMF7f44qAlKvs
	nMWJ0a8B0HAQAFcBopc2E+4mHkvq4Ritw/B/KuGsCpglgOdUcGw3+dcf
X-Gm-Gg: AR+sD11cvnkzhOBiS7qCQ+Tfoo1aYTMIyXWV2YuNm5+9Ly8jFW4TTVxoS7N1HljPg7K
	PK3lURgvO+7rYi4M+ZBFt7VtwS25W9tlutl0zAVKf0xHVaiv8ZtFOqnbdSJYtknr0m4cqWQ8xWg
	lhSlKZZQHRtLH2LPb9iePawJO6gKqKtHTuImIsteKuKlZbEGOIm3saFRLxpQAWU7Ds6t2hFaaQA
	mUUrIaLz0ZF1Di7Q9/AMftMWGwSQrcLXSCrLISoEotR+YCDSEgNGdkIqaPtzsHNQMDydP1OGdQr
	r4/rO5Mzd9XdlZDaVo7OeYqjhkFnVwKaY3XlFMx0/e5dLIyrt36S7ayaR68sOg0f+qM2/FauBTX
	UDy6ituJrEUUhO2GKA4DSChn8g+w4GBYElJ4WWaWnBPMxBprAlIdPkDqyZiBYCCd8IEibDYQhip
	1Ggn1Srdf/GAGrZSqoLM5e+LjAtUaPcFvFNf/6Mi2QiNTcMI0KxgSU+Xfg04f0okysStWLhr/Xz
	Ibqp2MQrXMWWyy5fOvRAEWHw3g=
X-Received: by 2002:a05:600c:858b:b0:49b:928a:3f9e with SMTP id 5b1f17b1804b1-49b928a4006mr137978955e9.5.1787996881702;
        Sat, 29 Aug 2026 02:48:01 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20784sm9661562f8f.18.2026.08.29.02.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:48:00 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Brian Masney <bmasney@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: amlogic: t7: fix the pin groups of two PWM outputs
Date: Sat, 29 Aug 2026 10:47:56 +0100
Message-ID: <20260829094758.23248-3-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829094758.23248-1-tanure@linux.com>
References: <20260829094758.23248-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two of the PWM outputs can each appear on more than one pin, but the
description named a single group that does not exist, so anything using
it refused to start.

Name the real groups instead, one entry per pin, the same way the other
multi-pin PWM output is already described.

Fixes: 2a2a7b9701a7 ("arm64: dts: amlogic: t7: Add PWM pinctrl nodes")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 32 ++++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index c3dc479b137d..8c4bd683cce0 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -458,9 +458,25 @@ mux {
 					};
 				};
 
-				pwm_ao_g_pins: pwm-ao-g {
+				pwm_ao_g_d11_pins: pwm-ao-g-d11 {
 					mux {
-						groups = "pwm_ao_g";
+						groups = "pwm_ao_g_d11";
+						function = "pwm_ao_g";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_g_d7_pins: pwm-ao-g-d7 {
+					mux {
+						groups = "pwm_ao_g_d7";
+						function = "pwm_ao_g";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_g_e_pins: pwm-ao-g-e {
+					mux {
+						groups = "pwm_ao_g_e";
 						function = "pwm_ao_g";
 						bias-disable;
 					};
@@ -474,9 +490,17 @@ mux {
 					};
 				};
 
-				pwm_ao_h_pins: pwm-ao-h {
+				pwm_ao_h_d5_pins: pwm-ao-h-d5 {
+					mux {
+						groups = "pwm_ao_h_d5";
+						function = "pwm_ao_h";
+						bias-disable;
+					};
+				};
+
+				pwm_ao_h_d10_pins: pwm-ao-h-d10 {
 					mux {
-						groups = "pwm_ao_h";
+						groups = "pwm_ao_h_d10";
 						function = "pwm_ao_h";
 						bias-disable;
 					};
-- 
2.55.0

