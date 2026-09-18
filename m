Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A34B2D9ECB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789690422; cv=pass; b=m7dNUWJ52fifu91neuvUAhDH5lyys3+uNO8mqQgWxOXVeGQJrSfHhbuGr/B+iqI5MvGmxUUBYTlWJMzaGJ/P3qLphBrvXIPx+Q7e22Q6l+6W1IlL7VT/Kix+qQbLXqudVGr/c8hM5gaRF/sWJ5eaMt1u8G2hULBHhPjaaa22w9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789690422; c=relaxed/simple;
	bh=wD/73xbF7oBEIXY+DQCPLaJAsG3xM+Bwk0vBw2bsCWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d148/0xID2nLNptLvCfO4uFTDl8oDiJuFHQex+9X3lCJ5gpqDejLPjfwvxVdY33aXs3gzj/qBGsgOeaj2srvOUkUhYz4DOZdFu/c4A27FJHpnEJKJlSqmM/8quEI3LRgHeu1i/BYsDSaxjbTXvs48+M8dspvQXUAyBxiOGX7WvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JiZiM5Ej; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiZiM5Ej"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so966405e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:13:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789690405; cv=none;
        d=google.com; s=arc-20260327;
        b=akBYYRe3zYE7kVCh05jSzNmC/aT/0iD5kiUrQ/z0GAV0HXQkDoTfO0Nn+fndsTy+mG
         E0/or9WQ25tzmgmo3s/oT2IkahUSPiiCdWv9QtfwhOoEUTHr56ggbMhJv9rRGZIeURHz
         oCPMTqq+GufvD0Y/2aS+y+flmDy8c2PnZXdrmT5b5cgMP89T80MaCRIYJJC4rgXfnktm
         JFauSK3OojDcM4EtAXPrle63rvU0Z2Q9Muiv6iTkxjYQ0bcAflf8sHS4aN4cFvhhLcik
         qZSSRfVdXBvXWFYkiX3hK52XFzmm3jpiEwDLwKIfL6m7YwHh3qwA09ZOVB+kvtcPg5cn
         sifQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aZxC2zmZBXNKohtVlSKjG/OT2cN2Az5DZgDZVOC3Qko=;
        fh=XQj+eUXDcuNKZzt9dYzSmytn14IFkD24aNe7YLQANus=;
        b=Fynpk+e1Cf4vHFascQiDb35NiOaRz+ZwyVQ38NjYVM6NfyLL2RDl+Sp95rfp6WVEex
         u3DJherreEoIrfTJjxiD9oZEEJ6jWCZzyy5d0CQdt6QyDPa5Ngn9kXfJZOs3I/PU4JOw
         ED9U04N1Ld/5AhPKcAGmENbOMsgxozeTSQ20vaxwvjHtIyyYisjBfLDAxnWDPfaGnuoW
         1dJafSMIL16bhUDi1RVCpX5dp+mh2iypuLUuHEgICRIDmLNI0417HDp86oT/wt5vwS6+
         xh6tKwxeUmKN+dj6tHMmUbcay4G8fywdZZNvYOKqlKThef05HgLX67v12BIkK678UNAM
         uE1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789690405; x=1790295205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZxC2zmZBXNKohtVlSKjG/OT2cN2Az5DZgDZVOC3Qko=;
        b=JiZiM5Ej1DMpVasCbCOHCWrPdXmANRKAYIlLiWrDPuZHNSQe0qSkVXK+VIGGBdTkqE
         WLh0dFH/B4aL8WkVFd1zo5wiCeAqi1fE8UBQZL7dRFHgeeucfhhtlIJyxc6XJyF+WjiQ
         IndmbQkfyvH9Jgo2UaVS/Uk+1kl587byM/Is25Ze9iFTrowfm1o+3M1zQu8EovBVtorN
         PUjU7cvH5sHBWu9lAbssLiwKFCZcKxukQD/4+GLXIva8ueWIo7Z52qL8/U/gXD9AuMJt
         hFSkfdA5PDv4voichDPTeYCqb1QknyYI0liYzOR81mc3qFdYnfb3q3KkercD3XrbqrUk
         HVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789690405; x=1790295205;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZxC2zmZBXNKohtVlSKjG/OT2cN2Az5DZgDZVOC3Qko=;
        b=VbOTYcwZjrbig8TLIw2tdhGsUVU2OLg9DE7PAEr0D48TCJMdLnEXU1kYvkTCKHFqZu
         +0IvsKIroC67IF+NFh3i0FQYriYnCeEToMMG9oQODYczTh9vNkCCeL2NFpvMaafidDDT
         7WBFHydGCN9LhVBsdJ1NRsYKLD69iy/yh9KTGHEtsNHvxcZC0PjjwzGUy68RLPSul+xG
         e3nfMcQ2fZdmZGBmnaWpQY4rBsjRCph3if5CTfOetcdFetu2rhbaHFlsjjtMN0sawK/H
         mkXXClACETuYmBD9g1j/+4KwFgLdPKmsM30bZQbAEHYZ3fd+qMqpzuPBL9yaOXwrLNFj
         Tn6g==
