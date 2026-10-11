Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE40146AF2F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760292; cv=none; b=g3OlGU92NkTubgPlmNAiCOxPPQSC/abfG+JgQeSisoztbvMbWEkPJqJqFhJZyq2yX8Bxb/ZInf5pzQ3oh3dAwTdU8BhCQzOMRVAXG4+jc5O9uVoa8s+wwxoKAlWbVaf8+EXLMjXlYsdEaSEZ+7/9TfSVUkHoU8DLy1gSM3CBQ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760292; c=relaxed/simple;
	bh=4H6bekOSDvZeFWBGmCsjbf8NHxaxS3LYMIYwQIqic5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjzovGgf+Ku0A5aOp9+1T0QqmNRLzqwEhsVhjISjhQnNvHXTGGHnKzk/wbLr8E9IWis1tTp2BAD88c1I/3BWHL1qqb6XzX8MzMVbYXnD5X7AZdPTDPX8wDV7QTSqPhPOAVYnDatEkfQ2UDb/fXbyj/rU3n35LRvQKB9330WfXQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QuV2objZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QuV2objZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49fbb2acc90so9363325e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791760288; x=1792365088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4H6bekOSDvZeFWBGmCsjbf8NHxaxS3LYMIYwQIqic5s=;
        b=QuV2objZdNMY0dEzcP0JaP8ZY/vWdWwrtV7R4BuVdH3LhLVks2r9qWYsXJkmoF0qAQ
         /mvU2hL38Tdqu2rPh7ZICkW7C4VWwpSPW0a/RGK29H36ZQiREb0hzXBMcBq8o5kfBpbf
         hvfIpbzhQO3Qbdkc1w2TGzSELOPgK0BrJpKVeFI4irryT9NzM2ei3XEN2KAGAn3hOofr
         h+X1VbAFLYgbc5BybjZtVFCw9l+0WKHuTs3Sutfu/5pDpCzLE/0mzomnUHmqE44S6pq6
         rVYqG4jPeBVzz/06zGTtwDEA83Q8qU9/m3CwILIc2lCHXlKDXdAQRWNpAmB1RuyjbvbO
         Ai/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760288; x=1792365088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4H6bekOSDvZeFWBGmCsjbf8NHxaxS3LYMIYwQIqic5s=;
        b=gni/JalnO0G9cG4qGigWy9grel0Aw+1ati1Ic1xJsUY8GINc5bvCqiwK5BxYDLotn7
         7oRgE25XEPla7V08Lj+vsELUoDy3Q61nn4Jk1uGtQSdi21MvtNNixSKdnyKoaJu7QFC8
         YsL0lKZf/VAnTKjmG3WSFrcAUvUIfOJr54XZWY9dwYCuWhm9dqjS7V6KH1t4I4DgWkML
         m2PhF+pxwj9mE1HRLfDVavFFUL0Xq89AvpZ1qU6Eyi5iD3vYZmkidWkIa/j8dgjhjHdJ
         CuyNiGxSScFpebLktoQ88pv2nCB42N6fYsAcsUyLn/TLrJzYzLyP1TcHFTmRWF5Wkq4J
         Jd6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxHTHBANOquAD0uEl2cSjU1KxtKocv7W3jeSu/rncPPNKPMsjPpb8mPtZdwSHODKj1qdLQx4dyGGveffG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjaMrCtceBR9glHjaWW85M3Xl4yvrSRmig1cm4fVp7Nbho1Bll
	GurPQcj6P4uPMhPMigsKDEXeAZjYqhFTUbVC2K0uL4B5mjLSZEFp2AjPsIPVZzKFUsY=
X-Gm-Gg: AYBFou0/DqL4qFood6U4T2Vl1QqWtZzaK195GLZdguDAfggv/6B8XUPzNCQvchrbZY3
	6XH7SbCFf8cEcDCJXe1A6BINrethkpGwyq26B145oE/ZiLbq2VE3t9O1v3DO8Vbty7N9XztVYCN
	Z4vteTqlekSLADUNpyTD46WZIV/AFpCf9Luk9RI7Q58JZM74ZDazycLxoCvePoOFWClEfqlCHHk
	HnsjGLeGTvFwxfnWJgxlKJGKuC/CWj3PNZoDjGe3/YrV4uPlZxs1zsAVrE8jFQa8qdaZ4bCOU9s
	X+xysrrNG7oz+XUBf4Cid+p7oFg4ZrD03HbqHL2qp+sMEmB2pnCMarPEnVGsefpVxqrD3FKCz42
	GbAAPE3m0jris4lEekw0jHhjF1Db2UXanzR8DE1ZoQjZOaoZxN6+/hJ2uEO8bJ2ASdRrmpagbbx
	uBQL0AbJiV9sJ0QPjQh46ZvVJ5hUbWUIBw11MQljFCDXe+EnuYp3dCVZf4Kwjeg1uLrbGfYsrAR
	AtwTXJqljLFfw==
X-Received: by 2002:a05:600c:8519:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-4a18e4a16femr139639115e9.10.1791760288052;
        Sun, 11 Oct 2026 16:11:28 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bea0f1csm352115565e9.9.2026.10.11.16.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:11:26 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:11:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, brgl@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, afd@ti.com, u-kumar1@ti.com
Subject: Re: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
Message-ID: <aswXWWBwo22nQ4RR@monoceros>
References: <20260930092020.1047221-1-y-abhilashchandra@ti.com>
 <20260930092020.1047221-3-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m3vlfuk6zzwkmzl3"
Content-Disposition: inline
In-Reply-To: <20260930092020.1047221-3-y-abhilashchandra@ti.com>


--m3vlfuk6zzwkmzl3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] pinctrl: ti: Add TDA54 pin controller driver
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 02:50:19PM +0530, Yemike Abhilash Chandra wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users of this header. You can rely on
<linux/platform_device.h> to provide of_device_id.

Best regards
Uwe

--m3vlfuk6zzwkmzl3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMF5kACgkQj4D7WH0S
/k5XkggArZvlARZhA+GPe6GOSLEsUCLiZ9etxb/qZsK3L9ZqKC59PFOjjYYllhoU
Cb0aqC3Bn2PpmjIClk9jpm0jPp4vVz/n2rrV4yD3oR47HhZpd2sUiiMe/zdYzRIm
KH62ybWOVhC9iTey6Mdo6IJT/JCrqAFXlfVz7e7Oew/Rb5O2y3+MJgfWIdSceR2Y
Fx8ivfkzuGIRMLgM6a8uMX0alVKR8l7FpGG8fOK3WV1rTupg2D6XNra2hLdzfmzQ
nTzggHLzsSEeYMzHd5JJgOkDCER4OzXP5RXhysvmggxiKieNcxD+fTuJnd5FW+at
cIgmrrozCEzvFk9S0gyyeY8VGLLV0g==
=ctLP
-----END PGP SIGNATURE-----

--m3vlfuk6zzwkmzl3--
