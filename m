Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538064D7D21
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792413337; cv=pass; b=nIQ5Ef2sF1PvD1woB3v/nFF/mq3yHMpmgOw1MdbJpDn6MeyQPMQY7ffrKbT6FARc5LTfFEbe9vXO2OAOW4Z+uTbhP8zqPlv2i1M7+oaMi2vSKwbkV3HO4/6PbtzDdIeHjSEf1uAi5ZK/+lHhTL+nMTp0WZ5Iy+m1BH60Cfa3FTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792413337; c=relaxed/simple;
	bh=h2JbWnV9rUc1EeFvFy7Tjt14h2irL2wrPatMAzjOJ7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AnP4WxxsZ2aSRjZKDSYffhvMl9ydIyGp6+uCLf/9+nTUEacs+zpc9llwUIpIG7Inw+q7vUMnidEVwZvW+ATVrtSmMXmV1wMrHRYLr374ZZfubVOBoVmLpsw9rJp44YeQXKT7z/+hCtSY2dBHi4r5Q438fxECphq2exJOtNK+e2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lTvgTBaM; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lTvgTBaM"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1226117f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792413323; cv=none;
        d=google.com; s=arc-20260327;
        b=UIlRUrqMkmDBckbqjM93ggdyMiF31kZUXol8L7hVXPfF+uq1Ii5nbEj5kloJSoaHkV
         80U/ysUcmpdJHfs+vEZ+vkAuZd8EJJDOoHHULBRMvk3j30JGkW35rWoEHlBy5oEXpb7B
         J2I1u28OnsSyirqgatjYtwQ7EbCI1qwK15Dk36/IEwJhmuSJdT2YIsEy2pl+laMlCps1
         i/HwazPH17yxbtYUMpgBPSu3+Hq5w2siQ57QMKhKhHkMQZEJo9RfSSCImZHJT8HQ87Rz
         n5Yst1/FhotMPSlwIBicF1kxC2/KYjIbrKLFXeBJyWt20p304DD+6SlfaEXiBGfJLEXt
         Teig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h2JbWnV9rUc1EeFvFy7Tjt14h2irL2wrPatMAzjOJ7w=;
        fh=kgCMJIZ/vAWOFSDXAA+LvmCcmECPovmeeJzYO+02eTE=;
        b=HpPi2T3jU4S3JOAs9BUMEWliBstIuijhn0tCA5BAJDOCDLv+b3Ot3sLf7+CjLcvs/X
         gnwpXhBhnpc7+Pk87lnZWEnrQsECICTdHk61f33YI22zIpz89mlRD8gCfGCyKYrvkkpy
         jW6KBuDJCC9AjTvjrNMv5E/Nxjt5s58bGiOcuWdelcKsbA54O3vEMb7UbJwt3LcUr7Lk
         IbOe9lSvXiOvlKOQ9+4oCPO5AXfME4K5s5GcRfxbEuxCS9F6lmjZl7iWTw57Y/s6seWX
         6LCHF/18vEJk8mifBgiIjC8+kR78VlRaTs2x5nX7CkK7vkrtd99edy12uUHCjNBPO+Cl
         eDYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792413323; x=1793018123; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h2JbWnV9rUc1EeFvFy7Tjt14h2irL2wrPatMAzjOJ7w=;
        b=lTvgTBaMCa4ZKG4V6wMLE2eP/d7WRz7sxcNslCTgjSzmzn7wxfsLAZGIw2FIkasboh
         06b5zxWkhCcKg2YQ4KLKKaPhfwT1CzyVn85Cg7RxE0qnE1K+OtJGicUqiByHoo2DPcKt
         2MZpI48UuoaK0crE+VsMbkHty1XqZ7gVlt4mWpA6LyCC+L2frjakQ7a5Fi/T2csjqrEh
         ISuIzLpLAdXyd0CjRA0x6B71oXWjsIYKJ9e1eCUT7bq2ndNSzQLNJ6/O5rYbDoyXnjvS
         6a7gFPZ5kDLxZtpqMJsSRzaoHTtUbUNa0Tt5mcu2kJkczGE9B9wYjxPC2UpRQFDzgCNq
         Rsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792413323; x=1793018123;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2JbWnV9rUc1EeFvFy7Tjt14h2irL2wrPatMAzjOJ7w=;
        b=DElNFngQDRquoWMQ47jqp957rzeFN+NNQIrD84QjfQaTeia4EcMx4SmL3RrfeOyqFE
         3j8ma3rjO0T5RQLlQis7RFBkJKzp0RXt4YJdVdtZ7csLKSkrzxWqXjrOWLz8vi9PSC/2
         IFOOwxqLL5LNGEQ8fqAmFRQIVG6Ls+69pNFWibuXLZh8R0mCU89izGlNRV/tnGrSZlj1
         1PUsnRanYLH4L+g85QhXnZtzE1l7GvnwTrxUhTXRE12ITfM5w9Rpvh1ZDxSUBtqL6FFs
         arusylG8pGpB6zcfppq+LdxfBobbOCLT2NDwAg6YshTx0Ci9AFgBqoyTVFIPpN39g6Wy
         NDvg==
