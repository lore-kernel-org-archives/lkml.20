Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6A5438010
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327507; cv=none; b=towJHrc31tULLMtYgE14uwPcRAMnt0TZjVKfdaZ9R+j2s5nbBmPSKxpCq2+5yNeStCtWpDKJbAbTHF/lTGsgukfj+/JGGacZGoErq1wOKvxR5PfUFgedfGxyw7JCfoVSstebYSz3X3YvI9Ojnr8Rj5gKK0ClzYU4XnoJkk26LIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327507; c=relaxed/simple;
	bh=GJXPUmb1nhYAeZO1jC61HU5DtD36Hl8QiqEPkhTkC2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOPMwUKrRnBtpgz2bSNxVJk/JwUkfMNohR9rhBzCRZPW0EXQ1AvAxAlNJ6Lt3HUfMLDooR5aKhqtdTcnp2Kx4MkO2a+d02QQ679Hg4VhooKLr50YSoi8loPTvb1vsqjO5WGX/Sy7sl9/zxWp1EYy3WhnUua8EVHO6yp3sOS35g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCpjSDEn; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCpjSDEn"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so16027585e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327502; x=1792932302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNCEdVV66HrkSQ0l9ShQ7AsH8sHo4b095xaP/Xe/EaA=;
        b=cCpjSDEnY2FLf1brAYERoTqbIwAW0/Dlef4t08UL0FgjquvEf9ZdWx9prn0Pjwz6UR
         SJsVmQYN9aM7SPslYbJE5dfuHbOjARXdmDb4Pnq7QXc7ijTRlHo3QuQrR7NYLsJAo51v
         hGq903aETabcDmsnxr97btcyzrHSV91patwLIkeGG2sjq7cM9fii6yEaKFsqutKXsS3I
         QSeCfg7qzBb8T9BAl2ZAv7r50Ufsfrve6CO5AXeyJyf8NmZq8qlL56DHs1cjGG0zaw/o
         H94aFzhYn6uySGZG4F+xWtwxMLfYKNYD3RpXXMiPqEGX/uzIhLpdIsZu7EcrVKfl0+Sb
         d6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327502; x=1792932302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNCEdVV66HrkSQ0l9ShQ7AsH8sHo4b095xaP/Xe/EaA=;
        b=lodsFBSlL2cdgZ4CWw71k7rkjNkP4FWIWDm7sxjltq1qJflo/IMmW3OpuhBUH60I2W
         5t3Gxiz1ONgNqC785QUcWlcdVzynR2eJXSlSUB5fRUgpg43TD+rAz3tGOmfnO0NxIsR1
         HxgxeXK8dn661Xd20Ie+3sXYq6rCmc0UzLYpAwSiUPbTMOwbGU7QXX0mRt1Lqw6jaNK6
         hQF955Xt55XsKd+Q4LjU3qH2ScuxIuc7HfOPvGIR/JH+iA5GxEDUX8fdMXv2m73dfshg
         xR1ozREGh2sMc5kgToIhABfTa69WFzLHGde9oqOaApyWtAcjRMLy4CiDxVwkPfJoGmON
         N/ag==
X-Forwarded-Encrypted: i=1; AKwUvBwBqDSwjnkHo/TErYNumcjyRYpZo7hOrkTWm0XZQrMBjGvtioPXClmiUbfvmSI7mBWxcLJmZmqLd1Xh13g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoDGg4srRPZJD3b4HORuNZb2LlyZjofI+UD0Mn0TE1jeehtDI4
	6+LlKWezELyxaYvJANjRmXw5jSvT4LG+akPMNEg351649MFtnwgv/TBdgz4ZcrgJ
X-Gm-Gg: AYBFou3myWkYisNGxpo0pz2Z5RcLqoHmX8EAhxEcVwjSW+HLwl6HhQIbRwuX4k0c7cs
	Wt3VWSgMVa8n4COgxjCZBX3XbDjC8BdpbURilgQlz9yYmas7O/HYbF1mMNC3AtZpj/8Aaw9D8IU
	U+aLSt0+p2WsKQdYBuHNtGTWb+FwfLfQIr1der3H723QlVlfU/sytBDqtAti4um4iZh9/wJdmy9
	cg40NagnWE4UBY5GcpbzYJ2nRpd6jZj2+BwsrEl3VFfvDr3AMDygVCIGKmWa678VqgGoHDCUP24
	507W7mGZeqIsXPvZ/9wIrTb4yye5nLNXt7/Yon4gDcWCTqaZMKXoyhPa6r1ItbcP8j4tt456+3v
	wM3uy+r/BnucfbKSEkuoxBx69EmF0q9xn/nyCIcBRtcWje+C+dwkLJCJYqViGgnWij9lEIsshkE
	UldcYUZWANtN0Szs5HE78ceNO79iSvFRz4ZyOSnkbpQKwquRAakuzLhkHJgB5a1nxm9qZ3/tcyO
	8UK8DCWGYFn25NI0GA2RyzSZ+acc7/GeE7VgTLqOpFxER6ygfaoY84mcXmpwBLp+C9YeeOUkdP0
	d3vCjmtHW2NMfo2z8+3ln1AbEIO0qEDRhDm5QdVV5+QnnJrgi7vbWiUrvZUUBgNF427QGoepw+l
	T9G/5EwiXq2UYbKRh7gKLV7A=
X-Received: by 2002:a05:600c:848d:b0:4a1:e722:a0a7 with SMTP id 5b1f17b1804b1-4a1e722a360mr3167745e9.30.1792327502114;
        Sun, 18 Oct 2026 05:45:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-318a-f58b-5e43-a2b9.ipv6.o2.cz. [2a00:1028:8388:a84e:318a:f58b:5e43:a2b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm16386408f8f.42.2026.10.18.05.45.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 05:45:01 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
Date: Sun, 18 Oct 2026 14:44:58 +0200
Message-ID: <20261018124459.3026-2-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
References: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Hardkernel ODROID-U2 board compatible string.

The ODROID-U2 is an Exynos 4412 Prime (Cortex-A9) based single board
computer featuring 2 GB LPDDR2 RAM, SMSC LAN9730 HSIC Ethernet, and
MAX98090 audio codec.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 273464400477..f863803c84f8 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -86,6 +86,7 @@ properties:
         items:
           - enum:
               - friendlyarm,tiny4412            # FriendlyARM TINY4412
+              - hardkernel,odroid-u2            # Hardkernel Odroid U2
               - hardkernel,odroid-u3            # Hardkernel Odroid U3
               - hardkernel,odroid-x             # Hardkernel Odroid X
               - hardkernel,odroid-x2            # Hardkernel Odroid X2
-- 
2.54.0 (Apple Git-157)

