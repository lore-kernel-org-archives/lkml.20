Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402419;
	b=iQWiDJ17LdzkhQlby4XrvAdCB3eEozbTCo1jHfeZNqCOEpnwSqQySGeAlQMkUjW8k4BL
	 iQvbSn73r2MSX9WnRe9UVTD3q8st1FqmouCfXWHaSyv94GuOWdk5GHbFqfilmq2XFMEwv
	 4WCmvq5Tu20/GHuYfScnJEC+VGKHF6AfAM/IJsVh53DjsCVxPMSnDTJa8G41fCCCEniJu
	 sPmqpbuEDgdr5GjXfWaPfMcx0J+7wej1pCt9eTr1awiQpx5vnfstTJSbGM4jvIfLO4DAU
	 zx6XU/ahnuAmQYiEQm0Q4DprlMTau6SJ79B75uR4fPMFhyWK/cJ/sBIB6xib/ChfNOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402419;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=qDgJN/3uyXucx3MvWswasgproOwS7hGFjV3S9xLY8ak=;
	b=NIvi1o06bykSkqUsDpyTleLvgU/ZzlFbxhm9A77FLt/aO4xLaKVlEyGv9HRzzern7Bgb
	 hH4VSv41mmcIt+sdW9rHmGDZgnUj9vcDzo1I7z+5LCo5g92HykGx17udR1znw/Uv6Khq9
	 87RNOckm4SU3VmO0DjQRTxAQiepu6/1UTZJFdmh5PQ1SOp4SxPqbhZnercrzNP36+ub33
	 l9JrQcn3SzSmqjj9Kz2SHAo8AwXvZnDN/spZtiszC7nzeGQunDpbOV/KeiYpm2MFf1TL5
	 jxbCP/XvN2fxlFoCKad5B2xauBBNbxRy/bNbkee4+YQwre7/FJMImqJ21m0tXFHdLOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cSOkcNF0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1520B606A31C;
	Wed, 11 Nov 2026 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cSOkcNF0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AF011F00A0C;
	Wed, 11 Nov 2026 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402418;
	bh=qDgJN/3uyXucx3MvWswasgproOwS7hGFjV3S9xLY8ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cSOkcNF0tYQXbkEqsMOH+/P6GrQwv9MhqNLJR2ZP9Frbq8AYYJk0KSztoWiPT8K+U
	 iWJXBRQ6w+YBL9CXnC39H/ty/fDojjU0WD0xHTpWyPHqdwqluEpYrBfKXoq7QpTPlU
	 EozaddBxYTTpvNe1qdq6shEOQNQiBqg95HG18V6ARLBdNfe3FCtj9iFndxwU3KegWA
	 szBOaD2i7iy7jz02MAfoCUhOHbKEFAyAJ5cNWeReWRnW1BzSZPIC/5JBbFjpM/n8Xv
	 AKjYhCCG4YSXw02hdIDtJeeueQYvqqCVkdLQxBxnRF31u9Ab5AbUksx43NW+sT1kNM
	 e5ZlZ0cWRQEDQ==
Date: Wed, 11 Nov 2026 14:06:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nizat Mikayilli <nacht@dxdmail.cc>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] dt-bindings: display: panel: Document Anapass
 ANA38407 DDIC
Message-ID: <20261111-durable-passionate-sawfly-5cb0f5@quoll>
References: <20261107-b4-ana38407-v1-0-c8b33147110a@dxdmail.cc>
 <20261107-b4-ana38407-v1-2-c8b33147110a@dxdmail.cc>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261107-b4-ana38407-v1-2-c8b33147110a@dxdmail.cc>

On Sat, Nov 07, 2026 at 08:47:25PM +0100, Nizat Mikayilli wrote:
> +required:
> +  - compatible
> +  - reg
> +  - vci-supply
> +  - vddio-supply
> +  - reset-gpios
> +  - port

Do not require port, unless panel driver or panel hardware requires it.

Best regards,
Krzysztof

