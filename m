Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3093F3262;
	Wed, 14 Oct 2026 21:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014379; cv=none; b=ozhvDxxKVkee/QCMbehC+Rrnlq5e+RlXbZ42EPO0IliGdHNS6EVnPnqxu3Y3duAbQBC5EWBwyJhaz7VAb7s3C6mYvMmlXSoSBvIYiPPOrNOA5B5ye62x4AEVAdEJ1sJvgNPY96+rBhHDwggx+usrLcrCHLzbu9nJzsk+NLbONzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014379; c=relaxed/simple;
	bh=hZut//Xx+l9RxmIHLIKH7Yyaj9YU0xfc0s6fkT3nMjg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qFaIcYOZIvwAkO/B16u2Uei6tKeXYsZZDeq6kNK0/1Rgoqm1ePF8Bxd28NykiJQLXV2m0vc9m12/ve70JMXKkMQz9fl1tTAmi2rpKRWCl5ZZSJLONpicEmmSrxNWwQ6RqFLE91Zl/7eWM2YuRvj4wqcxxUiueNGYy+g298GebE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VKRoFtoc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VKRoFtoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAED31F000C4;
	Wed, 14 Oct 2026 21:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792014377;
	bh=YfJ8+/3QIwqU1lGorx+YrqBuJSjEBiyJMaSGuM2nwbI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=VKRoFtocC8e+DKO5Tj2qOISiXq8XaBsBbawEyA83WN7u9DLyRRn754J9coiC/AZFA
	 0dtnHaup00gPCC0+q02RsrM/L2GAx3VgAWH5r8pFFrpDBl/goR2MWd+Qdt0UF7mjx2
	 VsdGhFQQU9JT9jRqJLZADZU6AAmvc+rDa8CCWIlU960jYSv2+JSMGgYqwImUgQOwzO
	 65wXeMR4Fw+4v1Z+xQcSeiTl1GRj+Ds5b4dcHUeKKQ8tCRluHlyyI7WYtUfGEnvcBt
	 9mNVeS/QrZP7V4KV34MdwWLbz6mFuWz3OCKpOwmdT+Whrw0fgMtdH5xhpWrSZMwe33
	 76O8LOhXGaWLg==
Date: Wed, 14 Oct 2026 23:46:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Jakub Kicinski <kuba@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: kerneldoc.py: preserve headings in kernel-doc
 output
Message-ID: <20261014233956.605e0960@foz.lan>
In-Reply-To: <8733u8w6p4.fsf@trenco.lwn.net>
References: <20261002230114.39651-1-kmehltretter@gmail.com>
	<8733u8w6p4.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 14 Oct 2026 11:08:39 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> Karl Mehltretter <kmehltretter@gmail.com> writes:
> 
> > kerneldoc.py parses extracted ReST into a detached section node while
> > retaining the surrounding title hierarchy. Docutils 0.21.2 silently drops
> > affected sections; 0.22.4 reports:
> >
> >   Documentation/networking/kapi:107:
> >   ../include/net/net_shaper.h:75:
> >   ERROR: A level 3 section cannot be used here.

The backward-compatible fix is to ensure that the title markups will
be used on a consistent way, e.g., if:

- level 1 uses "====\n" + title + "\n===="
- level 2 uses "===="
- level 3 uses "----"
- level 4 uses "^^^^"

at the main doc, the kernel-doc tags shall follow the same schema,
e.g. if they are included at level 3, it has to use the level 4
markup.

So, in the specific case of kapi.rst, you can't use "====" nor
"----" inside net_shaper.h, as those are level 2 and level 3.
so, it has to use, for instance, "^^^^".

Yet, it is hard to make this on a consistent way and keep it
maintainable. The best is not use titles inside kernel-doc.

> >
> > The same issue drops three Xe DRM RAS headings already in mainline.
> >
> > Use nested_parse_with_titles() to give kernel-doc output an independent
> > title hierarchy.
> >
> > Fixes: 2404dad1f67f ("doc: Cope with the deprecation of AutoReporter")
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > Tested-by: Randy Dunlap <rdunlap@infradead.org>
> > Assisted-by: LLM
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> > ---
> > Reposted as a standalone documentation patch at Jakub's suggestion:
> > https://lore.kernel.org/r/20260925120152.09ef180c@kernel.org/
> >
> > Changes since v2:
> > - Route the patch to the documentation maintainers without a net-next tag.
> > - Add Randy's Acked-by and Tested-by tags. No code changes.  
> 
> Which versions of Sphinx and docutils have you tested this with?  I
> needs to work across the full range of supported versions...

The minimal docutils supported is 0.16, and the minimal Sphinx
supported version is 3.4.4.

You can use /tools/docs/test_doc_build.py to double check if your change
is compatible with the minimal supported Sphinx/docutils versions.

Just run the script:

	$ tools/docs/test_doc_build.py -b

and wait (*) for it to download supported versions and test if this breaks 
something. Notice that "-b" picks only the most significant versions:

  DEFAULT_VERSIONS_TO_TEST = [
    (3, 4, 3),   # Minimal supported version
    (5, 3, 0),   # CentOS Stream 9 / AlmaLinux 9
    (6, 1, 1),   # Debian 12
    (7, 2, 1),   # openSUSE Leap 15.6
    (7, 2, 6),   # Ubuntu 24.04 LTS
    (7, 4, 7),   # Ubuntu 24.10
    (7, 3, 0),   # openSUSE Tumbleweed
    (8, 1, 3),   # Fedora 42
    (8, 2, 3)    # Latest version - covers rolling distros
  ]

e.g. the ones found on distros up to Fedora 42 and the latest version
on that time.

to be really sure, use "-f" to test all possible versions.

(*) even with the simplified version checks, ti runs for quite a while: 
some versions take ~20 mins to build docs.

-

Jon,

I'll likely submit a patch soon to add 9.0 and 9.1 to the above list,
after finish running the tests here to see if the scripts need other
updates.

Thanks,
Mauro
