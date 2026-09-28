Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A61447DD58
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.166
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589881; cv=pass; b=Eikk6/CGhc4wH73BG2zZsUzOnmSftx9WUABv4Xq4BJZfqyyaciXdpVp33viNIijdFlLptl0lCVxY5bFPXwlELmfTJB0HT6yPaPlF9qGWVxK+hoE+0XJVgsHnIXHHSxRRxcZpr6/bsfx3EdWp8h8aoMckErTLZkUkFuqugmEwF+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589881; c=relaxed/simple;
	bh=Vw1BM8+0IrGCKReQt1zsJ+Gdt/hrNRdgc5CzHZf4B3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SPFiyko5y2h/mprM8lZC4B3FzJcSeXyu1urGEC+0osqlDJ1Vnb7YEJROgW92hXfmP5OgJGwUUGVjuxJQ9f/8TZma9JQDEoZG+FtH4+8ReDWfI7yINZ/yDqHzYskeJcwpIDfmfiOCvMBEQyzzRLRFVD6uWTSiu+zWWavpkYR33Pg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cruNU7pp; arc=pass smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cruNU7pp"
Received: by mail-oo2-f38.google.com with SMTP id 006d021491bc7-6d89a3ebc93so112616eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:04:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790589878; cv=none;
        d=google.com; s=arc-20260327;
        b=pH/CQy0xULPWnN4OKBv9Fo3DrqFgZUaVnlDyaiSN8Wyhh1fdJEbhtL9S5Pq13RUAan
         ydD79dB3koULu0GDJw588wa3JD2J0l8HuIbicUAMjr77OvrzLpJw4MI0AqVrbzHYol+A
         Xxuv3id37KvTp+xCkFTGAXVgD1PhZ0shkUF52sbT+wY4OyKt8aapNW6HbUBPPIh2bgYX
         gtRwFU0Gp71VivjGDPep0gg2ekfquN8A60fC6BvmCKCiubHxCy2I/03y8kEPyJWEIWCj
         fcP+uCfuQatGiPmtjjjGWWcFrNWL3EfCDFdBfrPXrZ+b873GQUKE1vWIaVqCYvjALeSO
         SNPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BC4w9/SPD2ShdV5ojRXJqy0mNEMVxZyH56jhpnMIHqg=;
        fh=6Z/YvX5LdOi+Z0hB7y+TrEtHKZ6Sk3wVZDCsRG41mzk=;
        b=F5vgOacnwGDIqF2jRM1/nzJMAsNC3RnlbCUuuJAvPAbkGnxbXo0uPkNjP5fwMls9+W
         5f5lHgqmxnx5mGaWXN5MvRSoH5O/pc9VFec23/2AIj3pac1HWT8F4BBnqNd0zH4cO5wf
         UtjjnePDvIEIcczfNLbOzvlMHiFp8aZkNgndM+uGJicC/HdsTv0xXMo2ufgXil88Xq8Q
         IojBBvDEpcOvPE3gEmGq0rb39QjcyDQwKDkxaV+IaDTwxzsY6DMzmlB3J4cGAfor1zq2
         WRNGijBmyxaHauWwPTAJfWhdPqxpxpzuJrmX2+kpR8247KZlHooYlQTgzd5sdYR02epo
         nR1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790589878; x=1791194678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BC4w9/SPD2ShdV5ojRXJqy0mNEMVxZyH56jhpnMIHqg=;
        b=cruNU7ppMO6c/+UUEogGLnOg7jffYocRC1htoR+cRQbAYs57k/3rKAIj15qSUailOE
         eRIG/K6MboqfgRmHzR0kfwMaPEcualBFVj2vw+nD6GspAmWY98MXishKOEpczwdCKNun
         dXlKx44HOBh4pW5H/w5z6NCqs9xjW+Qkc3O+wbgAzciFumzAQ2UFW7rHguV3HMBTpzoI
         54P5uPsCSbhX4EgWqm4zfB1tvEF3pMD8saYF1QiXlYN+V/d/6QtmIx19aM8Fw/f1eSSP
         aX0rpiNkYIA86RJOtrKWQ5Y/UpoNLeIniF+IcND8HE47qVQs7cSNuOMhTavF2i14f68I
         O1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589878; x=1791194678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BC4w9/SPD2ShdV5ojRXJqy0mNEMVxZyH56jhpnMIHqg=;
        b=EKzcEeU6YU0SzSvtX2keYqEgFMNz11qH3ABOpMiPg8iOHCzEZpy4k3+V5PVqofRJvb
         yJixYHYTvp/m7KLe5sAqj4HnuFkON5vCVUELLQTS077KiqRJLoPG9e5p5sHlS2iSq/9R
         b/5u6oPrtVB96WgWncSa2QVItXzjEURn1Q1q9ZMrbEuP4ITVT3BzVkM74U+EZN2BMjUN
         4zomaLjKzSVFwPpGBgXg8SYEuevh7988NawvUkCQK6m+VUjHRrdtIPt8v9c7UeB/symI
         FLH5cmi9xAsOINLrAbMc+qOw/GdsKcqUNDt48m0AiLGqOWXl+gt05Dgh5ajGXheQtQq+
         m8LQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmuv5S4ds73LSCo0S3MKGWAbh+/cAoVbzHku2/gcnpCcRQ/zlMXJ3WgVWxYXx9NU3ohXHDziNvCQKBhGE=@vger.kernel.org
