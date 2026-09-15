Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0F6351C20;
	Tue, 15 Sep 2026 06:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453524; cv=none; b=kId/x0jNGtRVd76RDJatIdHIwd7aPIH0DdOmJfoCgFLZ88yuE8T5SkQwXZCUxPtaGXfDbVf2tfXoTRADbxK04bYeDTfehHOyBVt5jwq4tvBwgkesC8Fl+TsgTQUTedmVcGkPjZzddJZkckQq3ynjNRkfR27ZGXDVJaQjn/yehPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453524; c=relaxed/simple;
	bh=tkcr0MRelUp0JrrEBQ/I+qbjhnoIrJeb1F1vRlfyer8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LkNOydKm+kAWxAfU8Z6nmxRqct9XjEXXatsmF8n3BnXIItFp3UuBbwsbkOrq369cKaR7bifYYDKJPhBJa45nFsSPsbP+cPo7g/iU601dJtgU9ClbN6GpjglOqxi2kcsinZJAN3CFs/D/xCABCxUDbjnChkTfnQHCfT/xoJkrv7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nN1PQDG7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nN1PQDG7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5381F000FF;
	Tue, 15 Sep 2026 06:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789453523;
	bh=1Tc4U2r2M6wO9i7XxQYyTjRF0lBi83FByDlut8zrcbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nN1PQDG7/6J28PiKo0aJnBt2AZ+IG4oAqIhD3ycR+eYyOnZP0qsVP0k8KM/Is2GKQ
	 BEkVCcQyIPAmKtjNIYGI74/Iq6dBKkRVlmqarb/46SlUXQWqNRp7aVB8xUi9qZgfr/
	 3UQri+VGFDig+HmenF4h8tu6QcPfYHDqASPbyBMFncmxWlfwPytNsdVe9dRS4lw1tF
	 89bCEDn4g24MJ3LDtndv1R8yNF+wWKTLsMR4SKRyGDQQCg/Mzu86SBM+2o+dEAmK/M
	 xKGEHVcVwVbpt2sUkJHs/lK8pw4xsdU5JEm3cnLia/UOcjwxkysLOsELa1R2n/gMwU
	 e39bNn+ztvxjg==
Date: Tue, 15 Sep 2026 11:55:19 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Bhargav Joshi <j.bhargav.u@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the phy-next tree with the usb tree
Message-ID: <aqjkz5TAHPvL7FzT@parshuram>
References: <aqf3I4J3OyKwcg6A@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqf3I4J3OyKwcg6A@sirena.co.uk>

Hi Mark, Greg,

On 14-09-26, 14:31, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the phy-next tree got a conflict in:
> 
>   Documentation/devicetree/bindings/usb/am33xx-usb.txt
> 
> between commits:
> 
>   d0e95f1c08264 ("dt-bindings: dma: ti,cppi41: Convert to DT schema")
>   267e31adc4831 ("dt-bindings: phy: ti,am335x-usb-phy: Convert to DT schema")
>   1c09fe2edad27 ("dt-bindings: usb: ti,musb-am33xx: Convert to DT schema")
>   185bb9305937f ("dt-bindings: usb: ti,am335x-usb-ctrl-module: Convert to DT schema")
>   ef7e123401d95 ("dt-bindings: usb: ti,am33xx-usb: Convert to DT schema")
> 
> from the usb tree and commit:
> 
>   ae6ee6844d5aa ("dt-bindings: phy: ti,am335x-usb-phy: Convert to DT schema")

Okay I will drop this, it can go thru usb tree. Thanks

-- 
~Vinod
