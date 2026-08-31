Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC44432BC2;
	Mon, 31 Aug 2026 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193212; cv=none; b=lHUvzqHuMSYVOeUfyeFZ1SpGk3HlAacLoiN8oGClQggDHobztGz3ysQ10k2a9Od3EsgLWg9cczcEKQ54hKImFectBM2RKl8LNdEE6lXf3ioEzZE11WZp9sv+SjLF92ZePeqe7wOVxxOM9f+VTZSAq6WZGrNHchWggay/cIcorT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193212; c=relaxed/simple;
	bh=z+QHq+JkjMq/Wco3tLPYi5i0n2y2JCZL16FiNLnPCLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jul9Bl9JZZKv5hXlyxNK/c5mo/+WaB3nC/iy+oI2KE8LY8B76ka7l03KMT0+XhbHP/oZJR8DLruK7IplYdcTkUhaNCY9n3ayTE+FpEIEpXUvKG5Kl4ycvqj0uM4ewOMigRBswy9dSvZwHVHzMW6K7apM3lQhqstS9Bi0xHViH1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjBsFz2i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjBsFz2i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4081F00A3E;
	Mon, 31 Aug 2026 16:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788193211;
	bh=FvxpthqK1KyYRpT5gYHZfq8MT1m9QjF24I0cPKWQfS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hjBsFz2i7+1eL6AyeF3Lydy5I7UVl2aGWC7HTStT5AQ0fTryRieK+DEhXoPVLyBUV
	 cxCOZiDVCIDw4ok6OoBF4A7jSYsCnuBoJIR0e6CqWDaJIPkPHAayZGA+kR5KMVUnQW
	 kQgR9aFXjeK71Id4yN+qeV/VKbiyz5zVOi2+jEYAlbObtAgJBK0u5qwydMnV+JNyhj
	 r5HvO9oGB0p4d1ZQVkbZ/4lWNKHUJzUa5Dz85b13Uhn4mB4IdMOOEjE4RYB0Lp2I6V
	 GMVXjzqxpuzaM2Uo7FvyaadqlMfyqyTaH6f9Occh30DZxkJOOZHxjg0gGpT60v6ckd
	 K+aLyEAPLn0yQ==
Date: Mon, 31 Aug 2026 11:20:07 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: pm8005: Add pmic cooling maps
Message-ID: <apWpLRl38UMlbaty@baldur>
References: <20260810-shikra-pmic-die-v1-1-b4ba21f254a0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-shikra-pmic-die-v1-1-b4ba21f254a0@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 10:43:08AM +0530, Dipa Ramesh Mantre wrote:
> Add CPU mitigation cooling maps for pm8005 PMIC die temperature.
> Throttle LITTLE (cpu0) and big (cpu3) clusters at 105°C and 125°C
> trip points.
> 

https://docs.kernel.org/process/submitting-patches.html#describe-your-changes:

Describe your problem. Whether your patch is a one-line bug fix or 5000
lines of a new feature, there must be an underlying problem that
motivated you to do this work. Convince the reviewer that there is a
problem worth fixing and that it makes sense for them to read past the
first paragraph.

> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm8005.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8005.dtsi b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> index ce31a8545020..820d213b1cb2 100644
> --- a/arch/arm64/boot/dts/qcom/pm8005.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8005.dtsi
> @@ -3,10 +3,12 @@
>  
>  #include <dt-bindings/spmi/spmi.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/thermal/thermal.h>
>  
>  / {
>  	thermal-zones {
>  		pm8005-thermal {
> +			polling-delay-passive = <200>;
>  			thermal-sensors = <&pm8005_tz>;
>  
>  			trips {
> @@ -28,6 +30,20 @@ pm8005_trip2: trip2 {
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&pm8005_trip0>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +
> +				map1 {
> +					trip = <&pm8005_trip1>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  	};
>  };
> 
> ---
> base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
> change-id: 20260809-shikra-pmic-die-a6a43e17c1bc
> prerequisite-message-id: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
> prerequisite-patch-id: 7c371f4d9b9af04a9765b0b5b084c498e8979fb6
> prerequisite-patch-id: dde0d9ae1d46c16407cfcfa818dd427904748af8
> prerequisite-patch-id: aebf50762e984054665421a5a962e919947b16f7
> prerequisite-patch-id: 6f74cc35e7368d525d7f7ebe6342f5d3c82f9d0f

I'm guessing since you depend on some feature branch called "adc
support" this patch can't be applied. Work with your peers to land your
dependencies and then build and TEST on the clean upstream branch.

Thanks,
Bjorn

> 
> Best regards,
> -- 
> Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> 
