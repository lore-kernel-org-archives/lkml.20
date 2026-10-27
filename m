Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102462;
	b=GvdaZ6inEpZJCDSbrhPT6y9PH2KHeHA+oERxVxxr5r/fRNQaFaE4igwEgmvQcWvcQsSd
	 8hgd5ZuQWDRCwaMddWnaF6LGm3WMznTp/n69CfG8fYvKDgy65SsTRQgAQjRxvgpuFEf+0
	 OclUE4zdCJWg8PXSC26vuZ49FFSnpbwbT6nCMq+Z0515KhIfNil4LGj7NLxZn4IfS6kru
	 Yk/60yJ/RyXvJnSUeN3Sp4Wv7IMea10Vd82lnHKeYLXjF1QIj3xpgSJGv2bhXUBrMqap6
	 ebgF97jKHL+lDw+mJascwZjVvJba+CDn9WiLDlEBbwvMbjtEMzoA2RaG54F9VOIfexA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
	b=vFolaAnRD+1igoLUq4PSotSyqOhLYOuiu1Mv3FQK7aXS5vT1BugmIvm0ioJ6P/ldIE9s
	 p0OtjPcfSP4sw1D7GALTSf2vjIueDrZskFz7Gt7oTsnO5yPzSSbzhQRcvj/+H1hzwXjdU
	 X/p0LdjMqkI0n/2c2HBe1JLdKDsvD8KNcpnn/6Zyf3oEgi2S5c3l5ogAEEiqxSASn7MyG
	 yk2ik/iTkgGeyVFXv1ObH5pxodJ/pUgKzcUtOie5cUNMx4nAcx8dity7b6OP6Uo3h+VNR
	 9/CCVRCk9G162ciTA0oJY78fCLKZU/XM7t45Z6oGAv6c6M6cvYtS22IfyEptiRiEbZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xjt5mWv7;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9208606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9208606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xjt5mWv7
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so6677836a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102460; x=1793707260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=Xjt5mWv7K++mwN/WN03NfQkwgE+faDF2HqvMmYn2EVFGiHAcKg7buiJBbJOQfUlSdG
         Wl33eAegRGaOwGLBg6BDwCZ2xspHbB0SYvdGx/FX+gSZNNP4YsRBCHKthMq7rcYzbcVE
         RL7ibq4ad6sGu6uIDpyJRpJjy3vhHZlsOeavUmhf27x7rWR2vaOQnLE1UrsoWw2mGkdK
         QOljAfT2YC3szoE2jOVVlza5EZkOKT1FW1fU1gMjo4EhaE+81YdN6uessiYM4+/vEd/a
         9c29+3ppVjNv1FGY8bYTUiTiMqO8FRY8zQ4T/gHWgc0mZCxxWzABh8dA07/5qPNjklzE
         pshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102460; x=1793707260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aPde2/oRkJ02qgYSUJVLsYCTpPeGg5DpM+LsVMpe2YY=;
        b=rIvFGbBu5vgPx/JDt+LHLd+ywS2s7lBtVqcFRFFYcA8KMzT1J0pCIeNU52lGyME0Gp
         qGq8V1bPzd8vRB88W6keH30sZW88tOD8yiPYrQGl3QgLU6r7YTVHxi515b40g1ejo+M0
         IOhdTsJOXbAmJQK9lANQYVF6EoVaOem49A6OJsa1r0XMqnmfa5ZSbDBjLxt4fsQb3cfu
         G2Fxmd95QJ6IKdYKNMjEoc23j7CQNd43qLKlw4cESiIH2y0/CnWQk0ShD/1yTd9O6Hf9
         ZCdIqm/ckRBUdnbZKBiDBYAY1VsJfmk1lfyNXIJMmmaBuKjsnPGyoQQyRcWXwnzV9mlw
         zapg==
X-Forwarded-Encrypted: i=1; AKwUvBzCggBODxqqVqT1yEdzfKbapiHWj3khAR8Lff67ZOtPyz3GZ4/SDWkXDZxloZ2qDeRdRLB/5KezuRzDZT0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8jVTgNNdQe41WzetlQ4GQQjC0D6tHwodXnXRw2RdXgH8bcJYM
	VW9wZVTo8Neb4y9UQ5NgavQz0VRoxD3fREY3do+FtFT6PRBGyaW9aoWI
X-Gm-Gg: AYBFou2M94fXYulGiGS2S3DCU+A7b6bhdrT/TN6eZCAJTosSo8KxWqhK3ZFqEyC5kPB
	ytEBlN0WsIBGYRkaZlSGzFFwzwNr4L8tz5FHEBhQHEzIdlZymdF908yuA83/sEteAJfK3xbvgE3
	RaY7MxwRW1TJCuR+/t54t0uoe0uaAakB5js6TOwXYPXlIBzn2Uys3Z/BXu95ynXp0pOx2WnMxJ0
	+gtgjVeHE1Mq/MmjnPflIsKDkPWZ0B8Vgc3Ktk6kF/1VX9u0F/RXEZUfTwPQH3rmovbIt74797/
	4y219I1y6rLC+2dDtlGr9ItvqF+zdSOZYn5iTAkenx6ZhE3Ujus1Q8AMFYgabpH/lqH/1ztTiw8
	GIWV/8dV04NUjVFctE+HOYF/gRQsAG1mLOkoS8Lm3lYb8Q6Fj1zMlchhXmkX7VNlTaKalRiujJ4
	TmVjFgrK75coSyRAfxkIk/EjWB6OOFa/qxwbCMN8pAayu1KKzJWeSFdPApokBX+vJoZmkBMCl6Z
	RSNBmyde/+IrJzxandPgneWiAWJrUAk7lc/8Q0rgxFy3JkFwQgLCOHuT6C+PxcRfdbvicknmpV8
	t1fz8eIu5R0tEIw/s2CW5Q==
X-Received: by 2002:a05:6402:4143:b0:6ac:7d0c:2cb8 with SMTP id 4fb4d7f45d1cf-6b443240278mr10161733a12.30.1793102459088;
        Tue, 27 Oct 2026 05:00:59 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b44598480dsm4717844a12.24.2026.10.27.05.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:00:57 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>,
	Leon Romanovsky <leon@kernel.org>,
	Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 4/7] ASoC: dt-bindings: wlf,wm8903: Document #sound-dai-cells property
Date: Tue, 27 Oct 2026 14:00:16 +0200
Message-ID: <20261027120019.93611-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027120019.93611-1-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
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

The Wolfson Microelectronics WM8903 codec provides a single DAI cell.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 Documentation/devicetree/bindings/sound/wlf,wm8903.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
index 089b673847975..bb96e8f790b2d 100644
--- a/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8903.yaml
@@ -29,6 +29,9 @@ description: |
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 properties:
   compatible:
     const: wlf,wm8903
@@ -75,13 +78,16 @@ properties:
   DCVDD-supply:
     description: Digital core supply regulator for the DCVDD pin.
 
+  '#sound-dai-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - gpio-controller
   - '#gpio-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.53.0

