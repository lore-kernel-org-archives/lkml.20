Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849404;
	b=kLpgS6rJBOvwWmdHmkYUTunRXAoy/H18BsFNUlR+Pp+kizXoKjYh4oVrgVxtwTg2YXHZ
	 9PIeV2u+wBhmu8sRqinylVFq5dBP5jON3B0l0coZjmXjYwjBVphQZ14MIvOA+1RcJ3UdR
	 e5FXqvcB8DHwRkE8uQ4TOtSO7oDbmMvvCZnDYRcjWJRNzCjLtc0YXqy8npMn+TjTjPAwU
	 pOnlASKQfwtpm+jB30TbHSDFWA0puPTZNcqCd0EWCHWRVeYBBFrNmuxarQlvHBVBZqDJc
	 e9VkYSIJbdbBje6Af6LlhWhM4CU8c51gP9XQx4RcfUsdkaFrDom7AjnV6/R78NBp6bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mSvoaqmjg32ifr2UgUXPIKGNa+qRJ8bbbR9fyHQLo9g=;
	b=qKJoL11/g0Q2deNQdTmrFP7x9PLRoUCtUkyAmgf34Ma+Vzgs/1PT6iX8y7+0UYKrcbVm
	 xMPeyYr5F/t18au9caDRlfwd61nnrHLDUshulPRj7xQVp4453WlL6xMIGAqDNKCCtgup+
	 mXBJhO8i4VdTt7MZGZ8TLCeTw9xSFJz6uShpG3XpSQXcS5C7jfb8MVxo7B/zyxAK4wMm5
	 zy/xeMcHsKGkFI/qpKHwn+Tgwk29CBTfvs+V8YHKVdlQr/HcS4XpULBJmE+5VgxLQsQ9q
	 Hq7a4SDwltv6nFsRXIuR9rmCXUdLeYyLXGPe03ATbw23nRrZnawhoAGEmaBfbTQHVLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CxK9VZSf;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10205606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10205606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CxK9VZSf
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so39431425e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794849401; x=1795454201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSvoaqmjg32ifr2UgUXPIKGNa+qRJ8bbbR9fyHQLo9g=;
        b=CxK9VZSfh79fNWhCp1NFP++dVlw2bcsnTNu1h5/kBzXtJKoJOtUg6+ISzBVyn9hDKL
         SUzXpSz652HmDYMenkzBqfGos4Bs9Egx3VVCquC0y3AF+QAIocBkxYjcVHcJb6MYKJHk
         xaqv962wIhXwvWlz0NyvYRpBpjny36vezEPmv5M8XpOfiWZeEWVmPH97qqZVVZ/C3x3z
         HNXVak8pSZjAVNIlduUeK1xaZ97f5RfnT3ZVoH3Hs3jt1V0k3ox+0V7yo1o7QKhYMb5Y
         Vo1NUvrTXlZyxWX0Wj1d7XzYTsrqtEeIXJXoHNnr+ITFHHXVyWLvy8xvEXhGTUBgNLIX
         V4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849401; x=1795454201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSvoaqmjg32ifr2UgUXPIKGNa+qRJ8bbbR9fyHQLo9g=;
        b=223PrVa4iFVZ2IdnLDCJmnbEipqSa7b18QDYGGnLyZxDX1/Dq3Nhayexy26wmx7CCD
         zUgGDQaV6bzk3ZdqYRxAZjina3keqG5MTTkM1lZNgntbU9ebQ3FIQd54l91EurqIUq7b
         1aluxr8RWFu0yi7vHHAGNpJCD0wK7ryZNQvWXYetA3rHmfseMl2RvZOj9vN950a/oDni
         mGLs7RdTHI6TiHagC251ZjR2E6Cn+vZJ6NHmxB4yladIqydJMZQSBCaMDKI6NPtzFPHM
         YNJdmC1hqnLYETttrYiedSrO3/9TITuBfbxXQyC/zNb3YnWrJN2YAoyqNo2r2iY1vJqa
         wl3A==
X-Forwarded-Encrypted: i=1; AL+hErFaaLD0p07AldIUvZrqIUHaAzbcQPtalCxymP15rj1JajIcTwPLMvXF+jEJGGak639F9Awm+YnPLfWTm+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UlriuJYWIvQWMQtWIJzDGW6S65ndmKm3EVpHJV5g41bWcDk6k
	ZUEdxqOPDFd+u2k8gR9z6hOI7vXDx5HzQTXIETWTk15xoD11mkW886Ogs9Cy1D15YZY=
