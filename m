Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A51E4AE11F;
	Wed,  2 Sep 2026 16:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366641; cv=none; b=rfpbP14vmnr3HM1VGJMzI39r0jqulDCjGMiNzyluipS778BZxTIElID7paR5dPzeLbDgGpJqTfeoc5mJB9vCMdr1kkPtEFGiA1WxTqqo21j+1vpDnfwL9Fgaxb8w+eLY3tHCP2nyhF3B2kuYziuvDyrdnJbGT53x0djfQBzZwf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366641; c=relaxed/simple;
	bh=gpC5ZiBGjaDQqEnj2oX/OvZPKfPRuYEsn4XR7DgxsAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MYU74lOkuOAvrCooAot/O3v343qURs0/1koZT0ZmbTdXmwQco11TGuZwdtdUkBi/f6efKRY862GfGrlKfOFPRnEVvRxyTcklgkb9c5CIaZMtl020B5OWY557YQERwXP6vGg18opuS23LuQ3PS+4XV7alQeQWZCcZhLiFrjmjt0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Hlu91US/; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Hlu91US/"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hZpB15HQGz92sj;
	Wed,  2 Sep 2026 18:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788366633;
	bh=gpC5ZiBGjaDQqEnj2oX/OvZPKfPRuYEsn4XR7DgxsAA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Hlu91US/GbZbA+txNh7K6RX51/p3A73VoDLp97GFzKxgV0kbUjsp1mWg81dxUx/Te
	 Hz5Bs0N/MJZkaSe+H9TPOz9nt3+YrOCktyVfMiS0B7EHCc7rDVsmjFIQ71ptJNJJUH
	 ZZ0AWLec3lqD+PiE3a9BI+gsl6vwAJMbkdXRYo1b2Ns8o533rbG0KZDPE7pMh26huB
	 VUkjMpejxLpiJWohIdtakq0FXiYxYXDvVMj6lJTDbhroWN6TYvEVqmewoHiHCxE01m
	 HIbKgynnntGdxUKKZeqr8Wjc5h5kY9qtSdUuZWOsytzHv2lNQ6kivIIwgSQ6u4M4X/
	 ehDNxO74zZzTg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hZpB14bdNz81Cg;
	Wed,  2 Sep 2026 18:30:33 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hZpB10cJDz8tGh;
	Wed,  2 Sep 2026 18:30:32 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 3095A5FA40;
	Wed,  2 Sep 2026 18:30:32 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=linux@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c6487243-0cf6-425a-8992-399aa802ed1a@leemhuis.info>
Date: Wed, 2 Sep 2026 18:30:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: verify/bisect: fix typos
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260902115121.687986-2-manuelebnerli@mailbox.org>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20260902115121.687986-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178836663256.869430.7707921782653846286@mxe9fb.netcup.net>
X-NC-CID: UEYq8+Plf4isYD+0ZzWapn/0UtW6CNznDT+3Ux1RpYe7062a+cc=

Thx for doing this, much appreciated.

On 9/2/26 13:51, Manuel Ebner wrote:
> 'your' -> 'you have'
> 'kernel kernel' -> 'kernel'
> 'your' -> 'you' twice
> 'if is not listed' -> 'if it is not listed'
> 'hay attention' -> 'pay attention'
> remove needless "'" in sphinx link
> 'as disabling then will reduce the consumed disk space'
>               vvvv
> 'as disabling them will reduce the consumed disk space'
> 'You for example might' -> 'For example you might'
> 'and not from a one that' -> 'and not from one that'

Pretty sure the above won't fly as a patch description, as it should
describe the changes, not list each of them, as that is visible from the
diff already (even if that's slightly hard for text-only files).

For typos and grammar fixes there is not much to say, so maybe just
state that; but you might want to look at a few recent changes in
Documentation/ to see how other developers approach a situation like this.
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> [v2]
>  + one more 'your' -> 'you'
>  - 'it'
>  + incorporate Randy's suggestions
>     https://lore.kernel.org/all/0475c09c-e165-41a5-b654-5c6aefeaab0b@infradead.org/
>  + Reviewed-by: Randy Dunlap
> 
> [v1]
>  https://lore.kernel.org/all/20260829055501.581856-2-manuelebnerli@mailbox.org/
> 
> Wouldn't it make sense to add how to skip pure documentation and formating
> commits?

YMMV, but I don't think that's worth it. It is easy to get wrong,
doesn't matter much at the early steps of a bisection, and means one
more instruction to describe for people that do that for the first time.

> Commits like this one. Or is it better to keep the document short
> and simple - which it already isn't anymore.

Feel free to suggest something to remove or rewrite parts with less
words -- in separate patches of course. I know my writing is pretty
verbose, sorry; partly that's my style, partly it might be because I'm
not a native speaker, and partly it's like that because I know about too
many corner cases that I try to prevent users running into.

> ---
>  .../verify-bugs-and-bisect-regressions.rst    | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> index 7d38393f31f..9296e3f5410 100644
> --- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> +++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> @@ -163,7 +163,7 @@ will be considered the 'good' release and used to prepare the .config file.
>       section 'Complementary tasks: cleanup during and after the process'
>       below.
>  
> -  d) Once your finished the bisection, put a few things away::
> +  d) Once you have finished the bisection, put a few things away::
>  
>         cd ~/linux/
>         git bisect log > ~/bisect-log
> @@ -178,8 +178,8 @@ will be considered the 'good' release and used to prepare the .config file.
>         ./scripts/config --set-str CONFIG_LOCALVERSION '-local-cafec0cacaca0-reverted'
>  
>      This is optional, as some commits are impossible to revert. But if the
> -    second command worked flawlessly, build, install, and boot one more kernel
> -    kernel; just this time skip the first command copying the base .config file
> +    second command worked flawlessly, build, install, and boot one more kernel;
> +    just this time skip the first command copying the base .config file
>      over, as that already has been taken care off.

