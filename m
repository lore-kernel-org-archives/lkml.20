Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706507;
	b=syM7c1I/7YN8ErQm58LFGEASMaU0CgSwVoGl155OdIMf5R22WFjRzxHm02LsJjrSgLFe
	 n5q7kBXqIhDGOaZMT1x3fnRwQteufcQ8FwHZ2s5yxZbyDblqKc9GbpuvOPGqAAWuzjqoi
	 3JOA1+yX9FPSva6q2jTmeOGl1ZorXppBONH1QmU3RE9kvRTUOYBe+2hAXL+4q/ffSU/rt
	 obdiiXDWlDIaZysNGYjLxV/pLjJeX6oxoPNcdtnu/thdsqOJK6ogZ4mhEQGqjFyrw/N7x
	 G0uZAzOQZwlFeAeT7sh2+mx0wdnOyNWtFCZtzhX5oIHi/bgSDaSLVelYJccE8qfYKlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706507;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Ggacp+6TZv9Q5q/pk3BYd+zN2bNaAX1Fn3HvEGDGZP8=;
	b=mVUGGwA1YXAAY3x6ytbw9DlUOxlJIovSR3M8irzhrUUJiUi+bwplk8khU0eJazfinyY2
	 p54kf/qKgXc+brOOgIWnOQY7WJVL3S8xOEVOay0qBUOOAGnAKb/0JbbdR7w0NscnXgJga
	 k54z52Sf3eNxbcdK5+dFdQHCAVnh73gZ6ot4U43lIlrGPKLoGXnBOTgky1dPsy1cXLdoN
	 jnTbBXRfl3aIINlF7XMdemBVGA1Iv9EftRf3OypPyd2NiSzrfqcnAUoG6JSaE7YmN3/Cm
	 aaiPLBWxAVlE7WtX/qVQpv4fMUm/NQutNYmDirIMXQIoLvpHoX1llwVzp+4k/puriYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fsiPjbzH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6351A606A332;
	Tue,  3 Nov 2026 11:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fsiPjbzH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EA31F000C1;
	Tue,  3 Nov 2026 11:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706507;
	bh=Ggacp+6TZv9Q5q/pk3BYd+zN2bNaAX1Fn3HvEGDGZP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fsiPjbzHJPE+FekVET0fA22iowNa9DY1vBEyd2lMQPLIlSX722J+g72YsU0lsVmeI
	 91wMkO0tsNWV7nSuwQGwbNuqyOrhwzO3Tu6uFJBk9ZZEXsd41m8yzWyKr1pcfzGbsM
	 7egpNA6/UkJx0qDqubbeXnx2pB5Zup6OOmGFph3PRoVsv51ZjixqXiGeO7h65mIED7
	 1eirgYIkGO2S75+sSYNVFGRhrsrbGufvFS/sG4R8fWqWi7JxkiH4p5YW73bI+faScB
	 VwCZKnR56NWHP/A8GsGHyA+ncPnJUoyksItDBGuP9UgIPFvkKGqsZKmyx7DghNGu9W
	 VOdFpwxnE8Epg==
Date: Tue, 3 Nov 2026 12:48:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: starfive,jhb100-dwc3: Add
 adapter register region
Message-ID: <20261103-splendid-topaz-raptor-64a6fc@quoll>
References: <20261103064836.71059-1-minda.chen@starfivetech.com>
 <20261103064836.71059-2-minda.chen@starfivetech.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103064836.71059-2-minda.chen@starfivetech.com>

On Tue, Nov 03, 2026 at 02:48:34PM +0800, Minda Chen wrote:
> Add dt-binding of JHB100 server host field USB device controller,

I do not see where you added this binding.

> which still using dwc3 usb core and contains an extra PHY adapter
> register IO register region. Require to add IO register descriptions
> and regs-name list.
> 
> To compat with normal bmc usb, which contains only 1 dwc3 core IO

BMC? USB? DWC3? Please use proper acronyms to make it readable.

> register region, add miniItem to 1.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Best regards,
Krzysztof

