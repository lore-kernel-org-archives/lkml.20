Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3EA41B362;
	Mon, 31 Aug 2026 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186019; cv=none; b=WkHJpPBjIPPCcpKas4JOYHDKCAFG0T5cNoy46lnDtULjcqIZz1Pl0ztW6e+fxCZ9u/XOHDyXnjozz8T7WEF6mQPPD1ePSOovHxods/6GoChe8RPM8XNKiQXhVKgxaxJuYJkmN+yFwbQno3IBn5I0OP3V4Pju4wSrTpHCdx8bUgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186019; c=relaxed/simple;
	bh=biYVhkFtO28r+7j+reA+gcMEJeS5ra+83YJv/eUxk2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahbV4nrS6S9zMZ63Mo5n7e6ZGIHacZhxSFdveyYMnWM+7vJnu9zTSip8pz8i9lycsu5/Qv7FaVchvFL8W2hnyeblShf+ZNhdeEu1EhtioJsqBz73lSzzYhrOC1jdo+5JJoSfwwu+u9QBFfIAE/ykrIapl6Mqvb1yACTdlR/+ugY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XVtXf3Ai; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XVtXf3Ai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94A31F000E9;
	Mon, 31 Aug 2026 14:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788186017;
	bh=7+rdhKp2I28DH6fAQPVY9ON3ORgsCf4pgIBJNXPjRz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XVtXf3AixinZmDucIRgKxfMHu1Rm9IoCDEIyKBjKRORKb2a3zqOAAu1eFi8YQGbrt
	 /8IT+Rw8IEF1+l8vjJX9EPYCXOB0rbtid2UCGPSjk1hC+zdW2A5Fu/ToATDeJwNVOu
	 /HqOQ2wIN4DW1/KpuAH6sMme/kiP0DSnHiKwlvG5cXwqkCpbI4LqBjE/BtReEnCCyA
	 3KKLBk23YTWMvWhtl5ayM1aMRDmQJfT+aleQJxMMCZSS8ZWGBE4VpHK9if7pwGNICt
	 v5G3YnFQw/epbL/OSTBBT7q28iGWzWsWu0JG1pqclvOLQ56J1vI1TksNeOkgsmltti
	 sEZ8QoOBZQALw==
Date: Mon, 31 Aug 2026 09:20:14 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: hamoa-crd: Add thermal control
Message-ID: <apWIbtyQQ4mOjZKn@baldur>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-2-27108c40fba5@oss.qualcomm.com>
 <apVCUObyxf8Akbsc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apVCUObyxf8Akbsc@linaro.org>

On Mon, Aug 31, 2026 at 10:58:56AM +0200, Stephan Gerhold wrote:
> On Sun, Aug 30, 2026 at 09:02:03PM +0000, Bjorn Andersson wrote:
> > The "limits" hardware performs rapid thermal management of the CPU
> > cores, but during prolonged CPU usage the system's overall temperature
> > need to be further managed by software.
> > 
> > The reference design provides seven "system thermistors", connected to
> > the PMK8550 VADC. Particularly interesting is the "keyboard hotspot
> > thermistor", which is wired up to sys_therm1.
> > 
> > Use this to throttle the CPUs, in the same way that we're throttling
> > previous generation laptops based on "skin-temp". The trips are chosen
> > from those existing examples, but are comparable with the ACPI thermal
> > policy.
> > 
> 
> In general, following the ACPI thermal policy as close as possible is
> better than following existing examples. Most X1E-based devices use
> hybrid active/passive cooling, with the fan controlled independently by
> the EC. If you start throttling even just 1-2°C before the EC reaches
> its highest fan trip point, it will result in bad performance. Linux
> will try to keep the temperature below the specified temperature, and
> the EC will never fully ramp up the fan.
> 

That's certainly true. On X13s it was a bit easier as it's passively
cooled, but these things needs to be taken into consideration.

> This is what I determined from the CRD ACPI tables last year:
> https://github.com/stephan-gh/linux/commit/24f053436ec2eaf70968803adfa8c17905e53cae.patch
> 

Why don't you post your patches!? Have I missed it?

> The fact that GPU is only throttled based on back-thermal is a little
> odd, but this is what the ACPI tables specified back then as far as
> I could tell (maybe it was fixed since then).
> 
> Your changes seem close enough to not cause the performance problem
> I mentioned above, although I think it would be worth setting a good
> examples for others to follow.
> 

Sure, I'll compare with ACPI tables and adjust the numbers accordingly.

> > While not used for cooling/throttling, also add the other thermal zones
> > for temperature reporting purposes.
> > 
> > Enable thermal-monitor mode for all 7 channels in the ADC.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 116 ++++++++++++++++++++++++++++++
> >  1 file changed, 116 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > index 429deffcf3e9..065af18357d7 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > @@ -11,6 +11,92 @@
> >  / {
> >  	model = "Qualcomm Technologies, Inc. X1E80100 CRD";
> >  	compatible = "qcom,x1e80100-crd", "qcom,x1e80100";
> > +
> > +	thermal-zones {
> > +		soc-thermal {
> > +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> > +		};
> > +
> > +		keyboard-thermal {
> > +			polling-delay-passive = <250>;
> > +
> > +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> > +
> > +			trips {
> > +				skin_alert0: trip-point0 {
> > +					temperature = <55000>;
> > +					hysteresis = <1000>;
> > +					type = "passive";
> > +				};
> > +
> > +				skin_alert1: trip-point1 {
> > +					temperature = <58000>;
> > +					hysteresis = <1000>;
> > +					type = "passive";
> > +				};
> 
> What does this second trip point do differently than the first? It has
> the same cooling devices. Will it try throttling "harder" than before?
> 
> I know sc8280xp-lenovo-thinkpad-x13s.dts has the same, but I'm not
> entirely sure what it does there either.
> 
> My experience was if you specify 55°C as one passive trip point, then
> Linux will try its best to keep it with the specified cooling devices.
> 

I didn't dive into this rabbit hole... I'll review and update
accordingly.

> > +
> > +				skin-crit {
> > +					temperature = <73000>;

Your patch has 115C here. That may be what the ACPI tables are saying,
but it seems a bit excessive.

> > +					hysteresis = <1000>;
> > +					type = "critical";
> > +				};
> > +			};
> > +
> > +			cooling-maps {
> > +				map0 {
> > +					trip = <&skin_alert0>;
> > +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > +				};
> > +
> > +				map1 {
> > +					trip = <&skin_alert1>;
> > +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > +				};
> > +			};
> > +		};
> > +
> > +		backcover-thermal {
> > +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> > +		};
> 
> Should we add throttling here as well to match Windows?
> 

Then there are the reports that indicate that we should throttle things
when the SMB temperatures reaches something like 80C, which doesn't seem
to be something represented in the ACPI tables.

I'll do a respin of this and then we can tweak it from there. The
important thing for me is to get some reference in, so we can propagate
this to the consumer devices (NB: which doesn't have the same sys_therm
mapping).

Thanks,
Bjorn

> Thanks,
> Stephan
