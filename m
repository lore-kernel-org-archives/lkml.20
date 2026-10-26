Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793030491;
	b=p5v/O8DWuUobzFO6A2L5pjxHbou6b3Obztf3Ge/6tnm7RX15fFoJfvCiX0Pv2a9pCZfV
	 GlItwuRY4v80kZYaTsjELCqW5lWYRe5E2h6Cw34cGYyWYQHOmhb4XeW322gt/nZMmiMhS
	 AENw36Vdh/on08xPRWYfFm0LofEhfHm7jAJi1W2oV13yFjASlkqu6PRADW3OUMPX5LIdF
	 LhazKljSkLsq4sg/MgV7wRTMoHLmJDy2Fbi2uTxJBQaxE0RYUdtF3JyZV87XVwql7ILYq
	 4mwdcfFUV1tyhusjjFdM8ojQsjgfPJgTAkKGDxVN8MEARAx4oT5AjxRyWMt7HA7tOFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Lbo8/RDQClorc6ph+pAnOkCeZrLNCxChHhQRvs8O+J4=;
	b=VV6ePiONJRWv/VhD2Cl8IL+98/ICzOwOj4E2jBle9Br9sEKrC+xTVKnOLuR1G89WYaHn
	 5kytYWcTF/cgmrbSrkjDzY/in0/sV/GwYhVpjw/LxUV9kn49bMKXXST7dp1vg9fr/oTM5
	 ZmZEw9bGkr2e+1qRK4CZSdETYbcUMCrV4mUnQPQgfWNC+YsL3SPQdLSbLuhHjWV9ACYgV
	 KlRuzgWcQYj3Hrln+9i26QkorZG/V/xNHxONP3hJHTj+K1VmyMjCeU97hpZ4zkcMTXNOG
	 XqnFLckbEZ+DdVYtVflT2P4kCBdX67qv5KYB0QrGZZNboWdUyWolzu2W6toL6vjseoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sBW+RW6w;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF34606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CF34606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sBW+RW6w
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48dfb76b304so314335f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:01:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793030487; cv=none;
        d=google.com; s=arc-20260327;
        b=H7JWhd5G39cOk83fJLotDNawnw02zlCGoXN7Z7Xyrsp/1BbGhHlmvL7Ot7bNVn+cwH
         Nuwiw6DglbLTKdDB26/iW1kwQ1dSkKUPYea4e/Wulalcobfl2o+hiw7ynH58ZceoeZvf
         8oXbVGa3wx83dhMUyGO6uEIcb3tTkYn9VOPP9RxUo451asRUNg/chc8uW38cu3LgEUrx
         0NLrBzdL1Q7rKgAKbRUjernyDPys5DaeegN+TELa8H6zCOzJpF7Hc3jG9mJan8lQ5a+Y
         uPUiazW6Pm0s/KGJ43+pr+YYoVTmbwEKRSjPNPgzif6y2BpQvTSYq4LVL4ukQmKe5GLr
         FxMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lbo8/RDQClorc6ph+pAnOkCeZrLNCxChHhQRvs8O+J4=;
        fh=3FH7TnMTSWJA/U3mMHh4pmxJufVfF9vGqXy0RwqQ098=;
        b=QbNPrMdWWwTJGfnIzYnGADG5lA2Zc68FxcgxAvH/bgpcUe078n1y0mnBzM0GxpL911
         TDux/vUJKNm6WlTG3kDrJAQHQ6Xyfy3/SIQitB0+NqsAOlsy59nQXqYzDzeVJLN6AuvQ
         p9hJzJaegqtts7DL5iYGR3IM8yEtm7xhzXZVD8QKaOeeP+MJdiLLmaWnD9lq2WYV3EEg
         IxsTggIpmJVS8Fr/M9ScF7gQHIE/UqxfGrhz/YpMa2s/TZ9VF5Bv49uADuAWMbNFxO27
         o3woTR43orCsm9vaEixWYR5mG+t18E/i6UFVdC9ZT7CZEE3LhSWi0fyt+mE58MDsiitH
         x3Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030487; x=1793635287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lbo8/RDQClorc6ph+pAnOkCeZrLNCxChHhQRvs8O+J4=;
        b=sBW+RW6wfvUZojTUFIwLIpaZlYfVjybdkbRK1O3SvHwjok05oY0SMo0n643YaACDD+
         MgCk3iZlJJCf1PG0Aj3gCmtPPqDVKtZbCVt4Rl5Keuq9v7w1BmkNfNcP2e/OEQDGZRUf
         Leo2u+Bxa48+QLGV6w52qnj+SUwfsIzdR91dF2u5IzYKwQEmKWmXwDjhw6uwh3XoxEGx
         G3P3ZD+QthPl3tWSrjwU2SZm69Geb3jy/+E3+iXLhHDoacDYJvYGQVhBSegb5RYZEOfO
         w/8CBPc93VX9/MsdOIcSecluqkWUAia85B92rZqX+vUKYAkf+HCTTnzgjSOHzk9lLNy6
         YvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030487; x=1793635287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lbo8/RDQClorc6ph+pAnOkCeZrLNCxChHhQRvs8O+J4=;
        b=1xxzF/WcWUcO0YD4E08+2LSuGfgzSxkuDChQUQyn1wSggqpHfqHbklFMi7SPYn8tKV
         lM2v1O3o8/AJlOraycpjwI3n1yl8E+54Z9znoROruPzxuCCTFkMpKKl7oj55KwiUnHu/
         ZUuLYhxy0jwrYZmUoCLB+5Hu+HPLTjuT4NX7v+GtFBvymgeGobNNe8EBwEjqz7HBYLjo
         Z2FT2DF12pjGRuOyazR943W0vii9CYa13DXgGie05sVIDz5f1pBQr9ETtSVhT8dNtVyg
         NZa5h8SRl3nxpudCueomHvVYck6IIMH1bVV+s94rlFFPFTPEhY0eUCNACBiGEGwi+A9e
         Gmmg==
