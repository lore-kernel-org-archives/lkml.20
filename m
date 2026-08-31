Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8099341BA81;
	Mon, 31 Aug 2026 13:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788182763; cv=none; b=TE0YyJaqB9FtP3Afml35047IRk89HUDIO48xS6aVZXACzg5YEW2MPf5xGpivEOxgjHG1RS0cQqAnxtzGO+/Q02ejKcK5JYeCifYX4CZ9ZzEwLrhkVPBqCwvgBeN5CCdt0giiD1zvCONjiapZrA9YvsV3aDaXgeIjcur9vkzsjsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788182763; c=relaxed/simple;
	bh=mXUsUOFI6uogKr+/XVSlKjRv7nyryrvz+nFSzx10sN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pyb49IhIewAPNTTUqdpOHPKBl+lutjJRE1DynOcYRKJEZPknowQDxL/iGrrsahBJhKaGn7HLIkPmGbokpeAvXIrbw/9DSd30zWw71SbD0ORV1Kil9bf9bcAXA6+Mv8gpbCsaM2znvCFXZjdyJszT8rjirN0ZLT3nCdO8LdL873A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=er8oaBWW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="er8oaBWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E205E1F000E9;
	Mon, 31 Aug 2026 13:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788182762;
	bh=3xoPh2mmAVseNtv54cZJwkmR8RDEH2R2eBQsknv1qs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=er8oaBWWMircgr75Wk5NsJ3DCgDAiZHXTPumWtycBMRXkReJl3u/8Q7w5ch/TR6Zq
	 Ao5MoIImWPnERSOTyvPFurpj/w4QX/MZXes9c7KutSybvchldfsA5ewEbrg9dIgBd7
	 pu0jehMz5nmmbMeojM9E9T81bEZoJ3Ec0fJgGe+M6L3PiYm6T1kQ/SMcgCcaS8LclG
	 DWs0YlA8dXz3u9Ik4lvtyq6cOj7yGUCN6hlTJ+bl+1LBXgnX+ibf1Y/zZMPYH0s4Gv
	 SXn34ZRrMC2a/fiNTybj01lXXk5bN8nS+KIxf8e1CNi42h/mvHjCkqMw4hRCUJZmrp
	 9h2Fb2eDNFmkA==
Date: Mon, 31 Aug 2026 08:26:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	mfd@lists.linux.dev, daniel.baluta@nxp.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, simona.toaca@nxp.com,
	goledhruva@gmail.com, linux-kernel@vger.kernel.org,
	m-chawdhry@ti.com
Subject: Re: [PATCH] dt-bindings: mfd: Convert TPS61050 to DT schema
Message-ID: <178818276042.689774.12054503350838564303.robh@kernel.org>
References: <20260815083145.2145984-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815083145.2145984-1-egbostina@gmail.com>


On Sat, 15 Aug 2026 08:31:45 +0000, Eduard Bostina wrote:
> Convert the Texas Instruments TPS61050/TPS61052 boost converters bindings
> to DT schema.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../devicetree/bindings/mfd/ti,tps61050.yaml  | 92 +++++++++++++++++++
>  .../devicetree/bindings/mfd/tps6105x.txt      | 62 -------------
>  2 files changed, 92 insertions(+), 62 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,tps61050.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/tps6105x.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

