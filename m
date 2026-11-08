Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794173319;
	b=H3YWFheYBsHxjYYbxO66mhszz+/b+CoaVaOyFapzAimFXRr7c/xrduuK0kESA1u/ylwV
	 YWbM+K5siXI92rU4srrc/G4YPpbhJlED7KcUjwucb9uzJ5LdDCv4dnTCD+Q+4AMszcZEi
	 akWq9xXj87xH+x7d5G0Tw06HYFN2RGH0ZXRlMUeCJ7LElVJZTRlxKX+CiBbJR76ahIhMF
	 5BOLwQCzEeI6G2N9VgQpXo5YOeI2tEh9/glGAIBc1LvhxE1IxweP0RrCqknFPHSmOM7qI
	 W2vpciDyDWrrTICBtjImGGXSa3jJfs81X3Ob58IYATF9ErAysbwwIR8QhNZ3QOEDYTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794173319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
	b=eR6YSOdWG+YJWdV1W61Ntym7Llv6FPGVAdNbgwVZbe2/jAmZmI+cLteVZ3MEIE5n34A+
	 z6ykJDLoHzviQ+94DefWLf/GpmM8/wZfoCrEJPF7ZXg/COm8Vv+0MSky8QIPuwgkbtbkY
	 hIuKJ0u4aUBnCSkCQK5UtJ7exIw3jtKJ69JtMHBd/W1puwiBotg1cmQds9IolWU8lwZjU
	 kGiDEaNafx3g3IcfOtE8hl++uJPvbvGEzq4ub5TUfF23C4iR8sCMEXAzX6SQsXdyXBBeN
	 uxiOkpqdMR4l+3ocjriB+TvYfkT7F5kHVeEPsGjze8eCZaQm8rBGMqU/qDeOHKbPBCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2AcM23z;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4707B606A32A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4707B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v2AcM23z
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso237680f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794173317; x=1794778117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
        b=v2AcM23z1BVOLFwTZKhszyXsOaKS2NgJhzLGOR/HKF+uWV+fg3Yigp9Q0rJrrRXRPF
         n600tkwCP2SlPXnvgldYU29T5mltCD7rwnIGDiSbyGMRfa6aH+R+VyTipdEhm8myFcYG
         GxFAOepF9tjJloagYmtXkLWrxssLrOcams4WZgVtYf0ScpMjAhL23j4cHPfAt27mRsWN
         AtwZv1QFbZ/eJdLPH+a3kH3ueIrXwdd5dlimK3KA8/msL/0dxBMEI2k3wqHacp3LSRQw
         BsnTiMABx/OVq/k9klM/27DhUTQ+6vQc/AtBeJeTpDqi48/u0X24BjADKHn+GKMZDxyV
         L1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794173318; x=1794778118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2Uvgg/TH8ek7dpiyCaiigwe788vwtcSZF4TPOxN5MA=;
        b=EbZxgav5lGCz8JOC0MIQKEIQF/gAIXg0pSxsqFun7Hf/Uh3/2C2CPlgpndlxyaHL0N
         4oiFL4c4lfk9Ld9unbYZry9cy6ylI1EqUiD3s2CD8haQ345w1GWkmlsIVMjMy7DtWJxe
         lEwfemKzAnyE8ha83eyiv+n333RX7/YBmAf5pYtnYtRo3jBhtoGs/9KyJz5EkgN+0KPa
         lpwKZ7CSxPfhZmilMrQLyfRQjdcmMWGhMf9BvZx+vvkZNVEr9yZMe1cM7C1CCxzyFbTC
         qpqkWDz1U+iyhrZJge4hlDxiRX88jRBiiWvgiKuzdi06Di77uOIzLtZMgGeCq5gn5rFo
         mGbQ==
X-Forwarded-Encrypted: i=1; AL+hErG/E6HLcLoBCB0aPJBf1oyuNapw90ed6A+xtMNjgFiKRn53oOzKOorm9WTFT3yOv+nofLUHbDyFED99Ruc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TOW+0b9O0QC0zx5U9GGc40AV+DL+cSvhiEa5y+vXwEU8SVboM
	up0tquOp6AVmH9oreavYHP0qEBGkf2PevpDL+31Fez5HwTWb7ErlABYo
X-Gm-Gg: AYBFou3u78KgswuLy+EtC7XTR4kpzYA8T6FLnnXfF7vrw/Ds7uNjDFVICtNZnGJmMCU
	qRio9J7WFP5Mao/6XbTDaBdKQ+CZUCprY02A+KG2XgVlJr26ej2ljONh/D5qBJMDhioEMIsqR29
	d0WcwGjdW0hf8g0CGRiN4ZA+xlZoNRrQuMkWMIFZkaPphHkPGUeqdAGOFa89/lIH1eib4fDVfzO
	KzvVknBxhbrE31meCyA357ALwZcZ1eKWq/VJfq49dFqdfn4u1LBxrECtUw/A7IP1yfBQwFSicRg
	RnKF69vf1m+vbnTz7BZ1/K4bTrfjM+yRbvKwQb8h3eEfwILmnP90ZmsfSj1tfo/cZblDpxobozK
	CbcPL1Vo45nEKYgckfZ8TUWgfOeCiIdVx82bNqAbWzsy0ADhu9k/3CNWDFUs3PGDxEI4jQrgM2q
	Ae4qruyt0Y9gk0I9nArbfxYwYL1roWQF2uMQ6nKhJ35Ah67WpCTd3yA3VwGce/aznPrh4RjYW4R
	76MLdKw1nZ+p/iPVsAPXhaktnbmLnjNMuG7yIzUTB3kefoWJauRk3rpr3GZba82BlwG1WAjZzRa
	wVFfFlQR1hJEByRYtPq+wXkEYNcFWyq5RQ==
X-Received: by 2002:a5d:5f50:0:b0:48e:5df9:1ec9 with SMTP id ffacd0b85a97d-4958b34c671mr4024764f8f.24.1794173317559;
        Sun, 08 Nov 2026 13:28:37 -0800 (PST)
Received: from hp-z640.fritz.box ([109.76.148.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597091400sm5692050f8f.32.2026.11.08.13.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:28:37 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	"ziv.xu" <ziv.xu@starfivetech.com>,
	Conor Dooley <conor@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v2 3/4] MAINTAINERS: Add entry for the StarFive JH7110 RTC driver
Date: Sun,  8 Nov 2026 21:28:25 +0000
Message-ID: <20261108212826.15890-4-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108212826.15890-1-oo.hehir@gmail.com>
References: <20261108212826.15890-1-oo.hehir@gmail.com>
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

Add myself as maintainer of the StarFive JH7110 RTC driver and its
binding.

Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aa647f5d3..2ee86a46c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26877,6 +26877,13 @@ S:	Supported
 F:	Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
 F:	sound/soc/starfive/jh7110_pwmdac.c
 
+STARFIVE JH7110 RTC DRIVER
+M:	Owen O'Hehir <oo.hehir@gmail.com>
+L:	linux-rtc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/starfive,jh7110-rtc.yaml
+F:	drivers/rtc/rtc-jh7110.c
+
 STARFIVE JH7110 SYSCON
 M:	William Qiu <william.qiu@starfivetech.com>
 M:	Xingyu Wu <xingyu.wu@starfivetech.com>
-- 
2.43.0

