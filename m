Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768361;
	b=bIU1HBKyHuTUTJKogV33heGi+jLmX2AHKnYEWdESRa9QY6VxohLL/pmMd/N6ugIufbgd
	 r0u7aOwf4baC8uMwPmvAn/beoIYg7HgSXBAchg2RqoaycYhxIG0H4I7k/TWKP1b/TrGZp
	 PPn04+GzE3wfamyTPeAcjhfPu6qj9tVZA10d1Y2Hsv+DcT9dokrMP3hLQIM39L7ioPDeD
	 yh9HdcSELNsaKyRlJbK5lILX/p/qb+gF/ygkXy4/VzVqsDU7cEhFcl30Eo1GLcnQcDiJz
	 wT81V0zFnzPQivaPXKqb3A0iKkntTIzf9K2iFQAH0xw8kE+5Eaqh3uwawMYEENvCmuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GTBZU2NYoxY52zS87kN5cvRsx8+DZYRk/wDlQGdD9fA=;
	b=KlZyOoLhKyRBOWtxfHbZirz0bkXG593V7tbGaO9ZslcLFhNVPwiGgyXJyzqsyqewhBZc
	 hpbpyDmSeSQYKL2BWOhcehmT2lU+Y9WUNEQuE2u2O/hfAQCjvmpXaoQitANZ55vv8HLQl
	 4quVA4akcTHVLrAZkIvW/+KiG9/x0Yle/fa+DhT4vXjYxMvUvgJ1tmKpPmVSt8txKCUv2
	 oh83zGtTUFuzvPWEknzJxd+bWwWCMBpabnh+eE2G0LTIzh7B6CkwnHhl0Jov19aN4aGFH
	 Aw5YTf7yQpUIrR7MEE90KS0ufqOWIL9n+yFKRWcBa47LcP/YWZEJ8EafVOCCriqInWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FA1ALNrS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D2606A329
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF8D2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=FA1ALNrS
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so61025ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768360; cv=none;
        d=google.com; s=arc-20260327;
        b=km9tQV8QtcxmOUDeQgc82W3Lk0NCYKu5vXEXUctLKgjoqoLh0Gc/Ly00/kkCdfJaBV
         AAMzYd25830ZLYHzJTy2xEkgjOHUvkeJxLFDFjSY2dIwZ2uyAW2Rzh+6+nucoSpptW5F
         FWwUHyAxFKiM49GUt0Mu9esXg09gfg7AxKlQsWTk0C9QrtCpHZZ5rMwDGpziraKgMS/3
         W+qYE8VcbZHWWVbrHZE+kEfxacGrZGESGoMfLgAO2CkaPtmY0q3JyxWbTeUfomi46+73
         Vkie3cikxTD3c+DCKzCt2n2OYPRDCLlYUCHxsadD5h55M7q/YuSyxPAD5BM7DNWemjHZ
         FLuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GTBZU2NYoxY52zS87kN5cvRsx8+DZYRk/wDlQGdD9fA=;
        fh=q8R75+7daviZqzhRF1PAhNQKkpWiFyb7OG1gqBod28w=;
        b=HgC6YWNK3EfzG8cNtgNgFVGWkjLDckuhfydpb56Yj0L5IVEtez4c9becnKkDtsdeh2
         vM427Wl7EBF21F/bu8BYKd2rUO4S1oMXjGvumegSSDBaSEVm/vqzO46QP9cfbkAVJiT4
         nKc+C4zKgHzK4Gdyd+YP5WUNChbaNu9FxG3A4U919h0Vg+bh9gBWD4vZ2m+snJsas1k+
         F0H5GkhzuPmtA2PbXNwHMP/3B60FfocXeceKssiK3S3kOEt1UDKP4rquL66GsQ3LknDC
         mqD+IcMmUbiljGfyX6GkOowgpDKCy9uV0vNn/zHzeEOSMzuyGu58yEvnhvhmt8RsqtMN
         K/Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792768360; x=1793373160; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GTBZU2NYoxY52zS87kN5cvRsx8+DZYRk/wDlQGdD9fA=;
        b=FA1ALNrSzo+aczkKotmLBVK24drLA8Xv+LZIoCG/tghiGEPsOcpLrHsGB4NxDwOPNO
         v9btTMfj2TUT2ME7MHLyGcYZn00t5NhDWmYs8B/upCPVYfVMZCuS3SM4lAK64iUiPH9j
         ncWVdRv9xYCrFdeHYtkXgXq5HdENMASP6P1cLAahsijYt1MlEcBzXVnewQSVcXj75jXo
         oX+4LvaWMfy1ZHuV+IEdyo+NsjZb9bgThh3R64BMx42FVa43uBb3ClvG48WDeW+ENXjq
         NJIKXPNKSy/+t3bLequ3La0Aw0+wNUS4fubMk8xHGpDCHB5FH3o0bNKJfcZoFPPsP48j
         7FsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768360; x=1793373160;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GTBZU2NYoxY52zS87kN5cvRsx8+DZYRk/wDlQGdD9fA=;
        b=MIG0YDnqXGE9ShoLN1fAyUDrSUPrim0YBBdStYJnwFGYcuwWayLPldAb6XpJNVuwfY
         u54/LBUfnV6qB16ayFWOb+D46+gy3wDwukk4Rpx89NHINlsDeNrUXvu2PdDQGav/wxFd
         EB1BU1+OHFlXuGdA3enh03IsVMF1CiFXxxBYPyfoK+fqlLLFqUcPu7miHXpAmrZJup05
         /XOEGJVoqMT6tRzDWcvTlcudrbGMZcPBM0eP3+pc965YpXUVtUQgjnQee9JyjOusya6N
         WYdmncGrI/ShfKN0N7h3qT8oe196MT8FGOb3VvTiCmS7AcVVKTspizUnFWaOF+/YqAVQ
         3o9A==