X-Gm-Gg: AYBFou3XjHO1BxmQkUXeDQE64eK2FKzHIYeCxDk4GQe6w25Lm8FVn0+GYZf5uFLrHnG
	oKUDIwKKDjrfF6HpUyhQcVIiEaTd+kQx3TScFTz6K8h/MYuLkA66k9ahLJEAM0199muHUuRc5Iz
	1sfCR71KfkkuZpzQQuvoWjydcnNTlmPyaTQvk4pDNhV7sneDQ6I6qouPxXForDw5/S9N9Y5WIyo
	LvYJeXzPLNyfeM6IwEQHG77+o+fVFvDKrkKZ8pbiuOLYKAbDhhUNvX2R8pbxz52ij8pod9P8KeW
	RodPyi5MXKEfQagaZAyBY8wk1r79Jqbhvu+8Th7AN+ZsHfSvEewxlkzH/1gb9I38Arqphroz3X8
	RjTM2MHptfDkimkELdrJmw+v8iOSgBKafPkLRw40Bp/zCETShR76zzWdZm/PDsPDuxM5Ett7Sld
	6Z36J6d2Ds8Mk1uzv9CefPQTXFahgnPUNKtZZwks4c91m189RrNC8IEisiLJ7uML9NSBWN8U50c
	MMIixKRVrreU8GY/YBz0plvT3I9OUr94t2OsQE7euFg/hTfKfJcH5iwN6V9zafaMKYXG1gIEAiS
	mAYW6xeHbM2ToiTwq4fOzpHqDvMAbvsFhy+mL8a8HqeR+nAPHhEk2bTc4ga9HSlCVogwPQaNC0E
	c2+S9HutanL52d1M+cUN/bM0G0gY/OecVa+6HZZE=
X-Received: by 2002:a05:600c:3ba5:b0:4bb:741d:eba with SMTP id 5b1f17b1804b1-4bb741d1238mr63980765e9.13.1794849401463;
        Mon, 16 Nov 2026 09:16:41 -0800 (PST)
Received: from localhost (p200300f65f19a90439293c698a65b414.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3929:3c69:8a65:b414])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-49c5fb58fefsm25945708f8f.26.2026.11.16.09.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:16:40 -0800 (PST)
Date: Mon, 16 Nov 2026 18:16:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Ira Weiny <iweiny@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Zhang Rui <rui.zhang@intel.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Saranya Gopal <saranya.gopal@intel.com>, 
	Gergo Koteles <soyer@irl.hu>, Jakob Riemenschneider <riemenschneiderjakob@gmail.com>, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, nvdimm@lists.linux.dev, linux-pci@vger.kernel.org, 
	Kai-Heng Feng <kaihengf@nvidia.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shuai Xue <xueshuai@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Chu Guangqing <chuguangqing@inspur.com>, Andy Shevchenko <andy@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>
Subject: Re: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id
 arrays
Message-ID: <avs5thXfoZA4TBnE@monoceros>
References: <cover.1794567577.git.ukleinek@kernel.org>
 <CAJZ5v0jC5YXsLgB6Qd55KNCU0oCsN86X5WpRfL+Ycz0MJ8vGqA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xs75une3ctdjt36i"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0jC5YXsLgB6Qd55KNCU0oCsN86X5WpRfL+Ycz0MJ8vGqA@mail.gmail.com>


--xs75une3ctdjt36i
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/4] ACPI: Use named initializers for acpi_device_id
 arrays
MIME-Version: 1.0

Hey Rafael,

On Fri, Nov 13, 2026 at 05:17:30PM +0100, Rafael J. Wysocki (Intel) wrote:
> > Uwe Kleine-K=F6nig (The Capable Hub) (4):
> >   ACPI: Unify acpi_device_id list terminators
> >   ACPI: Drop unused .driver_data initializers in acpi_device_id arrays
> >   ACPI: Use named initializers for acpi_device_id arrays
> >   ACPI: Unify *_device_id list terminators
>=20
> All patches applied as 7.5 material, thanks!

While rebasing these patches (as part of my wip tree that contains a lot
more similar patches) to next-20261113 I hit some merge conflicts. If
you tell me where you applied it, I can take a look and provide my merge
conflict resolution to allow double checking.

Best regards
Uwe

--xs75une3ctdjt36i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr7OnMACgkQj4D7WH0S
/k5UDgf/Zh/cCBQS3AfcJY+xVzINeExpvzUmIZMMajOqIRB1Ogb1iu0eC9qNdona
axu6POUJXrXH/4pRKQXevRF3+h/9JnryHBdTIe266MjPuRwUmMbGA8WFTkyAB4B1
QWyO8s+I+vnTdOB8Epy5gtqS4T4GHHGkl77vuo+C1qWDCVa9rLVrAvtFGSJ8ULGz
w1dFA50z67Fbkzs1CIqH/smn3i2pPtGjZvfJ3APm3MUbEXCY3U5vKugaE9w7fFF/
RnDbWck5jZ7cSr2Z4gmAk05o1kwfeDTGzRJ6/1zxIdAlPzXZFzMQWhDcgVE+3pQm
cX2okMKS7qwTP1K50XaZeXSwd0t3mA==
=+qin
-----END PGP SIGNATURE-----

--xs75une3ctdjt36i--
