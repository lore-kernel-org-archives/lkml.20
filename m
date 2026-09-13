Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7A1221FD4;
	Sun, 13 Sep 2026 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289870; cv=none; b=onb5p2yGOlDhmdyyQa/QAV+uxkpW+Lut6tWLmOYXalbevMp9k/V7/rLJaUMO2yN7iOU4UkgnO/1k04fEMPgxlJES6JyYN5HHxXgrKMihG9GXrqNrh+d446JtTzNnWTnknnGQqC5zDcFJGCOcgjw0YbXwP2ge9+mUuQe/tAZiZTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289870; c=relaxed/simple;
	bh=eIOzI303xfBSwyElMHDO20cFtNTuruZh0wLsiag+ytE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKchQ1Hd6S+d0pSouL2dIsLb1AQ8f717NDJr7AyANkBopr0Y4FaNxVPNbMxTDxcs217PFUltaXgl2SwCZTUeHkTSjXh8Fj+TSvoTHUbJkMdaWCNS7u+XV7hCAQJyUEUgLUrDDJ7FHfZddw22UbQIUWoeTPqYE2etrEwl6hSWAng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOLk4XZ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOLk4XZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2F41F000FF;
	Sun, 13 Sep 2026 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789289869;
	bh=bXBKTcTefX9SVPzC9FRI6I0GB4s2HxzZxXrettj/Cj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JOLk4XZ/VSYM35I495tyPj/RQDivuERf8I4jfS3T8zGt2M3MN+Gzeuw53r5G3mISD
	 5krbYJZcL0ozfIOznhcidk6AxXsBNUJM5bM0INz9Duv/fnUD4reePPlKKx8cHz6Iil
	 oNWq/UeRcnfbMhEyINhZNZf8TRpHiyjTUj+bEJ/kcIi86qA6BsWFzPa1Vuai7wDQu2
	 X2NEUUPqocbvIh4YU36H1cLE3BNVoxlWXwAq6R5tw8ERHpVvbC8f/v82bAFvvsnmo1
	 KhYvb3Bewrq3nRIUcC1K0QbuGvE3Yzeoa0eGq7rS+dF9SfcpcxHIS6rRszERKUxNE7
	 YD4ar/zca4+Ow==
Date: Sun, 13 Sep 2026 10:57:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Judith Mendez <jm@ti.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: nvmem: uniphier-efuse: Add
 ti,am62p-efuse compatible
Message-ID: <20260913-shapeless-adorable-fox-5c1fad@quoll>
References: <20260910155509.1425682-1-jm@ti.com>
 <20260910155509.1425682-2-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260910155509.1425682-2-jm@ti.com>

On Thu, Sep 10, 2026 at 10:55:07AM -0500, Judith Mendez wrote:
> Add ti,am62p-efuse as a compatible string to the uniphier-efuse binding.
> The uniphier-efuse driver can be used to read AM62P efuse registers as
> well for GP_SW silicon revision detection.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

