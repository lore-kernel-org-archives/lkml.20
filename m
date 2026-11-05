Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897074;
	b=4uHMbnN644y57EbZp6OcMzFHqXAIoKpwSJhsSTzXXBWEvD9roEoykQqmdYlcJEBseKU6
	 SVXqpb9vY14wmHZHEuS4VZA1D5UBHaac1fszlc53zf8zpGmrSPdvcaZKacpcJQ0bAPdRu
	 OZOZAb7iNTQBFu5IENm6bXXDobDuqewIN3i7hYkHPzyDVGth5k6lFj5E08Wra18UWXMDG
	 u/sp6KrDEMItAlV3adve2wNbO423qSbqlJsPu84SvuRVzODkfN9h19IsEKEmZ9P7FBwFQ
	 Lv5XAiTXSdfyzZxv0TPNunVdA6sx0WLHUD8G9i/TBG9Y/DjZjh1PdIKeeOUNtfA/njw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=yC83ESjOXOvwycANDHqMUIA/nyL5tEqJwdOrO5/UNYc=;
	b=vLet9QAlWFTrXqGlTRdnk/NiAexXUafaRm8oa8RzgqhDr+78k27JWDib0n75HcARa2go
	 9GM2oFYYB0gRm8z7OL4SnJLC9JN8PkW+MnmAu5G7HldsOdxfYvSSqr1zSnQlj3XJENANq
	 9A9OxtAJ1+KdbEzjHkGAe4pjaY1ijsMA2rFyjRrY1ROj+apsG5ArECcefNJeQNv5Xr84z
	 6wnl67omdQ5OTsRqz1OsPj9LiwiGrfeDj8rxy/+uO44jYP06Jt/IuTz8abuxXobSUrrSI
	 7wf6cKnd50k8iAACHpHc6TS88K4HikHJmpiJLDMuTl0+BBPr+1ZQPMG2uF4E3zOGwNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xfIfLYcP;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A71606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63A71606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xfIfLYcP
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4d1b35dc42so188153366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793897072; x=1794501872; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yC83ESjOXOvwycANDHqMUIA/nyL5tEqJwdOrO5/UNYc=;
        b=xfIfLYcP64DFbq+WXEUe9TYpwTOFTkySIMUElL9UJ0zJsmsGjdUUciQoXTGP3wKcCo
         1XYgvft/Fv/0vFCllUsu0rxITDqYRLwtlkrRR7lIvP4FEHCYwhjN3uVlvnDpoqXCTdyN
         796+LDnAGjm+fL5Sc/0IWvBT8ZuXds9TSREtvCM9VKinLLCn5CVRD8puQMFZIfIpsyxY
         DxrA4lYIWf7bvJINbPD2tmaONSHIK0aPYwRxhwRUeH8y+C8Wkj2JkauvpVoHxozWKDnk
         nV7NMzCd0VIT9n6AQ2vl2kNPmXustP6x5H/QcsdvSfm9ao9GLQvFQHw54wGY/ZXrDpOQ
         zuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897072; x=1794501872;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yC83ESjOXOvwycANDHqMUIA/nyL5tEqJwdOrO5/UNYc=;
        b=SPdKGddOXhuWxk2a9tVqHK8HmLhiWhBn0dTLh1ipVycJ/CptopowKNcuw7WWsdvF1E
         O+ZRU1oUVm0s0UhIk/4o5vlUxMJOFMt6johKa+QjUFAL0B0IbfYuR4QN+1HQs4s8fRb+
         4VSoN4NM+yLCRzKuem5GKr61hujGheGblYme2FbL0yLnG87DtSr9i5qgABHcJj9MXeP6
         MBJRFBHI9DQPbjWQyHmPYw0X6MK1pzBGycvlqZDG/TU6NNUoraGayphLlkGI4tdpzBCV
         67FKNFrMoNijFFP/t8xT7piDXS02c0fD0rZ0pSqvvBcvS5nbDMn5Z00jkPgCvXMRQjs/
         dHjQ==
X-Forwarded-Encrypted: i=1; AKwUvByUuChMz3/ydfM/XG0oegcnnh9XvdsFgbMpnVrVaqOLMVe5Tn+/By73ouRDaAufuyoyHRsXdpe44OKxb34=@vger.kernel.org
X-Gm-Message-State: APuU4Z+N2EUey1r8fkRYObhUijXEdP/gwy+A2awlGRUt1VhCVBG2q+g6
	dq+Gy0LLmg+MHeNbCn6WKdatTAo3cBoEFhvrYk69zC/8xeY3Se66v6vki+SYG0FA9DQ=
