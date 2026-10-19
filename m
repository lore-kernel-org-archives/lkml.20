Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46B0487CD9;
	Mon, 19 Oct 2026 08:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397196; cv=none; b=SP58rxxIMzTSSLA9Ece5CXBPPUAL8y6f2Hfyw8Txgu4la/4iM8cpFAgqmCkhiooM3NGXvb7UmaR18YT6Gds+xh8cesOSEyLh66RCxBYcqADM5h74KP0OBY0nUNV9KELAK5eO2Ai4y3fzWw6Bh+bB0octR9zfc7s70nYb+gJAAFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397196; c=relaxed/simple;
	bh=zR2q8+XccLb8MJheZa/rwOJRz+Bzeh+2xbcLZikSgzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYONZolwvQlKGKHKurqzPDZwXhG5KHh5u11qHNCf3bYqLeM+svXzfzUjBX8WLhAwYegh60WvbQX12xt6HVVHCRzFwci6reTPLQ6DTvk7QX34B3+g3dAqlI8Y+6QCwDt0qOFEyPDSzqRpPAtxx9JH7ozorhR13GFxDNC7uhnyqNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=EJa6c1A/; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="EJa6c1A/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=lSzfousVUyR0QcxC05/FwldAp2bLkZ7kOB6zUGTvFmE=; b=EJa6c1A/Am/RiNjVExlN4xXIYI
	yWKb4vObp0EUVZLtKrNhqxgSIIjGClPk4szi2kQBmy2Ai127/uh1LJOwPCOuc30ZfdrPRUqzdFRRd
	4NjEREbjNSaWs+vei2Yh7mKyK2QlRVbeP8U1t+MHl4sNr0dl+BTFk0lEsz15W6UZKaBrAZQsQaqoa
	bu+D2sscT5q9z+KeBgT5C600I5Q6LUFz/TBfGiPbtaijztCsb5HL6trcnpGIFHkoHhjY5CpTV822L
	kKV6MCwCBxKoM1CkZ3dHupnA2gIpIqxwlSU7AkUgTR+4PeqM+PTqF2wvox+Bfe5Kw3USyFwj5zHfa
	kkWgUgww==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xIiO1-000DG8-2S;
	Mon, 19 Oct 2026 10:06:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xIiO1-00046E-13;
	Mon, 19 Oct 2026 10:06:25 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	Liu Ying <victor.liu@nxp.com>
Subject: [PATCH v3 1/5] dt-bindings: firmware: fsl,scu: Add imx8qxp-pixel-link nodes
Date: Mon, 19 Oct 2026 10:06:16 +0200
Message-ID: <20261019080621.194103-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261019080621.194103-1-alexander.stein@ew.tq-group.com>
References: <20261019080621.194103-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28158/Mon Oct 19 08:26:01 2026)

System Controller Firmware(SCU) provides access to Display Pixel Link, so
add the display controller links.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Use patternProperties instead of 4 discrete child nodes

 Documentation/devicetree/bindings/firmware/fsl,scu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
index 307f1c6278532..a00295ba965f6 100644
--- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
+++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
@@ -155,6 +155,12 @@ properties:
       Watchdog controller provided by the SCU
     $ref: /schemas/watchdog/fsl,scu-wdt.yaml
 
+patternProperties:
+  "^dc[0-1]-pixel-link[0-1]$":
+    description:
+      Display pixel link in display controller subsystem controlled by the SCU
+    $ref: /schemas/display/bridge/fsl,imx8qxp-pixel-link.yaml
+
 required:
   - compatible
   - mbox-names
-- 
2.55.0

