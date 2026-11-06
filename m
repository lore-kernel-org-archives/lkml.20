Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793945240;
	b=Af2ZYZ9M9zVP0M+9hsqBRW8ttq4coM3D5u2mkMmXkW/UbrfUZRaLNE+Bnofbst/Kr1fO
	 XgZr+xHjcHLJ5Fv2vvdmdrHjPyTz+8FcK91t3zfQNxvDoRyr1Qb14mCDgOMUj5usoRDXX
	 YYs2xuRWaaFQnPlBNUNsX4uqxDjScTuMYc3qToWmV8a1us3PgoMojDpvu3oRhgUPjPQhI
	 uCrr9Z3SXuouB5GJj3+zvxpJ8sMogLfguqzrlgGG9MeiJ+5VxLhidmC697AobsxB/o0PR
	 Ynw1hn0WQFhepEZ52g056jQI/hW7jJcq18UYU6cuQg17Tdz3dfOghvIvdqgaotePLGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793945240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vsjSpshj4HQImP+U7D3TJsFl4xWtzao3mOwb3vIweuU=;
	b=rlO32eHKIc2Q2glCZAjarM8GX5Jrr8oE+g06yPE2NnvFZAyd+/59TFXg+W9M2DtG/efN
	 J7qoJK9cUzsW9TApb7p00//uwGaUI20AqYc6BBMIbpBvJMXjSkU5gC9lDbxwAJiXhLSMa
	 1YuFtW3Hem6Fk68TMjXI7S+FGH50srLf9nLoHVQgjxcdeNyYl26XwIuYtP1dwWtdpGhNW
	 733tvnqmCVmkb3FBjPjlbz0oC8Z8eaWi4PVY5SfDMVPIUmcT6NVEiCgvxTiPkUqEjDPlu
	 zVOQsA+5XgKB2uKh9Ba4v7OEWzkSN5evZhqS2YUj6O59X+L1OcKqMoxSlBtjJWNj9hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSSE8FJv;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBF9606A337
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 06:07:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CBF9606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSSE8FJv
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1931ff67a29so1058388c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 22:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793945240; x=1794550040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsjSpshj4HQImP+U7D3TJsFl4xWtzao3mOwb3vIweuU=;
        b=mSSE8FJvQ7kNMBFgKYL1MtYMZ8AyNhlmzTnRtJXTr6ApqwOsVs5hC9EL3n8kHDDs3V
         3zUOb5X0dpcHLj/Th9bINvlO8qUycuc7OdafR+qKcHx5AjB0j5Rdfw5DvhFeFnXsb0fx
         1raae1G8nzurXm+kqJIuq/L+Agcdqzv55mQt1AsAFfG4yWXJf+hCEGSGLU94s7b1Q5ue
         g17K1CJxoKyaQ+qNxTqiXEkKGPkgLWOOucfAQT1WRqOvxm57Ak7z7ahl4SB0gZ+ie6K8
         CgRZjRcVwwQ7YplpqlFlslQ2c387LBOEiGhEScKlOQxAW7Os+zeRdWwwFdiZlWYKTyMz
         555g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793945240; x=1794550040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vsjSpshj4HQImP+U7D3TJsFl4xWtzao3mOwb3vIweuU=;
        b=W0B44q0zXrxsOxqw1htLl5M6QDSb73ePmxhIM9v6lG9SoffhhqqyNl3PqHwN8uLaUM
         vlLb5G/Zrh/YWEZK9C9e6dEOFycbUeNLwVzKkW0bvOdZf4DEHhgOCn98m87tmNtYTaTz
         7b+YO54ryXt11NzMjUe+OQwBAuyaSrnX+ChA2qjGIX2nu2gHRp/cTbLM0neGgyOEGI6l
         L/3c9wXbei38msFOTKyCCC/jKSIHgSIsn2jt/POSiL7nKPtnhUVTRzia5uSVwTj/Tvvb
         0ZhTKfEb2ZJsAMhF9k+/5j92F6Mme2zueUaNJmtdQjGzoaWFHVrVlHi5wsymxilAXiI2
         kgxg==
