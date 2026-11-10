Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314946;
	b=LVVdyvukVlU3IVVsSxG1T/BtxV85sarTJ0L3N3lm29Zlw45FtWgs1uHt8mgiOzcbLWPD
	 fbI623gEA+aiIgdfIytqHbLNG3jwEETFj5CzMaiCpMFg920Muwi3FPq2DRNepBjquLYAc
	 r5Fzmo4LGrD79mlC3MVzDnLR7k8QiqvSkWgpBEcpu5TEqwB89tCZweEKUIE3RJ3fBtt2b
	 N/UV5uzkdM6yq4u81YUp211PTSGFvrVBhGgpTTs43VSEle/xpn7NyR2KPBAahl7vpNtjB
	 AkMBhR/aoOK9JUQ0JaCJNnSMQBQXB60AaqktIiv/Hj0KP4N1H1vgHX6ndkdzCwT34rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314946;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=zHXJPTkKerzfVJJNUx8F5qgPDu406iPyqd9JEKnwCR8=;
	b=jdvIp5A9xr3YN6cJRqF2SH7ITXNznvEQzi/4NhYsn4uXnQn159rtLTt4Ql60+yJVA+xf
	 S/d/sqyC89UUyRVgmPui6hJHFS31OKHqcS1JQZqoMO+yv4oy/IhDg6aiU39NXSP8KM3JX
	 /I3bTKMB68Rxos9tTV332aL2EKHMb4fqqtTXGRxEaS/Mo2v8UjVvKcjDBlCg8WmiLbbeT
	 nCcNA0SCuCNLqEAcVzv2MctXXq0+H+1K7VOtoPKNwmQZLAYhPhkO3nFeqrBDrRyKhIXCd
	 IGsx9ALe2f5++V/vSok8grGaSyUlEMfn/ojWqY0M4i5/MooV/f65g6JTRGwAALIhPRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ljepd4rt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C40606A321;
	Tue, 10 Nov 2026 12:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ljepd4rt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B7C1F0089F;
	Tue, 10 Nov 2026 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794314945;
	bh=zHXJPTkKerzfVJJNUx8F5qgPDu406iPyqd9JEKnwCR8=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=Ljepd4rto1iEmd+Tcv7jE9zOVDTxqkpn0TOaeAIdWl8+Z+DP+jwrsgRXPqYQYF4qv
	 SFgTk6OwyIpolXoq1MLgNE0r4X93ZxEn9zCEvPn+Hawwsbiqy10OeoVgqM97qLHdQW
	 6dL0WnTVZAriiZhGLrPrPZBqb3w8vglv1sOiA6RRpehwliZVOBWXl7HPkEs6bL/MiH
	 him3PIskGnGVVjUAXONOTx6NGQSUHVeqMfj+31ChQwO7ltqvXyn1lc4E1ZCIkt/neN
	 z2bYRw1QMmZuk3L1hZHWaZuUvIIYvIu/RMkBY7dxVdzDfTivDj2//YWe93OxX/qC8B
	 cumb5sZPsZQ+g==
Message-ID: <aac5e0a0-754a-4323-9417-cc17d7d42930@kernel.org>
Date: Tue, 10 Nov 2026 13:48:56 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: panel: ilitek,ili9488: make
 the port optional
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Romain TISSERAND <romain.tisserand@gmail.com>
Cc: Igor Reznichenko <igor@reznichenko.net>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 sashiko-reviews@lists.linux.dev
References: <20261109160706.2272332-1-romain.tisserand@gmail.com>
 <20261109160706.2272332-2-romain.tisserand@gmail.com>
 <20261110-comical-adder-from-saturn-8c8fbb@quoll>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261110-comical-adder-from-saturn-8c8fbb@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/2026 13:00, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 05:07:04PM +0100, Romain TISSERAND wrote:
>> The panel is a MIPI-DSI peripheral, a child node of its DSI host, and the
>> driver does not use a graph port. A port is only needed when the host
>> links its panel through the graph; other DSI hosts, such as the Allwinner
>> sun6i-a31-mipi-dsi one, link the child node and have no output port to
>> point at. The PinePhone panel is described that way on the same host,
>> without a port.
>>
>> Keep the port allowed (panel-common) but no longer required, as for other
>> DSI panels such as ilitek,ili9881c.
> 
> ilitek,ili7807s and a few others have the same and it is confusing. The
> port should be required when this is connected over SPI or I2C, but not
> for MIPI DSI. I think that for MIPI DSI port is meaningless so actually
> incorrect.
> 
> Why was it added in the first place?
> 

However won't all DRM drivers actually require panel? see b089c0a9b14c
and 169466d4e59c which removed fallback to the child node.

Best regards,
Krzysztof
