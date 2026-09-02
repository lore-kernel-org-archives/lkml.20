Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8D335A952
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788358972; cv=pass; b=bipsUlOkBK+pArznTxWFUW2t4FaoRRVkBTu7CukzNl8euATaBITUWxYCATM0D2VvlMBYBTKtpYBCImgQRHh+SxncJ7H5jcffdM37wRjzOtcpC0tnTTxRJhkGe9K+7xZ3fm24ZcUc8HRKVHmRDmpPVvWQzGyjwCUAPom3lXKnOgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788358972; c=relaxed/simple;
	bh=qv+NYacrxXvij2l0huaaxrWBSocWWAEVrhhm9aQX2RE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLv0uBDuSfk/snPkPB4PGAicNYVzp9V3XhnSGX54N4sMAqcxcOM5D6j4GX1+20hrXgWafAiGWT6ywkyuv7yyo2UNdscCi2JhS26m2fhtO++uT0+YrAaXKh/LBb/I0EwGzTEFHYbBie6YLmunD2mLf4fqIqbPuI0OCc+aJb9Cm/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBcbM0Pz; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBcbM0Pz"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso11524665e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788358968; cv=none;
        d=google.com; s=arc-20260327;
        b=lZuI/JHLvFuR7P4BN8KRv+zUWjQqJlvxq5ZgGTYpmTn6HwZ0jLW7i/CIvd46Z6YMvV
         X1/MJQgO7KKECqwS0SUMHyauHPjuFsvJtC71EOK1RRjgRbco44qFzRsCezm0AsEU0Ngn
         aeJmqaFaNbh++/v3MMnV30Qr1fu81FCaito3SMncbxiLmsWCTBx/0JGQ7xc1hvxvhRHF
         feKLA2l7FiPYSzHLcV692VMOBJ+mYSNU7JvzXpKt+ZOY6h9fnldY8D4Ig75EMSw74xmX
         08Tn4Xj7qK7yzynv6SntzHLYQ3lFvkQojXCFqIbJPg8TLjuCHTR5MDTTvEvhU1bDzzFI
         csSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6kJ6c1h0K+r9+chFszj0JIJxELOe0sAVph3Dxv71sUo=;
        fh=ObVofo7u1FGNALrmzMKVX6dD9j6gqW5OKJG9p6lHmUg=;
        b=NRiWyiC3z8lr4UGx7HYHCGT1HM23Qj8dGGwIlXwIvfxsRNBl+RBQUQmVS1OBhn6VX2
         SW8tJFq3jW/MKoCSA9ejmvywWCIvmnJZ9uvgkJDGmpFeUe7uXFnPdlrbLXO4emigicTT
         WU3ZThPFAusXAPpR3APIg2TUKZZDA70EcdodoA43HKYU2dfwgG1KfmwsBF6AzY90y43Q
         ADZnaSKzcXbWfok9Vlt2Ul0g1ZzfSzpmGBYW9SVtKKcY/W/+a01Y3ws4fBysXGxuQdXY
         vPrdgCABXi95mnz7jpjKJv8GnTI2QSTRLN10BajtlXZxFWv6XEpguw7oHRENe0NVhbwL
         XzKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788358968; x=1788963768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6kJ6c1h0K+r9+chFszj0JIJxELOe0sAVph3Dxv71sUo=;
        b=HBcbM0PzZvzRVyq8F7FZp64Gb2gATH83tc5RmhHUgoLOQENoWA5O/19VotLf4958ew
         8+T8JRJm7lS3GfTgHMQ/kdawA7YGO4kFzPxODVy/O3x9qp08nb8lIqIve8JzRBdJoSKX
         tspVD3SbaZ0+sLdFStuWck1g8O+WEo8eSqnm82FWFgCsSAXIvlnf8HusoxF07XeHpnVB
         H3itXAczff4uow2wJxgbvhO4kZ41+tNpkeGpRW/Ii7Hx6aZSZKiWm2l5Tkjax0FziRI6
         w5YpGQINeQtcFOajBisw+WUxj7dfF7EDhN8PRr2h6SjNq8zv+adlGG9BmfSPGOrlOtYK
         Zm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788358968; x=1788963768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kJ6c1h0K+r9+chFszj0JIJxELOe0sAVph3Dxv71sUo=;
        b=Gu3NhxvorpwYlmntYWkK9uVvIRdzgb4sXlhhOCjUbqt5CWw8YRt3B4attjI08Tj66Q
         7EWXZIwWSbcHA41NIGBS577xMXn64OtBJNRPPszHnSmajxqIzfa2NbL2AwySkyqIN853
         YsfyL9G0qzMv8L7VSa7C/kJYugdufVRRgAwcerH4T8gxaceeKkvlLBJu9sbUg5FrvCV8
         zpnFvZoLnwFO3RgJ4lKuos8RAO1rGfnMn7Yj2ax83nnpzTAVnp8C6hE6Ss2WNO8Urkoq
         S20fh0vf3Qh11XdweWRgIyX+dSg0WDMAaU4o/7Hgg6pLd8yHc8zifTzALCvc5kpknGLt
         /t0w==
