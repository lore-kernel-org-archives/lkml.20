Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348368;
	b=haReCNWSaja01LxKXTSZ2q4dqMeCP2w4f9UwKJEsqDabX+JL0rKjabOz0eejNVa9HU83
	 BigoXtAucPbWbaRi98H111Faut9Cyz7wdehXHaWpHrOiXlexGxQRraXR2tTwi9DP1n9UJ
	 yf8WYzeuY+Hv/zj8qI1M2oLLAS2xME1u9U7XKFUeFdD+ugDrRYVFLCAEAg3nF0esCRbM4
	 A4UcIHx7awqo+VWQwerIkctf+tYdIWKrz9tAh52k7DHpF7P3TrCUIn4pN+DQCj+0nrfpb
	 TI0mO/AGWVWWfi8oGQCxJwpu159KwXABWlqIaZfACiHurQKn0scOvGUtffADmaTuqZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348368;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=2SEJFh+LRxwXXlyrTQik91s/Kz05ep2+6P2vUZ4sEQY=;
	b=tzX/EZs7Z+PRo3BXfRare8Ah5Ui7yQHv0CgX1K4USFRn6mEly6KaESaIwjECIu3I+zsf
	 Kv9JhC7NSZxDJzvmYVrusvkW30Da2zLpi+itX7yexKMq3uRaBwQJijZo/MrTkkMFrnWsw
	 Gil/Wv+GrQ0g8JDNqz32C8qCuRpynTT0z909pXlsRozmf1NwcD1qbUJRoL5mkzCrDldA1
	 cQ3KE/lXVTafMWLR/Bim03h6JFiijC7wnXXZ2j/ysSoI948SfDdyIu0S6mkxl02VWXgYE
	 qLZ52qcULb49WtU3dYisEIJ5/wPcxt2ZNTd002aWNBtCk0Scn4BeCvMiOJFuyy7fEUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=iGejnlw9;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53286606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53286606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=iGejnlw9
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92B7D10BE43;
	Fri, 30 Oct 2026 09:19:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793348355; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=2SEJFh+LRxwXXlyrTQik91s/Kz05ep2+6P2vUZ4sEQY=;
	b=iGejnlw9tE4nldq8GEJwD76geEShEcplvgy2j5ywp1hc95+TEFevLKorMIWO7eoy379ABq
	e3iWsHctftr8MYZoS7Vds3fZclDKJ4wEXL5yh8Ij8X4H6l7khMvKJrLHSK+HTV9+XzoSO2
	4stRlzKPeJAx0sx1MFc8tbcc167ywRbXGrQxGeJ11pRRc+MI4aCt0x6rNPI0M+NbFnm4Ic
	MYvEUMbWpWux5r/74m/dksWm/L0XArjH2Tkh2KWLdKKEahH5eD/pQzR4JO+otmu7Tv0eCD
	dPP5bcaT8ENwD2bRWiYLlUOVMxolRroMz5e1mrUqYugATKELCN/2DWSFXikBtQ==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@nabladev.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/mxsfb: Update MAINTAINERS entry
Date: Fri, 30 Oct 2026 09:18:49 +0100
Message-ID: <20261030081908.324212-1-marex@nabladev.com>
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
X-Last-TLS-Session-Version: TLSv1.3

Fill in updated email address and imx@ list, no functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Add the imx@ list
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 75ef3d1aa9d6e..4476471b58445 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19168,9 +19168,10 @@ T:	git git://linuxtv.org/mkrufky/tuners.git
 F:	drivers/media/tuners/mxl5007t.*
 
 MXSFB DRM DRIVER
-M:	Marek Vasut <marex@denx.de>
+M:	Marek Vasut <marex@nabladev.com>
 M:	Stefan Agner <stefan@agner.ch>
 L:	dri-devel@lists.freedesktop.org
+L:	imx@lists.linux.dev
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/fsl,lcdif.yaml
-- 
2.53.0

