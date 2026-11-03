Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723304;
	b=b7G5FAz0uoJCJC+Vg9IpYMi2ex0BhzQJQP0zSXqger0piB50ZBQz0re0GgXE1x5TpFYV
	 9YLKFW2TC75QL0x725ykWeet2gcWQGR+YnvQBLP8AeGR/APz6YYlpaVA229aMTUj22aHC
	 yJ1Rus6ndu+2FYbLokFX5GJutFaJw1J88zfMLu3XNf5Iup/88NXvnZR7A1GnfMBDVGGm1
	 LpJLidPaAdbNHoP4Q/kKLhDVGWcb4X5d9PbVUWwmM3HNgDLsMst/kgcayZv2G3vCO2BFm
	 Zx3PCSHJx8XIa6mql5PdL3OQJFsAMLayj31iDVrXdTnfPExYCwCjim7AxqjzmqcCbTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723304;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=iPFbuhVhE1g4yui1cmP0KhQNdE0EYgL9kQOJwYevAeY=;
	b=zvjvcWnhQU7PN0sMSyOWiIeT6hNpiFnHPLupBFYNRz0Cgg9g066t4lNxQU10vnJMYWGk
	 hsxNlyMppcDBnVXZCdUYNGtpDV5TWa/gCa9+4h+7H12l9myXTu1wy4FAMHpi3i27x2HiJ
	 dCf/ntzWgEVgPIQazxhUzy6wle15YVJNnxzHW/WTQf5Pj1tmJI1gjkOQZBlI1ou/51i8W
	 i+CDVgPP8sFL26ltGZSafQs+1KelDXpOgeXVttqb9N1CVUi4003j4sWuSqyRna06Ns2ld
	 ThjcAw7J6NuFkZDR07ePZcnnjMI+Fb62IaJSbzeV/bkYJisnWgKzjLPc5UJi7osf+EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r61v+7gr;
	arc=none smtp.remote-ip=91.218.175.244
Received: from mta0.migadu.com (out-244.mta0.migadu.com [91.218.175.244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB18606A33B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BB18606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=r61v+7gr
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=CUR3VrnT7Ns3nP5+yfIqfY8w9gLzlAPh5PghOBj2uBY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793723301; v=1; x=1794328101;
 b=r61v+7grIVYVWqhS8Lm5pWahEWysBOpG/iKajA6oEOrSsfZPFp9nUNcj2+MbrPY4S2Surs20
 fQqubmy5hKQRdJs5Ll161iaMm/TeSm/9Z2779HXuqyWMynZh507GzJZhpGwE5Bunzny/JGUyJxW
 8W6ZxUHGa6N3/BheQS+XoGL8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 463699d6cf500596;
	Tue, 03 Nov 2026 16:28:21 +0000
X-Mizu-Trace-ID: 463699d6cf500596
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfca2a2af4so7838e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:28:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwwPVcU7nrc6DcXIscDXxJYIPeVuC1lTb35sxm745H8ZFpnl0a3Uy3tjTnv2v/+LrcrA26q+3AS0+dbzGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qfrzk+6Ldq88sk/XLEtNtU6A70lhyWNNpffODwrSYBxN3GLnL
	jvVAMUqZXvhzQM7aWcB90NwGqGFKLS5aXDgIkAkBxHAELJ8dkxX13uMZRj5dRLhfJSelhJYMJyu
	1W8/fjyUhZnkOUvvZZt0WSLNZqwR4xDlVe4LhjwuB
X-Received: by 2002:a05:6512:3e0f:b0:5bf:d226:862e with SMTP id
 2adb3069b0e04-5bfefdaa5bamr205874e87.2.1793723295372; Tue, 03 Nov 2026
 08:28:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103084742.1302597-1-fuad.tabba@linux.dev>
 <20261103084742.1302597-2-fuad.tabba@linux.dev> <aun1NJNtnOeSL4oc@google.com>
 <CA+EHjTwCPHp_odMPJAJ8pfPtymtU5ia_RrH30DavFeiZqvhVAQ@mail.gmail.com> <865wyd3mqu.wl-maz@kernel.org>
In-Reply-To: <865wyd3mqu.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 3 Nov 2026 16:27:39 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxfQ5P+Q9jrGxr6A4CjtewetFE9apskj061iJQbtwAsyQ@mail.gmail.com>
X-Gm-Features: AclHuK9bqtJuUq_-qqIlTFI2gjtDBN-F09-mdn7cW-n-Iv21GT3fzkXnYFOU20Q
Message-ID: <CA+EHjTxfQ5P+Q9jrGxr6A4CjtewetFE9apskj061iJQbtwAsyQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Don't walk the whole IPA space when
 destroying a pKVM stage-2
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Raghavendra Rao Ananta <rananta@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 16:26, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > > > Fixes: 4ddfab5436b69 ("KVM: arm64: Reschedule as needed when destroying the stage-2 page-tables")
> > >
> > > Isn't it an optimisation?
> >
> > No, it fixes a regression: 4ddfab5436b6 replaced a single walk of the
> > mapping tree with the 2^27 lookups, as described in the commit
> > message.
>
> But that's a configuration that simply does not exist in HW.
>
> Therefore this isn't a fix, this is an opportunistic optimisation that
> may or may not become useful. So not a fix, no backporting.

I'll drop the tag then.

Cheers,
/fuad

>         M.
>
> --
> Without deviation from the norm, progress is not possible.
