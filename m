Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF9533987E;
	Mon, 31 Aug 2026 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188295; cv=none; b=ZgXaF2WC+ZlSDgDM+L3UfFZejlC0vKEEhU2UEkxgCZz+H2yvIMaiWwCx5wRuFDkUYgh6EN2Yr1OSLStVGLs3u1Yrojs/ZDLfVoG4dQ9J+6DaNt9Gd/towGNCtUc3QZQasMJDg3FKyFdwxmekInrDmxBoFIpzmx3Pz3Wu23WyuL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188295; c=relaxed/simple;
	bh=mpE3Lesp3GRm0LJGdC9YOGMakFgfHsPvnQgmn1e6rhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDeXYDUHSDiSzScs6CndkqeSjgffPUFNYIdni9iD5mACB+sLoyZgDWMvCIiMd3eszRKYPcMpFBX2bZmpZ2xQnuwWGftxptDgIf6BYNcAPjEEizsGtvp/oEMtJGSOUPU0FpyfRuPKmzkH8dSTNtgNLIysK0z+9akh8257C4wXOvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7mm+Gz7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7mm+Gz7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F201F000E9;
	Mon, 31 Aug 2026 14:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788188294;
	bh=P5qMAuORAMa8auZQozsefwEp8+Ze9NizqRFOfJHbvco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l7mm+Gz7mt3Nd3u2UpAfNEgVUsN6NkaLBbFMItL7FqpHUqe1TYgSB0IP50YzFsUHs
	 US3n+39SDAr0zVE9LNAi9RzX0JCKmDlHNLFyeWItHNMum5JLl81GdSy0u/XCZENcxt
	 +xAnqOkn/geqoERhWTaXX+GNbFXt0Hjx12msOu4NE/RSR7PLnxsnfcoKYLjPOxR2pB
	 v6zVHNzIeC7yvXDfBz91zSoJFebw0F7U18v0nZteba5JkufLDka022mkcuyHBCpG3r
	 i5A1dj1Wlb9S6uo8W58WKsRYwIJggjllHwdGRuLvMqSIfFIua6RuV3ndllI5rojArc
	 gN0l/uVmTeFdQ==
Date: Mon, 31 Aug 2026 09:58:10 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jason Pettit <jason.pettit@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Mahadevan P <mahadevan.p@oss.qualcomm.com>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Jingyi Wang <jingyi.wang@oss.qualcomm.com>, 
	Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: Add HP EliteBook X G2q 14 AI
Message-ID: <apWWTGM7vtKT08OF@baldur>
References: <20260829-glymur-send-v5-0-a11bdf6a4b66@oss.qualcomm.com>
 <20260829-glymur-send-v5-2-a11bdf6a4b66@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829-glymur-send-v5-2-a11bdf6a4b66@oss.qualcomm.com>

On Sat, Aug 29, 2026 at 12:08:09PM -0700, Jason Pettit wrote:
> Add board support for the HP EliteBook X G2q 14" Next Gen AI PC
> (product SKU C4JG0AV, board 8E91), a Snapdragon X2 Elite (Glymur)
> laptop, using the "hp,elitebook-x-g2q" / "qcom,glymur" compatible.
> 
> Enabled by this device tree:
> 
>   - internal eDP panel (samsung,atna33xc20)
>   - 2x USB Type-C with DisplayPort alt-mode and USB
>   - chassis USB-A host port (usb_mp multiport controller)
>   - internal eUSB2 host with the Elan fingerprint reader
>   - NVMe SSD on PCIe5
>   - Wi-Fi and Bluetooth
>   - HID-over-I2C keyboard, touchpad, touchscreen; lid switch
>   - Adreno GPU and GMU (Freedreno GL on Mesa)
>   - audio playback and capture
>   - real-time clock
>   - compute DSP (cDSP)
> 
> The DisplayPort outputs need the Glymur DP PHY series at runtime. This
> device tree builds without it.
> 
> The chassis HDMI jack is removed in v5. It is driven from the usb_2
> combo PHY as a DisplayPort-only instance, and that path does not come up on
> Glymur. The same failure was reported against the already-merged Asus
> Zenbook A16 (UX3607OA), which describes its usb_2 combo PHY the same way. A
> fix is in progress but not yet available.
> 

I dropped this paragraph while applying the patch.

> Assisted-by: Claude:claude-opus-4-8
> Assisted-by: Claude:claude-opus-5

This should from now on be "Assisted-by: LLM".

Regards,
Bjorn
