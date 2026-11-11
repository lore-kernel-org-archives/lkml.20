Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794377446;
	b=laNtJN+yqUH9htvhOQCyZHE7jBSrZlQcMLNj3i9JfkNSHSVaBY5IE7hw6W8Ylo+9yjUL
	 mmZ6T5eG6/VZt0/MG6wPCXtc1MfDuynito5vNVSxgxGF9856aJco5VHWN5OkRffkhggvb
	 xAIxQiqxWdo9qtjpSAD+p3yWntzkjktecvUOWLyYXwFrnMyZeOwpZ8o9h7fnvZxyantI3
	 HsOzxhJziCg5SdN7KoXNt/2m6ACCsBvWT5ZntaYqd40ph3aikeGG/zv2y9K1adCgBsnHn
	 ZbI18r3NtUR67tYCrIzdmQqkHxoIRnYTlqMFUgm/npwgvmBZ18Dzou0PGKkbfhmxh6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794377446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=cL6Lm2cBZjv9q+hFge8UMv8VlPsyusharMMb4O8VvGE=;
	b=dQEWNlM5wat975VW65lTPh+NGMT3xYLI1opQYo2ZY226dwdz6sbml9ue2sWVXotu+D/K
	 eXzkdGjSs6J7U2nylMj724MFp37OWFq91hmqebzlPtnA7EOZga+DeAwg9FeYwo2UGpLLJ
	 jkFaFyAZTk+k/KkFffNEX1Uxlik1irtCfx/Rqj8mNX9LyoBJ9bSKikxuuPK0ecQ0oE7Fh
	 O6zCp+j3cKxEZGb4ZQLpYvU0l4R/A23W0i1u8fu1I9uCHKVheS1HMF6GchmFQBGqvsX20
	 DaxzP78xwUQsIIUeLZNG2iz21PcgLzRB812MWHtjDq7JWd/eQXWGL+bZ2Jl1RqElKjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YGAFTgyX;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB52D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB52D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YGAFTgyX
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b12cb3c37bso1437197a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794377445; x=1794982245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cL6Lm2cBZjv9q+hFge8UMv8VlPsyusharMMb4O8VvGE=;
        b=YGAFTgyXLMiygWDiVdQewRTHWkBm2sIFXL+cHJnRTQyrA0/McEcT4/K/eQJ32EZOUf
         qCIYv3rPpGWXM1n1wbDK/YXP6Yw6FndmiPnvCqMTqhApdHd51ez75i1uL69cnXe9/TgY
         GKXvfsOaEHLz5ygTqS7rrLj2VhsiQJWrs8smPHz1RQEsVE1itLAIOzlzc/tGc2HhCK6L
         s3Rz8IQ6cW5SiMwitBVdKeZhYnIXi036y4XgnwwV9D1CvAD7RRoJvA2ew3bPqFsB3h2o
         Mgl/TA5/h6YzCkZfgBTZKdgeiqEAn2+Pw6mn9gEXWea+Qlp5iFXiKu5s7RjZwfXlZeIZ
         4zHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794377445; x=1794982245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cL6Lm2cBZjv9q+hFge8UMv8VlPsyusharMMb4O8VvGE=;
        b=a4iAtAq4bDEyRbBAHk6SKzrNwu58DEnvSFafc7ItN1b40coSH8say8TXAJlao0daa2
         iW5sw2UvU0Kbx93O/oNDU1g+QtmCv4UNhRWRRL1x73JDthf3RdaBAqyoMf6i/HFkTUcT
         zLml7wxqRkJMX7rwxddVMpRwPbT5vVOvm9dzJh1TJAs9vVrlHe/0JEq2TDEZ1w+ROkR5
         M8o69sp8Yn9t2pH9YwLY3roIaYoRlB46teWG2E5+c3NKT8OfTMDHGp8Q17ool5UoKzGx
         cy1iiPlzyM4oEvcO8QC8LLyNldOn2k4cykcjccnNAo940RFRt3KGGTlsNCg4ejffiJQE
         rftQ==
X-Forwarded-Encrypted: i=1; AL+hErEcFEBR55bATj9xtFc+GivknNCBGsHFkPLG7FojAUuQSusy8qMnDceqkj1CefOz+Dn8jIFeC9Xhg89QrCo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FVPIuD2cKHAwRBH1tYUy4JEi1P30J5C4Ri1N9VJo2blv4ZoqL
	wvLBOL1u7L/hUsICkOqpadTDl7C+7Fo2u7xb61hLjmrCGllkv4BCngK9
