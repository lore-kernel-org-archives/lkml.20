Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792688619;
	b=nzWiIwZFqvdi0t+f3I1agxD0JQQKODLy8XEeRpdqYAHFBTfqYpwdp9gFT6WaokaKj9I4
	 HwrK+aToU0P9tdh4Juz3Zy4EOCjHBYqIxdDFt7oJKCMF/94mUe/RBTUYEr4ZqDRRTeYCr
	 ZVlvX1ebtaET7daWOzaZlc2ZtLPGG7QISaFMWkXMCqBKtUeKFP7Gp1AvkrUunoXt7i95s
	 QcnbFCU7/q28wKMao/do/ocdHnSAmJMGqNqYreIzHxXTq2Zls9TnEALqAjixhz7qV74Yj
	 sfm9TEzAq+EzAtp92JeL/SpNKAkZdiqlnxOsESw2HYXtEEnLp3OQWMssQYca1+8ICFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792688619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=42ZKTYCAvrM3nzOwxlsBgd+YAojo0q+aV1smVjaq8KU=;
	b=Re9jLppdtXeeYOeB0kXPW+9R2X05VUu9g+2tbkiY6l40Le8FTNMUJrJ5Y5gtmp+E3cJe
	 zAU75TXaYalm6fn6WTKBjkmV1raeD4S6IZ39MfUmM0g06Pvw9xMemV/KBF6MSk+5C9HEl
	 gdxsB7Et6XONARUNUViJ1RJS+DLa4PfudeqvXQelg6IZbgAKJ1/coBH3Dm5xFxB2xwTwe
	 hbGlyElmue/RdMphDGCWnb0aYqong7jvMdHykXRMXrkLcmfue6xfU7go1hVoWhiGU02Vy
	 KEHDiFBBRHp1R07KbsLydLrHWA6POpLiRcV+hsFz8g3JNywgYO07iYP1t1dOG6pc96w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qYzOs5h0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9A5606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C9A5606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qYzOs5h0
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20b122af8so526865e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792688618; cv=none;
        d=google.com; s=arc-20260327;
        b=sZW5EN1Cp1qHZNM2LmC7idwiyx3DdjBWh9yE/Xp/aFQBrbJBNrWYEHKWIpdsOi2986
         9oMR2wZVXrTPpXCb+Eyz603qehyjqmJrDVffj/k1L3W3LtI13HMnGa0ahYf5h8FqyGyq
         zz3RYcKI4TsR53xlZSMr9wjE+1QyBKWWvSBtDtfAZtCOAUskNmRXGsrriwl0qLF/MyA1
         luUDw+NsKG3MMzwcROMRluQ+tcBJvJ2JIeNfHIfQjH7IcCnhqkouFhSU39hDE8eTKzuw
         LhkWeUZnw/Zq5EI/AnPmiExk5PNYDP0iVOxYA/Si9YW/OhICgyFUzK/krW7bshPljkix
         zhrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=42ZKTYCAvrM3nzOwxlsBgd+YAojo0q+aV1smVjaq8KU=;
        fh=cnhWj4WVgX6Iih7WvRIeK0nlfkP1jaxOcaEVH6I/QpM=;
        b=b52PXwtdoWH8cdw0oYRD+JAn4UQhNHcCuDpuFxm6gwK9HrXmeg+l3y3FMEG/niViCu
         riz9/Z3TaDf+1EVTmegFtAfPkq6loxrWtdEe1tOAZFQOxIG0/CPKCdunAKwtaz887oNF
         090Knmpz42E4Hlg5+2kTzc5JJ8ceOhLuZQEkasYPP1RrTM6u9DUPSSeiggOSJ8NbTONr
         3lADelopiL+KYV5anlo3nThM6dYisvm9pqsFrgSjGqbVUyzcs9okmNzNBpo7q7SaksnE
         SxgDy7VPDBVTXQq/2yL85+lzSKLqSHvyRJ0QSnx/RgkarzLJqOj5f8L4ZyL1gNJfcq8x
         iPjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792688618; x=1793293418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=42ZKTYCAvrM3nzOwxlsBgd+YAojo0q+aV1smVjaq8KU=;
        b=qYzOs5h0bXZxIVavXr7HNRq0g1WgfRJgI/Gu5cQj0HIe7P7IOhfhcVnfRT9rCJveiF
         3NUcgZ8bNqcQ845QepKODWAP7GCT9bLmdzP+yXz/j+ayzYi859f7ROfAymVEPsXSWtV6
         ZZwsxdvJ8x2ldFc+pPUEFrY0/T24yOfHteitf77XMw+P3HDFEkWO12HOJ1EQCk1sDI7B
         t7vbsd6Z926+FDsGoRMyeMyKq6BXCefbCq8itO9VXWI7MKR+s/1X3jFDowXg1NQu/nps
         09ZXtkSqo/v4tlNuMTlMIAMSzzLqgAAd72Glk4sq5zHXst38KYv8jJ3t0Dp7w9rhnejf
         xN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792688618; x=1793293418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=42ZKTYCAvrM3nzOwxlsBgd+YAojo0q+aV1smVjaq8KU=;
        b=VMZSNNwOpzL+UuFH3GtThbf2hTDyAq+c7khz5w026OSf/QmIocgvdn+fQueDhAxzXI
         GdrFnw56FiOgNnBNWbCErzVTQM6K6uKXc7tfOK6WyaySE3GIWNKIihe8Jbb9c/jBSnqM
         JCFD7QT6fVbE6gsChWG897IZ+cgT+q80k81pfgWYithWfekrg640tPnN5dn9BUmV4n/K
         wz3Fuhh9InX1xAtWN1/8SgEiw3oovNZRT1BiZ8uivu8DZdeqVblpwSnfGcZjD7QJm6j1
         zFAPCRtIrgAmmpXwv7WgyaEEAsrAUE8c82PncULGQOgjunB6pBy93qoiNZxn/MN5r03V
         E9/g==
