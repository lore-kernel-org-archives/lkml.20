Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FA959E334
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892903; cv=none; b=R5clpoF2eWFk0nembFLTeThicPoVQ8HWe81z6g3PjJjKJlDSHGQslCZf7pmyQ7WRR7s2yH9d5O5brQqjOjAJ/ceppG2fc5nwflfDTVkQhlsMEAwpH4b+wKR8BunJjr1YQvBH/dDOeJUkzzZPpIBqUrCmB1Bsvdg3zS7hjOdxKEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892903; c=relaxed/simple;
	bh=QFDrZwsfKk9LFPbgnNXK7VjMPHmgc4yfPfxtZvvfD/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rIgho6GuetHNSP8i/qsDovIQmAgZW3wKYuj6FT01Zy3llYM3SK1zqtHJjFW9Mnf5pZKriaxdaFvXkAsTkPy4J3qYHNnZD4S9m0DVVjGUGvzdSbyVfvpUIEC56j1n5daqKCRvhLD7A4Q5kwtKzKmzYsaeT0dHGhdFvjxcZrF90v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwhGoRvB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwhGoRvB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso28543395e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892898; x=1789497698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cr8h1Yq/NnZMM4WE8/4qnlK3saUP4YTKFSQMTgTF9Wk=;
        b=EwhGoRvBxzTRE/ebXMTAz1lCvuWJ4zBwTCfaOTMKtxBuQD9jlhgSDC/Q7dLLsBRpP9
         OmDMplHSJmYELbHQSggv+4saH+ClT+6JpCO5GVDfdFx2ddAVa196yCS3rjO0KgOc5nHR
         qaNHUJEbitSsfa8no/+zG2PdeWgiDvumCdVNoqG2wzjpB8ELER+sXMskxXO8d83mSOsE
         WZVr3L6I9oN6Krwy4z8/R4fWN73XfxnE5R10ey4Vy8A/dpL5BDNHX4rdhO1jgRu/E+Tf
         Syl1T24NXNWEhlSzz+hSZ1KhXgYYr/5MCoztBiEkYXT64COPOVIT2WvSfhz62QNfaQjM
         vQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892898; x=1789497698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cr8h1Yq/NnZMM4WE8/4qnlK3saUP4YTKFSQMTgTF9Wk=;
        b=KXXPg4MLv/VR41+GFUMGq3Ar7xVFulO0osTSZL/EuBC/oO5TKKavjYpUo4iLCIZmQF
         ztsdn70SnLkNGQosjQH98Hl741rpkcZeO1NZzPT/y0QFVuRti33IV87SJMqH5Z0y9yW7
         LJ2NXkrwjyf4e6eLUx9omC6TD9uKw7+nZqkrZkH4G8MNk2QLPu5z7ZsdqbAm0F0WqoSC
         nC4cjkye91rT19pXydH6o/wDjmhyBE6r/VIypp1isoT9Wkfst5cXSh6dA0mRNUyBCXgB
         dDEA6xfe7v2dkzg1zHZueyOvAtNJ4pKBck8tcl4VndZxD/gV5Go0E9/v31y4pb0W8a3s
         JDVA==
X-Forwarded-Encrypted: i=1; AKwUvByhGKJ7jJDZJdiMWMyWIx2UzklbPBuP82JVAZoiQe8bNKqwSD1b3SVXzvpKNxu5WvXhVekchSRnLjYanWE=@vger.kernel.org
X-Gm-Message-State: AFuF++nlCaxizCyMOwHlytdZhr9W0WGuWG+neV83xx9yC0cdU3TnK3rH
	kvUzCX4UzD93fYEA/tuYkHFzkrKE0eFsQDE8aB4Bh6iSUy+smAGX/k1m
X-Gm-Gg: AYBFou3udBCDA3HrRwBi1hChiqXC7MgQG9M98ugbPN+x6faPVRI/a/PMiqSZ36nJS1t
	Z8d0Mz1VubnS0A/PBoSXCaU7Dqu+gMC7hHL6WP2Je87BXFFvAscptFdX1vwedvBor0LBqX7FKkR
	RRCl73D2LNwjl8nUuQrx3bX9T9qD2VQd5LYn1WIE2+/Z6oWivO2gw2MEDqI0QxW0ymH4KjpsJEM
	wkhew+1Jw3XV2Mreqn3EtMY5Hc9HL7n4SOEEJOXryPpIOPs0Q2cH0MFRVoagPgGBAOc5yxAiAs4
	wkVCC8FqtwmSG6u4fDgfrrUL8sc6OhinqM/+jkCuMN6Nboz0bTE/lT1YZA+90nya8K8HBLQEPNX
	C4/JZrG9bOvnW/WIK1PlarkiXIZKPzRlvP3fzlsEwELJ+efDL6L6o8qdzu17nUrZdHcsPUDQHbR
	rnwGU/v2KJjTqJ5ylYrsP/W8NZNKGVEZaeIpcUUhNaneEA8oy2/7pN9u2I
X-Received: by 2002:a05:600c:1da8:b0:49c:cf18:494e with SMTP id 5b1f17b1804b1-49cf825a530mr371178485e9.12.1788892897552;
        Tue, 08 Sep 2026 11:41:37 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c81c3sm38558775f8f.26.2026.09.08.11.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:41:37 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND v2] dt-bindings: mediatek: hdmi-ddc: Correct the compatibles for mt7623-mt8167
Date: Tue,  8 Sep 2026 20:41:05 +0200
Message-ID: <20260908184125.10916-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI DDC driver for both mt7623 and mt8167 is actually the same as
mt8173-hdmi-ddc and the mt7623n.dtsi board include file already uses
mt8173-hdmi-ddc compatible as a fallback, but the documentation lists
them as separate entries. Correct the binding by adding the correct
fallback.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Fixes the following dtbs_check error in mt7623n-rfb-emmc.dts and
mt7623n-bananapi-bpi-r2.dts:

i2c@11013000 (mediatek,mt7623-hdmi-ddc): compatible:
  ['mediatek,mt7623-hdmi-ddc', 'mediatek,mt8173-hdmi-ddc'] is too long

 .../bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
index bd8f7b8ae0ff..966127e1ee63 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
@@ -15,10 +15,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7623-hdmi-ddc
-      - mediatek,mt8167-hdmi-ddc
-      - mediatek,mt8173-hdmi-ddc
+    oneOf:
+      - const: mediatek,mt8173-hdmi-ddc
+      - items:
+          - enum:
+              - mediatek,mt7623-hdmi-ddc
+              - mediatek,mt8167-hdmi-ddc
+          - const: mediatek,mt8173-hdmi-ddc
 
   reg:
     maxItems: 1
-- 
2.43.0

