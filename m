Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013949EC68
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054791; cv=none; b=hgR+uwNOU9c0LLC4YIvwE872nn5vGsk6kwK5Tq75dZD74GEhfxHLPUXyi+WsyQE7A/QIsRzIrA04fxqXaWcVlNo7L1eescM2pbFF75TueEwkiaG+spM6zfZoJMtX9codfNHOW32XJqEAMS9G8Rlh/ZkxRG+TM9Z49xFzwr/rc5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054791; c=relaxed/simple;
	bh=3/cNw4sEvJBejOf977x2DG/AkG27qWXnWwL0GNmyl8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT5QdN/pE/AJBuDmOrA7njAJXQyWltr9+ZbDIHIPBpZEMvQD751ap90bPSP4jiNx80pX9YvjkVQDwISno6Oxw34B9FrffMBC5CjzBL6v/KrackdqYDD6A7BwV1GEVrDK1PRJ2+ttvuM42jiZlVLKDGkFmXBJ+wsHdT83Mp56bTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qupQC/rI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qupQC/rI"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5378b281aso28093275ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792054789; x=1792659589; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTn0EhBpANmjKhHsvyvAy8HwjaDH/CrCTffTLDLZppg=;
        b=qupQC/rIEVMPZFdcMZRArvtyDgs3EkHT5xOZfBnj26TUeYb8j+9/8HxA893ITTkX+p
         gIaQFVHbbtwPZ1Omdhj07kFrOnT8MffTAF1ptDTiIkltk+PyZw/bdWau6V6b7kH90zb8
         c4JpWnM+1So3E47MZIhtwLal4oLKFzI7eDT/X+aHbF1zIWOSJCzdKW9EybHgMotNzwgT
         JEVSkPhW0gHP3wDA86FzhU/oMii9GWEeHf2VlRsC9kJpqJBcP2YkRML3ahQadNhLf+5Q
         Q6Nz3SZtfSZpsu896FspTI4Aky22UpzMKTmjXU5/W6q8yoKjeBIiVdo63IYWzSIBEZdI
         scOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054789; x=1792659589;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OTn0EhBpANmjKhHsvyvAy8HwjaDH/CrCTffTLDLZppg=;
        b=kSZRqXE5E7KHL2/W2ELgcQ5cobZFgaluAf14QgNXv7rliBeAlq1Fz8fRbTpYcAY8U4
         lldxnhGEJOTPCJb7y9FUkceMaFaP+GU2a/eB+Q+ag6B0HVcxY7OaiN+t1rZIPZkiXhqd
         u/Y0LxHHBI4TcukcDM16phIbk+t2Lo+PSQuBfhgtGeyYK4R0B8/nL4S84QzrWkhSIhAP
         5ypgGEerxdbjxhtUAQztYXUtngG/nCv4rl6GvkO1kX7A+tJ9rj2vsj3/AQEs+29IDoXm
         xJHUjFfnii1E5ySCdNC9cAvNd7SjR10xiASN/XOPjuJHVtLMt3h2m805DTF5o0Mfb/ve
         x5eQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgkFoMpEU/I09RWfM2LLJQ+4sNu9ESqlGg0NaCzyG691APf3opLqBh3XZDWEfYzSpN3t2vjy74qmDssak=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7Z4adt8M5Z2iTBHuzQTvsdEeZiXQAub0ZFpVg//05VJ6n1WIj
	XseIs1PUlYHxpAV3yu18/j/IWQZP62X++gs39Tk7IMhID43XTCM/YKhY
X-Gm-Gg: AYBFou0XbXRct8kVh9Rs6FUOQDj3b1PM8XsbdkTNelp5JgNqhWoTnEALjyz2uH+uRaO
	gONvn+SCC6qyKw8AUA9VlPwpYLeyPGFsYnwi4yK5ntsw4YYK2RFc+glaArR/wrTHLDap4655kx2
	k8sHMEC+P4jpjEj7HL+F5bV8IYIlGuTHPlbCV+hJeVjNKer99472sjBtXpntwxNoAx3rVxHnTGI
	fKTuJr/QIHoB2Ax+QGaojiu03EXWd/J0TZFfxYd4CT4e9YbnghoHElzeqbSY43IHO/hdOH328ou
	kHB1mlTwQz1NWXnqUqZnmRS6DConna//B52SxvVyVmJpQwxQQQgLjOb0jjsy4vm0XXGByTu9qGi
	moz851kAsi842FdwPAXXTgw+z6HmLt7QsFVftec9Gpk2gDb1Xn5MgRAv4A+iMsaUSsFECRzCXHm
	y8HS/tFkIoi/QOgtnrdYcwlJ7DHlD0YDmzgMswisLxpt9qy63kNkwkZqpUMEa+uedR8F5g
X-Received: by 2002:a17:903:38c4:b0:2e9:40ef:e44a with SMTP id d9443c01a7336-2e940efea29mr41054965ad.3.1792054788685;
        Thu, 15 Oct 2026 01:59:48 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95cf92dfesm5476715ad.11.2026.10.15.01.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:59:48 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:59:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add Sophgo SG2044 eFuse driver
Message-ID: <atCVyX1tV0VXe72k@inochi.infowork>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-3-inochiama@gmail.com>
 <atByyAg-c8v_IiAj@monoceros>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atByyAg-c8v_IiAj@monoceros>

On Thu, Oct 15, 2026 at 08:32:19AM +0200, Uwe Kleine-König wrote:
> hello,
> 
> On Wed, Oct 14, 2026 at 03:45:14PM +0800, Inochi Amaoto wrote:
> > +#include <linux/mod_devicetable.h>
> > [...]
> > +#include <linux/platform_device.h>
> 
> <linux/platform_device.h> already provides of_device_id and
> <linux/mod_devicetable.h> pulls in a looot of dependencies this driver
> doesn't need. So please drop the latter.
> 
> > +static const struct of_device_id sophgo_efuses_of_match[] = {
> > +	{ .compatible = "sophgo,sg2044-efuse", },
> 
> s/,//
> 
> > +	{}
> 
> s/{}/{ }/
> 
> > +};
> > +
> 
> Drop this empty line
> 
> > +MODULE_DEVICE_TABLE(of, sophgo_efuses_of_match);
> > +
> > +static struct platform_driver sophgo_efuses_driver = {
> > +	.driver = {
> > +		.name = "sophgo_efuse",
> > +		.of_match_table = sophgo_efuses_of_match,
> > +	},
> > +	.probe = sophgo_efuses_probe,
> > +};
> > +
> 
> and this one, too.
> 
> > +module_platform_driver(sophgo_efuses_driver);
> > +
> 
> Best regards
> Uwe


Thanks, I will strip them.

Regards,
Inochi
