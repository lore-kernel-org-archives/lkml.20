Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793173124;
	b=Aah/tM4D1gkRMXcQClR72oH25B27jgYN19yUa92MIuRTDj7ppuyGMSRBfDG2IPdlmTX3
	 +gkZlSd5nxdfuf+bnIvvp489UBX37WiKLiE2/vDo2lXZTxMhIWDngP7qMchQFJr09F8Lo
	 KXGJ9AFWvKPAcdep+Zn3gN5pPMQ15kW+Z0vOQOjw6XyWIOdFg2L4GF3aQN71b0sy1FLf1
	 DPwZ0HXOIN0Bwz/vI0tCZ7wEEfQhyx7AXSsuX99A6JYst6seCDlbD/DDn4lVEw4OajtGr
	 ON8QQkGdR2zNnvsiipChhsyleKETRJfuTibd1aVnZauzbWVV0eHJTJjLSA3dI9Fbe4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Z7MG1enuoki8MLFbTcKPNbIF1r1YUl7PKsWNYhZD0wk=;
	b=wGe9abr4GlnpuDoPTSSwuRBQZBTymCvMMIX/TKZ2GBKlcoS/Zquz6b3mIcPeJ2Wvm4+W
	 MDkcKD8n60UfU+ZSHbMinO1PQq4Y1+I4hLP54NNhI8fBSUuY60MlyJC9lCfWa76A4ktja
	 GLL8LZNhJ132QGBqmQlQUPgyLbtgvg6qNKb8ItplY3oIRlOu/OjpC/rEggogLISAgMPSW
	 OdLzraXZMmVt5SVHOiemAw/RCcJelxbPS7yOZi55GOYyvmOzVpx6C47hNvdL7B8VksKOK
	 6+BX53LzHggeA2L49J/K3mZm9ayZJ4fqh4Jdsi3D6j8vY4835xGGokAPDmXjl1uHLNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zklaNDR5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E5A606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89E5A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zklaNDR5
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c43373ae89aso81401466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:38:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793173123; cv=none;
        d=google.com; s=arc-20260327;
        b=SRvPnnYCUJJO4XdfojA71yk7JLW5PuwyXsuQjhpDfhcwzBqy3U5PABlR70lcxWA5Z/
         w6wG60pkWLEbGiFQ5dBRS/TA/9fV4YaWzyVAFiDlmbeskd6/89334/7nZ7Da80ss1V7L
         JLfHmd/bGeEFcXZTtGoPo3Ry/TFUzG6mJLwnvrxa7C/sSWIlgoKZDCSXproZ6ooo9VoB
         kQtKkGWED7+RAmmLq88t3eLM5qIlMyB8zZSEcxJ3S21U6JqdA3jJdww4CaYyquJjcbYx
         sKCcKOoneyF/PQWPiU/Czc9HgBVkfvWJp6r0c7z+Y+ksmXtSyAVzQfbIF1hjMWt5mA6c
         tS9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z7MG1enuoki8MLFbTcKPNbIF1r1YUl7PKsWNYhZD0wk=;
        fh=upR2VSk5bskvJRXUbm1KY9W1uKb0f49P2kfdWlE4tD4=;
        b=DVljOMuN5KsNlI5stRVEryuvTHuCcwnKqcsPiaMq0gr6iYxdDg56DFEqgyoUSj+ehi
         QaIPpYaOBJw1P6FoP3pKCyuCtypDCNd0txg0UQKQSVYqvhTB2tv0PVEdQEFygXC/k289
         Sw3kLSA/qeNf3+KkYaY9gQFKT+PkZdVHtraeeFpICUGTlDqxuJnzLpjjV2M8SRSxko2Q
         JqbC2pg1+XklCHqqBb8dJVLMZeUbzlWBUnhrbGB1kZyI0lG6c5b6HpI/VH5iJnJrhl6w
         QoQO/M3UWf6nJoZW7RB8bEk5VOdz7ZkOCtpwzRhBmPY0rx88zkNBqtYdcxzCoARG+xto
         mReQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793173123; x=1793777923; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z7MG1enuoki8MLFbTcKPNbIF1r1YUl7PKsWNYhZD0wk=;
        b=zklaNDR5CX5KpN3HuGoYhIyGZYuSEuP05buHr5SZEdsCFMrjreIo9qb3BmjVgwO8CZ
         gD9l+cpnqzVJrP1ItqA1uQKdDP6DA+IO5K1u6bZHclNbZGPKdbCI3UJSXFaxe96fJTBr
         55pEopCUZHL4egHDIXBn16EMalOL78//B96Ut3lxfUgAUtQaCjNyFdJtRUp9eNbtzfDF
         9LOv25/WL4hEqcUaZwQGNEdLSjt0AhgUO5v3lbFjej7Xb7GY9DrYkNToLes0HDW+Wu5d
         iy7EyUuqS5JgOaZ5YUfbUr4no4xKW6q/BVbiVWc2cKSzAk47ZS9KKtf91Hiap3/x2WVH
         8oMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173123; x=1793777923;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7MG1enuoki8MLFbTcKPNbIF1r1YUl7PKsWNYhZD0wk=;
        b=fzmcmjqhbNWV1ZhFUETUUKWaIMqKqyTd/EPWezuaTheiJhZelOGffYbaIINSoxx7pB
         lpeUrOGn0uZeDZCzFXIjSoMC2ngENjXK9pJNkh5YdymmXCELHuY51rlmrqJG5BRkfBxY
         6qZ/mIBoYO3gIYiwPy7okSMQ9BhLB4/I0JAV3zJRxIBzMnsTsArVvdyZ+JCiw4gOTWHz
         TyPCRYxSHT27piKAUe8u4WrqukaKKJ+vEGvEsO73ePcUaborw0rxf1Zgow4b+yuMlJV2
         cdmQFpowEMzBonyI23SV+/VxZtGGW2pYXHBjxkV2Mm84rI38ws62sNXEZLP6cJ2vRpM0
         HS9A==
