Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B43353A72;
	Mon, 31 Aug 2026 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788200051; cv=none; b=eUipcrk4Qlws1XdyLFS7lAnDkMXG7ZPt/mF+FuEcu2QuqLypK+hdUR/UPWO06buPRy6KpJyzEy2D+pgwUNxuWkXA2WP500gFXmEIKcsv32JPajMKqcxVjbh4Bkc9RCGov/IeZd+6r5gb7l7hrJsBkTHNg/Rjd/l/KqT93S25EP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788200051; c=relaxed/simple;
	bh=uM6pfgKMfCnm5wrr3jkyPDqI9xu45ON7S/4W1OmpN9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOh3VRqxJibT+Wn0OWbZstnBi0rbO7AEhlaEf8E48P9kARa4nlplvcWnSOyYHFz0VrsphMceLwUrde/O1Eh6dScjw8Yo4cAsbhLPoEvPXe3YYivff03GGRYB0EtiGkoFXxC9qt2H2QG4TgRc3mR810izoFase24LLkMFKVwZrWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SutvE+gp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SutvE+gp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E931F000E9;
	Mon, 31 Aug 2026 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788200049;
	bh=uV+FkBfMYnnmekb+siXzK5nCUqVn7XUFrIag5Mefilk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SutvE+gpDj5AUVefME+Trr3vjkmRTBoTPtsYnKp/pKjCd6nID6bKiaQiZEl2SjIQt
	 nj/DPuI2kQs/p6T43lthTeJRd20sMnifFFizwVJwIi/spPuxgz+FpSpjzaqAG275Uc
	 aDRy6oVn44UmaIUf3OaQ3qf1j56cSdazgs912Ccv4G5oWfrXmm+Q8Mj3RnQVldNJFL
	 D3nwl0rnq8oA+iYoGPCe5b8J2xpZ/jDTo/BvUt7q4vjA5olvPGZkwEs8T1UxvP8+pF
	 PQXZ/tlLuOLmHAVINjn/e4oitdvLCn6r9zuNvyqO5tXK92yjAzLY+CP9yqItCDuNFW
	 GfRgmkrhi7zEg==
Date: Mon, 31 Aug 2026 13:14:06 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: hamoa-crd: Add thermal control
Message-ID: <apXBxvBlgWa3xfEQ@baldur>
References: <20260830-hamoa-sys-therm-v1-0-27108c40fba5@oss.qualcomm.com>
 <20260830-hamoa-sys-therm-v1-2-27108c40fba5@oss.qualcomm.com>
 <apVCUObyxf8Akbsc@linaro.org>
 <apWIbtyQQ4mOjZKn@baldur>
 <apWnounPP8kRxFeb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <apWnounPP8kRxFeb@linaro.org>

On Mon, Aug 31, 2026 at 06:11:14PM +0200, Stephan Gerhold wrote:
> On Mon, Aug 31, 2026 at 09:20:14AM -0500, Bjorn Andersson wrote:
> > On Mon, Aug 31, 2026 at 10:58:56AM +0200, Stephan Gerhold wrote:
> > > On Sun, Aug 30, 2026 at 09:02:03PM +0000, Bjorn Andersson wrote:
> > > > The "limits" hardware performs rapid thermal management of the CPU
> > > > cores, but during prolonged CPU usage the system's overall temperature
> > > > need to be further managed by software.
> > > > 
> > > > The reference design provides seven "system thermistors", connected to
> > > > the PMK8550 VADC. Particularly interesting is the "keyboard hotspot
> > > > thermistor", which is wired up to sys_therm1.
> > > > 
> > > > Use this to throttle the CPUs, in the same way that we're throttling
> > > > previous generation laptops based on "skin-temp". The trips are chosen
> > > > from those existing examples, but are comparable with the ACPI thermal
> > > > policy.
> > > > 
> > > 
> > > In general, following the ACPI thermal policy as close as possible is
> > > better than following existing examples. Most X1E-based devices use
> > > hybrid active/passive cooling, with the fan controlled independently by
> > > the EC. If you start throttling even just 1-2°C before the EC reaches
> > > its highest fan trip point, it will result in bad performance. Linux
> > > will try to keep the temperature below the specified temperature, and
> > > the EC will never fully ramp up the fan.
> > > 
> > 
> > That's certainly true. On X13s it was a bit easier as it's passively
> > cooled, but these things needs to be taken into consideration.
> > 
> > > This is what I determined from the CRD ACPI tables last year:
> > > https://github.com/stephan-gh/linux/commit/24f053436ec2eaf70968803adfa8c17905e53cae.patch
> > > 
> > 
> > Why don't you post your patches!? Have I missed it?
> >
> 
> No, you haven't missed it. I wanted to send them back when I wrote them
> (early 2025), but unfortunately the PMIC5 Gen3 ADC patches then blocked
> sending it for almost 1.5 years... :/
> 

