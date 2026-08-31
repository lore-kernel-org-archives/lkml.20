Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF263BED7F;
	Mon, 31 Aug 2026 09:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167142; cv=none; b=IO2d2paqDwI1InM1Lo7msHdiEBBExpl5Z1MhBqZlA/jof+0cIuLVbndYf/84KBiDuzKeLeoAL7Cx4DNdPobfpDH3Z2oK3gHyIAbDvs0otnkF0+qYL2dzeD3wb+cQbTuo644orhqiRDex/Z8Hk+EOVrafMen1JjyOx2y3pY4c+a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167142; c=relaxed/simple;
	bh=w7YyoJS5QaauGmQpdZzJhiiLfBTxs4FamTHMunXnIvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sgMI02fGaTSxJEM9eTHKMpjJUOgcoo7oWVD/4wm3jC+IovlDJ9P7AC+quwWS5WZCcwTlYqaiB4njkDsF9AHt/830U1jGgfcUwWc3YzMz4slNUUwYLJAcOOfXSGys195HN180YAKvD7bcdmcWsqlHnEKsDJEmjvG+vf9bVVYhWYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z9wMnEAg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z9wMnEAg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8F91F000E9;
	Mon, 31 Aug 2026 09:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788167140;
	bh=lkFnYsQr7htHEOaaPnp8C+GnUFJy0U347AxVeU6TSes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z9wMnEAgOQfc1dL66JxFc/2TGbb9YSV2AT3P0+nKicGai1qB8RClIB0ZrU/dwdsDg
	 H8L8otRT7Lwyjyw9iPCna3nxemYNZ5vd5wulF6azKV/yPrnRxxXHXCcdTZKZRisi8O
	 YXvHesMBQYtdaQALZmlwZF3LUnjonEdIgQsK1mnj70lN5Aea+NN1xS1H4yucNAlpFt
	 CB9uHNyqF8mYmItc5DOBkAp0h+r//FCqJRNFlCVzdX8w+s20cmvI+Kag36klz99Sti
	 qD7d4/40m82mWj5AfWsxCFydKFl6etrBuQGyP8uKnfw8wPtEjPROrGSiQk6GDTlnJi
	 t4uCBnAww2s8w==
Date: Mon, 31 Aug 2026 11:05:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?Nicol=C3=A1s?= Antinori <nico.antinori.7@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brigham Campbell <me@brighamcampbell.com>, Jori Koolstra <jkoolstra@xs4all.nl>, 
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v3 1/3] dt-bindings: display: add Chipwealth CH1115 OLED
 Controller
Message-ID: <20260831-brawny-original-curassow-8fa9dc@quoll>
References: <cover.1787973729.git.nico.antinori.7@gmail.com>
 <5e1a01043e1935d59d48630dc6211652e64b108a.1787973729.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5e1a01043e1935d59d48630dc6211652e64b108a.1787973729.git.nico.antinori.7@gmail.com>

On Sat, Aug 29, 2026 at 03:32:13AM -0300, Nicol=C3=A1s Antinori wrote:
> Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.
>=20
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
> ---
> NOTE: patch series based in kernel v7.2
>=20
>  .../bindings/display/chipwealth,ch1115.yaml   | 81 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/chipwealth,=
ch1115.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