X-Forwarded-Encrypted: i=1; AKwUvByS6g5ko+kGpEFTh2paVlK8/4CE0u21FwMpiDkfwc6SWIdc4fdI8SFqmSOe7PQHdhm/ebHkX0R8nIogXf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpE3oqBTxAeYYYxLXK3J0fkvUIy2JlHeYN0CRmPZ/YPpiPNEO9
	f5Lc1o684oE1JRNCms2G/YsGJWjW8FFASRmqFeHgqmeeQrqBJyEbJjIGBU2v78fJ6KoNa9pqbiK
	FCsIrp8uvH0eJ6TAUTYi+HkNhCgZ3d4g=
X-Gm-Gg: AYBFou3yPZjR56bxUv46anbOZVEN8mh3QWHLQqq5qmwPTKBATbA7eym59tpEah1Zred
	eO6YWU2WGWHqD4UteNTBPbmSTU301SsSen+2Hdd9esNT8PZ8eD5hH2kENj8MwvXeFwZYOHoWSLb
	mMkTSxPpRE0QXrvtdkjTSPuvzEb8+Rd9V2O/ejYCLm9Z8WLD5Nen7dkYzg8yQCj787w6l0o35Bc
	CfZOA+AyI1bNOGHV+oSXcrWonLXBJW2u1JCae/OwGYccOIE5sfKE6f82gCg0GrFQtf7N8t5wfgx
	RVHZGYxftL0fsBImbY1WNiaOl/8YoFxbFQfJTHiCpdnd054TuJCrHxEL5YVSw2HKqq5slQ0zMdS
	Gkqug0X4Q9DYuCy9zlf9+kRTySkwDSg8B7MCiyurfIchdqCC/Gh1fcNd3qqqON05pQ5y0MIfuOw
	ZPbDFBWese7/pIQN19FQB4zMS/WeYLOcFIw659AMfbikmRJZ0EEtwq
X-Received: by 2002:a05:600c:3e15:b0:4a1:e11f:b2d5 with SMTP id
 5b1f17b1804b1-4a1fd8a85bfmr107503165e9.2.1792688617341; Thu, 22 Oct 2026
 10:03:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021060323.553433-1-nphamcs@gmail.com> <179263657717.2549665.11401372071846447074.b4-reply@b4>
In-Reply-To: <179263657717.2549665.11401372071846447074.b4-reply@b4>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 22 Oct 2026 10:03:25 -0700
X-Gm-Features: AclHuK-KHka98G0XQ9c1yETjfsOpMIxaCbqOu01mqGiSr3S8GqcFL1s8QG2fmng
Message-ID: <CAKEwX=Po0J7KsR93YnP4SyXkpqZqjrg7HxyT=17gVD-fNtRHdA@mail.gmail.com>
Subject: Re: [PATCH v6 00/12] Virtual Swap Space (Swap Table Edition)
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, yosry@kernel.org, david@kernel.org, 
	muchun.song@linux.dev, shikemeng@huaweicloud.com, baoquan.he@linux.dev, 
	baohua@kernel.org, youngjun.park@lge.com, chengming.zhou@linux.dev, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, qi.zheng@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, riel@surriel.com, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, kunwu.chan@linux.dev, 
	kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 7:36=E2=80=AFPM Gregory Price (Meta) <gourry@gourry=
.net> wrote:
>
> On 2026-10-20 23:03 -0700, Nhat Pham wrote:
> > B. Semi-synthetic Workloads (memhog, usemem, kernel build)
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > All values are mean +/- standard deviation across rounds.
> >
> > Test system: x86_64, 52 cores, 64 GB swapfile for all 3 benchmarks.
> > Swap backend: zswap (zstd) with the traditional active/inactive LRU. We
> > focus on zswap here because it is the motivating use case for vswap.
> >
>
> I get that the motivation is zswap, but it would be nice to have
> disk-swap performance numbers here as well right in the cover.
>
> If only because...

I probably should test it regardless, but likely there will be no
difference in performance numbers. Right now for straight disk
swapping we incur 0 overhead, because I just bypass the virtualization
layer :) There just isn't any feature for me to entertain vswap+disk
swap quite yet (it might come soon-ish though).

Vswap's physical swapfile backend is only used for cgroups that
support zswap (for zswap writeback and fallback if vswap fails to
allocate or zswap rejects the page etc.).

For the older version, I put vswap in front of all swap backends. Disk
swap sees no regression, but Kairui found some regression with fast
in-memory swapfile (pmem). I reproduced it with zram, and I think I
closed that gap in my own testing, but Kairui did not test the fixed
version AFAICT, and I also don't have his full suite, only the ones he
quoted.

(Btw, Kairui, could you publish your full suite, or at least the full
set of testing parameters? I would like to hammer the thing myself to
expose bugs etc.).

>
> > For each benchmark, we test 3 kernels:
> > * Baseline: mm-unstable, no vswap patches.
> > * VSS off: vswap series applied, vswap=3Doff, to verify that there is n=
o
> >   regression to existing swap paths when we disable vswap.
> > * VSS on: vswap series applied, vswap=3Don.
> >
>
> If the numbers you presented carry through, I'm left wondering why this
> is a boot option and not a build option.  I rather dislike the boot
> option compromise in general - but other reasoning aside, if there's no
> performance impact, then I don't see why it shouldn't be the default.

That's a good point yeah. Lemme think about it. I added the boot param
before I decided to bypass vswap for physical swapfile by default...

>
> ~Gregory
>
> --
> Gregory Price (Meta) <gourry@gourry.net>