X-Forwarded-Encrypted: i=1; AKwUvBwLAw+HliItNLYm0RgAthJ4oStEz6tvMzKwnE/1sSwbdGOUJ4wYwfCSpzU2t25/4JOdKub44DI/Vu6pxyQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/i/Pkp2p6vd8kALdzqJAFpKkzFN4726EigO9YVnniOlVR8QB4H
	FNeyt8SU+A3jK8W+P79WTh+W/TqMQLA1UVse7UBN/fowwSh4pvcO1dn9
X-Gm-Gg: AYBFou3IgQUiqT9IBQ3P8h4JsfmNFLVAJMBjbKTmdXgxTjBjMqXXfz6dOKawgKvVY+c
	SDZz2bWsEtwqjVjU0hjutU7SQQH14Hp+/7Pw+MhG7cX7/zj0knd4k02kznPxBV9mjgG+zDtOrJf
	wL/QpjOx88iW3vE4L5tzzGCjRXa3YwRccFmqh2t7h8W7EspVwvBijuG0NwKYCyMWz7oV35I9gdg
	fDxNCzfiXj4uV9CDyPeK6XaOOjOwMwo/3f1qHsIzQ7W7j6o+e92hz5iuQTzSdErUPmpNpbQkuQE
	LHv3CEA29xNdN2p4p2AlwlyyM8/uhKw2Lk32WvGIi4g9Wclc3U0kq4ni4Nu39RPKOQJFqjGS4oq
	gv3A6ZIzR+Cc+SrRFhaK/I9UArqm8zORVYLMN3I3k9kLHrN3m6ybh1qbWuMe4wW3OH1UrVwSPBO
	3NXOppwEi+jBl5Grp4BNUbXxiwivZek/TqUcMXs3LCNC4Ua6aooHZoJHvhRe54e7H92tW0JiaqD
	HeqyeRV1BIeJUlc2F+4ARHk4D8Oa9MxHBeZXVRrA0wR+Z4whv5em30oLj6gxq4nRbbWO+QzXJyT
	/P5U2naULqJjiHL/udsKp//osI9XV54MltJdz6BI3M9GgHIxVPfL
X-Received: by 2002:a05:701b:2302:b0:1b0:166c:6a94 with SMTP id a92af1059eb24-1b25d336486mr1698470c88.28.1793945239501;
        Thu, 05 Nov 2026 22:07:19 -0800 (PST)
Received: from duge-G3-3500.taila331c7.ts.net ([183.192.220.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm2780992c88.19.2026.11.05.22.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:07:19 -0800 (PST)
From: Jiayu Du <duge1256@gmail.com>
To: srini@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@kernel.org,
	troy.mitchell@linux.spacemit.com,
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
Subject: [PATCH 3/3] riscv: dts: spacemit: Add K3 eFuse and temperature trim cells
Date: Fri,  6 Nov 2026 14:05:25 +0800
Message-ID: <20261106060525.346873-4-duge1256@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106060525.346873-1-duge1256@gmail.com>
References: <20261106060525.346873-1-duge1256@gmail.com>
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

Leave the controller disabled for board-level enablement.

Signed-off-by: Jiayu Du <duge1256@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index e89d2cc5ca8c..51861fdc6a21 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1439,6 +1439,31 @@ saplic: interrupt-controller@e0804000 {
 
 		/* sec_i2c3: 0xf0614000, not available from Linux */
 
+		efuse: efuse@f0702800 {
+			compatible = "spacemit,k3-efuse";
+			reg = <0x0 0xf0702800 0x0 0x400>;
+			clocks = <&syscon_apmu CLK_APMU_AES_WTM>;
+			resets = <&syscon_apmu RESET_APMU_AES_WTM>;
+
+			status = "disabled";
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

