Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8FC4BB26F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615913; cv=none; b=BLEABl265Fovc+lhDJx0TzCKEfzvbeq9uhDpZEyEziTsmW9NOclQQPfrXjj/VwCqVvMbPQPJXVG1dZmgu7ihskIBht8f7H8zDiqwfcfg4IlcaBU3dqt+SRlGkFY9xcGd57jBN/xE0BzpgQZsLMqeZqstFf/v94XUOCJ7Xukt1K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615913; c=relaxed/simple;
	bh=Ft5tajPF6rdyfGUW0BWFsN32iOQqo1FkzC57Z7wFY/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SBvdlXJ2MwtZ9IEKUBGK5FuUb7D96jOXrspQ0o1bLPONerGDh+XiqdeN60hyVShnjdzheuEC64ckovz+3omSBhIYAmwcXQ+090YGjW5chtxMQZrcCwVJ8lA+sJruLf5trYRIi4GHjarTfzQmrWlRQP8+ppw7HvKSbgE0JZrMm7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=W0IWjI9K; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="W0IWjI9K"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so1947519f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1790615908; x=1791220708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zIRsrxbOMOkK9iDXr4aj3ra7y2Ob9j8yNJXopYjS6eU=;
        b=W0IWjI9KCqpH4TYcMIjENE0YcJi7WlCQuDXAumr/GDbjLPQnqED1uh415KVdPcv6+f
         2w8e+i+gPxZIa9ri0jmfxMRo+9H9SsbmKkyRFXyDWhnOeHBZayuG2QM0GKNxUdKbenhQ
         wfmBYA5km7K8RP2X91O6FbyQatH5Uwr1spYN4W0sdjTt8H+jGwrwG7PR+U3l0g3GXNIl
         sYo75eheHtZKou4j6K7idzsCRyjMuTCCJ1fdicyT9XYH2r4WAKyQMsKZIo9CV+XT1W+3
         r0/K6f9S/QZZJUkKxXTTHXRNH5K1GSNgmXTNPcyhUi9WSLFw0hC8zu7/OA386TMQtD4I
         dZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790615908; x=1791220708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zIRsrxbOMOkK9iDXr4aj3ra7y2Ob9j8yNJXopYjS6eU=;
        b=hFgFFz8M2Fbr79sU4OZCLgK2DBgECKxFER8g7lDkyXhmBY+Thm1Pze8afSHDNzNEBD
         NlHBg9lHBT3iDyDXFOmUEJfgq/70rpqh62cfS/5SUJ7RoV/UErISj+jufCG6pX2hvfqB
         m6ybXhIgssoFLeYXk1uj+54MFXxMLfycqFq2BW9UkYZWDnYO/jSPjAHiGe4RWaxxQcWE
         R6cNJa3dBcoyPwkTx8AWyQzCmJyrcXgph6LA56uzWlvby3azbKSGaC2u7LVMBbqgj5Dn
         JJB88bg0pcMA4wTc/Ax9yYx1M9G2xz/9nV7XDLtuYeQWKMfmxUPEW+EE19skNT0txGVU
         n8Jw==
X-Forwarded-Encrypted: i=1; AKwUvBxmjYsdDz8olhbBZHgM0Rc6s3Cx8KoorGbOn/Jac71a8Cpe6QiJvycYq0ZJhUDYOabbFte0lXOwz+RCfl4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJ7oFJXotRu3850ozZcqH7Eky4Z5Doh94uSCNapaTEzqcm/cj3
	zQ/aN2dnKeGuGvF0TcAEOBHjs4LjB7xsgwVXnnZEQ7kQfNow8RFcNAdfJ63asELtQQYQijcXow1
	BzFYQ
X-Gm-Gg: AYBFou3ASHSU7OtBDqHNaWfwkkiGKYJ3e3+VNfZDc2mpDjc2hiJwtRJaLiyc9sBhOJK
	Fv4ci/5S0jH2LFRC9/492Pc6kyQHSD6KuTGHYTGxqbiUlHPzcmfXmjLYdyfCuPR1rsYrW5PcEC9
	ALXipC9FKyr/c2N9KOeNZfMi1x04jr7pKwacrOxYzUjIkLReB6gl1AivYizJAefJcbykxHvR/S+
	0EOe9FKJWJmJsUQ4v7RQwOsyUPHRDYUclESarSHVnidKV6grMA0txst9OElUtzlbCqnQzTwyCf1
	NUFgaGeqSscNlyZL2PUdXP4ZnbliMOjzvurflilmvuDsUq06hdDzNq5DWFE18tRe+SZvkV9AP4U
	u5qpd4hNy+KIZrzP9iGhji2UrhMQ8gEMr8fdtmm+3HtIexASDwHrY2HH5x/0fQjbrKvTxAyyXuJ
	sLHZUUnWH8AYlFVZru2mRGYe1x+qVNJjKl3h2YCRBoXIIli7rLseAu23KUbSg+unQatHBR4Cif5
	P1LfYfwyF4fpydA
X-Received: by 2002:a05:6000:26d1:b0:487:8ec:1fc with SMTP id ffacd0b85a97d-4887d9fa635mr17537803f8f.12.1790615907966;
        Mon, 28 Sep 2026 10:18:27 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a84221bsm29224973f8f.36.2026.09.28.10.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:18:27 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 28 Sep 2026 21:18:16 +0400
Subject: [PATCH 1/5] dt-bindings: soc: rockchip: add boot ROM download boot
 mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-rk3576-reboot-mode-v1-1-65486b03bd41@flipper.net>
References: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
In-Reply-To: <20260928-b4-rk3576-reboot-mode-v1-0-65486b03bd41@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=alchark@flipper.net;
 h=from:subject:message-id; bh=Ft5tajPF6rdyfGUW0BWFsN32iOQqo1FkzC57Z7wFY/o=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTtWhinbsfiONvyQIzZot5TwS3higezco2yr3Y+ue/Im
 qdTHiTRMZGFQYyLwVJMkWXutyW2U434Zu3y8PgKM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQvPszIMPeP8YnEGdl7fWbffyh22kmaO+DChdIL7v/lLwuETZ7gJcjIsEP5a52
 61MqViz6WrbnX73rg+jPHWLOd3r+SdU5Y/X5wmR8A
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip boot ROMs enter USB download mode, commonly known as maskrom,
when they find 0xef08a53c in the register they take the boot mode from.
Add the magic under the name U-Boot already uses for it, so that boards
able to request it can do so symbolically.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 include/dt-bindings/soc/rockchip,boot-mode.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/soc/rockchip,boot-mode.h b/include/dt-bindings/soc/rockchip,boot-mode.h
index 4b0914c0989d..88684f4184df 100644
--- a/include/dt-bindings/soc/rockchip,boot-mode.h
+++ b/include/dt-bindings/soc/rockchip,boot-mode.h
@@ -12,5 +12,7 @@
 #define BOOT_RECOVERY		(REBOOT_FLAG + 3)
  /* enter fastboot mode */
 #define BOOT_FASTBOOT		(REBOOT_FLAG + 9)
+/* enter boot ROM usb download (maskrom) mode */
+#define BOOT_BROM_DOWNLOAD	0xEF08A53C
 
 #endif

-- 
2.55.0

