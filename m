Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAAA3D45E5;
	Thu, 10 Sep 2026 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030409; cv=none; b=HODgvkBQDF1Eil1EtnThOeLNfi7ildGk55XfyfRm0gQdZhm8LGEnKDYR7ikCgiyCjWAxZZeaxvzgJasknbKkgVjgM86H4lU6Ndr7R8m8YCjb25sZ8TebLOhvuirx5yVvDzh/I9D4Q8hohTYful1AwBKHDuzB5vCsXd7BNmD3PG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030409; c=relaxed/simple;
	bh=ibPGrVmhWo1WMQFj0NIuwOLZw+N314IVBsk5FagbVaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZc3I/qlwoHwQZd0LZatPuZFanlXnryycDLLOU0BAkqbBaCQuA27oAWIgh++ieM3RjlQK1I0PHlyyr9wo78fjQXsxO6Fr5rsMBuOrHgzXQjspMqiejGONzQ+ScQ/VZqyhRhxpfoJNQ/vvFZdDvY3aLAkVRA4yFaOktOT3Bo84zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZzAFjEtg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZzAFjEtg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0612F1F000FF;
	Thu, 10 Sep 2026 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789030408;
	bh=rb/nWle+SPnEXKJq1ypUwPmXBvGKN1UyzXMzt0Y/Pa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZzAFjEtggz3y0hm/gSNdIUPZ0/v8mA9N7TPqwNZHLbl/JsN1z76eGV0mn8gkGhb3j
	 Icdxbz4qSZtxxsjNB24x1C64Yay7U215TDz2K3mlyLSU1lqEAbydcQqQwxy2iVtwEW
	 49BwRqmHclLsHo/kgCDMU7swvQNeGKbnKU/1dsKZqiD+uS48kmHoEuLvZlAXvk4o1l
	 nMPWcMEjfPZ3ClDHkRnTB0ymbZKAf5W9EdX9tlEYPOogfll1BCLoc/l26MKicrMXMc
	 UBISW6h6AxeBcdHpo42sWwEyRbYQCXDQg9LKq3wpaVwZ/3myzBrVvnaoRLk5B0hmTq
	 EinFhfmkh3bcg==
Date: Thu, 10 Sep 2026 10:53:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joel Selvaraj <foss@joelselvaraj.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: display: panel: ebbg,ft8719: update
 Joel Selvaraj's email address
Message-ID: <20260910-auspicious-aspiring-frogmouth-e6da48@quoll>
References: <20260909-update-email-address-v1-0-94a240f9469e@joelselvaraj.com>
 <20260909-update-email-address-v1-3-94a240f9469e@joelselvaraj.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909-update-email-address-v1-3-94a240f9469e@joelselvaraj.com>

On Wed, Sep 09, 2026 at 01:12:01AM -0700, Joel Selvaraj wrote:
> My jsfamily.in address is no longer active, switch to my current one.
> 
> Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
> ---
>  Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

