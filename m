Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD72A4D37AF;
	Thu,  1 Oct 2026 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790849105; cv=none; b=sWYGn/A4rRx/WZ+6yHiJGGVvDmRqPlp4pbIXzdGpYGdg5/KVaWn0yIm4iO/7RjFEZR3G4fXub0/VJeHbwEhHMCJ34LSAKNOJortte0kkkr0TjN/Ohp8kDnEDIPZopefMakzM5Dvp5SbUiLhzeUAnqI498Pir07ORy4nOxNIbSZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790849105; c=relaxed/simple;
	bh=EsKLwztTkRBxwN/w4nnn25vqOweKjPOVm31gLdIJuPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cI2Pu/+E1QyfYxJ6F/Kcje8OpKws/ZCCw2wKVwtr7UB7JDkJlz7CB14YdtgO/G+Dc4dibPxk2ETlaoqQBCN5lf2rCWR7IONik33quVHqGEfGnbBUtnn2lqmi9t4S6hPC+ScgBjv0Ml33ccmuj8Qw1fKKXKn8gmLICZdNvTEMgnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SPgdssak; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SPgdssak"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 777C6497;
	Thu,  1 Oct 2026 03:04:54 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 752623F85F;
	Thu,  1 Oct 2026 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790849097; bh=EsKLwztTkRBxwN/w4nnn25vqOweKjPOVm31gLdIJuPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SPgdssakxaI/nLFm5XI+lkSSH4zrG9Udn9VZ8Ii2J/gmGEnwcN9Avh7pCIeaYGtn+
	 psD4muIFAfZuUPwSaS/mXqLk7UxaO90VIXZA0lrpl0NC4FeFmvA98CiJeGJogiAPXG
	 Ik6DKBFJGELumlqz+i3AwfvmMuMLAxe28ZvGHrts=
Date: Thu, 1 Oct 2026 11:04:55 +0100
From: Leo Yan <leo.yan@arm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Leo Yan <leo.yan@linux.dev>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: coresight: Allow funnel clocks
Message-ID: <20261001100455.GL14479@e132581.arm.com>
References: <20260921232834.3138571-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921232834.3138571-1-robh@kernel.org>

Hi Rob,

On Mon, Sep 21, 2026 at 06:28:33PM -0500, Rob Herring (Arm) wrote:
> Some static funnel nodes have APB and AT clocks. Allow one or two
> clocks and the apb_pclk and atclk clock-names entries.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> ---
>  .../bindings/arm/arm,coresight-static-funnel.yaml      | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> index 9598a3d0a95b..4a3d08f9568c 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> @@ -30,6 +30,16 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: apb_pclk
> +      - const: atclk

The question is that a static funnel does not need to program any
registers, so in theory it should only need atclk as the module's core
clock, but not the APB programming clock (apb_pclk).

Maybe I did not get this right when I initially enabled the static
funnel in hi3660-coresight.dtsi. We should probably remove pclk from the
static funnel node.

  clocks:
    minItems: 0
    maxItems: 1

  clock-names:
    minItems: 0
    items:
      - const: atclk

Thanks,
Leo
