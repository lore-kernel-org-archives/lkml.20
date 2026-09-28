Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F197B3D4137;
	Mon, 28 Sep 2026 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600293; cv=none; b=SlhcpDcSiimiQCO8TiUVxpFWrbR1pOY3XipgRhaaWqBnUVTCX7E7TwiQsSonKf5PFimKlSNe1d7oSObN/salwYyXHu6Fgh1wITof5bPM5KaxFzKBKI40STBPiJuJL0Pn2Dgs1HhukqY5QKV+nFlzrbjd1QKK6hPe5A3BLx/nZD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600293; c=relaxed/simple;
	bh=QN4345nI4bOO2oCKHwepNOd2lPtGN9qvThsfKU/MM2Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MYhFtLq86MGQT51PQA2lM/ik55U/7l2eMtcM0iS+k14H3t85lAr4Wxrn1W6vVN2Opxz/hBmMkaQEPa0oHHoasyLPx1Df8m9VsoIkpx1TPY5LcS14NKZ/k2K0WxXsUUdyr+/qMoTilzmq00UOnYmkr2MZdGzvHgP5sTdIhczC6cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDh6azo+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDh6azo+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6F11F00893;
	Mon, 28 Sep 2026 12:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600291;
	bh=l4ysHxT+CmqgOlpvQol3jflVjaV955gXwx9YzqNVb1k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=cDh6azo+nsphQDfiUPS6FHdrXrqLoGlUF4tGIGFEWHg0HR5zAAdtDVPFkCnaI6VKG
	 yxN3i0jSiLOqZjZX3T1h8bxLDSX4wXiCrz5eT/Oht5j21mws+aL8WXkt2/Qcua3W+w
	 ORK6D9j4FhbQ7CDbKDki5F5krGPRUaP6nEP69J7ifltaMxGOich/5/nvoHogFt8sXi
	 5PhcagyXpaW3lZ3NJA8/Ip9unp1VA7G1I6QXJx8R7Cp1XYnHDperY9wugfLVcR/qUL
	 KwKu0V6gkjNHzD7TYe+9ilX7nAQSeNFAw1V3t/mMBgFR8yOdJ+0W1HPeOVJLBK79f7
	 H+TtaMHPgkZow==
Date: Mon, 28 Sep 2026 07:58:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Khanh Le <khanh.le.xr@renesas.com>, Conor Dooley <conor+dt@kernel.org>
To: Alexander Koch <mail@alexanderkoch.net>
In-Reply-To: <20260928114019.1441752-3-mail@alexanderkoch.net>
References: <20260928114019.1441752-1-mail@alexanderkoch.net>
 <20260928114019.1441752-3-mail@alexanderkoch.net>
Message-Id: <179060023276.3804017.17695224297068341840.robh@kernel.org>
Subject: Re: [PATCH 2/2] SoC: dt-bindings: asahi-kasei,ak4619: Add PDN GPIO
 support


On Mon, 28 Sep 2026 13:40:19 +0200, Alexander Koch wrote:
> Add documentation for optional property that enables operation of the
> 'PDN' pin during initialization:
> 
>     codec@10 {
>         compatible = "asahi-kasei,ak4619";
>         reg = <0x10>;
>         pdn-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;  // <--
>         #sound-dai-cells = <0>;
>     };
> 
> Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
> ---
>  .../devicetree/bindings/sound/asahi-kasei,ak4619.yaml     | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.example.dts:25.39-55 Unexpected 'GPIO_ACTIVE_HIGH'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/sound/asahi-kasei,ak4619.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/linux-dt-review/Makefile:1714: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260928114019.1441752-3-mail@alexanderkoch.net

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

