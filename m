Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E626229D281;
	Sun, 30 Aug 2026 18:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788113826; cv=none; b=FJp+oESo0YIEj4eXbqWoxJlV4gF1uGFxCbWEmDBC7Om7xSoMJJDGqH/LHoziRPX008XpXORTUL7R0Zqviz/Lp9CjVc4LO8KJSqMm6bOui81dXkxWR9Zjje3nix3AevewRFJgDfHPbCKpm127P0zNKfY0wOl21joUvl8Dii52qJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788113826; c=relaxed/simple;
	bh=t+fmRMM8dNsgFQky0K6Pk4l9y8LFETDlPVP9aN/QHQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rmz6ye6BSxvoBIQq0sNyoec8GcN3EdoVJZi3cA+eMS5XNBPogeadY4ukvsAKlMXAYbvfVSg9S8O0jEJWZLJEZLf+vWHk30COELALw1aoZiUbJ4ky0nDkAzuKtdCpM1HTpU7VA8AU8O7lZue4iuJMvm1eZ+h6nhS3I9EWMWKimNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFsvVXIv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFsvVXIv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F06D1F000E9;
	Sun, 30 Aug 2026 18:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788113824;
	bh=lQaKAj+4pBDAOHYv1oG4MSzn5ICb7jgI2jFMOSyM0vQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VFsvVXIvt9Du3oVLMw8LyQHekhZP7ELz12AuoLv9mJPDLRpKuzPxqbSmop0i1V6rR
	 Q5vUR74DuR6AviZnqC1gD+RULOW/665HbfPFfgKoZJ2kRD7xeGVGQe2Gylbcpo6zIV
	 Vq57TqL+b3T7sOOueseis5MajfndoPb8LUQl5EDcVGe7UA0GB/axumDq8YeCSagspT
	 4lNmcRGlmkX6GW/L4VyIB8masZ1kDbxnw3sI725CBh7gKv75OjMOxo7I6zdoPiXEQY
	 HzDgsjQhOWmo4yXg9NgaRu5kepnehTLok2fM6sbHmBEjUkUXKdc7cskuu9OAYKxf4P
	 zg+zJJaQVwHMg==
Date: Sun, 30 Aug 2026 13:17:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Colin Huang <u8813345@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Eddie James <eajames@linux.ibm.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Cosmo Chou <chou.cosmo@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: trivial-devices: Add SDMC DM2016
Message-ID: <178811382250.97630.14321162328800745928.robh@kernel.org>
References: <20260826194447.3230715-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826194447.3230715-1-Frank.Li@oss.nxp.com>


On Wed, 26 Aug 2026 15:44:44 -0400, Frank.Li@oss.nxp.com wrote:
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
> 

Applied, thanks!