X-Forwarded-Encrypted: i=1; AKwUvBxt551Ne72m711elwklqsW68OJZqDAokuGZTlc9JbZA8PSjMuKSqOGGi56e+pmnFLRwtKRuedkyuNTRzIo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6rc8smoHnRH3/gZ8dCimTPx3zTYxXICW+2cqlMO+61W+0eAWz
	f12An1dLjZMxuQwJcskGtgvCAvPjDDA90M4eRlFwHGWiOKGWgAROfNKwjv94haSe6RSl+4tIp++
	lHpE/IJc90Wokkhl4mBoyZ6nH3PVwR+Y=
X-Gm-Gg: AYBFou0wTQXpdtejkOL7eGNP2/qXIeYVgRZTj8vF0GczxYe52qWOn06UrafwzYX2dt/
	f6XbsaDC9rtfxRaBnIaemnbqWQVdjQ/dEZTg68WghKLW+ZDcGHGSamDKsRRC0mSHOamYDsw/SLo
	iYWsfcFHDPWLqvs7hQNk9Eq4yafxvqBVKMULxPClB9e5OSyHuXwbaxJezPyCzj0rskG4azw7MW6
	qSnsYy7BRx3d83l67KkBKKUxkwdOdKSveToQ0cqYwD8fvzBC04LnUmkmTS8ODTkZLCZx9cQ8b3S
	nABR0QdAFuKazQJ6Gessa1rw3SvEzeluZQJ3TJ3DjbkuYNGGNJ77TWDug+Gs1nP4oXyHcFnKP8T
	udWPYJtpC3cFA8fvk934O36z6MnV8OcpZkOQ/RZkfjG+m/DIg+KvU6251GBdPkCyOXEupJoBGGO
	+mR3rDs8Y8hNavrIoGKljSbGaVhTnomcf9ctXoVaQfJIIVUbMDTm36
X-Received: by 2002:a05:6000:2489:b0:48e:25e1:5eb8 with SMTP id
 ffacd0b85a97d-48e3eb2cea4mr13577585f8f.3.1793030486487; Mon, 26 Oct 2026
 09:01:26 -0700 (PDT)
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
 <12081d266e4846f23faacfc65c7be7da4ed013a9.camel@surriel.com> <CAMgjq7Cjt==BxXPNw5HjiA0hjxhfzWn=9gDQ+2x-rdrEQBWTeg@mail.gmail.com>
In-Reply-To: <CAMgjq7Cjt==BxXPNw5HjiA0hjxhfzWn=9gDQ+2x-rdrEQBWTeg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 26 Oct 2026 09:01:14 -0700
X-Gm-Features: AclHuK_CEYsPKY6hq0opM-Cj8xQh0uLfbNs1stTtcOkUahfkClQYL2L3gwCISqY
Message-ID: <CAKEwX=P_3W+MAFe80MZ5FT0mytv-UDzfmbyBiNsYR5XjC5emSQ@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Kairui Song <ryncsn@gmail.com>
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

