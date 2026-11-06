Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793985930;
	b=qok1rT0DfYsSH3QFO+vM8vmxjtYo5r25U5oOyzH+d6RUW/CweIq94JnURr/TjHH2eZMY
	 kwzrR74kIy662O6EO2sICESkSwAwqtCtU8NETb3Ji1Z19OfsSdrnUeDyBNvDtSfxRHdWb
	 z+4zHxRDj+IJTgJJUtWwPCCuJNTrGsoaFfGQKQ7xSB5OoCWYaXNCTm4WWwt/rPk4o3Evt
	 02fa2ph5mJY/pSllFDUQIe/RNOUPdHxIHH97CF2kXNDJEGUb9JA5vjGBAzRqJC5o9iTHl
	 Oy8CPw5GrJzZVyee0m484M3oQuZdeCxJtMZa2p4Ue9g8Ak4JBMMo/oJgiGuD4EhW/fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fUrJNblI2O1hZNjcXmW6nSh+tuR5hYmiGJK5WvnJCM8=;
	b=r0yXUa6GBxiWOoxvCgnQqOz0G5V9pKkB/YNz3pnYm8oXAzsHtS9wWfItuuS9GsN7bw+C
	 4JqNxNtwgms9kGOL0c732Fz7cSiaqsFndtFcj7Pln9hp8fXDuXnHSw1I7qORZPxEU6MJy
	 FVBsQYlRMBbHEIgxVP9bfTZiGdra+1RC8p15gMwlylCPLPA8p0lpx8MwqlQzzypSjZccU
	 9sO71zQKE7nyrWieDauz6ssAJxcFwMRbfWSXL1kOor5tryQWgorCXMJzK/pMlfoLgFmqg
	 dA2OaYzkoQ5UboxPxFCsOzADi6OJPd82sZK6IBFSpliS4Us4UHGdiFAlOaJO2iNpcTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="ewlCk/lT";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67570606A332
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67570606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ewlCk/lT
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a018493d57so11555e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:25:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793985929; cv=none;
        d=google.com; s=arc-20260327;
        b=ZbBi0MjNImJE1HQC4v+HT15BojouklS4Xq6nXO5FupHo+y+PjDD//omAK51cHi9wYI
         Do5uwb6juPDuQg+3gEhU7vwo0tyDstDIUIG9RDJjMhfrN6piULoN21jRuGs1/2VIUq+P
         OnyaAm04eftOLZNoeQa8ofWRZdk29laMQ8gRa9YzviX/SajgjsCppVY8UIutCywaXtv1
         rocFH3zfD3i0s9chQSBzqiXSRuQY922Ztq49vG26X1o6hpc2Q2+inEA19gRXGNsfAePU
         oVEBoHgIzMAPeFjIIszHrWMwPINqwmNfIWUgS7GyUvkTxg7FG+QiAkF4UlHb+de5o9u1
         zpew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fUrJNblI2O1hZNjcXmW6nSh+tuR5hYmiGJK5WvnJCM8=;
        fh=LXb+kVG0PHiUKVbum7MPS5BFuFn1r35j0u544HSZV2I=;
        b=LkvYz/OiHDTwkn9p56Ibkre3H8C0KaNq1ebCnaIsi8gIg6i8/1PWUrIUPptVXxx2Fl
         HKdDFM8HZBQ8XTrxJhJgHwAoARoYj2liJ0hy6/eNo+VCciYzWaxRZvVKACxCorJgSenj
         u7IxOnj9eFfdFBW1dYCjdi1DT1PKKpZfmFu+Q+fkwW3REk/qX565E3zsFfwlLOfrzHTu
         Ym1YqCb/dy90hWUJz09dYQiyZZcYChAGuTvpkFtqTswdPyiJ6fpP3X29zfwx86/Lj3GW
         MWRUy44uzgXv0CWnxtsgR6IqKDteMUdYFtyXl1BZ59D7r9b00CdrRB/46yQAUPlD2Dyk
         9G8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793985929; x=1794590729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fUrJNblI2O1hZNjcXmW6nSh+tuR5hYmiGJK5WvnJCM8=;
        b=ewlCk/lTPeKUbMBQjEFxdvXeSJcIPNy2WZqd3RMZR0f4utguz18d1I/25cveVMzzFo
         RT7lseKNhSlQDjNcDMIS/DhwPwUeEMuf3p3QA2SuaR2YWynu3cJ86aMi1V+rohgW/ueU
         wdYBRPMGl9NpfqRBybmsYTfqpJAAsq2YUA3wBescnBCrmLOck2h5FL8JtaVfjtntUhMa
         atBGAqnYj6CPAyn1iWAem1TaZV6cbQ3Ry89bYsb3Y3ddSg87IS5+y0t3k5n/93i7MVsR
         kOjiJQAHUQ9kOMLGGhlfbBtqgDPKlex2gLuJNJ4aUDDAFXSR7PLhJYKjThP1OZfQlk1U
         nw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985929; x=1794590729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fUrJNblI2O1hZNjcXmW6nSh+tuR5hYmiGJK5WvnJCM8=;
        b=W78FxrTYMjfKi9/6K2Yf4g8uanU/HqgMt0whOixyRGHUZWBNvyRUEOlXGLh7Jn/k+y
         +mbITwKnjRedg2oQ/iR8ul3ffc3v9zOgDCsu+NYEq6WLD2VriifDR8FOt1bL1XxNUsOE
         BaamcIUyIR/+u6UM/kYzL2at9LfzouzNH8PyWq4y3Fgky0OcEzIPIYHMpDc2OxhWSUIK
         COCLBr6OrB2Aa1V0y4sEX9FY6q3d2/riWT06ADXc/mlJHDUFXYz6y67I3Kwdw9we9xPl
         ZV7+zzwo+TOxO9fIJARGLyBISzjvMdARNgG+aMn1mRiD9Rkdb2jlW9bmj2QWfNZ95R0x
         u+xQ==