X-Forwarded-Encrypted: i=1; AKwUvByn6I8uurcaVW3cJkZ1ZWngsfGLuRJCuyabqqup1U8lWRyBUcOSK1g22JjI0Rqlfl90ko5uUF1cVp4uEZ0=@vger.kernel.org
X-Gm-Message-State: AFq9FYImb2P1aSrN5LeGErgwnRxhT9BkT99GDFIm9rd3zszqIJaOeC57
	jdjeEpMoTmIWnGbYRDK53asLo8ixYVPVIJtDTR1MujnygQhAXJYF5bqdFRWqkBuU0C21naqeX2M
	LR2j/Dozq/UQP9UmBqzqp0FGFmmbOfifXhDmwJdpZ
X-Gm-Gg: AYBFou0PoxFBcZpKUGStnL18Nf4QESO+5bFdsweMW59Zxynsm9HRZ+/H8x11ngozI+1
	IYPVEQin4FOfSdsqXuCZGhEO/t74vr1/9IatqG3OMph8rLm4R07CaHnVuk05Sd/9YVlzaO5LdEy
	uVgod/3/9s9yXf1LLWP9Pfz6WT3g8BzuwR1laiB3QRHn0VR0TLLlo3Ka420L6Prbfo0uP5DlzN7
	HCpaWa7TFj/3cbtUEUFmz8P4ehgFSWBv0khU+cowDhI+SNyWuUBqh+zXGru7EBatqMDrN36DINR
	h3lYDSPJ/8spNOL1ZZdc5bBpNz5AsCT9Jydr+/vJwJ8TON+Y0Ac9PuTw74AJKF5VVALVmhUQN9E
	jASA6uuS2rjNwibisTtr1qrtY7LSO6aC6oWmZ7g==
X-Received: by 2002:a17:902:e84f:b0:2d0:1aaf:daec with SMTP id
 d9443c01a7336-2ea7f4e1cbemr4092325ad.9.1792768358959; Fri, 23 Oct 2026
 08:12:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca>
In-Reply-To: <20261023145023.GH3977851@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 23 Oct 2026 17:12:02 +0200
X-Gm-Features: AclHuK9W5A7aXTPFZUdD2jRhpUmEtp7k-vVQ254ZWcJE4ItfG1TCZYdvtBT8nSc
Message-ID: <CAMOZA0JfsviAkojjEewehxMq0r0AboS=L6AWafMj4_Azaeg-ww@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 4:50=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Oct 23, 2026 at 04:30:25PM +0200, Luigi Rizzo wrote:

Just addressing the last part:

> ...The CC stuff seems
> actively dangerous. Unconditionally always using CC shared memory for
> skbs is completely security wrong. What I have traffic flowing inside
> my VM between containers or something? Does this end up putting those
> skbs in shared memory even if they never hit a physical NIC?  Same
> with a TDISP capable NIC, does this unconditionally degrade its
> security?

the current series was RFC and "unconditional"  just to show the concept.

My next version (a trivial change, really) is fully opt-in on a
per-device and per direction basis.

The unencrypted (or pre-mapped) buffers will only be used for traffic
that hits a device that opted in, and only for the directions that were
opted in. So we can finely tune the configuration based on hw capabilities,
threat model and performance requirements.

cheers
luigi