X-Forwarded-Encrypted: i=1; AKwUvByJsk9Q6pdK8akalOTmxMkpOI4Cc4hH1T3IC3si2Tlr2kWsLPqHub1Sidfj9sq6ecRnnqSSFdGuybZJ5HU=@vger.kernel.org
X-Gm-Message-State: AFuF++kd77XpUEh7iiWevqefeYk6sLwucPqst93QjcBHgnFwRYa/H5KZ
	qcg7QbN3gEvUjtK9VBU5Yr9TlX5qpxZvvTQ+IwTspwasViyRjovMkXBkSxoav96tcIeMK9p3mTg
	uzdghtyugHC1Y7jzuEtuY3o39WGYVxBI=
X-Gm-Gg: AYBFou3WfSKSlKxRpguMI/y0gJsuHS3cDmZgHmJGA+IKoQPN91MuUf0zj5v1knzyq4S
	XgroB9P3771ONpya+6QaLYNMywjfEG8uTRZikofSNtbgQSeRWdIc+8ppz7Wc+F75bWa2IRXeq2h
	OQHmgsYu3yWM59hK/upB+jF3liZrvHPykALYmU1tu6CwhYYEPWkT2g19+h/XeFdY3y1eQgQytDB
	GeWxMtxl0z69qvPfaig1OInKmrpX0U6b8HflgDSqLVzAxJfV/h9Xrq/AXqZImni1R6hWYfVPWAL
	VblvCSQsHWvJcqSMRU2vAEO3i6VqfMa6xBfODhpIppBB2zcsDz2v5bZm8BmN5/N2HKEP2WJtG23
	EwWP2IX2Jfx4=
X-Received: by 2002:a05:600c:138f:b0:49f:bbab:aa10 with SMTP id
 5b1f17b1804b1-49fc5741672mr5579525e9.20.1789690405281; Thu, 17 Sep 2026
 17:13:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916101929.149106-1-hebaoquan@kylinos.cn>
In-Reply-To: <20260916101929.149106-1-hebaoquan@kylinos.cn>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 17 Sep 2026 17:13:14 -0700
X-Gm-Features: AcwNN1WpNUvbpMcj0o-RkcSZEW3mXC3Qne85caJPWZ5BGl0U5kjLLvyPTNmZXNI
Message-ID: <CAKEwX=PEEkYiNRaVhCuM4E6mxB9huPKfkDa4m62VMTzedg1oYw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] mm, swap: extendable swap devices (xswap)
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, chrisl@kernel.org, 
	kasong@tencent.com, baohua@kernel.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, yosry@kernel.org, shikemeng@huaweicloud.com, 
	chengming.zhou@linux.dev, baoquan.he@linux.dev, david@kernel.org, 
	linux-kernel@vger.kernel.org, kunwu.chan@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:19=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> w=
