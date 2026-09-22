Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B637D559C92;
	Tue, 22 Sep 2026 15:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091314; cv=none; b=daBHjDkUi7msAjFEYYkNXc7RR4OvbLjyqGqGiNzQezTmXelUjRiUZJV2xg6o1lgQGsjTDhtNih7zEFfhVvhW61Nx8JlYHp9fdikbwKaWEMQFEjVKWN2T7O2ziDdUR6AZw1R2IrBTkxplVacNyvne/zziA3ZXoGydPkuJo3WCCEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091314; c=relaxed/simple;
	bh=8c9mOEfPLVh+05JwkGqkDFhZ4eGD9h3DRTAtQNs4Izk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lZTJ8EDCJAgnzIquWSdeLK58bHYsoy6vw3ql1x/mUaMFMeNzx3haxUVFLzq7R+CYKLikSBI1+ekC58e092meZgsfsBVMHHTXfUiAmm8mv8vA0nWd+Bps+iDguvS9LhaK5H1gLhTRBcOCxSuiTLykzu/yMqEtakWUQAMSm9UfPpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAEuAuUn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FAEuAuUn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D1C1F00893;
	Tue, 22 Sep 2026 15:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091313;
	bh=l0v14wN/DvIVEXrfeeixUuljRDiJFlaL5YhfUPp5MGg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=FAEuAuUn7kgoyZZ5n2Ox49MDzAdPBYxMURL/+BCnLWgBGp3kM2N5Ov5hzVAm5GnW0
	 bXGEil0Yiot1b8wRlwG/cD3mqBpEEaugJZ3dHLjjclotRwwecwJwQMIicScFoR6CMG
	 UjhGV9ooobke83LAdjenFv6oZQT9nTYoIef3dgM0dQkWdbTvg5roJrjmpuZUqPbpWJ
	 /yeprhGcOEwvD+DvumQLp753vt01BUoJWTFX3kJ6PbjheWdRKufgwQ069vDXW0sLXb
	 E46tU47X/251YQSxrzr2YNuehN9c/zL/gx9uVwJZUV83IuBc37GMduyggKYy4RzHQR
	 T/e1aJAx8ka5g==
Date: Tue, 22 Sep 2026 10:35:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, broonie@kernel.org, tiwai@suse.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
 perex@perex.cz, lgirdwood@gmail.com, krzk+dt@kernel.org, 
 p.zabel@pengutronix.de, conor+dt@kernel.org
To: joakim.zhang@cixtech.com
In-Reply-To: <20260922112134.4167305-4-joakim.zhang@cixtech.com>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-4-joakim.zhang@cixtech.com>
Message-Id: <179009091298.3383748.7497658110500328179.robh@kernel.org>
Subject: Re: [PATCH 3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller


On Tue, 22 Sep 2026 19:21:33 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add the DT binding for the Cadence I2S-MC multi-channel controller
> integrated in the CIX SKY1 audio subsystem. The controller exposes a
> transmit DAI and a receive DAI and moves audio through a configurable
> set of its 8 data pins. Which pins are wired out and in which
> direction is fixed by the board design and described by the
> cix,pin-out-num, cix,pin-rx-mask and cix,pin-tx-mask properties.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,sky1-i2s-mc.yaml       | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.example.dtb: /example-0/dma-controller: failed to match any schema with compatible: ['cix,sky1-audss-dmac']
Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.example.dtb: /example-0/dma-controller: failed to match any schema with compatible: ['cix,sky1-audss-dmac']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260922112134.4167305-4-joakim.zhang@cixtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

