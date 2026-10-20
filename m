Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509168;
	b=s5FMCAOOxLseBSftCSS/RYwz36kicH5v16gHTMSxsfVFjphx8W+fQWuYMFhbTc1Ar4dn
	 XD7Jn9+ny7AeLEKslGiDDOsgIT9qv2jPoFdIhgV0WugALNCtea3QC2U/so6bsllYmdYKp
	 fJCVSYNXJgu+hRjP0ML/IJwlZXyTsG0R3J04t5WVPgpV4aXpY1SA/FUGGUAaf+ZofK1Mj
	 11lH5jlvp99snDdQlRGitEAo3aHtMNrS7+0VPXl6immAj9sbk/iUacfzJ4xwIv8XofFJx
	 7oe3MQcPGf5cQsG/xZI81tH1fUUEjkbrwA1Vuc16ExN2qsjKRl25ngre2LEFER1xMfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509168;
	h=Received:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:
	 From:Cc:To:In-Reply-To:References:Message-Id:Subject;
	bh=i5qbLg5CfgzGS4UQhdai288NHSkfA8TdxM+Oig2AJIU=;
	b=wYq0sYKyFNOjXaIyCi1wHWPFa1eeOkL0Zbq+JNaoj6yAMCB2ryJ6LFoX79ysLsNp228k
	 u1zV8oqp0yu6LGgapS/Xwtw15zyYZOI7dAwmp10AqwuYLKcTkqmaDdoVOve4XTR6fF3to
	 65hUEDtltamF63oRzyAXHQXwzepxeqWkndOu2FYw0upFVZpHuRGYhXXZUF0lqLY4KS+FG
	 7MuKAJOOICMReGKKfiw6Y1LVg0Njn64wI5+2bEHUtoAguVSoI2U9Ac0XiAKHq88M8OdCS
	 ZVtdKD13Vg1SUHE9wcEMrH5wIlZ8+tk2ZKStcPU2F7HyuZSIFZVmC/WBsaJ5h1B4GhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EF5606A331;
	Tue, 20 Oct 2026 15:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079E11F000C4;
	Tue, 20 Oct 2026 15:12:47 +0000 (UTC)
Date: Tue, 20 Oct 2026 10:12:45 -0500
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
Cc: Liam Girdwood <lgirdwood@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, 
 linux-kernel@vger.kernel.org
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20261019101357.117462-2-clamor95@gmail.com>
References: <20261019101357.117462-1-clamor95@gmail.com>
 <20261019101357.117462-2-clamor95@gmail.com>
Message-Id: <179250894523.3310093.11731102179479759179.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: Document FM34NE DSP


On Mon, 19 Oct 2026 13:13:55 +0300, Svyatoslav Ryhel wrote:
> Document the FM34NE DSP based voice processor used in the ASUS Transformer
> devices.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/dsp/asus,tf201-dsp.yaml          | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dsp/asus,tf201-dsp.yaml: Unresolvable reference: dai-common.yaml#
Documentation/devicetree/bindings/dsp/asus,tf201-dsp.example.dtb: codec@60 (asus,tf201-dsp): False schema does not allow {'compatible': ['asus,tf201-dsp'], 'reg': [[96]], 'clocks': [[4294967295]], 'bypass-gpios': [[4294967295, 222, 0]], 'reset-gpios': [[4294967295, 115, 1]], 'vdd-supply': [[4294967295]], '$nodename': ['codec@60']}
	from schema $id: http://devicetree.org/schemas/dsp/asus,tf201-dsp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261019101357.117462-2-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

