Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F244FB9AA;
	Tue,  8 Sep 2026 10:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861771; cv=none; b=F5RPnIK9RJ/tFyKR401kTcVxhs7ZlXiFWLbrroSdZUpGvw8j/v4yE7s4pVZEV8TkLbeyJcyLIOe/cnFbLERejuRAp/4HAG2QfHzhkR8KQUmoT2mQAHNJnSQVpO7DZ6opg+f2iS/mGJNV5jrJTkJegnHW1PtDB/MEwIsokkvTEZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861771; c=relaxed/simple;
	bh=bpd0ubjtkt/ANahasFilHONGwTkZZJDJ5OjTUOewOAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PLczQloSRDGcLOBqLTKWfXjUjtYP039r9R7Bh+PdY46iaOZYEx2LnFbkNiFDOlXJoUT+vRP6nUBMnGvs319+GkG2dW/IEf0YkUg4HbmUbvAfGn/hhVRfqRpbpjEyCzi8BGaVS9Q6ckA3vZluEzduPbNXtnGXCAGlrXym8AWA4Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=k2QjJN2P; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="k2QjJN2P"
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 955FB2037C;
	Tue,  8 Sep 2026 12:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1788861759;
	bh=s44HXDX+ZX1RHp9/nbKIfpiIWQyXK7l4galcUQO1A5g=; h=From:To:Subject;
	b=k2QjJN2PqtVSe4hTRSXLytQvozeeNJY/ZU2WE1WBNR7+sr1vuxLcKYa4vMj3hqOrS
	 rAERFZZ8wX2meMOUpxXCHsEZ9IpnIdAZJ09EuJkliOEZKzWNKrN+QIGzkQrNJ4KPEo
	 G8FJQcLm/AjDd/hPr4e4i5zDC/LapZNLPb3YMlLDaLK3jZY2VlvI+3sgwkKu1kkxAy
	 PhOBEkB+SwOyii4Ijp2tUAbMU9BYTUe45SBefgACypceakRssTv16iRIJZc7XN3S0M
	 B5qvZCj//QaGOTG8dvSNg0GcCkZnwTfTZrTA/ILojTqjkCOWlvGugsMXr8nZGIdafm
	 Xwy7+wWhKikAQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Francesco Dolcini <francesco@dolcini.it>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/3] drm/bridge: Add Thine THC63LVD827 LVDS encoder and 10inch LVDS panel on Colibri iMX7
Date: Tue,  8 Sep 2026 12:02:24 +0200
Message-ID: <20260908100230.83796-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

This series adds support for the Thine THC63LVD827 DPI to LVDS encoder and
afterward uses it to add a DT overlay to enable the Toradex 10inch LVDS panel
on Colibri iMX7 / Iris

Francesco Dolcini (3):
  dt-bindings: display: bridge: Add THine THC63LVD827
  drm/bridge: Add THine THC63LVD827 LVDS encoder
  ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 10"
    LVDS

 .../display/bridge/thine,thc63lvd827.yaml     | 126 ++++++++++++
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   6 +
 ...emmc-iris-panel-cap-touch-10inch-lvds.dtso |  92 +++++++++
 drivers/gpu/drm/bridge/Kconfig                |  11 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/thc63lvd827.c          | 193 ++++++++++++++++++
 7 files changed, 435 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd827.yaml
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-iris-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 drivers/gpu/drm/bridge/thc63lvd827.c

-- 
2.47.3

