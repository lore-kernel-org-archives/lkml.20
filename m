Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6ED3D6CDE;
	Mon, 28 Sep 2026 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600292; cv=none; b=sT/o9qw6j7adDPpDVKeuzuNYUotXUwVROAxRQOLkLflNb2Dpsd6VMpnGyxWetIYMVnCZ5A4Rb33VfV/9s/mE5fENlHvPnxVwmtX+bWZjc2g0EvJynVyaD/qjGUXbW+uvrBwQEV4JgMiM8Y3a3L+ZbQPgZROhxI2s19+K6IharHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600292; c=relaxed/simple;
	bh=722o4IHwmNd65+XBhYRpX9s0+i5OvSi5xLrY4R5GEtI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tkbS++du7ag+oWFg/DPs1ns+Wtk/3aoMZ5C20dxFKn0MXqQLGRt/SjwRZyfC+N3Axfg6pzVn+X/jp9G47FM9Lg6Duda/F4MnfZ6tsf7PVUydS+1CymxTpFudjS8WCKc9Fs48yVs5d9ODewwDobuGCqS427cD1DpfXYeykpJs9C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZVWhwvl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZVWhwvl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7A11F000FF;
	Mon, 28 Sep 2026 12:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600290;
	bh=B1VO9gTWXFj+zWXT8NiCvuBVy6vF6WZGrfa8TOULsfo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=nZVWhwvlVR4lGCOL/74j9V3S/RTzvtgJ2va3IxkdMui3Q/zhXRh1Llve1fFRhAO+z
	 HuFWgg7LxkPzGC8y7sLaFbZGzYFPBSK7tkWsbmCy/au4GlPxiOHtqxaXR6hBWU4Tbm
	 XLnLHgaEl57i/iXv1qOVamzeya8vHDObVjXhd8qcWyTnIl7fDOHIeTp9CBiQQUgxO3
	 B9doT/i7rEbRGr5FZtLy7ed2Pz7UvtujNI0l+EwQ/9gu038uFCqgqNFoQt/0cMq5BV
	 NRrSEU/V1XWYUH+G+2Vpk7tEJuSE5hba/+pcdwrx989ysc9XKLCgz21C7hQnmyKIje
	 xg0PODWtf1wLA==
Date: Mon, 28 Sep 2026 07:58:08 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, mfd@lists.linux.dev, 
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
In-Reply-To: <20260927155745.187758-2-clamor95@gmail.com>
References: <20260927155745.187758-1-clamor95@gmail.com>
 <20260927155745.187758-2-clamor95@gmail.com>
Message-Id: <179060023175.3803944.16357771664157803576.robh@kernel.org>
Subject: Re: [PATCH v1 1/3] regulator: dt-bindings: maxim,max8907: Convert
 to DT schema


On Sun, 27 Sep 2026 18:57:42 +0300, Svyatoslav Ryhel wrote:
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

See https://patchwork.kernel.org/project/devicetree/patch/20260927155745.187758-2-clamor95@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

