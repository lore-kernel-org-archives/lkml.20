Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F7F4AE8C1;
	Mon, 28 Sep 2026 11:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595652; cv=none; b=OgR/GVAByGh9f62K+4hjhszOdycqjR0e3YCsweKtKm0o37Akx5ciH10//9sP/bIAKTLn7o8FT2/JlYOsgrOxl5Yl3Hk3fyvNc4bNyye/X7Qj2EWF6OQrryzphQIOXeXjVSAcsx0Y8XJPUK9Ll66KXYqRHCw1MUHeKeW4ifBZC44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595652; c=relaxed/simple;
	bh=41C/W5I+zBwP/HhINRYUvLUTN9x900SlAsyUpSp3MJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OLWz23iPMHv66MoVlNAWhUBOFnx5yOKdzIfDw64bbV90qS0ZYCUMVEVWx9PHgoDSECLo0j4zjvgjFa3o1gTNOiTwPiE4ypiBBKWWd2KeLNz2n3gA9OctR7QpZPa4y5n4Us90vKYf5/+ENwKwIcWrYdrvxlxtYfpRuSZq0eYfgUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net; spf=pass smtp.mailfrom=alexanderkoch.net; dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b=lw6ocwZM; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alexanderkoch.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alexanderkoch.net header.i=@alexanderkoch.net header.b="lw6ocwZM"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4htfWd23HmzMlmh;
	Mon, 28 Sep 2026 13:40:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alexanderkoch.net;
	s=MBO0001; t=1790595645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SEK6m5MZoKagAlACy8AlMncwCp90x2a6zeXLHLK/l+8=;
	b=lw6ocwZMH0juNEBXHzna2HgkuDEGX3NmRmo0TYJivDpSGugQLcnbcmSeSTdWB1MfI4+xtZ
	CtMcWunMlYu9IYUFsTz1Fh6ofBP7R9Aw0k7OzTN7xSX7uot9ZijKHlZoyRgAZl07j2ooBR
	4Wfysw9uPp6cJfIqPFHHHqXwkUJyxm4yQnq0U0+aezgSHbAt0h3W32EMD/xl4sTDUfmTHX
	bLgyEIZVh050QWfs2cD41GhfNMqexoWOXRx+k1rjtVJngLkg8rpAHAYKhzvmJodzo7JPFL
	AjZ4JmYdeWXb53b7UVibLwnpg1Wlj8WTOHM45Z5qZomSjLXv7dxZsPWg0vCldA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of mail@alexanderkoch.net designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=mail@alexanderkoch.net
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
Subject: [PATCH 2/2] SoC: dt-bindings: asahi-kasei,ak4619: Add PDN GPIO support
Date: Mon, 28 Sep 2026 13:40:19 +0200
Message-ID: <20260928114019.1441752-3-mail@alexanderkoch.net>
In-Reply-To: <20260928114019.1441752-1-mail@alexanderkoch.net>
References: <20260928114019.1441752-1-mail@alexanderkoch.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4htfWd23HmzMlmh

Add documentation for optional property that enables operation of the
'PDN' pin during initialization:

    codec@10 {
        compatible = "asahi-kasei,ak4619";
        reg = <0x10>;
        pdn-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;  // <--
        #sound-dai-cells = <0>;
    };

Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
---
 .../devicetree/bindings/sound/asahi-kasei,ak4619.yaml     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
index d412531ef9a2..3c7754351e8a 100644
--- a/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
+++ b/Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.yaml
@@ -34,6 +34,12 @@ properties:
     $ref: audio-graph-port.yaml#
     unevaluatedProperties: false
 
+  pdn-gpios:
+    maxItems: 1
+    description:
+      GPIO controlling the AK4619 PDN input pin. Used during driver
+      probing to power up the codec.
+
 required:
   - compatible
   - reg
@@ -49,6 +55,8 @@ examples:
             compatible = "asahi-kasei,ak4619";
             reg = <0x10>;
 
+            pdn-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+
             clocks = <&rcar_sound>;
             clock-names = "mclk";
 
-- 
2.55.0