X-Gm-Gg: AYBFou0ufAn+Zm/sD5qFxMYf7xvN0sIehJZfSJRO9EPfBhIfGTeocm3kcjgjWpxusVG
	EjXrooyEdl7YoDni4ShBUPOmZsrGVHi755nCkluGXETj9oXAHMGrkSc7O3+KFDL3UhnLzDFFpER
	xAb6wfWBn6+ARtaoBU9cSp/16zDOLf/FU3WdY9MQyqxxjBTG8CiwK6s9hjQditQ9+KjvNnEBphv
	n1I6Dvm2PBrd7bNXmXhLZVsa/u9AlhcZz5/30XEgil3PIGm9cTTEH+2F3puRjffyw7bWkevEp2b
	zngkiYo6VZahglsdIUGFKa3WmGcfu8Bje7EeaZb/KI7LJDM+wAIrz//vmPqcR+ikgnqUJtX6iGU
	2Kq1uJ+0U1Nf5uwkcDK/9UM/SOVZVlxCl6T64CBouA0YkThSmkptrloU1v3zcKG1UMwYTPARV5D
	u6JPWZi6DKvO6nioFyBgLbipo2YCYzWZObKasR1GamBiP0PJa/RCYwLVQljsyrRw8iclF0L4N5w
	ErB+FiT/uJcxbp6r7RjzMaFDYXkJCpUUhujCE2jJ5Cn2CTrnHaoqYN3xM7IK3ZNmbG78zzPkFLW
	gZqVTf+pw4V0Z5sgfpkNB9kVaP9l04miBDS1L67QgOwvtSXO806RXuErLwVjEa+aAy2IQsjDjfN
	DZss8FgGqM9sUgIiWRZqC
X-Received: by 2002:a17:907:86a3:b0:c46:9745:ac13 with SMTP id a640c23a62f3a-c4d207ef40cmr272696766b.32.1793897071769;
        Thu, 05 Nov 2026 08:44:31 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e48d0dcsm186593666b.70.2026.11.05.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:44:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Nov 2026 16:44:29 +0000
Subject: [PATCH] Revert "arm64: dts: exynos: gs101-oriole: add pd-disable
 and typec-power-opmode"
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
Message-Id: <20261105-gs101-tcpci-bootloader-dt-v1-1-4b7e373778f2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAG2y7GoC/x2MywqAIBAAfyX23IIuRY9fiQ6mWy1EhkoE0r8nz
 W0OMxkiB+EIY5Uh8C1R/FlE1xXY3Zwbo7jiQIpaXcAtaqUx2csKLt6nwxvHAV1C6hpue9PTQAp
 KfwVe5fnf0/y+H+0rQNNrAAAA
X-Change-ID: 20251111-gs101-tcpci-bootloader-dt-274e58a82920
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

This reverts commit 817473b6ddaf9eb5f2bc7d6dce9fa13a921477a0.

The Pixel 6 / 6 Pro bootloader version 17.0-15681480, part of the
Android 17.0.0 release, knows about the upstream DT and disables power
delivery itself when the serial console is enabled. The workaround is
therefore not needed anymore and can be reverted, as anticipated in the
commit message of the above commit.

Since then, the node has moved to gs101-pixel-common.dtsi, so this now
applies to both Pixel 6 (oriole) and Pixel 6 Pro (raven).

With older bootloaders, enabling the serial console will again result
in endless TCPCI interrupts.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index e5736c39d1e0..dc908dd7e1c6 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -662,6 +662,7 @@ connector {
 			self-powered;
 			try-power-role = "sink";
 			op-sink-microwatt = <2600000>;
+			new-source-frs-typec-current = <FRS_5V_1P5A>;
 			slow-charger-loop;
 			pd-revision = /bits/ 8 <0x03 0x01 0x01 0x08>;
 			cc-debounce-time-ms = <170>;
@@ -704,12 +705,6 @@ VDO_DFP(DFP_VDO_VER1_1,
 						0, 0, 0x18d1)
 					VDO_CERT(0x0)
 					VDO_PRODUCT(0x4ee1, 0x0)>;
-			/*
-			 * Until bootloader is updated to set those two when
-			 * console is enabled, we disable PD here.
-			 */
-			pd-disable;
-			typec-power-opmode = "default";
 
 			ports {
 				#address-cells = <1>;

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20251111-gs101-tcpci-bootloader-dt-274e58a82920

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

