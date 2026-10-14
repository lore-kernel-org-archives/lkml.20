Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAE13559D6;
	Wed, 14 Oct 2026 11:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976397; cv=none; b=rfXDPm/xmNnxZyEMegRneE4H7dVFak6fE74ez4WCiL7qHQ/0bQNaHydwHLtPazfSvGr9HLKzk5D0kxzpL6DUP3vSCOugzM2ty2EflNDWlXLHd9zoJlYVet+dF45nw6hMOppIlOY1ZET1uvKqtSfh2I73Q6dopq/Z/pEhO7pwm0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976397; c=relaxed/simple;
	bh=43XqaolMtx8CTuFWDrCw818XdeCR5e2Uzrdxf9l0DAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5Mc2VKOD0A6g2SAnIc++6mZ8UDCMOOSkApoGDn9vZGJR7jcIDt3CYfgu+rZe8Ndmhf6LUaZiKXSCmR/Cm8Dove7bWyF2kzOhpPtSZgLvR8EQvkqKPEEK77Swo/6ztlXVqVBSiNBRE2xtpACY54tu+IuqdMwdMH1tNY8tT4XJU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwdM4Jml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwdM4Jml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB361F000FF;
	Wed, 14 Oct 2026 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791976395;
	bh=nbSVtyaXhMQHtKcbFmD9fqQz8wqvoyx0mLaw6DkW6As=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mwdM4JmlTziCIuQNveumi0YlhWLvy7QyDrwivWP74OM8xQOqp/jjSgRRdENTAmPy3
	 80wEDNbE5X/KccW39om0crbgoaoJmvW3JhzXfvVyyShqhkx8Y2QN3w/eGdjKCNb8Ec
	 kinz/CT63cnoy5xiZVSHoCx2xj7m1oyZ8EK3XngLl0tBCJXFXi3GgF2kG6zh8DKjiZ
	 SUklb+RT+Jx15eDH/oLtAfNmS+VIDh90RZAQDNwZl0rbrS5brfmu3GkzcsrPJ7DKAE
	 SJyEfDKJwXDkQXkdCjKJ140fiYkxkPL+U9E62cliSwnzBgvwwKOTlTcfWFMaMPw4iR
	 NsgBEoD7VeO6g==
Date: Wed, 14 Oct 2026 13:13:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: usb: snps,dwc3: describe the
 two-connector HS data path
Message-ID: <20261014-mutant-bustard-of-dew-637afe@quoll>
References: <20261013102927.1141696-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261013102927.1141696-3-xiaqinghuan@mail.ustc.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013102927.1141696-3-xiaqinghuan@mail.ustc.edu.cn>

On Tue, Oct 13, 2026 at 06:29:26PM +0800, Qianhui Xu wrote:
> -  usb-psy-name:
> -    description:
> -      Name of the USB power supply accepting the input current limit
> -      requested by the gadget after USB configuration, and during bus
> -      suspend and resume.
> -    $ref: /schemas/types.yaml#/definitions/string

No, you just added it!

Best regards,
Krzysztof

