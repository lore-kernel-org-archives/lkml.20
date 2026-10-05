Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4253C47CC8E;
	Mon,  5 Oct 2026 13:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207014; cv=none; b=cweixet/vS0gXAfUOmZKmnv6Z9erSWC8alx+I0Tf7YgaGYs+IbUwm6oXZcTurE/Gv6kcOXGMBaXVyiHys2LwoGP4AYq94gb6y1K3M0uXN92cJ+XtQNw+hVFRiKTGP6mXJHMDQ+1tYSYHzNz+azoXp+j5RZslK9/kIG2pg+JtTJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207014; c=relaxed/simple;
	bh=yjVxu1sIZCWTpZAcQr5CFMUMBqyT46z/7+CNC8jJBhs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=jz6+7VdjqrEllETbhgmBi/g6WlUGzXkduapTGNe1QPSM/6fp21rCAGYjztp/QZtx/Cz27O4cZFdCGwfIlDGwUDYto/u8bCKY7G4GToLGiNheEcgkGcjArzRrsfiFopiqqOHYDQLXvqviuDlMn+EuRGfbPTk+Vh2SFOqWUHItVuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f+NPwk4N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f+NPwk4N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FE91F0089C;
	Mon,  5 Oct 2026 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791207010;
	bh=6DHFa9h/nyLIDREir8hkqdruoJu2cqxUZjCCnV9moEY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=f+NPwk4NPHMZK2ZjjnDPu8splG5paMCg1WrDTApnaDQuwpWj28fAFwjP9jS4kiIJE
	 3BLZwxSfEasFTdVG2CDCwA3VwB+gcePuk6Pad4b4oO29f++rYhJxjRsr+VjWkqdhxB
	 CaquUA1ZKhoVJU42Ftk6d8bVjUQ9C10HuU0ZwAlo7mFTSswvardKi6IGSKNZNACHhj
	 8WhR+xgkERGFly451d6betj4qHUC8Exsq/Kp5VvfmaVG8h8Rg/FLokRWFA7+Iq1P91
	 zB1X1XBwZu2FCO65iN6es+iLuUdz92DmqEz1nApcb2Q4I1+dcREPIueZZv00gONjFH
	 RNVIqKBnaAASA==
Date: Mon, 05 Oct 2026 08:30:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: mfd@lists.linux.dev, Mark Brown <broonie@kernel.org>, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20261004164540.198446-2-clamor95@gmail.com>
References: <20261004164540.198446-1-clamor95@gmail.com>
 <20261004164540.198446-2-clamor95@gmail.com>
Message-Id: <179120692769.84862.11836707484754903854.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] regulator: dt-bindings: maxim,max8907: Convert
 to DT schema


On Sun, 04 Oct 2026 19:45:38 +0300, Svyatoslav Ryhel wrote:
> Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
> to nvidia,tegra-regulators-coupling in child regulator nodes.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/regulator/max8907.txt |  69 -----
>  .../bindings/regulator/maxim,max8907.yaml     | 285 ++++++++++++++++++
>  2 files changed, 285 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/max8907.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max8907.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/regulator/maxim,max8907.yaml: Unresolvable reference: /schemas/regulator/nvidia,tegra-regulators-coupling.yaml#
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:mbatt: False schema does not allow {'regulator-name': ['v_powerrail'], 'regulator-always-on': True, 'phandle': 2}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:sd1: False schema does not allow {'regulator-name': ['vcc_1v2_ddrio'], 'regulator-min-microvolt': [[1200000]], 'regulator-max-microvolt': [[1200000]], 'regulator-always-on': True, 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:sd2: False schema does not allow {'regulator-name': ['vdd_core'], 'regulator-min-microvolt': [[950000]], 'regulator-max-microvolt': [[1300000]], 'regulator-always-on': True, 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:sd3: False schema does not allow {'regulator-name': ['vcc_1v8_io'], 'regulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[1800000]], 'regulator-always-on': True, 'regulator-boot-on': True, 'phandle': 3}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo1: False schema does not allow {'regulator-name': ['vcc_3v3_ddr'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'regulator-always-on': True, 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo2: False schema does not allow {'regulator-name': ['vcc_1v1_pll'], 'regulator-min-microvolt': [[1100000]], 'regulator-max-microvolt': [[1100000]], 'regulator-always-on': True, 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo3: False schema does not allow {'regulator-name': ['vcc_1v8_lcd'], 'regulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[1800000]], 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo4: False schema does not allow {'regulator-name': ['avdd_3v3_usb'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'regulator-always-on': True, 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo5: False schema does not allow {'regulator-name': ['vcc_2v8_emmc'], 'regulator-min-microvolt': [[2800000]], 'regulator-max-microvolt': [[2800000]], 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo6: False schema does not allow {'regulator-name': ['vcc_hdmi_pll'], 'regulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[1800000]]}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo7: False schema does not allow {'regulator-name': ['vcc_3v0_sensor'], 'regulator-min-microvolt': [[3000000]], 'regulator-max-microvolt': [[3000000]], 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo8: False schema does not allow {'regulator-name': ['vcc_1v8_sensor'], 'regulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[1800000]], 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo9: False schema does not allow {'regulator-name': ['vcc_3v3_fuse'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]]}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo10: False schema does not allow {'regulator-name': ['vcc_3v1_touch'], 'regulator-min-microvolt': [[3100000]], 'regulator-max-microvolt': [[3100000]], 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo11: False schema does not allow {'regulator-name': ['vdd_3v3_hdmi'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]]}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo12: False schema does not allow {'regulator-name': ['vcc_2v8_sdio'], 'regulator-min-microvolt': [[2800000]], 'regulator-max-microvolt': [[2800000]], 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo13: False schema does not allow {'regulator-name': ['vcc_3v0_motor'], 'regulator-min-microvolt': [[3000000]], 'regulator-max-microvolt': [[3000000]]}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo14: False schema does not allow {'regulator-name': ['vcc_2v8_lcd'], 'regulator-min-microvolt': [[2800000]], 'regulator-max-microvolt': [[2800000]], 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo15: False schema does not allow {'regulator-name': ['vcc_3v3_temp'], 'regulator-min-microvolt': [[3300000]], 'regulator-max-microvolt': [[3300000]], 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo17: False schema does not allow {'regulator-name': ['vcc_1v2_mipi'], 'regulator-min-microvolt': [[1200000]], 'regulator-max-microvolt': [[1200000]]}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo18: False schema does not allow {'regulator-name': ['vcc_1v8_vi'], 'regulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[1800000]]}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:ldo19: False schema does not allow {'regulator-name': ['vcc_1v8_touch'], 'regulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[1800000]], 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:out5v: False schema does not allow {'regulator-name': ['usb0_vbus_reg'], 'regulator-min-microvolt': [[5000000]], 'regulator-max-microvolt': [[5000000]]}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:bbat: False schema does not allow {'regulator-name': ['vcc_bbat']}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:sdby: False schema does not allow {'regulator-name': ['vcc_rtc'], 'regulator-min-microvolt': [[950000]], 'regulator-max-microvolt': [[1300000]], 'regulator-always-on': True, 'regulator-boot-on': True}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml
Documentation/devicetree/bindings/regulator/maxim,max8907.example.dtb: pmic@3c (maxim,max8907): regulators:vrtc: False schema does not allow {'regulator-name': ['vrtc']}
	from schema $id: http://devicetree.org/schemas/regulator/maxim,max8907.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261004164540.198446-2-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