X-Forwarded-Encrypted: i=1; AKwUvBymEWV1t32vH9x6Sn4WhiyiY5ubJ1xqz7O1PVu1byKpKa4/EKLcefX60JSVRiMM7nBiDTeZrPIypu2QLew=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JY44fe/l4VSTPzIaoAKFC5L3FKTpx4rO/Hn82/he+k8pvPQ1p
	jCfo0Aeu3djzWSKYxHu14btkTHjaSXA1eW41yX0KbkTwyeaswKHEx6uLcGbKLxS3zM8p0kU2yPL
	4mLtL/oy1QtL0fdEyddwUhegrWH4b87CLzacWsUgu
X-Gm-Gg: AYBFou2koOuqpmsZxU8GHaLbOZGoBcuBcsRaG9O8+E4R7wn2qDCwPwMwfhk/d6T9pej
	opqhjL2b6sJWrV/RGsvW99THNK3L5qL/zPxyicqSOkYLK9rmIPZLvVWoqjTotZfViamXQ7UJzaV
	vfAeBsuo1TB9vYqGUNOwludyNN/U1rMnf8eSsdHvlo56tDHdlsN/R5PD7nbuSxFH+5G7x4Y2I5m
	g9ubykN6Lf1Kqia4wSDZ/KQP9mRPKko6xU1VvTjvOQlj5lF6MMQguSOfCYfWhOHG4B4HZmxVSxn
	Ov/zdJV0RbFLmWuzPsKQv6osCNaI1qr4zOcDWNsb+pjcIZkl2KbUYdQ2TLhIKWAcD60X166F/Mt
	OX1v/l14NFPOQg3j+kTnhKTkX4ZZHNAnhxc1g5QWeuRCbZ/HfS5IhcUp3BVhLe8pVp/Pw72P/Hm
	yMR3bi7s9Dv2fN010hdYA+aSEgfVNHJbMoFWNVIW5Nc0R1
