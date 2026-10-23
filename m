Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741787;
	b=1+ieJ23Zwc6S1h8QEYmggYkpZv7Zq7ToDm/k9rxJ4yTgKwvgfRndbshbDHnBIohGCuZW
	 cEkO2uX2e9EoICLscx6ykiOTG4SleYtlx9xWLPTYjhJeva3AbDAXejfvpHKs9fWVX+P5O
	 D+XMfrI+GibdGFLutv6ZjI5719PmDiw1drrwNENosa+6geUYtvB53oGgYwnrmOqcGAzQL
	 vNWsaxCXTjcWHb9m04nQibaiOZL/c8hmDYrfbdumy7oAC0JorFlHAAWcvZWJVKiPBcGN9
	 NEpTGruHTH7pbviSBjTxHL23sXWgSzgteeAw8489gRurrJjaB3sNPsFic0RkDioCtfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741787;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WzOpYD46ST4arJ0WPiIMyO/fbGeCiLktthls5twsZNQ=;
	b=YFO349Bm68uSLk+CIr5hRcO+Umy5TATEY/HNBNM5fIo3qa10+GS8FwTPUQEQJCHgdNoL
	 25QqVnr4gX9GOeeyNtc6dRgOdcMjryPzPDRbWAV3bo0ZyuIKXIh6ONjAYQeCN7/7+NaUw
	 A+ikyByknk6GMVkXkf7YsjFPL3O6uyTM9gCrqb9YX3QqP9bnNAFIwvKl6vjQ5XcMyDmPs
	 6QI7V1v9XW1YYTbos4/eu95wTLZclcpADtQJMozHNm7zzLI7y+mY3GyITHrYKwb6hSqva
	 oooRNk9QJ9NJlvEcYPbBQmDs6H4zptBTea+I5B4z3BXvKByKGgessGxqwVjHrQTjFzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H0XpAkF3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6492606A31A;
	Fri, 23 Oct 2026 07:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H0XpAkF3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923AB1F01825;
	Fri, 23 Oct 2026 07:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792741786;
	bh=WzOpYD46ST4arJ0WPiIMyO/fbGeCiLktthls5twsZNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H0XpAkF3lnqYyyKXoalzqjQqZUXktMIBndt0IFoP95dXAmSiBd/MSmg5S47aZEkMO
	 0Be6wZ5hJyF6it8ZrbYWPs6IfqYUOuCHIRAwg4P3C2CI4IKBdXTQDSACU6LDzfS9N2
	 8H2c93i6qeNXNZNuaEczS0bN9v2Ht+f2FWQfNsv9Ik2yAVTEW9xp4Y5qiorY12Dpjt
	 VOV7h/JqDfBk9QV0XVhwjutcPhtm3syhem+FOE53tHUzeecWxyZi4Xvb7byUddYpit
	 yPs4GeLX+VMEQXHpvKX9cL1SALtYPgnSHe7Nqp4YT53v1MBN3ZQvGeko8Q9OpL2ar4
	 zGefdbbGrSZVg==
Date: Fri, 23 Oct 2026 09:49:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 1/2] dt-bindings: usb: snps,dwc3: describe two
 connectors sharing one HS bus
Message-ID: <20261023-conscious-newt-of-experience-2dddf2@quoll>
References: <20261017081320.220525-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261019131848.344689-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261019131848.344689-2-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261019131848.344689-2-xiaqinghuan@mail.ustc.edu.cn>

On Mon, Oct 19, 2026 at 09:18:47PM +0800, Qianhui Xu wrote:
> Two connectors can share the High Speed D+/D- pair of a single DWC3
> controller, with a GPIO selecting which one is connected.  Super Speed
> lanes stay per connector.
> 
> Describe that in snps,dwc3-common.yaml:
> 
>   - port-select-gpios selects which connector drives the shared HS bus;
>   - the shared HS bus is port@0 with two numbered endpoints, endpoint@0
>     and endpoint@1, so that "ports" keeps describing the controller's own
>     buses as the graph bindings expect;
>   - each endpoint carries "mux-state", the port-select level of that
>     connector, and "usb-role-switch" to declare that this connector has
>     its own role switch input.
> 
> When port-select-gpios is absent the endpoint properties are rejected,
> so existing single-connector descriptions are unaffected.  The two
> mux-state values are constrained to be complementary.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
> ---

v2 had several Sashiko comments, this is called RFC and threaded there,
so kind of confusing what you expect us here. I assume RFC, so I drop
this patch from DT patchwork.

Best regards,
Krzysztof

