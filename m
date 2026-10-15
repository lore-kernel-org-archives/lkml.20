Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8BE4DA9DB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792068831; cv=none; b=jBGxsB/pZyhSJABcZCT9Ns53Nih4fFVt0uLdzHbxASUk3+bqg56mR0IiqSh2azoz8UODxU2vkAG9Pd3iPwtochD7DcwK02a1UfR0ziFlRDiAFotV67mtsH5/XdnAqPX9mjMhpAq9u8S3pX+7o3wqRRHfpcZdckNzgJEER6YwOos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792068831; c=relaxed/simple;
	bh=+aloW1e/2hgj0CG7zlWvi6F85K8Mxq4LgXboRC8EEw4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T1rZ1fzWz9Hc1eRnC3Y6vpH6L+x2gzMgsnWYMrAFTJD81QdS8zCzLK2sNzdZSgAKqz2dSP6YXt8BkYWA+JI/eFgfNGQYG8T0xcSE0VNuP745AWbEqHAGPzBlvEyRVRLHTHVS5ta+rmibTAtMhJhWoxnToK71lW1AbwzWjp67dQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=X/k7N6fs; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="X/k7N6fs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=+aloW1e/2hgj0CG7zlWvi6F85K8Mxq4LgXboRC8EEw4=; b=X/k7N6
	fspp5W6e8UAk0tlBTGlLJqt/knJxaZv/HSreyt27UeqP/L+ZLYrf4L+Uf3gy7wgOBVXAiXzHY1zvH
	S5CWn586QQqCpePLdGEMgqCZ32XhhO3x3sEqWffk/P/+z+qjkHFRDScxg7b5tIb0cu6F01Ha48jYi
	L30Hi7WKktwyrERXAwwRlVBA+GCW/RMWdy3IBISq0OcHnsRMb5LTGwTIdABSgRX1O7sPD4eQKsFiR
	y5lb+J09Kz4B0swsv7QTJetgGBZgSNnKM8t8MKnCn/rH/nU5DQASnncdwnJQ4egOKPfT/drJ0aXsg
	ktn+E1H/oKdhqOf5Txf/J68dvdZg==;
Received: from [2601:18c:8100:a0e0:2541:b86e:2586:d219]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1xHKxH-00000008Tlo-4A2G;
	Thu, 15 Oct 2026 12:53:08 +0000
Message-ID: <a9c30209e1fc024a11664f959d4c1b697ceab5a5.camel@surriel.com>
Subject: Re: [RFC PATCH 3/5] mm/page_alloc: convert any movable pageblock on
 a non-movable allocation
From: Rik van Riel <riel@surriel.com>
To: Dev Jain <dev.jain@arm.com>, Johannes Weiner <hannes@cmpxchg.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
  Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan
 <surenb@google.com>, Michal Hocko <mhocko@suse.com>,  Brendan Jackman
 <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Kairui Song
 <kasong@tencent.com>, Qi Zheng	 <qi.zheng@linux.dev>, Shakeel Butt
 <shakeel.butt@linux.dev>, Barry Song	 <baohua@kernel.org>, Axel Rasmussen
 <axelrasmussen@google.com>, Yuanchu Xie	 <yuanchu@google.com>, Wei Xu
 <weixugc@google.com>, Baoquan He	 <baoquan.he@linux.dev>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org
Date: Thu, 15 Oct 2026 08:53:07 -0400
In-Reply-To: <087678bc-41f8-4250-bde9-e9fe9399e67b@arm.com>
References: <20261007021250.1665929-1-riel@surriel.com>
	 <20261007021250.1665929-4-riel@surriel.com>
	 <20261014204836.GI371161@cmpxchg.org>
	 <5234543d2c1b44706501d2e079b41e95a6a1d200.camel@surriel.com>
	 <087678bc-41f8-4250-bde9-e9fe9399e67b@arm.com>
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
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2026-10-15 at 13:50 +0530, Dev Jain wrote:
>=20
> >=20
> > I have code for that, too, but it seems like
> > it's a lot easier to get things reviewed in
> > small portions.
> >=20
> > If you want I can resend this as a larger
> > series, with:
> > 1) the pageblock claiming
> > 2) per migrate type free lists
> > 3) evacuation of movable pages from unmovable=C2=A0
> > =C2=A0=C2=A0 pageblocks, when the kernel free lists fall=C2=A0
> > =C2=A0=C2=A0 below a watermark
> >=20
> > That would be the full extent of the 2MB granularity
> > fragmentation avoidance stuff I have here.
>=20
> I think your patch series applied as-is would regress stuff:
> we may have lots of UNMOVABLE pageblocks with lots of
> movable allocations, unable to be rescued, hurting mTHP
> allocations.

How should we move forward with this?

Do do guys want to review this series first,
and then I post an update with the other
stuff, before any gets merged?

Or do you want me to post a larger series
all at once?

Before I move on, do the combined policy
changes from patches 3, 4, and 5 make sense
to you (with or without evacuation) ?

Patch 1 from this series can be merged all
by itself as a separate thing.

--=20
All Rights Reversed.
