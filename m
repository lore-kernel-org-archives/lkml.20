Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07700346ACE;
	Tue, 15 Sep 2026 08:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460082; cv=none; b=WohSE2ApgIq8U1sNaKPhpjs5o2cmVC0CbBvNED/eAPKl9AjNKnxXrMA1BYtpdC+JSjW6iCzv3dJFak20iSHBm6e1mWIs9UxUG8i3yJJ/WH2hwWKLg+r1sIfsxjD0vk5PxGOFQlWdCN51AEN0LUEfHMKmH0ASZxKeLS8B/H5/eQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460082; c=relaxed/simple;
	bh=peFcxrEiF5RSqGPX56LYLlt2B39hIHlN8E9Jg0EGoOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FgN+twL1kBbT3xYcZzDOhSFpt2uDVPHbiQKTHP+sQIcsIWwFKeZKznS86q5zv2j/nhB4bByWCWVRQUN5lidBmXGVPOEaioVrCZgPnzO01dC66NyJRgzv0IewdKbGT3+NrBQFn12SAOzAe7Vy5oCGoOAzaMRxJUZY4FKK1kaMJog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pcXNkLpu; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pcXNkLpu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789460079;
	bh=peFcxrEiF5RSqGPX56LYLlt2B39hIHlN8E9Jg0EGoOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pcXNkLpug/JktcHH/E9hIzstybTXMoZ5q/oqPEZ2WtjVj9VaCdDfgWj7RIQurGubj
	 iUcKL69G4IKdUtEuwSXlNkc4xQ8GOniGHFBJO7xQNzMwE6Bti9cdsxKEYd+yNUeB32
	 UP+ovB6twZs8X3OA2iVCGr7f/MPa2InXlBZOfqN2OPixBKFDabh19dHkbHI3srHrnE
	 5RRglVS75Fayvh63aOlMeu5O2hpRDT8U9CbTUYXq7sO5o3Q7Fk58OV4PjKE1OzVX2S
	 lu2zJ3pgng8sJ9A5f+a5AJoBlAg5fAy5kbRNTnyA/2tJr2k/Ut+jzZTgJyKAsfQJH9
	 bXhPwY9p0Gd3w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3209017E0A27;
	Tue, 15 Sep 2026 10:14:35 +0200 (CEST)
Message-ID: <27dc00f9-ac45-4f96-81d4-2ce724b296a1@collabora.com>
Date: Tue, 15 Sep 2026 10:14:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: dt-bindings: Use consistent indentation in the
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Khanh Le <khanh.le.xr@renesas.com>,
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
 patches@opensource.cirrus.com,
 David Rau <David.Rau.opensource@dm.renesas.com>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 Yingkun Meng <mengyingkun@loongson.cn>, Trevor Wu <trevor.wu@mediatek.com>,
 Julien Massot <jmassot@collabora.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Shane Chien <shane.chien@mediatek.com>,
 Daniel Beer <daniel.beer@igorinstitute.com>,
 Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
References: <20260915063317.28971-2-krzysztof.kozlowski@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260915063317.28971-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/26 08:33, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> While changing the lines, correct also node name to be generic in
> cirrus,cs35l45.yaml, cirrus,cs42l42.yaml and dialog,da7219.yaml.
> 
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