X-Received: by 2002:a05:600d:644f:20b0:4a2:a8c:22ae with SMTP id
 5b1f17b1804b1-4b78a315689mr14125e9.12.1793985928307; Fri, 06 Nov 2026
 09:25:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106131829.3228926-1-cui.tao@linux.dev> <20261106131829.3228926-3-cui.tao@linux.dev>
 <1e18fcfd-785d-43cc-afd6-d181bf8305eb@amd.com>
In-Reply-To: <1e18fcfd-785d-43cc-afd6-d181bf8305eb@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 6 Nov 2026 09:25:16 -0800
X-Gm-Features: AclHuK_zmhBLd-fBLwMoqE-7QVB_DAT0nisVVyTe7VWHd67XlQDn1ECR61povKo
Message-ID: <CABdmKX0nCB2hT+iMh=BB-nC=fUBPof8YvjvO-gtEw+zcHZgvZA@mail.gmail.com>
Subject: Re: [PATCH 2/7] dma-buf/udmabuf: account the page array metadata to memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tao Cui <cui.tao@linux.dev>, akpm@linux-foundation.org, dgilbert@interlog.com, 
	mkp@kernel.org, loberman@redhat.com, jmeneghi@redhat.com, kraxel@redhat.com, 
	vivek.kasireddy@intel.com, mst@redhat.com, jasowangio@gmail.com, 
	eperezma@redhat.com, stefanha@redhat.com, sgarzare@redhat.com, 
	rostedt@goodmis.org, vdonnefort@google.com, mhiramat@kernel.org, jgg@ziepe.ca, 
	kevin.tian@intel.com, axboe@kernel.dk, linux-mm@kvack.org, 
	James.Bottomley@hansenpartnership.com, sumit.semwal@linaro.org, 
	phasta@kernel.org, joro@8bytes.org, will@kernel.org, 
	linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bobbyeshleman@meta.com, mathieu.desnoyers@efficios.com, robin.murphy@arm.com, 
	mason@kernel.org, aesteve@redhat.com, harry@kernel.org, vbabka@suse.cz, 
	cuitao@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 5:23=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> On 11/6/26 14:18, Tao Cui wrote:
> > From: Tao Cui <cuitao@kylinos.cn>
> >
> > udmabuf pins the pages of a memfd and hands them out as a dma-buf.  The
> > data pages keep the accounting of the memfd they were instantiated in,
> > but the bookkeeping around them does not: the page pointer array and
> > the pinned_folios array, both sized by the buffer page count, plus the
> > transient folios array sized by the memfd folio count, are plain
> > GFP_KERNEL.  A 1GB buffer costs about 4MB of uncharged SUnreclaim
> > memory, and size_limit_mb defaults to INT_MAX.
> >
> > Charge the three kvmalloc allocations so the creator pays for the
> > metadata it induces.  The system heap in the same subsystem already
> > accounts its buffer allocation;

Only if the mem_accounting param is set to true. We (Android)
currently depend on it being disabled because system heap buffers
don't have a single owner for their entire lifetime (ownership often
changes immediately after they are allocated), and the kernel doesn't
have the ability to switch who is charged for the buffer memory quite
yet. Albert is working hard on it at the moment.

Could you update the message to note the mem_accounting param pls?

> > the data pages here stay with the
> > memfd.

memfd / udmabuf is a little special because it uses shmem for the
backing store, which is already tracked by memcg under all conditions
(except hugetlb). We don't currently use udmabuf, so the lack of memcg
charge transfer for udmabuf is not an issue. But once we get charge
transfer working for the system heap it'd be good to follow up with
udmabuf.

> T.J. needs to take a look here, but I fear that this might break uAPI.

Thanks for looping me in Christian. The buffer allocations cost
gigabytes, but these metadata arrays are only 4MB per 1GB of buffer,
so I don't expect charging them to break anyone. Leaving them
uncharged is an accounting gap though, since someone could spam many
udmabufs from the same memfd and only pay for the memfd pages once. So
this change is ok with me.

> A lot of the DMA-buf resources are intentionally not charged against memc=
g.
>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Tao Cui <cuitao@kylinos.cn>

With the commit message updated to mention the mem_accounting param:
Reviewed-by: T.J. Mercier <tjmercier@google.com>
