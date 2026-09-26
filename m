Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B4A372EE2
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452300; cv=none; b=MFy59mP+PEdEYbbVUH5ab9xlGKF6hvM4GbICyaGFSgoH2Xm8VSxun20/I90yd7XiZpR9WCRqeZ90gUqyfviX0bLuIqOPhORcCIgq5QCaGEXmgSRdAHS8Hm27JGKBj7vrSFOOS8b/c8SZN58aTfp2CqVE54Ys1npfyv8IgUXcF+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452300; c=relaxed/simple;
	bh=dfjoZScS9ZOqe44JQfBF8wEPZ+pAl5CDH2L/a4RRcvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcnnFkFV7RDqKalN6qrzEW/dpyTRowr4MCIb8jlNFG/r8MWMEnifYMBub56BB1ikiv7n4QwOVtW9oRIZqn1CUlyjTvGH2akEkrJ5bN43x32UHMULlWnQ+fn+Gf9VWrx1eUGiHc0WbUz1pYrhXM8uT8RSWx7Xmk+GdgT3p5zI/Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltk7eIYs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltk7eIYs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83D71F00898
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 19:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790452298;
	bh=dfjoZScS9ZOqe44JQfBF8wEPZ+pAl5CDH2L/a4RRcvI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ltk7eIYspc5iX+WoJuH4deJAsI+v79YNuC2rH5obY7fakhISSa8FM202OswthfePR
	 7DiuSUOodmpxB97bybC/s+iqKw9gj/Pb+2gyGPmgkm/KivUC4RMh4ktIM6Ure4Zg0a
	 wqdpAr2FX7Ymx9mJDs2WCMgA0cTijrW3FnrdJ52HgJOHBrJSzVtTibsQVt60+Pep5R
	 v3wPI4/REMflYCfIxraiJqn6JFdmDMZAhtzupgNMahzxUp0swC7ztcT3bNPu144180
	 N8A/aOnmTvDVIiudJF5PbQGfz6jf78ONVhpx6ySb2oBQE/XplvWzYAylUs/URSMCsR
	 kJt6ULNAHPN9w==
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2dca989afcso19606666b.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:51:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxEdhhSAvRnj8doAecNvTU3MQSzOy0qsVOpMxCmUqxFhbjRhfQCReznVhd314tJ0EWvVv8gTvNaX0STRPo=@vger.kernel.org
X-Gm-Message-State: AFuF++mHUreOErMIQxFvcm99lScs9zHAtM891tiIMqK/o/7boMjA5vBQ
	Nqni3iVzict4IFe0xtA7yKe0FSWjvRM0yVxav3mKYm7btqe/C0zKGV4QwYqKbO23EpavXUQ18Sp
	dnnmwoRsoGl0qaUQ1XCJ5bCjVEmUQy/SQ5TqxPpz1FQ==
X-Received: by 2002:a17:907:8908:b0:c26:3424:f7df with SMTP id
 a640c23a62f3a-c2ac24d3e8fmr788004566b.30.1790452295952; Sat, 26 Sep 2026
 12:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <20260918180241.3424851-2-nphamcs@gmail.com>
 <CACePvbVaDNspMDSw_qAcapKAzXj3JGV-KMYmow7aePa0POHpSg@mail.gmail.com>
 <7571f005bca65aa4ad5e7ec89e62801ad058b689.camel@surriel.com>
 <CACePvbV-tazW=LmsbUtAhHzR2d6JwFT5R1jYZ9_NTp1hxXH=bw@mail.gmail.com> <CAKEwX=NbD12FfApEb9g+3Gt_-Rmof0tovYZsxPPyk5TCbFq=Lw@mail.gmail.com>
