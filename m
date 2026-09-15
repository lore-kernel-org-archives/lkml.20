Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA04A395266;
	Tue, 15 Sep 2026 06:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453752; cv=none; b=rBm8Xe0xt1mkyHM6IlNouQCO8sot6O/OSzBQ7br2pD4UjRpRIlSNlMNlyii5ceSPHOdGf4AseIaPkZFkuFF07dJ2PYLKSw+RIniYGKQKkIJmIKHs4fe9G+VV1CcjPV5UY0LvFMDZFVX4C947fnurCZEkU9iXe0Tq2A4zFbaMbgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453752; c=relaxed/simple;
	bh=zzZZzOjhafZ/xFIc1U4aJa5g8CgrkQu/yvIpPvJ9xsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Spa4G020nh515JoShaMuGnEIEA41n8PROqMzFIuXrUtTybd/c+sn9q03oCRFRcrTkoI5l56/ieBnbzVVx+iP9nHBCUL1cQU96zcCcObJP88BNSBVxSKXycS4Omt/K84cC+laKrL+9nRlUYigILGEYx/Uumw5puZRgrN/kxtqOY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXfxc63N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXfxc63N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793B61F00893;
	Tue, 15 Sep 2026 06:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789453742;
	bh=Wpn7ZMOiJeqs4ACRYyAVtWpFE8duKftgHnJRA9JpGRs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IXfxc63NqdMrUCtHaj/RKK8aT35gWGKaKXhLA4hhXb+GSuxHmRjegcnrJvClpABF8
	 guB6uwJF8fXh2YxfoOMMXZw2nnAGYBKMo+8GrjXloJKjgrsSiUtQlY6Ej336xmqh6Z
	 nAxs8ME9CyFma3gGvgEzhJJ40eU+EK95UBUpQZqMsv/cpWtSeDXl8DOlvHUlntMi91
	 YNWmQwVb25xTuKkbdPgF/Wjh8DjQbVGT3hjVEr3SOCYpWw9Y+neWf8yXhHVZJnHliP
	 XR46Sja1SDQvhuQJkeiXTB09SZIYYduvgQusbRWgXvV2hFuxbxmmLNDq5pHiTQHV2H
	 12Uvri21zHcdA==
Date: Tue, 15 Sep 2026 11:58:58 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bhargav Joshi <j.bhargav.u@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the dmaengine tree with the usb tree
Message-ID: <aqjlqvzPntq2dk54@parshuram>
References: <aqgKCmZJtMxQdNFU@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqgKCmZJtMxQdNFU@sirena.co.uk>

Hey Greg,

On 14-09-26, 15:51, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the dmaengine tree got conflicts in:
> 
>   Documentation/devicetree/bindings/usb/am33xx-usb.txt
>   Documentation/devicetree/bindings/usb/da8xx-usb.txt
> 
> between commits:
> 
>   d0e95f1c08264 ("dt-bindings: dma: ti,cppi41: Convert to DT schema")
>   267e31adc4831 ("dt-bindings: phy: ti,am335x-usb-phy: Convert to DT schema")
>   1c09fe2edad27 ("dt-bindings: usb: ti,musb-am33xx: Convert to DT schema")
>   185bb9305937f ("dt-bindings: usb: ti,am335x-usb-ctrl-module: Convert to DT schema")
>   ef7e123401d95 ("dt-bindings: usb: ti,am33xx-usb: Convert to DT schema")
>   40d79fbfa9ab8 ("dt-bindings: usb: ti,da830-musb: Convert to DT schema")
> 
> from the usb tree and commit:
> 
>   c64189e9772d7 ("dt-bindings: dma: ti,cppi41: Convert to DT schema")

This is binding for dmaengine driver, so I think it makes sense to go
via dmaengine tree. Or if you prefer to take whole pile as is, I can
drop this

-- 
~Vinod
