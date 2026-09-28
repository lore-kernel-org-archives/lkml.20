Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B889A3115B8;
	Mon, 28 Sep 2026 05:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573629; cv=none; b=qZZtCfQA6yIFx1RcdQEg102LgZizQMl357APGQijZtaNMJunl5cVIrop3QP3HSNteo+K8bROe8vZr1PDsF3v/FWq9odN37NdpFLD2fziqS/fW4KTWput1VIDx/FJhQ/Rx/zs/rjwDC0MN+eTkt/2ihXQo2WgBLdcZ1CaVy+f4js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573629; c=relaxed/simple;
	bh=uYcDseqHvGO7pf58koHZZL1WwrZN1tDf1U0Kzn9ndTg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Sh/nYu4WCKMm9wD/hEVM8viHSVj5VoRNLJ9mE4oxkf4kRG39KmIc/3XoRy33lwqVTY3sOmQfuwNZErG1tMjVETr6XdKNbR1zVqd7cJGD3AbLfw2MbqlHb/lO3xxucd8sVx7EKcEtcTt/ml/XXsxAiRBA8DFtSikNZm5EhcZxUJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HO6Z00u1; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HO6Z00u1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43B83C653E6;
	Mon, 28 Sep 2026 05:34:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2A87260504;
	Mon, 28 Sep 2026 05:33:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3E97102F1E29;
	Mon, 28 Sep 2026 07:33:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790573617; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=T990KGr2rKx5jCUSvUS8jX/LmqLCPwnfvjmSkriKfxo=;
	b=HO6Z00u1RVNoE3+bxHzAY3LLITxQ86B/wuzjZUI5xqkdPFrhuYViyBh8lGV0EjqHjegsV3
	TN0u6iV6oowQLlQKkpRjZ0wrQ5OY2H9p5DP2av7N7GcEHSKxzqQaNQ/+Z+GsVyR8r6tmPs
	wztaux9g6NdGtKfV80D8Roi9zEgvUY5kaNtLSQAMe+RUWF1xIscA7WAyJHgJv++jjHEOtC
	Ny4+0qfImeaJXmWy11Z9GIX0ESUy0j90n41guE4Jchi0u+5PEBcXTorucZmmRQ3b5vJCe1
	+sSmYPBYlXUI+7fUx01JwzQnus0NMrPlmB4Oi5zEgx1QVExVsKchfBwxD2Umcg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Liu Ying <victor.liu@nxp.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Simha BN <simhavcs@gmail.com>, 
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, 
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>, 
 Abel Vesa <abelvesa@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260913123331.100293-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: display: Use consistent
 indentation in the example
Message-Id: <179057359762.92994.13773102514654073802.b4-ty@b4>
Date: Mon, 28 Sep 2026 07:33:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Sun, 13 Sep 2026 14:33:32 +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.

Applied, thanks!

[1/2] dt-bindings: display: Use consistent indentation in the example
      commit: 370c5d9004f8b754351981d59fc26851bf943e93

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


