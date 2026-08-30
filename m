Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477C2340A47;
	Sun, 30 Aug 2026 09:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788083536; cv=none; b=AbVoLuz1Vq2cElJWsNJZWgK9wZMTdI7n4lMh5UC+GqoO3ArypyVHFvDFLhiesvg8otg19AihyCOSeih3a73JYj8u7V3AH+HfoNoSM5QBLCQyFXP+haKSae3H52v6mwOIeDvU2QU3qFh/llyw/QzTv8ZaNtShjOMx2vYUCZkqirs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788083536; c=relaxed/simple;
	bh=SDwRrtsqS15VuidhF58FmDHIMmVuViYMBCH+ai/0LuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFdvOyDbOa5IX95+dr+4lsNTcOxb0PDz9KuNJfNRADPGzea2xp8HqVhF2kxLRQcz7sAfWeYEB0D5rT99IVjzY5vwjx0X6CmDrd7PCywzig9lSz2PY4GJrHuhlQpymFf2fuMNEt95bjw8HT/HPRAKmCQ0fexRhF0ZHC7VqvfFvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idJdIh5z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idJdIh5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B311F000E9;
	Sun, 30 Aug 2026 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788083534;
	bh=42dYouZBofn72/JG5IpVBYQPY3b6uXmIdPci6hlHCLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=idJdIh5z7zcG7ysuTGFIPDKOPk6BciDNzUefGNSWl05J0nmRp+hGMJjy5CqhCq5Bj
	 UIM3tK4lt8NmYbybXQ209uzwm2jUWbmh4BFjji88K7mEgTTtOV8oJ5Un3KpFKDlpcI
	 IwpSB8JXvKTG7fU1C8jbpa6FOGUN7ycrrINKAoEYwCwT3TEnWzbn2P4iEkSu57YVcw
	 qTbP5zdE1vLAxXCldvwYxdvrGEhPKkQZgzsqx0WmKvekl+KkoWSrdJ1UZ0iXrOGxrn
	 PW8HbuBKm0IGP2yh6NSf9yxFBbnz7ri1CHaUmjerqkemWdPe0QkEH+/ShyzxRK6zM3
	 vA/mXNZjni5aw==
Date: Sun, 30 Aug 2026 11:52:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Frank Li <Frank.Li@nxp.com>, Wensheng Wang <wenswang@yeah.net>, 
	Cosmo Chou <chou.cosmo@gmail.com>, Colin Huang <u8813345@gmail.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Eddie James <eajames@linux.ibm.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Antoni Pokusinski <apokusinski01@gmail.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: trivial-devices: Add SDMC DM2016
Message-ID: <20260830-slick-foxhound-of-support-df34ea@quoll>
References: <20260826194447.3230715-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260826194447.3230715-1-Frank.Li@oss.nxp.com>

On Wed, Aug 26, 2026 at 03:44:44PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add SDMC DM2016 (1024bit EEPROM + 128bit OTP memory for key).
> 
> Fix legacy imx6 platform CHECK_DTBS warnings:
>   /soc/bus@2100000/i2c@21a4000/dm2016@51: failed to match any schema with compatible: ['sdmc,dm2016']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

