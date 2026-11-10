Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300911;
	b=WOjecJSz9R20a7JhlO80pcDM1uWHj10EtTDJw/NdKoQIUZOVDUQkMOvqBJoup0nr9OiC
	 6pw8w3OXZbCKqd5YE6Wy03w1m+5AlVKoUMn7TjuVzpWvSDm3z79YA6pnh6po7+XWL7fCa
	 OpKldEvKueS0xZJzwuf4VS6pHtbZ3ONaooVMhZ+DrNMoj1pkXZ/O2LZ5bml1J085fB46m
	 lVc4BDzgO3ucqPtiKqjLPMqnm8cOg1ql0Rb9WpN5/oExmFqzvD9gzW7TqeAx8JEEw3PSs
	 cYiyv4TOzlWA9/wCQywgAhUuLXg/nGzQxdjyWNmL8lUEvnbRpeDxx/NuZxN1yYgMZYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300911;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YvaZ/X6Bxi94U7st1FV4Wbd+ol04f5D6i4UgeBkOt8k=;
	b=CgLP4ZOKWF+zgIdvc1/vcpPh8S2NOLsr/mNqJ36aQ0h+yFwIAMB9CxDYjxcnTm5GxtML
	 uV4ISy/IhSgBmiormg6zFrS+2ifVq8VRaCcgKvzGeDPRsWsCQqEJWSzDSq8npGGVojUBI
	 dsRgwQigYKgYMpt9EDp2Xu0RsQ/FKhTW7TA/2gskx5Dgj+A0pVIG/Y+4xKNx5pPfiRNjs
	 T+L7vLfB1SRj5VZ2j4ervQuT6MadRAEN9Fa52JUrQTXZxpdcW99dlB/Ff+5gFNPQjjFGX
	 /z49OY1RE/IGj8y6TkAPw823xn0zegGSYdaQkuonm0k5t7p1KC/eYFr6cvw10At020Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=foHbyGKl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70921606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=foHbyGKl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B9E21F008BD
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794300911;
	bh=YvaZ/X6Bxi94U7st1FV4Wbd+ol04f5D6i4UgeBkOt8k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=foHbyGKlNQhA22qWcsw8f39vRZnh8X6rhvEmQPRmL+asxuLVOYPVKjljqaBjoE70U
	 WQqgTcQklFoX8MeqhDHQ2bbE8D25XQGe2jqtEl4SXSUU3Wnm3A5cNDVhpvaJiAYofh
	 CGZhgRY4rqjdjNPCqASqs5djpk+V8NoAZKdFrZPRlpJ78HSR65QY9sqMtkYfrEhT72
	 SpGGGY4lBGsrRMoNEoUzurYi2p+AbraBx+EadkBZ53Bn/i/p3ocPEeD72jqPfZxH4X
	 VFkSe1WDPVy+27/0Bg/ckDBnwtdrHqD0XPu1Nvoi01T73zWRBxb+17p9mBMGqkKjkL
	 tNcpR+bLLE9Rg==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93f2049ea7aso118945485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:55:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErElZIPLuvDGQxNzLyjuRP9ENOr91K3chgJDSkBkPFPx8dmiJHCmk2qH4/qcbblh0b461HXqnR1PkONADhQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KowApwZBZJ2RE+y7hLb6w29bds2sIMBnPVzYwntIaTlbz0H28
	YLqIMLN7dJfxBVvelVenam/DM1HGhJ7wUnVWDXI3ka8cHPg2VGgCTMZht/gCjqzEt4pkJQ3w2vK
	rC3zPEKS4zQjPnUqJRMu6LNHUJeGYuoY=
X-Received: by 2002:a05:620a:6491:b0:93e:bcbe:f709 with SMTP id
 af79cd13be357-9479f2f0ec0mr257530885a.16.1794300910593; Tue, 10 Nov 2026
 00:55:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <affd6da4e8d0de1424a4e0b3bafcd1324dfb6c97.1793847060.git.baolin.wang@linux.alibaba.com>
 <20261105045406.39871-1-lance.yang@linux.dev> <0ddaf336-7cb7-4e83-af2c-f60d23f7aafd@linux.dev>
 <f7bd740e-1328-473e-96f5-89658a08d514@linux.alibaba.com> <CAGsJ_4zHtv7hBCaW=wdfiM7yA4OJS7pcFomSo22bEzWHizYAXQ@mail.gmail.com>
 <453e2c18-4e79-4db2-b565-1af881925f08@linux.alibaba.com> <CAGsJ_4zLiwYf6LM_BWoZyiYWxvW2H_siZ0QC7FmEHazF_fLa6g@mail.gmail.com>
 <3c0185d0-ed2c-458e-bbcc-cd35070ec743@linux.alibaba.com> <86856d64-593e-4d10-ad40-c0c4f056332f@linux.alibaba.com>
In-Reply-To: <86856d64-593e-4d10-ad40-c0c4f056332f@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Tue, 10 Nov 2026 16:54:58 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xjDmc=s42sSEPYwxaGXGU1zZY0308UbQ5m87pkBZJZCw@mail.gmail.com>
X-Gm-Features: AclHuK-w2Nldkmtvma1Bg9jGFHQDQ_8lpB_b8E1LSzfXJV4rkN8Crf47apRDLJA
Message-ID: <CAGsJ_4xjDmc=s42sSEPYwxaGXGU1zZY0308UbQ5m87pkBZJZCw@mail.gmail.com>
Subject: Re: [PATCH] mm: synchronize with PTE table reclaim for all folio sizes
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, david@kernel.org, 
	ljs@kernel.org, riel@surriel.com, liam@infradead.org, vbabka@kernel.org, 
	harry@kernel.org, jannh@google.com, qi.zheng@linux.dev, pfalcato@suse.de, 
	ayushr@modal.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:24=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Hi Barry,
[...]
>
> Sorry for the rough quick measurement last Friday :(.
>
> I found the first memory.reclaim() trigger has high variance because
> folio_check_references() activates folios. After the folios' reference
> flag are consumed, memory.reclaim() shows no regression with or without
> the TTU_SYNC flag, and the data is relatively stable.
>

We have MADV_PAGEOUT, which bypasses
folio_check_references(). Could it help make the test more stable?

mm: madvise: pageout: ignore references rather than clearing young
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D2864f3d0f5831a


> However, my testing is simple and doesn't cover concurrent stress
> scenarios. Whether to set the TTU_SYNC flag for small folios can be
> discussed in a separate patch, along with how to evaluate the impact.

Thanks,
Barry
