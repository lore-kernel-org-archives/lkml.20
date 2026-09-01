Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9910D382365;
	Tue,  1 Sep 2026 08:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250265; cv=none; b=CM+x/GIZfwz9dSCPNp8IH37lgOqdxNFF6B05NOz9sibfvTvnxdA7EM0LRXI643A39XWTq16QeqBP68vojkTWiosRuNnYwENvCD3dQPgcktxArCKS7PXn1U1UfQ7xwQo0hxz1eP345ZEzcZl010nhwGInrF83aOc5R2QUiqJzcB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250265; c=relaxed/simple;
	bh=kllU/PO5yd0KqldHx3vW8lUAcutARjldoDUZTZSnZQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNn4iQvsPkjTfvNyfyvmjohRbG3qkaQgD+O8u/oUeEb2mtgsW9eimoqksf2loZBBQjZyNKyT/7UiQhP8YbCxSfL+wpOZNhJvWq5Y+fDg1OQjjDvITDvhsj7xXuEIDtVPuCytl935hHgNhf2rICPjvmROLW54Hm2COLOj5pvml3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CfFwFoUb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CfFwFoUb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B801F000E9;
	Tue,  1 Sep 2026 08:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788250264;
	bh=Qux0O5lOdRD2FoGhvNi5u1GHbOw47xkF7AihaOn/S1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CfFwFoUbV8B+mBMMbmS/jKgcaJFJ08JzsD6z5vecV/3h2DAL0hCBIgauu3LkuaAe0
	 8ppyd81SV8toVbIsE//tS1UOeKnFRvrl4E/g+hS3XQvzJFspkRkb87y8Y3OuIM1j5l
	 uSNY1MqmFAYNHz2l91u6fIKGZwhCVKw2qzf/pOxtQu02xkMJvgqNR4EDv8iIP2P+ah
	 yVBayKkxshAkY/pOrhEEx8e6/BDEKAh4a6IrbjWIeb72x37r1lRDrf4wgIOxJWbO7l
	 eVx0wqTyt6ATgAybNlLlNhFaqzKdrWbDZTQGquIcWlTDZBCfmhx0aIK8aneJrzS5UQ
	 uJgWloEA15Hew==
Date: Tue, 1 Sep 2026 10:11:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] ASoC: dt-bindings: cs35l45: Adds SYNC properties
Message-ID: <20260901-infallible-silver-chameleon-86866a@quoll>
References: <20260828-sound-for-next-cs35l45-sync-v4-v5-0-fe3feba709ff@opensource.cirrus.com>
 <20260828-sound-for-next-cs35l45-sync-v4-v5-1-fe3feba709ff@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828-sound-for-next-cs35l45-sync-v4-v5-1-fe3feba709ff@opensource.cirrus.com>

On Fri, Aug 28, 2026 at 10:46:26AM -0500, Ricardo Rivera-Matos wrote:
> Introduces support for the multidevice synchronization (SYNC)
> bus. The properties introduced allow for the configuration
> of the device's transmitter IDs.
> 
> Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
> ---
>  .../devicetree/bindings/sound/cirrus,cs35l45.yaml    | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

