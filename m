Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EBC33DED9
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787778185; cv=none; b=HybmbUoDqd7A4ag62dngKEjLiIg5+GAWiCK7nTHxygLTanlAMFI6Yg2UwhHTWZKX5YFlNVXeUHMXUPglKX8mMLlyLlwuuMmtzcAJczRBGK9WlDCUXQ6z5aIbM5SZk/bAXSiNWaF6yI/olo0+OW8GEg8SG7NisO5QamDEKaXHLak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787778185; c=relaxed/simple;
	bh=5KQzDgyiIPz88ZmSk3EZ6LlItPMqpc2RARdCySgObbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QaEmrDrYrJYnRFBB3Bu714V/mL8wxAN64XhaPpSfXcmBS3RL7Lc5Y1Gs8O2Lz4lLtC2pCNITuj9cGFm8nXsrzYSQdbCeX/VDH+Zf1S93KUpIn89NdcHmNO9ewgXwlcJnYtKanrK97TTaY5ytY7Ie5MUmC0qYLWzVQXzkbvRrzpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=foIPooo9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="foIPooo9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCD81F00A3A
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787778183;
	bh=5KQzDgyiIPz88ZmSk3EZ6LlItPMqpc2RARdCySgObbg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=foIPooo9AEpRxj35k7f/KTmciK8rtt6Te/B0afzdBDkp4WP1Xkpnq4nkiVXf1vfdG
	 q23EIJQmetVlzQraAdWGlbAofPVf7aqzHPdYcDawHUkQeDZqSSGgEORTHpcc6ueDNk
	 nc5dDLk9OFh97Jt/uqHe7fto/2+eaA6A3/4nfR4zhrGDZYXD9B7Lmire9hFKRLzJtF
	 8wpeQju7aiA6mwNzjK7TX2oldJujslmzVclhw9pwg1Ni3jrn0VX2t8PNfFtLH5fazQ
	 4f5QeZmboTwkvTh/njkGgRNbztn9ZTAHHcjrz8yyN6ITDJ4hjA7fCmAJ2GqWd/FmKN
	 8URnEoPQh18Ig==
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9061a795d76so17125106d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:03:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrPelO2E8ESosQmUlq9zjSBH4n+aWiC7fDqcFWn2sqdq0i1oukyrqsbSvXeamn6LtSXdN2zOJrthBTuUns=@vger.kernel.org
X-Gm-Message-State: AFuF++nU13TprTrcuPLCSQ6+cjPzLidx+3jNl0y2V+7KcEDln8dyURWm
	Cbv1VeARiaPrt7YguNmsBImgyH5rdF4b9uRb5VCujcaWsJU6r/mf9i+oTwDm+rDbbwg0837ttx/
	rjFu9YPjk81MWfZETDVghlHfwDeK5UTI=
X-Received: by 2002:a05:620a:9142:b0:936:7967:7955 with SMTP id
 af79cd13be357-937803e7e75mr815574385a.21.1787778182927; Wed, 26 Aug 2026
 14:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
In-Reply-To: <20260826-drop-thp-maintainership-v1-1-3d102748fa17@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 27 Aug 2026 05:02:50 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wH_-2NPV2j6wxN_EfAeXvDe_eUnkj0KVUu0nn+ANfohQ@mail.gmail.com>
X-Gm-Features: AcwNN1UCklyIxHoStaDuT-E1MIb2LN1kaFlTLTeei_p2HLyAvWl8ZP496MYtr6Q
Message-ID: <CAGsJ_4wH_-2NPV2j6wxN_EfAeXvDe_eUnkj0KVUu0nn+ANfohQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove myself as THP co-maintainer
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 5:56=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> Unfortunately my workload is such that I simply no longer have the time t=
o
> give THP the focus that it deserves.
>
> So, at least temporarily, step down from the role.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---

Thanks very much for all your hard work, Lorenzo. I can really appreciate
how busy you are, especially while you=E2=80=99re still developing so many =
things
at the same time as doing reviews.

Personally, I also feel a bit bad that I haven't been able to contribute
anywhere near as much as you have. I still have a lot of catching up to do.

Right now, as David probably knows well, my colleagues and I are working
on both FS large folios[1] and mTHP[2]. I really feel that I=E2=80=99ll be =
able
to spend more time on THP-related work and reviews.

Lorenzo, you have my deepest respect.

[1] https://lore.kernel.org/lkml/20260826082641.2007658-1-zhaonanzhe@xiaomi=
.com/
[2] https://lore.kernel.org/lkml/20260825043833.2659350-1-zhangbo56@xiaomi.=
com/

Best Regards
Barry
