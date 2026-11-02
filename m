Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645727;
	b=42+f35w6PQigYcrJI8otyJfjz6JzRDG5B62HrjaGcY0PpOk4au8HbPabMu4MqFRWAp4S
	 aMsnS8WET6TNqkIzYBM705x+T/YJU4snFC1gmemTfFIcC+zqcyJ8f7tl2StFcy42sWqS3
	 8b0A8Bf4kg3Ubm4DI6IoFhtADsT2BUaNC+Qi+ZgfpoJf95nDXRwhKaKxokz3f6yTTDP7U
	 f410sw6/sLx/vnon+6VVOP+f96WD6g8nN1vPZcL9xhEy8hRfnliKP2Jn13g3V/mT4bKO+
	 ihCEZHcGd2X6p0vpZzPCMiH/qWpiKJDsrO6sROXvrgNs2v9AI0n4itTD3ksG7DU2Q+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=CC2o7x8TbRQPLTSxucMf934GUQljaJFM5e5gaMCtH14=;
	b=XZxEci38gLBDZIr0XAgyOBiGewkdu6BmF+P4wJFP++Cyoxn8GJtGfu4DJBLkrKZ0ho8q
	 C+i8OKIEkYkSDYCetJcquKLJWFrUNvefc4mDbXGM0HBMsih3nevTxHf3byPTmSYEVU5KJ
	 mtsC3WIq1A74c+JvjPuZbpve5yZHViYmuYEUARzQxaSvUpxksp+Iu2CuaUzHwUoPsvQ2K
	 4KyNVYgzOGqxTodsPHJ9a7G0t6lu0epdDz+VRCg2ZrNX4zjDHNHl9Ke89efwj6PDt9FMi
	 lSm+cGnrQn5uGDv77MHXFkjwWzHV4ZDtUBB9J6nCltc90Xu/4YtbOzi7lwHHPXW+4cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HOcg7Lnh;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3C0606D801
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3C0606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HOcg7Lnh
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e04773687so1010306f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793645721; x=1794250521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CC2o7x8TbRQPLTSxucMf934GUQljaJFM5e5gaMCtH14=;
        b=HOcg7LnhQ9JtZYY6lgNw3Ay2bNRTAxDyemis2WtDzuZhR9YreR15nGz4oH66B84TEd
         2nqQ7Llr9LljeH//XuP0/DvOfn4uwR0p5h97bKAmJQwV6i59Sz6xy/hEXy5Jkscqhzau
         bbvzxkDZUy1vyGaE0dXCWjexFLfm0mwdLer6FO/9AOMr12vK6jjq3ScGhZ4OraL7yEUs
         JDt1VwbaYO7FKKhnqFZa1CLh8mhmEePKT6pA+F9bk2V9gRmTmr+dtDiPV3ES+0FbEi7e
         ZN5Hyv8ccQSV3WN5ojy8lGgB/9nxPOpOw18fka285pimFCz1iOfuV3InujJCE4fIVcI/
         UvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645721; x=1794250521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CC2o7x8TbRQPLTSxucMf934GUQljaJFM5e5gaMCtH14=;
        b=grbqGA/dk0GGmdNfgMQ8/ooV3ArtH9+fdbCAzsEDPGmHwg8gOAh6PwjJLYX+yz1j2r
         gsBOS4Oe72cf1YVVU2G9IipjZtpVh8kxXz+h53js6n1FNNl5YDu2/y93bXnZdquVubnN
         CDfV93zdhyOBQ+p3XhPuXwKWqcHMQGiNEO8XHIqZliG1F8T2whtsl/9fprffh/f8rjtj
         TrBeKjFCs0rknH5FF0eTEYwCiqFV8x0biqWeSRwHiVoZcNw1pEXqLkcoXF8VU/aLcToA
         ceOYlreKH1PBNq4Kp1RarN04XYrLE5ceFnyYOa35qJWxouA3ttPFrMcYEukHeNpgFl87
         6wWg==
X-Forwarded-Encrypted: i=1; AKwUvBwQAfvszAvSSyc4MKT6HowRMxH/kQyer/bRum0UEi5sQVn7iB2XN6Lky6l9Sd+BWSjlA2OlQZdFQ3tXl+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9c6AB+Ml4ybrEt1q8IOfOlZ2evH4xwwtHbwTkgaEeOG06AKAK
	iO4bSQQTzZLoqPewBkfA/Iev8iQjZhjmsItkVefwa6ruCtBHlNUcRLpj
X-Gm-Gg: AYBFou24NUaeVYNs2E6vL9RZxu8xZv/hZDL1sVd9h40BUgpF0hm6xWCY6Vl8T7YrJvp
	WU/5hrT6mW8Gog/QK6wcz/ssDkNQ6RFAUQbyuKfZvQXJxU5NeroKEUT1nnXGwiL96j/w9EYU/4V
	aADQ1BZzun8wms+uRFa+CAa5OShnx0tKZrimbEPvrCWrXQ+gF0loxTgusFciZdVYoa6/J7IFc/5
	D+eNvCaKroRExLEI8K3OupbT2DMpqST3HDef6+woWMiPMMuy01FPEO5hAipQNVwRcLPxjF2JeD0
	W1wnGgeZzwrBkqos8D4gZpytd8Y30JbRfw9x0qOQ/0UZOBLesTJGFsRX57lgBIe90ysI+5uA2FB
	ASTwdy7k9DIOgY1lEF+6yN73n8xHVt4Q5GjOLEDHMMxCQJsNTsPH3BasYaqt9y9iEEZuvGdZZXE
	DDyx24vfgmPG46mtXYnL5VD2+qFnbZ1/BZa9Og5pk449TzVSpGo4seoL9ZnbPQMgnCCvYBaddQz
	L7pBc1FhKI6AfC8xxHGE+ZO2KGTUDi5fRR0lFHhRSHDrJJzvSICZOfYF2w+21REKzT2+Dcw/rj0
	+BMHnV0OP+Q2fX7sNaGdlQgzT5r1TT7OKSh+JCwOQ1tVoG8wbtAE+WGrPpc26zSNM6oxMLJwi8v
	rDXXWIA/nd2vCkCzoYS1GyjuxWKPN6aqRWCylRBw+Q0wiHkTrZOjM
X-Received: by 2002:adf:edcd:0:b0:48b:f08:8159 with SMTP id ffacd0b85a97d-48e6e502fa8mr19192373f8f.40.1793645720777;
        Mon, 02 Nov 2026 10:55:20 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm21965403f8f.22.2026.11.02.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:55:20 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alifer Moraes <alifer.m@variscite.com>
Subject: [PATCH v1 1/2] arm64: dts: imx93-var-dart-sonata: enable UART wakeup
Date: Mon,  2 Nov 2026 19:55:03 +0100
Message-ID: <b51bef917d08b83bd231a4a228fb2d23c19a858b.1793645417.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1793645417.git.stefano.r@variscite.com>
References: <cover.1793645417.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the LPUART1 serial console as a wakeup source to allow it to wake
the system from suspend.

Co-developed-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 1ca3ec8330d0..d368a09dc916 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -385,6 +385,7 @@ can0: can@0 {
 &lpuart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
+	wakeup-source;
 	status = "okay";
 };
 
-- 
2.47.3

