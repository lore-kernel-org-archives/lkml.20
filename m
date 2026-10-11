Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0951444A730
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791760408; cv=none; b=ujQhyct5wU8YtmdvEldxyu/u/IpffUj5Mkr+AUDX0nIrsfAyv7cGDUmHE500HUYnDsr3OcNQoi/4MUzsuY3OogL0eGECZOAl+KW8MDFrSDc/t4kDvvjILCTz833LkmDCFESUUh2wb5ySFLgobFY5FXOzHAOo433np7f6hcwV8Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791760408; c=relaxed/simple;
	bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFaHzcWiyJ/0q+vga9W7sVyw/OEP7+/2HR/L3eiXwVyrr3WF0UgYzX8LgwiHXkbpVd2ShFim1YKBCbJ8rpmMBveLzE/En4vO39QD8FEXeX9dy/3argqAatmT0DHd/khmsxOOMUy0aDe9ZBJDv44W0V2qSnMS/Jzj9ul9+8y/Wr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QON8AQ/y; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QON8AQ/y"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so11951755e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791760405; x=1792365205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
        b=QON8AQ/y9KiDFNy+It8hlob20YtDNppEISyizRYGEuYW850wo+nChbnur+Em+jCztB
         /cfm0szmZIEThkdWA0vzorgpsLyHphoJCOGuoxSaxkHSTuVsUvYjbHMUvcpF1GSOvHQH
         nHqOxVlwpTfrcZWDu4MicUvoyfJIZki6P55XjhS7hl7Jl2Y8eU8NAkukEuSWMuR6J5LH
         EEwOvkvRhxkR8rbeLvDMsm2dFOwRHKntRAgG4wAZupdVfBeK4nCTZQCp461kYasoojZm
         fq/V4bUMgkGW5XYnKG1N/OjUd3ViOc4KA1gjEfBNP9WJjIr+e0Yah3OW9cSPWGX7OIWt
         IqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791760405; x=1792365205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxW4Ujc2C6PLvH6PLF1Dxb2THQi6y4w5CW1TMZdBXv0=;
        b=BnXCcY16hs9stgBh8B8EazX2mj4JuOGF2K7FAqRsMOTYjVAnrM3ko8e7/82hyUoXpS
         LYqiOpqxvYQveZQpySI401jc+7otu1PVEv0dECJQjS8YxFbv2NFrX6qlQW8pC2BvQZLI
         AiZtAmp+9a0cA2k91iESFL73uhqi64WHvXwRgnQn/ZjB4gHd5sTWkBJ/RyrRvwhXFNXH
         GWJi3EwKsw/MO0sIQpffQ9Ip3OOyt+Eo3tvX8omXG5fN9V7aVSq3e7SggJKtuoun6kxz
         ihwWD9RXiG+MIRyh8HS4GBQFEW4Z/Gx3PI8cnyG9F0XPJOzjs1GG8RCEc60p27g+gRXz
         NfAw==
X-Forwarded-Encrypted: i=1; AKwUvBzDmgDuDr5Hgnijoq9D2jBAcVX2GGl66KWAYA2onnLh+lk79O5wgkEa8PFjevzFHBHeGowgcqnXtwqSciU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlEGTES+0++ogiygAj7Cs2fFuIyXV2REox2Q8fq0km66O5R4Pj
	NQsUKBWWSq1uRHSpt+Xape5ZT+qT7qkwO8mCWFnjBlv6mUUwhUtJzvt1zqnhvf5H2pI=
X-Gm-Gg: AYBFou0iuMUB9VoAl4xmcU+fEmWjRr2RwNwSWca82mFXLXAKeSqqi++7rBGWosavsCS
	+E3NgSYcJmO4IP6ZlbyAE4CQriGEMM//VO24e9O83Wfd1d7Tm6x1/V7RU2RKM8JF1OkK07nIStM
	0SXFCkU7Bg4zKducsV6iir9dENKdMa54p95p+Ecg6ReqknhNUH6qwX2e661GuCxXKMiZOfYE41O
	9XoDMGRtSz2PKFouawcYEmdrX60wK9lVzUMGbn943UHXCQPPtznGjyNWI/bU7axQu5pG8ZPb2tA
	iIhXw/6AD362qksW1ZKOun7WoybuxSRk4MeaC1hH7VkAUE/66eVIDVf7/mx1FTtjIoZr9L7cVnL
	RUKeKa4OHQrmN3xclLG4yYSb8G2HCtgn6gGPfG7sDqdK3cU6sXDrRrxcnuNRB3EyMN8MimaEw2U
	0CwykCGHmGvA8AigJzbnBUuhw11F9KZkbhQATh16RIDO6YhN01K17lmnCN9gkzWLsgNE4Fww+CZ
	xo=
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr165188775e9.20.1791760404876;
        Sun, 11 Oct 2026 16:13:24 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a18bea1021sm222382515e9.10.2026.10.11.16.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 16:13:24 -0700 (PDT)
Date: Mon, 12 Oct 2026 01:13:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: sunxi: Add support for the D1 CSIC
Message-ID: <aswXwdgpWTVoItYy@monoceros>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930154835.402684-3-tien.nguyenminh@embeddedlinux.blog>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qngddyqnkwhditii"
Content-Disposition: inline
In-Reply-To: <20260930154835.402684-3-tien.nguyenminh@embeddedlinux.blog>


--qngddyqnkwhditii
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] media: sunxi: Add support for the D1 CSIC
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 10:48:34PM +0700, Nguyen Minh Tien wrote:
> +#include <linux/mod_devicetable.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the inclusion of <linux/mod_devicetable.h> which does more harm
than good.

If you really want an include for of_device_id, use
<linux/device-id/of.h>

Best regards
Uwe

--qngddyqnkwhditii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrMGBAACgkQj4D7WH0S
/k5tCggArhjqsIMxWZn1mdwNpWwWCgDbuq6GCyhWvxK6/4SoEqOcbECNykQJkcqM
gvBI7Zcz8K+t3TTUvkpf5ten3RucpB85MIpw2zPZyT7UNFTU4XpVJ9KXFNT6G57g
GknahtuMpdBREceO6pO3vd/yn8VMXV8clPTPXpgNywW5t6z3QOzEz0IcrZMJb8V6
cSCkPm8gLqPQcJsxc5Jwdjzt/xaeUIEVlS9TgyVY6BrcotwmfGeJsCPubGsR35Dv
rCHn8rkKSLOaUBG2rAWF26nch4TvC8JDsPDVi5/HJBfJhBqHK5hOi/Nri4WSmi8T
kVp10DCvNgThgd+VEI82L4IL+a9Oig==
=gnsw
-----END PGP SIGNATURE-----

--qngddyqnkwhditii--
