Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0554CCDE3
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057387; cv=pass; b=AjX5zxsfd5p84w7zfa0VB4WrAJhBJdX20wluaUzmkBk2PdpD3QHSBDYosHYPjF3LTRuqWp/y2ziuqKxQ/Knkk/B7vqTSTX0eSfIT0rYl7nPSZUwcv3xHFFEhxLFX+ypDHV2dGUjhN+IVAQ+sYJENJgjC66NHSvkCKvhLgB/3fD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057387; c=relaxed/simple;
	bh=nEAGONInB8tJpm1u2lIKx48IXnht0iSXDghcmCqPigk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lqWFUrolOOYarBs3p0xsTY+v7kSlNjO6bps+NgklYoPWMHBojES2EB3/jGM7D5W2vWPzs8HkB3+mTJJ+GI0/qZ9sMwavUZoi4Oio+lnDc2gxnZ+IpoI3LPaVaTjDzV3pbo/fA6Rzwd41j7LZFq3B7WBjg1279zD4GsvnkXiyTHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWb84oUu; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWb84oUu"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48441fa5c37so5147571f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:23:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789057383; cv=none;
        d=google.com; s=arc-20260327;
        b=F7oM39mf9uH8C9HjUrwy7OrI9eJQdaEgR/Jf1f92IxK5dE/c6cgBwGfT4xITUq3mGG
         Idwsa8qM7ZQNLP6XcnWduCqTIKEWlKtBopGayyHi8VZdMoCG39I//O4ZBi+Ps36rPkH7
         thoVFAA8G0Z2tRPvO6aFnziibz/591SwwGSEn9Hn9vSc55SCyvxK6tjmNsOlL6YBj1SL
         uGlXnzfyfi5gBK6Ij/KTxEevXwCMNhQWhlsiflKEUiPWiHgOhB4BkzcmgvQL+P/HYfCu
         4/Yz96dx69UaLdOt0NXDffgylbrgyPFPc5yJAPsEp1OF1vsAaFkq5OlxAmt+pG/bz+h5
         0rwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nEAGONInB8tJpm1u2lIKx48IXnht0iSXDghcmCqPigk=;
        fh=nY2zett0IMlNf/9fB/wSZJvBv+ge7rX+gndBn3napuI=;
        b=F4if7VXm1Q0MkhU4ej6+IH8kNOv11N2SopFUtpjZM9TVjWo/QHMzLm9+0e85J55y7z
         BIFP63mGL5pKT6ZqnrQ4rZbPYyi+vHcUSpxzt5vPjV4lruadeP8QSOxoXr/Vxa3M7aYJ
         7I56Wk8cvPqsQUqUKq4SD4y+XvXelKk4D+dULpIWaNZD4DCFZTiUTGJSA97WlnMc2bJq
         1Czir5OSSc8o1wSJxsxhhfLnDc9SKb571f+bD+1tFFZuKfTvneJuvWwYPRRB0U0dB8/m
         E8A19vqbQKNP93DvkadWr1AFQWexf34uSetydeAmNfNZJkmlZG52eLIFLgeSyMhYxHuZ
         SWLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789057383; x=1789662183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nEAGONInB8tJpm1u2lIKx48IXnht0iSXDghcmCqPigk=;
        b=QWb84oUuY0DIhK7Cn4zCchODbOkmPx0v/W4Y6yoAgILWKbrIbFulX/ogrgdskqh0hd
         XBqNK482u+rraNTtj3cOCbtaH6ArbvBAaVUPxYdJze/vvOJ2PrOV6rZZpKJ4CCb6/T/D
         izdn7/lkuwmMwR8aPAzBLFhtt4PiY/hHPXRzTxwLFOjBwMcbvik/O8nOLuXoOi0dNT2x
         JHSVBQiRkINOVm0ZSDDPZs9dFKLmstd2i74SftqOPn938BMJpB/6i44OrlOuW4RvDMOm
         DQxdWp55nFQ8Zs95BDMlBPmo740eVGidxTf0+Qz2huRcMaZdbNp2KnatT4QCmiumXQ67
         IVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057383; x=1789662183;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nEAGONInB8tJpm1u2lIKx48IXnht0iSXDghcmCqPigk=;
        b=NtziZ5D4Uch1h6/6h14I3iu62KktPMx+1Ca73/3P1rJMIqpuiyxepsdRGgYkB/8DQx
         /2UCqngeIbjcyMDbxgTR0wCUAqUC7IdG1VPbvAD+TdI192MhrNdcW4B79qyY8jc9lxf9
         fmUCTIrxVgSTjjBSBcN53bkdyHECv1GPENNwtmPGfU4PP9/x/e6sSnCm+7MV5diWmTaN
         68BE1isVqqRQjbLxB8AxPu9O3K1JcS2oK9q653IIJJQ2ut8x/5qXP7Te80i5BEdYd6HC
         TEWgbZx7b39jCv8vSfH/6wbzkxESimUtxttrPU4IllGfw945EQ/D8jrmXOX9Jncj9uDc
         kq0g==
