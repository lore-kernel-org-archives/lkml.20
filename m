Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA40F3A9615
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792045944; cv=none; b=tpcIPE3LDTLDlU3zxmfy+m9af9mJ9IaG53+XY8lXZA+s4EKA1iWP1c6/Z36wN/RRHmkRHfpnHKVdWnNz+LRHO9xCF+MsIRR4zOGkgxhnXCF/TAZapub5ExYjVtHQo9zHzYPp7R5Hjo0/qlUh9PKa+VZp4TMCuCTsyFQxZp8al1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792045944; c=relaxed/simple;
	bh=Pcv0I515WGpSBtnjBoWfAF6yKVeQ1TVrn7bNULKjLFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRP9UnyzvDXT7wT3F6ZOSevl+xpJ2Nxz57lTntr+Ba67LmpbBL3+Px7Zr+Y0BLOs1+kUYxYzlXyLv+Dj+kNg6+n4SRYXNfWQ7iHiV0B7Pa/GJ45MEK/7vPe5hoMYyWu8a/pd7hEKgL/hNRkI0ZiWHurXxVHu0C9JNuzNT4LcZ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YjYJDQcV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YjYJDQcV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso35409635e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792045942; x=1792650742; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCK3gVEToJ+wvka1ZOkBmWjuDFje6LetoLMhHEyakXc=;
        b=YjYJDQcVyFSw63Fiwwp5obQy3dSQmKLqmiyHcVMkMdDL/JbMLNPRXGrmnpxvq2jluJ
         iLHM6jvqaAXSKQvJdMvJUOeSXzu5QxAS8+kHt+6a/VJyrxqV3sdm2O5PKDEIQoboamlY
         5XPdgqrb7Cc8ZgCighvffnjYYKzoZN+Si0NLc2FWViPNNOntgfevgXkOIz6qy4yTEw10
         97rxNZHcBpSzzzECsyaZcmvmEQZnNNATHFPbz7cWUj6JBZSFfBbqc+pKegd7MEeIxWn6
         7Zmm0xBFczgJCNdudv+OObJT6RnLVWhZlC6Me129u2dnCINDYBgNbNcMzVcMtXF/MzPw
         zYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792045942; x=1792650742;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCK3gVEToJ+wvka1ZOkBmWjuDFje6LetoLMhHEyakXc=;
        b=pvBYszrjtKvkswp5EN46HHHz4UdCDrwY1/Hjv66HfqoX+UPiP3LqAd+5UJQJqEI6lh
         V4DayAG9F/vTmkBAaRFfY6L3QBOIvJ7p+K9iFhuOG9eWkRt3FRzJAhjxUVcVKJ6jrKXB
         ERW6fOKd+98BOHnmmSq0mnSWXihTnH7v8+K95uCc4otuMFj31pAPXSTlL921xjCD+9/O
         sPU5n7p9KDMnLrKvQFbocehrY/nwVdgu6EpfWPTLFWXWtvAZ7PENj4OSzMDn9ChTlOqE
         YKiy9aHKRe2FqPecfNqNwTdW0z7heth1bXBdyd4Up0O7RWD3V+RJo/4PcjgXG51kppOB
         4IYw==
X-Forwarded-Encrypted: i=1; AKwUvByl1QDselvxjZNU8Bmb2hkWuxW510Z3N7hIXRR4T2J2ZivXCQh2VK5LXBOlqlmViXOgA68pob+TTozPad4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkoDcLBGbheDjRsfLSvcpf7owkF+hMqG4vxR+iHivRvSRnZoEc
	EnzfiSEvmxhveVfa7eLbe08+Bh/7ytgrKstfeibdaEfFXTxj7XgmM0R5q71sjttdx78=
X-Gm-Gg: AYBFou02BgAHvKH6FLtkSH2L4CT+m5gs8s4S5nRfJ74w+7vC+i5i7uY7JagNs/zt3q6
	UFRddVdJTLIPwiMG7jndaFaGmU8mwyrlbd734oKvU9D8ueDG/vfQS8ue5vrShGZxl75f3qT/oUO
	VL8lXSLWR4s8RsWUFGBteyC+wWZYM31ii8xkuLgKSSUzoR2yW3aGE7mH1oR6hFMZ2Yv7IIvIeBP
	abVdJjJ/kM0EqFGBdVB5GbJgI4FRzEVMqb67AGZoTM/A7wCpl+lh/MQAsQK/LhXYA2iSqhZRP6p
	B5g/rj6gylNjBtz5vVzpWpEKN0/AkLzju+Bz5F+BIKurcOGserCkeQeeXAP+Su24Aiv/4/wrmzf
	5sluJ9uUdQuJ3s5V4JAtCSs6gKbKFdmRelDSnkt8FOONJKGwS0thjto/TwTsd48S0bpoxoxB9LU
	yE23wv822ki/zwJqxg4ZaK6ReSiFH8v6BQEZIvOHU3IoRfl13cLBQmQLMR4TRcW8+o9AGG8oM0+
	o+SaDzyxiaEUJo=
X-Received: by 2002:a05:600c:46cf:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-4a18e4a3ac7mr390482335e9.5.1792045942037;
        Wed, 14 Oct 2026 23:32:22 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1bd9a8a22sm52340755e9.5.2026.10.14.23.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:32:20 -0700 (PDT)
Date: Thu, 15 Oct 2026 08:32:19 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Message-ID: <atByyAg-c8v_IiAj@monoceros>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2wqyi6vrkxoccpli"
Content-Disposition: inline
In-Reply-To: <20261014074516.240247-3-inochiama@gmail.com>


--2wqyi6vrkxoccpli
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
MIME-Version: 1.0

hello,

On Wed, Oct 14, 2026 at 03:45:14PM +0800, Inochi Amaoto wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides of_device_id and
<linux/mod_devicetable.h> pulls in a looot of dependencies this driver
doesn't need. So please drop the latter.

> +static const struct of_device_id sophgo_efuses_of_match[] = {
> +	{ .compatible = "sophgo,sg2044-efuse", },

s/,//

> +	{}

s/{}/{ }/

> +};
> +

Drop this empty line

> +MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
> +
> +static struct platform_driver sophgo_efuses_driver = {
> +	.driver = {
> +		.name = "sophgo_efuse",
> +		.of_match_table = sophgo_efuses_of_match,
> +	},
> +	.probe = sophgo_efuses_probe,
> +};
> +

and this one, too.

> +module_platform_driver(sophgo_efuses_driver);
> +

Best regards
Uwe

--2wqyi6vrkxoccpli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrQc3AACgkQj4D7WH0S
/k6AXAgAiAV2USgEzQOtvljyc8VbWNuSTr9JlXOIb2McAei2yOxSLalBc1rFQsSh
Z/UTyGYma1+gCD0MWFS1n4maltg+40KzZAzEwnGc7REEcSdkOYpss26bTQRHj4r8
R8DCErxJRfj7+lKnoNtLgK0hz28wPFBIp0YSPyCVkbQJF8N0hl5NhmR6cp+RykDI
u/DFIl+DUwm9fpHVxvTBWsHdigv8+CQ0HKLesoqDLD0RyTFiA3MMqg/g0cyA7qAs
6gqYBGn1ZjmuXbiAdTslU0ASU0cHgIthGhMK1IxTlwrU3MErYG35z24LQGMxeL88
Hz3oIY6HAz9ZzGxGZV38TB+eQMPs6A==
=jQo+
-----END PGP SIGNATURE-----

--2wqyi6vrkxoccpli--
