Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794815721;
	b=FsfKytau4oxHjTJj8jvF4cWeZbW26mvKlbAWL8V49fEEb+RiOpmVhZ9m3RnaQIyYmrOi
	 5KeUHfayhao/88sXxYPGK4L/WUfpAUWBPiuiJoGCEUroWArCdNUdlMrtqbBapXGkbsSLZ
	 2TWK+gsg95wRPyYG57MRhls2t/Kh1dEsM/QAC8IhTEf8gbkCE3QFJcI8b23t1377XbhsD
	 fm4qTtZ7Uw2Gg92b285YRZLyKlZlJ476ID87LuKU/nNU6Yh+2DJja9vPqtWR74CCniEtt
	 1JEL7RiRJhaEmE7dPoUzlwOBxQJy7x54Opz1go/02MIFTtSU1ErcA/6rr1pZZf06m/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815721;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pssg71LWdCQxl/L7C/4N5Wwh5nUrjx9m06X46tmlYrA=;
	b=v6G8YWtwVSZOzja9iZHu9czpVcZYB8jGOEnChlphsZU2XthKfEx+prX9db7tFM61qAlc
	 UAPuk2gO72WvRvEhq9NoENUSDs/S4J1pe0gqLFN5d3da63vqQJMjEOIOQ9VNbWbnvQVYa
	 Q/Tn0imRVQDrnvGf2KQAPpFNYmdvGNcR+vkdu2QpOYx9ixT+CnRPNIqDZZpOmoZimBfr2
	 dlcBcMc5ZOxNTpPrBuAo6nkpQvwwCIVkurp6XawBpPFt32nnjdkjRNAr4iU0UR4kCKgYu
	 IwjGW/SyG9SkhRHcMftgatTzLD2HfLiTJQ0Hffg1CKR86ZvDeDYWoUYhA8XVvZHNzIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR8K73r8;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252C4606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252C4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nR8K73r8
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37f14feca60so970600eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794815720; x=1795420520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pssg71LWdCQxl/L7C/4N5Wwh5nUrjx9m06X46tmlYrA=;
        b=nR8K73r8vOcuWUhBEq64W9YSpUa+v/PRgUPwKyfQG1jvdduWSKsd8TFWcZSP8AmJwO
         DzTPGXMtQjjAxJQng3M/aE9AcguqMLs6MRhRGmOwXPiU83PMi3kBv2CUKtYa0AxKh9P1
         yn5tpIKaOLxzs+zpuBD6qXO6ratdv89JvDLMHvNW6Xsf/fMKt3c+ubA7gqFdN+4cc673
         ++MlPj5KbIVQltV7TU3FEjdn0I/NTXHiwA3XSol8mpn1qqI7JR2ssnko2xR6hHWFXdu5
         PXar660OPuNuRlOkJ0bNTpmhN6CEDPOcC4dDisYaEpbSWkVXIAGk7180sB90X3uKhTE5
         YNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815720; x=1795420520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pssg71LWdCQxl/L7C/4N5Wwh5nUrjx9m06X46tmlYrA=;
        b=h7FLakciAqgm+zvn9BbU9g584r0/LUByGwNRuBlbmdOldoqGZMI2zxj39gvetyE+C/
         mJFcOlsPcJplwfZ0xYql4syZoSw+Dr1V5b+WKfhFPvrtOM1v00u6V01w/Au6P08SR7si
         uDwME8+g4z2g8HTOCPBkQyr6RKmifuxrk6LEADCieeGQnsUfL6vCUbvJWqye4x5sl+Ig
         XjG7joPvK7Q2MdpQ86Ohxx5FnRZjZGPa6vuDxwS9giP2d41uBDEUZKi+uNUz8B8vMiJ4
         XZ5NrfJYIJ8JUmO1b2EkyIbJl7ecL4DoO15Uo+IK4Yke1jQ8Jy75ExwCej7c/Zr5s+El
         vfgQ==
