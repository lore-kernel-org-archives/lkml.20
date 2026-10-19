Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC7E4F5E1B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 13:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792416972; cv=none; b=fuv+GaviB33EZ4NdE1vsvoRx0Mrh6FqcDHoCya9CKcHBn6qRfAMjjuW7LU+aSLFylSUcQgTohIxlayF6TwY7wa1mmxKfkWPgTWfwzAGkq2tVksoMWZcIZarsHhcQkEhQXjyexqMvw+WcsBSafLOhKGD8YwQliP6J0ERP+HeaJ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792416972; c=relaxed/simple;
	bh=0YRsJG0zikzQGyPZCwNj3fX9FQhaRP08kplHGzoklOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XRCDrMrceJZncRD/fvHtMQIPwNIXYfL2ZFBOI6Erh4ZatfNEPGhrsITtdMGUIiU0pZOljYGar30ZlOl/C+PY4BdUA516SEsLHtvJ5m0kJ9FxUDMLBJN9Tsn45BVuDlTAu2phhcPTEL/Nkdx/P54rfm0nEXmJ2wwcxxwb9ChhyBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YsGlnA1t; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YsGlnA1t"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so14526945e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792416968; x=1793021768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u7QI1RqFBazH73cHjUm3bJRQ468s8YNQSYzETjY7O2I=;
        b=YsGlnA1tkkMkyfgl+1EjIKdeVt42ERpVq32kDtbsL4AQzF3AKBAGt4plfMadWyUg3w
         QS53/OD/qWkvgb9tJMAY3gJqqygFYV/W3Uidq42AXc/wn6aMEFGkFv7whkNPA3Qc1KFH
         RAngo3ihvgB9c0YLxVa9j3O6KABwzqpCgYVLvoHzSLcu1olVNHyDELClMccU2zO/20Vp
         Eln5hlyaHuDTsyn56R+JHRFnKpYDwPK5ZbIBVFGlu3p1jvF8h8uMTGtWWUO2wy42YAcp
         td49/Dbe4i8u10buM5zcthSmGumEc0B8Sq0mqlNCnLIwxh+Brno5ouw3Ah8aaiV5D6x5
         Po1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792416968; x=1793021768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u7QI1RqFBazH73cHjUm3bJRQ468s8YNQSYzETjY7O2I=;
        b=tSwyUeqOUUUL9r+miJTAlMcZJHrabwUpk4FzDWQTUkBJPuChnS4F1QguRQKNNjpZUV
         qdh1cKwrYhvTrJSKf6E0lWkH7J2Z20JOKdT0O09y17VkVBpgITZP9A1rfX0tZYzpDyWB
         NQgAfjNuE5oi1QzyJulABqDkl8ezaXlhbkl2JgAcCSpjedTvqQBP3ToxU9reZRiEDcSZ
         PHo9ONCQO6XpgLOfIYClrX6xxXHbvefYy1tvJS/HfEsqArW1QvJZGMatLJLoxm/4G0N1
         +AhlXej/CaFmIbSbu+awAQvvEU5rVvPMgmwrtoOJ7Zy+aEs92I9F9Sf+3vKDGTgepRy/
         QPlg==
X-Forwarded-Encrypted: i=1; AKwUvBzLaL32FGNULuwVmWcZpxTCvL7+1Bi+WTVo2nre1aeDuWi0BQeWQovM7jhBNCxv/or9eIqHMfMOcHYy6iQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeu7/uwldz94GnpvkdFqgMp4pchpV2XocNhpcwu2PAhDuIxMXI
	EGGyigqjzw79nui3kXrDPgrVrwPwk+0ylPL8cCtYw7CdcFA7YuInAqpE0A+iQQM7Hh0=
X-Gm-Gg: AYBFou1d8qghWfBmxxBKkhBCXcMPy3iQ2HgVO3Av6CC8ZEaIzqyPJzf+jeK5HG/Vz1q
	fu5nZ8TWqVIADqmeE5pF/FymOFdKki4CiiOlGm609XcbwQAeLdqJfUo/Cp8ebIJbffg0LDB5890
	ljxi1PjqS5ocSmuqLcY7tndr/s+kKIiXIp22Gan4EkPUjRY01ASJ+sy3RLJNZx8euAQdCysLH0T
	pDTAi0gtsesaQ6uUjebHl8LLiFaAwfUkVP2Wi/T8y7iDXs1+pKQp/GUauNSumOJW5/k/pxkKaSn
	jaYxn9bqZA1GAJShwwM/R099O0IAwmQ76z6ISzbedr3waAX6c5/lki5+63DnuMRQ/oJZBzFNWQr
	K9Z/GlRk2QVXWk46+OkSVJW0eCh/x5U9WSNT30MkyFKHP29mcYMYqy1+AjZUU+TYSj27bbaWnf1
	uXBbBKNgFiGrmsl5YOqHGxp4xuUlofdnPAG1z/d0UKC9RfZmST7u9K8N3CzoU7oUaUyZsCUfxK3
	s7nUqTU
X-Received: by 2002:a05:600c:c168:b0:4a1:ed0c:f051 with SMTP id 5b1f17b1804b1-4a1ed0cf21dmr30497355e9.5.1792416967770;
        Mon, 19 Oct 2026 06:36:07 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f8cfesm20387473f8f.37.2026.10.19.06.36.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:36:03 -0700 (PDT)
Message-ID: <0cf7bef8-42fd-475d-b47a-9cb8629644ed@tuxon.dev>
Date: Mon, 19 Oct 2026 16:35:59 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] ASoC: renesas: rz-ssi: Explain component open
 return value handling
To: phucduc.bui@gmail.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>,
 wangdicheng <wangdicheng@kylinos.cn>,
 Chris Bainbridge <chris.bainbridge@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Neo Chang <YLCHANG2@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 u.kleine-koenig@baylibre.com, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Hemanth Selam <hemanth.selam@gmail.com>,
 Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Zain Aboobacker <zainaboobacker33@gmail.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>, Bo Shen <voice.shen@atmel.com>,
 Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-10-phucduc.bui@gmail.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261016040946.521195-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 07:09, phucduc.bui@gmail.com wrote:
> From: bui duc phuc<phucduc.bui@gmail.com>
> 
> Add a comment explaining why .open() must return 0 on success
> to ensure the component is correctly marked as opened and
> prevent future changes from reintroducing the issue.
> 
> Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>

FTR:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
