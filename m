Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE3F3B961B;
	Thu,  8 Oct 2026 05:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437945; cv=none; b=KLN4RD0J7dwQOSolicdSDcxwgVeRa0vyF3m33mDQ7p0/YmuIroyP+GhEx3uUf1LAYe2aesrnJlypXxIHnAEtopl5JvBC9OAqmhz6YQqcOmhMgAE15iG8HhGhGPdwyGrClQN2iP6mJXA9UFAG7+r47hDAGxWFH6Q7rMBmne2guWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437945; c=relaxed/simple;
	bh=hBN00pPn4TxMbbEWz9iPLbCghehuyZvE66vnQ6zg2Hc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Skt/xcMeOmtSE4I+c0qsE0O/2UXc/pVyxbUsWIFJLYZ0Ohv1L+hKAoXT2kNYYVMxwqyKq6aN0tLPyl4SMzZi9s6WAfzOUvbFK1rlM2nmSFtvxiRg5q6ItvQgm8oaQhp8OXgqoNahFkIPHSa5QytI14cJoVWvubWvF2QnFvlng7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=CXbU2lsI; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="CXbU2lsI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bv1jDj5+4ceXExh4la2r4jHiCrVNiMGuQvVHrbsH5P4=; b=CXbU2lsIDxPYw7eV5m2QYZ/CUD
	5h+tWvx0DANzSN+8mXe6+mNXtic7+Eb9rfLtNAuwof69TwKND82dMZzN+CL14t9pcL7FakHmR7pCN
	WD1mDUFnOkp+E4OfU6P4y8SJMDiAwn6vOUlZR0C/QWsNvxiBPEA7o7laWmiWjqK2YE/eXCELa0c4O
	NoOKqpP3+NKM4RLyTDMLMfZmzLTSVj0SCFPoupwDDJSOEvHEJ2tjhb1M1ieb6ENDOdvTvBWvEqFYb
	v4fTpYKZSWjWCzmM8tc9d+gQIzJEO5ne11KdQP07b8rnZTmGeCZryDOgkzQ7wbyfJhMfcKbMRz569
	ZmPBmlvw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:46684 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xEgqG-0000000AIc8-2qgg;
	Thu, 08 Oct 2026 07:38:54 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
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
	Fabio Estevam <festevam@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH 1/2] dt-bindings: display: panel-simple: Allow "data-mapping" for "auo,g104sn02"
Date: Thu,  8 Oct 2026 07:38:49 +0200
Message-Id: <20261008053850.2941955-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

As per the AUO G104SN02 datasheet, section 6.4.1 "SEL68", this panel's
SEL68 pin selects between 6 bits (SEL68 low/NC) and 8 bits (SEL68 high)
per color over LVDS, i.e. an 18-bit or a 24-bit input format.

Currently, the auo_g104sn02 panel_desc only allows for the 24-bit
configuration by default. Boards wired for the 18-bit configuration need
the override introduced by commit 1cd3ea3e4b12 ("drm/panel-simple: allow
LVDS format override")) to describe that instead.

Thus allow "data-mapping" override for "auo,g104sn02" in the schema.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index eb49832b26c4..11d4a8275ecd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -396,6 +396,7 @@ if:
       compatible:
         contains:
           enum:
+            - auo,g104sn02
             - innolux,g101ice-l01
             - yes-optoelectronics,ytc700tlag-05-201c
 then:
-- 
2.34.1