X-Gm-Message-State: AFuF++lwxVvXiCN4Gh9YUWcb7Ci89RqfHSY5LdShZ8aKiKop3Q1LOEHt
	45hnY0ADE08oONnOAXEPK7bB8Rq0QrYG7xTMoVL5/2Drja/NfS3L6qa5qwjFuTNDGc0MPIa9LgO
	4HMj5qgiyRJGdRr2HO2N+nqI8nKBd+hY=
X-Gm-Gg: AYBFou3kiTYrO1AKC+JoaKwiAWBsjE0PWUJF3fpVRHKZui5mbsrPLSS+cRsUuO10D8P
	YC6Zng2FVzCRDSEtzIlYCaMDpOeVCup0BtkAt4toGT7SRyzlwIH9IvMh8B+MBf30ePIBMjKbaaB
	TOB4nYJrzjDgj0z8ZW76vOU6fJERl5lfVhpFgxWqvAqs9Tm9W0qIbbIDTRsFfirOdOLsvtJ6UHM
	t1qNnCI18+Tga1/KBwOKqVo7VCFz4q1mwJ4V8Mhv29i3frtHcbmzO9WOJoZL73Vh7Vy+FdTi7SU
	L6qnHurnfiCWzgF8LTSwZkxWh9NIJIjyitXwEboBZwsTKk3os0UMl0QmIoWYG+g23WddKaXHWUm
	4W6md+11fmqSTKoPEqBRb68o=
X-Received: by 2002:a05:6820:8582:20b0:6d7:cb64:86ee with SMTP id
 006d021491bc7-6d7cb648c4dmr2630575eaf.88.1790589878067; Mon, 28 Sep 2026
 03:04:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927194205.125086-1-suchitkarunakaran@gmail.com> <DLQS3VWUPXK9.NWD6AU4CU898@gmail.com>
In-Reply-To: <DLQS3VWUPXK9.NWD6AU4CU898@gmail.com>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Mon, 28 Sep 2026 15:34:25 +0530
X-Gm-Features: AclHuK8gz6mKKCCQPMloKdhVsNaS00d0KwNOldjCSfSti-Fcl_7gmhuMy_xUctk
Message-ID: <CAO9wTFhVR-ZPdmJ-iheaVvpK3huO4CmBjXaeaYUUyP3mpqOzaA@mail.gmail.com>
Subject: Re: [PATCH v2] bpf: add diagnostics for rejected memory and map accesses
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, martin.lau@linux.dev, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, john.fastabend@gmail.com, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexei. Sorry for the inconvenience, I didn't mean to ignore your
feedback. Please let me know if the following suggestions align with
your expectations. Of course, these are loose ideas, just to help me
understand how to frame the suggestions as I'm a bit clueless.

On Mon, 28 Sept 2026 at 13:12, Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Sep 28, 2026 at 01:12 AM Suchit Karunakaran <suchitkarunakaran@gm=
ail.com> wrote:
> > @@ -4472,12 +4472,22 @@ static int check_map_access_type(struct bpf_ver=
ifier_env *env, struct bpf_reg_st
> >       if (type =3D=3D BPF_WRITE && !(cap & BPF_MAP_CAN_WRITE)) {
> >               verbose(env, "write into map forbidden, value_size=3D%d o=
ff=3D%lld size=3D%d\n",
> >                       map->value_size, reg_smin(reg) + off, size);
> > +             bpf_diag_policy(env, env->insn_idx,
> > +                             bpf_diag_fmt(env, "write to map '%s'",
> > +                                     map->name[0] ? map->name : "unnam=
ed"),
> > +                             "this map was created with BPF_F_RDONLY_P=
ROG, which allows BPF programs to only read it",
> > +                             "Remove the write, or create the map with=
out BPF_F_RDONLY_PROG if BPF programs need to write to it.");
>
> That's not true.
> dev_map_init_map() and insn_array_alloc() set BPF_F_RDONLY_PROG
> in the kernel for every devmap and insn_array.
> libbpf sets it for .rodata when the prog has a const global.
> The user didn't create the map with that flag and
> cannot create it without.
> Same in record_func_map().
>

I'm sorry I wasn't aware of this. I wrote the suggestion based on the
fact that BPF_F_RDONLY_PROG and BPF_F_WRONLY_PROG cannot coexist.
How about something like below?
"Move the map updates and deletions to userspace using
bpf_map_update_elem() and bpf_map_delete_elem() if the map and program
types support it". Or maybe I'll try to write suggestions based on the
map type.

> [...]
>
> > @@ -6944,6 +6954,10 @@ static int check_mem_access(struct bpf_verifier_=
env *env, int insn_idx, struct b
> > +                                     "Use a writable destination, or c=
opy the data into a writable buffer before modifying it.");
>
> [...]
>
> > @@ -7032,6 +7046,10 @@ static int check_mem_access(struct bpf_verifier_=
env *env, int insn_idx, struct b
> > +                                     "Remove the direct write, or perf=
orm the modification in a program type and hook that support packet writes.=
");
>
> These two are the same as in v1 and don't tell the user anything.
>
> Pls focus your tokens elsewhere. I don't feel we will converge here.
>

For direct packet writes: "Move packet modification to a TC classifier
(BPF_PROG_TYPE_SCHED_CLS) attached at ingress or egress or an XDP
program attached at ingress. For lightweight tunnels, use the transmit
hook '(BPF_PROG_TYPE_LWT_XMIT)'"
For read-only memory access: "Copy the data into a local stack
variable and perform modifications on the new variable."
Does this direction feel right, or would you like the suggestions to
be even more specific?

I=E2=80=99ll think harder before sending the next revision. I=E2=80=99ll al=
so split
the patch so that each commit adds diagnostics for related issues and
I missed some places, as the AI suggested.
