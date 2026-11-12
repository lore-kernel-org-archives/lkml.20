Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474916;
	b=ipdrClHy0MAqugz3SwemjjidcKcW0Gr3+bRfkGsJYCGCmZ7lrcj94jCaSSNkJWNbR6+x
	 lOA1ID9sf9AU0dkLbU6yTWFHSTDdS6bceW4dYg5kVZeS4vnoTWzLFW8XZj0KEpFaISSB3
	 3tWYunokZZv8On95BbkvCPhIra0bhgCHQteir4/XPl6L7ZCnTC1u9opTE52NcjJ2mNN61
	 2mD+r2wHPrrc9h0lya3+hDSRl8BjflgVKyaBB6ys30VXkidy8tp6Evn0lULWW9WSjqnO2
	 XiUzvMAY6WGZ+nAhJOAdJgQhrznrjDkR8LD2dNLbwXB2AxnrkI1B9vY7vcOqBkLrZ/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474916;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=p6kD70grwY03BvmoDcid1nVMJksmh5DRjbYbwCO+Ep0=;
	b=y7bgg5NhSpjtV+ErkUmHwra7YwH1taKh/VuVQOL7rH0FV5pmiziOcwFPjU82z60YNt0e
	 Lb/i8kCvZ10KwyEg7wok8QaeZkJp3tlYVj2Jq7ufxM+3VelBnL121H1cfQF2hNdQnq72f
	 22ANTyYupBh+AAIGO+2lXZIujSO6yDmiUFJVtdBW+s+PX29FddpUPNzlZts4ETgjJjo8E
	 jec+HxwqCqtf7laIoEa/6ZSJ3/TBY+wForbbFlu9//h2uecHnjYx4Xw6T0/L6aWJxGkP0
	 3pQX2xygTo0kx7Vk/eikHXd2jObeTE3S19sr6cP/408sRD/4yjmgMQNVqq5zC3Mk8CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDsSTYWD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 7DF59606A89D;
	Thu, 12 Nov 2026 09:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aDsSTYWD
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2CD011F00A08;
	Thu, 12 Nov 2026 09:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474916;
	bh=p6kD70grwY03BvmoDcid1nVMJksmh5DRjbYbwCO+Ep0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aDsSTYWDteLmmN41F83nSZqVvrdkV50ryF1qJdtBshsRkZkyVzXld9QR8KlfwyhZ9
	 7WWnj0V95UNw3md/Dys4dpGaXugg1e5pgjPYiEiBUUuThdyLlAlzfv9NBpP6rnNVpC
	 JUoBtofERKKe/DCfhRE8+sxdx95vc983FwKJxrkYobrTnhyt9Wo6hBER9MpTXbBOHV
	 gWZQD/4CwrYZUE+0v4y7nYtKvdD8wjPTetLiafR29nSHZhq9H9sczoOD+pFGjFGxJs
	 4uyfG4hkAE5ByoTDXI0T6gIgfI6aghXxpVEyaOY0PVNW8vTTR+fU/qCcmGd2zPmMlL
	 nyPwYRbYYduBg==
Date: Thu, 12 Nov 2026 10:15:12 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/4] arm64: dts: qcom: nord: Add USB support
Message-ID: <o6t6le343ifmu5w33z55ik473xfynt6urv465xe3bn7hyhmncn@7atsac6o5bwo>
References: <20261013-nord-usb-dwc-dts-v3-0-bcaaf3faae24@oss.qualcomm.com>
 <avDL8IzfY1AcDjzY@zenbook>
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
In-Reply-To: <avDL8IzfY1AcDjzY@zenbook>

On Sun, Nov 08, 2026 at 01:23:18PM -0600, Bjorn Andersson wrote:
> On Tue, Oct 13, 2026 at 01:34:45PM +0200, Bartosz Golaszewski wrote:
> > Note: This is v7.4 material and depends on several patches that are
> > still not in linux-next. Sending it out to solicit reviews.
> > 
> > This series enables USB on the Qualcomm Nord platform which has three
> > USB controllers:
> > 
> >   usb_0 (0xa600000)  eUSB2 + USB3/DP combo PHY
> >   usb_1 (0xa400000)  eUSB2 + USB3/DP combo PHY
> >   usb_2 (0xa200000)  eUSB2 only, high-speed
> > 
> > The first patch is a fix for the i2c9/i2c10 pin functions, which is a
> > prerequisite because the eUSB2 repeaters and the Type-C controller all
> > sit on i2c9.
> > 
> > Patch 2 adds the three DWC3 controller nodes to nord.dtsi.  They are
> > kept as far as possible free of anything variant specific, so the
> > clocks, resets, power domains, interconnects and PHY references are
> > added separately in patch 3 for the "embedded" variant, alongside the
> > five PHY nodes (three eUSB2, two QMP combo).  Adding the QMP PHYs also
> > lets the two pipe clock placeholders in negcc be filled in.
> > 
> > Patches 4 and 5 wire the ports up per board.
> > 
> > Nord RRD:
> > 
> >   usb_0  OTG, USB-C, FUSB15201 Type-C/PD controller
> >   usb_1  host, Genesys GL3590 HS/SS onboard hub pair
> >   usb_2  left disabled, not routed on this board
> > 
> > Nord Ride Embedded:
> > 
> >   usb_0  OTG, USB-C port 0 of a dual-port FUSB15201
> >   usb_1  OTG, USB-C port 1 of the same FUSB15201
> >   usb_2  host, USB Type-A, VBUS from a PMIC GPIO controlled
> >          fixed regulator
> > 
> > Both boards use NXP PTN3222 eUSB2 repeaters, one per enabled port.
> > 
> > Dependencies:
> > - PMIC DTS: https://lore.kernel.org/all/20260929155152.1898666-1-shengchao.guo@oss.qualcomm.com/
> > - FUSB15201: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/
> > - USB PHY clock fix: https://lore.kernel.org/all/20261008015017.3359804-1-shengchao.guo@oss.qualcomm.com/
> > 
> 
> Figured you resubmitted this because the external dependencies was
> settled. Apparently not, so I had to back this out again after applying
> it.
> 
> Please resubmit once the dependencies are in linux-next.
>

The only thing left is the FUSB15201 series and it's only a run-time and
dtbs_check-time dependency. Can we proceed with this or do the repeater
bindings need to go first?

Thanks,
Bartosz
