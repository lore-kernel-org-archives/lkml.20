Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681BA3D5C31
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789710345; cv=none; b=sA4QhfGF2BXxuRcpVhn4vgRbKf1rqUN3FcjURe41AikCFqaTmISVBuE97GzLjMke0ZBGoy5LdCl7SN+AK9J+6rg0KjRmo6HK4i4vwkt3eITtXpk6aqR5o/1vSIEw2y+11PZZpSPE865clXVWmvt0E0erOukNdPuQ5XxR2lytIGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789710345; c=relaxed/simple;
	bh=kJBZ10JYEP0JwjjJzcoK9xihABAg2dVb9qqp6sKh8aA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=if/0CxbpY7OkI4Lqnng0lrs7hF7dWxwnxgdXhyDv8PHQQuBG6vcaE53iB2PsmZKqPB0YQ2HaTBZAOcDmHHwPW+ksWlPGh5r2GieE6kFIwBgsoGka2ieAQe+hi9e2TjS+AKfL4mr0kjiJxDj9KHK/MiIOsEPnPLHD0ZTdBHZ9DIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGzlyAgD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGzlyAgD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D15D1F00899
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 05:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789710344;
	bh=tZIBQYdIkUIAuzb3c6Yftyghs4HLNorlFCx2qvx3BqI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IGzlyAgD5iCGTIAwfOZCRmAvZgLKKhKgnpxCzV6AaVy5VpNIeXJHRznv4261V4RD1
	 P+rc0RyTn3gLXrafh6fGhL2wNnN2DNxiujRfGvHXPImPlZ3Rq0gNsZpVmydyb45d/4
	 5AreMdB+Ig85mAN4h2+5fo7zhElIlp/y0H5oAJg/GlyjtZMOZ/d8joRoSfPEgZfHaZ
	 TNBbiVFoG/GzqWerMJPbDs8wr1nJ7TjHTzOW8nfx0NDAewSaL2PbqvXXufzDVqKP7Q
	 qOIGxfFNTVWEkvBcfYf+wWs5cTfsDYOItUG7LkFRZ9c2Rkkhxaa5WkRdvgeIvfYYQb
	 S9XX0cUt1mGfg==
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109fafd7so32328685a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 22:45:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz+M1bx03DhkLB4ix+VEr+k8o8MdikffKPj/qiPOWoPwxkKG6mCy3nV/opCWXImKlfF/Dm0nfKlYMSL3DA=@vger.kernel.org
X-Gm-Message-State: AFuF++n8MTHqMkm7P2bpYd3Any95ttg0RJzya+mcmwK0DHH0zEmCJDwj
	abYOagVt0bC9qSDkUAZaVfFDlJS5xwBKtTeYaTOIowatFKzYClUaBK701q2pxw2qCCn9gfn16hf
	+mfgVrH5S7s16WTmf2+Ze0vzxBLmi9tU=
X-Received: by 2002:a05:620a:4047:b0:93b:d7d7:8739 with SMTP id
 af79cd13be357-93bdc7abb16mr192170885a.46.1789710343466; Thu, 17 Sep 2026
 22:45:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789701677.git.baolin.wang@linux.alibaba.com> <eeb806b057f2097a4d8d2edcb9ccf850aad8f38d.1789701677.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <eeb806b057f2097a4d8d2edcb9ccf850aad8f38d.1789701677.git.baolin.wang@linux.alibaba.com>
From: Barry Song <baohua@kernel.org>
Date: Fri, 18 Sep 2026 13:45:32 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4wRWYx8QkBNQqLUDwcBr014dErSqj4mmwL6u+3w7U2QPA@mail.gmail.com>
X-Gm-Features: AcwNN1U4ukXCswakzGtSkgTbKuubC_WAgMbaEn_3U3tuvbZJPBNgMp1ALv2pB_M
Message-ID: <CAGsJ_4wRWYx8QkBNQqLUDwcBr014dErSqj4mmwL6u+3w7U2QPA@mail.gmail.com>
Subject: Re: [PATCH 03/12] mm: shmem: don't expose 'deny' and 'force' via the
 kernel command line
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@kernel.org, 
	ziy@nvidia.com, liam@infradead.org, nico.pache@linux.dev, 
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev, 
	usama.arif@linux.dev, kas@kernel.org, ljs@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 11:58=E2=80=AFAM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
> Based on the previous discussion with Lorenzo[1], the 'deny' and 'force'
> options are testing-only configurations and shouldn't be exposed via the
> shmem kernel command line.
>
> So drop these debug options from the shmem kernel command line and update
> the documentation to make this clear.

If it is a debug option, it should not be exposed through sysfs :-)

Maybe we could rephrase this to say that it can only be switched at
runtime through the `shmem_enabled` sysfs interface?

>
> [1] https://lore.kernel.org/all/6e4aae7b-2c71-4109-945c-6481efde3636@linu=
x.alibaba.com/
> Suggested-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
[...]
> +static int shmem_parse_huge(const char *str, bool skip_deny_force)
>  {

The name is a bit weird. What about `allow_deny_force`?

>         int huge;
>
> @@ -683,9 +683,9 @@ static int shmem_parse_huge(const char *str)
>                 huge =3D SHMEM_HUGE_WITHIN_SIZE;
>         else if (!strcmp(str, "advise"))
>                 huge =3D SHMEM_HUGE_ADVISE;
> -       else if (!strcmp(str, "deny"))
> +       else if (!strcmp(str, "deny") && !skip_deny_force)
>                 huge =3D SHMEM_HUGE_DENY;
> -       else if (!strcmp(str, "force"))
> +       else if (!strcmp(str, "force") && !skip_deny_force)
>                 huge =3D SHMEM_HUGE_FORCE;
>         else
>                 return -EINVAL;
> @@ -5680,7 +5680,7 @@ static ssize_t shmem_enabled_store(struct kobject *=
kobj,
>         if (count && tmp[count - 1] =3D=3D '\n')
>                 tmp[count - 1] =3D '\0';
>
> -       huge =3D shmem_parse_huge(tmp);
> +       huge =3D shmem_parse_huge(tmp, /*skip_deny_force=3D*/false);

/*allow_deny_force=3D*/true

>         if (huge =3D=3D -EINVAL)
>                 return huge;
>
> @@ -5807,7 +5807,7 @@ static int __init setup_transparent_hugepage_shmem(=
char *str)
>  {
>         int huge;
>
> -       huge =3D shmem_parse_huge(str);
> +       huge =3D shmem_parse_huge(str, /*skip_deny_force=3D*/true);

/*allow_deny_force=3D*/false

>         if (huge =3D=3D -EINVAL) {
>                 pr_warn("transparent_hugepage_shmem=3D cannot parse, igno=
red\n");
>                 return huge;
> @@ -5822,7 +5822,7 @@ static int __init setup_transparent_hugepage_tmpfs(=
char *str)
>  {
>         int huge;
>
> -       huge =3D shmem_parse_huge(str);
> +       huge =3D shmem_parse_huge(str, /*skip_deny_force=3D*/true);

/*allow_deny_force=3D*/false

>         if (huge < 0) {
>                 pr_warn("transparent_hugepage_tmpfs=3D cannot parse, igno=
red\n");
>                 return huge;
> --
> 2.47.3
>

Best Regards
Barry
