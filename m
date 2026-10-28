Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793173411;
	b=nPNgc//NMZ1S/YsfrNhL07i09Z8mNBI1dghnKlP9BPDBnbBo2Fp83Um4tsV1vFlBDCtS
	 7X0yu5xeyeLDKzsJ7wS3uueO8eRlQ6xaSXLGbVEilqFFY8YRvh27ZvskzU2nCIvcf5gbZ
	 TWwrdUhMtN4ffVBMJfcQ6F0uXgxp/kfhv+JruEGAF9iaIuHLi4WImvKeRbYT4mzzJ9+5z
	 FZhHgH7JatOioZLEglbskebMm+03Rg91JM2nisjn7pLetazuNKKPi50zT52suv7mPUU2Q
	 +I4i0ftVWbUy+RPGfWx8vy0VaS9WN8bYxCx3X+mJzWN8rWV2op/saevTNqcKQgYq55A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nskSZD59o5Wku3VNP5CAyzpTIbm3E/kieBuAkeS4vuo=;
	b=qWR3lmqEU+CjzbES8DJsS+BNI8SOCYkLxY8kVQGmfiV7m7vKteKYnBCrcNTdZr1i0VzV
	 E5XFeNaQDcMCiN2eixwA7P24+ZSa2Sl1lh/INuSy+jlT5XzftRVC5AVcxw4LNwtvBienM
	 vT4qAOIcfZK22XLD9q4CWH07wOPNp3QL92wVvY4njgwnwruDKh4jEgFh9A2TQiuccq8xd
	 8kbKG5X44kyuVFuQqH2bltQL2CQS9p2Th3GBhbb1FYcnGTmCglz8xfV/6urdDLBS/FYSA
	 +oRhiOyrSdS+pIJpo5Gs/d32Cycp0/Y1q7WIntDcCGFzDEgu8mpuxG51fJt3ynJyrng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eY8K2Qfq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBD3606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEBD3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eY8K2Qfq
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c46822eefb6so73901766b.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:43:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793173409; cv=none;
        d=google.com; s=arc-20260327;
        b=GSsChzJVZZDG8GzuNHvRxpFNwSyzVOwKpm+92nFSfYCn5qryoDK0DPt+TAIeAuol4p
         6eX3BeQYyjQE37T2VfSjpQizJlHwqzlswvmGj3R/zK5XTySaUCcuH/L2/hgri4WCsE7+
         XDbtknbcFT8VVKO/bBrSyK6KBP3bOpjXPxNG8/P71IGcXNo1aSoEG+Sx1F7j+/QX+/9s
         krXJ1rac7DvpEeWxSkYBBFHCNoxj5u2/ugeuV9wpc8gH2LCrrQLM5iBfnp3XOwTM++P5
         T3hCaA461BhI+8GDlGFeqrXlI9jZmRSxS8RSZMzPJKPCFV1fWaz0b1AI/6o2kN6CyyRC
         Ej8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nskSZD59o5Wku3VNP5CAyzpTIbm3E/kieBuAkeS4vuo=;
        fh=QrgApb4oOLKyTc6SfQqebMzHFNB8FDwAqmuTnzuyq90=;
        b=fXs8iX05x0se8+T5kJiQFCGR4rpFQF+a6Jf1BF30N/Q9OT9Bp0D6Gs+8Dp5CBrUtAH
         mw+RjC5g5f2LDNgXMMCxJzlXuI2QwyWRWzwLouIdC33Unjac2LOtyy4w9lz5y0xp0Gk0
         6dMAvCmNJ9fBgyneHYuPgGSZKKkl4mOD7NKKVe+dShqRB0m45eszzG8X3ObuX9T4FTKI
         f+Ul45UGZ2x+y4G8iugqe/KP7xOwRi/SomupfYBcwJreqAJFUK4AeeTiFoBVVb9Uf1vo
         Cfwx5sqYUnQi0p7NuLZZdbqJ6+UJwslRciOHJY2nsQkVW3QjaBOXpH7D6K8hdQ7gPvMs
         1+ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793173409; x=1793778209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nskSZD59o5Wku3VNP5CAyzpTIbm3E/kieBuAkeS4vuo=;
        b=eY8K2QfqWnb9Uy5/XzguQIx7EQpUUcQbEVhYARBR17WJ4iuiiEJRw8vLhNRNaxP8d3
         +TfZFT1spjkwqs4FMS/lskywFPc7/3c6Yx9Baunf+hC1PNfje3kaaG+fhnKqCE3eG8dM
         YHUQ6F29rrBzhxSdqbJaZuQLiJneTH+9O6T+/e4jhEjlimbuDP2m1OIuLlTyBT3FOznq
         IAQqlkBATrqu6uq3uytL5wLjUbcRuEJinWiO5PYS6CMeSf5uFd0gs0BMOE8hRSA+rw4e
         11MR/BNlpNrTXvZ30lBSufofLldS2rH3HNuzXRtxUu5cvG+MNrQAWIFHBItMAyWuPf/K
         Ieww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173409; x=1793778209;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nskSZD59o5Wku3VNP5CAyzpTIbm3E/kieBuAkeS4vuo=;
        b=c4MImNkHuJ6fBmEiZ+gHGp2zilZyJw3EtjCxGkDz7m6S3aeuXoW3wsd1E2ibmOv5O9
         MszdZnhyRN90LXqipy7CTpisbsZ0WYKqfwao4KyZGVe168KeTTmjv/Jc9fYKiViI1F+J
         Oy/z3PwTo2NXWPd8pRLsjUm+yZkHhJuAG6z1//vbgicNptIMubYVFlDoZWXQeA7vYmhP
         KkxfZXRlBD5fNsZ3FYvK4Do1M5bA5c+wQIFUa1yDEmZDFJ+8g7POB2a1tsjW3pl3v2uK
         01BWLH/6jTsvYtNdC/P/ouCQJogx0QQGVOZXeX9DJDAzRQd7ECqIfhGliTUvrF9fDr62
         OevQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNo5UjRnMoQ+XMsCx+HsqxMtbQlGOmeoT1BPrLcVraWwCqRyiJ9MLgLKi+73p+PwYUn3SikYG65LclJe4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtg86wsoaKz6n0dWkLIafm3/GsmlwWE7NMyrWT6ypbPihkzAYD
	pilMXak6jvGY/riqAX5XLSedDnAfPsJUtrJB5IRG2s0Lrmb4YUUj7whEAkwz284Ba6NwbZ5lKKW
	6fElF1qkwVraHj8S2z8+txrzx5Z2Qg+M=
