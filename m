Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16EE3D9689
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 15:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790696225; cv=none; b=HzlhWoqPv+NCHSGNsHJSV/L/OU6ukT4TdxoeG3DbMWDM2xr4OjGbBx4nwAHf/HNwHggBBlAQNmGXUeCSEj2jyMaS7Yr1v7AOLWQTb3QSSeqvhsGkiqa9dOPreKAK4D0aOHfCPCZZBE3ctZ9eQhmJVPnXdVRXA1QulWI2/QsVJso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790696225; c=relaxed/simple;
	bh=ZfXedYkqY+BKBZBXX5A6LoKC4jkyILJ/d8OB5hU1wtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r7Pyp0A4FEsqtK3gS8ONgi0a/I3rHlcyMtqTG0Y/VgmNqmZhoRT5h/4aXfoneIFQdKifjXH3t942Tpfcff1z8qj84w6npHIkt9JqroLfcUKTi345bAML5St1hZlGFn7+NB/LJyf+AmsMULxzo9B8dbMbqXk7N5pSd7tcO+gXcdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MfEUS7kf; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MfEUS7kf"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso3497936f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790696222; x=1791301022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZfXedYkqY+BKBZBXX5A6LoKC4jkyILJ/d8OB5hU1wtA=;
        b=MfEUS7kf3BfNEpEuhCbI81Ifa5dndCSQQkiMHyHrB3a1NMdqijQ6ks5FR28rYfF+9A
         6RKRw/ugqykQX4WFVF+4bT4cZ+CTMkB1Td83Epxf+i+nJSGv0+7vE8vkr3oX7/J+Ook/
         eFbWH/bcq+W412kY98c2oAxnQK6nEhk/nzo72W/pbUFDqK+9vat4/EFjYLz+zLnOBQgL
         EwVcs+1MSIHdqhyToUmMxKz057Ur+neTthZTSxzCPt7mbFBWD1nLbFTEjF+W/DIoWuqi
         Go6Us9wTJjt9K/3YdI97/QscLCHRA2b/X6cJQfReEeW2rRUZQACJGT8BCrETESkpGeM2
         GhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790696222; x=1791301022;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZfXedYkqY+BKBZBXX5A6LoKC4jkyILJ/d8OB5hU1wtA=;
        b=V1MqKUq8OBm1oLnjyn7ogCftOQlSX/zc5lJSMcd9YIARh/fE8PEA3d2Lai7PHOAEG6
         PECaObgM5Kdk2ECraFSS2oWXXn4qp/cbUxnfYq5WVpH37YQYeNMgZMiDXtXq3AxHVP99
         EiN8jPzq0aFfW/CkzqeYnXHu3DAYNpabp9O9mjzf3dyNLLFT6iEhFT6zz2shRhZAtXUa
         VbGAQ822nOVFx9dXWMuwYAmz0yjLG5VgSGTdv0kJc9cUjlHIYxR0RVdDq8uaSz+jFc0Y
         lSde5WxA1Q8mddmx2tjJcBFaBsLYJnZ0Lx3bg2WxyEHA0F8XNzsdzdVdnCbCB6W4ASfY
         wIWw==
X-Forwarded-Encrypted: i=1; AKwUvBxWRfami3MEje+N5l938m0RKoobeUZeAV9pxe14A5LNCWuvTzobBNR/MK1wdK4xDvdt+dfEsC7AEvpS2OM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIg0852SAXkc03Pkeb0m0omHofPLjQcbwqnuL7zZgnvKH6qqzrs
	XZtLLM5u0GcpIl9b6FARQRVQkjLFh3JJq4oJEvlrqJZ1roy1P7aR0DjgJUe17EtxEAo=
X-Gm-Gg: AYBFou04dyvEvdEdmwL/T+VCdmev/uC4F4F/ZVchEYdje8/XUOqzGMW+jY/iNrTKinO
	NLQ21g8g3UVSJUOA2lf0jFV2DwvWd8RJSR/f4f4oHopsQnr7IxD8dt+Cg2qjKyqW3qgq79IocWl
	nVjVE2rH53cANONkqoosbUhYcYm4F73dzRijQRco7EhUJ5Fg+5OBs7A3Tp7ZOzIFAxU45Y+43ZC
	uqCMAcoqqLC/BGw0P7BIeAFNQEHGkLSgD5LLSz30XC+rxGv/h42Vhe1gXj8SFmAO/ksCh7xAs+u
	5JshBiGEunbyfLSfdrNb6pthS5uNouTaXaaH/dyiV+D9Dd7wexr7nbmAaTIWtHmuEZZxYvjB5uR
	OfDOuzYRFE+35DaHIRsR7ntVU9wpyihgkJjzooQGeSQBQpBxXQn1hyDiJMWnWY4t0AodNWRmAes
	nODnNq6Eu9O2SOprCOSvkMM15vFvZkVUgyXzMuClkRIz8bMAKrTSY2RxhHY5ZZDeMKbUO+kYe4P
	DsnkVcr6m8Q3b45EJlmuCyXbIe9vIpJmjrpiriGx/tDtOBIR54GmWWoRygpNQ==
X-Received: by 2002:a05:6000:703:b0:487:13ab:142 with SMTP id ffacd0b85a97d-48872abc483mr31447342f8f.35.1790696222042;
        Tue, 29 Sep 2026 08:37:02 -0700 (PDT)
Received: from localhost (p200300f65f19a904123cb16e9a8bb736.dip0.t-ipconnect.de. [2003:f6:5f19:a904:123c:b16e:9a8b:b736])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48af5056a16sm4647768f8f.18.2026.09.29.08.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:37:01 -0700 (PDT)
Date: Tue, 29 Sep 2026 17:37:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
Message-ID: <arvaq9M5aO7RVYSl@monoceros>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bxlqyfqepcg4nu2t"
Content-Disposition: inline
In-Reply-To: <20260922184425.56114-4-srinivas.kandagatla@oss.qualcomm.com>


--bxlqyfqepcg4nu2t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
MIME-Version: 1.0

Hello,

On Tue, Sep 22, 2026 at 07:44:24PM +0100, Srinivas Kandagatla wrote:
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>

Please don't use <linux/mod_devicetable.h>. That pulls in many unneeded
dependencies and I'm working on getting rid of it.

Just rely on <linux/platform_device.h> to provide of_device_id
(preferred), or include <linux/device-id/of.h> if you want to go full
iwyu.

Best regards
Uwe

--bxlqyfqepcg4nu2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq72xkACgkQj4D7WH0S
/k6kBAf4kOBFV8X54QSaUA2drytAFm1AWOMNOdRBmU6yY64TUWxW0ucR2aSy7o/J
/yrQTDzdn8RgenjsGrl9iGOfOs2G0TGRLNMiJ+xivGPKPZoVAmKvjLV17B2xTfy0
31Qgy8JGmoxizoOfsQP/BMJnnThCdEAqHLuLW/WSFNqZlGGOPZ7O+OnsNn8KD1l1
ZyRNOo6+uFI0N49sVHcrSVau/vkV6B0RQIZRWHVn3czU8qT+XEAPayaSULauF+6S
lfvqQSraHK3Ji+Q6Kg7SmQV++dN9xwTQnTvoe5c/VgB9pb5x8MSt6ckDOh5ber73
DLYbbptZH2au4aATXTKSCEIgt8k/
=Dnk/
-----END PGP SIGNATURE-----

--bxlqyfqepcg4nu2t--
