Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0D738AC75;
	Thu, 27 Aug 2026 09:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822302; cv=none; b=lIBmHSG4MDwRAWHugrE4bbBjXnWNUS6TtSqYfB2lVS9etgj/jzaSM/i9rRzG5kHqTEjwTISaGfntoBEq/RcM88UuY0RKYSaVfSq+DXSmNa0/ldCj50+5ExG5odhDJcCewX0P8IJacj+U9sQFWdCxo2qvH4sOVs74E9DG4/Jy5t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822302; c=relaxed/simple;
	bh=ZRAjFHXj/6/sPZ/NuRcag1lz2FvWLfuUSJuuarqYqY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kp3JSCLJoQ3blJahCmMooRIhE1fJX/sArwug3iMA/oGP190k8rrZHOD4E3LMkUitP1bMj3mEl1eN1E5UpAxnpjSNvavkhvAuh9YyhVNFnNNsU1qZ7U+KX0JYTtOjb9Oi0rEHXSDb9P8Rvjk/cnF2VgqxcjueXi5jce4U/k4PrQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOcSFRHJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOcSFRHJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAA21F000E9;
	Thu, 27 Aug 2026 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787822289;
	bh=kRiJjHIjv8Oj4y9OhdNBK5KA/+B1HhJBl1bx8mjL94U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TOcSFRHJIvYLYD0go+pfrGXEY9zc5Fl2qk/j2zPdVuVHgAhH/H8m0t9/4ixVZrX3Y
	 9JI8HSTrUQTJCaggk0kHIKbXpMX6u3UOTWS4HZbO9m0+vIamYd2pfn1X8MHb6LCeah
	 EJkkIOeruc5uPgegnzO7qWDO+Ux/4jdZUO2vlkQlzoAW062YkUm05xjoME57qKinPj
	 zqEjz4ss48mXU3fqPg74OE8t4sCeBGm2j34o5LtX7c4In/91tRMg6KTeKozYblBVKo
	 H8Mo8DScO74jiADO9fSuiMA2ZdFgpVbN7JP+6zK+9vVss0dGG0OakZ8GxSxDOPMdR5
	 x49zUpzU7W1og==
Date: Thu, 27 Aug 2026 11:18:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-usb@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: dwc3: Document Renesas R-Car
 Gen5 DWC3 xHCI USB controller
Message-ID: <20260827-magnificent-mamba-of-improvement-07b30d@quoll>
References: <20260819050109.681890-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260819050109.681890-1-marek.vasut+renesas@mailbox.org>

On Wed, Aug 19, 2026 at 07:00:51AM +0200, Marek Vasut wrote:
> The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
> controller with glue logic wrapper around them. Document the glue
> logic and DWC3 controller.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Unanswered Sashiko report, looking valid. Dropping from DT Patchwork.

Best regards,
Krzysztof

