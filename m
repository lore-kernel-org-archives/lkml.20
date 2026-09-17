Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD6D3FA5C4;
	Thu, 17 Sep 2026 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789683767; cv=none; b=kTp24im1WiFvRx5e01y1uA5u9ROwBQDhBZHTBygzZD3dw5EVQVQTdmWj49o2DLrnWEtLz239/RciilnrTz11jxD2SsHAob6RbfQ4Fsv5E/rPt20yOEFYmbww1PuP/36CZwgjtOSl6cfTcxfrPnyImoAtGMa3PgYVrTQPuhVz/LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789683767; c=relaxed/simple;
	bh=fel32Elp4w+xvvI1Jla4p7gSWDbhvqvNnwN03dj/a+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYProJiBZjlat58f4GWO4lJh8zLTsxo/2mNrSB1PXng3xjNnK6XG/w88Mbo3Ytiqjidvz9D9JqmcqtQZkM+aVPdQgBbJQBng1hU+OoOXGw4yJ2PIwMQFe4IZW7bb89gK96gI/9DBIMgJGDbIKHeQOgiYxpgktueaoUnCMv6+41I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrwftgOU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrwftgOU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584DB1F000FF;
	Thu, 17 Sep 2026 22:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789683765;
	bh=0izTRMyHu67tgBHjZ97w4u6w8Na+QuU5b2DB+KFQLlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hrwftgOUqQkjvxhyO/1/4bsGEq5lji1T5FXff1+oLxwSRjLAvJ4+HHUtdpg7bp0xV
	 xAnRZNUj/uJWgrdCflo9Eh7Qebua7rtb6Y5JDRpL0K/JpYJJ7P8y3DQtgkmtKvrgJx
	 9froaRYbdmSh0NA5mCzYrMRl2HRK+vXXUqfR8gMQY9Bbjs/VCAdo32Tf5JTNG7pnzE
	 sUGkZ9Lhp3wdiN6TBODZcVNuaiSP2sLKBYqiGIhELq6n0B0QPZi8FY8LiaAHZJ1mDK
	 SVr6EfEf9YuoRkp25W8BBv52h+F1D2+/eiW+VvHpmFY1RRuIRsHifMylT5nkiDWrpm
	 tN7lveyEY/HDA==
Date: Thu, 17 Sep 2026 17:22:42 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Radu Rendec <radu@rendec.net>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: chrp,open-pic:
 Typo s/pci/pic/
Message-ID: <178968376185.4074993.605406183473325432.robh@kernel.org>
References: <cover.1788426169.git.geert+renesas@glider.be>
 <f2cc11922b3e5dd73997ef8c673137951d3fe715.1788426169.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2cc11922b3e5dd73997ef8c673137951d3fe715.1788426169.git.geert+renesas@glider.be>


On Thu, 03 Sep 2026 11:06:29 +0200, Geert Uytterhoeven wrote:
> The device_type for an OpenPIC node is "open-pic", not "open-pci".
> 
> Fixes: a241f1a1b338b714 ("dt-bindings: interrupt-controller: Convert chrp,open-pic to DT schema")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/interrupt-controller/chrp,open-pic.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

