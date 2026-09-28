Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818E24519A3;
	Mon, 28 Sep 2026 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790588590; cv=none; b=pA8T9612xKj4zw8dpb8KRj+0aZg1Fb/jC9efauf0hutn1DlEvE0jwm+D3IO6xex2CrEgLF9k+ldaNX1QTq/RpPvV21jjG5uBbEfsgKgcLz1z/ph2tqwn/3s0iKsTG7AH1nVtCwDGO5HN7NRl55YnmKdhHVLTitySE9d1n5qWLpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790588590; c=relaxed/simple;
	bh=IQ89eq0DhiyChrSIM/wph876V3ryNwBJXXwlA+H2aCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AYMHPz/WqTm7mLxoWJDIxZKzHTvGvAYFnZOeE4zFdoc4psLUYjYQaFfmRQteJBvy4ZXRrWJ2tXIynQGZTtfgDtdndzBTefbHFRIe/WrZlVTMmzfgW33XZnIx+CctWT4fXfKLA3a4VQMDWct6AZ+MWCA9zcMi1L9OSlTUMQtkxBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=fOsRGqyd; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="fOsRGqyd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ID7B6wbjsNNmOlQbuPS6iyOH0i0CHBvTbHBEcGBY4xo=; b=fOsRGqydo0GOhg1fGXJKGFG7+T
	zl/gxqlyIwfiwPOJ77hcmcIgtd0MQNDA3DwOLHLehbjZHpfO1xk1O7qUoysmlJxSYWdODWXXb+LX8
	/jY7cVUBNMNiR9HLPyDy6BuMciBs5cDX9xCzojc7tLKOK4sVJzViebHly15VasTEtP1Xw/dk9xtNz
	34ZhJbkHjDM3zTAvPRGYD5YyvPR2kbUWza3GTTp5vmDIvu6FVE7HYVdo47033LHHHc4uRpyQP8zy2
	D9fOzoq4Bk40fcUOHzRIVN3DH+UJS3qsDylhteJCu2bQomzXN1KerlLSSJPfPVr/fPeHD4Q7ocbrm
	JUbJdCeA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB7ss-000JjN-0f;
	Mon, 28 Sep 2026 11:42:54 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xB7sr-000A1V-2o;
	Mon, 28 Sep 2026 11:42:53 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Guido =?ISO-8859-1?Q?G=FAnther?= <agx@sigxcpu.org>,
 Robert Chiras <robert.chiras@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Frank.Li@oss.nxp.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com,
 Frank Li <Frank.Li@nxp.com>
Subject:
 Re: [PATCH 1/8] dt-bindings: display: remove #address-cells and #size-cells
 off requires
Date: Mon, 28 Sep 2026 11:42:51 +0200
Message-ID: <5135446.31r3eYUQgx@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260925-cleanup_dtb_warning-v1-1-f999fafbca60@nxp.com>
References:
 <20260925-cleanup_dtb_warning-v1-0-f999fafbca60@nxp.com>
 <20260925-cleanup_dtb_warning-v1-1-f999fafbca60@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28137/Mon Sep 28 08:24:12 2026)

Am Freitag, 25. September 2026, 18:37:50 CEST schrieb Frank.Li@oss.nxp.com:
> From: Frank Li <Frank.Li@nxp.com>
>=20
> The display panel node is not necessary located in dsi node. So remove
> these from requires list.
>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yam=
l b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> index 5952e6448ed47..a0c3ba9275684 100644
> --- a/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/nwl-dsi.yaml
> @@ -137,8 +137,6 @@ properties:
>        - port@1
> =20
>  required:
> -  - '#address-cells'
> -  - '#size-cells'
>    - clock-names
>    - clocks
>    - compatible
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