rote:
>
> xswap is a swap device with no backing storage. Swapped-out pages live
> in zswap. Its cluster_info[] array lives in a VM_SPARSE vmalloc area,
> and the area is grown and shrunk on demand as swap usage changes.
>
> The problem being solved is the static size of compressed swap. Both
> zram and zswap need the size fixed in advance, and neither gives memory
> back when the workload shrinks. The solution should be a device whose
> size can scale up/down as per usage. xswap does that by mapping the
> metadata lazily instead of reserving it for the whole range.
>
> Design
> ------
> - si->cluster_info[] stays a plain array. Access is still
>   &si->cluster_info[offset / SWAPFILE_CLUSTER]: no per-access branch, no
>   RCU discipline, no tear-down state machine, no NULL return.
> - Only an initial chunk is mapped at creation. The rest of the address
>   space is reserved, not allocated, so an idle device costs nothing.
> - Growth is driven by allocation. When no free cluster is left and the
>   address space has room, the next chunk is mapped and added to the free
>   list. No userspace involvement.
> - Shrink is driven by frees. The free tail is scanned, and whole chunks
>   are unmapped once the mapped range is at most half in use and several
>   chunks can go. One chunk is left mapped as slack, so the next
>   allocation does not map it straight back. A ceiling lowered below the
>   mapped range skips the half-in-use rule and is enforced at once.
>
> Size
> ----
> A device starts at 1xRAM, rounded down to the cluster. That costs
> nothing, because the mapping is lazy. The underlying address space is
> 2xRAM. An optional per-device cap,
> /sys/kernel/mm/xswap/type<N>/limit, lets an admin lower the ceiling;
> the excess is unmapped right away. Grow and shrink both work without
> it. Creating a device requires zswap.
>
> Interface
> ---------
>   /sys/kernel/mm/xswap/create           write an optional priority
>   /sys/kernel/mm/xswap/destroy          write a swap type
>   /sys/kernel/mm/xswap/type<N>/limit    read/write, in pages
> The device shows up in /proc/swaps as xswap<N>.
>
> Note
> ----
> Writeback, rmap lookup, etc. are consumers of this base. I have a
> writeback prototype on top of this base and will post it as a reference.

Thanks for posting v3.

I spent a while building the other half of what I want out of this on
top of your series, to see how much work is needed if we are to expand
from xswap to cover the vswap use case.

It is actually way more work than I anticipated. And a lot of it is
because of the way you indiscriminately apply the full swap device
model to xswap, without careful consideration of actual use cases.

Johannes has already discussed one piece of that, the sizing knob [1],
so here I would like to expand on other design and interface choices.

First, in terms of priority, an xswap device has to be preferred over
disk swap. This is already zswap's model, as it is the *only* coherent
swap tiering scheme. Exposing priority selection to userspace just
invites misconfiguration - what if a user accidentally sets physical
swap to be preferred over zswap?

Next, regarding the ability to create multiple xswap devices:

With at most one virtual device, there is no selection problem to solve
at all: vswap's entire device-selection policy is reduced to two
branches: if vswap is possible, go for it; otherwise try physical swap
device. No need to think about policy to select which virtual device to
allocate. No need to track virtual vs physical devices to select the
right class for allocation, as you can just put the virtual device in a
pointer, and off the avail list (which is only used for physical
devices). These suddenly matter when you add multiple xswap devices.
And for what purpose? This has never been properly justified to me.

On the flip side, there are cases where your treatment of the xswap
device as "just an ordinary swap device" actually breaks *existing*
deployment, and makes several code paths more complicated.

For instance, at allocation time, cgroups that disable zswap might get
an xswap slot. At swap_writeout() time, it is *stuck* - we already do
the unmapping step, so we cannot reclaim the page. Ironically a
physical swapfile backend could have bailed you out here, but you have
not implemented it yet :)

The other way you can get around it is checking if the folio being
reclaimed belongs to a cgroup that allows for disk swap or zswap, and
bypass xswap/vswap if so. But that brings me to my next point: since
you just treat xswap/vswap as a normal swap device and share all the
allocation structures and logic, making such a selection becomes way
more complicated code-wise, and less efficient at runtime too (since
the per-cpu cache of clusters for allocation is shared for all swap
devices in your code).

As of this version, it not only does not work for the writeback use
case. It cannot even work in deployments where some workloads (cgroup)
select zswap, whereas others select disk swap. It can only work if you
intend to have a single class of device - either virtual/xswap or disk
swap - but not both.

There are more, but I think these already illustrate my points.

The root cause of all of these is that xswap reuses the swap device full
machinery and interface, even where it does not make sense, or where it
exposes a policy decision the kernel should be making (priority, size,
number of instances).

vswap's interface came from the other end: what has to be true for
zswap to be an independent AND co-existing tier, and what needs
userspace's input for that to work. The answer was close to nothing, which
is why close to nothing is exposed, and why there is so little to get wrong
inside it. It also simplifies the logic in many places.

Constraint liberates; liberty constrains.

So let me flip it on its head. What if we keep the interface I already
have, and use your data structure instead? I tried that too [2], and it
was significantly easier, because it is just a data structure change,
without having to accomodate for the full interface of swap device.

Happy to expand on the prototype if necessary.

Thanks,
Nhat

[1] https://lore.kernel.org/all/aqLi6cIjD2wJwk0B@cmpxchg.org/
[2] https://lore.kernel.org/all/20260910232704.3364879-1-nphamcs@gmail.com/
