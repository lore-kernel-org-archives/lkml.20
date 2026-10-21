Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579935;
	b=ppYFWf49kuMrAihTWQzkvGf6aCxnDazDFzwZeB/Gs4WVL3ommRa9YKtfN6gx7NEc/vzW
	 7vJRmNyeDUATZXy+Cty5dWZEeH2yCh8Vva4FcaAjNExFPrYeAvqQMTmqKsGlBn7cxcKX7
	 Diq0/TU7BMrR98b2x8jAQro2iATMQeHqc+arPfQaFajzObFyUJ9f31UJ2hUVFA5yfd0O+
	 2D2rwS/XkaoP/dKPdfxap3m2crs1ZfYA5bfRGzatJGz0kfhpVMhqcxSfP8OyuupvxmT0v
	 wbsWqcwPaSTlcWq7vWF5KmR7/QbD19hUc+oQJZb6RubkeuvOInIAZmyFynqOkv39odQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
	b=XJtKuSzi4hC3L845wFCZlH8619DRnK+jGS2N+iN2A+0hSACpVX/mRD/UDUbid3LprG24
	 4HqwDCvqeTIJjKPn4M9qL99bSvA54YoG5C+topZ2CyndlDDE2wMkHbkNop2oCY7NEwH+J
	 pssksZkJicrW6CsGQ0xIhnYRQ3pA++gWp+WXCwQM/+4i+CpK3zysrCE44A6z0JniDgfvp
	 4Cmoavqy97oEk0JeVzMxeEKs+e/Aah1RKNj6wb2bgZcEvlDg9nH/GIgT/9yreRRxn9xNx
	 4kYm0K7qXQk8WJFRgw0xr8Ld+s7jwMpqp93f6beVzLVdRpIjki3QkHQOLVmupgKfi3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=baH1H5HU;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AB7606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15AB7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=baH1H5HU
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so373733f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792579933; x=1793184733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=baH1H5HU89i+T118hkko/06VcnYYiJnn4oobqwgCsllxrJMDL6Wk55SvW0p8z2Ag9j
         uQyg5Z4TStPauoAXQupNfY9XZVOYpzLV8q0NQ4Z51+rsYF2nnKLlDslJp7hJwrUXewam
         v5xg2r3ohdM2d2ua+xFgr4tjsEwmr7L6kw0runobEQ4zJwJKwY3Y/7SolXnI0VbNHkyg
         oz0GlPBkxD0y+iTmKgpJOx/yrTWcD08yYWS7A4dg6HtdE96S00B/APkLTb7uGhrmw6aB
         pzFhNeEo/+gJXuj/vZnGZPLL7iv2I/yzPoFFHnLoGBIQNOQp8EXBVm24d54T0WIsOZtJ
         Sxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579933; x=1793184733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=OD9Tq6E2TAeW39oVw3g/DhDkAvxs/Ifdsm2+Agrn//8DYspp3E8WqVaVyomZ9wsPMn
         LAI3t9FFfMl1t5K08MrL9ZX01Y/l6bOpfcMUv2KrG8RfIm1y0PQnrr3E7Vv08fHN19WI
         E2Drbk0n+oKpa6HUxGhS4zd2nKojtDnXkv7SVeTYyXe/0ZJehSSlLM9wxayKeeQcInLT
         Nlcsnup6YFAy6hN08EnpBIrdh89R4ue5GG3T9dywR0WeuyfJH9GusEXaVZ9qV4TIC1eL
         wleBmZTF7+Te3qJToeh03baUJNTgNMmLB6+ttcSRW2P8A6RFLV8N9ioAY1k505wFRb80
         LBkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbakV6EhZ3f9iU/NqL5yMgWxYeUYI2DDLp3V45H5fzmm1aMbYU6cIhpKjKI3NNRZO7lAWZ3S0VFkJNiL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWfpNpsaZZ8Q5dwDL3HVPf8obg/JbjdfMNvYDwFpPiIi0iDRPG
	dgBlFhfAaXjk+swEMPE6t2B7iGreQhT3j1pGjZoPF4tNoiIVCXJz8Gym
X-Gm-Gg: AYBFou375/C3T6Yjp5xpfnLqvXtiuAVRkXGDVS1nmzGKj9SLA6VskbHTfA4X4H3v2Rt
	unR9XubA94g5zBh66KpYa+4bXo26wNifDG+prXrtsQV71Atd2X8bsT2RkOU73H4bmkQWe2WB3We
	vWZGNGmtcKv/jNhxTIDZmjJ2FcOtr+e1+sz0KD+Qsm9M8qWOezyfWVRWF5wv2H5B7qBj0XmYSNI
	0Ti4nz6t2DR3oFGrN1p2pMiFZRLlI3eTkDGSC/vibJWgna+VeMuFTG34fvOYeqm86muxWNs1c/H
	cZGjbdnYFdBzjBEIUItYHMGq40SL9WpDqaLdUAaJVJOSK5dJ4TBnlZ5Xfei654ot0mU9ICc5RMX
	Q/Q83aDcgFPjNK9gBYeINO0gwCrkqa9r95OZo63ror3KyzfepzSBdPBYYQZj/wAEUGhBL9uiPaU
	vIyDWDH0OTk4NDMdr8Cp57ePu6O/3BrL7O5eUgn3yfyxOlmdQptCIM6KVpt/PspGfHmAW4rfVz3
	kjYcFa0AlYBP7K6Z1121Wf3f6AGjmDurHn/CZa2E0HO3huaCdk3
X-Received: by 2002:a05:600c:8b0a:b0:4a1:7ed5:99e8 with SMTP id 5b1f17b1804b1-4a1fdd23003mr30749575e9.22.1792579933214;
        Wed, 21 Oct 2026 03:52:13 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d6e2dbsm153388305e9.13.2026.10.21.03.52.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:52:12 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v11 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Wed, 21 Oct 2026 12:47:20 +0200
Message-ID: <20261021105109.199886-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021105109.199886-1-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0

