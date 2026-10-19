Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC91A45D5F3
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392956; cv=none; b=rHaW0ab3/XShmbY/5nx9BiFU1I0QLxbIxVfV/LI8rVvXNyQA8IfsatYN1ac06SKA7GMkm3/khLQSpVr3UDYcSCpKHNZWCfKWCAirGxpoWrJXSwiUax42SdcJM+I4kG8uhO6cbGVVA6PV7fEbYYc3fvAeJR7yK1vgO2VqDQTNWrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392956; c=relaxed/simple;
	bh=FZ2zwSutLzynNR3SPyrjH8fZEghMurXsmINrjU6TAss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjslLelkrX2dQoFf2tthtwT/ngJuANou+JDOa7WLR/VyH5stbLy3tJTf5btkm8qVWekwMXdXPNB9YF23/YDcuZvQON+6OxuHsLXSySP4l+Ptbo+xN7MYawu8ycMx8rvMY094UxIpk5C74BX92Wr1Qqd22tdyoF/4tVy8pNStv1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HvmUoZmC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HvmUoZmC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso17314805e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792392953; x=1792997753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZ2zwSutLzynNR3SPyrjH8fZEghMurXsmINrjU6TAss=;
        b=HvmUoZmC/U0CJEIPObIymq3BkW7W0A3RRd/zNZIQb7tljSdQIec4Kpn//g54HtOswU
         e8XbY107FOLbx/dW9vlHiIirX/ueoblc20vytECa0aWzfHqlyjjnQUnN86rEMzem3foJ
         FkVPqZv8mCrLFfIPypOyib72C/vDz9KoI4A7OTTEEOrPdmDL9rFcSlEXaTG9g5hw/NjU
         7iAQC42fbAVYs+n9/BPiDjm0oX/H9Jqdahf3YeEeLqLoKT8GBgFk/z2kiWu1u4Gxg3lV
         sGr2pRuTfnr6x/qZQc8Jy7lHf+OmmSurZSdg7qPlmPymHw7DDAxsg2UfscQfVYdZ2Zzw
         G2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392953; x=1792997753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZ2zwSutLzynNR3SPyrjH8fZEghMurXsmINrjU6TAss=;
        b=KDfWKNpmmipa5lqcQ2+EIhH0PdFzL+RDc0dro7TOd+l3iu8aBzz5MnruXpiNAIwDgg
         XkO2q9PIn4FYXoYjD3CcC2I5tThiHjbUmQZC7SyGioRWtqoyp1GfJgQLGTZkQX9Y20fq
         yRU6k1H2SERQ1Yu9AVcxohPF67VfcIHXd8KwfdyLLRpRpYnamLe7VXck5jMqML2E39wE
         NP0rkBwJaka7ouYqgHkdeYJ96i8/E+kH/SG0DRnFoF/aJHa8I5HJkTatU2LUOiKNi3/w
         gAI0DG9XmVBwe1nCjPg+Jtql95qRoC5Vc07utXEVYM+XOkTUObeW1HjO5PkjwL0nPG1J
         9dVQ==
X-Forwarded-Encrypted: i=1; AKwUvByGLY8X0P9UgnRYJUyALACFUH/2F7QV/H0Pv/xM0IHnRxrUguvp3uL/hnRAjFGQzrYJY+0/J0gW05wmUVU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2rMrzY2MHkpbFELFidWBgkvBxQ/wxnh4j0/tXusAuNY97hCLV
	e4gP2nUMjQUGUiHY3/jqbCMDq2v/JKZG2o4+pHEDUuvCAXGZHId1u3/CC3DWnmDz/KY=
X-Gm-Gg: AYBFou06G0JsPaqgQyb9AKkSS9P/QPfTAFecIL4JvQViqlY9ArveELdxKSztBDmCriJ
	UXf5nOHCYQlNJfg3u4KmNHkSNHR8RSm64+6KJ93ubmuil3ItvSuTfqUFr1VrUy7kKPUyYdxz5Y6
	4k/HG6dpw/evibcU5QF3WCzkeC8qI/DYpL3AQT015GfjGDtNRdBkmH0YWkYL6H3/To4GZryEyPY
	EodmCbGE96samyt4nKPruzwxPevaosgg9iHzL0DMxpog7reBW3Ts4HkxXJSZaxj8jspjmDQACb1
	vfzrE+Q0jEC7UEJiONOa6FhKGmIxiNxiGFLvpy/d/F30QzsiGgfdvFZ+0q2R0fq/NF4+awetDd4
	FhOzXYp8yj7N/QY4hDI7DgG/ZLDytNnvlPpK0s1DAJoqyrGf9fuB8X7mxQ8UEzoPGQiqw7Y7HNA
	scXxO4egS0l0N6sak9KH7RSCBM92rw+7j8f3ymYGi3NGAIS9Hb0sELOcx38VBpJToRgfk/oLTm3
	rtA2AKaOgts302Z3xy/IoStxE4cftEgd9d9R88bmxynLq+wAuoxbNN61SVn/Do=
X-Received: by 2002:a05:600c:8519:b0:4a1:722a:d2a3 with SMTP id 5b1f17b1804b1-4a1d760d830mr178658705e9.23.1792392952999;
        Sun, 18 Oct 2026 23:55:52 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1ce3302b5sm172293625e9.4.2026.10.18.23.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:55:52 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:55:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: tianshi12127 <tianshi12127@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	dri-devel@lists.freedesktop.org, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/panel: add driver for Smartisan TD4362
Message-ID: <atW-ch6H9WggWrAu@monoceros>
References: <20261017083531.766557-1-tianshi12127@gmail.com>
 <20261017103250.800109-1-tianshi12127@gmail.com>
 <20261017103250.800109-4-tianshi12127@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ytu2emq3ghdudri"
Content-Disposition: inline
In-Reply-To: <20261017103250.800109-4-tianshi12127@gmail.com>


--5ytu2emq3ghdudri
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/3] drm/panel: add driver for Smartisan TD4362
MIME-Version: 1.0

Hello,

On Sat, Oct 17, 2026 at 06:32:50PM +0800, tianshi12127 wrote:
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>, that pulls in a lot of
unneeded dependencies. <drm/drm_mipi_dsi.h> already makes sure that
of_device_id is available, so you can just drop
<linux/mod_devicetable.h>.

Best regards
Uwe

--5ytu2emq3ghdudri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVvvMACgkQj4D7WH0S
/k54LQf/Uhjypbnj1ODuf9SNZ0G+AxzxxiJPag9wwZDs7qe4jie8D09Q66x3TN57
yYyjySPnatXWtfX97FW4mzln9pMGWaHlUsd/S+FZKgDWm6Kl5UcwiNdd6Pq/Y7Ko
NMMKlEBaSDQq4IIiINzrblck045eCWfMz5lFU31Ub62gt8odV6wXiKJJdY8MAyZ0
gxiTiFrxi9umgHdrlZy37R3PVW06R1CYFyBR5Ou/cIS+6CQBKEXCGwOaEP2h8NG7
0dAOrN2EJcGqcImgdrzJEFn2qSo1GrOLN0euisKqSA2eU2uoX/pG990ABYWO6nnj
5dX+KkkM8ZyxJbseo8q/CT0upMYVaw==
=EMs/
-----END PGP SIGNATURE-----

--5ytu2emq3ghdudri--
