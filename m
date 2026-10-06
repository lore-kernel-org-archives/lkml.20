Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED1F46D551;
	Tue,  6 Oct 2026 15:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301939; cv=none; b=tty1rwuiFHhRrszfyxn/oaZQ8Yoq/0dsuty5n03yILbiGfJXltjegLS35xDbASFdbhbtpFwRnLpvNdj9+bbyOxqwcQCQ4UvRMthEXqCZsU0C3VjII4WABSO2o6EoSZYuOOsCyDKJTGBXBZPQHT7rLEDZD2DmhzSwsZaBo9MJoos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301939; c=relaxed/simple;
	bh=twFaY/jlgIalOZ6sQjAlGf9KORPCSmeJkuzt3F0y0yU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxDV48PCtdpOjSZOxiN9P8u4xCV8J6V1VgRGyLNfs3ocLHYRIMbDLiBcD4Ikf+yry6TcyBPUFhFCeRV0Co7Q7v7+cdsHd0rLAD38X/WOzc7KVWgf1ZUC/ksop50PwUufJsjr6Evs+mR62Oq48m3GNnUtT3QjVGnjpbH2Dv320HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOX43lIH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOX43lIH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455931F0089B;
	Tue,  6 Oct 2026 15:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791301937;
	bh=2Ub01gSpzkIPPc4VtXS/tUHnccetbhBgf8QWwTXERhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KOX43lIHXnXkOiPR8I7vX0iKTjhaYX1YpvjfUgBRcZYDu3hJU0USj+jKBrcKJnMcY
	 Ph5T7kQ8XvvxDD/389E5TWK6DIRy+b4fxBwVa211/ZSpLoqTjEFLeY1ohgVBkWTO6B
	 s5Mwrnjv0JfUixAu6KuzmciG0OUJbJI2idVC7h/hpeEmi/OqHs6MxY2+lnEaGoHpuO
	 7JS4jaMRCs5GnPpb9/svHfMvW+zJjDppK6xW5xohEImdypQtfh1h+WITqlGmw8rq+X
	 RDUkzM42SA5YNpl0Femws1pLptpj3T3EHvXrAy4BSm7iQDbhy+76QCUmf948ra1K/v
	 fX/9qNmcyMrHQ==
Date: Tue, 6 Oct 2026 10:52:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Quchaosheng <quchaosheng000406@163.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	mfd@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Zhang Qing <zhangqing@rock-chips.com>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Chris Zhong <zyw@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] dt-bindings: mfd: rockchip,rk805: Convert pinctrl to
 DT schema
Message-ID: <179130193622.2397071.7473599240811145793.robh@kernel.org>
References: <20260923083001.606935-1-quchaosheng000406@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923083001.606935-1-quchaosheng000406@163.com>


On Wed, 23 Sep 2026 16:30:01 +0800, Quchaosheng wrote:
> pinctrl-rk805.txt describes the pinmux controller that is part of the
> Rockchip RK805 PMIC. The PMIC itself is already described by
> rockchip,rk805.yaml, so the pinmux part belongs there as well: the
> pinctrl node is a child of the PMIC node, not a separate device.
> 
> Fold the pinmux description into rockchip,rk805.yaml and drop the
> standalone text binding.
> 
> While doing so, add the missing child node schema. The rockchip,rk805.yaml
> schema ends with 'additionalProperties: false' but did not describe the pin
> configuration child nodes at all, so a valid pinmux node like the one shown
> in pinctrl-rk805.txt was rejected:
> 
>     pmic@18 (rockchip,rk805): 'rk805-default-pins' does not match any of
>     the regexes: '^pinctrl-[0-9]+$'
> 
> The pin configuration nodes require 'pins'; without it a node that names
> no pin is accepted silently, while the text binding it replaces listed
> 'pins' as required. The RK805 exposes two output-only GPIOs, so 'pins' is
> an enum of gpio0 and gpio1 and a typo such as "gpio2" is caught.
> 
> The nodes may be direct children of the PMIC, or sit one level deeper
> inside a "pinmux" grouping node, which is the layout the example of the
> text binding used. pinctrl-bindings.txt allows the configuration nodes to
> be grandchildren of the pin controller, and the driver reaches both
> layouts: pinconf_generic_dt_node_to_map() parses the referenced node and
> then walks its children. The example shows both.
> 
> The example also regains the gpio-controller and #gpio-cells lines that the
> example of the text binding had.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260923034245.396417-1-quchaosheng000406@163.com?part=1
> Link: https://sashiko.dev/#/patchset/20260923062746.516666-1-quchaosheng000406@163.com?part=1
> Link: https://sashiko.dev/#/patchset/20260923074337.575122-1-quchaosheng000406@163.com?part=1
> Assisted-by: LLM
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
> ---
> Changes in v5:
> - The child nodes of the "pinmux" node were matched with a patternProperties
>   entry guarded by "if: type: object". That has no "else", so a non-object
>   property of the grouping node, a misspelled "typo = <1>;" for instance,
>   matched the pattern and passed. Match them with additionalProperties
>   against the same definition instead. dtschema puts phandle and status into
>   the allowed properties there, so the grouping node keeps the phandle that
>   pinctrl-0 points at, and every other property has to be a pin
>   configuration node.
> 
> Changes in v4:
> - Describe the pin configuration nodes both as direct children and inside a
>   "pinmux" grouping node. Only the flat form was described, so the layout
>   used by the example of the text binding this replaces was still rejected:
> 
>     pmic@18 (rockchip,rk805): 'pinmux' does not match any of the regexes:
>       '-pins$', '^pinctrl-[0-9]+$'
> 
>   The nodes are now one definition referenced from both places, and the
>   example shows the flat node and a "pinmux" node holding one.
> - Name the binding in the summary, as
>   Documentation/devicetree/bindings/submitting-patches.rst shows for a
>   conversion ("dt-bindings: iio: adc: adi,ad7476: Convert to DT schema").
> 
> Changes in v3:
> - Capitalize the summary phrase. dt-bindings: mfd: titles are capitalized
>   after the subsystem prefix (Add 61, Convert 20 against convert 6).
> - Add gpio-controller and #gpio-cells to the example, which the text
>   binding's example had and the conversion dropped.
> - gpio-controller and #gpio-cells are deliberately *not* added to the
>   required list. rv1108-evb, rv1108-elgin-r1 and rk3328-a1 do not set
>   them, so requiring them breaks three in-tree boards:
> 
>     rv1108-evb.dtb: pmic@18 (rockchip,rk805): 'gpio-controller' is a required property
> 
>   No rk8xx PMIC schema requires the pair, and gpio.yaml already enforces
>   that they appear together ("'#gpio-cells' is a dependency of
>   'gpio-controller'"). The pinctrl driver calls devm_gpiochip_add_data()
>   unconditionally, so the property is not what makes the GPIO controller
>   work either.
> 
> Changes in v2:
> - Require 'pins' in the pin configuration nodes. Without it a node that
>   names no pin passes validation, while the text binding listed 'pins'
>   as required.
> ---
>  .../bindings/mfd/rockchip,rk805.yaml          | 60 +++++++++++++++++-
>  .../bindings/pinctrl/pinctrl-rk805.txt        | 63 -------------------
>  2 files changed, 59 insertions(+), 64 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-rk805.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

