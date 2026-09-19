Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCA4145A1F
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789829085; cv=pass; b=GJJUMRnruoURjI3BoaadFdArEGw8XOg99/X+d83YR35QVck6H57QgL+o+9hP+zzIia7Y099posm34/EfNxLNYD6tCzRss0ceaEckjF7uQ3qUGdbd6e40IaA74pPglTqMIJo62OaZK7N3CGTDO5s2buEASKaiXsjAU717WjZKvgU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789829085; c=relaxed/simple;
	bh=SEEDrnoYh0mOnGCpCP8AW5s7jRnMWmh4+4NV544y7SY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S+mMLz0HJZh4UfKka/w1M8vd9RF3REkqXTt2LicOzM86MSauh7QiP3jggE2vlhsPDHXWowXUTi9zFHDzypmdMFD3Hqlskl+KMIHK/L/hUDuVUbrOkFiU7o57i23ShfZ9MbPRWeEGz9AxFbiq/JfNPFIjq3Xf0xMNwalNbv//qcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in; spf=pass smtp.mailfrom=thechris.in; dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b=M8T8bq94; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thechris.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b="M8T8bq94"
Received: by mail-yx2-f12.google.com with SMTP id 956f58d0204a3-66e4ab19127so1789395d50.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:44:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789829083; cv=none;
        d=google.com; s=arc-20260327;
        b=XcjmuR0Ym0vzEx69cV95qebbdMKv2BZjS7leTDq0/eXnvNGFzi/na1LsHUp+wpeDxc
         NDLdnB2HLlSrUgxRf+NdAfQ0yoNTFWwNeKWtjoQ260cHyuVWLnYxlwL9PWxzp5145eXk
         //dESCse+BzdNnPV/GsX1hwNi4kYf50BCHqNioJpe9FeIExJTJSCXxB6AqdVaErS5+ps
         rlcd3ZTMH3tIBWsTP0c6AHPivW+/DMa2V2UhGkqxJGUkDrjN0kpMxvXGOP6u5fsKBKZK
         QodXwWU0lvQB+xma2/1rmgZFrw+NZcfZ5jKBhjAWw4x8qZ1y+Q8a1RwRPtWSk34cpSzJ
         EdYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BaTMOAzAK//5V3+VmXnptDmlkQpvBCAoWeySpIAKihg=;
        fh=2R2KD/p5ozVpAhOprUEJ53ZEabGM89KHp5FR6HH/Fy4=;
        b=iRYN0BlehLlWZNe4BgpkrR42kj/qIOYqeJBrazvchrNMDcv8hOsqJNEkqvtNmBVred
         +vdcv1VnBrFM5DZm0MkUey1H85LemlbwtWBE0AVAlvnGJKEV5p4RUf4Nn2rJC7M6weU6
         lTCOwmwNbfrg+J04r1aKS6fx8FgAu7DdESUpOkzI2lzuhMBeTWK/q35V1g6k95VpvXMR
         2H4FHyIXaKZ/ufDz0QQ5dgkHuCflpHQqPVPM+WnyDSpYqhc0ZO1dXn2++wM+tFVbth3K
         wj9dvrwRkR7jBad3tT6P+P8U4SGuVdUKREF2D13j0RDuXcgbX1nkSJLsJqfEw7UZR0Tl
         53JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789829083; x=1790433883; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BaTMOAzAK//5V3+VmXnptDmlkQpvBCAoWeySpIAKihg=;
        b=M8T8bq94Zy4wB+w1MJE8Lc9Dgi/vIjcvW/tPfyMErJqHNQW4v8PFhhDFH+QfoIDhvO
         hD1W3kqYUCxZmLkMD1oDeXzj12Yel5O9YwLU3ZEhIP0UILWXnLN8VvecWg22ujd98jPB
         2mCjFMO/W/KebI2IHmiKUgVNdPFERsDebcXrv/+vjI0v/3zkWYSJcJcy54muK6eWzNgL
         YnJTwgVCgNM29vQwfJwKLzIzcrOlUMVRF1dsn1H5kG/8TnfTCTo7ZWC0UK53fJSO41Ix
         MnwR5C/0LpU4tYVzIhZWU9f8s6CRaDskdZAgCel8KL2wF30z4KyzIEt78civbA0ygnOB
         otYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789829083; x=1790433883;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BaTMOAzAK//5V3+VmXnptDmlkQpvBCAoWeySpIAKihg=;
        b=eVSPTYU2rwswUbdG0lGlBZzbnZpp1LZEoTezbQzpHRjLGoAkQf7NvbeMCekBg1gVhC
         jishLIni9I9H+HWpKvKvgJ02Sf/iRlCDxAwZfLR0Wlq3uXhkdJfpDaFzlpGUu6+uWU1z
         9CTQ4jNYSDQRAKWVQjGgshIWvb31jcX7Vrh63rKBfwKyO4HV06kYnbIsymp/8iPfijoR
         B+wYjGj4tZpUVcGzpW/W5Kz5/a3pQDkIvojdG63XHYjAWn/4ST6DohIQN5HGgeTpffIZ
         E0zGtDAyluoU24nPLZYyaRhHOmOBJxjx9N19JAthcetI/1h8txDoCUd8ubYaJBA8FvSX
         aUDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKjuaJfCuvIDv9ssnCfntyX32a6e1h785AHr0Oq/X54FPTl1pNp3w84Ct+tMqVQAn1pf540mVzW9qfr9k=@vger.kernel.org
