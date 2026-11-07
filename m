Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794049142;
	b=qI46Umt63RueoVIyhu1ZHexEntY31H37XYsBdDN4wiD5uVP7bwy4BOIgUvedxsFWmhlV
	 9GyHnC7duVj0oBT3guE7CRu03KW2hC8vJGSF59ImvVcHmyltVX4DvzKXXHD6x8e38GNPA
	 Hj018Afr2W6fYg9SYJziQVWI8iNwrTeMH+YP12OytxOL70cYNCxR5RYFJUmATrAHiDLQl
	 itDpjfuRC2Q+jZK5JdtMLcEpnKUC9gUNBZ/2j4yurGrQQseeqx+74FSfVsONQjDX6Jsan
	 QC49OctOmDD0OnuJbfJ/QlxIXqkqPjKfNiY2vq6W8wnAU4VKmwVEbVvash6NERBXtxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1hTaXGgCslrRdpuberOOhKTY+3T0RrmQ/+ep+5hiKIg=;
	b=JrevLexzv8WFTDMJKR9axYJgEnIzTPN5pFkSBOIkRquiHH/3qF6tcbzMKX2531KRhf5f
	 A5WzsBDlcUyD/w9movvpDRE0CKUuyQuhG85eK1YgFhAEhiuNVeA4gnXUaqB83CNEI8iJ7
	 lPM5HydHJL1O4LtDwMpTSe7XEHrKh0hvynlNAZ6i1rXpQSoNlT41MfjKgwQzVaeEGM4Ht
	 5hJWsNtkxdmlFqTKcMOFUjBTBO+pdyR05EyPXA+XC2Af2eNwriS0wQosR0GNDMBzgs3PV
	 M4SChrIvaU7WeosNyceF/bGOYEsN1IXpn3Kg5ZFvj0KVxgs9yucdlsr5IzbAbNggRKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFKpA3oH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E57606A334
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E57606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iFKpA3oH
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b570ff3dfdso1387073a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 02:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794049140; cv=none;
        d=google.com; s=arc-20260327;
        b=hwXIuyaASMMQ2bHlZHuxVQMzTA86y/kPw7TMbZeshsegYSq9lChGITX9UVh8hlLTz6
         iwNipKkqpEMdv/GTtmkn2zd9NJEbWPPQZkmKDoftML3dIvjff6IhbOdoFTK5Tpt5cq+m
         qdQrg10yoIi2Z76cxgUQhAULZ8XoIYjspNd8yLeSo5iaBCzBN2F/MqUSG0n7tD+l/eSk
         zhCxEA+cp4m+4XIItmw4Muw8XR30i2/2MWbdTnyZZyqvRL+mieF9Nb3Ajpzd+6zvLVzh
         s4HB8GCLctr6xLgr/uxHejvnpZqW5baW7fImCpLFCrb7uwhJ6z00O12HzBE36xv/YfOZ
         Ne/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1hTaXGgCslrRdpuberOOhKTY+3T0RrmQ/+ep+5hiKIg=;
        fh=fGKAuK3uFxYUnlC/U7o1ypg0/HuE1LioCTtcMdxQhRg=;
        b=W6LnqflNkBDjAYJqwmAJXwF8oOaNGi/8P98juXu3W/BGDexXGSoIoL7s6Ds+fMFd9P
         +MfDMAGvP5I9KywQL77q+TKrjfb7xNPnKcxLOIgRvOlk9W3Fdwa0jLE36m4KDRmMlosY
         Buz1//XABzM95jPNI684wUTx52xksNt8kycUCa+S6jSxKeSNZaPumKZXw0+JpAKu/2oF
         qXCX8X3bl/HO8/iFf89UOffPj+Moskxmg2MuXBhdhg5kW3A3ztvfha7kOGq3iSvTh2Zh
         eK4EHBO7YXUFHYpD3bt+TLTSLwDsauGIcxDp1dVUR834VVQjAV9wI5YtIgiBbPioHfQo
         ZvSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794049140; x=1794653940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1hTaXGgCslrRdpuberOOhKTY+3T0RrmQ/+ep+5hiKIg=;
        b=iFKpA3oHegV0E8esWQrdeuUrKG6U2HLg9g9Z4waAmlOCMJpHXHCca+vIgMC5shBFgf
         nKCz9I62oMVbNVmMnGhWzDoiI5meYLOJIK6dEHY16TylfO0gdrqpdZ5CfV1tyAjQf3tx
         34CIWxL1Q37UN0hptHTTAwBUYqSMr3xus4xbNA8uSuC+XLyOdyrRt6xXV3suuolnZiqa
         DDdvvgx/aVu6ARq1S44+Rbfp9pHVJOQhYClSp1FsA1ittLs+Y9h+ZkwY2g/uaYaLKi8T
         pRV0RpcnygfXEAdxMnwXt8aP492AJc3Xd/90zmGALyWdMnVLblzvS0pPgqyk6HrXUikM
         IRBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794049140; x=1794653940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hTaXGgCslrRdpuberOOhKTY+3T0RrmQ/+ep+5hiKIg=;
        b=sVRtT06K7yrHfokJrisOU2ugzdD929b1hCt/PmCS6tBTbiZzF891icNCCozx1gZLsf
         4eayKx5If2M3A1rvTsRzWtk3XWkIkYK53D6xg5IyrGxGxV345NpVwvsFwrhnFxPCmDAP
         wYbyQyRycLoiObCYUZtahDd0nYR95i70oKesAOw+L3DHMe+AtigAOmc+oGaGdhPjIwrg
         NvTG7PnxBzRetcT6WxaN/uyYpC9bZ8/Xacche1qaZqq+isGDzF7JSfgny8YzGhC07bCS
         GsAsSObci80rkDXC1A8OFEkg4tV1yPmR0M5ZvI9bpHQz89DszLdhWq7IrX22E6ZYykbY
         kztw==
