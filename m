Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD974C681C;
	Thu,  3 Sep 2026 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447708; cv=none; b=joCWnjheFa8OAvmyUV39/xjGBG4CWdExnBEWa15mDLhDEsfLtmw7GxAVVuFccL+5Sa7cMBhzUf9CIKW+MR5ez7O9foqdIa/fOEpF5XcO3fyUH62d0XUzPZzu+/FmdoxQeFLKOQOYjqHI1ayngEaHwSXzJWgQlHkJwnBqOiUC5yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447708; c=relaxed/simple;
	bh=YcfeFDNO0Y5VfaPsx59OQeI0g2enu4ZxgxDoVbgIHhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VsGAKDeBJh+pUQO5oZxB8Jpjm/0H4Qjtm0NaDMI7VrJuFzvXyAZVsf2PCKnrtYtG+4tMxbzXEEst3ROGFa9iSHY+LAkgAWWBehsTWhsg4F4f58ncgZPjY8C4UQeTDhMeXN9IeYCHZr1oCQHsWOWHRYMGoH+nYQxf5WCLSbJnWwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KscKu99S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KscKu99S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9E11F000E9;
	Thu,  3 Sep 2026 15:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788447706;
	bh=2sEPcsksdfxmQZhCNsW8OtFfleaAGT/TwUXbEEQQtjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KscKu99ShQiwCg6Oxyu8AGSgaypsdwNSsFGlNFGhUyfhgOOnYNhkxMsyBskOvPQeW
	 j+uTwOaekHqZ4xjDI7WMyIX3251JEcApRjJoZccWJDIcLWB68Wt72toIYzzLC8xT9v
	 tzWRvp3F2fW7aK4EoMth1554Gv70oZwPr+5JGUyyQlP7skvLuV8+2f8Jd4ZXQyJ6Bf
	 SjsQiUwL7CgllMo5C9E71ymIDEv2t9h7MhzEEqW99d7A6BP6KUCVKQKoT08UqIn4rc
	 4lR6egDHQmtJq4k3MGPPFmPCYANULMqZSdQ64V/1pBjuHQT0c6HHDIONdY2kkm5tTb
	 yb65+2X+H0mTQ==
Date: Thu, 3 Sep 2026 10:01:42 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add parent
 supply for regulators
Message-ID: <apmLYmMgGZVhqU8o@baldur>
References: <20260901-fp4-regulator-supply-v1-0-68288ab70aee@fairphone.com>
 <20260901-fp4-regulator-supply-v1-4-68288ab70aee@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-fp4-regulator-supply-v1-4-68288ab70aee@fairphone.com>

On Tue, Sep 01, 2026 at 10:58:59AM +0200, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.
> 

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
starts with "Describe your problem.". Is there an actual problem observed?

I've been told that rpmh will have your back here, so you should not
need to explicitly vote for these resources from Linux.

Regards,
Bjorn

> The regulators s4a and s6a are a bit special. They feed back into
> PM6350, but are not modelled as regulators (or anything else?), so they
> also can't be added as vdd-*-supply. It would seem to be possible to add
> them with their "Default on booting voltage" from the PM6350 Data Sheet
> in the dts, but I'm not sure this is desired.
> 
> And document what the "missing" regulators are used for.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 46 +++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 5d20ad93b0c5..a1556d802a8b 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -78,6 +78,17 @@ lcdb_dummy: regulator-lcdb-dummy {
>  		regulator-max-microvolt = <5500000>;
>  	};
>  
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
>  	reserved-memory {
>  		/*
>  		 * The rmtfs memory region in downstream is 'dynamically allocated'
> @@ -296,6 +307,15 @@ &adsp {
>  &apps_rsc {
>  	regulators-0 {
>  		compatible = "qcom,pm6350-rpmh-regulators";
> +
> +		vdd-l2-l5-l7-supply = <&vreg_s2a>;
> +		vdd-l3-l6-l8-l9-l10-supply = <&vreg_bob>;
> +		vdd-l11-supply = <&vreg_s2a>;
> +		vdd-l12-l14-supply = <&vreg_s2a>;
> +		vdd-l15-l19-l22-supply = <&vreg_s8e>;
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +
>  		qcom,pmic-id = "a";
>  
>  		vreg_s1a: smps1 {
> @@ -310,6 +330,14 @@ vreg_s2a: smps2 {
>  			regulator-max-microvolt = <2048000>;
>  		};
>  
> +		/*
> +		 * s3a (smps3) is gfx.lvl
> +		 * s4a (smps4) is supply for vdd-l4 & vdd-l13
> +		 * s5a (smps5) is mx.lvl
> +		 * s6a (smps6) is supply for vdd-l16 & vdd-l18-l20-l21
> +		 * l1a (ldo1) is lcx.lvl
> +		 */
> +
>  		vreg_l2a: ldo2 {
>  			regulator-name = "vreg_l2a";
>  			regulator-min-microvolt = <1503000>;
> @@ -408,6 +436,8 @@ vreg_l16a: ldo16 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> +		/* l17a (ldo17) is lmx.lvl */
> +
>  		vreg_l18a: ldo18 {
>  			regulator-name = "vreg_l18a";
>  			regulator-min-microvolt = <788000>;
> @@ -446,8 +476,24 @@ vreg_l22a: ldo22 {
>  
>  	regulators-1 {
>  		compatible = "qcom,pm6150l-rpmh-regulators";
> +
> +		vdd-bob-supply = <&vph_pwr>;
> +		vdd-l1-l8-supply = <&vreg_s2a>;
> +		vdd-l2-l3-supply = <&vreg_s8e>;
> +		vdd-l4-l5-l6-supply = <&vreg_bob>;
> +		vdd-l7-l11-supply = <&vreg_bob>;
> +		vdd-l9-l10-supply = <&vreg_bob>;
> +		vdd-s8-supply = <&vph_pwr>;
> +
>  		qcom,pmic-id = "e";
>  
> +		/*
> +		 * s1e-s2e (smps1-smps2) is cx.lvl
> +		 * s3e-s4e (smps3-smps4) is VDD_APC1
> +		 * s5e (smps5) is VDD_APC0
> +		 * s6e-s7e (smps6-smps7) is mss.lvl
> +		 */
> +
>  		vreg_s8e: smps8 {
>  			regulator-name = "vreg_s8e";
>  			regulator-min-microvolt = <313000>;
> 
> -- 
> 2.55.0
> 
