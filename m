Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990459;
	b=cpILO/mh3xlDSanMGr+9LbGW6V5ZtZIQkOByimyVJ/Q2pJPFcoG1PXEK6Irx6RwalTfo
	 9xuYEBlNZUt+3gGpI8ZixEWRnqbxN4zbpXgspOx1iV8k3PK0fynPfolnqEmarA4biusRm
	 p/FWG485L/e2X6oU+Xv59C1B5+0naRw2HOBfupvTlmBWZBRhmtaB8c6QYyrkWDZGvvcrf
	 7Ikq3WGx1bGNwBfsZFWiQTQW6UdKQzM1lA0jwY5Bmf891F23rJq8n8NcAlAux8f0hV2PR
	 xw7PvY9Mq8Xy1uI+ezuzBjrktQtjC0bcxwCVgTvXLEdie8P7Rz6Fbc/jFAU7a/Xie7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZaelhNqiG1jjnWUS7DQjeKgvGs8acmmgXW1oDJtzlqs=;
	b=zNtOYlk8A/dXqVdIP80MDcgSvJ91iibTNyt8s7shVl6slOzCjjk+GwzE2i8nECk6gGYS
	 HEQ29D3dFeh0uKoSF6esAAhTrXGJOyt8hbdRRnhH1rC3bfwNmZNqKF5bm6MJykZMFHNmL
	 6orBCGIsJIDfffKIGIeFnllDIvwLnud64QqYnM19TbGQFStvaSGwTHRhHidWf/2dP7gd5
	 Hnu508mIPmSxoihoAoLccFUvGpq/BNCBn2v6cbyAQB8YWBvW7zAzGHrPoVOdan37d2tj+
	 5E6YsKXrjm612wGv0d5AzrqNBXrlSsBDtbEeCA3qVNaczsPd5R061m1ZkwFF4mo1JRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CIcvlfK0;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84191606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84191606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CIcvlfK0
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso10737795e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990458; x=1794595258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZaelhNqiG1jjnWUS7DQjeKgvGs8acmmgXW1oDJtzlqs=;
        b=CIcvlfK0T97zL65/lt/VU2YSyMBUSNWeRflPH5i85jlUbN8I7vxRaCjPgGLFM71CB/
         J6tmTh2JODT5XeBVjRm5cCHRUZ8Pf3zqA1LzacR3iEmzWW2mb2jJVoos/JXATF7Zcizu
         Kye3RzREd3l4jdOj0McItLU9V4gm2gvLhJUiFrah/7oR6DNFRUrp4bNz9qw4wiKO/53W
         btZ+AP1cKWGkrretllnu4yVFaB5pL8lGf3FaAvT8AZ1gJJW5Awc7n0T6AD5FnW2eMOKk
         iTN2r+YcXF1GPp+TfrB7Y2qS/+c33vaYXUH4ujPS1CXsVJlDiSYAAvaAr3FJeiQ88KnD
         HGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990458; x=1794595258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZaelhNqiG1jjnWUS7DQjeKgvGs8acmmgXW1oDJtzlqs=;
        b=v0HqzdLkyo7CJHCtKkq2hnFl0pPg7yKI8Ch+b2Si9qG97y4nnI8+xY/lQex5tt/n07
         PmKk257oRA4IUmgbQclaY+Kk4Xs1YM2NP36BPdyz8JaigjUcY+p9uOjzGG03xr3Xmn4G
         RDuJ5Uy9oNlADOrtOTjWHN7ByEr9hgBcnBaWai6+Rxb0o0JEGsyDbZuFsAOyp1WtY4W9
         RPt9Kso5B1nX3ZDbQFM2QUnU1UXadrq2qg2GeA86CwGlqMuY7ujLFKUGU4EVcAL4nIOn
         kFrapDfG0X4bOywWkQRx2+eYPf+Jwe+ygmqY8t6julYT4m03V58mzoSaarued6b0punJ
         RUDw==
X-Forwarded-Encrypted: i=1; AKwUvBydp8bgb45WJub4PC5GucPlaXOPLNI4kJn0KRX0ewUwCqyCllVLKZxfA26ega5Dp3ZbA0RK/shUmSlY4qM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S9mIAPYOvGp/Ul/bMMc35KGj5OImmOpkQYkAvMbRJuo/D/eht
	YIp+vaNJhS9nOQl80Sh4FDWeHsVr7LgzFW5NcFKlMnm2VVvCNQRjWQoH
X-Gm-Gg: AYBFou3QNo21Pvfl4cXMM4ABa8Ug6iwcGJB3Xsi5FGQRSw6cXhPopsvBJL00zuiebPn
	K8IhL1EZ7fAFOUWE4x5Wtj8i2gr7McjPQNHSQ0Bf452lXaNNzwvHpWVwf1F2nyjcSLd1B2cVcYj
	aqlvnPJTUjq/dbIJ1gTNGwVj6Sn7rcih5Ob6kGAD/TGBRvSdEOqtDtUjZ5JHHcJl6KaBl06wOEL
	6GVhl4OS7Mmk4UcQNuIzsVCRvtYQzctL1fNmrjIjeKmiCzo5LIHDkYe4VIZ/DeCEibi77Fybglg
	lwUlO4h2q1iNPN3GzE+nphTQGhUCaCGATs7sq2lnG1Hdyj2/X40O3tom6PSF1UPt4H4pU8q7UHT
	72rnu+zQ5csMwiZowIatAFwAbEYQexkaA+1vXDHlK9b0rU40cbNOqtVacly9mXbhlR2BqaAPYSs
	X8eDAzAtsWDZbmo2jcqnM+T+k56D3oRfhaYaQb5IBeGdHozr0AgM9oGWi5+9lpLuItIfT+MKSbz
	dLz5PGQrCiIJSI7DMKc+g5FPSJK8noeRGmzhWgqgzCzDabQHayGSPY+u06GevmPgUaly0IFzhwX
	zi7TDPEZ++t5PWv2hv8wYAiSzEflch0=
X-Received: by 2002:a05:600c:4443:b0:4b6:b2cf:3088 with SMTP id 5b1f17b1804b1-4b6ddcf59abmr64076295e9.14.1793990457805;
        Fri, 06 Nov 2026 10:40:57 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b795012503sm3874945e9.2.2026.11.06.10.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:40:57 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: E Shattow <e@freeshell.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 18:40:55 +0000
Message-ID: <20261106184055.3891621-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The firmware turns the status power LED on, but the node has no
default-state, so the LED switches off when leds-gpio probes and the
board looks powered down.

Default the LED to on.

Tested on a VisionFive 2 v1.3B.

Fixes: 1ec99dfe9eb0 ("riscv: dts: starfive: jh7110-common: add status power led node")
Signed-off-by: Owen O'Hehir <oo.hehir@gmail.com>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 64de468f2..7ec94e968 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -44,6 +44,7 @@ leds {
 
 		led_status_power: led-0 {
 			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
+			default-state = "on";
 		};
 	};
 

base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

