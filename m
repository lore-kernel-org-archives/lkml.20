Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF9D3081A2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 01:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790905885; cv=none; b=NQUH6qTOHsRryEVp0ew0R3k1oLxIUx1zmsGcsDfB9+/BqgRKTTjeOqY1aUovCxOmAOhkEov5w15hqiWXVuHPNFYuzPfuVNz/s5cnq6Bh+I4+9L6yDKnVFELVL1bBSEtCKQsIPgNkdq8L0174MGid/hVYVYKyimY7aAagBFhWsh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790905885; c=relaxed/simple;
	bh=sh6ksLIuszaBIIvF3SvAwH1jUnCcPbxdHIxjtWmLwww=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AdLqS7ByKh//FtFOfNodqn3DP7kvr/Zsvy4UH8vC3LsZMLgLCYOcq0yJIVPHo5S+8SaM6fqYwloFj7tztWwvDmkIePIc9vvCfg+BFOG90eAVdr5vzqDtkUe6ALYCIw20aaBkP0rjgQ+9yWpHrLmFm7r481+ksxFmQ/RuMYruTrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=cYUvOeF4; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="cYUvOeF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790905876; x=1791165076;
	bh=Nrqllks35NsDc9tpEslCuU6ilJ7UtIxYT4bEMyjISKE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=cYUvOeF43g5K6MGy1MrJXnp1ypvw/J+tewRYijqaX+PBf6SE/RLomNaZuJmr6wBrp
	 jezQyH1GTnXhBhpjH+8OJgOHNt5vvd8kTIquM+W11kt/+8SGXaWRLtHQjwoEwCmZ2g
	 04I1DLyCX4EqMjXDnV+3sbXNGrMmdvYTObZFMohmmwqSqg3izK2sLcPZPwm25DVOBJ
	 aq0s7NfHfXv0Gnojde5B3KndMaQkz1sSay2HuoV3QkGe9bgqqRSFKDAnVljN3+fcF8
	 leJHoRtEwysJByGedvyhmKmlyiC+7Wio4uGgyZkA8HJrBR2CkYEe42r/HFvEZaX50h
	 zB3Utu3AJ08tQ==
Date: Fri, 02 Oct 2026 01:51:11 +0000
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 0/2] Add support for the BOE BF068MWM-TD0
Message-ID: <20261001-asteroids-panel-support-v4-0-635ba9e82618@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 1f2be8aefb59dc8e3301ddecfda57f25a992a302
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add the bindings and driver for the BOE BF068MWM-TD0 panel used in the Noth=
ing
Phone (3a).

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v4:
- Rebase onto next-20261001
- Drop mod_devicetable.h, switch to device-id/of.h
- Link to v3: https://lore.kernel.org/r/20260704-asteroids-panel-support-v3=
-0-38dc92570579@pm.me

Changes in v3:
- Rebase onto next-20260701
- Keep 'required:' list in same order as properties (Krzysztof)
- Switch to devm_drm_panel_add, devm_mipi_dsi_attach and drop remove callba=
ck (Neil)
- Link to v2: https://lore.kernel.org/r/20260605-asteroids-panel-support-v2=
-0-44b96c6eca91@pm.me

Changes in v2:
- Rename binding & driver to DDIC instead of panel assembly (Neil)
- Clean up hardware resources in prepare() on errors (Sashiko AI review)
- Link to v1: https://lore.kernel.org/r/20260603-asteroids-panel-support-v1=
-0-109c6ac81c8f@pm.me

---
Alexander Koskovich (2):
      dt-bindings: display: panel: Document Raydium RM69220 DDIC
      drm/panel: Add driver for Raydium RM69220 DDIC

 .../bindings/display/panel/raydium,rm69220.yaml    |  74 ++++
 MAINTAINERS                                        |   6 +
 drivers/gpu/drm/panel/Kconfig                      |  15 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm69220.c      | 417 +++++++++++++++++=
++++
 5 files changed, 513 insertions(+)
---
base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
change-id: 20260603-asteroids-panel-support-d55c929a89a8

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>


