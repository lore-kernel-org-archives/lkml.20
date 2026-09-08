Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1323939A7F2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 07:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852940; cv=pass; b=MXhockdCcXIrYgaFScH5QXhAqfZ247nICw9ZYx6UzipFhKNxsxh3LfBTTTd0wFJ/da/Glr96qN2MeW08TfBr5V+gc2OBQNoZ9AvtJyUr5j39/JnYL8Q3y/XP7B1JfJeGiKK9ptkX/cMT+Q1hcHc9MX5RkXu63HIH2DqSdUyAuzM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852940; c=relaxed/simple;
	bh=kEtwck+GhzVGnuAmeYI6QR28xLrnmqSNSlv9PEkxITQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IkeARmkimK1A2azUlWOUG7G2mPygkMNcRhdQdk7Hp1Tgi+XY8Dl9r+/1o3l9EGu2gn7ceu3NWF0nYIVtJke1wO/YVnNxR6mVB+wMQu5wMIG5ZeMxibX+xr0L9A4ssrToBFU7HypEWOii51VGjhPk9dr1tHZIMbtcPQwc+h9aiuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzM9nAMy; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzM9nAMy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843703c170so284807f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 00:35:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788852937; cv=none;
        d=google.com; s=arc-20260327;
        b=dy25maASjVW+bV2l7UUGWgEASGyro3t2WU5jSN4C5rGLdw8SJ55MHbONjpBE2AX97b
         duULveERDOHFx9EbDGACfTA3lSZpJ+P5Jli21SwxuB2rEANTwrvpFKVcAbsrnowE7AQL
         U9Jku6NtDP6jUJXjXgmYfTvCAB1/w5lqQEk4H3IwaTf4X8SYeSROL6tyKC5BNfX0Zi1c
         9bgCsdnKHM11sOdvAruyAqjXlM/kiWGbhLJbIl2V2FJUYvsZx6WPO/lE31xl1fI1qQnC
         cU+Ea+AdoM87TFfg2jE/Yq6H9UNPnILIJBY2hpxh2aZSyGzp4TXgfKdRMzKgXBwLc+Ei
         E1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kEtwck+GhzVGnuAmeYI6QR28xLrnmqSNSlv9PEkxITQ=;
        fh=eopTpsdRAfd2VvLkgSiqVdNBd/+e+O61kHTcaEtvKjQ=;
        b=NuvD7jrpMBP5DCAo17T4qEOENR8CPrScyUSpKrlhIu8MU3153QXdced3mW77oCKpj9
         GsGVelK7Xl5AWCeLSpwOJj0dxq8LLAJwLzshPzFijgMtkm4WHc8M9/wyNFpOLuiYP+Zf
         CqUOWREVlvGtnbSGlvcCL31AHkXs2V0MxXnnNuUvH+LWf2avdZYHyo/U4CsRUCdb+cfb
         eF82GNNEnoX/W5N99eTvciSCnsc4txXGsmjTFT7YiSEqfR5Ij1FcTDpyct0g3QKBaYmg
         w9Mw+khhWpwLJVCp1gYrMX0BN8YARwb+p1t6MaPmWWNF3wTVxPG2CtmsAuG8sAJee7Gl
         +/6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788852937; x=1789457737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kEtwck+GhzVGnuAmeYI6QR28xLrnmqSNSlv9PEkxITQ=;
        b=PzM9nAMy6bTbAmIJWmZjtWvSsF7TYd8Ohn994L40IXKuTBtm1ezfKRk2bqrrWQiZ7e
         C7CCn1pZ/KUjRmghpmkUKMdMxpNypMrjH3zMLNlgAqwPv7xkxgtd9cSQ/4Ut/ApONJMs
         xl8uEdC4s0nj2DYqIYSdrVmlOvnqU7ruISBndpIj/D/M7gzJs9pHY4peOSdHkth9R+fO
         zB5961W/zV6E5UWkFqLpYtTizSp4HXSkdrQu4UrjamJ22HOn1qaK0TOm83Hfpnp16rd5
         pwhp3KLZBtfYLDfpmABkYN8U3VYXRNYULOwEI0wABCxluDU+VVMLNTRpSTv+2ozjGq/F
         dA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788852937; x=1789457737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kEtwck+GhzVGnuAmeYI6QR28xLrnmqSNSlv9PEkxITQ=;
        b=MuEVAMgc5Yu6drg4HACgRD8NUU8A9HSjyCZyXWxBZ3IK7xTVVkDImu0FQE1cVnd3a8
         jZRWioCzuWCJBL5uZMSzvdAbGdp0gRUEqKPdc4HXp3RHc9uX+PMlR23JOEMyCzJuIn11
         7EE973D+2j8g0ztVldfIA8YA2EH5j/puNmQDDsHXrSNXQ2FzBISDwyFrghLgMSOxudFq
         dWIGUFCpIvMbrXqGkuXJFvN5/kmO+VlSLZaPH4gDLoEQ/UDyvLSIBnroi0+D/21NB+wF
         PpkAzwf+9H+YkQJsK0/9A/OH0svF0F2i/x7yQ7Avif2lDGs1SblLC4E4Kayfb4yjVVWc
         omLw==
