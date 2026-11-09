Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259799;
	b=AL9ZasYv4VjiPkO+0jmp/tu5+UPBwxZnQ57+4AwsC+9RwWD4aDGvNocmUSFD3vsqzTLc
	 FLjZO4W658Ith8yy9lb60KX3fBAOK/9MCUHVjhI3pU8Awc9V6CGzN698cK2nTQjMkITrX
	 Twp3eAEHUQEzxyH53ueUVj0JP/I2eBSlbz4Fq+rNC6ovz9fh7kPOJJDPFbZg+voENG6va
	 6h9x6fT4tlhV6wwQFhRNNCC1ydz5O1HW8p/ppFkjzjKbvkVYzEEVPOk9p/8LNWg3QQoBR
	 9IgYCr0NRSwDresfJqmJB++RX3QY4ut9PbELfM8REL+V3IqnqHPQnAUzwK5fx8iGAEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259799;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=u9L975C0e+5zVtIy58ZmS7yDvWaw4ousywCqBSfmK2A=;
	b=JFSzQPEg8s8GCQKgtEdznBu/k5rhKxGLWP0oqeqL9yzOXJqRvzbmuEdmYt+zJLaRnUyN
	 Q02FK3zCjgvgS43OH565QfaiZc87CB3e1Wqq+s3dbNX0qk6625ArinVhhC+Smp6CjCO5e
	 7dcJxtij5Fghmr5OtAvKH6RCk6I495BfDDQwU/r3t0T5G1JbY7stg9RttAGWlm2+QPpV7
	 iIl8Ais2nwoty3KytB83VaPnz7vBiPH1H5QdjnYSQtQYpt9iBa0EzjsBehjj5AkENtoMa
	 m7x9eHfp6Gm+wgGuN0gXHsLBT9n3rXCmx9pVmFZXFOu8uL9N1Llns9Sj14LznPTjw/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=S5N6rFs1;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B5160A2607;
	Mon,  9 Nov 2026 21:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73B5160A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=S5N6rFs1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=u9L975C0e+5zVtIy58ZmS7yDvWaw4ousywCqBSfmK2A=; b=S5N6rF
	s1hiWpOH4mral1mqQm6xld0d8IgnR8b7wR3Y+BwbaaI9I7vDYAIog+xoVvbk53P+xKpPMRkDrgl5P
	Xlg7b4u+wolqBpv0IhGpD7i46qgvuD4RjoLgrICD8IjDUa3MvCjEI6/7mL1XfTUNjoMn022FqN7OZ
	0SC/bl7LhlE25jraFJZVlT0jh1uB1GMHCz3ixxuF0FflBb8DJCwyMqG5Su4/yvxCi5w6Fn/DPcsvE
	uLVDHNdbPo1rLrg0XzwvHND5ez+YacUZeW7u5eRBDOGJPuLDH/FYK/dLkb9TqYVtpb42BEsDnrEoK
	hRuApDeaAH6uG8zeC4iOVQQrxbkg==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xQWvk-00000003Sg7-1zxM;
	Mon, 09 Nov 2026 21:29:32 +0000
Message-ID: <a799adc77dc325f5e3cd9f806dae684f198efd38.camel@surriel.com>
Subject: Re: [PATCH] x86/mce: Restore rate limit on MCE logged message
From: Rik van Riel <riel@surriel.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "Luck, Tony" <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>,  "H. Peter Anvin"	 <hpa@zytor.com>,
 Qiuxu Zhuo <qiuxu.zhuo@intel.com>,  "linux-edac@vger.kernel.org"	
 <linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"	
 <linux-kernel@vger.kernel.org>, "kernel-team@meta.com"
 <kernel-team@meta.com>,  Breno Leitao <leitao@debian.org>
Date: Mon, 09 Nov 2026 16:29:32 -0500
In-Reply-To: <20261109212305.GDavI5uXK066CxHoNA@fat_crate.local>
References: <20261108143751.3af49e48@fangorn>
	 <20261108202820.GCavDbZJgmwKqysH4X@fat_crate.local>
	 <CH8PR11MB4034331B3E52AF39AA9C003E68FC732@CH8PR11MB403433.namprd11.prod.outlook.com>
	 <20261109195216.GBavIkcPlh-HcT_7JW@fat_crate.local>
	 <63ed91b49db00d7a601b8ae1625571ee0c46ffca.camel@surriel.com>
	 <20261109212305.GDavI5uXK066CxHoNA@fat_crate.local>
