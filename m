Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DBD3955D1
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458728; cv=none; b=mtlAC/dtBezCnQrOAQ+rHV3z72HC2Cemrdhj+V7YItGJTnVKR5BuqTtVFvSkvh8w+4zkVluzrM3RdVJkR1zXrVzl2j0Wu49Q8F8S95CKX9KL6wOhvYHEMhFyqWZi7KSXqskE4Y8D6D+FbaB9el7qJ9k9CY58RL6pB7/31PkWJrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458728; c=relaxed/simple;
	bh=nUrrJ67BvVR5ReXOWw06MC+NIt4Yqnp5jRGHZjfrxAw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=R+gjZ9/pTu26G7hS3gidL9bpfCLEJRweQgXt6LDbG0n9FhxW1gGlStH/w2y68PIzJLXOwNgHrsnh37FyCL6SRwNPtfMNgmEAorVxs7q6MeMWOn+GOmVXz96axKs9+i7BuBYoQ3uc3u9j6mP2c3AdY1Yh4ZcSKtGY2OAyfjRk4VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKOgCUBl; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKOgCUBl"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so2705685a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789458725; x=1790063525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=InihkQshOO4cHzIVJSU1wlqwaITpxYmllW34k3TOqVo=;
        b=GKOgCUBlhvAOZxYTpENTtNzGYQDf+waVYTfMFec7GM+fuIBB0KsJxlYoc5/UPafxlR
         byBO5PvsmhRgYjoBXKKTjrtQ+J2EzGa1LFYLqnjHRFg7PtS9uTO53gZgBEKPa8VHOyA5
         MxG0YFAXbrBFNfFW6fAy98LF2cWwN8tQJPSre1fe9npmQac2J7by265amyIzVbvgjK2V
         oyxlpGcJSYCXkAptbBMovyaKQyyvkEu84x2GNPrUwJE3rPBh6TKJD97kz0jFjknpMo5u
         xCow9ZIrqOOgfsVltcNb0BwjD3q7eJB//c2XBFYKeN7LRQt/wWytendQEBVrlB2LQTHW
         qnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458725; x=1790063525;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=InihkQshOO4cHzIVJSU1wlqwaITpxYmllW34k3TOqVo=;
        b=q/Zwb2wz3RzOJyTYe+pV11vXAVoDgQ8ittmKVl/CwCjnbGPv0s2Sz8HA5Eyi6HOOPQ
         aljIBcSwX4xi1ATyqVsJAWM/70+GtMzlEMotT5IogYZAjdMGmDe4n61ybzlRxcRvwaZn
         7LY3g+aLvt2/4mAQZMzMuZE1Ybk9ILwcUmUseIUFAZB64zgvHHq+R84kvZfMar0wDB4S
         GcuZ21UT4c4NZba2aUJvrcGDWc+3GaPWxGT2NzywpAaGdwEN9Eemb8kfwBcsxcp7qw+j
         qoqyx/QfuuLoB1HvpMUlVDRUSXCIH8xge9ObHA14VJ8bJhiNXoq0ukaOBrzwFluB68KR
         IXvg==
X-Forwarded-Encrypted: i=1; AKwUvBwZwk/2I30S4K4f3M8n2oRjIyR4rm3l5pp4zwhHBowTxe6cvqkSsTrgaQ2g2yYkIp3oVTWvw92+gVzZADA=@vger.kernel.org
X-Gm-Message-State: AFuF++kWj1bI+GYW59LDNQpL+jvlOkXZLXNNVCcd9HzPEZ8V+e1fPR8k
	ZrJcAIsiApqWLHpKMdnlvCnapT+p6uBelEipXOa/Ljft0QpLQUg+73qS
X-Gm-Gg: AYBFou38G/dBHWw2RL7uNrONxHoIfrpedpdHMtDi6JgZMJnqoAWW6J22P2jG2sPGt1o
	HpBjQ7PEWUYMB6bWyjtvFpBlWXVYukZ4Dad+FKGm8P/ujcw9BYBkOFhQsF8VEsTgTbBelSEySKA
	7onbiG3ipvQJN1Em/gQ6e8Pap/opkOV43kbwwFGCG3UbDMhc1ElPton1rf2OROxq/P+gh1swYbG
	N0hbVZhjkSSwprWWt2UFTcpVb7Kr7WdueXOAQI+IlxAo2yo7VBYK2QFbft75DDPulQo/GJwTUkc
	JXXIUf0srbB5C27pRscGgFEFzfRM/YyfnQufiajkCRby3BrNaBLmKDLLm/fo8S0DAr8jsxWHrm9
	sEthOmTUgzhop4L4j5okkwMQeQWASyE02ddNZiJ4lpg6bvawXir+1cgeD7RI+9YBkQN3SlAN4Nq
	4fcKWwZ01n6J3sN1KTsiVTLu03ie0F35kEgDUhXICjwj7ZhSauIvzYVldkcZFtvU4XFyRS19DRa
	BT/DTbRrIB6JKGIaMOV4C8XfNWn5kOMEJDdotvZ/Z6w