X-Gm-Gg: AYBFou0f769YflW4/QzsmQ/mRJf+FNE3vWJQPcsWhTJsngUW8JePmfvNXkIbg7wX3ci
	3EpoI28lGdcqBvm7rUjUgZRGcCafjU0sgGF0Ll+uEbyspgLDeHzZzMCbS97fnIakwmN1naiP81F
	ktP/7N83rXCezWog2kYzqOCF4ZztwImpe/sgV9+P0P1BOdrL8RlZeRyiIw45O8W7jVw/b+aUyGN
	GVI7YNta7N1nnwHczyxVq4bS9IektkxMocSGdhQBO/7SwFeGfjcBJdA+Wv0kkDKo0TeMlYC+f+h
	8kvgzBpMAguG8b/ug7OHShdvk0y7yJF0dS1hwWDKsWOVVLJN0LnHexuKSMWrNs6NWJKcfJraR91
	5StVYaEe17ftnQIwY3TJjMcXlF/fytfas2rbMBPYllPK8twfcqCB5WaKWfwcegdk+pkt1XVyUfO
	7SpP9UoFCTGf01OUzQFZ+OfVMG8Z0VkA6N0VozRaSbren3Hiz3qiHMU9vwLeotq29bwGE51EmjK
	a6MzDFJPPmg/Oufd4bvpSm3AAUtldjAGnmuGOFthqqMx3/mydYa3WKtngVa9gpE1CHcJjk6Ccd+
	IcSc+z5rsOIItHVTnqs6Zynrx2YrWvsILMMZrA5iiF9LiBVj/opAV2Wg7t8eT/lvp+3I
X-Received: by 2002:a17:90b:4c86:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3b182eec306mr1365020a91.18.1794377445217;
        Tue, 10 Nov 2026 22:10:45 -0800 (PST)
Received: from [127.0.1.1] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db7e8b1sm2978557a91.12.2026.11.10.22.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:10:44 -0800 (PST)
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Wed, 11 Nov 2026 14:14:42 +0800
Subject: [PATCH v2 1/5] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs
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
Message-Id: <20261111-ventura2-dts-update-v2-1-bce5b5dafc1f@gmail.com>
References: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
In-Reply-To: <20261111-ventura2-dts-update-v2-0-bce5b5dafc1f@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kyle Hsieh <kylehsieh1995@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757;
 i=kylehsieh1995@gmail.com; h=from:subject:message-id;
 bh=s3+YaNI0kXS1WHGDFc6jVaitSFXgSkUDG8m8Ajnq+tw=;
 b=owEBbQGS/pANAwAKAaWDQrcJVsSBAcsmYgBq9Af0ExsDKf8CzltHQES6RXvy0dPDeU8+5oV26
 lfnR1gJmmmJATMEAAEKAB0WIQTJHsaNZOdY+THGqJelg0K3CVbEgQUCavQH9AAKCRClg0K3CVbE
 gX0hB/9kK2OVIxktjiccv5Qt+4sOvnD+74ZO2VgbmyXsfBFOqFRZnegmkamGZX8PQLnnR2zXCt7
 9legz4pUNFwgTdQAbuzSYYU3ACZhEfDbRixgiSPS7789/S8NXF9D4zsBTCi0bdTidgZ2hpYxdmk
 PJNAxo8ln23bwohai178LtE6cpDKMpZhQ+rCLsmEFwultsfybdutBrZyTx/h4WWRqrw9Fxbzyf2
 IBzozq+mFgPINyD7bU7gQ4dIecIDT+jmWP6Vc954uAhiD6H4dCuBAPyMwcaSaA+oKFepdVvty4k
 TwpozOspNnjpkbU8EMfhdjnlJ6ySp3iowSD1WSUKc1rEfCGj
X-Developer-Key: i=kylehsieh1995@gmail.com; a=openpgp;
 fpr=C91EC68D64E758F931C6A897A58342B70956C481

Ventura2 has three LTC2305 2-channel 12-bit ADCs: one behind channel 2
of the PCA9548 mux on I2C bus 0, and two on I2C bus 3 at addresses
0x08 and 0x09. The bus 3 ADCs read the valve voltages.

Describe the ADCs and expose the bus 3 channels through iio-hwmon so
the voltages are reported as hwmon sensors.

The ADCs use their internal 4.096V reference, so no vref-supply is
described.

Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-ventura2.dts     | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
index f3dbdece3076..50e652cc37a1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
@@ -190,7 +190,8 @@ iio-hwmon {
 		io-channels =
 			<&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
 			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
-			<&adc1 2>;
+			<&adc1 2>,
+			<&adc_op_fb1 0>, <&adc_op_fb1 1>, <&adc_op_fb2 0>;
 	};
 
 	leds {
@@ -392,6 +393,12 @@ i2c0mux0ch2: i2c@2 {
 			reg = <2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
+			adc@8 {
+				compatible = "lltc,ltc2305";
+				reg = <0x08>;
+				#io-channel-cells = <1>;
+			};
 		};
 
 		i2c0mux0ch3: i2c@3 {
@@ -583,6 +590,18 @@ &i2c3 {
 
 	status = "okay";
 
+	adc_op_fb1: adc@8 {
+		compatible = "lltc,ltc2305";
+		reg = <0x08>;
+		#io-channel-cells = <1>;
+	};
+
+	adc_op_fb2: adc@9 {
+		compatible = "lltc,ltc2305";
+		reg = <0x09>;
+		#io-channel-cells = <1>;
+	};
+
 	dac@c {
 		compatible = "adi,ad5612";
 		reg = <0x0c>;

-- 
2.34.1

