Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6958265621;
	Tue, 15 Sep 2026 10:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468899; cv=none; b=E6LQlUdExTk2gc5QrvlRdgt7aElgykRKR4w74Z0A611bIypu7GzGfRQMji+RSextOrGvsLIlpvR7OqZ4sLoGJ2eS1vYoM7JBC9nKwc4akXGAx+mhICJ39YKckfRCznAXURYx6wHSx0DEVEhpUTdYk9U0NhgFqzibsyoRwoKOCHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468899; c=relaxed/simple;
	bh=jikzcsfz1yF8WLE1ADu6jmGYlfIwzD0Z0QK0urWwdI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+HWljhIO0kMw+/QBs161/wMVnFpOD3yQrKAF/aaUNxiEigdDEgGWw+jYecvlgRCt+UdsYLbRTkMIuUMbZktqUODuBRY/8dgDBIlIxXPnj2EPVo4V0Kf6gGyEXMGjpo7YD9udPW774OjvCcUz+u7qW04+tfxC2bmZ4Z/v0oWee4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iU6AAjkP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iU6AAjkP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0341F000FF;
	Tue, 15 Sep 2026 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789468898;
	bh=Z3n8Dt8JvPMMO8BuW7lqztk2z8qFFdCmvnz/BIiU4i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iU6AAjkPFj9Hj++Naq1Vg/Iw8Lq0NmiMSmqpadRnNFRqDno/tlBiPYKNOi6mQZUKF
	 7sc+8uED3EnNp5wG1Fjn1tgFv6dVwfhqA8TJUqTSh2XVViQlfsnH9rVTYuiFx4uIE6
	 CBzEIt+hSSsEGhZmHVinPX1QbgTqvxKFBKbnNDgCwejNbO5zEbjiFSYXLCeIBx3/6s
	 CsU+T9SsU6C9iogqZ53Fjlb842ByauU7ePGPT0OdagNK6mCPFEbU+bRFeNgKmZDiD0
	 c92vmfgMn/IMVRknXNXzN8DXVl25iAOO9t93mWY++KsrfKlNGUFXpF466DWAGjvQ0h
	 nrLic9XxcCmnw==
Date: Tue, 15 Sep 2026 12:41:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nickolay Goppen <setotau@mainlining.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>, 
	Alexey Minnekhanov <alexeymin@minlexx.ru>, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: panel: Add Novatek NT51021
Message-ID: <20260915-determined-nondescript-hedgehog-fcda08@quoll>
References: <20260913-qcom-novatek-nt51021-panels-v3-0-266bc5d7e8c9@mainlining.org>
 <20260913-qcom-novatek-nt51021-panels-v3-1-266bc5d7e8c9@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260913-qcom-novatek-nt51021-panels-v3-1-266bc5d7e8c9@mainlining.org>

On Sun, Sep 13, 2026 at 05:50:16PM +0300, Nickolay Goppen wrote:
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - avdd-supply
> +  - havdd-supply
> +  - reset-gpios
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |+

Drop +, not needed.

With this fixed and without fake tag applied here and to maintainers
update:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

