Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C5F486E6A;
	Thu,  1 Oct 2026 12:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856287; cv=none; b=osI/tiY9jtKTJ7/FmKJYt3pAnnfUhTOqR8ffMsdZcIC8fgvXK7QNh8HiSAPYMA69o1+MhxxZydTvrwUwshaiU6BSegft4oOB8e84vmEbuXx1l1zErpn7QCugQU7SROeYdis19If3RQvZktm4IJXOQGzpWZVMAzYPgUTbDnvYNrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856287; c=relaxed/simple;
	bh=z9/U/3C9yrseQMTRZ+gH+lBO0Mnq/RHDd9mMF3Kx0FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksYdZruk5/zi+85/ByLvE6em6d6SqK3ULWpYyXFf+emukPVmKFAgNWUavh3p9qAjwBWPWesPbhWv7VlN+cBvC2CaZXWuqQQuDy0nITmHaDY6uCD7MfehrtIuigCXMYrfooBuvnRMEaia0qCVroDWYfExNW93zUgM0T0kmweJGmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPrwRMNe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPrwRMNe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCCB1F000FF;
	Thu,  1 Oct 2026 12:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790856286;
	bh=hgUX0ii0uYxzjf7gvJ6LbuMXqEimXK9XD6l6fEYf20Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RPrwRMNeyziaNxy1CS1ZueSBS6AiEcQ1A+jWl175wRKI5L5gbEJNbGPySgltpn0xA
	 9mTG1XF1EqUaS/Qyywo/aRjV+x8Ed39TA0d0L2z0YDJan9xAErjESPO4pLLFMtUp7k
	 HlDETdYjFtMr3Wl3RF2AgpXD3XuMWsSqS9diq1ONUliPQJb8xNwwF7qPsOo7/PgTut
	 Pi8INglaVY9/afFE7ilJERMc/VUioeJG3JX6AX7+BY0OAWJ619q2BjNH2lKpG0gkJq
	 XdrgyAQyJj3GDBm9G+bXGQ4WjLJatED4SiNu7dHFhsDRjIriAXPYJ+VnU5BS2SlMmL
	 6d6iJDp1gfO8A==
Date: Thu, 1 Oct 2026 07:04:44 -0500
From: Rob Herring <robh@kernel.org>
To: Leo Yan <leo.yan@arm.com>
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
Message-ID: <20261001120444.GA1048975-robh@kernel.org>
References: <20260921232834.3138571-1-robh@kernel.org>
 <20261001100455.GL14479@e132581.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001100455.GL14479@e132581.arm.com>

On Thu, Oct 01, 2026 at 11:04:55AM +0100, Leo Yan wrote:
> Hi Rob,
> 
> On Mon, Sep 21, 2026 at 06:28:33PM -0500, Rob Herring (Arm) wrote:
> > Some static funnel nodes have APB and AT clocks. Allow one or two
> > clocks and the apb_pclk and atclk clock-names entries.
> > 
> > Assisted-by: LLM
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >
> > ---
> >  .../bindings/arm/arm,coresight-static-funnel.yaml      | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > index 9598a3d0a95b..4a3d08f9568c 100644
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > @@ -30,6 +30,16 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >  
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: apb_pclk
> > +      - const: atclk
> 
> The question is that a static funnel does not need to program any
> registers, so in theory it should only need atclk as the module's core
> clock, but not the APB programming clock (apb_pclk).
>
> Maybe I did not get this right when I initially enabled the static
> funnel in hi3660-coresight.dtsi. We should probably remove pclk from the
> static funnel node.

Yes. I suppose in theory it has some clock, but if pclk needed to be 
enabled, it is shared with all the other coresight components and 
enabled anyways. And there's no atclk defined, so 'clocks' can just 
be removed. Can you send a patch to do that, and I'll drop this one.

zynq7000 is even more of a mess I just noticed...

Rob
