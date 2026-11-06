Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962039;
	b=4ojI6mRiaNbrK83f3j8Jxk0XVVr6IjU5Tp2WyhSCHr+4tnOzRgZ7LhzYADNz6fieT0+P
	 uTKF9ayXlR+61n1p5Z7V5j/zFt31YLTDMebUsNUX9RqRItBG7eQwiUmFOh0EEolkFdxek
	 r4ooCEfaMOpUFmZCdklYoUIMf/oI7A05u4UeuGGe8j3OC376fhQvfbyHfzKhmu5K0Twzy
	 5wpzJhH5nnUAoNlVaOoJuSzBRnU2EwMi/E93FEW5kdrYU2V8wg+RXOWnzgsx8bByKhy//
	 VB37wsRWcTu94dw5/ZxKEGECkdDoCGKyl2oFJ2geXQfxBq51TdpgwL8tXc4/b3nyZ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962039;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=+g9463WTbWJYWWZfyXkIqbJXILiV4EfzrhMlVFy+tgg=;
	b=u4rLXcoEu1YD4gvl2ri7mfjvGBI9zUhZrJbpLuRy0n+/AXvzNSJLsdDzbRWeg40zE3ta
	 OI7naeES/Eln2+ZHqObj5tGkynAjgXeHJhx2LDScAtEwfhVx2xbpNdMsthhwsxwflsS7P
	 h2TGwrf7IbGPVBoNA5682qJkga27b8Nf1IGi7X18dEsOGmCGHemJcWx2U4kqdWPgaQvWL
	 R3FMWkgve1JH1T9AcpWNgy/+C2P6vbjhKlblKpcDAFZ980X18733D4rzymxF2hnIgPhiv
	 iB85Vg316uX48WgNK6NupoUkcoHWLV8+Xy3r/wRlyw2gToCzVs+wPQ1A4pvoNy7Kd2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=kat0nvxk;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7AD606A32C;
	Fri,  6 Nov 2026 10:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A7AD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=kat0nvxk
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07H1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:06 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07H1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962026;
	bh=+g9463WTbWJYWWZfyXkIqbJXILiV4EfzrhMlVFy+tgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kat0nvxkt6KdsrhA9+sloBt61oXZPE6eXY1/h+Nwn3bwRh5IbIsd36ZfeZRw9N+dN
	 Xm75dvO1h05flE3AbKAYfHXnd8pxxovVKFS49LGuD+r9KLv11wgmLVv6tZrBJjJwB8
	 tT28uMffzcMYG/Dc9+KQmIevGuKK56Ppk7PcBTu8=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 02/10] arm64: dts: amlogic: meson-s4: describe the CPU caches
Date: Fri,  6 Nov 2026 11:46:51 +0100
Message-ID: <20261106104659.54656-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Describe the per-core L1 caches and the shared 512 KiB L2 cache, with
the geometry the cores report in CCSIDR_EL1 on an S905W2.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..675db02a8d5e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -22,6 +22,13 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu1: cpu@1 {
@@ -29,6 +36,13 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu2: cpu@2 {
@@ -36,6 +50,13 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
 		};
 
 		cpu3: cpu@3 {
@@ -43,6 +64,23 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <128>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <256>;
+			next-level-cache = <&l2>;
+		};
+
+		/* Geometry as CCSIDR_EL1 reports it on S905W2. */
+		l2: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x80000>; /* L2. 512 KB */
+			cache-line-size = <64>;
+			cache-sets = <1024>;
 		};
 	};
 
-- 
2.56.0

