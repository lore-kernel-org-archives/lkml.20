Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9900248E0C5;
	Tue,  6 Oct 2026 18:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311785; cv=none; b=fQQkJKPqb17qvfGsuIgZqb1/TU2oabWfm7n4IaFSONpQE39qIbHJc2Lt55RaUqWVVFfjQ7XvAvRZ3lCTQNa0mBkJFHciQ6ML2GQQEQ8R38kfmNQ5uEWVMEGsIm7u113mO3usG+Vj40dSEUyyAYupn40HPPZtBbbg7gcvM95vObk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311785; c=relaxed/simple;
	bh=MuRi1HzLwo7hQK6tqYkn3WieZCNPoUTe7ezKoycY96o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ChUHtYqJUJBhyQVOJPHsmLhT/0q8rerk7Z9H3l7OVTBUymA53+tX/gqAR2aSwob9HgVT/ArIWQkTqASrJGcEYpU+QwhUVO7JBBpCc3QchCaR957idgWQjXKCKmcxqot6ozNqE6FN3GxXV4zljs9U/CSauw/7P4/MIfdPbI8ntYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=none smtp.mailfrom=mail.savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=NTGSFEmJ; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail.savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="NTGSFEmJ"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 0C2563D81826;
	Tue,  6 Oct 2026 14:36:16 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ZkvDCHzsCSi8; Tue,  6 Oct 2026 14:36:15 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 3E0E33D81833;
	Tue,  6 Oct 2026 14:36:15 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 3E0E33D81833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1791311775; bh=NwilUudvHR64yQJ5WBzZma1gFM83v7HbCJfxnJwVZes=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=NTGSFEmJKz+lELcDJejdRt+hHB1rmN+9xzLPHW3vof8aLCJgmMcFXqBeC4SDbUsOG
	 GtC/P/EtKyuUx4LmMMexI3a3FuuhR6j+RSUMxUMsmr3ZbMdTVdj9gAvXtFRB8j0b/x
	 dNa/pDp54Lkgt4fikmh1ZIcxEhGh3qRtCvmKJa1/huLzAXM6qVOgbFpiS78GtvnfLz
	 mS/feS97d6I7SsQJiXwDNjCgeujN2A/ZAp+EUOjtWRApzTqoUYT0MdPRrEbcXF02pD
	 d8Ef0X7ijX+1iPO6PeZEQp/8mToL7HBgWApi9Y+gq2FCMl4lBa0lrnpNEsUr4I7PG3
	 XvBymVVlnRfKw==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 4vAwc199pX0Y; Tue,  6 Oct 2026 14:36:15 -0400 (EDT)
Received: from localhost (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id DE69E3D8181A;
	Tue,  6 Oct 2026 14:36:14 -0400 (EDT)
From: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
Subject: [PATCH 1/2] dt-bindings: display: panel: add compatible for DCLTek 300249 5.5in panel
Date: Tue,  6 Oct 2026 14:34:54 -0400
Message-Id: <20261006183455.2350966-2-marc-olivier.champagne@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006183455.2350966-1-marc-olivier.champagne@savoirfairelinux.com>
References: <20261006183455.2350966-1-marc-olivier.champagne@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The DCLTek dt300249 is a panel using the Ilitek ILI9881C controller.
Add a new compatible for it.

Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfaire=
linux.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili98=
81c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881=
c.yaml
index 42e35986fbf6..6bcfa67be854 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yam=
l
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yam=
l
@@ -19,6 +19,7 @@ properties:
           - ampire,am8001280g
           - bananapi,lhr050h41
           - bestar,bsd1218-a101kl68
+          - dcltek,dt300249
           - feixin,k101-im2byl02
           - raspberrypi,dsi-5inch
           - raspberrypi,dsi-7inch
--=20
2.34.1