X-Forwarded-Encrypted: i=1; AL+hErF3nvmcExntvpQMnvdlewj1WTo38U15/IPUdoCGRaVZlFhF4ACHCq6p5IkxVHl4pcPAKHGU6tLiJOryLSs=@vger.kernel.org
X-Gm-Message-State: APuU4Z87jR4jlSXKhzbGf3N04Iyn68d970Pz7wxKgmY4xAPeaY2jNv75
	DJTUZGdsBpEZFgwANUY59coswWH9e9zk/mOM4aIKrxDIt/B1B4IejSQpvx4XneFERJKPBCefUh4
	CKPpD667BPV/U4aa6F7uuO/jI/u88aUBq5yAv4a0=
X-Gm-Gg: AYBFou3OZrmZIZ3R2gOHM85ByLXi/dkUWjX7XBZEWrjAMFsnzYAoRqUvJX1W/N9SCIQ
	I75lCriw7WYRPBn8Coy5Gt/bi8nyrE9nsxGlS5hDU7+XBd2o2YGo6C0sPzTjWLAysEbvI2MiXYK
	foC06peBVnsKn6SCDF25clmAKbEMWSeSpdviUlpX/JtAwSJFw1h5mnhex6zhwijlbDPymJhjJA+
	Sey3nAtyxGLHwFu9mFi1oRT64Rb3cr4np6PSKPYNwxjIaWYqEsScofY6LX4DV2B3xwcbHdfhTfc
	eR+LOH8mEH0kAh0g4UVPkA4LNM3Gy4+3XIU/TClvjAnTMC+GwL2W2sQ/IalmdTv84YQMEckkKi9
	Yby0GFx4JMVpTdqxoOf3RUjQuKwCUNTEPo8xYyOoX6zniB+bqFzumMfn4ajlL6IC/lztpHbsMGG
	+ltCPg6sxJh+fZew==
