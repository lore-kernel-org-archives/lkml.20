Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794524367;
	b=zg0r1jCVU+yYOmAH/5hZD9LBiR5qBUP0q9o+w3xq33r0yG0MkluuUOyBJSzmFXNg9bvz
	 3g2fDgechowhiUZSfuiRr12T7ZVse7EBGenhXMdFGHGYtVuRc/FPgG6EJzTQXW0rX/Cw4
	 LyozTGRuEm/Cv6EztzC/AqQX3TvbvJZhOV3qrMmv01rT7ClRwsQMOe56GXUt9CB9XYWaY
	 PKtU2+H/fLubo/83TXZBg6LEpKFYdu4b7VDgc+Lro8pJuqsz6Tx8K9X95TKDBVm8NQOuG
	 M5gcVobgI+ewH40ZwiByTn1tS+vEdMdV+JrbyrY/Smy/n++mTKpA1bN8DGpqp8tljgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524367;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZsSjLqJE2zg5KnRT+r/w8Y0ianrVtar664vxU/qkfmw=;
	b=ZG17OWtFQ1JcxJDpQK61nhCrNr451jJFmk9DYAbAeAWq0dlBCeqbd3/PgCJPTE4HPUaB
	 l6fg7aPpaBtw3qs4gqsi9JsSBnDc809fLdzAAV7j3b6keDnU6pX//bbj1k0jBjsXUC0IY
	 EIaWj8qz4M7K9qB/I0yY0VBMoPAPtRn01cGGV8riWQI2f22rRcXGtuh1D8LMZY0NidS12
	 AuixRiKq89PUz86Gs/C1Mv9Q77sqf9sbFUxdZYD5rBEa/mJNYOuKmXl1S826pSAPpmPGc
	 +hd2mhUdbRg/9ZgdwwwkgB94yUIH5Lhhs3EkIKdf3+zf9dd5YqhRE/r31S5fHYYrODQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NRwZn7LS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73BE60A5BDE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:59:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73BE60A5BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NRwZn7LS
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-54492d8a988so14531cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:59:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794524366; cv=none;
        d=google.com; s=arc-20260327;
        b=qH69RfkUDxetlN/Edjm2yfZwIhYfOFRQ5pHIlYm+SDscomxjEjoxZhAycIdDGOEJKv
         C9T1S2kDYZAs0Vk02iG9rB+61U2/AYj+fxPrbTohxXSrFSaace6iWol4Z/V0dRV6CsDl
         6RJQ4ax9uLAdRLj7Ozo547VnIlzfpPMDfT6tMOjlAFvmpDf4dxmUYAf3/Miicyw0w0Fi
         QSAoeQRiC03t5wifugza+Nconi1GSl7U+x7VzH/xxk79TEY6FVWhWkDSWGf9RrqxkmHJ
         DYmrytAKO5g6hXOw90VWSgtU2/tZGhOFI2+ZBRqxpBX89c8IOtWSzMcb5TXh5rIf/fu4
         9qqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZsSjLqJE2zg5KnRT+r/w8Y0ianrVtar664vxU/qkfmw=;
        fh=B6qQouZcYiNXsfYqXtsrDCBey9fxDS7JPpH24gfvNBg=;
        b=EnPtse320kC+nCJKvPJwyFxAwp2UJnOz3al2x9DDuXi4JtnEh5iQ5vaTxmmBwlZR4h
         10luWPo1ptdZNBs+ZxEAU3rPa7VnNvDIa31bqQxsTHyNHAXjkRyGT7q1s/Q/cN8GFcoz
         S2O9Z4aQRojGIhBhQ69/2b19cfriGQwlsHMfw0tKyaRZ6C/4SWNGP9+YoqoGPvpaEYnF
         icnwSEzyl0ZmRjs/+nkW6z/4EcLTjyTI1V9/NRdjWC+so6YHEcy6TxVsem7nnk/CaAkv
         p+OhdY4M2DWUqWVOoqvTllN1zIPWOvXWdwzKfohbUEVa76s2YCNWPf08kVao/xz8qlyx
         jUZg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794524366; x=1795129166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZsSjLqJE2zg5KnRT+r/w8Y0ianrVtar664vxU/qkfmw=;
        b=NRwZn7LSFGPxX3NtvX3Y7sFS2xItJxs0r16isV8pawPhbKhy9B1louAe6i72I/3N2P
         UniuOLDEYa6TVxl3FcjF+9fSBbbE6bEf8pNLK7WB6YbLd65ecGFIrlmSNUlXyyjpJ8vf
         ohFZkafmiEpB/6QdOpX3lVI6mIhmWqe6T/e+zzki4c0Prg7mBZOQ6GWxsjlHiixSscXX
         A2EnFSV9dgOF5i1DaoquT+PzW0SfWsEl1uNHbNVAhiQrzGs9Og4DdpgCz+Yv7QqLqs4H
         +ukKqWpoNHIUUbHnQO7MzVkr7o1J4ZHyugW+l4ektn2xy8z/xNEMyuKzLtfe2JdeXdLm
         aMkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524366; x=1795129166;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZsSjLqJE2zg5KnRT+r/w8Y0ianrVtar664vxU/qkfmw=;
        b=FiM+5PFNV5+mxhC84vg+JVW21rOMPfiPlwQWRG1CXfOKTT6kjJMMHmfS17KvmrdJFy
         IsQuCcWmQ3pnyXKoZvAkQqeQAyfHh0UAie/IPcwG7nBvQ/PpKDazsCHf5KVqpIgqzcAK
         BCFp36kPI4vNCbC9j/z8Q0FmBH2aTcRg5m3sTRLZgbCWNv5boEGWOAjyCN44zcPqHrKC
         qHTo3XNju6noCcIiahn5UallzxsMbPnuMidWcBWnRWkobkmbWdUgsx/y/Apqc+Lx2tiT
         TsCd2zHQgoudm3GuJdGy0Vhe6ICtYAKv1/LZAxq7AfNr3GyS26QlBsvfUxHqn+P3bpt2
         k66g==