X-Gm-Message-State: AFuF++ku4tb2PBTitRw8w77ViojU6sL3YyocKcyc63eIV87NvW/0Zs+1
	I4qvN/CjBS9XvHMgfMUXRlsbroowjrgtNbbt/1fihosB6BVEIZJIGiOlWlOr031oYckxLkH+1D7
	rybLFozYXOmTjjw/IQVW2GEtsxc43czT+S3M7lFZz7zY=
X-Gm-Gg: AYBFou29ghs/v98AWKQ9afBgkbKuGxPWw3pISAdhAvFRnZhliWdi8s51HsCpZkNy67c
	Vv0sM/osLRFjMqsiCyn1WZoHQ6Mu07RorQNfsLWN5g2IR7YmRJvXgv1NKIdRJi651UNiMPQlUER
	HNmyixXvHiTu/hJJ4b/OvFGqHX090MoRfhWgajCkbUWwgrm9LgYrB8uPMPQe+pFGFS/W0MWhOrU
	6kBy26VofxSdX24aHZ1Y5/X5FxGQmwGSC2lMtRP12mTXqZoDhw1hMjMMB8MGiFbF1qzH9dxV+0l
	aXt5jvGEcZIFavphwY20EprdEImTAu8Ti5ADPlCj8hDZsJtSLMmHDJJuP3La1DOlC/KZcDE09av
	gH/mZRsKux12LcfU6/rOLTiCib1AGNLtmoBuM5VPTPWzVnWrw0YOcGmLMmS+YG8ZMqaasW5krZP
	WRRItV12rH94sd6tw=
X-Received: by 2002:a05:690c:e685:b0:89a:63da:cbe5 with SMTP id
 00721157ae682-89a63dacd4cmr7313797b3.43.1789829083163; Sat, 19 Sep 2026
 07:44:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com> <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <aq6afmdN5DYpuUa2@cashel.logfs.org> <mu8hfoxj.7ce5e90c-076c-4b73-813b-f9c60310ddab@nod.at>
In-Reply-To: <mu8hfoxj.7ce5e90c-076c-4b73-813b-f9c60310ddab@nod.at>
From: Chris Roy <iam@thechris.in>
Date: Sat, 19 Sep 2026 20:14:31 +0530
X-Gm-Features: AcwNN1VVdZq_i5--e-uskgSmXVQpAASq_eAqaNA9x5LP_XOGGCjlgNcTays_lsQ
Message-ID: <CAE2Bdm2UA2UTkYY-w2qxLaXWjnujTkOoC2mS+WXu7McZV2MyeA@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: Richard Weinberger <richard@nod.at>
Cc: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, vigneshr@ti.com, 
	Adarsh Das <adarshdas950@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026, Richard Weinberger wrote:
> While we're here, maybe it's time to add a decent configfs interface to
> this driver instead of configuring through module parameters.
> That way also multiple instances are possible.
>
> IMHO testing is the only use case. I use it regularly.

I would love to look at this if you think it's worth the added
complexity. A couple of design questions before I start
on anything:

- Does configfs coexist with the existing block2mtd=3D module param
  (for early-boot/cmdline compatibility), or replace it outright?

- For multiple instances, would a configfs group per device (backing
  path, erase size, label) match what you had in mind?

Can sketch an RFC-style doc once I have a sense of the above.

Regards,
Chris

On Sat, 19 Sept 2026 at 19:58, Richard Weinberger <richard@nod.at> wrote:
>
> Am Sat, Sep 19, 2026, 16:22 schrieb J=C3=B6rn Engel <joern@barelysecure.o=
rg>:
> > I added Adarsh Das, who also attempted to fix this bug.
> >
> > On Sat, Sep 19, 2026 at 07:42:25AM +0000, Richard Weinberger wrote:
> > >
> > > While we're here, maybe it's time to add a decent configfs interface =
to
> > > this driver instead of configuring through module parameters.
> > > That way also multiple instances are possible.
> >
> > I honestly wonder whether this driver has any production users.  It is
> > somewhat useful for developers that want to simulate hardware they don'=
t
> > have.  But beyond that?
>
> IMHO testing is the only use case. I use it regularly.
>
> Thanks,
> //richard
