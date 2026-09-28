Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C715013DC;
	Mon, 28 Sep 2026 23:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790636594; cv=none; b=L3SSx097HBsUjGPx/QbdlhlMAqbuAvcm9ayyC3XqIz6zFpE62Hs+2u5XKoYLtaZmjExTfAcaaMMxDnUXJYyOzUqxmIBfsWZaMaPzJ0F1C0pDk8dNNDraZFb1du9K2cf3aRHPdf0znC0xGJnuFwTQvLN1EQ3ivjBawPT00i5AX7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790636594; c=relaxed/simple;
	bh=9H5CS661AYQETAysca3K50GQ+NeH9ZPYrWWZNwEGkq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NaycCyK0TVL6BB7fmWjmjAUxWCJrg8bTgIb5uD4QJw4WDcCmUWMVq1KiHrC1u1V5bo0L5w82ECauIkxIbNotFLuQf3bVKQAQ2BUmYdzfpoSg2vtbd/jFxPjuXvvae2f+JOymwiY5pAET9bs8WLqIagaRpY28qThShs364YpalJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aePDqIKY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aePDqIKY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467D01F00899;
	Mon, 28 Sep 2026 23:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790636592;
	bh=KuqmdeBCx72SaUXKQSQQxu5JtyZyMYa7iPdmUqkdNWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aePDqIKYLLkaJCp5DjwnmNByYccW9cKLDaQdKTEd1iaMi73TCW9Ujz0G1CkjYqaNP
	 uo9pIFDb2U110ovMPZ5MBlPw1Gt6/LkWgUpi+xB5jaTiyAgI7zhAy0hKN57+T/lJm+
	 c/te2KkaO1AY92ii9DHGabdvgNYCaUjKwg2Us54CMJcEyl9k4OvxQQZCdaNZEEZl9j
	 5g1eF4kGd4sLHCSOzyoP4K1777ZPlQZxuyXs+6nyRMi4wMsq011I4M11/6lZr62SDZ
	 CABkR2uI1CU92Oz1zm+W1WCjXK0H5XKtHCRMmQE0UU6b13pH34dECVLxyuh5ApJ3X5
	 nzIaB/dJc1aJQ==
Date: Mon, 28 Sep 2026 23:03:10 +0000
From: Yixun Lan <dlan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>,
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
Message-ID: <20260928230310-GKB2079@kernel.org>
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

Hi Greg,

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
Any chance to queue these patches (1-4) for v7.4 cycle? Hope it not too late,
and then I will handle the rest part, thanks


-- 
Yixun Lan (dlan)