I'd move the "over, " to the previous line, as the formatting otherwise
looks odd. Not strictly required and makes the patch slightly more
complex (so might not be the best idea, but I think it's worth when it's
just one line).
>  * **Complementary tasks**: cleanup during and after the process.
> @@ -229,10 +229,10 @@ depends on your issue:
>  Execute all steps till the end of *segment 1* to **verify if your kernel problem
>  is present in code supported by Linux kernel developers**. If it is, you are all
>  set to report the bug -- unless it did not happen with earlier kernel versions,
> -as then your want to at least continue with *segment 2* to **check if the issue
> +as then you want to at least continue with *segment 2* to **check if the issue
>  qualifies as regression** which receive priority treatment. Depending on the
>  outcome you then are ready to report a bug or submit a preliminary regression
> -report; instead of the latter your could also head straight on and follow
> +report; instead of the latter you could also head straight on and follow
>  *segment 3* to **perform a bisection** for a full-fledged regression report
>  developers are obliged to act upon.
>  
> @@ -550,7 +550,7 @@ be a waste of time. [:ref:`details <introlatestcheck_bisref>`]
>        cd ~/linux/
>        git switch --discard-changes --detach stable/linux-6.1.y
>  
> -    Your series is unsupported, if is not listed or carrying a 'end of life'
> +    Your series is unsupported, if it is not listed or it is carrying a 'end of life'

Correct me if I'm wrong, but isn't the comma before the "if" wrong (not
your fault, it was like that before your change already; but would be
good to fix while at it)?

>      tag. In that case you might want to check if a successor series (say
>      linux-6.2.y) or mainline (see next point) fix the bug.
>  
> @@ -1183,9 +1183,9 @@ Space requirements
>  The numbers mentioned are rough estimates with a big extra charge to be on the
>  safe side, so often you will need less.
>  
> -If you have space constraints, be sure to hay attention to the :ref:`step about
> -debug symbols' <debugsymbols_bissbs>` and its :ref:`accompanying reference
> -section' <debugsymbols_bisref>`, as disabling then will reduce the consumed disk
> +If you have space constraints, be sure to pay attention to the :ref:`step about
> +debug symbols <debugsymbols_bissbs>` and its :ref:`accompanying reference
> +section <debugsymbols_bisref>`, as disabling them will reduce the consumed disk
>  space by quite a few gigabytes.
>  
>  [:ref:`back to step-by-step guide <diskspace_bissbs>`]
> @@ -1254,8 +1254,8 @@ distributions:
>        kernel-install-tools libelf-devel make modutils openssl openssl-devel \
>        perl-base zlib-devel rpm-build ncurses-devel qt6-base-devel
>  
> -These commands install a few packages that are often, but not always needed. You
> -for example might want to skip installing the development headers for ncurses,
> +These commands install a few packages that are often, but not always needed. For
> +example you might want to skip installing the development headers for ncurses,

I think there needs to be a comma after the "For example" (also a
earlier error).

>  which you will only need in case you later might want to adjust the kernel build
>  configuration using make the targets 'menuconfig' or 'nconfig'; likewise omit
>  the headers of Qt6 if you do not plan to adjust the .config using 'xconfig'.
> @@ -1407,7 +1407,7 @@ Occasionally odd things happen when trying to use a config file prepared for one
>  kernel (say 6.1) on an older mainline release -- especially if it is much older
>  (say 5.15). That's one of the reasons why the previous step in the guide told
>  you to boot the kernel where everything works. If you manually add a .config
> -file you thus want to ensure it's from the working kernel and not from a one
> +file you thus want to ensure it's from the working kernel and not from one
>  that shows the regression.
>  
>  In case you want to build kernels for another machine, locate its kernel build

Ciao, Thorsten