I agree, that took way too long - and we lost all momentum on the
continuation thereof (i.e. this patch...)

> I lost track of the long ongoing series at some point and nowadays
> I don't even have a CRD to test on anymore, that's why my patch is sadly
> stuck in the archive.
>  

That unfortunately makes sense.

> > > The fact that GPU is only throttled based on back-thermal is a little
> > > odd, but this is what the ACPI tables specified back then as far as
> > > I could tell (maybe it was fixed since then).
> > > 
> > > Your changes seem close enough to not cause the performance problem
> > > I mentioned above, although I think it would be worth setting a good
> > > examples for others to follow.
> > > 
> > 
> > Sure, I'll compare with ACPI tables and adjust the numbers accordingly.
> > 
> 
> Thanks!
> 
> As far as I remember, ACPI has separate thresholds for each of the EC
> fan profiles (see [1]). I don't think we can model dynamic temperature
> thresholds in the DT, so we'll have to pick some default. IIRC the
> default is "best performance without charger", which - back then - was
> the 326 kelvin (~53°C) I used in my patch.
> 

There's another level of dynamic thermal management needed for that.
It's my understanding that thermald is expected to fill that gap...

> [1]: https://lore.kernel.org/linux-arm-msm/20260728-ec_add_more_commands-v1-3-771abd65ee1a@oss.qualcomm.com/
> 
> > > > While not used for cooling/throttling, also add the other thermal zones
> > > > for temperature reporting purposes.
> > > > 
> > > > Enable thermal-monitor mode for all 7 channels in the ADC.
> > > > 
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 116 ++++++++++++++++++++++++++++++
> > > >  1 file changed, 116 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > > index 429deffcf3e9..065af18357d7 100644
> > > > --- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > > +++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
> > > > @@ -11,6 +11,92 @@
> > > >  / {
> > > >  	model = "Qualcomm Technologies, Inc. X1E80100 CRD";
> > > >  	compatible = "qcom,x1e80100-crd", "qcom,x1e80100";
> > > > +
> > > > +	thermal-zones {
> > > > +		soc-thermal {
> > > > +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> > > > +		};
> > > > +
> > > > +		keyboard-thermal {
> > > > +			polling-delay-passive = <250>;
> > > > +
> > > > +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> > > > +
> > > > +			trips {
> > > > +				skin_alert0: trip-point0 {
> > > > +					temperature = <55000>;
> > > > +					hysteresis = <1000>;
> > > > +					type = "passive";
> > > > +				};
> > > > +
> > > > +				skin_alert1: trip-point1 {
> > > > +					temperature = <58000>;
> > > > +					hysteresis = <1000>;
> > > > +					type = "passive";
> > > > +				};
> > > 
> > > What does this second trip point do differently than the first? It has
> > > the same cooling devices. Will it try throttling "harder" than before?
> > > 
> > > I know sc8280xp-lenovo-thinkpad-x13s.dts has the same, but I'm not
> > > entirely sure what it does there either.
> > > 
> > > My experience was if you specify 55°C as one passive trip point, then
> > > Linux will try its best to keep it with the specified cooling devices.
> > > 
> > 
> > I didn't dive into this rabbit hole... I'll review and update
> > accordingly.
> > 
> 
> Thanks!
> 
> > > > +
> > > > +				skin-crit {
> > > > +					temperature = <73000>;
> > 
> > Your patch has 115C here. That may be what the ACPI tables are saying,
> > but it seems a bit excessive.
> > 
> 
> I agree, feel free to change that.
> 
> > > > +					hysteresis = <1000>;
> > > > +					type = "critical";
> > > > +				};
> > > > +			};
> > > > +
> > > > +			cooling-maps {
> > > > +				map0 {
> > > > +					trip = <&skin_alert0>;
> > > > +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > > > +				};
> > > > +
> > > > +				map1 {
> > > > +					trip = <&skin_alert1>;
> > > > +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> > > > +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > > > +				};
> > > > +			};
> > > > +		};
> > > > +
> > > > +		backcover-thermal {
> > > > +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> > > > +		};
> > > 
> > > Should we add throttling here as well to match Windows?
> > > 
> > 
> > Then there are the reports that indicate that we should throttle things
> > when the SMB temperatures reaches something like 80C, which doesn't seem
> > to be something represented in the ACPI tables.
> > 
> 
> Windows has quite some extra logic in the PEP driver that does
> additional fine-grained throttling based on PMIC die temperatures,
> battery current, power source / battery percentage and other factors.
> Unfortunately, I never fully understood how that works, but it may be
> handled in there.
> 

Yes, there are additional layers there, both in PEP and Windows.

> > I'll do a respin of this and then we can tweak it from there. The
> > important thing for me is to get some reference in, so we can propagate
> > this to the consumer devices (NB: which doesn't have the same sys_therm
> > mapping).
> > 
> 
> Thanks!
> 
> I have been working on finishing up my corresponding patch for the T14s
> (which is something I can still test unlike the CRD). That one is
> unfortunately currently stuck because the SYS_THERMx mapping really is
> different from the CRD and even the schematics are not sufficient to
> understand where each sensor is located. The mapping seems to be
> different from the CRD, unfortunately.
> 

Yes, each design have their own sensor setup, but at least if we land
this we have a reference for the mechanism.

Would certainly be nice to get the T14s pieces landed though. And I
would consider it to be perfectly fine to not fully replicate the
Windows/ACPI setup - since we don't have the additional layers.

I did peek at the Dell XPS13 DSDT and I see the same problem there.

> The ACPI side is also extra tricky because it takes the thermal
> thresholds for the thermal zones through some lookup table in a random
> firmware memory region, which is also applied depending on the selected
> fan profile (for the T14s: "low power", "balanced", "performance").

I think we need to just treat the current ACPI situation as
"inspiration", do some measurements and provide something that seems to
work for DT/Linux.

And if nothing else, it's going to be way better than what we have now
(i.e. nothing).

> I had some luck with using PowerShell on Windows to obtain the computed
> ACPI values using
> 
>   Get-CimInstance -Namespace "root/wmi" -ClassName MSAcpi_ThermalZoneTemperature
> 
> With that I could see the thresholds (PassiveTripPoint) changing when I
> change the power profile in Windows.
> 
> For fun I had LLM create this PowerShell script that directly outputs DT
> snippets, although unfortunately the missing part is actually mapping
> the thermal zones to their purpose (right now it outputs zones like
> qcom0658-1-0-thermal or even just tz73-0-thermal).
> 
> Just sharing it for reference below.
> 

Thanks for sharing.

Thanks,
Bjorn

> Thanks,
> Stephan
> 
> ---
> <#
> .SYNOPSIS
>     Exports Windows WMI MSAcpi_ThermalZoneTemperature instances to Linux Devicetree (DTS) format.
> 
> .DESCRIPTION
>     Queries the 'root\wmi' namespace for ACPI thermal zone instances and translates
>     temperatures, passive/active/critical trip points, and sampling rates into Linux
>     kernel thermal zone DTS nodes.
> 
> .PARAMETER OutputFile
>     Optional file path to save the generated DTS nodes. If omitted, prints directly to stdout.
> 
> .EXAMPLE
>     .\Convert-AcpiToDts.ps1
> 
> .EXAMPLE
>     .\Convert-AcpiToDts.ps1 -OutputFile "thermal_zones.dtsi"
> #>
> [CmdletBinding()]
> param (
>     [Parameter(Mandatory = $false, Position = 0)]
>     [string]$OutputFile
> )
> 
> function ConvertTo-Millicelsius ([uint32]$tenthsKelvin) {
>     # ACPI trip points of 0, >= 65535 (0xFFFF), or <= 2732 (<= 0°C) are uninitialized/disabled
>     if ($tenthsKelvin -le 2732 -or $tenthsKelvin -ge 65535) {
>         return $null
>     }
>     return [long]($tenthsKelvin * 100) - 273150
> }
> 
> function Get-DTNames ([string]$instanceName) {
>     # Sanitize instance name (e.g. "ACPI\QCOM0658\0_0" -> "qcom0658-0-0")
>     $parts = $instanceName -split '\\'
>     if ($parts.Count -ge 3) {
>         if ($parts[1] -ieq "ThermalZone") {
>             $raw = $parts[2]
>         } else {
>             $raw = "$($parts[1])-$($parts[2])"
>         }
>     } else {
>         $raw = $parts[-1]
>     }
> 
>     $cleanNode = ($raw.ToLower() -replace '_', '-' -replace '[^a-z0-9-]', '') -replace '-thermal$', ''
>     $cleanLabel = $cleanNode -replace '-', '_'
> 
>     return @{
>         NodeName  = "${cleanNode}-thermal"
>         BaseName  = $cleanNode
>         LabelName = $cleanLabel
>     }
> }
> 
> # Fetch CIM instances safely into an array
> $zones = @(Get-CimInstance -Namespace "root/wmi" -ClassName MSAcpi_ThermalZoneTemperature -ErrorAction SilentlyContinue)
> 
> if ($zones.Count -eq 0) {
>     Write-Error "No MSAcpi_ThermalZoneTemperature instances found in root\wmi."
>     return
> }
> 
> $dtsNodes = [System.Collections.Generic.List[string]]::new()
> 
> foreach ($zone in $zones) {
>     $names     = Get-DTNames $zone.InstanceName
>     $nodeName  = $names.NodeName
>     $baseName  = $names.BaseName
>     $labelName = $names.LabelName
> 
>     # Check for passive trip point
>     $psvMC      = ConvertTo-Millicelsius $zone.PassiveTripPoint
>     $hasPassive = ($null -ne $psvMC)
> 
>     # Collect valid trip points
>     $tripsList = [System.Collections.Generic.List[string]]::new()
>     $tripIndex = 0
> 
>     # 1. Passive Trip Point (_PSV)
>     if ($hasPassive) {
>         $tripsList.Add("        ${labelName}_alert${tripIndex}: trip-point${tripIndex} {")
>         $tripsList.Add("            temperature = <${psvMC}>;")
>         $tripsList.Add("            hysteresis = <1000>;")
>         $tripsList.Add("            type = `"passive`";")
>         $tripsList.Add("        };")
>         $tripIndex++
>     }
> 
>     # 2. Active Trip Points (_AC0.._ACx)
>     if ($zone.ActiveTripPointCount -gt 0 -and $zone.ActiveTripPoint) {
>         for ($i = 0; $i -lt $zone.ActiveTripPointCount; $i++) {
>             $acMC = ConvertTo-Millicelsius $zone.ActiveTripPoint[$i]
>             if ($null -ne $acMC) {
>                 $tripsList.Add("        ${labelName}_active${i}: trip-point${tripIndex} {")
>                 $tripsList.Add("            temperature = <${acMC}>;")
>                 $tripsList.Add("            hysteresis = <1000>;")
>                 $tripsList.Add("            type = `"active`";")
>                 $tripsList.Add("        };")
>                 $tripIndex++
>             }
>         }
>     }
> 
>     # 3. Critical Trip Point (_CRT)
>     $crtMC = ConvertTo-Millicelsius $zone.CriticalTripPoint
>     if ($null -ne $crtMC) {
>         $tripsList.Add("        ${baseName}-critical {")
>         $tripsList.Add("            temperature = <${crtMC}>;")
>         $tripsList.Add("            hysteresis = <1000>;")
>         $tripsList.Add("            type = `"critical`";")
>         $tripsList.Add("        };")
>     }
> 
>     # Assemble thermal zone node
>     $nodeLines = [System.Collections.Generic.List[string]]::new()
>     $nodeLines.Add("${nodeName} {")
>     $nodeLines.Add("    thermal-sensors = <&placeholder_sensor>; /* Replace with target sensor phandle */")
> 
>     # Include polling-delay-passive ONLY if a passive trip point exists
>     if ($hasPassive) {
>         $pollingPassiveMs = if ($zone.SamplingPeriod -gt 0) { $zone.SamplingPeriod * 100 } else { 1000 }
>         $nodeLines.Add("    polling-delay-passive = <${pollingPassiveMs}>;")
>     }
> 
>     # Include trips {} block ONLY if trip points exist
>     if ($tripsList.Count -gt 0) {
>         $nodeLines.Add("")
>         $nodeLines.Add("    trips {")
>         foreach ($line in $tripsList) {
>             $nodeLines.Add($line)
>         }
>         $nodeLines.Add("    };")
>     }
> 
>     $nodeLines.Add("};")
>     $dtsNodes.Add(($nodeLines -join "`n"))
> }
> 
> $finalOutput = $dtsNodes -join "`n`n"
> 
> if (-not [string]::IsNullOrWhiteSpace($OutputFile)) {
>     $finalOutput | Out-File -FilePath $OutputFile -Encoding utf8
>     Write-Host "Successfully exported Devicetree thermal zones to: $OutputFile" -ForegroundColor Green
> } else {
>     $finalOutput
> }
