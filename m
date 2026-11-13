Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585906;
	b=zMvTA42TBBoiUBHRXCj6rCFeFZusoyfd/CGBWgwoDk3XuOm9TDpANorm5KLUwD3mpVfz
	 wSQ4H93/BYdci3zjAoQeTAaGKUkrPrua1K4fl2TAyjKAhA7NHdqfFJrEyyqw1BVqRFDRj
	 5eIQPdez0WlOOGidAMq//mb2ZU24o8VaJUUPDPUdfqppVZAB9sWSt8KZwqQ6wEUAMZBcm
	 vrE2owWjqWs+M6dMABWqnc12BveKJlqNkKGaUAQxGj8PefO/mwPBWBxhjyJP4dkoan06m
	 0cQxj1CAehzTeWXjCkh3LIFzqkgnDvJ38b53lAS4GVAuB/svevrkSn6bC+LB9hKD69Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7Kw3jpXIq4jFZtKzMcPDKxBZyvXYg2GOy824z751lHM=;
	b=NJHupNuTw8xBEnr0R1oOUaxSHd+oohI+IOCX0fUfvZf7jsR6kMo0tLAcpo+DKF6i1mZy
	 kBDHDlubpvKsWnfNnjYFydq8r9GgC+jtca6RDGdHLj89TJ1ZHl1CQ4+2UNqL0x5dX/+ev
	 2YQJ88W3INSk9Ev8hbJHq1LBJLMo+5182/77ohGF9rQIjWriOndBZmPilWwTLWktvcv4v
	 32ne46FPORKytXTQLn2LzgFKRfdVj41vWDsQ+dRb75BPlbtbATX3nfshKhrf1QKaw04UX
	 WJHAIZanJUhI/JypDnE0+QPNL3k79mMXB/fYDY/Z7pmkpW1YXZmeoLv9KCWqG+E7yUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="SOb/xgQc";
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361496076214
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 361496076214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=SOb/xgQc
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so2214625a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794585904; x=1795190704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Kw3jpXIq4jFZtKzMcPDKxBZyvXYg2GOy824z751lHM=;
        b=SOb/xgQcyJqJV3fKqjmRGGbJgehdAOrhA3EbTniYpSFN9VG1M8/QE6f0G5SaWLB67B
         wX3cksYY2S+OXmZfAKrm8S8bm9fssk/Fd5med7zF1L0uhNZbzjHhV4WfOcS70B2DmX4w
         MaOdUK8lcTnJ0ABUJzCvWVLoRpVNd0U0vaEcEV0JlfPZy+HDNcjk9VG5yr5GCHZPdcBi
         tVCkSDlzKAy1dBv9LaTKGzdR+x9fwiUA+4Ekkz0C5Nqb/re+BZ4MMule3tszbeJ2zRXY
         SVBlR96YUFt/di8TxXsZRllTLOy+i9T5HIfJBglIHabYyg+5kJb7RjoYoU1/9WHf1WWe
         MyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585904; x=1795190704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Kw3jpXIq4jFZtKzMcPDKxBZyvXYg2GOy824z751lHM=;
        b=09Ihwn6bF+7bzIu0jskWkmBtpGpFD8B+wnN13WS8xuGqBitWDPOr9y0VI9V7/M8uFT
         wv+Ax4x1dpCst0VAfaGy0Cmq8jBGIha3wuEWU6V8nIyKJP8DWNZ8xQqbh4wxYsjBklhh
         uwrcwExMgUhNg0Am6Sb6Qhv3EE6cLcAAkslwDwhqqeqhaNJOLql2RYsGFmp7nJAVu5+T
         fGfMyjmxaY7Isq4IdWF2rn5O0dNsoIne3uI/8HuyqNFq75xtTlaqgrgnMUj6nb4/bPfK
         Lr9h9aLOCIy7CUr9BIl4alEVK3ZUUo6NXTiWH2Md+wYGQ+4gPxAT+hIRX6TGbzg8ge+Q
         TRug==
X-Forwarded-Encrypted: i=1; AL+hErEW47oHWZKrFIt/qNMYczWSGvRI62eRMRzFYOGYZwcr+XhFLqmScWVmYMVZzE3F77PJwAeYKDMQqwvUyvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TuKZ2vQRkDM9iQaudQK8hwvqbhpdqN88lgbXxaCmONLBRADKq
	Vj7JJ5NEo1bQrsr5YxErfbSUC6aps59NyugCQRZ3i4kDGyAnHDviNmqVRelR8vJ5B6U=