X-Forwarded-Encrypted: i=1; AKwUvBzXI4apfgD8/XODVY9OkAQogn4OJTaFCzQnbXwbb4g5+1CyTyBXCQTbhqIFEAt8hxLbXoEptBtCdOVMkG4=@vger.kernel.org
X-Gm-Message-State: AFuF++nWX2QgNaEMb10EnCQmXkOE0Lcsl5nrXS9jFShl1MqS6AECJdBO
	rQnwgRBQRaNpzG6CdnmOaD9IQP/F8+jLKSnbxYTTgcmoDlPJoCzRfmBay5uqmc3GKgH3/4Sie7K
	Qh5mN3/q3DkaQzSoIYaRdoBxet/j1EdE=
X-Gm-Gg: AYBFou22faRbynvo8TPoe7VD8OJ/8K/3OetcQlDBpf8mJXOqDpyXlGCRsEFzDtxn4MT
	RIqj2cGg+ZFbG+79tHEHg2lymE91jw8q8E7uOqJHI6w1PmTVfWvit5DTsWA8JbOtRm5OfeB0ty5
	C+vWqWeoMMyos0iyOrD2iHMdnnWzTOr0Et5PT0wlmXDJhzMauVKkLjVPtGZMrEkro4WUXUUlBaD
	A8foaquD9maXyWCHHxU1gWEr0CJ6IqV/xFm84LcB4hjd9phYsxOClj8cWvtqMEsLS8ow4B0MQTR
	vE3M5hIuQGYWgjPcxUZ+NKF6bB5dHDghibOOdOjtjq4GhqxcqONaC3JjUJU9lFh8PXuY5akkHKS
	FsOBLFA5uL+oMqC0vD4tuOBLEik8/Cg==
X-Received: by 2002:a05:6000:2610:b0:482:ea38:6b80 with SMTP id
 ffacd0b85a97d-485905b6dcamr17746950f8f.1.1788852936749; Tue, 08 Sep 2026
 00:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com> <apk8ZRr6do_YAlzf@kernel.org>
 <CA+qSx6wqd5VSR=9yarFFmyN1SyvLJqEHpA7BwmzuxNQTHbS=Xg@mail.gmail.com>
 <ap05ue1pq3TgHOS6@kernel.org> <CA+qSx6y=OaMsvTKUbPP2DOan3Ym6c8L5z60512-tCYeUjLZz3w@mail.gmail.com>
 <ap5Tqu5yswJrj5UM@kernel.org> <69db9546-d14d-4107-96b7-30963292c2bd@kernel.org>
 <ap7L2UEriz6DJfif@kernel.org> <2e8dae0b-d81e-4c5d-b4d5-c80bde07a314@kernel.org>
In-Reply-To: <2e8dae0b-d81e-4c5d-b4d5-c80bde07a314@kernel.org>
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
Date: Tue, 8 Sep 2026 15:35:23 +0800
X-Gm-Features: AcwNN1WRh9Ejy1a6UjKpBEjkYuP25njGh2x0QoOc56jCCHUBW1sbsWwyKaUqbMk
Message-ID: <CA+qSx6ybfqMMNKkAwVgcEga4uzFixXYKLZ-D8FuXmjXpQ9zExA@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org, ljs@kernel.org, 
	usama.arif@linux.dev, ziy@nvidia.com, baolin.wang@linux.alibaba.com, 
	liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, kas@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	luto@kernel.org, peterz@infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 10:48=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 9/7/26 16:36, Mike Rapoport wrote:
> > On Mon, Sep 07, 2026 at 01:18:42PM +0200, David Hildenbrand (Arm) wrote=
:
> >> On 9/7/26 08:03, Mike Rapoport wrote:
> >>> Hi Xueyuan,
> >>>
> >>>
> >>> And I believe this is an historical artifact rather than necessity. F=
or
> >>> configurations that allow set_direct_map on arm64, change_memory_comm=
on can
> >>> update direct map too, it just need to be implemented there.
> >>>
> >>
> >> Are we sure the other architectures do what we want in their set_memor=
y_ro?
> >
> > It's a zoo right now :(
>
> Yeah, that's why I'm asking :)
>
> > Although most of them do.
> >
> > But we need to sort it out anyway because of increasingly growing deman=
d
> > for modifications of the kernel page tables.
>
> The question really is whether we want to use a single interface for all =
page
> tables.
>
> I quite like a page-based directmap interface. Other page table areas are=
 not
> necessarily page-based. It also expresses which types of operations we ex=
pect on
> the direct map.
>
> One could, of course, use set_memory_ro() internally to implement
> set_direct_map_ro() (and similarly for other variants); but at least
> set_direct_map_*() would have clear, well documented semantics.
>
> >
> > I started something here:
> > https://lore.kernel.org/linux-mm/20260721-generic-set-memory-v0-1-v1-0-=
2c1fc62306b3@kernel.org/
> >
> > Now that x86 CPA is nearly fixed, I can look into the next iteration.
> >
> >> Having a dedicated set_direct_map_ro() with clear (documented ;)) sema=
ntics does
> >> not sound too crazy to me.
> >
> > It's not too crazy, no.
> >
> > Still making arm64 more aligned with x86 and other arches that update t=
he
> > direct/linear map in the set_memory_ro() seem a good thing on it's own.
>
> Right, but I'd much rather user set_memory_ro() later to implement
> set_direct_map_ro() [initially on architectures where we made sure that i=
t
> actually does what we expect? later maybe generically]
>

Hi David, Mike,

Thanks for the discussion. I'll keep the page-based set_direct_map_ro()
interface. :)

Thanks,
Xueyuan

> --
> Cheers,
>
> David