X-Forwarded-Encrypted: i=1; AKwUvBwEWeKVs8nJeXt0MdoV9LzFpDPnnp/dcn9K2LbpAp6RMA14KssmY8Nd9H4B39l/c0gVL6Hxls79W7DMaFE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFw/P1mob56/b6+3uCNZkW1wF7c3hRsJ8nLWBnfpj/azNe9RWH
	qDtnuCI//w7wDzOiNbKuZ48XmUnnUs33JZEDbRcGSVO9la81jUyDt3ADsDa4R+4y/F3RykwupkF
	hnTwsMfRekXWWY5SZ1toKha8c0O/NYiM=
X-Gm-Gg: AYBFou1Ncu9K77CospIimwwx2lpnpQJwU9PI2DiFBG55Nij7f3TbyQiVD9S0P/pcu8F
	Feu1mWhpjrvTadvb5w4kY0OdnXwvtKpePOemOEkKAqLz0L69uPWQhmiTRtzWGwdPcmY1qAUZQGB
	7D6Dr8UzMuLYBwIYV95aeax3RwjFBLspXlzSmx2BiS6MHH8cwwfx8/b9mDNNrlnIrk/k4zEksg2
	SVFGJLa6YcZi6yzon0uckSCkc2uDyFuQ+xnWp9MyreBN9BuX1QepZR1BzCzVuI+E9ZnSrcEBQ1s
	atJo7zjikLtKweQbfa14umJVxtMq2EJTNBLqvUfcO4cIRlrqqbWSVU86Ia064zZTQ6sXCnQZ92C
	ytkEY7GfOh7J16TW8Cch5sRTl7SodnR1NT41DrR2kUBHijOvU+cuW0Q9QHkdtzyB1uFdX/cQSg5
	882r2ftnGqFz7T8Rg=
X-Received: by 2002:a17:907:d90:b0:c40:aa04:18d0 with SMTP id
 a640c23a62f3a-c49bdf0b830mr127577966b.17.1793173122715; Wed, 28 Oct 2026
 00:38:42 -0700 (PDT)
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
 <CAMgjq7Cjt==BxXPNw5HjiA0hjxhfzWn=9gDQ+2x-rdrEQBWTeg@mail.gmail.com> <340025b7e3bdc6d905da2cd052ccbbda63a58ac0.camel@surriel.com>
In-Reply-To: <340025b7e3bdc6d905da2cd052ccbbda63a58ac0.camel@surriel.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Wed, 28 Oct 2026 15:38:06 +0800
X-Gm-Features: AclHuK-mX8ixSikBppmP8XVxk2jjNDTFYKjV7_1Dyl2RLvPqe5fDdGLjEWtahao
Message-ID: <CAMgjq7BQ-K-ZDmP_ZW-2+t+OQWWKEZP4ynoNk5C7NaWq+PP3Eg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Rik van Riel <riel@surriel.com>
Cc: Nhat Pham <nphamcs@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
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

On Mon, Oct 26, 2026 at 11:59=E2=80=AFPM Rik van Riel <riel@surriel.com> wr=
ote:
>
> On Sun, 2026-10-25 at 12:21 +0800, Kairui Song wrote:
> > Rik van Riel <riel@surriel.com> =E4=BA=8E 2026=E5=B9=B410=E6=9C=8825=E6=
=97=A5=E5=91=A8=E6=97=A5 02:16=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Sat, 2026-10-24 at 23:50 +0800, Kairui Song wrote:
> > > > On Sat, Oct 24, 2026 at 4:03=E2=80=AFAM Rik van Riel <riel@surriel.=
com>
> > > > wrote:
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
> >
> > > However, having swapoff remove all data from the swap
> > > cache, after mapping the memory back into userspace
> > > page tables, seems like it would be fairly easy to do.
> > >
> > > Does that meet the needs of your use case?
> >
> > Right, it's nothing hard, as long as we don't add mandatory new
> > layers. For very high bandwidth swap devices, a mandatory indirection
> > layer is pure overhead.
>
> Don't we need a swap cache lookup regardless, to
> make sure the data we want to swap into the
> process is not already present in memory?
>
> At that point, it shouldn't matter whether we
> get the backing swap location from the swap
> cache lookup data structure, or from the
> page tables?
>
> We have the page table lookup, and the swap
> cache lookup. That is two lookups, regardless
> of whether there is indirection, or not.
>
> Am I missing something?

It involves more than just the swap cache. It includes book keeping in
cgroup accounting, statistics, allocation, device info reading, etc..
And swap cache is blazing fast nowadays so that isn't the problem
here.

We used to need to bypass the swap cache for similar reason, but we no
longer do that since the swap cache is flatten now:
https://lore.kernel.org/linux-mm/20251125-swap-table-p2-v3-7-33f54f707a5c@t=
encent.com/

Other parts I mentioned do not have zero overhead so keeping the layer
thin seems like the best approach.
