Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589736;
	b=3kIKq5Ag/uOJYM0gjJ3x7z58c/Be7/MwNZ7nhs7YiDSwkbPoP5PmtHx7NTY/HrkPw6by
	 8FkA5uv2FlmLNKPrhWX3ALkmdGnYJfZ5MB2IJc9hfidI5zpBl33F+54S3y39lWTCGZux1
	 MDzKmbJlTZ2vd/hIZtEMpM9MmRYL4pAJiYM4u8kxW1b3B3vo/DT41nqJhmoqZrShRWefm
	 hFK0/oxM+ao2sl6JupzpitRLd4lnpraCEg10IbjWObb8/KtLD5bznQh/dLfbeI3BdaUD1
	 FIbVZnfHiKL1sCahZXOog73LL6CHSnXwSbJtLzILKikVEGzzdEIwrA8K2kOsspsGiTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589736;
	h=Received:DKIM-Signature:Date:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=YHRQ66J0ycM2BkMm3oppEyXAyznPhNuSwZ7WOkiN094=;
	b=aamUjZTISZCNHrXlcEAdJX8GI/aH5upg53Si5o9ffYeqxzA6mqAlybs4jmYKYeUOttxe
	 5+IFevUztyRtjn+aeHWqqSq/573uJZC8SnZX/RPA0QEr0ZrKpzhcVMmNod7S5KNk9xBEF
	 mn6TNCmGlvzlMX69BHVapCb+41E2u4psnnLPs3ogdAAU7m1TYr0Kj7mlzWtTIfPrMQEIo
	 8bsWRWu2C3XoND3G7ARgv4VQ4+myfeKFALsJOr5dd0Db9cH7dyx42BScROJoGR8cjwsJ0
	 7FUoZ7qLlcqql7CExX8Qhis/jfTeRi9wLlFRhudQ6FkmRXRpOLE/Tpn/jhuySvSt3+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifywKWVo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7595C606A31A;
	Wed, 21 Oct 2026 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifywKWVo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 820451F000C4;
	Wed, 21 Oct 2026 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792589736;
	bh=YHRQ66J0ycM2BkMm3oppEyXAyznPhNuSwZ7WOkiN094=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=ifywKWVoH6rPr4qW+QJe/z+g+dXbeMzOgD6mVLQ5c/JVLZH4b1jaN4CFcWYgF4sTK
	 siU/O8aQNcLNKCIFGbwiiu8yUZO+hAdTVuY1TkkdpAfx88Uo961jRZ0D3pchH6o/7x
	 fBbr3o5jtG6TJVEIAzvjLnCL9dIZhf/WMhXCmEhoh6lXmUqX+BBl09iaVSmHK7DGi/
	 kZ/xFeMg7Q1bufhhaO2cAoFSn8BzVPyg14XnWk2qLtXP/h3sC91TMbT+4aXv2Ktb2N
	 p5TadN9ZuCOJ2vaxCwDT9Dpxb7sk8YeQ5dSP6WTDEhkVQsN0t9XWJUOtiCUtmjZyBM
	 H+idlo9RbuyWA==
Date: Wed, 21 Oct 2026 08:35:34 -0500
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
Cc: Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 mfd@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20261021113419.283015-2-ansuelsmth@gmail.com>
References: <20261021113419.283015-1-ansuelsmth@gmail.com>
 <20261021113419.283015-2-ansuelsmth@gmail.com>
Message-Id: <179258971128.3919834.16686113021668771376.robh@kernel.org>
Subject: Re: [RESEND PATCH 1/2] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC


On Wed, 21 Oct 2026 13:34:16 +0200, Christian Marangi wrote:
> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
> 
> It does also support i2c and timers but those are not currently
> supported/used.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/mfd/airoha,an8855.yaml           | 176 ++++++++++++++++++
>  1 file changed, 176 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml: Unresolvable reference: /schemas/net/dsa/airoha,an8855-switch.yaml
Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: soc@1 (airoha,an8855): ethernet-switch: False schema does not allow {'compatible': ['airoha,an8855-switch'], 'ports': {'#address-cells': 1, '#size-cells': 0, 'port@0': {'reg': [[0]], 'label': ['lan1'], 'phy-mode': ['internal'], 'phy-handle': [[1]]}, 'port@1': {'reg': [[1]], 'label': ['lan2'], 'phy-mode': ['internal'], 'phy-handle': [[2]]}, 'port@5': {'reg': [[5]], 'label': ['cpu'], 'ethernet': [[4294967295]], 'phy-mode': ['2500base-x'], 'fixed-link': {'speed': 2500, 'full-duplex': True, 'pause': True}}}}
	from schema $id: http://devicetree.org/schemas/mfd/airoha,an8855.yaml
Documentation/devicetree/bindings/mfd/airoha,an8855.example.dtb: /example-0/mdio/soc@1/ethernet-switch: failed to match any schema with compatible: ['airoha,an8855-switch']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261021113419.283015-2-ansuelsmth@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

