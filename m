Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903872;
	b=AraVZ78eYyXJRUVtYnFw1BK6YpseW4ixem4SouyLq48Pr06MHteNt0bM6sIz4BabqRAj
	 tlRyYsu6lyELGx3xv2VBhyyvnl8qzVd875d/Owv1c+Vvi559eyf4+BzSd2wO08pXR3duF
	 tggb8Y2nn+2QZBVbLBCNvmlBchA3zt+TSuqWWp5XoWIBCfrle2NA1d5CpFbC9/bzMmcgR
	 WwQm0UM3EFyOsNdwUSV0BadNr4pF+3b2jb/GYLrCAr8rprw2Xlhw4we5c5+/kUrjYBAwY
	 yyrguTh30sHK2GZ8HLVmkdHm9QUENCfTkSnHTL7WCUGlT7EDvi24bdrEqkK0qDosRRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FIAdVkEWa+YKpNqjyEpkUHZm+KoAzH84s76F1+g9tmo=;
	b=F1qyVxIJsqfobhBS4V0VIZoGzitCk/KIUVslSPXUufLDbCDZ0P6qo2tXJE7zlTSG2Fos
	 ukN3udxNvFEiB3jbJZUTygg75yJq+0WPoZkySBUtwSxSC0LqQpqW0cqfmYlZu04L/Wm3d
	 5HAMhiBiaDOEYIzA0myLFOwB7y3q4m9r3S/P4CevqvopiI2QEElHVpSBw6QF5gU8IE0rC
	 nGS1UcUEA2iQzL8dJ66VRsI7FKRvYKsrQ+aM6I+1fDOSnVJnPGg/+flp5JkND+FK5C3P6
	 ItWvr/U1Fvtq5w0ZxaaeWIjVeeqAzHzQVMChcDZqG3rItQLXcqwq9xU5cEzyHRJnl3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="m5rd/aHW";
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E7D60A2625
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E7D60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=m5rd/aHW
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so313336a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794903870; x=1795508670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIAdVkEWa+YKpNqjyEpkUHZm+KoAzH84s76F1+g9tmo=;
        b=m5rd/aHW4x8+LC4Hoff/y+voqA2dzKC/QkkgsLWsQFHr+HtEIpj0YzM8GS/0DT4I4/
         gwV4XFvMdtCFyCncu1foTtxnDag3pLIodRg9GKg4EOvngWrgE7sZf/xsl6V+6Ap5bEyj
         IfqsLVRwRZ3PRMZAO15NX/asAngzwzq9p1KuCe5/mpybyPr7EGhUvziZOlA73MmTyKbC
         C0w+7/iASWvgEdcoZAcQ+u0CcLjvDSlVePv0LRLBtM4mwr3FChD8MUkxDKZFSxIvNkyy
         vVEs8Kiu6GDR0RjpRDwnNpojC2/T6aoCDk0SEKATRH5nXRiR+Xqd4hY0eQczVQSmDFra
         uDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794903870; x=1795508670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FIAdVkEWa+YKpNqjyEpkUHZm+KoAzH84s76F1+g9tmo=;
        b=0rbjEzAwhDm/hfklKnT1RHXWfRSSnMTmx3OUZ6z3LNfuDxv8L1f4zZhEa0jQNThAvp
         PuCSG7R+7iFFlTwWdrBy8Vi8z5d7qcCto/kq1PxolKlFHbC+fSdAth4JGuKVd5Q9OMm4
         pfboe/1KFjjBibCN6a1OpCbp1PHbvBKNBXpRhuQqAEQ7/eKxeUac2zlnT/VUoOYR+DFp
         RwlfUjxZFNRC3frh0AVFiSqRZfLfMh0YjRCRPN2If5L6Sf7gzGfS4jMqJHzg8uhl9psf
         rRF5s0jx9BLIxWuLzd9K/BdlcYMxZHmxDseFIhWWUQ4QmyTesLIiea9vDfNkSsItL43Y
         lgjw==
