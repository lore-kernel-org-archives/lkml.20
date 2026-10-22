Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792700290;
	b=UdbSO1dyVSxufX3blylXWDwGMXxQML/TWQnD4tsSw8piuMeZQcbGrU1hwN80Lt9kBWHM
	 Tfc6SLGTm6LTvYIrcy6866Cz0bs5L5mFIUX0bD8l7N+t/G5sXnXvtiLASHJLALvZfSqvm
	 Ea6ggccbC9Azd/6Q3qy3ySsIla7VJeJ8wO08EHQOYA3SxPG4VmkssbV6YpNEU5y3A9jwn
	 7l9mZvDpfCcvu0hUGXb5HAGTQgU197hoQx9Ht0w0ouvTd4+plzyJAt7/jkzcaziSJYUwn
	 XiDpuCqbT2HhSHPtvykUbVh4MX61ACtWYoV8Gx+kIOf2KeMtRUzDOFE7EnxBnz8Wo6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792700290;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JiA4JitzQw/4MC5Swl9tbuEHHH6EIhc5VkOsXaDCmnU=;
	b=3Frhm4tEJW5x8agST6MADHPdwororfNtVUT6Q1aApiYyPtS6ifrQQr+Pa7LPKgbK/5L8
	 +z68C1GnXtHPZTN4+RoeA0M/9KtTpZ6nC9lzyAzfAuJH1Ejdju8Rp0t+rUqpdYSKjAzBQ
	 Dk4KPC/qkKH6MaSyIRZwOJp1XHw6E5xPoTrYkc1v1QXuP3pa3FAz16Hlu5bGBp1wkUcMM
	 DU57eqZKb1K3+ZpWhgtt0ZUH+INp8hWdluYkaR/Z7MoAPrqaCzxGmnqYY+d05xxcbA6Uo
	 fuOxzM7uWhCWOJzHeeEwarN6tdNCzbOOccklKjO1+X2eryq9SvarEtXwkiVugp0gxsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thinkoid.org;
	spf=none smtp.mailfrom=thinkoid.org;
	dkim=pass header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pO7LUnRQ;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1430606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1430606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pO7LUnRQ
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b813ac020so3683516d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1792700288; x=1793305088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JiA4JitzQw/4MC5Swl9tbuEHHH6EIhc5VkOsXaDCmnU=;
        b=pO7LUnRQ4y0gsifPlHbVeHgo0B2aVNrLqimoypSRAc02oswTWnhI/rV4zy2VmiDoth
         SqTk3b4Yk4rLKWk3abA/o+rNOFwulUIUZDNgWx17LwKGillB2OXUXsmRqbE6hsDZs7cU
         r5eg6rijI+acq80iSsBj82bHRToLvuPr/KI1llQyUZNV03MTjxgxnm6gVzLm4fwoTNXw
         OVSf39/B4FpbstOtrSDH1BemBYs49B0y7TlXXp+oOWNTwUmgcLNStgNBDGh3ehp9yb9I
         nwWZcimMAT7QdKn5e4P9uiSa/+rGX31to8dCgIOor+DbVIdzMZb4MK4KWMn1sUkvwpfM
         70+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792700288; x=1793305088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JiA4JitzQw/4MC5Swl9tbuEHHH6EIhc5VkOsXaDCmnU=;
        b=BUyfXNRN6rX3SwWsCxEuglNFe8DbVhn7SKTe0Ns4A8oU++Lu/qDJKXgjJmddibTGUB
         RY6++EUr9FPMjm2GkgvrADiw8JUnxutZbFrwnYzbYW98EX3JeKKzYqC3xlZ8x9oqHh7o
         NYcYYUSDqP6/gaYnYGZ/p1BPYPoDucVRk/bxJZ9cJGgvZNdUVpOY6WLyNbzJAaPNUi+B
         Snbq+cPYnReNsPKTRknnMvjA/Xx8b86ffQ1w+l+D1oN6lMiRioYJ22Au7igEtRwVLuTW
         bTNSheDQXfUhatDhtwNI7BgAY8ZbG+79ceSP7qrhnqUi9+fxHhOUClQrgc920UyVKe/o
         JP1w==
X-Forwarded-Encrypted: i=1; AKwUvBwYjQO+jEkL42ZbXWSkshCOMZ3xlnG2YbYD5jW16X3OCQ4OuHp7XH4g+79s1AEIO4Gsqy/nekDIZLDPkM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3Z06slySeZ0LBWTsg0tSou9pxKju+oa+RUCvbXnbQRBW0Nqol
	eW4NGF5gDWrpDe01yz9ygjSLg1rfyQSWFLFduDklTXpDBPWl/cA8/xZz4ASpezgdQs4=
X-Gm-Gg: AYBFou1cZmcO8+J1JEUq86C8dXOoFVEvEsp1NNW0H68yRI66/UCPnbgL6I+940sVzwx
	EUpQyvO5OMEGSmC8uluXMh9lzSNntgIpACJUxWa7/3Dhs2ueSZAI4mu9Jajkyy45oThWN1wG1P3
	tjsSttRcK/Pko3De0l7/B8TFW9rmiSA1nZJTSBhKsaiIfwFMnWK2Q3r0sZvxha2n7jmnoagQHvY
	nqdvnEevRrNW+5iQ5ElflK8S2y0jwX/xqzutfAqChsaql7S3P0XuiWAT20Ft3WhaNbgYLX4uQJ7
	UV9ocIBCUZmWUBHRNtDnd3HZLxZPRriKks6pNCMYHy1Mj2MkwZV+/nMEW89nP8y7RDQyUafhIaa
	wUIRmPTaNM+p6Vye4HPQU42tuATRApf/W+unRppdAiFs1ZDshdCKkGsFy3fl8r+ujx4UntteB4k
	wvORhYthsGSY+IppCpd3ZDnmrXhtHXNxDN+54gyk47/x1Wo/tG9o3sunB+QENKoK2GVYFyo237V
	bRJF0VoNVlzEV+VecCFRR0guITkpy44a/5o8gbR2lZYWY5nBc7ASg==
