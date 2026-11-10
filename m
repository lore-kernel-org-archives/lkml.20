Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=96.67.55.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286297;
	b=WzvVoqM7rLssH1ky+s2D7kxhjcXv4Ki4+VhGmK0UfGGyrKDRuDD1XnsuT5cEx4vsf72U
	 s9Iy7/e46eE06DJZcF2XLw3/bpvKIaEBkNeI7ieAeScxhlHr4rLUVgrpAMPpbbLFqFpl7
	 AEebSpfO5SD1w/S+/x6Dn2TsmbDBdiz65u2iAjU3Lwi7PdhM/gy1bXHh5g+HZoltkicME
	 50eKWp5gjDiHhpdL+9ZIQvJslzMUD85R52drOJ87MFzdVS9OYEoNaQhLS/cvq97GJbmIY
	 ufawREifVZXxPdT3NbdddSWsXbB+HtnFLAB4F5vPaLPhdIA1OuwMSWLbCdeM+dJiz0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286297;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=hlu7ksmyy0VtKWdZrpCJUVhsfYHu/YIZGfPiir2Huy0=;
	b=dJOFUNOKJI/1oMO+sfjIssxqyP+s2/t5rf9jcC5QrnQrSZBlQcRGfHGUKtYWWslo3VcL
	 1pg/jH3TGwkExRoX+l8GlCXJcCmgy/ZSEz9KE2Q9fq1mxQAuu0IyZVPPkwUffmcvcy3IJ
	 Lo2IjB//L1qpv6w/pi8hcxCM25+WeUYrAUR1rkojk1ZEG/nIABo5TQCnsHrGgaqzWJe/i
	 1O6D/XNrT2I+yUGgwKd9KRQ9f5pvcHE5I5X5qCTunY6GJovzcSN/Ve4c3vQefxRGDENhS
	 n96uaY1BrLSrh5xydbrvUtYN1eqL3m2Z0/bzC+f8rPHpUeg9jk6EVzwCroeZNycwi0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=surriel.com;
	spf=pass smtp.mailfrom=surriel.com;
	dkim=pass header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=jYOloyN7;
	arc=none smtp.remote-ip=96.67.55.147
Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2E7606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:51:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB2E7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.a=rsa-sha256 header.s=mail header.b=jYOloyN7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=hlu7ksmyy0VtKWdZrpCJUVhsfYHu/YIZGfPiir2Huy0=; b=jYOloy
	N7KuatV8i812SECW8R4UW20pDecNNOLe+DBjhjLOUn3y4Hiek9jqPludBaZR8X7Xn3sZDz3T/ziHW
	+JDVham+hHtTlxnVBiwXmTu521aMtNTIpFMdE7/3lfOBnPqlLxHtIeUYrv3/wo86Mg12G++BR7Zgr
	MZf4l5NQJ9RiSIiTNqjd83WH9dS16U+wcywgtp9+g4fI76Fl1fe0DS+ZMy6AtsdXqCwYJarCmtnAH
	OJhcB0P2Z3lKA6QNCWEJF9SKN4UWwCC9mD7Td0tCJ1J5WGBEk6KNl3oB2/CJJ0Uv0AYdsYRCqpJOn
	C2WZxCRdxOCiF8nDN25SIY4awn4Q==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xQdpQ-00000003WXP-1TA3;
	Tue, 10 Nov 2026 04:51:28 +0000
Message-ID: <163854fc5a1b794a807c3f5eb5b2955f1a4a9991.camel@surriel.com>
Subject: Re: [PATCH v3 4/6] mm: internal: introduce FPB_LOCKLESS for
 folio_pte_batch_flags()
From: Rik van Riel <riel@surriel.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>,  Vlastimil Babka <vbabka@kernel.org>, Mike
 Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,  Michal
 Hocko <mhocko@suse.com>, Andrew Morton <akpm@linux-foundation.org>, David
 Hildenbrand	 <david@kernel.org>, Yuan-Hao Hsu <aa9736195201@gmail.com>
Date: Mon, 09 Nov 2026 23:51:28 -0500
In-Reply-To: <20261109-refactor_gup_fast-v3-4-2aaef02df0e1@arm.com>
References: <20261109-refactor_gup_fast-v3-0-2aaef02df0e1@arm.com>
	 <20261109-refactor_gup_fast-v3-4-2aaef02df0e1@arm.com>
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

On Mon, 2026-11-09 at 12:32 +0000, Yeoreum Yun wrote:
> From: Yuan-Hao Hsu <aa9736195201@gmail.com>
>=20
> Add support for calling folio_pte_batch_flags() in GUP-fast context
> when we are
> not holding the PT lock. Instead of reading PTEs through ptep_get(),
> we have to
> use ptep_get_lockless().
>=20
> Specify the new behavior through a new flag FPB_LOCKLESS. We'll make
> use of this
> functionality for batching PTEs in gup_fast_pte_range() next.
>=20
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yuan-Hao Hsu <aa9736195201@gmail.com>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>


Reviewed-by: Rik van Riel <riel@surriel.com>

--=20
All Rights Reversed.
