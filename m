Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962039;
	b=GubazdMQ7BB3F6FLjn8Cps/oIN+d2lQMquklrwBcsL3YDyo1Dix+X8bpEuCuEA3mnth5
	 pI3kSoUqtbbts3AzMS+DVqnxu7XG674B8FKpfLMPaCfIzm+LUis2WSQ0DrfdXWnfoyI20
	 2qeSYMrhVnWLCTrD33mCm+cBtwZhRidvrWulOFqKIx0XtZjUtlC8hJVKqnEgJ0KhAgC36
	 gOYdTx4Zy8R+w4JJVdWSPVLYCQ49WYTSKFfFcZGzZooM7OPS/WzigINZFha0xtbnLlBw2
	 o4RWLLJJ5PO70QeeoOOqM7dQev+hzhi5UknUjFkmwRTBM/r5xMyOX3DBjAY4KIrQQkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962039;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=dS207nY+vKk8rnxpzl45dHmOZIC6VTVoDl1e+9+ycpI=;
	b=3mnfUbDEhPzBjK8PbSgcrf9R50HeMG5g+hSGlrJX3KIXiJA8tOmZTvj44ZIy67sutsRD
	 kNhKK+qJjkueSBfjvukxub3NeLxZmH4lhWmQy4Ab2aqodVdyLtrE5BoDQfpwR9Pd2GNEt
	 ++imtp0d4MmcIHLOq5CSGluOpBvXHe/zGq6SvhDAaQJ7fz2DVdOb1esmm0MK6nQVKUydW
	 0WzG0gmHfyMdgyZO5qA1QO0tJTRlxqPIO+uxHzqJojvFZ/nNx00R5A8PmwwbPXAbjOdrn
	 ZBDt2VhYSvR31OXDBySzmBZHsEgHTf6S6kne8iVLkb9FtIXscTSlc/PfpMPTGAoWN+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b="SVo8vv/G";
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ABC606A326;
	Fri,  6 Nov 2026 10:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60ABC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=SVo8vv/G
Received: from surface-pro-5.uibk.ac.at (ydWLT-U1-3-167.uibk.ac.at [172.25.3.167])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6Al07I1953426
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 11:47:07 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6Al07I1953426
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793962027;
	bh=dS207nY+vKk8rnxpzl45dHmOZIC6VTVoDl1e+9+ycpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SVo8vv/GKms+n1faf6VXArc34kbT40bmzWU+cpItCaCxFgc/IjgHVqwJUyvZdi80K
	 Tf1wIDVJZRpyYQpYgmCO9KYfCou70gY88OeW+Ej5dFXbQXljBkYlCXvZM4+KphL0Yq
	 QSHq3PNhQ/fWkoJRLhJYyuJDpqQxIyx1uAMX3KEo=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 03/10] arm64: dts: amlogic: meson-s4: add the PSCI CPU idle state
Date: Fri,  6 Nov 2026 11:46:52 +0100
Message-ID: <20261106104659.54656-4-christian.koever-draxl@student.uibk.ac.at>
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

The firmware implements PSCI 1.0 without OS-initiated mode. Add the
core power-down state the vendor kernel uses (power state 0x10000).

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 675db02a8d5e..57270fbfb4a7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -22,6 +22,7 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
 			d-cache-line-size = <64>;
 			d-cache-size = <0x8000>;
 			d-cache-sets = <128>;
@@ -36,6 +37,7 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
 			d-cache-line-size = <64>;
 			d-cache-size = <0x8000>;
 			d-cache-sets = <128>;
@@ -50,6 +52,7 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
 			d-cache-line-size = <64>;
 			d-cache-size = <0x8000>;
 			d-cache-sets = <128>;
@@ -64,6 +67,7 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a35";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			cpu-idle-states = <&cpu_sleep>;
 			d-cache-line-size = <64>;
 			d-cache-size = <0x8000>;
 			d-cache-sets = <128>;
@@ -82,6 +86,26 @@ l2: l2-cache0 {
 			cache-line-size = <64>;
 			cache-sets = <1024>;
 		};
+
+		/*
+		 * The firmware reports PSCI 1.0 without OSI, so the platform
+		 * itself decides how deep to go and the kernel only has this
+		 * one core state to offer. The suspend parameter is in the
+		 * original format - bit 16 asks for a power down at affinity
+		 * level 0 - and matches what the vendor kernel passes.
+		 */
+		idle-states {
+			entry-method = "psci";
+
+			cpu_sleep: cpu-sleep {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00010000>;
+				local-timer-stop;
+				entry-latency-us = <4000>;
+				exit-latency-us = <5000>;
+				min-residency-us = <10000>;
+			};
+		};
 	};
 
 	timer {
-- 
2.56.0

