Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629698;
	b=Jnlovjsc3MnRCuHnyUQzqJ0JDA+4IfsrMLa7DrywMRirV9UaCA5mn0NsAZqu6RL1y3gj
	 VBVyP+YmC+o/Fho0sZgW3QN9vJctdKOkFpIfjN/u5Cfed2z5d/9SOlp+O9j25OTVFC66X
	 VsqUI3vkC0XRqMGzvh3ELAWMo7wsNu20ROaJ5PoYi3y4d+QU6YOSgRGbiJB7+GGMY+X/J
	 ZkZUC2QCr7nQ6v3R1+nPUwPk8iDlEJCgXpmfjZsmo+oboIOG4l0N16ifuqZ9GR2oj5u6K
	 dYr9xjpkpMQm5oSHxAmvzv3XGuvifBp425yz42kLOoCkE91pzp/BChjioKBWrGDegoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629698;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4Cie1gSyrYbMTqRrUQtHSjOhd7eFIgioVLrH28tB3EY=;
	b=mUVAC7xvPNNX+a9dBCy09duJWzaghb0bIb792YgDFcwLGZPKQNZO08YqAO1r6YHL2UG4
	 42YOEXtxek5cHN609o9gdWlstuIymlFqjigIv2UESFO0CDtCrF24swf0K2hZWvz6nhAAa
	 elcVkCf5M3NG7lpjJANS1/WDYYowb3Iit9XM57A4MMInpT3T1czvPk/VnfHZGUY95KbgR
	 IH8ZNkqtrSdFw4kAfErbdgeIU/uLitfmrhgbzp9F37wqW56d//evwo8xCDElisKI+6OAI
	 oa/yMI90JLUgL7rIrWiElwY3X2GY4rbHFp9ins0j9nlhINnuTPfkDPl+5vdE4mB/MWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6U8zPnz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C381D60A2617;
	Mon,  2 Nov 2026 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C6U8zPnz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4374A1F00A18;
	Mon,  2 Nov 2026 14:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793629697;
	bh=4Cie1gSyrYbMTqRrUQtHSjOhd7eFIgioVLrH28tB3EY=;
	h=From:To:Cc:Subject:Date;
	b=C6U8zPnzG6Kk9C0WRXWL/Lt86oVNlsaKN09RWtD8XeNRWioGGKqy3qwU2Bdzg2H5d
	 kw+BmHVxewm+dTtZA1nJ7zizeUtamf5oxcGrOBineN25XtKAEObYg+fHTayncrRYic
	 zRnLoSyqZfQ06x74xzj2+NOwtHcI09h5Rn2YjDrk5QgH6k6IOnOD6E73ePK7WD/Wu2
	 eBip2dQCqpYBJw5a6PIrHrLCe6en30EOKg0NcG/R61DkYaOtCEmVg0APnYpnYXLUSf
	 urRggLadORKILDtiwYo1mh/LFjTqbf9hY+HW5v6nKk/j1dFsH8B7+1hMA4iC2XRk/O
	 FWWpWaY7MzFeg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: dt-bindings: mediatek: Fix MT8186 child node names
Date: Mon,  2 Nov 2026 08:28:11 -0600
Message-ID: <20261102142812.2743578-1-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
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

Use 'playback-codecs' instead of 'speaker-codecs' in the legacy-property
exclusion for both MT8186 sound card bindings. This appears to be a
copy-n-paste error as 'playback-codecs' is the name defined by these
bindings and consumed by the driver.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/sound/mt8186-mt6366-da7219-max98357.yaml           | 2 +-
 .../devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
index 037f21443ad1..922dfdf55a66 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
@@ -145,7 +145,7 @@ if:
 then:
   properties:
     headset-codec: false
-    speaker-codecs: false
+    playback-codecs: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
index ed93f18ef985..ddc7a0ce69be 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml
@@ -144,7 +144,7 @@ if:
 then:
   properties:
     headset-codec: false
-    speaker-codecs: false
+    playback-codecs: false
 
 examples:
   - |
-- 
2.53.0