X-Gm-Gg: AYBFou2lPjsyJWDN7Br5rrIi45a2hvxGl4qKq88EOxa8T7TSBC9WpSuO3Hv/mrUXGvg
	fZ8Wpw3h32bDVUwxiN+nxxXHBNSo5Chtxx2p2W/7vXzeLrS8GQ7GqzG0KocTyqPOzwzTJcDSUtQ
	80S+pmnGQlgu2NRqsCHcdr9P4c+TamAR1Pil4tjcrhgeRANxAcxvGG7QBIMH7zQPeO5jd/xsuLG
	4yHNfiY4F7VJfImrHM/FU+CAewFXBhqx8rEijKlC1NJaRFBtAMSPGFdJbhuBTEOO2YgjherX3Wa
	bz5ra8ee+k7Sk/wGckNUc/vm4qTaSKzW9mGloCtThAILeSseXJeG7nswwHAggR72j25+bpzH+Oy
	QW50WpFmyfbj7aXxBZaqxeflaNt6qpQOb2t8768MPTWgwhrqiLiSr4zJcM20KzxI1MO5SUg==
X-Received: by 2002:a17:907:6e8c:b0:c29:5172:6151 with SMTP id
 a640c23a62f3a-c49bdfdf3d0mr122319066b.45.1793173408903; Wed, 28 Oct 2026
 00:43:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com>
 <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org> <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
 <CAKEwX=PCSyCEAqxeOH6CkCMu1eB3xUn3iz5XNuTbpDM3EmWYAg@mail.gmail.com>
 <c6e62e80befa886fccd36d34a39cf56ea5b9c9c2.camel@surriel.com>
 <CAMgjq7CN7qTes+OXvCfsgPOnbtyY7YPytTEP3zZJTBxrGZ5JnA@mail.gmail.com>
 <12081d266e4846f23faacfc65c7be7da4ed013a9.camel@surriel.com>
 <CAMgjq7Cjt==BxXPNw5HjiA0hjxhfzWn=9gDQ+2x-rdrEQBWTeg@mail.gmail.com> <CAKEwX=P_3W+MAFe80MZ5FT0mytv-UDzfmbyBiNsYR5XjC5emSQ@mail.gmail.com>