In-Reply-To: <CAKEwX=NbD12FfApEb9g+3Gt_-Rmof0tovYZsxPPyk5TCbFq=Lw@mail.gmail.com>
From: Chris Li <chrisl@kernel.org>
Date: Sat, 26 Sep 2026 09:51:24 -1000
X-Gmail-Original-Message-ID: <CACePvbW2rejcNUhK7AG7xLv1C9PmdmdF+uvkV1665BYwG-GNBw@mail.gmail.com>
X-Gm-Features: AclHuK-xpiJYlVPsv444_ENhKedDDd2x3kiC91E8lDWQNSSouldPc5mcq4B4NH8
Message-ID: <CACePvbW2rejcNUhK7AG7xLv1C9PmdmdF+uvkV1665BYwG-GNBw@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
To: Nhat Pham <nphamcs@gmail.com>
Cc: Rik van Riel <riel@surriel.com>, akpm@linux-foundation.org, kasong@tencent.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, yosry@kernel.org, david@kernel.org, 
	muchun.song@linux.dev, shikemeng@huaweicloud.com, baoquan.he@linux.dev, 
	baohua@kernel.org, youngjun.park@lge.com, chengming.zhou@linux.dev, 
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, qi.zheng@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
	baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
	skhan@linuxfoundation.org, kunwu.chan@linux.dev, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:25=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrote=
:
>
> On Thu, Sep 24, 2026 at 6:17=E2=80=AFPM Chris Li <chrisl@kernel.org> wrot=
e:
> >
> > On Thu, Sep 24, 2026 at 8:13=E2=80=AFAM Rik van Riel <riel@surriel.com>=
 wrote:
> >
> > Yes, but it will pay the price for going through the unnecessary
> > redirection layer always. It incurs performance and meta data
> > overhead. That was one of my previous objections to the earlier vswap
> > version. Sorry I enjoy micro optimization too much, that is both my
> > strength and weakness.
> >
> > >
> > > When everything in vswap, we don't need to test for it.
> > >
> > I've been there and done that, the result was pretty bad in those
> > earlier series.
> >
> > > Handling the details of what's behind the vswap would
> > > be handled one layer down.
> > >
> > > Chris, do you think that would be cleaner?
> >
> > If it can wrap below the swap_ops, it is just priviate inernal dedail
> > of implementing its own indirections. That would be much cleaner. That
> > is what I am trying to pitch to Nhat in prevoius email but does not
> > have following actions.
>
> Registering vswap's operation as into swap_ops isn't too hard. I
> frankly don't see much wins to it for vswap itself, but it's not hard
> to do if you like it.

I am offering these as ways to move forward with vswap. There is
always the alternaive to use xswap instead.

>
> What I'm disagreeing is treating it as "just another swap device". The
> implementation shares a lot of swap device's machinery, so I have
> don't mind adopting it, but you can't treat it like a normal swap
> device, and expose it to userspace like one. You get issues with
> allocations internally, and externally you give userspace a vector to
> misconfigure with device priority.

I'd like to hear more about this. If a user wants to shoot themselves
in the foot. My philosophy is just let them. It is not worthwhile to
complicate the code path. We can add a big fat warning that
"Oh, you are configuring xswap with a priority other than the
recommended one." But if the user really wants to do it, we should
allow it.

Another use case is when users employ more than one swap device to
reduce swap device lock contention. It is not a big deal when you swap
out a few GB of memory. But if you swap out more than 100G of memory,
the swap device lock contention really shows up in the earlier version
of the swap core. The new swap allocator and swap table significantly
reduce that contention. But that contention still exists. A few
hundred G of memory under one lock is just a bit too much. I think
there is a legitimate reason to use more than one device to reduce
lock contention.

Granted, other ways exist to reduce lock contention, but they increase
code complexity as well. The current swap device design is a good
balance of code complexity and flexibility.

> That's why I've been insisting on what's the use case that motivates
> these aspects of the interface that you're interested in. A pretty
> design is not a real usecase, especially one that creates problems
> with userspace misconfigurations.

Points taken; this isn't enough to justify the extra maintenance and
complexity of vswap right now. A cleaner alternative exists with less
complexity overhead.

Chris
