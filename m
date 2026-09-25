Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED1F397920;
	Fri, 25 Sep 2026 07:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320101; cv=none; b=j3hqxluWPXDfME7MqT181Wsf3dwa9056OGhtIaHmXYzWoR55FcEtuJ/J+jDtXa37nZAAVh0dIDVCOln6iNZJzgg4UL0maAcSPAoUKJtf6hWQXA0wFG8DeskkW9lY6EFcqTfQCtzsjPlqlKVXvinnRScrUZEr222E1B08UjJxxnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320101; c=relaxed/simple;
	bh=ZsKpam8KLtPpmS+Ar91k9r3ouuN+Nzl8+6PUy68plf4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IiT/tg3Xs3EJB7RyhvFwtle4El7/edWKxPKT+szravAry0pnYODvzsjx9kq5aVTRkZjLx5vnhMJaeycg/atYHIl9VuyP925WdUfx0wqJ1tgwzuSPuu9ONS1V6fR/X8utyp51Sd69oiZpr3H6t2Ddag0/uaAE1U7gvcd7qvUq4ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjgJtzMU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjgJtzMU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BC7BC2BCB8;
	Fri, 25 Sep 2026 07:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790320101;
	bh=ZsKpam8KLtPpmS+Ar91k9r3ouuN+Nzl8+6PUy68plf4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=EjgJtzMUt0ovu6Z1PBKiPQvjfUg2h2W2fW9gb3QJd8LMo2NAtGwUn8UWrXoxM8/9u
	 73HQumeHBf+H6snU1S6aN+sYyGaawxsReKhbpAGHxRdApX53lfz02DjpmYHbCpFWFz
	 DTEexJnTsmQf8oZ1kyyMG/I3U/8og7LMTP4az3QeYPJhTl/M1kS0HTwMpZj9gzAo86
	 6mRRi2O4lH3zOMPFF89gN37R0KfMRC3mpy1kJ/enKvNlIam3EmsfVFpRIQ64+yf6i4
	 YfQmsCBlapq+DVB84DRSmW5plrrOr6Ugizm2iyZqKhg6xUdQNLuxgCS5uKIxCrUdfS
	 j/fthz9oTNdEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07ED0C98321;
	Fri, 25 Sep 2026 07:08:21 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Subject: [PATCH v2 0/4] drm/panel: Support Retroid Pocket 6 panel
Date: Fri, 25 Sep 2026 02:08:18 -0500
Message-Id: <20260925-rp6-panel-v2-0-19c425e523de@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22QzY6DMAyEXwXlvFnlDxM49T1WPQTjtJHKTxMWt
 ap49waQVj3scSzP+Bu/WKIYKLGmeLFIS0hhHLJQXwXDqxsuxEOXNVNCgdDS8jgBn9xAN25BWiN
 KI0ACy/tTJB8ee9bP+dCR7r85cj6GrHWJOI59H+amMKhK7dC0qm4tAiL4jrz1teqMd9gRKALd1
 uwTJZNtIEpW3D0Hfsdky1JwCSiqFnRHCprlX4sVG/ufw5ZoTQXCg9fNotkGfA1pHuNz/8Uid+L
 DKs1H7UXyfFBKlI4QvfCnS+/C7Tv3Yud1Xd+ovq1vUwEAAA==
X-Change-ID: 20260318-rp6-panel-861840540616
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790320100; l=2722;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=ZsKpam8KLtPpmS+Ar91k9r3ouuN+Nzl8+6PUy68plf4=;
 b=7pb5Lha82dm5y2lRwcuZPI1ZtEVwqZLB79LeQPRJT/DI0OJqFEhBoxqxmYNUxwbvq0J+lLzeb
 w9OW7lHlSgxDWGyR86bdLUQ4TBuciIa0rtfuJuSJViaIm/3pumxEbGT
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

This panel uses a Visionox VTDR6130 DDIC. There is an existing driver
for this ddic, however it is currently hardcoded for a panel used on
several Qualcomm devkits. This series sets up the driver to support
multiple panels, then adds the RP6 panel. It also adds support for
rotation as the RP6 panel is mounted sideways.

This depends on the Retroid Pocket dt series [0] for the vendor prefix
patch. That series depends on the AYN dt series [1] to apply cleanly.
    
[0] https://lore.kernel.org/linux-arm-msm/20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com/
[1] https://lore.kernel.org/linux-arm-msm/20260727-ayn-qcs8550-v9-0-e3db456e10e5@gmail.com/

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v2:
- Drop unused struct member in patch 3
- Undo width/height changes in patch 3
- Link to v1: https://lore.kernel.org/r/20260814-rp6-panel-v1-0-111c1aeccf0f@gmail.com

---
Aaron Kling (4):
      dt-bindings: display: visionox,vtdr6130: Add Retroid Pocket 6 panel
      drm/panel: visionox-vtdr6130: Add panel orientation support
      drm/panel: visionox-vtdr6130: Modularize panel config
      drm/panel: visionox-vtdr6130: Add Retroid Pocket 6 panel

 .../bindings/display/panel/visionox,vtdr6130.yaml  |   8 +-
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    | 221 ++++++++++++++++++---
 2 files changed, 197 insertions(+), 32 deletions(-)
---
base-commit: 4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
change-id: 20260318-rp6-panel-861840540616
prerequisite-change-id: 20260217-ayn-qcs8550-16c07b63de26:v9
prerequisite-patch-id: 17ba304f7a8a08cc78f98e198db9c51f4786a22c
prerequisite-patch-id: 21873631f5dcdb9bbbdb5c20c3f5e9816cc405f9
prerequisite-patch-id: bf7b5dea0097cbbdf04929a4246d1fc65c607ea8
prerequisite-patch-id: d7f546eddc96a4f31a1e681abddbc96bd68abb32
prerequisite-patch-id: d40d784ad8efbb1204c024408be2067725a06cf2
prerequisite-patch-id: 25bbd55199a8250a912ef542b31f43dd5ccdbc90
prerequisite-change-id: 20260808-rp-qcs8550-85c84760f6f3:v3
prerequisite-patch-id: 17ba304f7a8a08cc78f98e198db9c51f4786a22c
prerequisite-patch-id: 21873631f5dcdb9bbbdb5c20c3f5e9816cc405f9
prerequisite-patch-id: bf7b5dea0097cbbdf04929a4246d1fc65c607ea8
prerequisite-patch-id: d7f546eddc96a4f31a1e681abddbc96bd68abb32
prerequisite-patch-id: d40d784ad8efbb1204c024408be2067725a06cf2
prerequisite-patch-id: 25bbd55199a8250a912ef542b31f43dd5ccdbc90
prerequisite-patch-id: c79dacb2a8ca1298387bc9bc4a543de97c670a50
prerequisite-patch-id: 471c39ef6ce532e349e1f787b67ef1286b51f683
prerequisite-patch-id: 08107f621a4feffc1e5d644f714159a2d4b1f794
prerequisite-patch-id: 7e40351a859141256b0aa30afe259be3c03ec487

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


