Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4FE42FCA9;
	Sat, 29 Aug 2026 23:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788047105; cv=none; b=RmKxu7oO20gw314oMAJqOWI4N/1ndYG8ov5unU0s/bzdFs4NEpODFUuSab0OXxatT9xpSKdrcZX8PIGtA4oSdpseXugC9LKs/ujZw/QenmK3xCS4sbJO7rCLKxiWaQhs000azrLm3oju7LwuFK/HCngvzzTW/uazwDWRfd7gsh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788047105; c=relaxed/simple;
	bh=rdoMO2J7sReJcPLf7gk+06zdhteWzAvHiPOA4c4Wibk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnDe6duuyck2e/jgA7bLXdZDpg5TAdrH66KdsQc7Cm5To6YWBv0kLYhXd0OwNi1tWFsi6ABhKOwQZv+kxLI8b4oFLxvRaWsUThDDfqnvWlUs7Ge8sJ1xr+QGjJFO3m4u2bAGcsyhWKsLi7aQRzfYONKZFFo5J5kX5Lfbn6+nFFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QsvW1XO3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QsvW1XO3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=OKS0Pu27mknuDXj9ShVejMvGoXjwFrIKZvfnem0sSBA=; b=QsvW1XO3RdmIswlnTB5YpRQrdT
	F1AiXQg1wGbGkRudhfEsbvItCyxb5nyxGIF0J+FwP61hoT+M/a4A5ppIxlX0TAl1xXpidba3NUiBU
	NTcJEC3l2R+VJfayvxUfSImJWoz4WKnMyiM4iN6P5+gbUVHlGYkJIXhltYqqD89DU9+0v9ptro+Kz
	ml2mSGGESBaRulDwo3L9/PxgUKmks+P3LyxrUOP2uR9VIHdO8zzRi3bdTfESX2S+83qfizTBgvI5M
	QsKVFobIXXWT7+u7Zfb2ZVksY/hAo97iBKAxcqd0sCEIyF8TaK5wWtw9jKrU7sohO72TFeoZWPnbP
	DsRIGtbg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0SjC-00000007Nt0-1i3R;
	Sat, 29 Aug 2026 23:44:50 +0000
Message-ID: <0475c09c-e165-41a5-b654-5c6aefeaab0b@infradead.org>
Date: Sat, 29 Aug 2026 16:44:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: verify/bisect: fix typos
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260829055501.581856-2-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260829055501.581856-2-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/28/26 10:55 PM, Manuel Ebner wrote:
> 'your' -> 'you' twice.
> 'kernel kernel' -> 'kernel'
> 'hay attention' -> 'pay attention'
> 'as disabling then will reduce the consumed disk space'
>               vvvv
> 'as disabling them will reduce the consumed disk space'
> 'You for example might' -> 'For example you might'
> 'that create or modify' -> 'that creates or modifies'
> 'and not from a one that' -> 'and not from one that'
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> I could't figure out what the "'" is for, they do show up in the .html.
> Would this be a sane change?

I have no idea about the "'" marks. Dropping them LGTM ... and works
in the html.

> @ -1186,4 +1186,4 @@ safe side, so often you will need less.
>  If you have space constraints, be sure to pay attention to the :ref:`step about
> -debug symbols' <debugsymbols_bissbs>` and its :ref:`accompanying reference
> -section' <debugsymbols_bisref>`, as disabling them will reduce the consumed disk
> +debug symbols <debugsymbols_bissbs>` and its :ref:`accompanying reference
> +section <debugsymbols_bisref>`, as disabling them will reduce the consumed disk
>  space by quite a few gigabytes.
> ---
>  .../verify-bugs-and-bisect-regressions.rst    | 20 +++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> index 7d38393f31f..43e15b16894 100644
> --- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> +++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> @@ -163,7 +163,7 @@ will be considered the 'good' release and used to prepare the .config file.
>       section 'Complementary tasks: cleanup during and after the process'
>       below.
>  
> -  d) Once your finished the bisection, put a few things away::
> +  d) Once you finished the bisection, put a few things away::

I prefer:
     d) Once you have finished the bisection, put a few things away::
or maybe
     d) Once you're finished with the bisection, put a few things away::


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
>  
>  * **Complementary tasks**: cleanup during and after the process.
> @@ -232,7 +232,7 @@ set to report the bug -- unless it did not happen with earlier kernel versions,
>  as then your want to at least continue with *segment 2* to **check if the issue
>  qualifies as regression** which receive priority treatment. Depending on the
>  outcome you then are ready to report a bug or submit a preliminary regression
> -report; instead of the latter your could also head straight on and follow
> +report; instead of the latter you could also head straight on and follow
>  *segment 3* to **perform a bisection** for a full-fledged regression report
>  developers are obliged to act upon.
>  
> @@ -1183,9 +1183,9 @@ Space requirements
>  The numbers mentioned are rough estimates with a big extra charge to be on the
>  safe side, so often you will need less.
>  
> -If you have space constraints, be sure to hay attention to the :ref:`step about
> +If you have space constraints, be sure to pay attention to the :ref:`step about
>  debug symbols' <debugsymbols_bissbs>` and its :ref:`accompanying reference
> -section' <debugsymbols_bisref>`, as disabling then will reduce the consumed disk
> +section' <debugsymbols_bisref>`, as disabling them will reduce the consumed disk
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
>  which you will only need in case you later might want to adjust the kernel build
>  configuration using make the targets 'menuconfig' or 'nconfig'; likewise omit
>  the headers of Qt6 if you do not plan to adjust the .config using 'xconfig'.
> @@ -1365,7 +1365,7 @@ Start defining the build configuration for your kernel
>    *Start preparing a kernel build configuration (the '.config' file).*
>    [:ref:`... <oldconfig_bissbs>`]
>  
> -*Note, this is the first of multiple steps in this guide that create or modify
> +*Note, this is the first of multiple steps in this guide that creates or modifies

So you are saying that the "that" clause refers to "first" and that the
verbs should be singular to match "first"?
It has been ages since I diagrammed a sentence. :)
Could the "that" clause be referring to "multiple steps" instead of "first"?

https://www.writecream.com/sentence-diagram-generator/ says that "that" refers
to "steps" so the verbs would be of the plural variety. IDK. [Refer to "ages" above.]


>  build artifacts. The commands used in this guide store them right in the source
>  tree to keep things simple. In case you prefer storing the build artifacts
>  separately, create a directory like '~/linux-builddir/' and add the parameter
> @@ -1407,7 +1407,7 @@ Occasionally odd things happen when trying to use a config file prepared for one
>  kernel (say 6.1) on an older mainline release -- especially if it is much older
>  (say 5.15). That's one of the reasons why the previous step in the guide told
>  you to boot the kernel where everything works. If you manually add a .config
> -file you thus want to ensure it's from the working kernel and not from a one
> +file you thus want to ensure it's from the working kernel and not from one
>  that shows the regression.
>  
>  In case you want to build kernels for another machine, locate its kernel build

All of the other changes LGTM.
Thanks.
-- 
~Randy

