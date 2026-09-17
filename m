Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833B54B3381
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643145; cv=none; b=pGPT/HtAHPZrMN2IOqHmkDEeKAYkwc4ugrPQf1FuEn5ZvnST3yt/CGT7OR3pQrZodiarXGWms9ktkYYVge901im9VR6PMp+gSivZvdJcUmSXwiFgrueIxjvPH2rQAj7915bwhx0pxM5XNYvh5H7G1pESjldMtdD6alXRewQqKq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643145; c=relaxed/simple;
	bh=1b9a3D7Fq+n1x8ta3iQhcSa8at5ZjYaf6/Cw/zzLmLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=or0aClgmtj7pnFWU8yEwRB64okmHx5CxoigsaepoDtKzGD8e5in7ViK2OqZkPNlZkw3MztKZdNesniojj6b5WNzooozMpI+fz9d0HbhFIJ+2EtNH4WxKwMjqAOS/lv4n5a53XbxhIuOynNx4Xqa1uKbXghb06jXLzSxoBpnLA2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=eIHpigt7; arc=none smtp.client-ip=185.136.64.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="eIHpigt7"
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026091711052066ea17430800020776
        for <linux-kernel@vger.kernel.org>;
        Thu, 17 Sep 2026 13:05:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=xiT4lWg2MBR4AgaxlocEUwBYCfrUrkc9jo45m11Mo+0=;
 b=eIHpigt7iquptxJK5sCzKcFiIx6qDjmMscLAVsGbnBjn8xSX7zYYi7jso2jyu+42XzW0Zq
 1rnXQTXhysHm07ppNaACB8k0ns8NoSK0A3fCKgh0zBqUjr/yGmtHri4kXQ1mnrOYZZxzmhoK
 I3e+zjeggHjkojwaSXJ9KXdD9uB4gcFWygMUgNAEHNJ167Ah3MnN6x9oaWWVN2EKImxnzEh8
 Y2NmIeflfBhnqZKmqKwqMtg3rXcvPiPPCq+QU+0dNDvBpwvMKqhlEi3snPmdquO88a+iZSbc
 Z/3uKpIklLkpNrqv9z0oxdMLWHBW8gsdgC9VdS8mN1v5v6Ddw75p0wTA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: simple: Add Truly TFT320240-229-E panel
Date: Thu, 17 Sep 2026 13:05:14 +0200
Message-ID: <20260917110517.1053556-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20260917110517.1053556-1-alexander.sverdlin@siemens.com>
References: <20260917110517.1053556-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Document the compatible string for the Truly Semiconductors Limited
TFT320240-229-E 3.5" QVGA (320 x 240) parallel RGB TFT LCD panel, which
is driven by the panel-simple driver.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3d1cc11ba3aa4..eb49832b26c46 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -338,6 +338,8 @@ properties:
       - tpk,f07a-0102
         # TPK U.S.A. LLC Fusion 10.1" 1024 x 600 (WSVGA) LCD panel with capacitive touch
       - tpk,f10a-0102
+        # Truly Semiconductors Limited 3.5" QVGA (320 x 240) TFT LCD panel
+      - truly,tft320240-229-e
         # United Radiant Technology UMSH-8596MD-xT 7.0" WVGA TFT LCD panel
         # Supported are LVDS versions (-11T, -19T) and parallel ones
         # (-T, -1T, -7T, -20T).
-- 
2.55.0