X-Forwarded-Encrypted: i=1; AL+hErE7HNl8KS7Uh2oRC5IDnbNG0bH7PYurtUyEf/VxzlU+SiQhJSVMSD9T/1ljCp353Y71VX+Mo2sif7yGKzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z94VueQ3Ko5rUxpIa5BJzVgZLsZwIoPzh6l4v6W3EcDFYbff2dg
	U2Aq0uvYm3IaN6voP4cjGkFhG277UJNdkfnO8LLP0ertUjqAeR4cVxPYEE5W/3lwdSsZy8nxfbH
	/Y4im7kwRGVplVM2fgnpbfVw3hU2NKGqvefkKgaLb
X-Gm-Gg: AYBFou3jS+1OK/qvzTvEi8KZGhk4ULnj2lW/wFlhcue7wtEaotePLaYAHHE0F3hI+Vv
	wDsd7D69ODUtvVzlM4GaO5Ot38Sp+ZuIQ2QygzZaPj0euM6iRvsrCUeTXpz5zZGKdXih4431v+i
	KPE7dr+JHUSSQpox0sPRNkTeGg/vcfrDCTa9LoQYtAPLUkfNMokGDqV+mB+6YMdx7PSujuHsNjk
	U4oZsvRlYj8fDHR7WtuX5BMcC/T3STe0QnOv9ef5B6X2vq5FEcUo1LQzPSvFJN3RyLC0f8ayjQS
	776hCxeiVygoPE8WvAKowR8cJGa4kUfFLi5iK4cqRM0Wwcq4KG9UmBe0+efEjOSRXyHiRWLH1GW
	ylDy3sSyXmQwWMn5ytWVnLMS26E87fLs1KdFuGA73TzNstBHrs7lFsiiaHpncixlEXTo=
X-Received: by 2002:a05:622a:98c:b0:532:eff9:ca08 with SMTP id
 d75a77b69052e-55afcbede04mr2871271cf.12.1794524364998; Thu, 12 Nov 2026
 14:59:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103223025.2482227-1-nhuhuan@google.com> <20261106085019.90487-1-lizhe.67@bytedance.com>
