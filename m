Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9852EEE9E;
	Mon, 28 Sep 2026 22:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790636305; cv=none; b=JXTE1tcEkvgS/mhc4oGtf6PuUxAJz6qBnWgPwaw20yLmQl4Hwk5o1OS0ieD/Hu5TsCFclmOl7hb2qA1iTrfSPql7joWxDOF6soJk6hvloZiSogZVAmy6lOah6wWfyeuosMEvqDkmLPYvCi+p4wjn8R4eXih89kQaCqUJPKN112M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790636305; c=relaxed/simple;
	bh=WxhA/YOQIyDbArHg1OAhmI05bF4EFqsmFvngwGyYoo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmvTWL7Fw/oguaE/FL+v2JsFhc4VvisO/bB9L4fjXS8hvGUj/XetCJ9ghJEkl697plb6ObXSJ8XgorNTuFjtOT7KYh6YwrRe6OVcaoXA25mq8IXM4KfLPgf1eUmGNbBITZ0080/i+HAHaJXfet6tGkYYAA1c2xfPDWG8KSggVvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mL5T2JIA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mL5T2JIA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CDF61F000FF;
	Mon, 28 Sep 2026 22:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790636303;
	bh=cfTQnP72O8yqoNFmdtkzTTYSL3ptcW/zrw9B4W+6/9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mL5T2JIAbu9d2imTAacgjzW7ZmK8KIw2PWCZCicBvUq42ZqylDq8vhRnlFK9JQqK1
	 RJDTi23Gn6W+dKD5C96Mkcjwddq6xoIKAtH7BU+meta60Sj+OCObpHrCBlzz9rTB2V
	 pIsjib0tlQHXJ7d+yzgnbaYFBePlx5V4VRGI+yW4Wx0bOvKWtGCx9AcLYlio6Twvbh
	 pQReEvxr9S+08tYKTKsXaSdacCMOs0sgBzV0dQxr65bREHe2Sh0sJofrSyB2BUeUwO
	 27j/H0StmEgKa/Gxpq9Tsook7DQ0p0VG3SeFhM9aprguauHNn3WilLXery2HnnCPFT
	 p4Ns7Vbuipzgw==
Date: Mon, 28 Sep 2026 22:58:21 +0000
From: Yixun Lan <dlan@kernel.org>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Peter Chen <peter.chen@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>,
	Ze Huang <huang.ze@linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v3 0/8] Add SpacemiT K1 USB2.0 controllers support
Message-ID: <20260928225821-GKA2079@kernel.org>
References: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260927-b4-spacemit-k1-usb2-v3-0-ce7095896039@linux.spacemit.com>

Hi Junzhong,

On 19:40 Sun 27 Sep     , Junzhong Pan wrote:
> The SpacemiT K1 SoC has two USB2.0 controllers, one has Dual-Role
> support, but the hardware has no internal OTG registers, the other is
> Host only. These controllers are compatible with Chipidea USB2 driver
> with some flags set and reset control support.
> 
> This series is based on 7.3-rc1 and has been tested on Banana Pi F3
> development board.
> 
> A self-powered USB device/hub is needed to test the host function of the
> dual-role controller on Banana Pi F3, a MINI-PCIe USB2.0 module (a
> cellular module e.g.) is needed to test the host only controller.
> 
> ---
> Changes in v3:
> - collect tags
> - merge the two dt-binding commits
> - use local variables when acquiring devm managed clock/reset
> - drop manual clk_disable_unprepare() from the remove path
> - enable related drivers as modules in defconfig
> - Link to v2: https://lore.kernel.org/r/20260908-b4-spacemit-k1-usb2-v2-0-f07342ffa051@linux.spacemit.com
> 
> Signed-off-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> 
> ---
> Junzhong Pan (8):
>       dt-bindings: usb: ci-hdrc-usb2: add spacemit,k1-usb2 compatible
>       usb: chipidea: usb2: use devm_clk_get_optional_enabled()
>       usb: chipidea: usb2: add optional reset support
>       usb: chipidea: usb2: add SpacemiT K1 support
>       riscv: dts: spacemit: add USB2.0 controller nodes for K1
>       riscv: dts: spacemit: enable USB2.0 controllers on BananaPi F3
>       riscv: dts: spacemit: enable USB2.0 controllers on OrangePi RV2
>       riscv: defconfig: enable ChipIdea USB controller support
> 
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml      | 15 ++++++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    | 16 +++++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   | 28 +++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi               | 40 ++++++++++++++++++++++
>  arch/riscv/configs/defconfig                       |  4 +++
>  drivers/usb/chipidea/ci_hdrc_usb2.c                | 35 +++++++++++--------
>  6 files changed, 123 insertions(+), 15 deletions(-)
> ---
The series looks good, so 

Reviewed-by: Yixun Lan <dlan@kernel.org>

-- 
Yixun Lan (dlan)
