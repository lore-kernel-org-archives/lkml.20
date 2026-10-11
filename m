Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4F9372680
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760573; cv=none; b=ofAP0khh5HdztD/lUJwq5ZtCOaK2VBwKKNHOQw9icNXE102yLhGUFGlkeIMmSrBYJFiyx7c7sIg+x6p647V8n96e6Mu5UibcXilu39px8Yj2mD2ph3VVgj4lRIYyIAqw3S5pNzhs64C+xCA0riiK+PGgq79h4lmypgUObXuOxig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760573; c=relaxed/simple;
	bh=LmVQj7uu7MJqrKqgNSP5uYYVsgcU/25VPpMhJmIGlMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfiprf/eh6bVkDIjUib2oFXnaHeoAvFooJgOdSKLJ6nR6DqjOGHs9Qz6QgZ+2J8xY9/gawXqXJD9h0F8G3KPAbMw6GoRkUVarlw0jR/JVZZ877bsNPa3izmGepykDHFPtvAD43hFi/SVw14Q6D20en6BLfjOW3HAEwOrHY/wUmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Sztr5wgH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Sztr5wgH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16c399641so13491585e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791760571; x=1792365371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LmVQj7uu7MJqrKqgNSP5uYYVsgcU/25VPpMhJmIGlMw=;
        b=Sztr5wgHMnUNvoPb0SWAp/YNM6eyxBGF/XwVKdTFZ6ZSDyZmpkrRZ7B3hxKuza9qwM
         sYIEBqQ9SUbmW3ycIykNwl+EuLJ7WQMJOLEn+mHlOIbZ/VU7HbysS+HT1qK03qODor0i
         xZBYGTbAjH2fp3xoZYI+DGTijLEsczwgnXVV1JwdHkfIWczY8aAdqZlc2BVFSBujAUv8
         hmWrUeqOAVTxWNNTTk7erKumnE0ip2PPsexJNPJrPkUJP2TcH8OCEtKfvqYCQP6gsFo0
         f8BpfnIIedJg5azpYToOigcDlSucdnOQSTdoQDHg8kmoufzh8v3hJXTRWW9WJrQNlbuV
         bQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760571; x=1792365371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LmVQj7uu7MJqrKqgNSP5uYYVsgcU/25VPpMhJmIGlMw=;
        b=2ub/h0dIga4TM/yI5qLl/MFaQYqZhX8gg4cidQzDAlXPuvlGTryDYZLAr5LYRB4Onw
         RQ4oKyaOBRBy4PiOOoCPyDYDZbvy+WoAcdBGPyjkmestzeuDhJz+NtTCoWiyE8hcRVTQ
         TgTJ7ivu2dRgPrPzG8GXTLxIZ20VkFX4AlTOZqCUsFF1CMry81wom9ZehY6GPcXJYGVx
         n5c8a+y2R/RaJXnUF7KNjWFoxBevCaowlu+R7S+16Ezp1fPsRu2Kt8CsnDEP7FtZEfwo
         jyfMa4/XC3MlJde6SYQkwHG3fTuyqvBdwSpZir5iuG6fA6Q9oXj23On6yTyK+hNCIstW
         W42w==
X-Forwarded-Encrypted: i=1; AKwUvBzBZR2ns64Tm5jGnYmStcaI1yR1fa/zGTfxw9jSPq5IIYocGoYam1VWaE91TiIz6o6t9x+5XIiFTFw9H/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6LHZ7uHO+pxEu6cZPLEP1IC40QUB7xiJc6c36T0qMKCs4gX32
	DU6a2UvwEXODWEOjV5O/PEkUh6F+lMwe+4a/wltgmYqRs5H3+dmrBvaVjgARCGEGz/U=
X-Gm-Gg: AYBFou3KVVdTWSHaneh4nZ2og2Qh87QTBQb0TNZOTbe46xX2Rh6FrRG5RVCiIZd5teJ
	gDNVyY0zdSbqkrs9HaOHflpIYnCuYLQ+7jV2ITF2ffb5E/vTGwm2qliDw4XczPmCNftwI5B33gb
	YfZskHKVIFT1o+++1XyW9sFPPexxSp2Ov4UmVsGWTj2hE2uqIM/Kb+njayXwA/SH2KqFdFoPd8l
	gO41DqE1Y0Apx7QNVZq5/hHE42qRzPnxyhg2LOGS1BEFpHGK8pEGHvCrJKdt5b2I37WfowdjSAV
	DMP0C/76Bo5IYfYdhZLdTy9t2kprzkcG9JbErVxdtZBoBTCjTW7x1RmCMvQzntB1ei38YBM7KzA
	uc8CeZRTDDI2caumViXVCBRcbilnSwS6DAL42qC/aL7FJqKbHY0SI4U6tg6Nu9sEMsD/k/WptfI
	x6vPbZqoSRRyInaYD0KG3E0SWMdSoD1zOAuRXr44a40jgpwsSI+gTVBlv6aeCfxPkJJXOlM8kfT
	YM=
X-Received: by 2002:a05:600c:8105:b0:4a1:775b:5eb2 with SMTP id 5b1f17b1804b1-4a18e48362emr139928885e9.13.1791760570708;
        Sun, 11 Oct 2026 16:16:10 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18be964dfsm240506775e9.7.2026.10.11.16.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:16:08 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:16:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: armandas.kvietkus@proton.me
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: aw8697 - Add Awinic AW8697 haptics driver
Message-ID: <aswYYk71JspzTQaO@monoceros>
References: <20260930-mainlining-v1-0-c303cbdb00c8@proton.me>
 <20260930-mainlining-v1-2-c303cbdb00c8@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ridkd3llbbsodmf"
Content-Disposition: inline
In-Reply-To: <20260930-mainlining-v1-2-c303cbdb00c8@proton.me>


--5ridkd3llbbsodmf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/2] Input: aw8697 - Add Awinic AW8697 haptics driver
MIME-Version: 1.0

Hello,

On Wed, Sep 30, 2026 at 06:08:04PM +0200, Armandas Kvietkus via B4 Relay wrote:
> +#include <linux/mod_devicetable.h>

Please drop this include, <linux/i2c.h> already provides of_device_id
and i2c_device_id, so you only gain unnecessary dependencies here.

Best regards
Uwe

--5ridkd3llbbsodmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMGLUACgkQj4D7WH0S
/k6kxQf+IukpznR2fVDe2FYjwtjDRNGy/yLsBjaEG3d4asAugaTEUfUdBPK0dCFW
zgab2jxZXtXpWm145NHWKc2TXTY5fdbyzDo1lLTObUvw0XqXoEWjEV2Z1uFhMx2z
b5SpQGJhkddN3tFDIayYA5uFwo9c7vYr2w2UjXnJL4YAaGR9UETvZgP3FeuBs0YI
kqqR/z0K4q9zTl8LqcRdV8bkRBzetw8xopnurhb8rkB5eNwc0kUsfHG5ogpHyXGT
CDtMfYaqC9NxfohfFB2/0T/ITMS2HmQ1koWTWmyY/iBpCfWjfbqFlBrAR18rD4V8
GpJ5ZqYJeVW8FJIpYCiOsjce2bry9w==
=8biG
-----END PGP SIGNATURE-----

--5ridkd3llbbsodmf--
