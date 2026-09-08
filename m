Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E9357EDB3;
	Tue,  8 Sep 2026 15:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883030; cv=none; b=dHFQ1lq1MGrXRPySqngGKMUmunEXKIQGOuldZcTscpUbXNJVDG29HSwvjdkZ5YMVLFbvBu1r0WJk5Xy7V6xRYXpRwtt6EtO4aA4JQy/jaceHUSFVwGqv3BQzYyV55+A8qGKkgRDJAnBbZticawsXFqZBfhK80zRTbNYU9fUXF88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883030; c=relaxed/simple;
	bh=/qCplaRm989TtzwzIBzQPJl8+Gzjt2gzMB/hddzhOEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BGyNcmnd+qM9vTaKvfdd6tF2DJ6nN/8aPdyIAeUyKsKmFRij/dNyQTNJJ+vmRpcruPZQ0/DwXdEy8J7sz3xOxHcNV/617pvQLkn7YhIRTN8QCzl6tJssvR5MnRH9dBLPysRVSuMe9Lgx32RaXJNI21MidIsO7LhN7PPBvMVwq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8U5ENmu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8U5ENmu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D8F1C2BCF5;
	Tue,  8 Sep 2026 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788883030;
	bh=/qCplaRm989TtzwzIBzQPJl8+Gzjt2gzMB/hddzhOEg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g8U5ENmu7affdMhSSUiBVR7ymtb9fGzbt//Y/kHH4KCCPFjKG26/Qtp50M6LKzGbC
	 wrIZwD1nYEDmmPARKnF/Lkmk8H6sCV4eNFXN8vz4S8g00ylfEHA+gYo5RSEF4QE19a
	 47EIl3b8WnoFkuXUEOx8TpNJTFUtbBuD62P1ZRzQPJ8F1X0zrRKKrcpO0VPizDMa/K
	 OG43RqPvtEATgyX337GDR1+oFvbd4ygmbEU5b+toPPg+m6jiOi08t3zeYzSdYu9SNe
	 fNikfQwL3TBTtRw+xePPbZzFmYBI/uQ9lUSAiTkzcW2v0LukoySPaYIJZnDdrZDV5I
	 ExCXtItkhY3jQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16754C79F9E;
	Tue,  8 Sep 2026 15:57:10 +0000 (UTC)
From: =?utf-8?q?Dawid_Wr=C3=B3bel_via_B4_Relay?= <devnull+me.dawidwrobel.com@kernel.org>
Date: Tue, 08 Sep 2026 17:57:00 +0200
Subject: [PATCH v3 2/3] dt-bindings: arm: qcom: add the Xiaomi Mi Pad 5 Pro
 5G
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-sm8250-xiaomi-enuma-v3-2-0198c3bf954a@dawidwrobel.com>
References: <20260908-sm8250-xiaomi-enuma-v3-0-0198c3bf954a@dawidwrobel.com>
In-Reply-To: <20260908-sm8250-xiaomi-enuma-v3-0-0198c3bf954a@dawidwrobel.com>
To: Jianhua Lu <lujianhua000@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 =?utf-8?q?Dawid_Wr=C3=B3bel?= <me@dawidwrobel.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=963; i=me@dawidwrobel.com;
 h=from:subject:message-id;
 bh=VKOKUifl/qc4XSjPi5WUGY6k+HMU1nN0lqDnr/zWX4M=;
 b=owGbwMvMwCV2qrTGfeXVd28ZT6slMWQtMAhp5n1tbRFk9lTv3Z5Z3Vf2Zgc6PTtnb3d4Qo+nv
 VPYuS0xHaUsDGJcDLJiiix6aUF7rIJffn/34nc4zBxWJpAhDFycAjARtjSG/5k+hZc/hdbO3O2Q
 +ex7sqkM27Yf9Vt5t+51UXzBJnIrlJnhN/tjbee5U4yZT/HdcAqzOBp07H8Bl82KZ1XXHoQySlR
 oMwMA
X-Developer-Key: i=me@dawidwrobel.com; a=openpgp;
 fpr=B64A778E0E64049A70C831C8B7B81FA12B282A92
X-Endpoint-Received: by B4 Relay for me@dawidwrobel.com/default with
 auth_id=901
X-Original-From: =?utf-8?q?Dawid_Wr=C3=B3bel?= <me@dawidwrobel.com>
Reply-To: me@dawidwrobel.com

From: Dawid Wróbel <me@dawidwrobel.com>

The Mi Pad 5 Pro 5G (enuma) is the modem-equipped variant of the Mi Pad
5 Pro (elish) and shares its board design, so it falls back to the elish
compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index f8c37096df46..a19d0146ae4b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1110,6 +1110,11 @@ properties:
               - xiaomi,pipa
           - const: qcom,sm8250
 
+      - items:
+          - const: xiaomi,enuma
+          - const: xiaomi,elish
+          - const: qcom,sm8250
+
       - items:
           - enum:
               - microsoft,surface-duo2

-- 
2.55.0