Autocrypt: addr=riel@surriel.com; prefer-encrypt=mutual;
 keydata=mQENBFIt3aUBCADCK0LicyCYyMa0E1lodCDUBf6G+6C5UXKG1jEYwQu49cc/gUBTTk33A
 eo2hjn4JinVaPF3zfZprnKMEGGv4dHvEOCPWiNhlz5RtqH3SKJllq2dpeMS9RqbMvDA36rlJIIo47
 Z/nl6IA8MDhSqyqdnTY8z7LnQHqq16jAqwo7Ll9qALXz4yG1ZdSCmo80VPetBZZPw7WMjo+1hByv/
 lvdFnLfiQ52tayuuC1r9x2qZ/SYWd2M4p/f5CLmvG9UcnkbYFsKWz8bwOBWKg1PQcaYHLx06sHGdY
 dIDaeVvkIfMFwAprSo5EFU+aes2VB2ZjugOTbkkW2aPSWTRsBhPHhV6dABEBAAG0HlJpayB2YW4gU
 mllbCA8cmllbEByZWRoYXQuY29tPokBHwQwAQIACQUCW5LcVgIdIAAKCRDOed6ShMTeg05SB/986o
 gEgdq4byrtaBQKFg5LWfd8e+h+QzLOg/T8mSS3dJzFXe5JBOfvYg7Bj47xXi9I5sM+I9Lu9+1XVb/
 r2rGJrU1DwA09TnmyFtK76bgMF0sBEh1ECILYNQTEIemzNFwOWLZZlEhZFRJsZyX+mtEp/WQIygHV
 WjwuP69VJw+fPQvLOGn4j8W9QXuvhha7u1QJ7mYx4dLGHrZlHdwDsqpvWsW+3rsIqs1BBe5/Itz9o
 6y9gLNtQzwmSDioV8KhF85VmYInslhv5tUtMEppfdTLyX4SUKh8ftNIVmH9mXyRCZclSoa6IMd635
 Jq1Pj2/Lp64tOzSvN5Y9zaiCc5FucXtB9SaWsgdmFuIFJpZWwgPHJpZWxAc3VycmllbC5jb20+iQE
 +BBMBAgAoBQJSLd2lAhsjBQkSzAMABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDOed6ShMTe
 g4PpB/0ZivKYFt0LaB22ssWUrBoeNWCP1NY/lkq2QbPhR3agLB7ZXI97PF2z/5QD9Fuy/FD/jddPx
 KRTvFCtHcEzTOcFjBmf52uqgt3U40H9GM++0IM0yHusd9EzlaWsbp09vsAV2DwdqS69x9RPbvE/Ne
 fO5subhocH76okcF/aQiQ+oj2j6LJZGBJBVigOHg+4zyzdDgKM+jp0bvDI51KQ4XfxV593OhvkS3z
 3FPx0CE7l62WhWrieHyBblqvkTYgJ6dq4bsYpqxxGJOkQ47WpEUx6onH+rImWmPJbSYGhwBzTo0Mm
 G1Nb1qGPG+mTrSmJjDRxrwf1zjmYqQreWVSFEt26tBpSaWsgdmFuIFJpZWwgPHJpZWxAZmIuY29tP
 okBPgQTAQIAKAUCW5LbiAIbIwUJEswDAAYLCQgHAwIGFQgCCQoLBBYCAwECHgECF4AACgkQznneko
 TE3oOUEQgAsrGxjTC1bGtZyuvyQPcXclap11Ogib6rQywGYu6/Mnkbd6hbyY3wpdyQii/cas2S44N
 cQj8HkGv91JLVE24/Wt0gITPCH3rLVJJDGQxprHTVDs1t1RAbsbp0XTksZPCNWDGYIBo2aHDwErhI
 omYQ0Xluo1WBtH/UmHgirHvclsou1Ks9jyTxiPyUKRfae7GNOFiX99+ZlB27P3t8CjtSO831Ij0Ip
 QrfooZ21YVlUKw0Wy6Ll8EyefyrEYSh8KTm8dQj4O7xxvdg865TLeLpho5PwDRF+/mR3qi8CdGbkE
 c4pYZQO8UDXUN4S+pe0aTeTqlYw8rRHWF9TnvtpcNzZw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-09 at 13:23 -0800, Borislav Petkov wrote:
> On Mon, Nov 09, 2026 at 03:12:43PM -0500, Rik van Riel wrote:
> > There are a dozen or so "mce: MCE records pool full!"
> > lines, and then two=C2=A0of these:
> > "mce_gen_pool_add: <bignum> callbacks suppressed"
>=20
> Sounds to me like you getting errors logged and there's no userspace
> consumer
> at all.
>=20
> What is your fleet policy about collecting and logging hw errors?
>=20
> Do you even care about them?

We definitely care about them. Errors are used
to figure out which hosts need to be repaired.

I do not know how exactly memory errors are getting
collected. There are some tools that watch netcons,
some that collect data on the host, and some that
grab data off the BMC. I have no idea which of
those paths the memory error collection uses.

--=20
All Rights Reversed.