X-Gm-Gg: AYBFou3cKHpnw1PKaMehmJdDXiv/Ed/xLaIDpBfgXJ604CKpQ/6enyO9m0TOAPj7AgJ
	Usf4+Rf+EXR4KrAcb4q5EOxGspnAB+R4ekojOWfE5i26/G97m2mLH782gg8jwHJe+rNh5UdgcNV
	Fj9r6ZNnzvvxDNugmg1TZokTe7TmUwUoynB++xXGWu5sl14nN70T24IxB1Q84GGzavBGyAgn4c5
	KWCDoneviBczU5ccGOtwhNEZTiRFNIJqaLuPlZR7rALCmxAssSBmyZmba8BCXWan/9KYk0Un3pf
	Vm3bI5g9PhXvUMn8sWhPYjdRARXJKwlZdbfxyRFk2aJng1bm+z21bqfI/TqktQp3w/mckIn0y2o
	f1jemtzvu9Kp//lnn8sr/I5H2i5fjcSPs55W4eP8twwg5CpyTPXVfpFxj9TMVVaOkeZYRHyx5Vh
	5pxCcboi/oXt0Jj9RhGZwj29ozihsa7KygVOrko+AJz09ILshi8cf5lJt5LR3KJ6Z7IH1w1bhiI
	4oHPPSrM7SvgAbgLKdqR+SmEebzc3SGLGOUly0N6Wy6GKCJ47oZtbzqS5RipYIwYs96IIyxD9rx
	OMHhq/FH8eqb4kE6zO7QHbNV4KqvbCeCqA381HZAKQy/EfCPB8dudCeClTwhM7P2onlwHVwqkwB
	lhVAlcyM=
X-Received: by 2002:a05:6402:222c:b0:6b4:d1ed:95b3 with SMTP id 4fb4d7f45d1cf-6b7c0d200eemr1933559a12.41.1794585904556;
        Fri, 13 Nov 2026 08:05:04 -0800 (PST)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c264d99csm1123946a12.36.2026.11.13.08.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:05:04 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Nov 2026 16:56:46 +0100
Subject: [PATCH v3 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Add battery
 temperature node
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-bat-temp-adc-v3-5-743979a8fd90@fairphone.com>
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
In-Reply-To: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Jens Reidel <adrian@mainlining.org>, 
 Casey Connolly <casey.connolly@linaro.org>, Val Packett <val@packett.cool>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794585895; l=2551;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=BTbJE+uVkaO8/e9NHFNdcxadF4slrFM2xvgSTnvAGGo=;
 b=cVBBAj087LJNnomjguZpThneLwRiRu9MSVg4YxOXarDvVQijERMPCJyr2UsYdSnMUUXSAZRwj
 dA3YJuS87CcBsIa8XButhSk1nsJGHUrL0+mPVI/KRuZHfjefLVspIaC
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a generic-adc-thermal node to convert the voltage read by the
battery temperature ADC into degree Celsius using the provided lookup
table.

This will later be used as input for the fuel gauge node (QGauge on the
PM7250B).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 83 +++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 37aa272019cc..0b8c6f353f96 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -96,6 +96,89 @@ memory@efe01000 {
 		};
 	};
 
+	bat_therm_sensor: thermal-sensor-bat-therm {
+		compatible = "generic-adc-thermal";
+		#thermal-sensor-cells = <0>;
+		#io-channel-cells = <0>;
+		io-channels = <&pm7250b_adc ADC5_BAT_THERM_30K_PU>;
+		io-channel-names = "sensor-channel";
+		/*
+		 * Voltage to temperature table for 10kΩ (B=3435K) NTC with a
+		 * 1.875V reference and 30kΩ pull-up.
+		 */
+		temperature-lookup-table = <
+			(-40000) 1673
+			(-38000) 1649
+			(-36000) 1623
+			(-34000) 1596
+			(-32000) 1566
+			(-30000) 1535
+			(-28000) 1502
+			(-26000) 1467
+			(-24000) 1430
+			(-22000) 1392
+			(-20000) 1352
+			(-18000) 1311
+			(-16000) 1269
+			(-14000) 1226
+			(-12000) 1182
+			(-10000) 1138
+			 (-8000) 1093
+			 (-6000) 1049
+			 (-4000) 1004
+			 (-2000) 960
+			       0 917
+			    2000 874
+			    4000 832
+			    6000 791
+			    8000 752
+			   10000 713
+			   12000 676
+			   14000 640
+			   16000 606
+			   18000 573
+			   20000 541
+			   22000 511
+			   24000 483
+			   26000 455
+			   28000 430
+			   30000 405
+			   32000 382
+			   34000 360
+			   36000 340
+			   38000 320
+			   40000 302
+			   42000 285
+			   44000 269
+			   46000 253
+			   48000 239
+			   50000 225
+			   52000 213
+			   54000 201
+			   56000 190
+			   58000 179
+			   60000 169
+			   62000 160
+			   64000 152
+			   66000 143
+			   68000 136
+			   70000 128
+			   72000 122
+			   74000 115
+			   76000 109
+			   78000 104
+			   80000 98
+			   82000 93
+			   84000 89
+			   86000 84
+			   88000 80
+			   90000 76
+			   92000 73
+			   94000 69
+			   96000 66
+			   98000 63>;
+	};
+
 	msm_therm_sensor: thermal-sensor-msm {
 		compatible = "generic-adc-thermal";
 		#thermal-sensor-cells = <0>;

-- 
2.56.1

