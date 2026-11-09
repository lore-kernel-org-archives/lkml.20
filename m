Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794255205;
	b=zThDvgAO1uH8kOzp94I0xDnMKN8K+bfs71fJVg2VZjOzg36l/Jy4sAIU2HzyVorYGES4
	 vKiuVH41n4a4UJ5U2fBHA2aVUnfx4hm028r8agvUhxanWU+2HbOM2ol5udE4jgJj+1cYC
	 hpKfOn5i0raPj6W8VFcwecWeigct9R3Dj2Zckd8uaJTpJdZKZObEcFLM4TnFmIUq6AIEo
	 fozUTqR/1g3tFzMeIw88ZVcePqWzf+79OECEwyTt4z7Lkr5rxDXSInMv6EtBUn4orUedS
	 LZKCb7x7BxDqntycA2vlQfTCepV4KUopEgHmnTCckFjLgj2cVJhDk+Nl81YD8+E0i1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255205;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=VXm+6OX61uaJpfObZ2ZUHSXtn/upuVijSHkBPmcgkaE=;
	b=W6/DBlWzkoMpTzqtr7V7n3oxUeTwOiQCcfVWkFhIAQn3fo//0z73snY1wrkd7SmTznOc
	 dXVkqsa/Qx1gSZHqgZxB3xO4ZaAC+rv7qZO4LxpmTo9L1emQRLc6VaMgq43c/8eCzZL8Q
	 SqJ4Zc3bNvOsUT43zGhVn/gV8zcAs7FhtiF4/LbTuyP87QdGkH1DNDw73wDT+3y9QKa9t
	 ZvpVtKhRB3REwv4PD0gn6MD+7mVHD5+kyrZrTzdtWN0Ur1B21qYgfmIC1buA4+RMxVTFg
	 8ZpEXNvwM2ulzz8VZttnI6zX3Or2vjyRBwOCkz+nN8rJhL+p3+J8ijXNAcovI1VOmeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=aDkCpAEL;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE574606A31C;
	Mon,  9 Nov 2026 20:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE574606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=aDkCpAEL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=VXm+6OX61uaJpfObZ2ZUHSXtn/upuVijSHkBPmcgkaE=; b=aDkCpA
	ELGQfFjAdFCr25aSU63+4p+xNx4XyW4YBwJ3UbT0wV5XcRJoJdOyt/ewn5Vhn87HHDGEPf4TSBGfi
	npxkNrWMK5V+k5efSFkp7kDITZVPP5avHyMpYm7Lm/CMD3rhrT1dCzIEs4yDH0CE35YEE5mCLkObU
	583uu7oO4Y+5iD4G18NWnDxq02X7NzFRT/Kb4+1YwnXI+ngvjO+x/wgQRIX6DaDWeNHCdvRkYyX2h
	QjcJprRo+t5nMOOEju/kevCEUMlPx5Du6+fIKAU8VkIKUfsu7Sj5VKaD2G3IzFtGiPDuvPZRyPLqj
	2vSNevU4JnXZgMEzY4bTvg5d8LBQ==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xQVjQ-00000003S1u-1DHW;
	Mon, 09 Nov 2026 20:12:44 +0000
Message-ID: <63ed91b49db00d7a601b8ae1625571ee0c46ffca.camel@surriel.com>
Subject: Re: [PATCH] x86/mce: Restore rate limit on MCE logged message
From: Rik van Riel <riel@surriel.com>
To: Borislav Petkov <bp@alien8.de>, "Luck, Tony" <tony.luck@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "H. Peter Anvin"	 <hpa@zytor.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>, 
 "linux-edac@vger.kernel.org"	 <linux-edac@vger.kernel.org>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "kernel-team@meta.com" <kernel-team@meta.com>,  Breno Leitao
 <leitao@debian.org>
Date: Mon, 09 Nov 2026 15:12:43 -0500
In-Reply-To: <20261109195216.GBavIkcPlh-HcT_7JW@fat_crate.local>
References: <20261108143751.3af49e48@fangorn>
	 <20261108202820.GCavDbZJgmwKqysH4X@fat_crate.local>
	 <CH8PR11MB4034331B3E52AF39AA9C003E68FC732@CH8PR11MB403433.namprd11.prod.outlook.com>
	 <20261109195216.GBavIkcPlh-HcT_7JW@fat_crate.local>
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

On Mon, 2026-11-09 at 11:52 -0800, Borislav Petkov wrote:
> On Mon, Nov 09, 2026 at 05:54:34PM +0000, Luck, Tony wrote:
> > mce_log() is called from the interrupt.
>=20
> Aha, through machine_check_poll(). Let's hear from Rik first tho.

Not only the poll path, but also the #MC exception
handler.

exc_machine_check
  --> exc_machine_check_{kernel,user}
      --> do_machine_check
          --> mce_log
              --> pr_info("Machine check events logged")

As for the dmesg, it is almost entirely filled
with "Machine check events logged" errors, at
a rate of about 100 million an hour.

There are a dozen or so "mce: MCE records pool full!"
lines, and then two=C2=A0of these:
"mce_gen_pool_add: <bignum> callbacks suppressed"

I suspect there isn't anything special about the
kernel here, we are just looking at some unusually
broken hardware, which will be present in a fleet
this size.

--=20
All Rights Reversed.