X-Forwarded-Encrypted: i=1; AL+hErF3v+94v0HYoIM3ltAcBjLJK7tZuMulQeVk8UkIBHTu6yBjZM/qQah8HQqsyoqx73mrO/j4z6wd+XvZLHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nq98GaCfbs8OPmvjhAKnvVVw1RIwEHwxBO7+FZFX2hppmPJt/
	U1gTsJbIS4z0i0KvaBoB87jyN7H+C1vF5LSLMKdkz2PdSJ3ebtM41M9PAiaSj+2fgUs=
X-Gm-Gg: AYBFou1OMYPDBJD4whVAFeB6BP15CvfW6KNwPFatPmBAZKfUSmLztgSYcLzk+Y15GdW
	eWFyYTdeCN3YVGEFVl8eoyCIAb0XTHZEAlP/G9wrgfb5bFWYJnVdQPdW7/6kP1GUEAz6A3RBddd
	U77/BAa7hA0Jc5Ker8vfRvNA2JNr2lSQiF18dhsFzz2sMBVXyMcZNIpW6SlP4vnBGnQP/TASkrC
	yJgJ0JG6oZL0+SaryvAxv/MxXf3sScsSxIJm1emJGwpkbseRB2Bib3X9SxTmRf3PfUcRyFQ58fO
	RgvVS69Yqt46yJdgCM1TaAqNx6O7eX8x2quJIhPhcjv+VfiBLcYh/OyCz58JTpI8PGtU3XvOyY9
	8Ghcka4Au8zrCv6mhYKCG9mkMTtMJK6rcTtOIyN5giDNgMCl0+gKHb5WFkCUn3msyOuqRT52K1D
	gdgaxShP0evgpw7APYU6edxKqNMSNrSe12/pvr6wDlCecZtIxNln3xBxbGoY5aQv44ToBV8pHSG
	ZNHz1f556K7FgihljgzvHdsZdOyuVIAjCwjZSZ3BkHEDDpl1VPQoedP+2stwNKfR1AfqHtex5Eq
	i3zTK9hk54/6wS70dh5+1Eb2CuNsPDM8z1evXsIl/aQN67t4oML0
X-Received: by 2002:a05:7300:cc83:b0:37f:79f1:1a1b with SMTP id 5a478bee46e88-37f79f11a78mr2072488eec.22.1794815720090;
        Sun, 15 Nov 2026 23:55:20 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.223.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm31398803eec.16.2026.11.15.23.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:55:19 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
	me@ziyao.cc,
	aurelien@aurel32.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiayu Du <duge1256@gmail.com>
Subject: [PATCH v2 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature trim cells
Date: Mon, 16 Nov 2026 15:54:23 +0800
Message-ID: <20261116075423.1519438-4-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116075423.1519438-1-duge1256@gmail.com>
References: <20261116075423.1519438-1-duge1256@gmail.com>
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

Add the K3 eFuse controller with its AES_WTM clock and reset. Describe
fixed-layout cells for the temperature calibration parameters stored in
bank 0 and bank 7, using controller-relative offsets.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..b548f5029d59 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1439,6 +1439,29 @@ saplic: interrupt-controller@e0804000 {
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
+		efuse: efuse@f0702800 {
+			compatible = "spacemit,k3-efuse";
+			reg = <0x0 0xf0702800 0x0 0x400>;
+			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+			nvmem-layout {
+				compatible = "fixed-layout";
+				#address-cells = <1>;
+				#size-cells = <1>;
+
+				soc_rtemp_trim1: temperature-trim@120 {
+					reg = <0x120 0x1>;
+					bits = <0 8>;
+				};
+
+				soc_rtemp_trim: temperature-trim@19a {
+					reg = <0x19a 0x2>;
+					bits = <4 8>;
+				};
+			};
+		};
+
 		mimsic: interrupt-controller@f1000000 {
 			compatible = "spacemit,k3-imsics", "riscv,imsics";
 			reg = <0x0 0xf1000000 0x0 0x10000>;
-- 
2.43.0

