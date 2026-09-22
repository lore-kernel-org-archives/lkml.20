Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2864E9C1A;
	Tue, 22 Sep 2026 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790112196; cv=none; b=Pm6wkysSTs2IjWfozVE359GzhZdn9GOeBhWcCpAH69hDQCh3HsExty3DZthKI63kYuG0AmUYVcrUXf4pLNdi2x4V+mDXpV94tLKvTTGG0WLhf0XVWDUZ+OfSlTZEgi0sNuy3tnUs1ns4V66AxHebZ3YVsuG3blnEabAyRGVHEy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790112196; c=relaxed/simple;
	bh=SxtzDMpd4BOBSHxBGfxvK9bg3sZ2i5E5tzKBmQtzXUc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=nsQDH0ekXLFaon3Z2X4qPO8bb06t98tDqgz3RdrjiUAicwaqZnqs3vfrf+mj/LFQXqQwkuI05uJB8fFsHbvVbTBeIVwm9BiqVh33bl8coaoX67moeuJYvyfuoHpAxmRxSBUFl87v5Dd5ZcyQXLVahkzANU8bf/3/nSUPWhOb+QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CeG8u+eC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CeG8u+eC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBA21F000FF;
	Tue, 22 Sep 2026 21:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790112177;
	bh=1ZdkMU9inhU27Sz46y78NDuxZnAhsIJpwSLDKT9rQIw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=CeG8u+eCPy3/q0g3QFP6oCSFYO88fpUB4LTJTZoWvF9k5Aefg7QPsJoZXoeT+KQCg
	 44eGMQeHQRpNjbc0UcsmCIxk6smoZfVxbKtmuWFXrjHBbcLjNnz5xI7NWOQsVku1l4
	 Z0XYcqrTGRTDLl0tNlXZ0usbCinrlpGox6CYlsd9kc+zp6tk0iHxvctyEg9peNbFzS
	 dvc77gGjNtFOTFbGl7JTIiiOaLYMYGALEjkeLZVs9dWOMlELUdzuquR0m/VAho7p2L
	 FLucOgkSzpOvtsdfcNj23GzxbqLnaxaFSbk7xpJLrLVloHr5jzXiEO3jFMdiBcLYug
	 /Cy9HLaUD3Hbw==
Date: Tue, 22 Sep 2026 16:22:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: rahul@summations.net, pjw@kernel.org, broonie@kernel.org, 
 aou@eecs.berkeley.edu, anup@brainfault.org, alex@ghiti.fr, 
 conor+dt@kernel.org, lftan.linux@gmail.com, palmer@dabbelt.com, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, 
 linux-riscv@lists.infradead.org, lgirdwood@gmail.com, 
 devicetree@vger.kernel.org
To: Joshua Yeong <joshua.yeong@starfivetech.com>
In-Reply-To: <20260922161156.1088153-2-joshua.yeong@starfivetech.com>
References: <20260922161156.1088153-1-joshua.yeong@starfivetech.com>
 <20260922161156.1088153-2-joshua.yeong@starfivetech.com>
Message-Id: <179011214727.1123357.14799717245242010504.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings


On Wed, 23 Sep 2026 00:11:52 +0800, Joshua Yeong wrote:
> Add device tree bindings for the RISC-V Platform Management Interface
> (RPMI) voltage service group, both for the supervisor-facing regulator
> controller and for the SBI MPXY channel which the SBI implementation
> uses to expose the service group.
> 
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> ---
>  .../regulator/riscv,rpmi-mpxy-voltage.yaml    |  65 ++++++++
>  .../regulator/riscv,rpmi-voltage.yaml         | 150 ++++++++++++++++++
>  2 files changed, 215 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-mpxy-voltage.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.example.dtb: /example-0/sensor: failed to match any schema with compatible: ['vendor,sensor']
Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.example.dtb: /example-0/codec: failed to match any schema with compatible: ['vendor,codec']
Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.example.dtb: /example-0/phy: failed to match any schema with compatible: ['vendor,phy']
Documentation/devicetree/bindings/regulator/riscv,rpmi-voltage.example.dtb: phy (vendor,phy): voltage-domains: b'\x00\x00\x00\x03\x00\x00\x00\x03\x00\x00\x00\x03\x00\x00\x00\x04' is not of type 'object', 'integer', 'array', 'boolean', 'null'
	from schema $id: http://devicetree.org/schemas/dt-core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260922161156.1088153-2-joshua.yeong@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

