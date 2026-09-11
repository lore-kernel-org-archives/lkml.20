Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794DE4949FA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789142658; cv=none; b=g9kzrh5tJvV7/QRoH7UQTcmdLQ019ItbaoU/QhRCp50uDh/QtZvfh7t5nvF2T7n7ZCqCgp4G7bgvz7Mv7LPhE/qWbclUJI6tQ5VHZMQcvBJ4iARv+wB8Fx5AS+ECtLkJ+1rVvjVqncAcdi7yoixXijx5+p1n4PHnOUm3l0Ay8bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789142658; c=relaxed/simple;
	bh=rR1Bx7fi8xYmaqwM12Cl5cmpcBittw/5vU9eYvMxtCA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lS/EhNAsLmHnqli5O8LW+v5WaYBxCCD8IF9DB1UwEfxWEs647H0++6t5x92TzpyyRXCbWlkg/VIt1nFyOOqgS5H+s/xOiZKSg4iPWo0c9Yxai727WAYXNsYQPlV/explqw9vxm1zYHMpZ8CCkVfnLFzLGtG31rauJBVncF3Moy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=WnlsB0ID; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="WnlsB0ID"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=rR1Bx7fi8xYmaqwM12Cl5cmpcBittw/5vU9eYvMxtCA=; b=WnlsB0
	IDbzhjdBLketBrAColocv1cck0fpkaLFQAjJHI4hr87M4LisybioWrfUTth+BFqJX/WWHTNcWtxbc
	7NLv6WxJdEVsCMSeBk0VASNfbMqjho2THp070kDqJHdh4JcULIUxaaYNuIdfbIUC5qRbMg3tFPsOq
	E8CIBgyOGHjHQBQNymfwJLmBQZGqSAiPMJc1KY4r6XRK7ZuBrmCm33kVrVIsfA6bsL33gyj5UaaQX
	OcaI4z+ZJMhm8ZDdS8vBvSduyu36pyDDNlK97xHiat8ONcbVxMrol2Nh19vhqVDWKt53yVgv7lZO2
	Tcf7YK7kPCeaFunp9YjXR6i2Khmg==;
Received: from [2601:18c:8100:a0e0:5a47:caff:fe78:8708]
	by shelob.surriel.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <riel@surriel.com>)
	id 1x53j7-000000080lY-3ueh;
	Fri, 11 Sep 2026 16:03:45 +0000
Message-ID: <7c7b028ae93f0551e07e9e09468954e76ad072ee.camel@surriel.com>
Subject: Re: [PATCH RFC v4 0/12] mm: use per-VMA lock in __access_remote_vm
 for improved monitoring reliability
From: Rik van Riel <riel@surriel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton
	 <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-team@meta.com, 
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra
 <peterz@infradead.org>, Suren Baghdasaryan	 <surenb@google.com>, Lorenzo
 Stoakes <ljs@kernel.org>, Vlastimil Babka	 <vbabka@kernel.org>, "Liam R.
 Howlett" <liam@infradead.org>, Mike Rapoport	 <rppt@kernel.org>, Michal
 Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>,  John Hubbard
 <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Matthew Wilcox
 <willy@infradead.org>,  Usama Arif <usamaarif642@gmail.com>
Date: Fri, 11 Sep 2026 12:03:45 -0400
In-Reply-To: <9e902c8e-c825-45ee-89a1-85923453e43d@kernel.org>
References: <20260724222934.1463812-1-riel@surriel.com>
	 <9e902c8e-c825-45ee-89a1-85923453e43d@kernel.org>
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

On Fri, 2026-09-11 at 17:11 +0200, David Hildenbrand (Arm) wrote:
> On 7/25/26 00:29, Rik van Riel wrote:
> > __access_remote_vm() holds mmap_read_lock() for the whole transfer.
> > On
> > large machines, with large multi-threaded applications, the
> > mmap_lock
> > is often contended, leading to things like reads of
> > /proc/PID/cmdline
> > stalling.
> >=20
> > This results in system monitoring tools getting stuck, right when
> > system information would be the most helpful.
>=20
> Rik, what's the status of this, and which series do you consider more
> relevant:
> the pure per-VMA lock change or the pure page-table walking + folio
> batching?
>=20
> I'd assume the page-table walking would result in more speedup and
> the per-VMA
> in mostly less contention. So likely we'd want the page-table walking
> optimization first.

We can merge them in either order.=C2=A0

This series gives a speedup as well, by removing=C2=A0
the double VMA lookup.

If you want to merge the page table walking and
folio batching change first, I can easily rebase
this per-VMA lock series on top of that.

Do you have additional feedback on changes you
want me to make to get the page table walking
and folio batching thing in a merge-ready shape?

--=20
All Rights Reversed.