X-Forwarded-Encrypted: i=1; AKwUvBwta0gWVV11gRYY8Bky/H3SyBjYoFlCzxvtnbpuUq7xoArH7dVm4qXwsBEKP05LkgWIEHu+ktIeJGtNo9U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkuDbJlvgA4giXpvSbiFw2jHGOwAkBoq2a9v5lAo7O41dLQ19P
	hPZSOupZt/xWuD60N/RUaKJ+YSIifTT199eOjao0Qe2miDTK/L5UM6YLPORxBmh58ii4RoYfm8N
	pbVokvoBYVdMZushrj7ZlbSx3ITahEkw=
X-Gm-Gg: AYBFou0z/6PMpQ3bdFRMpLuQET/dhqnrSnKfzEt10Z8ioKuqX82GELuAv6NLMhlbfx6
	cJKI51jytSpCkPOg6qZLjiV6zr8wDRQ3UNqkeu2D6sG1gLJ0R1SUcBt2bPdo6W7a5VKRfVWxCL8
	WdrbtQlc+YxdxJHhuyUk8BDi25FYJXKYffFozDAb43zbkwAS+msb32QGXcCsg0tAyMCCUVp/tIA
	gYxLZGvBn2YWXkdkrSua4rf1d6DWJk3NcupkTrt5Wzixc1QKXS+hXWi2JepJ85U7o1oqnLfO67V
	tQ9aeU2Us601O+tZHlgKwUNg7qkADkglSpabcyS4xoe6o3K215msFpbA24L6+97FMaoCa16B/d7
	j9QTY+tUzLYUS66tctIdtsGnm8P3xB3OVI0FZ8gLX8hfQmuKIuRRKCADkpFCpxJn87pnomvw=
X-Received: by 2002:a05:6000:220b:b0:48d:ca32:e90f with SMTP id
 ffacd0b85a97d-48e07fb8457mr14720830f8f.55.1792413323141; Mon, 19 Oct 2026
 05:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5fdb3777-95a2-48f9-bb38-aa4ba3c96a81@kernel.org>
 <CAKEwX=MuW6q354nB3tyFTM8d3ox7LRaqcSfUxeATR=Sop5mZPw@mail.gmail.com>
 <5ca344de-bc34-4a9b-ab85-f553811a1d9c@kernel.org> <CAKEwX=N05iOC4hmiyTt5OxjAsOfU7_V8xGfmK_RgUyrKtuyUTA@mail.gmail.com>
 <CAMgjq7DJwGCHCAchcfi2Kcu+XHx2YnKXDj53e0t2kpG_GSejkQ@mail.gmail.com>
 <aqgMCIOFi0dKx_6L@fedora> <CACePvbVMFA9N0nQers=sOnSXGbNhtNE0ewq47AJEH5Cr8imQXA@mail.gmail.com>
 <CAKEwX=OMYhUs3tt7jUzEzxsOW3yA2JmzpwwxVBP2eZuHOFu=vw@mail.gmail.com>
 <CACePvbUMjRgK=dQzLjECgBXaUtQSPdAnBXL1Y4=Kh5d15swYvQ@mail.gmail.com>
 <5c8a2b7b-b76d-4bba-92e1-ec3d66794273@kernel.org> <20261014195354.GA371161@cmpxchg.org>
 <CAKEwX=Mwc+D+AN-B5T7p=80fqCDijdsiJjd6aN_3YMrEQjyvwQ@mail.gmail.com> <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org>
In-Reply-To: <a24ca7b8-8b42-43f3-ad72-afe62f97f76c@kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 19 Oct 2026 05:35:11 -0700
X-Gm-Features: AclHuK-Ym9EzJ2CIcu1okawbU1UiB-xvQtvgaUvkzS7VoDFrSu5HhWBluHPj1QE
Message-ID: <CAKEwX=OdbOrFbdihntP3rmcWJUyM1UpYa5n+pYjt_feMQwx8yA@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Chris Li <chrisl@kernel.org>, 
	Baoquan He <baoquan.he@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Kemeng Shi <shikemeng@huaweicloud.com>, 
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
	Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 5:28=E2=80=AFAM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/19/26 14:24, Nhat Pham wrote:
>
> I'm traveling this week, so it's a bit tricky. I cannot make Thursday mor=
ning.
>
> On Thursday I'll be traveling back from Cambridge. But hang on.
>
> My plan lands on Oct 22, 11:10 PM. I should be home around Friday 1.30am =
- 2am.
>
> I could just naturally join that day.
>
> So one day later would work for me.

Would that be too rushed for you? :)

For everyone's convenience, this would be the time slot:

PDT: Thu Oct 22, 5:00 PM
EDT: Thu Oct 22, 8:00 PM
Europe: Fri Oct 23, 2:00 AM
China: Fri Oct 23, 8:00 AM