X-Forwarded-Encrypted: i=1; AKwUvBwEAos+mb6Ztx6dfH3oM3JQ7TwOUrAhvuuASu7gxVjgaGuc3IxZ9Qfyxfsgkn7/mSQ9AC9APySgRdJWszI=@vger.kernel.org
X-Gm-Message-State: AFuF++ljOiRSMtQELmWopB767yPhRFrnCXPjVw7P6smo3Xpfp39tqABj
	Wx/fUqP3cEVvNKd0NbFFaoWqj4DJJ/YG+dsXfG7StKo+1YjioN/KYhXkb9M3BeQUNnLebjx5O90
	p/vQJyFrgKZBmskoyijJ4lJ0vyuAY7cU=
X-Gm-Gg: AYBFou3smc4l9LFYAGoytkf48gZ1c6Ef4z6/bME4VVE4dw5+p3RXNxH3IPPYccsthjf
	/UsKBk6QJrWUuAL2E1SMR9Pv2ZgrByL44gAx5J1jPKicOjrTSmVBfRa1StW7Y1b2pNLjQ7cLArE
	e4kiXFt+RTPq74l+9LP/OWfSb4bh/ln2ziVR+A4MrCjzKThhceh2iTeLSVVNKYo03dd9+3CYUGI
	WCN8zzg28Sfpf3nC5mK0Ed0McQh9cd8SFKC32Xfxk5SkCPyd3xgeLYg0MpntrFXJe92wCLIhZ62
	vR9MGS3ePCj0NkMZ5h0FtqzJnUdiyljQ6dVNb39DOJ1TdfWCX/NlJIbgHsLwtrTemw1EgMZSjF7
	lBUx0AWqJjdOeB9r5NUGxtA==
X-Received: by 2002:a5d:6f0a:0:b0:485:95b7:fe8 with SMTP id
 ffacd0b85a97d-48595b7116emr40680885f8f.25.1789057383303; Thu, 10 Sep 2026
 09:23:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org> <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org>
In-Reply-To: <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 10 Sep 2026 09:22:51 -0700
X-Gm-Features: AcwNN1UnDVpavQ1PWarBG8W2VruLfKxk4ncIecF52ch3SJz533v-zrDp7ETfpYo
Message-ID: <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Kairui Song <kasong@tencent.com>, Chris Li <chrisl@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, YoungJun Park <youngjun.park@lge.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Rik van Riel <riel@surriel.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 3:57=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/8/26 18:45, Nhat Pham wrote:
> > On Mon, Sep 7, 2026 at 4:30=E2=80=AFAM David Hildenbrand (Arm) <david@k=
ernel.org> wrote:
> >>
> >> On 9/4/26 23:14, Nhat Pham wrote:
> >>
> >> Hi,
> >>
> >>> To Kairui, Johannes, Yosry, Chris, David, Andrew, and other (z)swap f=
olks -
> >>> I need some help here.
> >>
> >> I'll mostly ignore swap-related stuff because (a) -EBUSY and (b) we ha=
ve quite
> >> some swap experts around :)
> >>
> >> Reading below, I do wonder if the swap subsystem needs some more coord=
ination
> >> and collaboration?
> >>
> >> For example, maybe having bi-weekly/monthly meetings to get everybody =
aligned
> >> and uptodate could be something reasonable?
> >>
> >> This approach has proven fairly helpful in areas where (1) multiple co=
mpanies
> >> are involved (2) many concurrent development is happening, and (3) peo=
ple have
> >> different priorities and requirements.
> >>
> >> Is there already something like that to organize development? Should w=
e get
> >> started with that?
> >
> > Hi David!
>
> Hi!
>
> >
> > Thank you for your suggestions :) More collaboration and communication
> > is definitely needed here. Conference is a good place for this, but
> > it's not something we can do very frequently, and many folks could not
> > attend (visa issues, etc.).
>
> Right, and conferences usually don't have the capacity to squeeze too man=
y
> swap-related topics in, so it would have to be side discussions or BOFs.
>
> >
> > A bi-weekly/monthly series of meetings sound very appealing. Swap
> > contributors are very spread out (China, NorAm, Europe, etc.), so
> > coordination will be tricky, but let us figure out something.
>
> Yes, that's an issue. I'd suggest swap maintainers take care of that if t=
hey
> agree. I could try as well, but it's rather tricky right now on my end ..=
.
>
> As an alternative, we could also use on/two/ ... slots in the bi-weekly M=
M
> alignment session to talk about swap. (I'd be happy to learn more about a=
ll this
> as well)

That's awesome! Thanks for the offer David - I think MM alignment is at 9AM
PDT Wednesday, usually right? That works for me of course, but Baoquan
and Kairui (and other swap folks) - would this time be convenient for
you?


>
> --
> Cheers,
>
> David