In-Reply-To: <20261106085019.90487-1-lizhe.67@bytedance.com>
From: Huan Nguyen <nhuhuan@google.com>
Date: Thu, 12 Nov 2026 14:58:48 -0800
X-Gm-Features: AclHuK_MjdqInx2d6Ru3Fw1h0wqnaU6otNi9RKFyMPSDK4f5OfZNd4Zh3wXDlV8
Message-ID: <CALwWd5tttbaNWoaXnPZjHFgYhG8yMyT67_9nhRKN336EHOVhqg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/3] mm: use non-temporal stores for demotion
To: Li Zhe <lizhe.67@bytedance.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, 
	alirad.malek@zptcorp.com, anna@kernel.org, apopple@nvidia.com, 
	bharata@amd.com, bp@alien8.de, byungchul@sk.com, dave.hansen@linux.intel.com, 
	dave@stgolabs.net, david@kernel.org, dimitrios.palyvos@zptcorp.com, 
	fvdl@google.com, gourry@gourry.net, hannes@cmpxchg.org, hpa@zytor.com, 
	jackmanb@google.com, jic23@kernel.org, joshua.hahnjy@gmail.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-nfs@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, ljs@kernel.org, 
	mathieu.desnoyers@efficios.com, matthew.brost@intel.com, mhiramat@kernel.org, 
	mhocko@suse.com, mingo@redhat.com, nifan.cxl@gmail.com, rakie.kim@sk.com, 
	rientjes@google.com, rkodsara@amd.com, rostedt@goodmis.org, rppt@kernel.org, 
	ryan.roberts@arm.com, shivankg@amd.com, sj@kernel.org, surenb@google.com, 
	tglx@kernel.org, trondmy@kernel.org, vbabka@kernel.org, weixugc@google.com, 
	x86@kernel.org, xuezhengchu@huawei.com, yiannis.nikolakop@gmail.com, 
	yiannis@zptcorp.com, ying.huang@linux.alibaba.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:51=E2=80=AFAM Li Zhe <lizhe.67@bytedance.com> wro=
te:
>
> On Tue, 3 Nov 2026 14:30:22 -0800, Huan Nguyen wrote:
>
> > Using non-temporal stores and prefetching on x86 bypasses CPU cache
> > allocation, protecting active workload working sets and improving
> > demotion throughput.
>
> Could you show some real workload numbers for this? I am wondering
> whether the reduced cache allocation and improved demotion throughput
> also translate into visible application-level benefits.

I do not have direct benchmark numbers for non-temporal demotion with
this implementation yet. As far as I know, Alirad and Yiannis (cc'd)
are currently evaluating its real-workload impact and may share
results once available.

>
> > - Memory ordering:
> >   Add a wmb() barrier at the end of folio_mc_copy_nt() to ensure weakly
> >   ordered non-temporal stores are drained before page tables are update=
d.
>
> I have not looked into all the details here, so I may be missing
> something. But before migration completes, there should eventually be a
> publication step that makes the new folio visible. In theory, that
> publication step should already provide the required ordering before
> userspace can observe the new folio. So I wonder whether the wmb() in
> folio_mc_copy_nt() is really needed here.

On weakly-ordered architectures like arm64, the publication step
indeed provides the required ordering, because smp_wmb() and
smp_store_release() emit real hardware barriers before the new folio
becomes visible.

On x86_64, however, those primitives compile down to a compiler
barrier() with no CPU instructions, since x86 assumes TSO. Because
movnti bypasses TSO, the standard publication barriers do not order
non-temporal writes on x86_64, which is why folio_mc_copy_nt() needs
an explicit wmb() at the end.

Right now __HAVE_ARCH_COPY_PAGE_NT is only defined on x86_64, so that
the wmb() is effectively x86-only today. If another architecture
implements __HAVE_ARCH_COPY_PAGE_NT in the future, we can move the
wmb() into an x86-specific scope in v4 so weakly-ordered architectures
do not pay for an unnecessary barrier.

>
> Thanks,
> Zhe