X-Received: by 2002:a05:6402:548f:b0:6b5:87cb:d8ce with SMTP id
 4fb4d7f45d1cf-6b59783213amr3988824a12.41.1794049140082; Sat, 07 Nov 2026
 02:59:00 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105155032.240457-1-alex@ghiti.fr> <20261105155032.240457-2-alex@ghiti.fr>
In-Reply-To: <20261105155032.240457-2-alex@ghiti.fr>
From: Kairui Song <ryncsn@gmail.com>
Date: Sat, 7 Nov 2026 18:58:23 +0800
X-Gm-Features: AclHuK-K-9lQ_cnfM0Ul_urH0Jthae2EmrE_EfpDXhjQgSbXVeW5otSmGXBYcd0
Message-ID: <CAMgjq7DpCCiEK00Es7yU_i_wyf7NU4fFN7QFO_RptF9tGvPZWA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] mm, swap: only prefer nonfull clusters on
 synchronous devices
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>, Barry Song <baohua@kernel.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, 
	Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Hugh Dickins <hughd@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 12:05=E2=80=AFAM Alexandre Ghiti <alex@ghiti.fr> wro=
te:
>
> Commit 9a42aed48421 ("mm, swap: prefer nonfull over free clusters") made
> allocations fill the nonfull clusters of their order before taking a
> free one, on every device without discard. Since commit 3cedb745d354
> ("mm: clarify the folio_free_swap() for do_swap_page()"), an exclusive
> write fault frees the swap slot, so a workload that rewrites swapped out
> memory leaves holes in full clusters, which then go back on the nonfull
> list. Reclaim allocates slots one folio at a time, so a batch of folios
> gets scattered over those holes, its writes can't be merged and it is
> written with many small requests.
>
> So partially revert commit 9a42aed48421 ("mm, swap: prefer nonfull over
> free clusters") and prefer free clusters again, except on synchronous
> devices like zram: they don't merge I/O, so the contiguity of the slots
> doesn't matter to them, and filling the holes first keeps the free
> clusters for large folios.
>
> Fixes: 9a42aed48421 ("mm, swap: prefer nonfull over free clusters")

Do we need Cc stable? I guess no because 3cedb745d354 is new?

> Suggested-by: Kairui Song <kasong@tencent.com>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  mm/swapfile.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>
> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 189f04d8838f..1c1b5d0b724a 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -973,6 +973,17 @@ static bool __swap_cluster_alloc_entries(struct swap=
_info_struct *si,
>         return true;
>  }
>
> +/*
> + * Prefer a new cluster over a nonfull one if the device needs discard, =
to
> + * spread out the writes, or if it is not synchronous, to keep the slots
> + * of a swapout batch contiguous so that its writes can be merged.
> + */
> +static bool swap_prefer_free_cluster(struct swap_info_struct *si)
> +{
> +       return (si->flags & SWP_PAGE_DISCARD) ||
> +              !(si->flags & SWP_SYNCHRONOUS_IO);
> +}

I actually wonder if we just want !si->flags & SWP_SYNCHRONOUS_IO
here, but still reasonable to keep the two checks here.

> +
>  /* Try use a new cluster for current CPU and allocate from it. */
>  static unsigned int alloc_swap_scan_cluster(struct swap_info_struct *si,
>                                             struct swap_cluster_info *ci,
> @@ -1143,11 +1154,7 @@ static unsigned long cluster_alloc_swap_entry(stru=
ct swap_info_struct *si,
>         }
>
>  new_cluster:
> -       /*
> -        * If the device need discard, prefer new cluster over nonfull
> -        * to spread out the writes.
> -        */
> -       if (si->flags & SWP_PAGE_DISCARD) {
> +       if (swap_prefer_free_cluster(si)) {

That's a pretty nice helper, thanks!

The patch itself looks good to me.

Acked-by: Kairui Song <kasong@tencent.com>
