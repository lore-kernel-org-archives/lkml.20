Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42C243BDB1;
	Thu, 27 Aug 2026 09:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787823598; cv=none; b=L3xqEQqg/uADy0IDCHiDZ00GQhzZ0Jyji1bapWO61s7A6juY3sHiKzMGAlce7JF3xW4z9EFz/CEzhORRwXhgzVZG2if/MJ96iFHzNfPwZu+zh2tAHp73YRHZYzatgflq+LPjPbtbp6BoiHDP7k7VbtrHU02LSmok3X6g/sRzohs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787823598; c=relaxed/simple;
	bh=VGyMKIVsOm5V0rT1WZipfM3sOw2lv5lQJmJcylAqY94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDLyES8eo4udR+agyyGew7douVNPvX4AOdUYpYa/1iptcItMKjlQHGrZNfCU5JXm1b8CVoyKEzu5muIXrw4GP1MIvKH7ydXdWNI9wtcP5bd9nTSmSa7s8+pxNdoo4qEysLFEsTPgtPJneOhc2n7YKMK221QExsEdXwsdCJd2G6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pbs2iwtv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pbs2iwtv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8466D1F000E9;
	Thu, 27 Aug 2026 09:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787823593;
	bh=yNvvXnZTcToeWcmo8q9ZLG/glHngblgB9JGX2UP3+gE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pbs2iwtvEcx323tU36kyX+fTx+qPqKzIlu0xUOApQXJSATiA1jbtfjmydttUPq1Y2
	 rjkcXEIN8273sf6v/1KLqFlnfAzQXIvhC36Mo6KdzrEOa+2YQhIoVP1B8Gt1Ne60m8
	 s/sUeHS/xz69VICrHF21AJNAKzLmVCfQVyQZHzoe+hQrMKc7kW8pPcghkMlDIlN8QA
	 hkdKybaJJJuLTLdP0Ney2RoUgSnBCHbINwCe/qk/qKXjpGKBbKx6uJHHHo04dj8U4a
	 oAEIeBUmAB/4dQMWodWZkrxgrPOa1lBZ/hfZ4Po6p1d1DKzHiFt4yVcsTp98WTRKWa
	 HxPPskxfbEEow==
Date: Thu, 27 Aug 2026 11:39:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Rob Herring <robh@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	devicetree@vger.kernel.org, kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/4] dt-bindings: usb: Document ST UCPD
Message-ID: <20260827-angelic-paper-mantis-c5c13f@quoll>
References: <20260819163410.119755-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819163410.119755-1-marex@nabladev.com>

On Wed, Aug 19, 2026 at 06:33:52PM +0200, Marek Vasut wrote:
> Document ST UCPD Type-C block. The UCPD integrates the physical
> layer of the Power Delivery (PD), with CC signaling method, for
> operation with Type-C cables. Vbus and Vconn control is performed
> using an external chip, usually ST TCPP01/TCPP02/TCPP03 or similar.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Unresolved Sashiko comments.

Best regards,
Krzysztof