X-Forwarded-Encrypted: i=1; AHgh+RpO+jlM/sQfLS0Y0i6JFtSEcgGW3431muzGrQel4NCv8b2EsHE4poF/ByhRELiPlCOF4UaFwU81UngTY0w=@vger.kernel.org
X-Gm-Message-State: AFuF++mL6V9+gTwWSs6Y0rkwtLQchDLuGzydNr3dAmc9ySi5o52aOBJU
	A0YTpjuQjiSRHMDU0yjBwmXZCfR6IkAfbVmhw7ufmWNDR5M2Uz6XlINpjZBm+6BBHatfv3RjLoy
	zluBaOPaW0IHMocqf60v+MEvVJJitaBM=
X-Gm-Gg: AR+sD10PFJbvsx/KuFp+MvuOewwpiOXXmz1MkJvUrAgxAf6rHjPUt5SVEoX1iHB67mp
	AILoyTsZHtpKxIKGVHJ/yHfsnutYpYRHW5obJsS8CH6/BWKDVEe52QIpNUKXxpvca1/YFSzaxU6
	gDrgvw3Q0KO2Zcf6ItcT24tCVSrbAfpTLQDb6iE1R4tIHUdS4tMxmCb6zI1yWPpT6IwilIexH5+
	DRuF9XK0zsE83KsV8yOVkbqYBJb5tIil0uk8Lhsr9KIzRWN93j4eMuRWpR+opz2yj0mFHUwRNoM
	JRKNnxQ9gDY8CaApRJwTz9c2Ux7vfyvfByQibxW959yUrG2V6p3YS+8aXLzwGwspKugVDdsrI0/
	K6Q==
X-Received: by 2002:a05:600c:1da1:b0:499:9eb8:a1d7 with SMTP id
 5b1f17b1804b1-49ce5842935mr111961815e9.9.1788358968186; Wed, 02 Sep 2026
 07:22:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813104857.3450386-1-hebaoquan@kylinos.cn>
In-Reply-To: <20260813104857.3450386-1-hebaoquan@kylinos.cn>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 2 Sep 2026 10:22:36 -0400
X-Gm-Features: AcwNN1XHngzaHLhUNCqIXTdftrG_CiGVj__UOOGYwakB35FZUOuqBaGiqnEl-Sw
Message-ID: <CAKEwX=OW6M5n8u3L_oigD3Ffn_BcB2L7p=ROfmJCxMKQFH7tXg@mail.gmail.com>
Subject: Re: [RFC v3 00/15] xswap: extendable (virtual) swap device backed by zswap
To: Baoquan He <hebaoquan@kylinos.cn>
Cc: linux-mm@kvack.org, chrisl@kernel.org, kasong@tencent.com, 
	baohua@kernel.org, youngjun.park@lge.com, hannes@cmpxchg.org, 
	yosry@kernel.org, shikemeng@huaweicloud.com, chengming.zhou@linux.dev, 
	baoquan.he@linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 6:49=E2=80=AFAM Baoquan He <hebaoquan@kylinos.cn> w=
