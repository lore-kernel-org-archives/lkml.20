Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A56136F905;
	Wed, 30 Sep 2026 19:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790797916; cv=none; b=gpFUomJkOnQ2UJO0Hq0UsX1haEE+WIDzEo9XvmW6Yhay58O6MUfGa/HGXMI2f9qDBs9rYmDiGSOb8SCONOaN1OCIe6IQgcQ1M4dXBhTEbVYL6hrg6wx3d60xLxc6q7vZcM7aqcPWeERM7wdkbIMavBniew64/1Ax0SYHeYYzDRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790797916; c=relaxed/simple;
	bh=NhxM4UqhslSqa1VkpyB5jCc/+9YKTzpQRCMy05JfkcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SOxGlY5cAYNeSOGcoLPX0ANqPY1tfapBOb6hh3yDyjN8rABQ0g7rsODk3nWoPoWp/Y4gSvq9OdNZSph1j2nW+qKlX3NVnR8/BtQ53GpeYnFK/wlFgljuJvOhoDB0LHAWi8an/GFV9Scx+dOncFuQjRoSAY1wF+OuuMGPtF/8i14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQB13SRo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQB13SRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E9B1F000FF;
	Wed, 30 Sep 2026 19:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790797912;
	bh=ooIxBiCOx4IuVPZIEVOfeO3dfKf6qaESNSTxFZYP1eQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TQB13SRoF6jm8Ge0YzZdAYNBRlN0H55Fh0HELy+g6ksXIBls1vFhZGav9JH2GpkVm
	 zE2NSn0jzOIZUtx2NHzaNOmGvGxBHZfKPBaGaiA4SKLoUDFUCklPIA5CDxb6qyzJGf
	 8CxIBvT4mhfu4+HAfHXYH7WHkNf02f8aiNDRHV7NheVn7ZX1OVo09EMKk7V4m4rRv/
	 srobjsODfOUyu7+iFdpzJs+UYIdLPzHNaY4WgsCeaC9+X054FyV1DdUprthK/4mVzN
	 B8LdVFLU0CJXAKM5dqrcuaCELu0PMCm0Kyr6ztumY2sP6ddMOim2dLBt3YUHgUgKdP
	 HTNmLO1dxfLGw==
Date: Wed, 30 Sep 2026 14:51:51 -0500
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI
 compatible
Message-ID: <20260930195151.GA3971425-robh@kernel.org>
References: <20260923191526.2206628-1-robh@kernel.org>
 <20260924140300.GE453446@google.com>
 <20260925121138.GB677989-robh@kernel.org>
 <20260928172306.GB2112133@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928172306.GB2112133@google.com>

On Mon, Sep 28, 2026 at 06:23:06PM +0100, Lee Jones wrote:
> On Fri, 25 Sep 2026, Rob Herring wrote:
> 
> > On Thu, Sep 24, 2026 at 03:03:00PM +0100, Lee Jones wrote:
> > > On Wed, 23 Sep 2026, Rob Herring (Arm) wrote:
> > > 
> > > > Use the hisilicon,hi6421-spmi compatible documented by the in-tree DTS
> > > > and matched by the Hi6421 SPMI PMIC driver.
> > > > 
> > > > Assisted-by: LLM
> > > > Fixes: dee8a4e807dc ("dt-bindings: mfd: Convert hisilicon,hi6421-pmic to DT schema")
> > > 
> > > What is this commit?  I don't see it anywhere.
> > 
> > Uhh, that's the wrong commit. I'd just drop it. This binding started off 
> > in staging. Originally the compatible was wrong, but the example was 
> > right. Then the example was 'fixed'. 
> 
> Drop the tag or the patch?

Sorry, drop the Fixes tag.

Rob
