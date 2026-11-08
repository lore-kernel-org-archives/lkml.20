Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794165804;
	b=KpLJurRf6nNEmnW2RBpTVM7I9Aic6VTp0c9ce3JVgxVuijuU3slOWcd2WtZv9TyC9oRR
	 OpMLJuQixUpGaAPmeOldGvYq+oIsFkGPyfckzLgZzFipUz1PNpaJCCxu6Clz1XafXHiJa
	 YY/mgP56G0QZwwDtfagInRe+xe+NP8gjrCTEaD9W6ohoFiFirmI2dIMT63sTiBW7hDee1
	 ODg6WH81kb7MWzACABpb8E/iYH1UQo6nKhK9SUo8GmLxLJgUv9anULsDXdMwlufG0qb6S
	 hNxTQ2bb1VaG3P88LdMuf6pk2qdyKyx/x7jlqtoNY3NFpsfDvqOz6u9Vu5/Tm9xFp/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794165804;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Vpk4Fs6RiYfyqgzUxnt+8NjoeQOC3+Lq1hj7gfvsMqA=;
	b=u5Tbzep2aGJBb65kXCzxdmiLF/Vo/ecdrvRcBPUMYfqzLkX0ePTPAEnse2SI/32d+AVf
	 7o9dgYT6jgjAJnKDEENAW+cYSCdf8zrdbxAgutQNogMGyGFO3EDZmBABhtW8NJIiZAaGW
	 xI1Q4uW9ddMIQ6diqSa5mn1tMYJYWxfBAhxoyoBhHgs3pnuZt7ymL+Npm1sfS4CucllVH
	 sn6CNnqRR9rBdW+K1SakmLZMtb2FDHndu5XfpLqQhgreEKks93P34Vkpv5Yb2M9v3M0cB
	 e0tPd18R3x46fpBzwKTAyqveQqRvp2gSwHkVtsrC5CHTnALh71qjqJ0YMio6J519meA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOk0ZHCM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2A0606A31C;
	Sun,  8 Nov 2026 19:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NOk0ZHCM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD3E01F0089F;
	Sun,  8 Nov 2026 19:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794165803;
	bh=Vpk4Fs6RiYfyqgzUxnt+8NjoeQOC3+Lq1hj7gfvsMqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NOk0ZHCMVwd5CJm4lxQz2xUHKom64W9w7jPGLNUdgG7nLhEtprafLhku//tibrULC
	 A/4K0CcfbO77dDV6VLjNh7yZFGlefNqjE8zwFcWOQoCI6vUmiTGEmkAeZFfIUQUZW4
	 XF1SvRV4ne8MExQjHT0oqkdDrODRZeAU3U7/7Vu68ra1wcrNLDSh1fBmOyiYpvbnMg
	 cNNzsh/J52XqHCUXO5UHAajqUamzJFcdGEKppF5Va9j8Ds8n5bx4tvAEsOl31jPeXv
	 4yd81+54fV5QgXkVskuvz0ifG//1Vw1W4zJwVOaDzLMyuH0N1IWPmlEQTYmUX/Lb4z
	 oQ/Z1rKsHUvag==
Date: Sun, 8 Nov 2026 13:23:18 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: qcom: nord: Add USB support
Message-ID: <avDL8IzfY1AcDjzY@zenbook>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>

On Tue, Oct 13, 2026 at 01:34:45PM +0200, Bartosz Golaszewski wrote:
> Note: This is v7.4 material and depends on several patches that are
> still not in linux-next. Sending it out to solicit reviews.
> 
> This series enables USB on the Qualcomm Nord platform which has three
> USB controllers:
> 
>   usb_0 (0xa600000)  eUSB2 + USB3/DP combo PHY
>   usb_1 (0xa400000)  eUSB2 + USB3/DP combo PHY
>   usb_2 (0xa200000)  eUSB2 only, high-speed
> 
> The first patch is a fix for the i2c9/i2c10 pin functions, which is a
> prerequisite because the eUSB2 repeaters and the Type-C controller all
> sit on i2c9.
> 
> Patch 2 adds the three DWC3 controller nodes to nord.dtsi.  They are
> kept as far as possible free of anything variant specific, so the
> clocks, resets, power domains, interconnects and PHY references are
> added separately in patch 3 for the "embedded" variant, alongside the
> five PHY nodes (three eUSB2, two QMP combo).  Adding the QMP PHYs also
> lets the two pipe clock placeholders in negcc be filled in.
> 
> Patches 4 and 5 wire the ports up per board.
> 
> Nord RRD:
> 
>   usb_0  OTG, USB-C, FUSB15201 Type-C/PD controller
>   usb_1  host, Genesys GL3590 HS/SS onboard hub pair
>   usb_2  left disabled, not routed on this board
> 
> Nord Ride Embedded:
> 
>   usb_0  OTG, USB-C port 0 of a dual-port FUSB15201
>   usb_1  OTG, USB-C port 1 of the same FUSB15201
>   usb_2  host, USB Type-A, VBUS from a PMIC GPIO controlled
>          fixed regulator
> 
> Both boards use NXP PTN3222 eUSB2 repeaters, one per enabled port.
> 
> Dependencies:
> - PMIC DTS: https://lore.kernel.org/all/20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com/
> - FUSB15201: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/
> - USB PHY clock fix: https://lore.kernel.org/all/20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com/
> 

Figured you resubmitted this because the external dependencies was
settled. Apparently not, so I had to back this out again after applying
it.

Please resubmit once the dependencies are in linux-next.

Thanks,
Bjorn

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> Changes in v3:
> - fix eUSB2 PHY reset assignment
> - add AHB2PHY clock to USB PHYs (Shawn)
> - fix regulator node ordering
> - remove code leftover from a rebase
> - Link to v2: https://patch.msgid.link/20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com
> 
> Changes in v2:
> - Drop pin control fix that was applied upstream
> - "otg" mode is the default dr_mode so drop it from nodes
> - move the usb-mode-switch to the SoC level .dtsi
> - Add hs_phy_irq to DWC3 nodes
> - Wire-up the USB2 type A connector
> - Extend the list of quirks in DWC3 nodes
> - Remove stray comments
> - Link to v1: https://lore.kernel.org/all/20260911142040.100263-1-shengchao.guo@oss.qualcomm.com/
> 
> ---
> Bartosz Golaszewski (2):
>       arm64: dts: qcom: nord: Add the USB controller nodes
>       arm64: dts: qcom: nord-embedded: Add USB resources and PHYs
> 
> Shawn Guo (2):
>       arm64: dts: qcom: nord-rrd: Enable USB ports
>       arm64: dts: qcom: nord-ride-embedded: Enable USB ports
> 
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi     | 311 +++++++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts | 222 +++++++++++++++++
>  arch/arm64/boot/dts/qcom/nord-rrd.dts           | 166 +++++++++++++
>  arch/arm64/boot/dts/qcom/nord.dtsi              | 100 ++++++++
>  4 files changed, 797 insertions(+), 2 deletions(-)
> ---
> base-commit: 3ce5d3ff6659394e56a7ef0cb2c9982a5c39148e
> change-id: 20260921-nord-usb-dwc-dts-c2ff685d8219
> 
> Best regards,
> -- 
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
