Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2EF35DA6E;
	Mon, 14 Sep 2026 05:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364533; cv=none; b=bMs8g45TzJOeJgnC1TX0k8xCO5phKblVIDlK4GrgYLViV5en7YDHNlImtVXhPIhE2odaWkukYQV3Z2DVQJl2X//0GhCkjebbcigL30lXhRj9XAEsdRQpaZ29X97o5oYfWFB1Kt999HS2aet6Jla2RxjqSB3isiO8Ra4ItFlVpK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364533; c=relaxed/simple;
	bh=Gt5cghmkYsHcaGUT0bLK7DMeg9MMat7CQl1r/928wks=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D3DCaXsbTQVzELu4Ubbcmy3/i9lZ7z4WIikM2WUIQedRywB8kgYFGa/XPisZ1w42PWquNHMwXWEDlu7jpY5ldiaxy5XvSca7zBmmtIz0nSu4UZmyNvsl6Ya6HrAuBLxM7sIiYIluQ9zFp5+HtCSRrgUutjE7BtRMvFOolQnCrTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l3rRNL/e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l3rRNL/e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A2B11F000FF;
	Mon, 14 Sep 2026 05:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789364531;
	bh=9WTOweRXQqxPe57Hlf8rF5/p1907bUJYule3AADKIQo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=l3rRNL/eppw0Z/mn5NwrbZudnGzqSuza0Z7RLhbTikAIn9RoaNSx+ZzOQK5Wztcdd
	 EsKDSHqiQxcnYKYcs3QlzuNvT9cOAzTFQYErVLwERPdjD04wuhRaKaMLWcCy22seGo
	 25tgQafUn1n5c+cdETurg4ZmZqN9tA13r73419tnFdlMW8GjGa717DPXl1qvrH0C8t
	 SzPF4hqIkNIrl2RQH9wphlvbLqipNejJmXnn24ZoZYLXGzDzxkszNcdaXvu2xK6qAp
	 0q2h0Lht7nSQA7mgrEAwv2xKQmbBcYk/fx//WMgQB6XiHZ4tg9WL9RJPUUUS4SUWEl
	 CCPRJxbIsBHRg==
Date: Mon, 14 Sep 2026 07:42:06 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Masaharu Noguchi <nogunix@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Akira Yokosawa <akiyks@gmail.com>, Chen Miao
 <chenmiao.ku@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: sphinx-pre-install: warn about unsupported
 Docutils versions
Message-ID: <20260914074206.05579309@foz.lan>
In-Reply-To: <20260913-docs-sphinx-pre-install-docutils-v1-1-d923c769af91@gmail.com>
References: <20260913-docs-sphinx-pre-install-docutils-v1-1-d923c769af91@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 13 Sep 2026 12:13:23 +0900
Masaharu Noguchi <nogunix@gmail.com> wrote:

> Sphinx declares the range of Docutils versions it supports, but a
> distribution can relax that upper bound when it wants to ship a newer
> Docutils.  The pair then installs happily, and htmldocs builds without
> a complaint, so nothing looks wrong until pdfdocs is run.
> 
> Fedora 44 ships such a pair: Sphinx 8.2.3 (which declares
> "docutils>=0.20,<0.22") is patched to accept "<0.23" and is installed  
> alongside Docutils 0.22.4.  make pdfdocs then fails to produce four of
> its books.  admin-guide runs out of TeX main memory 13 pages in:
> 
>   ! TeX capacity exceeded, sorry [main memory size=6000000].
>   \sphinxafterbreak ->\copy \sphinxcontinuationbox

With some distros/versions, it is needed to change a config file
to use more memory. On Fedora, the limit is here:

	$ grep main_memory /etc/texlive/web2c/texmf.cnf
	% main_memory is relevant only to initex, extra_mem_* only to non-ini.
	% Thus, have to redump the .fmt file after changing main_memory; to add
	main_memory = 6000000 % words of inimemory available; also applies to inimf&mp

I haven't tested but it seems that there's a way to adjust it when
calling LaTeX:

	https://tex.stackexchange.com/questions/7953/how-to-expand-texs-main-memory-size-pgfplots-memory-overload

If so, maybe a more interesting patch would be to adjust pdf generaion
to use a more reasonable memory limit, as 6GB sounds too little.

> while arch, core-api and translations stop on
> 
>   ! Dimension too large.
>   \fb@put@frame ...p \ifdim \dimen@ >\ht \@tempboxa
>   \end{sphinxVerbatim}

This is also another parameter that may require adjustments.
If I'm not mistaken, this is related to the maximum level depth
on titles. I had to change some limit from 7 to 9 on some distros
in the past. I don't remember exactly where.

On both cases, I don't think you can blame docutils or sphinx
version: those are distro-specific configuration parameters.

> Both come from the large literal blocks those books include whole --
> memory-barriers.txt, devices.txt, kernel-parameters.txt and
> arch/sparc/oradax/dax-hv-api.txt.  Keeping everything else fixed and
> varying only the two versions shows that neither component is at fault
> on its own:
> 
>   sphinx   docutils   core-api   admin-guide
>   ------------------------------------------
>   8.1.3    0.21.2     ok         ok
>   8.2.3    0.21.2     ok         ok
>   8.2.3    0.22.4     FAILS      FAILS
>   9.1.0    0.22.4     ok         ok
> 
> Sphinx gained Docutils 0.22 support in 9.0.0 and upstream decided not
> to backport it to 8.2.x [1], so this pair will stay broken rather than
> be fixed in a later 8.2 point release.

Upstream policy AFAICT is to not backport anything: once they release
a new major or minor, they stop maintaining the previous versions.

> Check for it, since sphinx-pre-install exists precisely to catch a
> documentation build environment that will not work.  Ask the
> interpreter behind sphinx-build for its Docutils version -- a venv and
> the system install can differ -- and warn when Sphinx is older than
> 9.0.0 while Docutils is 0.22 or newer.  Only warn: the build is left to
> proceed, and htmldocs is unaffected.

I don't mind having a warning, but I don't think you can blame
docutils or Sphinx versions on both cases, as the error is related
to LaTeX. It sounds to be this is actually a combination of those
three packages plus some distro-specific latex cfg settings on
some of the shipped files.

Thanks,
Mauro
