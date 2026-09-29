Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1395A4F0558;
	Tue, 29 Sep 2026 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672948; cv=none; b=eG8rQmIblMwwUQCPX813r/X5ImPLSO9ip1woLnLaKUwRpsxg2QiH+3ZVp3oog2/twbqog6+dBtynEKy9fXDswuf13VATMFVMN9NvuluL6KQPkMZ3Z+sNVYraNKVrPrEUqa/wqUYWa9z8xfbblwleELldP4rCIx45LP99Fb1iBMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672948; c=relaxed/simple;
	bh=8jRi2qSCV5ia4QnCi5ZBs/PlstNi7J/3hHnJFaZVq9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZWjtlPr1ae78ir/ssIsENLTLzNJroz+pl3IaLfdOI+zfl8dX804W2enbC/bDG2zy4M7BlBGjpVC1WaGUqjxERVT0/QRWHkyCOjCn7jKfayATC8JRk7H57qrodXrnTbz3TA+FmFL8jVmFtwdJvMdvYGWMaxeDq76MSMkuWpTxlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net; spf=pass smtp.mailfrom=alexanderkoch.net; dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b=bThWhrDH; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b="bThWhrDH"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hvC5g4G7FzMltx;
	Tue, 29 Sep 2026 11:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexanderkoch.net;
	s=MBO0001; t=1790672919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E6qCjZtx6FxuSj3Qo3YQWdfcdyit89x4CHQFZ9zju4o=;
	b=bThWhrDHxBQAWMZIt7vvPKaKKbCKsQjivtKCNSX0xNKfIxRrTYfbjhkuheoowDiUjg5qou
	fDtIi6syFbOuW+YqTFxBS5B3jsyV6nU+0t1TAkjLTJvEkIUBnezMvCG81TdtrWQg9agWCx
	YlWVdN+wJVGCZ1fMDbI1rLv9FlmdzauK+726nuEyVKy+0iKiTgoFumiJKOgZ907pjGXtqK
	lGg90XGudn6bKYpNzUj2Wm6vuE4fgkigEFEbJBB2Y3LRitK7Ct41Gyn8nSEJDbSQHU1z4Q
	XRj4QfMYiY5/yffY7SSrnAlFf9Mib1V+upe15h7kz3BmCSMYuVudDmM8lS76rw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of mail@alexanderkoch.net designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=mail@alexanderkoch.net
From: Alexander Koch <mail@alexanderkoch.net>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Khanh Le <khanh.le.xr@renesas.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Koch <mail@alexanderkoch.net>
Subject: [PATCH v2 2/2] ASoC: dt-bindings: asahi-kasei,ak4619: Add powerdown GPIO
Date: Tue, 29 Sep 2026 11:08:21 +0200
Message-ID: <20260929090821.1476257-3-mail@alexanderkoch.net>
In-Reply-To: <20260929090821.1476257-1-mail@alexanderkoch.net>
References: <20260929090821.1476257-1-mail@alexanderkoch.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4hvC5g4G7FzMltx

Add documentation for an optional property that enables operation of the
'PDN' (powerdown) pin during initialization:

    codec@10 {
        compatible = "asahi-kasei,ak4619";
        reg = <0x10>;
        powerdown-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;  // <--
        #sound-dai-cells = <0>;
    };

Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
---
 .../devicetree/bindings/sound/asahi-kasei,ak4619.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
index d412531ef9a2..86e0b8cbfc29 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
@@ -34,6 +34,12 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  powerdown-gpios:
+    maxItems: 1
+    description:
+      GPIO connected to the 'PDN' pin, if any. Needs to be set low to
+      power down the codec, hence the GPIO must be GPIO_ACTIVE_LOW.
+
 required:
   - compatible
   - reg
@@ -42,6 +48,8 @@ unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -49,6 +57,8 @@ examples:
             compatible = "asahi-kasei,ak4619";
             reg = <0x10>;
 
+            powerdown-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
+
             clocks = <&rcar_sound>;
             clock-names = "mclk";
 
-- 
2.55.0

