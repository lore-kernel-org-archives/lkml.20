Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1169F306D2A;
	Fri,  2 Oct 2026 06:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924192; cv=none; b=mmPcLqSVm1MhJAGnD4TWOw5zTQiOz3Kj3UGAKJUMAwSnPOCXe7NxYQjESXkNybhPaxdiDAwKYLYyJQzpjhqHSmEmr5BT/Zd/loiRpH4VXio4b/Gc9Tt4+eqgMA/9PcV1bl7kXtZ/KBLDRkUAp2hfugfq9B9HmZhB8EUBx+oR4Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924192; c=relaxed/simple;
	bh=ra+WVOYahXl2otewvqFadyp9Me52z5nIuBfRVvdv304=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RoFqibN85/eV4sAi2lXk0YJ9e2sfTbsVqMSBqM9PHIqJm30qEnKl4nCX9gVfugVW0XiZs/rIpNc/JBQJK16oxUULam09Y8sroiT1MLGnf8K0PhWQ5ZwW5SJZjOb0WtAVz3lxQg8gnw/rT5f1uQokkoLdr/NtCzYGIa6FUwg/wd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKxL5+f0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKxL5+f0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265441F000FF;
	Fri,  2 Oct 2026 06:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790924190;
	bh=HE2p8/Ot+ezwK0WcMyZKQ3X7BkwyYDyY81aAgLKjjXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oKxL5+f0dMn8XHK7KgSODrCRSEFNAe+dCyb/r+e6auulIHGYs+nmAqpGJpeduVTWJ
	 Vb+UqhSfsRkIHTE5UncFm705dDFCpvWYsc55Qin2aTYVMtJVXQa58vawXWMUiHPGwP
	 poZNIH/fyWjmlBsuMIMEvuzDOMw6G/45FnhMuNiivLOqma6GWerBvuxwclFAG3m9rB
	 OLxwBG0voO6bxIwZ0hxp8hcyHfjie+AkKE1mUrlEYnxfxSU+INK64V1HveXpUDFK6/
	 Acvekfxd3/VLV619HCaMPGC2iBls+W7bD6lnK5ABQAYa/3FYHQfpYcFfsKhLmYw/Pc
	 8RkNZLrbKNPUw==
Date: Fri, 2 Oct 2026 07:56:27 +0100
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: linux-next: manual merge of the phy-next tree with the v4l-dvb
 tree
Message-ID: <ar9Vm-VPzqhtC8SQ@parshuram>
References: <ar5wFFE64tWhmCKg@sirena.org.uk>
 <52ef6837-7183-402d-acc6-8ca15c7e27ca@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52ef6837-7183-402d-acc6-8ca15c7e27ca@kernel.org>

On 02-10-26, 07:33, Krzysztof Kozlowski wrote:
> On 01/10/2026 16:37, Mark Brown wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the phy-next tree got a conflict in:
> > 
> >   Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> > 
> > between commits:
> > 
> >   42b96f94929c9 ("dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema")
> >   a93b9de71466f ("dt-bindings: phy: qcom,x1e80100-csi2-phy: Add Glymur compatible")
> > 
> > from the v4l-dvb tree and commit:
> 
> Why were these taken via v4l/media tree?

This is even worse. Immutable branch was provided, so people can pull.
Looks like folks cherry-picked instead. They need to fix it...

> 
> > 
> >   3b0140f37d25b ("dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema")
> > 
> > from the phy-next tree.
> > 
> 
> 
> Best regards,
> Krzysztof

-- 
~Vinod
