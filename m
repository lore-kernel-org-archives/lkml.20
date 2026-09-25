Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF97E361973;
	Fri, 25 Sep 2026 01:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790301361; cv=none; b=H9zO3PXzNzsBhDzVSYuzPWOODiwnOhJ5ABjMxzz1THI1jjVHGAgoCGRAiAsvqfDmjkV6hAE993th3+XOJsrp65WcUImO6RL3KOL0m59dmqpEMwzgES4tqooMCkGMQJUZ5Bophu6vs31Hu1xjCtuoLNqNFdB2wLqsGbJzg5YKDV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790301361; c=relaxed/simple;
	bh=qtIDD61eSH+e4sEtkgEwrZcGQOLhqvEyFDEdZOGKnC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y61Gd5Au/JnDHHhLmtZOHilc/h1FQaewHxbun0q/AwpHwl9oJSQFnA7QPMfIYVzC1MYEHehsdSxO4LzGUvGwoxa8Gyxt9qhTgLHlZH42R30+7ZKnMjmOWiYBIcVLuhnxz2Yd0Wnu+SWjnz7ejJNW8AXw2mdMQyPTINV5FjdZNls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H0xfYGXx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H0xfYGXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC7F1F000FF;
	Fri, 25 Sep 2026 01:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790301359;
	bh=NHZ/OTnVptuA69ypAAQA31at+Zd0EiA1xKaKFiXjiCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H0xfYGXxuegMQH+qG0o6I5qA/IoZuEWiaIbyJeYVyO6gS7BHOrbTibgIzK7zi8Pg0
	 218+6PHzXP/HOqtzhtmVr87sBTJA8L28Vj89b+dBEL2pQRqX06BYQPWTLNa6pHZrAb
	 OkX46LOylN7l9yEY+MiEndHzxtfiqMzmuNfbgPSTFQ8LUx0ZEcEFSnmUiuxwbbh8wQ
	 FCeHDhra70Vq0cRdYCyykDCD8a28GfnuF4cuKeal9oKS3Ax2Tg7TvU93T/D2bSrVSU
	 Pb5eE2HcEwQIaYAkTHtcMFbcjDW8Rxj0vxN0lev5C70jAvcYOoauAnG3ngTBPyf4B/
	 /7zihRU4yeFNQ==
Date: Thu, 24 Sep 2026 20:55:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>
Subject: Re: [PATCH v2] dt-bindings: soc: hisilicon: Add HIP05 CPLD
Message-ID: <179030135690.2879982.18064866040302820815.robh@kernel.org>
References: <20260923191449.2204388-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923191449.2204388-1-robh@kernel.org>


On Wed, 23 Sep 2026 14:14:48 -0500, Rob Herring (Arm) wrote:
> Add schema for the hisilicon,hip05-cpld node on the HIP05 D02 board
> which is already in use. The node only contains the compatible string
> and one register window on the local bus.
> 
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Clarify this is already in use
>  - Use '0x1' instead of '1' in reg
> ---
>  .../soc/hisilicon/hisilicon,hip05-cpld.yaml   | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
> 

Applied, thanks!

