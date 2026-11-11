Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402434;
	b=mi3qVDKcCfVTLlIKoiJ7bb7zdGAudzwh7H5cuSWnDDHva7jC0LpN9WCrkze01t2LhBjw
	 gVG/QkXBzq/djPi3oFLGtPf2rS+zwXV4S6A61T3pQ6+kRGWMKZ2kqizsChXvgqubnzWyq
	 /XOwHIfpCfWH6zwKiMcRpciheW3AEATFeVPdPgYe0mFwED+it5GbAN5/u8bql99fPAYyO
	 DpHLBprd6ZLZX1W7SvvOXdLxC++ik2GME5E0Y9IKlc1/Cct4OTpK6hbwuqkNsITYyv+Bh
	 HS/eQK/z3aD8K7UfwWPgMKT8OWKMO8EK3CILxl4ZfolzEbvV6cWPg4tKlAMpeN5ZmiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402434;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=hRYlFMkxE3X3h9ymxop0bmz7OPPkaLJpQ3oLl22U0eY=;
	b=xVXzFdw+q4isom8qoPL3dSazYDloT1g3nsLNubtr1jUUnrHnbzFyEAh+Jm6Vh/i6iJo+
	 KZNav+sQ5IgtTtaM1zcxj/dcin6sa1qpZisl8+EcFnQ921ZpdY+DCbzwrX6vTMomYnwxm
	 OfZC7wyHNWtdcWVad3yJl9x/aTfk8OYUgekMcirA478SUNOv1P7uAHmnuSAiRmqvr0Abg
	 JxdR2/1U/BXektYb2MdOir1XKyeVk+ZTLxgOT55rguHRn5vvaRJ3vxhl5SEcrlhZbAk1a
	 UX+0vFx3OswtdOufm5aARjIFMWYhNrwI8LwqXpA5vHiDzuxHCXMugDrGaJoxARWl7Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlfnUlkj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69376606A33E;
	Wed, 11 Nov 2026 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HlfnUlkj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E901F00A05;
	Wed, 11 Nov 2026 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794402433;
	bh=hRYlFMkxE3X3h9ymxop0bmz7OPPkaLJpQ3oLl22U0eY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HlfnUlkju7VQUoRhPAWBQsANTMKgJVZY80+9sI1fMr3e4W+LiSZqv3UYDg7FuV4cS
	 IbU9dkdId/KwQeaDw1aIZD8Y10SOz3//y7n/V19V3BIpVu8qd+sxXlEdQqSsUCOU9C
	 g3eDNY+37LCjcK8ViUh5SKiU3bDE7e+vyuxLHv39oQcDJpVPISOQ+61z8/yPPMVAUg
	 Z4ZNXLtwefFubMdHQPyCsVzJkDw+ZbOLN3nP+ciYzn7fNBhySKSTAxQhM5iJDTpUhD
	 qsPwhSggyGx2Ux0sAvOclbTV7ViOiRojZOBn/h+F/aFEBwJwZgi+Ho/xaK7FPKJT+i
	 HD3NjT+CCqCnQ==
Date: Wed, 11 Nov 2026 14:07:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nizat Mikayilli <nacht@dxdmail.cc>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Anapass
Message-ID: <20261111-stylish-evasive-oxpecker-eacdea@quoll>
References: <20261107-b4-ana38407-v1-0-c8b33147110a@dxdmail.cc>
 <20261107-b4-ana38407-v1-1-c8b33147110a@dxdmail.cc>
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
In-Reply-To: <20261107-b4-ana38407-v1-1-c8b33147110a@dxdmail.cc>

On Sat, Nov 07, 2026 at 08:47:24PM +0100, Nizat Mikayilli wrote:
> Add a vendor prefix for Anapass, Inc., a display driver IC vendor.
> 
> Signed-off-by: Nizat Mikayilli <nacht@dxdmail.cc>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