On Sat, Oct 24, 2026 at 9:22=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> Rik van Riel <riel@surriel.com> =E4=BA=8E 2026=E5=B9=B410=E6=9C=8825=E6=
=97=A5=E5=91=A8=E6=97=A5 02:16=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Sat, 2026-10-24 at 23:50 +0800, Kairui Song wrote:
> > > On Sat, Oct 24, 2026 at 4:03=E2=80=AFAM Rik van Riel <riel@surriel.co=
m>
> > > wrote:
> > > >
> > > > On Fri, 2026-10-23 at 10:24 -0700, Nhat Pham wrote:
> > > > >
> > > > > * Swapoff: this was brought up as a request, but we ran out of
> > > > > time
> > > > > before we could discuss the motivations and use cases behind
> > > > > them.
> > > > > Folks interested, could you explain as a follow-up?
> > > >
> > > > This is one that I really don't understand.
> > > >
> > > > In my mind, we have vswap sitting as kind
> > > > of a swap VFS between the rest of the system
> > > > and the swap devices:
> > > >
> > > > +-------+     +------------+
> > > > > vswap |-----| swap cache |
> > > > +---+---+     +------------+
> > > >     |
> > > >     +----------+-----------+
> > > >     |          |           |
> > > > +---+---+  +---+---+   +---+---+
> > > > > swap  |  | zswap |   | zram  |
> > > > > file  |  |       |   |       |
> > > > +-------+  +-------+   +-------+
> > > >
> > > > When a page is unmapped from userspace by the
> > > > reclaim code, it goes into the swap cache.
> > > >
> > > > The vswap layer then decides where to store it
> > > > at eviction time. This is configurable by userspace.
> > > >
> > > > If the zswap pool is shrunk, the vswap layer knows
> > > > where to put the data next. There is no need to
> > > > change page table entries to indicate that the
> > > > data was moved from zswap to a swap file.
> > > >
> > > > If we decide to disable one of the backing swap
> > > > devices, the vswap layer can just move the data
> > > > into the swap cache, and the page reclaim code
> > > > can evict it into a different backing store, if
> > > > needed.
> > >
> > > And in this case we want to disable vswap itself.
> >
> > OK, so you are looking for a way to totally depopulate
> > the swap cache, in addition to swap files, zswap, etc?
> >
> > I think we can accomplish that by simply keeping the
> > current swapoff code around, which scans through the
> > virtual memory of all processes and brings the memory
> > out of swap.
>
> Yeah, that's the right starting point. The scan itself can also be
> optimized to be cheaper or better later on, but that's orthogonal.
>
> > > I also hope there is a way to release swap metadata completely too.
> > > e.g. for fs, you at least have umount, and can rmmod the fs itself
> > > afterwards. We also have many ways to bypass the page cache. In cases
> > > where a virtual layer is just a burden, we want raw physical swap,
> > > and
> > > the ability to swap off that too.
> >
> > The VM cannot operate without the swap cache, though.
> >
> > That is very much built into core parts of the VM.
>
> I never meant to strip swap cache out of VM... The opposite, actually
> :), most of my work over the last couple of years has been about
> removing the paths that bypass the swap cache (e.g. the
> SWP_SYNCHRONOUS_IO fast path), to get a simpler model and better
> performance.
>
> What I'd like is for swapoff of the last swap device to return the
> system to its pre-swapon state: no leftover swap metadata, no leftover
> per-slot or per-cgroup data or statistic, and ideally no residual cost
> in the fast paths (e.g. minor fault).

So basically remapping? I don't think that's terribly hard to do. I
mean the swapoff code is still there, so it's just the question of
exposing an off knob, basically?

But wouldn't MADV_WILLNEED be the better tool here? Or is it not reliable?

>
> > However, having swapoff remove all data from the swap
> > cache, after mapping the memory back into userspace
> > page tables, seems like it would be fairly easy to do.
> >
> > Does that meet the needs of your use case?
>
> Right, it's nothing hard, as long as we don't add mandatory new
> layers. For very high bandwidth swap devices, a mandatory indirection
> layer is pure overhead. I posted a per-CPU queue based allocator for
> that case (https://lore.kernel.org/linux-mm/20260829-swap-pcp-priq-v2-res=
end-0-68d3d925578c@gmail.com/).

I skipped non-zswap cgroups for now, so there is no overhead :)

We can revisit this once a new feature is implemented (and we can
figure out what interface is best for this, or can the kernel figure
this out on its own).