X-Received: by 2002:a17:90a:e704:b0:39a:e002:f192 with SMTP id 98e67ed59e1d1-39dec0d27f3mr13913010a91.22.1789458725101;
        Tue, 15 Sep 2026 00:52:05 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdb3045bsm4141912a91.17.2026.09.15.00.52.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 00:52:04 -0700 (PDT)
Message-ID: <b5df5eee-661e-4f46-9abf-1bd9cec8069d@gmail.com>
Date: Tue, 15 Sep 2026 16:52:03 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH v2] docs: sphinx-pre-install: warn about unsupported
 Docutils versions
To: Masaharu Noguchi <nogunix@gmail.com>
Cc: Chen Miao <chenmiao.ku@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20260914-docs-sphinx-pre-install-docutils-v2-1-6a2a6deedd19@gmail.com>
Content-Language: en-US
In-Reply-To: <20260914-docs-sphinx-pre-install-docutils-v2-1-6a2a6deedd19@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 14 Sep 2026 19:35:40 +0900, Masaharu Noguchi wrote:
> Sphinx declares the range of Docutils versions it supports, but that range
> does not always describe what its LaTeX builder can take: a distribution
> may relax the upper bound to ship a newer Docutils, and Sphinx 9.0.x
> declares support for a Docutils its LaTeX builder cannot cope with. Either
> way the pair installs happily and htmldocs builds without a complaint, so
> nothing looks wrong until pdfdocs is run, where four of the books fail:
> 
>   ! Dimension too large.
>   \fb@put@frame ...p \ifdim \dimen@ >\ht \@tempboxa
>   l.86321 \end{sphinxVerbatim}
> 
> That is arch, core-api and translations; admin-guide runs out of TeX
> memory first and stops 13 pages in, and fails on the same boxes once given
> more.  Each of the four includes a large literal file whole; the one in
> core-api, memory-barriers.txt, is 3016 lines.  Docutils 0.22 is what puts
> those blocks into sphinxVerbatim rather than sphinxalltt, and
> sphinxVerbatim is framed, so they hit the size limit of
> sphinx-doc/sphinx#3099 [1] -- open since 2016 and fixed only in Sphinx
> 9.1.0.  None of the three is at fault on its own: it takes the Docutils
> version, the Sphinx version and blocks this large.
> 
> Keeping everything else fixed -- one Debian 13 container, one TeX Live, an
> unmodified texmf.cnf, one kernel tree -- and varying only the two Python
> packages:
> 
>   sphinx   docutils   core-api   admin-guide
>   ------------------------------------------
>   8.2.3    0.21.2     ok         ok
>   8.2.3    0.22.4     FAILS      FAILS
>   9.0.4    0.22.4     FAILS      FAILS
>   9.1.0    0.22.4     ok         ok
> 
> The 9.0.4 row needs no help from a distribution: 9.0.0 through 9.0.4
> declare "docutils>=0.20,<0.23" themselves, so a plain "pip install
> sphinx==9.0.4" resolves Docutils to 0.22.4.  Fedora 44 reaches the same
> state from the other direction, shipping Sphinx 8.2.3 -- which declares
> "docutils>=0.20,<0.22" -- patched to accept "<0.23".  Upstream ships this
> sort of work in a new minor rather than backporting it -- the Docutils
> 0.22 support went out as 9.0.0 after a backport to 8.2.x was asked for and
> declined [2] -- so neither 8.2.x nor 9.0.x will grow the #3099 fix in a
> point release.
> 
> Check for it, since sphinx-pre-install exists precisely to catch a
> documentation build environment that will not work.  Ask the interpreter
> behind sphinx-build for its Docutils version -- a venv and the system
> install can differ -- and warn when Sphinx is older than 9.1.0 while
> Docutils is 0.22 or newer, naming both ways out -- a newer Sphinx or an
> older Docutils.  Only warn: the build is left to proceed, and htmldocs is
> unaffected.  The bound Sphinx declares is no use here: it is either what
> the distribution changed, or, for 9.0.x, wider than what the LaTeX builder
> delivers.
> 

As this is expected to be resolved in Fedora 45, I didn't see much
point in adding this warning.  I now see Ubuntu 24.04 LTS has the
problematic pair of Sphinx and docutils ...  So it might be worth
to have. 

That said, with your approach, under a build env with a problematic
pair, this is what you'd see in "make htmldocs":

$ make htmldocs
Warning: Sphinx 8.2.3 with Docutils 0.22.4 produces
   broken LaTeX for the large literal blocks in this
   documentation: pdfdocs will fail. Building them needs
   Sphinx 9.1.0 or later, or Docutils below 0.22.
   HTML builds are unaffected.
[...]

I think this can annoy people who only care HTML docs.

Why not do this check after the PDF doc builds have actually failed.

That is what sphinx-build-wrapper is doing with LatexFontChecker().check()
(see line 557 of tools/docs/sphinx-build-wrapper), which is to
show the way to work around PDF build errors caused by "variable font"
flavor of Noto CJK fonts [3].  (Fedora and openSUSE have started to
deploy such fonts in 2024.)

[3]: https://bugzilla.redhat.com/show_bug.cgi?id=2271559

Regards, Akira

> [1]: https://github.com/sphinx-doc/sphinx/issues/3099
> [2]: https://github.com/orgs/sphinx-doc/discussions/14055
> 
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
> ---

[...]
