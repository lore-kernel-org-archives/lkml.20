Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295510;
	b=KUXlblfFW8EVZWB8MxMZMZ2YwSMJI/MjyOwCIWj3y3eVT5sly/p7qu5najTBtDEvaYY0
	 CXlc5LhBB3F3/thbblSMau1LS5/mraiM9L7pDGTXMMTr0ZI6quQUidCAD9TqZca3jIafG
	 jXoOCXq0OnqEzOE7M5mWyTTWlnhnng+5lioIgi/TolvAh16MF8Z7IPrdaMY6oNowT1GGf
	 d9Ms9N8nDhuKQaX92YlHx/HwJEtVOxXR/d4NynPnANIi8ScP9kUqWf4LirjQwMKZOOKJ3
	 1kqlvvjOPKfBP4TVDyJDeNZCSpRVyM9IebOGpOlreKjAqcfjt5pQurcK+WIQ0+CE7kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295510;
	h=Received:DKIM-Signature:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=3yi7vVuv+eKxDx87ExEOV1/lyZsRH8+jZ24mpM+JqJ8=;
	b=TlWmIB55tBmDjYR8PQwcZrwI9EMVhMVWETrpOhFznUGFfDFA/duBdrgNU0je6r/Bubyi
	 hIYeBpV9r0RieH6aueZNK1XqtLJd7wjYWNoemBdcgfV5DSvpXKjvGN42zmLGtXO7iWacI
	 LSQNKJt8j62vOOvQPj+uOKp1UhtIoyfVBX6qQVV/F6LccXpWSa6hQpeuKhoLBJDlU1MzO
	 IfNpcxN+nwxgQ3LP2eMfUasbrYQrz90RDkKzMqSdGpYndfeC/2i7lxQL5ONCyAXlKkfhC
	 mUFqBHJc39gb6gLCSccffIEzG9ZWAWLIUy6Q8P+PLWxuAd74ppF/ZnSQPcpHv9PUCjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=REPNfOIq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B11606A31A;
	Thu, 29 Oct 2026 17:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=REPNfOIq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D1C1F01816;
	Thu, 29 Oct 2026 17:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793295509;
	bh=3yi7vVuv+eKxDx87ExEOV1/lyZsRH8+jZ24mpM+JqJ8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=REPNfOIq3/sYRsL8rQJyzwTAAZo5OUyxQPjLaI+R+hfPwuSNLQY1vG0tgQQ4A/gCO
	 ellW8oyVoeTUNvfT9oWU4Ls7NzL71AxafFZEqztIg16oqVOo87aBg4QF3fR9A/dOPY
	 kcG0BBxWwDH8Owa9G9hGWs5BBJK+BUFsenfJSUDyhuglCMc03EsgGnegkFcyk4uJod
	 I/2IiIf7i4sARTh1agGKBNXN9qFSLosip5Pcl97ihq2vObgT/WAMYDQAYDEkMw/q2V
	 J7ujr7G8cu43PRX+Tsu020HQHDhAcaFsQYixOPTUJoKUsdySkIOVVNhQGdE5bdLIwS
	 QeR4REAJQLGdg==
Date: Thu, 29 Oct 2026 12:38:25 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 William Qiu <william.qiu@starfivetech.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, Andy Yan <andyshrk@163.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Dominique Belhachemi <db@domibel.de>, 
 Maud Spierings <maud_spierings@murena.io>, 
 Joshua Peisach <jpeisach@ubuntu.com>, David Airlie <airlied@gmail.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Robert Foss <rfoss@kernel.org>, 
 Sandy Huang <hjc@rock-chips.com>, Paul Walmsley <pjw@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Conor Dooley <conor@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Yakir Yang <kuankuan.y@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Manivannan Sadhasivam <mani@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, dri-devel@lists.freedesktop.org, 
 Xingyu Wu <xingyu.wu@starfivetech.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonas Karlman <jonas@kwiboo.se>, Graham Markall <hello@big-grey.co.uk>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com>
References: <20261029-jh7110-clean-send-v6-0-759594e43acf@samsung.com>
 <CGME20261029075358eucas1p111293c602fc3aac9c6a044fc41488919@eucas1p1.samsung.com>
 <20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com>
Message-Id: <179329528881.3539981.14637229355908751610.robh@kernel.org>
Subject: Re: [PATCH v6 04/18] dt-bindings: soc: starfive: Add
 starfive,jh7110-hdmi-subsystem


On Thu, 29 Oct 2026 08:53:38 +0100, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 HDMI subsystem.
> 
> The JH7110 HDMI IP is a monolithic block containing both the digital
> controller and analog PHY in a single register space. This binding
> defines the parent device, which holds the shared register map, and its
> two children: the PHY and the controller.
> 
> The two have separate resources. The PHY takes the 24 MHz reference
> clock and provides both the pixel clock, which the VOUT clock generator
> routes on to the display controller, and the phy the controller uses.
> The controller takes its clocks from the VOUT clock generator. What
> they share is the register space, which the parent maps.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../starfive/starfive,jh7110-hdmi-subsystem.yaml   | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml: Unresolvable reference: /schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.example.dtb: hdmi@29590000 (starfive,jh7110-hdmi-subsystem): phy: False schema does not allow {'compatible': ['starfive,jh7110-inno-hdmi-phy'], '#clock-cells': 0, 'clocks': [[4294967295]], '#phy-cells': 0, 'phandle': 2}
	from schema $id: http://devicetree.org/schemas/soc/starfive/starfive,jh7110-hdmi-subsystem.yaml
Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-hdmi-subsystem.example.dtb: /example-0/soc/hdmi@29590000/phy: failed to match any schema with compatible: ['starfive,jh7110-inno-hdmi-phy']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261029-jh7110-clean-send-v6-4-759594e43acf@samsung.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

