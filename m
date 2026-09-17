Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21763C1090
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648045; cv=none; b=MS3S2vnaiNgPieQZiokCd50Iuz1jqfLW3peE0dbCw5oEwBNA7Zg7iJ/NSjQMuw6EWlu5gJ5KyU4FJO7PNMnM32MzP/SCdp5liPWSciGxmUIXWpx53JIyFhjMa5ckc9MZjspezJbky7dK0GFVgpk26ADq881Y0xydQCTJ+3jdEHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648045; c=relaxed/simple;
	bh=MP2FNncNzN5nDMuqa8c2mwv9xwXy0f3dmsWdn8BAIb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xn/tD+KMBTnZ6P5BZmxCbhjf0nYSdEA0OENqyoTkdIFixz4KBma3gxppTT1z+WE8LYTkEi64vCSiJ+6o+Ev17D6rXB4tzzKODTatxeLeHcp475mZdzxIleKRTGxX6u9TjTcESrKlIiG0i1yDQsgcppXq6vBfAgh0GJjodbc66eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0W0ljSc; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0W0ljSc"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so656219f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789648029; x=1790252829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhI8SzP7IG6+w349oQAHdsKcMYwgaoAFfY9n0UY/I0M=;
        b=H0W0ljScT/p0ZQlrCpMHadS6P4ijOldNYdJOcOb7FDCpboHp5s7NWqaaCpfN+GNGHN
         SwEBpDLuD9psw4i2GND+lg1Y5o38fX2Lcluw/77Fw2OTFj5qykBTMLLJo1l7KSyxiEdp
         Lfr22du+j6gZ9uhLw4SiNg5IYu6s+w6vDQjWK88MPEBb7N6XD/hsFAeG49tdEZjKLKwB
         9fG2a4wQ/cjd94aT/sYzhxb9lizSnnTkmgRwwV8rduvf1JmVUxKXYtq7y5878KxNfdv9
         OIYEmX8QzrAlEX8GDbXQuf4mzWBKikftOd5r9veZEznEcVj8pOlDhyIvW5Vw/odLO7yp
         TuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648029; x=1790252829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhI8SzP7IG6+w349oQAHdsKcMYwgaoAFfY9n0UY/I0M=;
        b=UOxSPf9ohqvu1yFl8xU7l/r8/oi6wckMKc4ptLB/swR63VKXu0UQyte7GHQFwLHwQW
         5ybKFL7PhPAjnYopd+VMLuai1op6wUnvSs+/XCMYPOfMI+YqqYIlEg0/MA0l0jyN/Wus
         dKtowZZSLJwVQMW1XtFMfKUpMr28eADk4xPIjuoHaK9/1P9UWwGp3rXZLGj/MMU7yx1w
         SkC72O+5JgyZM2gbac3ApGykQGuqprD+Ng9IMVp+nMiW4sCxYqt/50/lsn+Xrh20VkLK
         HrI55pIx7Vf5Mgs41EudHtjpbwOFJsAIpJezTaN8+F8cJepqyO96Lf3Qjda1eTzSfMg7
         nScg==
X-Forwarded-Encrypted: i=1; AKwUvBzWF/fI6Qet+nOoNFzDnobGZQdZ15K/YwQrL4wPKfFv7YJ3VbE5s/oFJ3+jtudU/m7M+9i4qzCs6EL9UbM=@vger.kernel.org
X-Gm-Message-State: AFuF++mSGFofqG/dfVX9h7+t1SqZHZs2UzLSGBsGyaYoJur9mdGkuwKo
	cbOOgzPKlOZ9nROVrm1L2gFhKzRpuhsxRrUKlfP6SSwDIPJS0SaWyGXa
X-Gm-Gg: AYBFou0msZdWsiuCY9EyDBvRD6HpinoIa6Cs412zzLru+L+LZRQnFMCuMMPCjVUK61g
	TflzQzoUYmxJKH6qJAZkiw4XlFJCY5wYrjWoT5lLxIKYH96a4YVvUfHzk7sLu/78FhiXxNPVLSQ
	8p3/xkD5Sde5Y3QJGXJc5dx9ZlPIth4V+kcOCpcmq4jpNnjP+uGwCM97GIgarNHT+n3WZM+vl2W
	CU2Tlu9+zOUMqk//JTULFPJUMr6B7XUttirT5PLwiN5KIrvgxRppVn5tEkf08Iw82Nx5vT8Vykq
	THeKzX6tImUGiju1lQvW7YnGX4XfaEIK4YuuUuhKhEfAJPzbdknl/7HzxU81CBgmgMv2bkfi6Zj
	KqlSkDPZOOYFiz0gLRDQVOvstvnYYyuo+OHYep9yTnibtFrHCTqnYjmzxYqcYqaMN64Ybaxpvn6
	apklS/OI+Ft6PVSIglbP44aAPDmO2z7/6JQnWGgKFNkNwIcBh/SlftO3IPwj3LEE3KI+ysJ2U6m
	2OVAHjxlxmA1zlzAqA1c6251Gomoqw5o40HJNP/Cb9t5KYHqSMGlk7t1Jzh0LQ2fqLfKlVfynQS
	3QdCPDrRdejet3jnHkkvU4LSDceQ
X-Received: by 2002:a5d:584c:0:b0:487:d79:7cf7 with SMTP id ffacd0b85a97d-4870d797e09mr8077150f8f.52.1789648028528;
        Thu, 17 Sep 2026 05:27:08 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:881:57c7:8b8b:8936])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef766dsm14780947f8f.4.2026.09.17.05.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:27:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Sort nodes alphabetically
Date: Thu, 17 Sep 2026 13:27:01 +0100
Message-ID: <20260917122701.160720-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move the sound card node before the vqmmc regulator node to maintain
alphabetical ordering of the nodes under the root node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g047e57-smarc.dts      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 14f5834082fa..8094599cc8e7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -77,6 +77,14 @@ aliases {
 		mmc1 = &sdhi1;
 	};
 
+	sound_card: sound {
+		compatible = "audio-graph-card";
+
+		label = "snd-rzg3e";
+
+		dais = <&rsnd_port0>;	/* DA7212 */
+	};
+
 	vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 		compatible = "regulator-gpio";
 		regulator-name = "SD1_PVDD";
@@ -86,14 +94,6 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
 		gpios-states = <0>;
 		states = <3300000 0>, <1800000 1>;
 	};
-
-	sound_card: sound {
-		compatible = "audio-graph-card";
-
-		label = "snd-rzg3e";
-
-		dais = <&rsnd_port0>;	/* DA7212 */
-	};
 };
 
 &audio_clkb {
-- 
2.55.0

