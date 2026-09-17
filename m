Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D727849D584;
	Thu, 17 Sep 2026 18:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789670868; cv=none; b=p+pr9yLCqEKSzpMWBV17GKksfx9xcc7Ujm65eoT6co3JWSDU0ZeLyiEnWcpEzEWjjFbveWZSBhH+eQjlRvUxFsY073qNvzVii+RrScphLJkJarYU9umoPn5bA3YUzSBx36Xwc3pKK6NqvM7tesAvfgvNO9UWrQZu7W0DLdax4ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789670868; c=relaxed/simple;
	bh=jvSlXLjqrSDxQehhD2URqRiWuPZMcVWvKwN42FmNn9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVL34UgYOpaIrutgINWIDLdstf+bYWy9nokDvcxqUwHbLbTdaP4GaoXNj9gN1pr/z+zclqMG0EOQ0uKc7z0dokFZD3YRt9tIpKm02j187vcNSQh6Zm2KvUYGqpV+zDaxnRG4blcr1lqzuPBVTS0U09nD/kjziJgFxiYtt7J9l28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BB2+jnct; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BB2+jnct"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD311F000FF;
	Thu, 17 Sep 2026 18:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670867;
	bh=hoi8WX3DCZ2p1aQMAVpPAaAI5VyfQnIrXWk4MAN4EKM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BB2+jnctfYN0AwSvguJMW3rc/+2ssfIsJZvSy9ONwsCf0EV6KMZIlUi14Q8y/oTn6
	 cQbVbup8QpNHZetMaqZK1ntYDnPH8p6SZ5L9fA8xMNwJLNjaapa0Rihzie4wzJu3+N
	 l1RMtwHSsfXpZ/hG9kjbl7WeXd5ajCL8cTPqnkTHcOiHQfst/lKK5dgj6FlLPC7lK8
	 dRa5CK/70BRBj5C4TbCdZ3q1bYp24DZeAFSb+nEIT2/mX1DvPCI5NPZWwKKMm83xEn
	 PDCeuR2/b+R+i731sZIjseF4AIo8N5vZwESY0xGf/EWDQ/9gqIzhEdvAYwt1Exav5m
	 VAzHXnneEdBCw==
Date: Thu, 17 Sep 2026 13:47:46 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl:
 Correctly restrict number of resets
Message-ID: <178967086592.3096341.16943496243275631637.robh@kernel.org>
References: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260812134455.179663-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812134455.179663-4-krzysztof.kozlowski@oss.qualcomm.com>


On Wed, 12 Aug 2026 15:44:57 +0200, Krzysztof Kozlowski wrote:
> Add missing upper bound of number of resets for Amlogic DWC3 wrapper
> node, because "minItems" alone does not imply one and any number of
> resets would be allowed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