X-Received: by 2002:a05:6214:468b:b0:91b:5d39:e127 with SMTP id 6a1803df08f44-91c12f1f445mr103449156d6.48.1792700287610;
        Thu, 22 Oct 2026 13:18:07 -0700 (PDT)
Received: from armok ([2605:a601:9b7d:cc00::8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c39507ff0sm1638386d6.4.2026.10.22.13.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:18:07 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-dell-xps13-9345: Add thermal zones
Date: Thu, 22 Oct 2026 16:18:03 -0400
Message-ID: <20261022201803.22530-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.56.0
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

The XPS 13 9345 has seven board thermistors on the PMK8550 VADC: AMUX1
to AMUX5 THM and AMUX1 and AMUX2 GPIO, each with a 100k pull-up. The
ADC configuration in Dell's Windows driver package lists the same seven
channels as SYS_THERM1 to SYS_THERM7, the two GPIO channels first and
the five THM channels after them. Name the zones after that list: where
each thermistor sits on the board is not established, and a name that
guesses a location misleads whoever reads it next.

The ACPI tables define seven ADC thermal zones, TZ31 to TZ37. Three of
them, TZ32 to TZ34, carry passive trips that throttle all CPUs and the
GPU; the other four sit at 100 C. The tables do not name a zone's
channel. Taken in SYS_THERM order, TZ32 to TZ34 are SYS_THERM2 to
SYS_THERM4. Heating the board supports that order at one point: a
charger on the right USB-C port warms SYS_THERM4 well ahead of every
other channel.

The passive trips follow the thermal mode chosen in the BIOS setup
(Thermal Management: Optimized, Cool, Quiet or Ultra Performance),
which the EC reports and which cannot be read without an EC driver.
Use the values of Optimized, the default: 53.8 C on SYS_THERM2, 62.8 C
on SYS_THERM3, 61.8 C on SYS_THERM4. The critical trips are the tables'
114.8 C. The other four channels get report-only zones, as on the CRD,
and all seven are put in thermal-monitor mode.

Assisted-by: LLM
Signed-off-by: Liviu Nicoara <lnicoara@thinkoid.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---

Notes:
    v2: name the zones SYS_THERM1 to SYS_THERM7 after the ADC configuration
    instead of guessed board locations, and order them the same way. The
    "left charger" placement of AMUX2 GPIO did not hold up against a second
    owner's ten-second measurements, and the SSD one is uncertain:
    https://lore.kernel.org/all/NCQ5O8k2_GpmJZBjDzgZL67uwdiYmmuSudO9VmdRaFTDq0u7aec6at00VYbzdwwSVvgJnLnGxewwp_TVO9oTjM2pAjP_LoiURf9JCIKXB-w=@vinarskis.com/
    Channels, trips and cooling maps are unchanged; the v1 tags are kept
    for what is a rename.
    
    Tested on v7.2.6 with the ADC_TM driver (7.3-rc1) and aac6b2ca472e
    backported: the seven zones read within 0.01 C of their IIO channels.
    With SYS_THERM2's passive trip moved just above the zone and a
    single-core load, the crossing throttled all three CPU clusters and the
    GPU through the ADC_TM threshold interrupt, and the throttle released
    at the trip less its hysteresis. The v2 rename was built and checked
    with W=1 dtbs_check on qcom arm64-for-7.4; no warnings.

 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index f48e6bc35006..bb7d91ed08ba 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -326,6 +326,145 @@ vreg_wcn_3p3: regulator-wcn-3p3 {
 		regulator-boot-on;
 	};
 
+	thermal-zones {
+		sys-therm1-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
+		};
+
+		sys-therm2-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <1000>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
+
+			trips {
+				sys_therm2_alert0: trip-point0 {
+					temperature = <53800>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				sys-therm2-critical {
+					temperature = <114800>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&sys_therm2_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		sys-therm3-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <1000>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+
+			trips {
+				sys_therm3_alert0: trip-point0 {
+					temperature = <62800>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				sys-therm3-critical {
+					temperature = <114800>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&sys_therm3_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		/* Warms with a charger on the right USB-C port */
+		sys-therm4-thermal {
+			critical-action = "shutdown";
+			polling-delay-passive = <1000>;
+
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+
+			trips {
+				sys_therm4_alert0: trip-point0 {
+					temperature = <61800>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+
+				sys-therm4-critical {
+					temperature = <114800>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&sys_therm4_alert0>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		sys-therm5-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		};
+
+		sys-therm6-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		};
+
+		sys-therm7-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		};
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -1025,6 +1164,36 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
 	};
 };
 
+&pmk8550_vadc {
+	channel@144 {
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		qcom,adc-tm;
+	};
+
+	channel@146 {
+		qcom,adc-tm;
+	};
+
+	channel@147 {
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		qcom,adc-tm;
+	};
+
+	channel@14a {
+		qcom,adc-tm;
+	};
+
+	channel@14b {
+		qcom,adc-tm;
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };

base-commit: d053e38e614fb2e383b298ce8fc308a780d7f209
-- 
2.56.0

