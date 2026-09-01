Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FEA1F3B8A;
	Tue,  1 Sep 2026 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291495; cv=none; b=nyWqt3/bx+zxyPAS62pxHW6J/8XISgBpwUxbb8Tkz+80wk0PqhOWbRZDmXt49kekWfZUjagYeyIQ9OuHolwoc+ChIP1WL0kGHNvVNGUzXP0w7qWlUpmHFoFiM1dTKgYj+zpU7mmI8b3yumnfqQgjNftrSveiIz58V+bstouxLmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291495; c=relaxed/simple;
	bh=AgJIgz9/5YVVeMlqfIXNW/n4EoWcQ2dP8Hrap4MNG8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ES2+gD8c5eByRKUIQ3fHG3MvX+WwwgQKx1U1Gqbr9SzlmFlFhVk+bgQJh1eI+dCsgHj/Jhej99jFHIDi7NdI+GPuQWlkL1KM4+2PGRLtTWWhQRxkp619sSQd7TgosPW8hjczte5dxfVRUcpcnn2rJKxaBhCCs+mc3k5b1IwLnPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=KRZ1dRP+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="KRZ1dRP+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=pFSn5y97kTX/b/0AllW5HM4Du+nhAFNzf81IK1DwiQU=; b=KR
	Z1dRP+WRbIQE6mxH/+dB6wN5fP2b8FNBmDevgpYG0KzIQpX3N9GuR2tbiZ/JCbJVLGeqRrtSimpi2
	RrZ2w67pSVaVOWfhKKIphVjejWbnu8imIhby6FMX+MiA13d5mZrD/4HVgxg74MorWPPvFVWHE7qCV
	gcA5oNcBSYWxOts=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1UJ1-002Ptj-6I; Tue, 01 Sep 2026 21:38:03 +0200
Date: Tue, 1 Sep 2026 21:38:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
Message-ID: <3143f0d2-8990-4a75-b7c4-27edfc90ae54@lunn.ch>
References: <20260901025311.955936-1-rosenp@gmail.com>
 <e1087196-fcfa-4c1f-96da-ef76a3e03a11@lunn.ch>
 <CAKxU2N_qR-KKvq=qv0eu4PMYMf8zHnpYnZ8jMvpBNKVitB3Vuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N_qR-KKvq=qv0eu4PMYMf8zHnpYnZ8jMvpBNKVitB3Vuw@mail.gmail.com>

On Tue, Sep 01, 2026 at 11:37:03AM -0700, Rosen Penev wrote:
> On Mon, Aug 31, 2026 at 8:08 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Mon, Aug 31, 2026 at 07:53:11PM -0700, Rosen Penev wrote:
> > > Add a gpio-keys node exposing Wake-On-LAN on its gpio0 18 input,
> > > allowing the board to be woken from suspend.
> >
> > Could you explain this some more. Why a GPIO key? The MAC needs to
> > know if the PHY can wake the system, in order to offload the WoL to
> > the PHY.
> This was an out of tree solution to get WOL working on this board.
> 
> After some back and forth with an LLM, the conclusion reached was that
> this is the simplest way to get it working, not upstream ready. And as
> sashiko points out, it has problems. I'll respin.

Please do look at the work Russell King did for phylink and WoL.

What MAC and PHY are involved?

     Andrew
