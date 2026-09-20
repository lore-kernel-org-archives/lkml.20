Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AC3349CF8;
	Sun, 20 Sep 2026 11:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902308; cv=none; b=aac4OB0Ex9xTmxh1Spa5YtMoaF6OSMFI4rVUTBXtIQeCOahK5WSLMBNVn2Vgi1ij+r7VMsLYcVcyLm54+eYqEzKxHV3xaywV9gzT4GEFqqUNUPotqbIsdlbQZix+zOmi1iU2Z+xoVIDZzybB0WhGlwaEoD6bQiz84LTk2zPgz9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902308; c=relaxed/simple;
	bh=70vbilDEjLIdM6cZFU2A28ziQFY3kHfHzEgumbuw3O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CSUzf1vlxUhPjQJJv1+08yF1ds8hEcPKfpZTpV6FpokfbWoHhyQzwQEwZvHzhRZNSdHQYYH193Gsu9pKCqj0RCC4o7dkWor2nv+3F2vTWdJwjNiLJD7aQQM5teY7dQ8zLmqtMnJNNOQNcyfFfA+hVyvlFMGG1Omww/DIBn3BK3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebHO/mPk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebHO/mPk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 706091F000FF;
	Sun, 20 Sep 2026 11:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789902306;
	bh=di/BbTISvG4/OjzNVLYs/I24TNETqXYR65gNhidz4Xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebHO/mPkO+CtKbNjfH/qXxVV0WNhT8BZht10185Ju7NJNOWXS0bXtDJo31kOEXwgX
	 nraZxF+uYuYlzeUUSMDmjW1wQu9qN8AEjGT6ZIJNpjejrtlxyPOyhuGZ3fZJ5uMUml
	 U39LV1DPJU2voqqcsmhRXmRipZQKb6t9CevZFYDYVsxg0SulanKQAkNEMz+Gkd+QR8
	 arkEqGIPi5b2MDEzoV0vAdCrd0Dr4lh2f7GDnBEGU6DUIFsge6qSU6510kZZOvDhzB
	 Dn9R8S0W5Gm+88mxyrWPS0/BbI4wwgkY6JVv1T7iN08Y52EoXWP0Qi3Eyo/WzblnQ8
	 1XoRDfB9v+JZA==
Date: Sun, 20 Sep 2026 13:05:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: Add Truly
 TFT320240-229-E panel
Message-ID: <20260920-thoughtful-brawny-snake-b06d43@quoll>
References: <20260917110517.1053556-1-alexander.sverdlin@siemens.com>
 <20260917110517.1053556-2-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917110517.1053556-2-alexander.sverdlin@siemens.com>

On Thu, Sep 17, 2026 at 01:05:14PM +0200, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> Document the compatible string for the Truly Semiconductors Limited
> TFT320240-229-E 3.5" QVGA (320 x 240) parallel RGB TFT LCD panel, which
> is driven by the panel-simple driver.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

