Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813369;
	b=ADVHf4Ez4djf3MMSddZN1E7rqVGahOxGSv8WFZu3yNQKcsLwN9k53Beo5o7QyPx/9IQt
	 mZT4RcSnFc+52jzAAxVI0FVmDYEqeKX67QpfRKjcP8TFtQoszyRDru2eeYp5+ym72BxSn
	 K6XlHusCMD8OYzJjf50SNKwdVnHydf6lHkemv9u68N3uaDNRHXJ2EW/ppichEeVqKkKKl
	 Mei8sxYWYNd1IELayrPkiIehSn9KT9lePqBmoEVGMoMIwUxp67kG1NmOiZvto7Imj5RKT
	 5FzOMoRcWQPgRZ1w5TifySsEQ4ruVqGvLBMexQcNG1ryDDcjPEYNz5PlUatAWyiSobQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813369;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=yDbkb1XED6qncOAadzXW360XIzlZHMnFZRPOUhpQgSU=;
	b=sKqfNHVs3sWX0GV/e970Vog0NhCcF+Ng10k5uwA8LIm3D+cXb5HcPOwkmYwHU0RTDtps
	 nTYWv/MoBC3C6odmGMnTMipg5WcBwuvugS58oa5nk9gHylbjTNuv6R/1+y5vlzjGCX+59
	 ZgCryZ5ztZrptQuLTV8AuGY/S7KQ88JqAJFT39dIr3KgEX7R3tigzo/SmhqcvP8XuU3SO
	 ISNhQYCcRPPTGsBcgW+YqqjTvLbi4O1wf4W5WocH8o8hNcn8TVA8WxOPVNEPce8hjcvXQ
	 KBRBdL57YNgIwYyPDTNXcs5k4Eo2q3G+Uc2/aWp5OgMbMaTPSkZV3yfJtU9ipDssfog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ad3K59ZV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEE9606A33E;
	Wed,  4 Nov 2026 17:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ad3K59ZV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3244B1F00A16;
	Wed,  4 Nov 2026 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793813368;
	bh=yDbkb1XED6qncOAadzXW360XIzlZHMnFZRPOUhpQgSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ad3K59ZVwey0zN+ISekqtJdevUXZTFq9kr5r6K9gxSakjrzb9VFhME1mvJWxZZCbR
	 C3okzBzlhkWouCNkouGn0AwWpmtcPyuK0AlxNRavWXvZ0Wh5UHW424pQYEpfBinoXr
	 ZyMZSDhubMTw/4GQN4BLOV2yPY8j+Vs6GZOs/n1hKOn7MS0BWjtc6GdGGlAYue1k9O
	 Wnd5QnSlC+APeAjd5WL8RVORlBTdbO/bcWky9AkIo+6M8q02hod5kE5bNH+N01lIP/
	 AV53S+B/1sNH08KkjMMsMcRBMj2rureyOC4U6CAvXRhBpXdmkpGRUa341Hqn7KZHv2
	 8Yg5aTzE07zcg==
Date: Wed, 4 Nov 2026 18:29:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, LiangCheng Wang <zaq14760@gmail.com>
Subject: Re: [PATCH v3 12/14] MAINTAINERS: Add entry for Solomon SSD16xx DRM
 driver
Message-ID: <20261104-shrewd-traditional-goose-a382db@quoll>
References: <20261019213726.4145532-1-devarsht@ti.com>
 <20261019213726.4145532-13-devarsht@ti.com>
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
In-Reply-To: <20261019213726.4145532-13-devarsht@ti.com>

On Tue, Oct 20, 2026 at 03:07:24AM +0530, Devarsh Thakkar wrote:

> +DRM DRIVER FOR SOLOMON SSD16XX E-PAPER DISPLAY CONTROLLERS
> +M:	Devarsh Thakkar <devarsht@ti.com>
> +R:	LiangCheng Wang <zaq14760@gmail.com>
> +S:	Maintained

> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

Drop, you do not commit there.

Best regards,
Krzysztof

