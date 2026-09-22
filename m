Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64155C305;
	Tue, 22 Sep 2026 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091314; cv=none; b=kSN2IKd9TfMdULG1fXLAdAHTZjltZBaT5gd1Bt1DdMair5VOKXInk3sabZNG5llFyifR34FFAlP3PAKW8f0+2RQN655fWDzoDmxpnxqh07qcuVe56YFNAc8cYNbJX+h8kmXEVcKsnTIA0wjKv0uP1aq1TRiGXCLkTN+LXG0xaDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091314; c=relaxed/simple;
	bh=ypWsx4p0Qcqo+3XCtIdEzsMYcaAoPzYRo8OzrIX4Qro=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=S4enHK9zp1UFnxsZ4QxNCjnIuriBiO8BMVZ/BjUy3+SPmL7YsWdpH8XnwwnC8zSTvUK8UZ7rmO/VDMFVN4Ap5GKpJahOhtKMJe81v5iY1iHCs4+LYoffDU8fbJZMBJuidoYIK0zRJnMM/50I1CXiM75T/KYrMXgIXVu0hSJrCj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGaf6fuP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGaf6fuP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBCE1F000FF;
	Tue, 22 Sep 2026 15:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091312;
	bh=qJu86Ld8XnTBZH5sZa1vlfZEborsNw+EF8dWwLK5Ra0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=VGaf6fuPEs+fxknL+LWvY8Ddh2s5HsZrAcbSCbhvXY1Q21YQw/C2tg8oAtLptzDzc
	 jiE9YRhok3zN6XksBeisZ5S73fSs2eDXZZYkqxfhpSTIV3JDoXT6QAhUsohrJpczN7
	 EQUttGxwq1El5IDFC2suL22X0/uf7ApuXGMcNddZQrpylfRwlGPJTinJu4myn+3KRE
	 lPs1UROEPRfTVmTAA92U7IkpnEWW/lom7CeUn7ng7hZLh48gnifsLKsw+ht0OlVtFD
	 tIbOIi29yUJubmBPdrw72JrYsKFe2pAp+O2uxPLViCvPbjKOcZbmh5atdDhuhZJvA6
	 2ZpK1v2hJFZ/A==
Date: Tue, 22 Sep 2026 10:35:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 lgirdwood@gmail.com, devicetree@vger.kernel.org, broonie@kernel.org, 
 perex@perex.cz, krzk+dt@kernel.org, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
 p.zabel@pengutronix.de, linux-sound@vger.kernel.org
To: joakim.zhang@cixtech.com
In-Reply-To: <20260922112134.4167305-2-joakim.zhang@cixtech.com>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-2-joakim.zhang@cixtech.com>
Message-Id: <179009091064.3383676.14654535260595852559.robh@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller


On Tue, 22 Sep 2026 19:21:31 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add the DT binding for the Cadence I2S-SC controller integrated in
> the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
> controller supporting standard I2S, left/right-justified and DSP
> formats, plus TDM operation with up to 16 slots.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,sky1-i2s-sc.yaml       | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.example.dtb: /example-0/dma-controller: failed to match any schema with compatible: ['cix,sky1-audss-dmac']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260922112134.4167305-2-joakim.zhang@cixtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

