Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975319;
	b=WS3SGLwvryQQ6s4KaZXHjlWbdeVsAHFXjR9ewXwPen6V/GrCC8CSbN3K0uUEDCQ2jSoU
	 oP4maTVOqTAnvU7lqpzRnzqN4D1QF0ERVWPvpOxSteyypRbZRJO2opAww3QKz9p3X86bo
	 TUKB1gIbqCKoqaM95V70H5rcRXQ2uwL5iCF45Q6f0cLp6BdhaL0P8jDCWcigpjK9M9m7K
	 e8IA7I/SA+SqH83YYnjlITGPtMEJNQSzLwpBIdQQveeyry8Cjn5fDyyhOSl2KGp8Y03UT
	 N0z4csHbV9GyZwS2K7+S1r9PFIbrQa8HJs1gRRL6GcIFB8d/L/ZaGBzFKBBPe4dUSfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DVUzVNid1P+LTdFVvlLwM1Fhv12J1eQeUUaeEQIwGJ0=;
	b=hs8hMl4xy/3fxucbjR/FhqXzmic23DVn6boGGZAAGYlG+ubQxS4QrDM3pFHk1mDXNeRv
	 e3z6lHiGHCEUYnImQG7s5ZPF4t0BEqHz98gIi4xCsLwbaGnTFjkIKj9rFrSmGxZsM+T3B
	 +WHzme4Y8YUxK1X2kj8KN88UnGdrC1dpGTCYJxv0cQaQpgMRgJrnM0WjUSe1854qjQBt1
	 nuYZwUJT+uBg4La3OVQinKC1lYlXMK/G3J2VNVskMuopSeevR4KZIkl5t+ju1oInSgbkF
	 NHAvNgwWQJ6ZOFQQyoo3o14j9boD/VhGDqwQQ+ysrqODj2sMp1KJX1Sj4WLl/02ysjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TYSWqhtG;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12EC606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:41:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B12EC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TYSWqhtG
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so2484358f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975317; x=1793580117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVUzVNid1P+LTdFVvlLwM1Fhv12J1eQeUUaeEQIwGJ0=;
        b=TYSWqhtG4qTa8bk5UMguTkT4gS//KTP9Ibm6N4gcxtB+VWTHQRCIpwxjj5VlrRqOPO
         xt9gYfoUj418wEuMSioI8vhKynhwvZEnd8dZwaQ7hr8BsBXBa6YZOVB+mekSID5jvUUN
         odBY6voH9byWTcNE1n3Fe5SyzFIhInSRmKCR+1WLcHIXqby40w4Lhs27pvksfOeXFmVb
         lOS7KxBNB+K0LhMlYMBcA8QrFP4pqOn8G+vA7z6FwALSgWbZV7T7jE+uL64AwrVvOCmq
         p95dx4hUy//JylXZgF6wT8tZuHeH+aP2pfoVYwB3xRPvq0yruldB3TrO4Y1kxqmjLnD/
         5C8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975317; x=1793580117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DVUzVNid1P+LTdFVvlLwM1Fhv12J1eQeUUaeEQIwGJ0=;
        b=YAhBkD3x4rNoOzcs7DWgCNCwg46n2QKpFokJd+5prPQCAez7u8PxL6UYYB4k1NHvSs
         ZvfYJRVrQwNiSxlZWw4r/uUdrlReub9DfGHIV55Rt+HvmLqhfuJ3mbtVrZw33n8+KtNl
         V6BOoTkqJkFT+B8YCeJxFo5BTqTSsQ7chVVSudjTvnnVrRn7hX8Ho3jSelKR454Gpn+v
         MWlOg4nnwYpe4y4SPxfjP7xT3MaJVXE/Z7zd9G9YhS8oH/2Vq/uEz/WagPKq+34RoDS8
         B6sXU3fFNj7Lf58+M7V6t2LxMpvJUauaNTiVlF0xe3kvw7JwRW0T+l0IK+VzD7BSkllz
         iWmg==
X-Forwarded-Encrypted: i=1; AKwUvBwNpn61MELBCbQxTV/GoQnhOGduZkNx0szS9QontIbGevsWpad+mgvgLzW3A81yiF7JBxZh96nbk2rFk6U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLkXfWIA7kGpNCDTSh2z9ejBc2ETboNNJj9XdvA4pkkSYCRnXi5
	m3wY/akq0q4RHczfC2RL97rEqr6U09aPCNnD1JNpQhWSwKHAjm1RSveX
X-Gm-Gg: AYBFou1r6BRv/8PmsbI1XfXQZawweIVBX5TJNBomXFBuRUekW6I0ZLfcD/OlM5fBnOX
	LSg5uBExoDrVEAFJACN7EVGCdPx0yPW1VBg4VVLyVnly0Eu506QwasYaebZSoMJHoMirrfzIzvI
	J8nNxoHfwcg9N3iySrwfmHtz7NixCkoMhL3lRyq8ZzSZACOs9M6rex5iS12Zb6ruPflx6jowSH8
	h31hsTxAjhdZwW4j9Gf09CgHS6cqNPR3+UWGVf6OCtLHVZggdpiMY6DHfV+5uxyr81xnOJ8iwI+
	q9YAX8BhFL7Y92t+UroMhElMi5xeXETos2BtTiGCt6Mw5z8DTUYHFiqo7LBL7WFalWMigteuIf9
	eBrljx8r5xJs9GcD7lQEy6kOF/L+D8Ls6Oi55OfGCZu6G3b0EvyXtczRUEeJKq2yuB7VYOIhRwv
	vK3T+rono/5dvKTmNKIk0ZIX/ySHRWMTnCDQyhZetVOWyeuVYgcQyj/GAqbdEqTgRlRMBo9QqkE
	oMF0oEJnyJns0voXPUdM33TMRcb7TtvjCsXpT/yHtVZgzJxz5ha3lpRGkW5a1sqmsoT4MuRDhm0
	GfT4UqmW0y8AMA==
X-Received: by 2002:a05:600c:4688:b0:4a2:b73:d15c with SMTP id 5b1f17b1804b1-4a35ae71750mr96046025e9.3.1792975317060;
        Sun, 25 Oct 2026 17:41:57 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:41:55 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] ARM: dts: imx: keep the SY7636A VCOM on
Date: Mon, 26 Oct 2026 00:39:12 +0000
Message-ID: <20261026003918.155321-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
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

The SY7636A hwmon driver turns VCOM on at probe. The reMarkable 2, Kobo
Libra H2O and Tolino Vision 5 have had the rails on so far. Mark VCOM
always-on before the driver stops doing it.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/e70k02.dtsi           | 1 +
 arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
index dc7ff108aa85..bd9c6c6fa117 100644
--- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
@@ -154,6 +154,7 @@ sy7636: pmic@62 {
 		regulators {
 			reg_epdpmic: vcom {
 				regulator-name = "vcom";
+				regulator-always-on;
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
index ff9d50942884..6cf5603c0752 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-remarkable2.dts
@@ -327,6 +327,7 @@ sy7636a: pmic@62 {
 		regulators {
 			reg_epdpmic: vcom {
 				regulator-name = "vcom";
+				regulator-always-on;
 				regulator-boot-on;
 			};
 		};
-- 
2.52.0