X-Forwarded-Encrypted: i=1; AL+hErEz3ZtrBzM61JqXHWYTiaKR8llbN27MJTuiGv5qmMQi66IVKhsFQfl9HybQ7GsG8FVwy1S/J0Swg9+1dec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ked8VqRqoA69fp1fCCSfw4kU0PaTuhIn/K5FviTcjnbOO5I51
	LGDb8LFeAh0GIXq0Jkm4v7RkZIDJ6u8ZrY5Mp+JIr6o/yfqiDcIEMAMd7KOMcbFpSJU=
X-Gm-Gg: AYBFou0LVl8r4rZj0iU9nJ8IKYr8+X5ZDm+6UoHAaA8Mx/J1jRQLJ9v/HjoUB99Y7UI
	ir3pI6BPqXs3CxlUZEY19uaXnHGeIiDAguuBTI3sPVrX6K3piyFOex0WZr0/UPmHzZ5qHbliTEL
	+phjEkYTS5giEZtjWxoSm7hhsr0Aqvt/QgaPVAUrW/UbmzIhKXYthj6io60FehTZMHCbJbz9afY
	0KJL7G507nH8h5bdHiCC27dhi7RtZOMZL3GUvOM9RnX8wu5iVRIyTRLmHKGwkF9v0KDWGlml7WO
	LX9m+x3kCjJSx8xKTFiwNuSs6B14cNGvwWAxxP8HvjxUjZMhpqvwgWow3s6VODS46c5hX5ZRubv
	7HmDBiZUI/tlHR+AcRbnazPUy46EkrVcTUveA8Gz6ynw+05WK3IP6VsUq6wEM3NN773w1wEe8Qz
	6k4aNrMCOzeJOn93hmYenGlz3ysj8qRfqB79CsTQ9W/Poj3ri3+IVmb3JsrP8T7raSsiwkKeP56
	XArC3Wh0HtabJpZL2HdYGLMP+EjAOwTURdQiRs59y5SGNOb2OQS1YJRsMnLMFHtLkFMn4XLcIJI
	WRJat6C70pFc/T8AxGc0MdWe3w6114ai3xsOoZMGI9HicAmlG5BJ2Zvohfx3HZIDuu5lByDymFt
	q8Cz9QekFwG4Sl7GSpBMq5rmRs5YREKvN8OfKk5KKd/xuWo/T
X-Received: by 2002:a05:6402:4349:b0:6b7:cad6:a020 with SMTP id 4fb4d7f45d1cf-6b7cad6a0cdmr8624241a12.8.1794903869734;
        Tue, 17 Nov 2026 00:24:29 -0800 (PST)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c23611casm5616953a12.9.2026.11.17.00.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:24:29 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Nov 2026 09:23:15 +0100
Subject: [PATCH v4 5/5] arm64: dts: qcom: sm7225-fairphone-fp4: Add battery
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
Message-Id: <20261117-bat-temp-adc-v4-5-14d5d309ebfa@fairphone.com>
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
In-Reply-To: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794903862; l=2686;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=UM7jmORMPxSdPO1xNc3zcibihjU+NS+ZaaeZNpYbWE8=;
 b=bSCoKLweeKiJ1WF6rrWxDJ5PvVPJnM1jcFj2jNkvwbajxykkdKa/8c/FNqE+qSnRKKtFDBFZe
 6H+h7QU7eoJBq1AUVzYpXMfKx8YKghowLXcfI8OqIxgz9zMVaz1nDYE
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a generic-adc-thermal node to convert the voltage (in millivolt)
read by the battery temperature ADC into degree Celsius (in
millicelsius) using the provided lookup table.

This will later be used as input for the fuel gauge node (QGauge on the
PM7250B).

The lookup table is generated using a Python script:
https://codeberg.org/lucaweiss/batt-ntc-calc

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

