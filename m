Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85FC4EC648;
	Mon, 28 Sep 2026 17:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616197; cv=none; b=X81x7kFP0/ZTC2kJy+GWT00+6wSp5DWllac96qy/68g8H83kQJGVE1F72Ft/BsU/z4zX4EqifAb0BHSiAd5eFfxQVMJ+nQyhHBV9jJR/sK8Mx3kaTRTEcfximGvVNn5Bo5mtSt8p5wVN2gzKFPIg7ZRt0iNyHZEzvod2qt0r4qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616197; c=relaxed/simple;
	bh=gT+OrgPJZrNHS/W/b5/de1OICIPAA95Fb2wjwntHdkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZA5LeIKr/rBAGMITf4RFsA3QkJraNAoVLmp+FGQ0LCTCCig4VKG5+RqmnPbFRHmJkSLeoOly2yHVD+Ud+rLQGKIKPqCexKk1U278FA5J6fgTMfuVLizymKb8m3BWJvIiwBrf5QjO0ftCCUQkyx/Mq3J24u4AT6pY06qlVUCxUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTen8xvw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTen8xvw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BC01F00893;
	Mon, 28 Sep 2026 17:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790616190;
	bh=jV6/AlaLfqjel9+pC+3C/FULY/BS5tVg2AHLAaeTrng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lTen8xvw2RmwCB7Ot4ABTSoCDX4SiREKddcXCsM/NsawgnRX/WwK/vA5NFNLPpDqn
	 e+U0Kx/k6LFlb+Eg6+T25VIFHhRoeqI+dVbzSSAa2NSSD+TwaE6plhu16NsdYj8ylx
	 qujCHTXJHRxk5GGGdMuTMfZFM9uRy+E3VTgR2VGuA7doXySYyA+7jF8pA++oClq/W9
	 TeFZWvSP66ZkaI9HJ6UnoW8ExknRdLEe10dHxKnYb5+OFZ4GKZdj0h+Hz8Hwhdb7kA
	 7s2ceqgWqprqbwpAZ1cSF+AcjKed8aOqTkaAMWCzs/kp8Ru+C6XPQqOxs6GmhYpAOI
	 oeXcnwnJ2pbpQ==
Date: Mon, 28 Sep 2026 18:23:06 +0100
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI
 compatible
Message-ID: <20260928172306.GB2112133@google.com>
References: <20260923191526.2206628-1-robh@kernel.org>
 <20260924140300.GE453446@google.com>
 <20260925121138.GB677989-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925121138.GB677989-robh@kernel.org>

On Fri, 25 Sep 2026, Rob Herring wrote:

> On Thu, Sep 24, 2026 at 03:03:00PM +0100, Lee Jones wrote:
> > On Wed, 23 Sep 2026, Rob Herring (Arm) wrote:
> > 
> > > Use the hisilicon,hi6421-spmi compatible documented by the in-tree DTS
> > > and matched by the Hi6421 SPMI PMIC driver.
> > > 
> > > Assisted-by: LLM
> > > Fixes: dee8a4e807dc ("dt-bindings: mfd: Convert hisilicon,hi6421-pmic to DT schema")
> > 
> > What is this commit?  I don't see it anywhere.
> 
> Uhh, that's the wrong commit. I'd just drop it. This binding started off 
> in staging. Originally the compatible was wrong, but the example was 
> right. Then the example was 'fixed'. 

Drop the tag or the patch?

-- 
Lee Jones
