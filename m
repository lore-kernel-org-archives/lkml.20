Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6485F57ED92
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790195003; cv=none; b=GRm63XEdk9TuKG1mbpLOTuorjRQFVovkZ1iGVTsEGY60JxWxpd2/0AWlM/DPON+sIpnowmGdvo8VMfklSUcY90J+XrfVTacRG9VVxf3fwi/e2ZqV4dt+VA/UNrUYkQG5DHfNXm5fuqoQwYlqC0pZO+/o58uUw3hcqUf5/RNQTKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790195003; c=relaxed/simple;
	bh=ctaMtyihF0ajmk4Gl6vHmDSDBA1iaCLst8FkJRBGR68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMhvu2cymh+1qCqN7ZwYUp9sy9obxW9ILpjUAMsUtzVlRAPbZPeyR6rw7Ej+YWmjNoE7dpuN03rr8YOtlpqfcNr8rD9FM3Wk7Yz4hK7WKw4+CeRLkU6hNx9IidGNdD5AtzuXQMzbVQT5ujyxt0MnXMlvAffUDeffCNZ0GKNIlc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGx+A4N2; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGx+A4N2"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so214410366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790194993; x=1790799793; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=cGx+A4N21okzCxLN186ZDBAVhWPXYeL0AGFu9phmjv43wv+u241niWAkvr6hr1pe5m
         eKD9fgdMayw2JiIjZZ9ahcyud9GRdH3N2ChHK/uNyln8sJf69L8NbKOCgEf2kt782doC
         Elu4+lxRicUE5PSaJR1B2Hb4/0Io/AHAhjWR69EOw1gQWKcCTT3GfwoaGJSNpBetEBNJ
         Z0bP8HPyykTfEsdJQsanK/GB4Xa4r2kvn2zkzUL2suFjyBM6j+Ii/o1PVhGxedlz0XDy
         ooG0aEgKvMop7/WZDsPDMC8UsKcb4+tei0J+S2VstIdZh4GA+RE8Vad9xsYzDkJozv7k
         D4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790194994; x=1790799794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBwIwOCuc7HMhoKI+9bOx8aeWrQw+h7eCYLVVq2oCws=;
        b=t6BKaRj798CHB6jYVQo4F2LEMBSFE1t0dpJ1wRVeZciFvh3o8fNcRDNfcLHNE3Hv1R
         wKOHzz8AOr8Wo2Q1uZLg8cwCvUQE6nEOKTuP55GL7zh+xUdsrDM/0B0LrxvvqGoY4Oro
         VpZq0AzmDmW1x9maX+aZbKWCJcuYWX45S8mRjFB8vN6t1G9MpH6cSO1ivY/x5YIclLlc
         PCd2ErQAHVtoRzoy3uDrdk7YNEulwmG3ZgVz7OLyiEpRV7fX83g/vBsTxzMiiPJlqR5O
         V/Z4fNhRPgberBB6njL/hGJKqgeQZSe7c1hNyqj1J+3P3K7DF8OKvdb1wuGvcIQTvmcM
         u6Fg==
X-Forwarded-Encrypted: i=1; AKwUvByRiCf6pzM1yLZ/LYUPHiPGANyA7ZY5zGZNqSDzcQ9QFl+UZxN6GYi+0jxHc447ualKj2I4zltXeN/Y5Xk=@vger.kernel.org
X-Gm-Message-State: AFuF++kCdCbrZpAWhpxNhUZVuGOrQDky/QMc4EZ4BnqtvaY6GVlODx3q
	7UFGzEPBzG1+6cGlWMhw77c2K5c7IrwP1xoq+Bzs8nO5Jwr+KAFKBNm8
X-Gm-Gg: AYBFou3OhxBr4giKcnxFMY9s/xMNz6S7iMKiOnWhULihIgoradlDZ6B7ddRNdEKiTsS
	CQgBRN1CHZo8pog3dGaeSB2DaXFbaKBwbs5lIujE/0oPqRTbl7RrNZhdefYZBELOQkrVe3un0MN
	cF/w+R81mwZho5JKVxIjlvuPhM0okEXIHQPgxRln77JNTIeZCnOEKey3GBgJmKXbnRyQ1Z4VXok
	ZKP4N6t9epxajwsWhkyET/76YoX6M9pTMXO0dqf27YDQAqqaWCSW+D7OGjdLmS+v0B0OKWe+z69
	4KmAKSJcD6f0TSeKXdXn3fTysZdl9/rYEcdNtJ5kSlBfNa9pcpXR46vPIU6wX50dVmoWb7KnlAT
	hKvIrDESGsqaeQQQn1++AG6NP8RrJ7LN26CycdZ5sk7TmRjVEWGZLmQ187lsdcMIENV07oV3Qvs
	xNyS4WGc3GhU7f5DPG1J1Ly4D30BuQJ+5wgl8r7jtj+Wbrkkm+NQL2s9g0w8ueV0wNdIGsqeoTx
	QyaVq+UBYS14CkGsFvPc9EUcL0SA/eEqpzTNkvlUyQ=
X-Received: by 2002:a17:907:7b89:b0:c25:2688:8212 with SMTP id a640c23a62f3a-c2ac1f0c09cmr29718266b.0.1790194993528;
        Wed, 23 Sep 2026 13:23:13 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c8a44sm177243566b.20.2026.09.23.13.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:23:13 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v1 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Wed, 23 Sep 2026 21:17:00 +0100
Message-ID: <20260923201701.43391-10-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923201701.43391-1-pmazzini@gmail.com>
References: <20260923201701.43391-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c630a..f66c681d3788 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -811,6 +811,11 @@ properties:
           - const: pocketbook,614-plus
           - const: allwinner,sun5i-a13
 
+      - description: PocketBook Verse (PB629)
+        items:
+          - const: pocketbook,verse
+          - const: allwinner,sun8i-b288
+
       - description: Point of View Protab2-IPS9
         items:
           - const: pov,protab2-ips9
-- 
2.53.0

