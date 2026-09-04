Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B333E6DD2;
	Fri,  4 Sep 2026 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510779; cv=none; b=GknnWd/S1Va/SAcrXrvgdkETD82duYjIcmWZLvUgAEx9Qfm6tPLRSE8ySvBwOl5VGUrMh8efryKt2pq0sGPxQ68XjnkwECqR/IqEmaSkxvtYZfJA3hx1TF7O+ESilzmN4tcQj/RWdnD+06tueI6ty2nrVGfz4b++a0Pa9em6aNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510779; c=relaxed/simple;
	bh=bdBBr80WzZOLTqWhW8VfNNoVoyLFpwq6+TpL3iUkku8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=b7Pa8NKrsOJqC1iC+c0wuNS0gMznqRUOlX9KpkX5JMkbaQpIMPFCiQJuVE5kZts2jDe9+/y4tWZAV/sdzIvd/IGbwLuAx4j4beDKaTgjpOe1meZJe8zW9Bk2WmAk9vkTtFzakMB2zI6JGocO6HRXY7sGBPQLV6tBv5O+uRkb6Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bpf/CL+m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bpf/CL+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDF91F00A3D;
	Fri,  4 Sep 2026 08:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788510770;
	bh=AQO2yLCuvyyjb9kwnOf42UURUHWUmykZv1MVLPFfndU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=Bpf/CL+mJpaJzRAHF4YSGGkjyZT3Tgm8ZZ00BZVxvd300hDOS32rnJUr4NJxPZKgQ
	 lWn0O9g9v9ZvzRWkIHkwQuLcbOq/Iczn1VyoAO2eL7q54UsTiHcT8rXKLUAA0aBAQr
	 em3QLSDP4uArMdwvMQWXZ0MfTWHp4KXTY/GGVdVAsByHIhm2rzYBhpi9yU2NQPgtnt
	 QYCi5Gb4vQCjjrGu9ouZCOkRUlR6JvvmDrNqOvg81ov29WM+qI5Atuc3zNmCY7gVM0
	 P8St61CwKFdyqIUJjbkfWlhTfehweZ+aUyF9BbPip2GRJKKQh5qBMt4hZMazS0+7uQ
	 NuvgHLm3SyvUA==
Message-ID: <c25980ef93153c0edc6c5bd73e2e2a6a@kernel.org>
Date: Fri, 04 Sep 2026 08:32:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 08/13] drm/imx: dc-ed: Support getting source
 selection
In-Reply-To: <20260904-imx8-dc-prefetch-v6-8-26643e3f6cb7@nxp.com>
References: <20260904-imx8-dc-prefetch-v6-8-26643e3f6cb7@nxp.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Conor
 Dooley" <conor+dt@kernel.org>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <lumag@kernel.org>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Vasut" <marek.vasut@mailbox.org>, "Maxime
 Ripard" <mripard@kernel.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Rob Herring" <robh@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Shawn Guo" <shawnguo@kernel.org>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Fri, 4 Sep 2026 15:54:58 +0800, Liu Ying wrote:
> Add a helper to get ExtDst source selection.  This is needed by
> disabling CRTC at boot in an upcoming commit which tries to get
> the source selection.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
