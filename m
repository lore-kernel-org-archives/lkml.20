Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885002;
	b=Td0CWAWp2yQ4Gdjy6ka1wuZ8TKLfAfWQWaAGGPCvZPl4qlrzNAlfHOmkfApGCIITXrBZ
	 ZzWBJMsILiN+LvK3hbJMNqxjxYiUbSInLpIdA99iOB5baJH7taEROEAlcihMYh5f0Hosk
	 fznBZ6S5E9dR8uGiuCn1wNnAQ0NNgZ+OcDhZoEGMZq+HjKzrrjWLEKbUJjtE3xeVcxkMn
	 mUFOwmyBXSriMOAXtKw4h0GOg7DraHQt/W2/ObygNc39Bguc4ZkW/4wSw0HpLGfQ+D49k
	 af/7Ao0F1ZdtoHubvlWowrRCnGNx6mV8286Vgt77Y2+fBrv/s7ShJGpyXVFUGZq1zkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885002;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type;
	bh=94WhvBOvLikVnBdkqmMS0BP1DzIOS0lU6UoyFCQ9OjM=;
	b=zUtpI1oAiYmKZ58jIu3PdHk3l1HNSSQT91KPxykBLljow+AEbhukh0NYqskIzI4TRP+X
	 IW2JhFVqT0aRJ9+F3DNgx0N8tmxMnmqprp5cv92OxuoWqPISRLya+ZXkonSmtZ4VSRm1d
	 FKYk/PgiMnpVaKUhhARTaYN7z/J7kw5Dkvz1UPINHPyjgUClBVahfESqlZNeDqeS8SlbP
	 mtqsMepFXjhOQcgtPSQaFOvfnAFPCQzElWIwAdNOJhaCRwgBL2X2aRYiuK4YsPYoVxFpq
	 hHV3QQqkmW/vI4rcW5+TFe4ABf4ky3OrPJL34GS9atAR6nr9N9SMh8SxFkHFIK2OEgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=oxUxuzKw;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D359606A33E;
	Thu,  5 Nov 2026 13:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D359606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=oxUxuzKw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=94WhvBOvLikVnBdkqmMS0BP1DzIOS0lU6UoyFCQ9OjM=; b=oxUxuzKwg9gT4g2DKyoFBl/WI5
	AbuiwNJlmwsdPRj3bXD9gfgwsoZ/KN16pH4zRlWrtXehOIZVACMvZY4vYYNpwOyJXTy/i7QPukr+8
	qlCNmtGYnlptdTzVZ+P6ag2rARROCx4HYiFeLDeDMolD+x+TNVJJZcQ2y2kTPwEhtJWfwmeT+U7x1
	sIfgCZdmvz47620kQNc+znutAi4gJOakEtEurl3RH+kJTyVnIeC9NpAxAt7iEo6DHEqghkVUn+5pn
	tEFLvsojd+1WSFwo8f0emOSYx9Y3khSJbYOIfZYsHejpiuAXM2FvaBEn0WYypGP18xmPsmsxFxDum
	22wo2MHw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Daniel Stone <daniel@fooishbar.org>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Andy Yan <andyshrk@163.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Stone <daniels@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Subject:
 Re: [PATCH v6 00/15] Support 10-bit YUV422 and 8/10-bit YUV420 color format
 on DW HDMI QP
Date: Thu, 05 Nov 2026 14:22:44 +0100
Message-ID: <34506010.aRNtrjHk3s@diego>
In-Reply-To: <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com>
References:
 <20261105-dw-hdmi-qp-yuv-v6-0-1bb63ef5766e@collabora.com>
 <CAPj87rMQdE3eeUxGSb4oQfB4Adry6UV8CvhGoTKtdKGQHdSo4Q@mail.gmail.com>
 <81fbb960-abde-44ea-82ab-3adc054da836@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 5. November 2026, 14:04:25 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Cristian Ciocaltea:
> Hi Daniel,
>=20
> On 11/5/26 2:25 PM, Daniel Stone wrote:
> > Hi Cristi,
> >=20
> > On Thu, 5 Nov 2026 at 01:01, Cristian Ciocaltea
> > <cristian.ciocaltea@collabora.com> wrote:
> >> Changes in v6:
> >> - Added new vop2 patch "Disable core clocks before dropping runtime PM
> >>   reference" (Sashiko)
> >>
> >> Changes in v5:
> >> - Added new patch "drm/rockchip: dw_hdmi_qp: Do not mask error code in
> >>   atomic_check()" to fix a pre-existing issue reported by Sashiko
> >>
> >> Changes in v3:
> >> - Updated patch 3 to skip any hardware programming in the callbacks
> >>   gated by drm_atomic_helper_commit_planes() after powering down VOP2 =
on
> >>   an atomic_enable() error (Sashiko)
> >> - Ensured VBLANK events are sent immediately when atomic_enable() fail=
s,
> >>   hence preventing userspace processes waiting for the page flip
> >>   completion to hang indefinitely (new patch 4, Sashiko)
> >>
> >> Changes in v2:
> >> - Addressed several issues reported by Sashiko
> >>   * Reset AXI before detaching the IOMMU domain, to close a theoretical
> >>     window where stale or in-flight DMA transactions could fault or
> >>     access memory untranslated after the domain is detached (patch 6)
> >>   * Fixed resource leak on vop2_enable() error path (new patch 2)
> >>   * Balance state on atomic_enable error paths (new patch 3)
> >>   * Avoided division by zero when computing max_dclk (new path 4)
> >>   * Fixed VOP2_MAX_DCLK_RATE overflow on 32-bit (new patch 5)
> >=20
> > I think everything in here should now be solidly reviewed.=20
>=20
> Thanks a lot for checking this out!

except patch 9 of 15, or mail hasn't turned up yet :-)

It does look fine to me, but if someone has an eye to spare ...


Heiko