In-Reply-To: <CAKEwX=P_3W+MAFe80MZ5FT0mytv-UDzfmbyBiNsYR5XjC5emSQ@mail.gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 28 Oct 2026 15:42:52 +0800
X-Gm-Features: AclHuK-cU-BwWpWyYgAak_kB-Mx6gRxkfBQhQnfBmZqza-WmMuBHvINcokofiDk
Message-ID: <CAMgjq7Bie8raWzLB9H+u0eX=FrUKw638mXcRQD-Qahe5qCiMtw@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Nhat Pham <nphamcs@gmail.com>
Cc: Rik van Riel <riel@surriel.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Gregory Price <gourry@gourry.net>, Wenchao Hao <haowenchao22@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 12:01=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Sat, Oct 24, 2026 at 9:22=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wr=
ote:
> >
> > Rik van Riel <riel@surriel.com> =E4=BA=8E 2026=E5=B9=B410=E6=9C=8825=E6=
=97=A5=E5=91=A8=E6=97=A5 02:16=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Sat, 2026-10-24 at 23:50 +0800, Kairui Song wrote:
> > > > On Sat, Oct 24, 2026 at 4:03=E2=80=AFAM Rik van Riel <riel@surriel.=
com>
> > > > wrote:
> > > > >
> > > > > On Fri, 2026-10-23 at 10:24 -0700, Nhat Pham wrote:
> > > > > >
> > > > > > * Swapoff: this was brought up as a request, but we ran out of
> > > > > > time
> > > > > > before we could discuss the motivations and use cases behind
> > > > > > them.
> > > > > > Folks interested, could you explain as a follow-up?
> > > > >
> > > > > This is one that I really don't understand.
> > > > >
> > > > > In my mind, we have vswap sitting as kind
> > > > > of a swap VFS between the rest of the system
> > > > > and the swap devices:
> > > > >
> > > > > +-------+     +------------+
> > > > > > vswap |-----| swap cache |
> > > > > +---+---+     +------------+
> > > > >     |
> > > > >     +----------+-----------+
> > > > >     |          |           |
> > > > > +---+---+  +---+---+   +---+---+
> > > > > > swap  |  | zswap |   | zram  |
> > > > > > file  |  |       |   |       |
> > > > > +-------+  +-------+   +-------+
> > > > >
> > > > > When a page is unmapped from userspace by the
> > > > > reclaim code, it goes into the swap cache.
> > > > >
> > > > > The vswap layer then decides where to store it
> > > > > at eviction time. This is configurable by userspace.
> > > > >
> > > > > If the zswap pool is shrunk, the vswap layer knows
> > > > > where to put the data next. There is no need to
> > > > > change page table entries to indicate that the
> > > > > data was moved from zswap to a swap file.
> > > > >
> > > > > If we decide to disable one of the backing swap
> > > > > devices, the vswap layer can just move the data
> > > > > into the swap cache, and the page reclaim code
> > > > > can evict it into a different backing store, if
> > > > > needed.
> > > >
> > > > And in this case we want to disable vswap itself.
> > >
> > > OK, so you are looking for a way to totally depopulate
> > > the swap cache, in addition to swap files, zswap, etc?
> > >
> > > I think we can accomplish that by simply keeping the
> > > current swapoff code around, which scans through the
> > > virtual memory of all processes and brings the memory
> > > out of swap.
> >
> > Yeah, that's the right starting point. The scan itself can also be
> > optimized to be cheaper or better later on, but that's orthogonal.
> >
> > > > I also hope there is a way to release swap metadata completely too.
> > > > e.g. for fs, you at least have umount, and can rmmod the fs itself
> > > > afterwards. We also have many ways to bypass the page cache. In cas=
es
> > > > where a virtual layer is just a burden, we want raw physical swap,
> > > > and
> > > > the ability to swap off that too.
> > >
> > > The VM cannot operate without the swap cache, though.
> > >
> > > That is very much built into core parts of the VM.
> >
> > I never meant to strip swap cache out of VM... The opposite, actually
> > :), most of my work over the last couple of years has been about
> > removing the paths that bypass the swap cache (e.g. the
> > SWP_SYNCHRONOUS_IO fast path), to get a simpler model and better
> > performance.
> >
> > What I'd like is for swapoff of the last swap device to return the
> > system to its pre-swapon state: no leftover swap metadata, no leftover
> > per-slot or per-cgroup data or statistic, and ideally no residual cost
> > in the fast paths (e.g. minor fault).
>
> So basically remapping? I don't think that's terribly hard to do. I
> mean the swapoff code is still there, so it's just the question of
> exposing an off knob, basically?
>
> But wouldn't MADV_WILLNEED be the better tool here? Or is it not reliable=
?

I think I've mentioned it above? You will have to iterate through
every process in every container every namespace, from userspace, and
do some remote memory access / control on all of them, which is really
not a good solution.. It's not reliable and is really hard to maintain
or deploy..
