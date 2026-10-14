Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF8E4EFFB7;
	Wed, 14 Oct 2026 11:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977237; cv=none; b=qRu4zJskxyIQ/hioi38sbbOxe5xrNBrAdeufnK4hlS6DRHUo8PyVqWYNHJoOWjM8pk6SpxR6yO4vQEH2mwZiZ1SV16J80MVURqg1vey7HjrzRo7au57W7EQNKmWCYumXTQmYzkQ56C6sSsRoDHYKfKfvZP+1qeIDZGOJrtIiM+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977237; c=relaxed/simple;
	bh=DZXj6cfyoSFJfGCTSH09og0CwhR90Nu5ZF0MvrJX5SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QyURs/6edZuhl0ywlJfSyj9qVxZJ1wl9Ereppl7ny8659D6xgKd/OwBpY5ep8TS6Mevqv6K6gahugkj0wIy74vi6Af1jAR6tVhuvLwSi/tR1M7xyZW+E03hrwQmtsi3ygmfEE21bylVN2xaQbIfQQDohu7wcaR7iSgyMs9VclGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LjxbY4NL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LjxbY4NL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570B91F000FF;
	Wed, 14 Oct 2026 11:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791977236;
	bh=Vs2YSOCjr3xVmak5ziahA1zHaGFZLaSeGx6bxxkF+zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LjxbY4NL+zzr8SqrIPm8KpFEvTUDwZt7ei8wBvZ3X0WOQhRC4luP4SlARkFORg8tr
	 W++Wky8LNEX28Noo/6O0usUN0KfHyk1oxgQqwQ8RMfxju9iAr/ahpqvmyGCqBQ3xhP
	 MB5uM4ToMHjKCHbUkrECB+Mk34LyXzRvl4WW/FVJ3+MuXB7AFNen7NQ6lJnZdpwIHz
	 KaVzNjFTa9ljvrK7mQq4iYr11maFv1xdMh4MtcI/MLJbCePCRDLmcpSnxtQ8kQFXyT
	 UpwVQFoXsslQf8NEBlanI6pfBjt+MPTFM+aTvJn0ayu6jHDs+C/f8bFcjcpV+IuqZd
	 B5M3idJlG/5Pw==
Date: Wed, 14 Oct 2026 13:27:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 08/13] media: dt-bindings: sony,imx678: Add other
 Starvis 2 family members
Message-ID: <20261014-amiable-pogona-of-growth-ab3a8c@quoll>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
 <20261013-media-starvis2-v2-8-3670722d250a@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013-media-starvis2-v2-8-3670722d250a@raspberrypi.com>

On Tue, Oct 13, 2026 at 04:17:07PM +0100, Dave Stevenson wrote:
> +      - items:
> +          - enum:
> +              - sony,imx675-aamr
> +              - sony,imx675-aaqr
> +          - const: sony,imx675
> +      - items:
> +          - enum:
> +              - sony,imx662-aamr
> +              - sony,imx662-aaqr
> +          - const: sony,imx662
> +      - items:
> +          - enum:
> +              - sony,imx832-amr
> +              - sony,imx832-aqr
> +          - const: sony,imx832

Please keep the list sorted by fallback compatible.


Best regards,
Krzysztof

