Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDDA49D5B2
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859737; cv=none; b=WBzF1jY8x22NRkEJ7f6Xkb1GBi3l30Bri/kzhTFYlSkjFiNIWGLvPE7WGBuQW+uyCR+4EvgydiYJvm+xb6zIx3TVx7W3E28wiqFZdl1u2XnMDXydwjXVwzounWt8LlDd9qXku5zhEG5+TKNf3ZiOlGQF4YbJ84auyexbBsYSX+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859737; c=relaxed/simple;
	bh=9rF3ZrItDykjttkz4FfPTCQcsbhicM46S3uAmSs4Vfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNkWUKMU/qj7cp+XhshzaxKsqv//xkdNDilRPqP8olGrPPE2kuBvJ3IoQZOhjgoN0ZyfxerL9cCnjeJ3Xk0alMNerCD7WTWCyyV/5pPlZ+xgaRELD/TUH1IpljDeGsW1Ynm9CvcKwlPGDLqShrtbFtFV9/RM68JfdKR86ywERWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=kzjS0Lu/; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="kzjS0Lu/"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so209378f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859734; x=1791464534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlB//ouJaFs8pbtEqztirI7J+BCIkiQ8y642fBX9rS8=;
        b=kzjS0Lu/3/cMsQSYwWiqfMyodIAvIiCQbyrDx2otILPloKQGoB7/6g+MVKu0DyS9Sy
         W+yaM+oAFtduha4Vz2qc0QKzQQGR1veQqlynoubYqKneJMLMtRSTh20Wy1sFG5CDMm18
         XyufSvHYYRrXIqkrrpNf8vj124mY0Zi6q6C39npQJZEzNJQPkZDPnyjB+cbnIcT6ml9p
         yeHv5B5dUDxFJoUfXKxR9KLk607SomWpYWjNBXl3OQFXFzQSjTMkQlrS7n1NG35fTXxw
         UO3eRxpBgHRTbdkNUojTiRceS+yZ3YgXz7Ux07FTEi4gy9yoD3UjS3Be7Azg6WhwHzL+
         a9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859734; x=1791464534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PlB//ouJaFs8pbtEqztirI7J+BCIkiQ8y642fBX9rS8=;
        b=UaclbwcG0WE988E/tbsgPPYxVlLpOG8GSTn7NnLYTnACWk+ulZGeZkFoLn512vvtJT
         BwiCOyATDIO6POt0pd5goLvcXjqdmV5/tvkkKGmtCf+O05y2Qr0Vidsaeac61ctAZFeG
         jcT+/ENhlVWCyHRJNliS454fSHXjyQFp6WsHKvn6YsHtXfBCuObtQBJTwoPhMtAcBiOw
         ifFNYQx+36dwDDGapD252KBZeiF5tKJgimQDR0htp0CzW+apY9oQ+npvs+DSLVzbU8PM
         dcPTbxEXsmbe7USCI85oB+Gw3KADF8rCzGzZPQTFiBEE5H1qnMslGW3HmbHel1LccKeI
         DkLw==
X-Forwarded-Encrypted: i=1; AKwUvByF42EO+6P90uRb1l1itABp4rJSL7je2ADX0kMn/MQSaZXu0t9R3s+NLgQCn1QRqtyHgywrjkc7AqfSN38=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVjfu9yKfZ0Oyt4K+yt19w2J4nO5yXP1ATiRyuo7ZDRzH6+TOv
	qBZsZOLs3bM0d2dcC04aD8mXlPShmIeb05iGUn3P+JIcgY08MEYtkyKeaenDillXFbU=
X-Gm-Gg: AYBFou3L3mhRvZwidZU7bx+9Ax1Uj3gjR/6G1AFcoymXxn1hzZl7W10PUbGKtmiZTV3
	givqcbUNSY6/Ynupxtl62sZ10pyOxcS3ag4FCMeEkZw0WdFHXon5UW0BMehYerF2TLi5gs3TaQR
	W9OelHCQpKQ8P6QKEYqdlSBiKRMEVca5pl5x/Lt+a2/DTUJS4kjTdZhKe2Ajqs6DKoBacuqiZAw
	0m5boIju9hl8riLI152rJQXV9+ae/8F4HG5qa4gcYiPMyjvXRh4DnMnG7mJV0GnEaldvV48CZx5
	yboe1RDHAwdzqmVZ0nVHwr39CijTi6vW9vjSoc2KPdLx11IRaVlgkKjLtNrNKOTanQTYmSVbK/H
	kRBpFZOcjO2S1IHIIdxKLYzQqFkQnJkP96ngzqVU49T7svgjDFv3tbGaGrvPstFGkMiOI99iayq
	EgVhK36GpzOTm15i+SPl5yPj4leRA/Ew8uS7vsGk02sFV5FmfMvQ==
X-Received: by 2002:a05:6000:3c7:b0:48b:a6:61b0 with SMTP id ffacd0b85a97d-48b0254d145mr7938379f8f.47.1790859734093;
        Thu, 01 Oct 2026 06:02:14 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2cd0fsm5568155f8f.30.2026.10.01.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:13 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 1/3] dt-bindings: net: ethernet-phy: add needs-host-firmware
Date: Thu,  1 Oct 2026 16:02:06 +0300
Message-ID: <20261001130208.105558-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001130208.105558-1-f@lex.la>
References: <20261001130208.105558-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A PHY can be one that the host has to load firmware into before it can
be driven at all. A controller that connects to such a PHY at setup,
before its driver has loaded, gets the generic driver or no PHY at all,
and one that connects only once gets no working PHY on that port for the
rest of the uptime, even though the PHY works seconds later.

The flag declares that. A consumer that sees it keeps the port and
connects the PHY once its driver binds. It describes the PHY, so it
sits on the PHY node and needs no prefix naming one.

firmware-name is not used for this: it names the file to load, and the
EN8811H driver keeps its two blob names in code, so it would only be
read as a presence flag.

The need is not derived from the compatible because the knowledge that
an ID needs host firmware lives in the PHY driver, and that driver is a
module not yet loaded when the MAC connects, so it has to come from the
device tree.

Found on a Keenetic KN-1012, where the EN8811H behind lan4 has its
driver on the root filesystem and the switch sets its ports up before
that is mounted, so lan4 stayed dead for the uptime.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Changes in v5: none, Acked-by added.

 Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index df50c4c33d76..ab95b9a5d95a 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -215,6 +215,12 @@ properties:
       used. The absence of this property indicates the muxers
       should be configured so that the external PHY is used.
 
+  needs-host-firmware:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      This PHY runs firmware that the host must load before it can be
+      driven, and is not usable until then.
+
   resets:
     maxItems: 1
 
-- 
2.53.0

