Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569897;
	b=3BJOjHVRdODY2QDlkQCoHbcicFJadCLET6Oe54B2sat6/+RMCxYq3kehSJYGXlFp2qFi
	 zw/mDcSFLf0h1s2/JILLPlMokDmZrjsE5YsIYv8zYKPSLKBgY+CZ9Mjb7q9QY7lBmSdTm
	 95hh55BHfG/rNgDmw9qnmmQffpWT6jZP9+4yiXF6dElhtCgqvBzEE4rCGsyFzN4sg3OvK
	 suPzZIaExy018IQ1ID5zEbWNCKojzkCniYD6usrhPDvVgPpvYyUrXLwSZOWwDDOAlRLiw
	 cACF9AfDqrLodnvw/J+9bz2IsmpkQqZwlMo/z2uMmXEuYZRWErIApHq5vAzveub9SFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5fsU8nLmnwYSf7euVQNfNeMa7vCUCe7G54B3850badQ=;
	b=D/IKW2sshDumzYYhXx7QCjRhXmssE0h0NazkOldDqBXiUs0hTGPsBIBv+Ky3VEVhBE+N
	 4lisJVtFFxYM+oAfIHJflVZrFqRF8OCWfAnHZQtWUxatv47d30ASeFBwd6jX60uAsyfza
	 35nC5lxFuJmmi3d2VzuT5bPAbVP2KRo2wIyzGiszlNl7Gpp2UYO0iQA9GLgVsdPCdaiwm
	 cmtfWfWv4TrM9OoIoOMWTV8sUZC2WmxGv8SMBo++sG4oK1zYvNc+HNejKcHkI9aPqUgMX
	 qvhmMZ740qLDK0EENyoUe3MTUUIsdn+7aS5qzD6If+4pl8utLPfNT7dF1FNYczUEUvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Cp2qvcgg;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F674606A88B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F674606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Cp2qvcgg
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49318428d98so295789f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794569896; x=1795174696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fsU8nLmnwYSf7euVQNfNeMa7vCUCe7G54B3850badQ=;
        b=Cp2qvcgg6njaV5KwMMbbBxiFOQ1hpWoWCe8h8O9NO0oBL9pNN9rRMW9UPQ19KYTd/t
         eC+4xLBQgm8aXJWOvhitSCQHDuJIKllJjdj4hZ50/kr90tP/sk85NZ941ITHvUrJmke0
         TdnxlQxGwiJhmSzuGYCaCDNb0FRo6X1bcel+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569896; x=1795174696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5fsU8nLmnwYSf7euVQNfNeMa7vCUCe7G54B3850badQ=;
        b=e+zs5yM/3TVlBISQ0/pc5Og9Yb4etgwBCqiLxvkefRrFrB+766bh7wXhqSWqXUgdYu
         ardrg2xjQ4t1cZnh4HUTyiGyUklzGrCQjeMrdeV70iwfOqK5j3HvgsxmEehkKszHDONA
         QX1K9HOBGwBak2+0T8E72dGjuQsaRRLuY/SgNrImskT1YGm+rZEfrVKrFnIfARXlE8Qm
         0tJ9eJMXk7bX9FbnC/38za1wtX8JuYNUc9yrHLaXaX+YQ3K8KjM8qavdVwXyFwp77Anh
         D8pGrRjIkZgd21V6MeuXtzwcbMANDh1K+Wzp41dbfOXqxNSb7kECai9bsWh4D5hl8X9J
         1sWQ==
X-Forwarded-Encrypted: i=1; AL+hErG4MYQPlQGCV77j21uuVubTxNcc5hU4qvWM/QFZ/GZ9MfdggolyfVm+gNkdh0ToIno3yJ+dXlsuu695kbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+l+0KY9HdLHL1ddFb7eNg+nTlL0AbptShjG4HjyICTuiNyCRZn
	SVz94FnDgby3JqLDLlPr+CxJdrw9o7OfR7Ok6tKGnFxy4sXNVmqLKDi1uccMbrpJEj0=
X-Gm-Gg: AYBFou0GSoWINEe8nWdmreOa02GwaWLc0icOXkl8d5zI+sdIxG5IfY3BDVVVWI9AySh
	90/2GtK+q5HsicxGV9ZfWMaw9m93OsZSQqwDHf+JfPeH5PCAHWmm2cVyQCyFIpZFXeAmidO/6Do
	IE8fw0CGsKpcrxkq01OU4+r0mow1g65ZMGvrdb6FnP9LJnXBo/HfJVNfDiOsB5/ljkrePTsEXDV
	0c+sCbTu0J+5pgKiEW/h8QN0xBho19ZPVdAUIyMmp9POLGKckxW+P7wVOe0meNAtZ2AQavftGhG
	WgYdrLZd4ZinsrsXGrhDwq9QtDQOeVCV8Djm0AWev2Cn4xDRE23SdmPgw8MKj6z44Qd7S2/Lp6p
	Kss3nnZY1PSEvPf6+hwlv4WPAp0+ErpRwy4q+nCkNOBgX5cB3EhdR8j9KJXTUSDvbiUhub28p9G
	Mej3fEYIMVy9xDnIiTJoI3ZBUY//q/+8FaqI9iXgMCcZJarhwTeEQxaFLwMNZSFhNu0JaldS8fx
	cEeAqseJSpAu6ZwFPjSz6HT+I9epcMlePVXHWELkFAAcKMNFnBpl2D3vQ88yly//3JTN5E24+y5
	MqAFnrpxY1mM8T+3sWrUAyrBZ+K8BdnVb22Kw4lXY2RwSGGE4gnnRgYgVxTfqAx7aap18aN+8up
	ywdIvNaVvi1Ojun2qQ7teSA==
X-Received: by 2002:a5d:5f56:0:b0:48d:f36e:fbcb with SMTP id ffacd0b85a97d-49c70ed9069mr5731903f8f.14.1794569895819;
        Fri, 13 Nov 2026 03:38:15 -0800 (PST)
Received: from thinkpat.amarulasolutions.com ([2a07:7e81:b71d:0:3e39:d071:1d81:5914])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm5448492f8f.1.2026.11.13.03.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:38:15 -0800 (PST)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: rockchip: Add Axelera Embedded 111c
Date: Fri, 13 Nov 2026 12:38:07 +0100
Message-ID: <20261113113808.1779860-3-patrick.barsanti@amarulasolutions.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
References: <20261113113808.1779860-1-patrick.barsanti@amarulasolutions.com>
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

The Axelera Embedded 111c is an SBC based on the Rockchip RK3588
SoC.

Specification:
- Rockchip RK3588
- 16GB LPDDR4
- Axelera AI Metis AIPU, 4GB/16GB LPDDR4X
- 64GB eMMC
- uSD slot
- 2x SATA ports
- 2x Gigabit LAN
- 1x M.2 E key
- 1x M.2 B key
- 1x HDMI2.0
- 1x USB-C with DP
- 4x USB3.1

Link: https://axelera.ai/axelera-products/embedded/111c
Signed-off-by: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v3:
- Add Krzysztof's Acked-by

Changes in v2:
- Rename the board and its compatible following the name change from
  metis-sbc to embedded-111c
- Drop Conor's Acked-by since the compatible has changed

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index a24949b163cf..79a45a4bce65 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -120,6 +120,11 @@ properties:
               - asus,rk3566-tinker-board-3s
           - const: rockchip,rk3566
 
+      - description: Axelera Embedded 111c
+        items:
+          - const: axelera,embedded-111c
+          - const: rockchip,rk3588
+
       - description: Beelink A1
         items:
           - const: azw,beelink-a1
-- 
2.53.0

