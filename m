Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356720;
	b=AWyXz9jK7SziGcK48Sdkh75IaKUNYpJQcn3w0Ee9nXN+TUnIaqfiTwCXuYac3gd6GNsN
	 yBv+Lu2KrxEMLFs9vVWP0IixIGdMystqScNgaqKtyY4zPKC1S2kzIw3WfnIjD8WGDwZ6k
	 3AvpSQYU9tvVD8rU2az8SuC6drY3D2Ayy/ejwUFwkB1a+yj6FIJ5xRVIO08tj6z7xbeA8
	 ndn3tGJGfH8yvIzSLoHcd6J8f0/UZ8V24QfQFpkhbZIc/nO6evYp+p2CRR+GWp8zncGu0
	 HbRuLULem0VWnx0qM5XOFMPfQfbwTilqf0hNeulD5keYE2Ijd6xXGWAmJthgegMxI+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356720;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Date:From:To:CC:
	 Subject:User-Agent:In-Reply-To:References:Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=KOU7tRLp2JFa2eboPtbDNXKxONaOjgcIah0kn86p4bM=;
	b=tEy+bk/6qxPks4jSiGZROgV1kRjd7hYr/aKx4Gtdx0JwShk0VRm5whCUWd3EOmje2Xvz
	 CuKsaxnSJZJMn5mq4qQED11JutPnJ5ISjc1pp4OqQtXEeT8mY2x/kWR0wg3ybuj92APCj
	 mwSMVnoR+fD2EFyhyYXfNy9g4435DDH0sa6LcS33yBdKxgOFJHuppQbTKesvc6psKuQG/
	 UJDU/yoppE4wzbLDHwa/DZ5aIKsgJVbm27CAFZ79hSm5soaaypSaQgUyq7di6jqABnj5c
	 eFVn7cpuGk9IFgc75DjGD4slnlf8S3KNlBNdMQw2wIwD3FA6CLzYBV2HD/CLW5tl1QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zytor.com;
	spf=pass smtp.mailfrom=zytor.com;
	dkim=pass header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=Z6ga6IVZ;
	arc=none smtp.remote-ip=198.137.202.136
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30781606B9DF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:25:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30781606B9DF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026102901 header.b=Z6ga6IVZ
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 6AB0OG26754081
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 10 Nov 2026 16:24:17 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 6AB0OG26754081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026102901; t=1794356658;
	bh=KOU7tRLp2JFa2eboPtbDNXKxONaOjgcIah0kn86p4bM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Z6ga6IVZzy79ml3Dg7jPQT58GBuW6/vwW6RWQiZZfjr/OE387+a8NWtl1suS+otgO
	 3iMePUOydt0/nAs1Z6TEzjBhjPHjWf+wAFWXicr10pziL6FDdM7ERA4vDsf46uq17j
	 h913D/ZnfqszGsjGdsUPkI9Cz4mqMbf/T9QIMQdUIx+t1pWil8gGJim8aso6MNK1bo
	 apPsB1UejZTD/92j7BUHxFecSrFd/mbL3bVnXa3fhYdxKJk0Xxm8alr+dciXCF+x+s
	 ZyAwLzGF+NSXr5YKvnYcKg1mNTNo+biF4jOjz/1oP9OHg5wA2llmqy7Pz5s9HaehFs
	 okz4jU9WqVl4Q==
Date: Tue, 10 Nov 2026 16:24:11 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>
CC: Linus Torvalds <torvalds@linux-foundation.org>,
        Usama Arif <usama.arif@linux.dev>, bp@alien8.de,
        dave.hansen@linux.intel.com, dsterba@suse.com,
        linux-kernel@vger.kernel.org, mingo@redhat.com, terrelln@fb.com,
        tglx@kernel.org, x86@kernel.org, kas@kernel.org, hannes@cmpxchg.org,
        riel@surriel.com, shakeel.butt@linux.dev, kernel-team@meta.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_x86/lib=3A_Use_REP_MOVSB_for?=
 =?US-ASCII?Q?_large_memcpy=28=29_on_ERMS_CPUs_without_FSRM?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20261110210055.0ca9fc07@pumpkin>
References: <20261104222806.1826508-1-usama.arif@linux.dev> <CAHk-=whPF8CD9zC960jPUi2rMrJ_pq9ytdSYqWoef-R6AHsfXg@mail.gmail.com> <719584E3-A730-474D-9061-BFF35EA4B02B@zytor.com> <20261110210055.0ca9fc07@pumpkin>
Message-ID: <35E00D86-450B-4676-8186-2BE8E7485072@zytor.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 10, 2026 1:00:55 PM PST, David Laight <david=2Elaight=2Elinux@g=
mail=2Ecom> wrote:
>On Tue, 10 Nov 2026 12:17:51 -0800
>"H=2E Peter Anvin" <hpa@zytor=2Ecom> wrote:
>
>> On November 10, 2026 9:53:07 AM PST, Linus Torvalds <torvalds@linux-fou=
ndation=2Eorg> wrote:
>> >On Wed, 4 Nov 2026 at 14:28, Usama Arif <usama=2Earif@linux=2Edev> wro=
te: =20
>> >>
>> >> +       ALTERNATIVE __stringify(cmpq $0x20, %rcx; jb =2ELhandle_tail=
), \
>> >> +                   __stringify(rep movsb; RET), X86_FEATURE_FSRM =
=20
>> >
>> >Let's not do that=2E
>> >
>> >Putting magic things like RET in alternatives is just a bad bad idea=
=2E
>> >
>> >               Linus =20
>>=20
>> Why is that, *given that it is in assembly*?
>>=20
>> For C (or Rust, or C++, =2E=2E=2E) it is obviously bad chicken=2E
>
>Because RET is a horrid sequence subject to a lot of patching
>to avoid multiple speculative execution issues=2E
>If is were just the 0xc3 opcode byte it wouldn't be an issue=2E
>
>David

Ugh=2E Right=2E
