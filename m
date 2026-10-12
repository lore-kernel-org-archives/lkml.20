Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729FA3DCD96
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799800; cv=none; b=d5rJYp9rsqToHPzL0B/b5TEx+CvSs2r0tb9Cb/9XyjsUC/j7D2WL3N6X/0iIuM7lpoWnhI5ceczEOw204Bm9gen29QSvG76z23xvE63Y4eM4VzPFTgFR2pIROB2o6IGDkE9iRrJ3Myspe9J2VXHRGqtLyoQJjDsFuWA6mAG6yrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799800; c=relaxed/simple;
	bh=nSeIB9SqI3YR3qh8EwI2spWM6L+JrfQJZacP9d3kjTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PzRC3YL9sxBxyK6fAdJ6ZvhZRntLfy0EqCgcJpSywnj7B80spKNox6EYw4nW36cG7hC+6yX6yQz9YIbtBoYHcvwnmSAgYPAix5QTsvtzgd4AwGjxeX2cDHCnFMvWjFTPiAN5DhKNaPCZwzPbAtBSOFWhLQLil/M6LMLGf+lg/Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkRyoNHg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkRyoNHg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a020e65269so10134215e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799785; x=1792404585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=ZkRyoNHgNyyo0IlpmZuLBpR63GTqRGSzrr0RDJTEf2Fjs6PH/8BeRRW1fW1HWjUxZi
         gl3hhLU5wDKKwVQsAaHBNFfUDwFyxl/vSzHSfQPIT/X76Olk3pX1bpX5HVKXf1OB+EvH
         nHXvWemUtxLcGAmQuOhrlped4Wupm5qYgJgos/ZhOjSA5+fkXKxcaDoYwQDPxF7/9b/N
         C0zO2nmM5f2eRbELhUPxKWUG7hqBq+wUsC4CxB4zCqfDjWCTVmK4ylX11JUwH98rl37V
         ++sB9f5JIpfHtIHFA/TFRKSS4kHfZiLL+EnUg2wjNNyhIDqj1c0DL8ypPwvVe74upqeT
         8mAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799785; x=1792404585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J3Qc6M2FWp5fQpmardGXk9w7HUQgqdCLyizNZPwG574=;
        b=YYL/Wn+zK/XvOGzFyt7wS9Cym+sJN6QdD4TkrW3A/bBd24BX2Dnl6YrJxiZMhxYH9u
         rZoamVEVgfEyTgeD6UkijvFBA3IlUy/ScLejeVWZ7WNVGCNfyvIKsPlkzbK0e94mFcZk
         ZJlKcYdISdn6f4+WmblW7okVQSViAZrGgwem2FIS1MjhP0GoLZEfvnqKy+dxB68lJUsW
         eTlYheRbvssVtHhqNGIRzpzFvWuK6bhe/9Jl7MYFMOlmia7+mh8t9+6TL5PeKDBU6R0u
         xyQVQCx66tMzqwFc91G0sxpbB9nDoxfTJHoak4xJo7P4wAGfi6AzX1MSQEgdI1RvXAxS
         JGDA==
X-Forwarded-Encrypted: i=1; AKwUvBwBQkHODXXWBFsaXLpUBcNgucuZ0QGIB0z4WQp/8oCTP5ba9ROA24NrcJh3MN8MYDCPtQki2eWYGpPw+j4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4al1Wtk6lEKqFiYxrRQMLlvnhqv1yqcOtGmIiJqQz32pFxTSN
	oxYfQr0f8Zytwhtcws/KbHxpj+Gghdw/5HS5x40n5wy50rLv6nEY7xvp
X-Gm-Gg: AYBFou0NJG52scOxJquk0xa6g8GyOFCQnO5h8Ep1EF/4SeZZmG9FSzJNzeRqqNFF7Rr
	ErmI1Sc93p7l5oyZJbFoSxtLtUZp/9NEFXfwzLA3d1sgMRBN+7L1w3kdsZ8c18MyNkBoTCiQD8/
	7u4UGl1PQjx6oj/0x5ON/Y4WycWxZXb/hAPRUHPnOgz1ptZaq2goi83Ta/+XGdqfkmlkruWfD82
	QdzbsLpvC0J7Z3S1rknDu9DwQ6ZpeZO7sAi8Ko0eBOJseVnuEhyfYkthctNiGvBNnv+5xO5MO7u
	Pax7IL687UOeH7xdOUgj4GRY9lt/eMVBav6p8+LXcZ4Pj71c9xY/WYkEgpacO1f2+3LyQ5NIHIw
	6dhBqI3Vxvceu1mBpRu7bCzEy+gsIQ4XbhTaDZEj//et8dT5HxphJDFk8av6W5T4WQezuqf7ldG
	sNKJyxPIAuGUmClLBJnWKzr0nHRcuJ6QeqwxaaufpZ6u0wipZh79EwijqtzYJGV4cu+0DAwiB5Z
	t6o/oNdCLmrvbVdYt4yQDgvIblH21/x
X-Received: by 2002:a05:600c:4fc1:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-4a19a9cf1e6mr56555745e9.30.1791799785371;
        Mon, 12 Oct 2026 03:09:45 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:09:44 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 10/11] dt-bindings: arm: sunxi: add PocketBook Verse
Date: Mon, 12 Oct 2026 11:08:15 +0100
Message-ID: <20261012100816.331033-11-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A 6" e-book reader built around the Allwinner B288.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 28437c47ac01..fa34786f0652 100644
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
2.52.0