rote:
>
> xswap is an extendable swap device with no backing storage.
> Swapped-out pages live only in zswap, so the device wastes no disk space
> and its size is independent of any physical device.
>
> xswap decouples PTE swap entries from physical backing storage.  The
> cluster_info array is backed by a sparse vmalloc (VM_SPARSE) area that is
> grown and shrunk on demand:
>
> - Grow: when cluster allocation runs out of free clusters and the device
>   is below its ceiling, more physical pages are mapped into the VM_SPARSE
>   area and their clusters are added to the free list.
>
> - Shrink: when contiguous free clusters accumulate at the tail of the
>   mapped range (tracked in O(1) via nr_free_tail), they are unmapped and
>   the backing pages freed.  Shrink is deferred to a workqueue to avoid
>   lock recursion.
>
> A per-device ceiling (nr_clusters) bounds growth and is adjustable at
> runtime via debugfs.
>
> Interface:
>
>   /sys/kernel/mm/xswap/create           write a percent of RAM (0 for
>                                         the default) to create a device
>   /sys/kernel/mm/xswap/destroy          write a swap type to tear down
>                                         a device
>   /sys/kernel/debug/xswap/type<N>_cluster_limit
>                                         read/write the per-device
>                                         cluster ceiling
>
> Since xswap has no backing, swapped-out pages are stored compressed in
> zswap: physical writeout is skipped, and zswap writeback is disabled when
> every swapfile in the system is an xswap device.  xswap requires zswap, s=
o
> device creation is refused when zswap is unavailable.
>
> Naming:
> =3D=3D=3D=3D=3D=3D
> I'm going with "xswap" (the "x" for extendable/extension) rather than "vs=
wap".
> Chris suggested this name, and this aligns with the "VFS-like swap layers=
"
> direction Chris Li described in the first swap abstraction LPC talk
> (co-hosted with Yosry) =E2=80=94 the swap ops and the xswap extension int=
erfaces in
> this series are moving toward exactly that. I don't have a strong prefere=
nce
> between xswap and vswap, so if reviewers object to the name, please comme=
nt.
>
> Note:
> =3D=3D=3D=3D=3D
> Most of the added lines come from the switch to a sysfs-based create/dest=
roy
> interface. v2 created an xswap device by handing swapon() a "header-only"
> swap file (mkswap followed by dd of just the first  4K), and teardown reu=
sed
> the normal swapoff path. v3 makes xswap truly file-less:
> /sys/kernel/mm/xswap/{create,destroy} replace that file dance.
>
> This patchset only build the base. On top of this, I believe Nhat's core =
code
> of xswap writeback, rmap etc can be implemented simpler. E.g, we only nee=
d add
> one field in struct swap_cluster_info to let xs_table point to physical s=
wap
> entry, or zswap entry etc. No need to introduce struct swap_cluster_info_=
dynamic.

It's functionally equivalent. I think it looks cleaner to separate
vswap-only bits into a vswap-only struct (technically saving 1 word
for the cluster that doesnt need it too).

How would writeback, rmap be simpler? The complexity comes from the
operations around it, not the actual vtable/xs_table operations
itself.

>
> --- a/mm/swap.h
> +++ b/mm/swap.h
> @@ -57,6 +57,9 @@ struct swap_cluster_info {
>         u8 order;
>         atomic_long_t __rcu *table;     /* Swap table entries, see mm/swa=
p_table.h */
>         unsigned int *extend_table;     /* For large swap count, protecte=
d by ci->lock */
> +#ifdef CONFIG_XSWAP
> +       unsigned long *xs_table;
> +#endif
>
>
> Testing:
> =3D=3D=3D=3D=3D=3D=3D=3D
> 1. enable zswap
> # echo 1 > /sys/module/zswap/parameters/enabled
>
> 2. create xswap device
> ~# echo 0 > /sys/kernel/mm/xswap/create
> ~# swapon
> NAME   TYPE  SIZE USED PRIO
> xswap0 xswap 1.2G   0B   -1
> ~# echo 80 > /sys/kernel/mm/xswap/create
> ~# swapon
> NAME   TYPE  SIZE USED PRIO
> xswap0 xswap 1.2G   0B   -1
> xswap1 xswap 3.1G   0B   -1
>
> 3. tune the zswap size
> ~# cat /sys/kernel/debug/xswap/type0_cluster_limit
> 1179
> ~# cat /sys/kernel/debug/xswap/type1_cluster_limit
> 3145
> ~# echo 2048 > /sys/kernel/debug/xswap/type0_cluster_limit
> ~# echo 2048 > /sys/kernel/debug/xswap/type1_cluster_limit
> ~# swapon
> NAME   TYPE  SIZE   USED PRIO
> xswap0 xswap   2G 377.9M   -1
> xswap1 xswap   2G 376.2M   -1
>
> 4. add memory pressure
> stress-ng --vm 1 --vm-bytes 4G --vm-keep --timeout 120s &
>
> create/destroy and grow/shrink xswap device casually, all passed.

Sigh.

We have something that has performance benchmarks, including on a
real, production workload:

https://lore.kernel.org/all/20260825153238.2695446-1-nphamcs@gmail.com/

And somehow, we decide to implement a different data structures,
without concrete numbers to show that it is more efficient than xarray
(only intuitions)?

At the risk of sounding like a broken record - I have to ask: why
don't we land use case first, optimize later? Especially since, we
have data showing that performance is fairly close, AND users who do
not want to risk it still have the old code and can do A/B testing
before they decide to switch?
