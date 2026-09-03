Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAEF40DB27
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429224; cv=none; b=CuGjGqxePl45waoU8EP57Z/aOw0KQoJ9v+eNZmhRZZYYfUBNlEfGJYn16vbFzr1UNdHQmq0V7F6TGBJ1zeDOfnmW7+buv7KiISqM4ZSnxGZu9MsIdQNLXaWRxhrT6UA2QwrVaztRmx4UFuTZLg14IA/u3cus2TQun1Pre3MKh38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429224; c=relaxed/simple;
	bh=n1/oASmskaKb4TsNyOYMfthg/1r5aRlEXI5W1jIUH+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dQCR/CPr2cq4VQxUG8Lrks82/YwATW+vKDd5300voQXu0WoHWGM0ybDkoz9AMS/GvGAUAJHKb7MTnOGKXLzel1AY/QmVXk12eLHLL5rdxrWkXXpmxq9RHB21yJfyv89k+zbNfH2kE81Kqh31MJlqWpFx/A+ra3c17YHVK/70XqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NLq3ID7q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NLq3ID7q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B48871F00ADB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 09:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788429222;
	bh=n1/oASmskaKb4TsNyOYMfthg/1r5aRlEXI5W1jIUH+s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NLq3ID7qomrpEicl7Svgl27Pfcm1MOzPSQq+TmuZOZulKLCHi2DolCibki9OBqnS/
	 Mc9zagXCHlPCwo8srvdflY6bs653i7/+NQ84V7IWpW05xYpW4mMewG0mdLg+tTq5w6
	 fJbBUS1J6SD6ajHrlboMRyPO4UvGCntbRSVslDcDz6ioU6DzqxLH/h1TncwOgaH2jp
	 Tlq0EYigqggrWW4K1u2RN9z62GLO0tgzynP53kVI1uQh/Cycif+rgkL3H8WCFughD2
	 SvdYmnbMzWU9+zrktu07Rs3sZwZXXg17isk2+wpjqPuCK5gLM1/npTGTsDgBbUryAF
	 uVRZJeevzhyWA==
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-936e8bd9caaso194083985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 02:53:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwPurJCKUQVdOUDoCS96hAhd5QMOfK9+2DlpIXTus0Sx2HBUW2FfpAiFhQlKgjOSyDgVeUXJcMVIkS+P94=@vger.kernel.org
X-Gm-Message-State: AFuF++lQAwXJrHrjRreR9Au9Xcc9k7EB21zeD1ZcW+HS3SBp2H12nY2l
	6jtkOF6BsAOi9mbf1bfYTSDWKJsKS727OOgdMvOvemAt/4CWwrs5IeVcGjThevXLudEjEBSf8DP
	5VvTsEdxgbCeBtJysflS5xuUZ95ZHwxU=
X-Received: by 2002:a05:620a:5ee1:b0:939:6de9:4cff with SMTP id
 af79cd13be357-9396de96ebbmr435711985a.45.1788429221948; Thu, 03 Sep 2026
 02:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903092200.88910-1-christosskarlos.kernel@gmail.com>
In-Reply-To: <20260903092200.88910-1-christosskarlos.kernel@gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 3 Sep 2026 17:53:30 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yym2=iQdG0O8VZAAt-peB+0hoBUMf8rjpA966V6p0TGQ@mail.gmail.com>
X-Gm-Features: AcwNN1UMw0DE17Op2qfHPQ76NzPZzsK2TCPKbbNYcvIiaGvhscL5UNOsV5_q-9M
Message-ID: <CAGsJ_4yym2=iQdG0O8VZAAt-peB+0hoBUMf8rjpA966V6p0TGQ@mail.gmail.com>
Subject: Re: [PATCH] mm/huge_memory: fix various coding style warnings
To: Christos Skarlos <christosskarlos.kernel@gmail.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	ziy@nvidia.com, baolin.wang@linux.alibaba.com, liam@infradead.org, 
	nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
	lance.yang@linux.dev, usama.arif@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:25=E2=80=AFPM Christos Skarlos
<christosskarlos.kernel@gmail.com> wrote:
>
> Resolve coding style issues flagged by checkpatch.pl Specifically:
> - Add missing blank lines after variable declarations.
> - Remove unnecessary braces {} for a single statement block.
>
> No functional changes are introduced.
>
> Signed-off-by: Christos Skarlos <christosskarlos.kernel@gmail.com>
> ---

LGTM,

Reviewed-by: Barry Song <baohua@kernel.org>
