Received: from mail-ed2-f27.google.com (mail-ed2-f27.google.com [74.125.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE534BD106
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657115; cv=none; b=d4IjxT9R4G6JTp0Fl86Y+0qtxrTtpBsXb2l+xCEo8yYaWQeDAzUNeg62MGfWbQcxf8/8smbBWr30SXvPlEGIIzRalq7PI0pHbEWVj+Vsx6PGgXr9svyEfESncb+jzhgTG9bb2vBGoSfWoQffQRi69D2LVCZ1i78Y0Y8wg26lO1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657115; c=relaxed/simple;
	bh=BNu7UFYzbciMQngWNhdXe84afMXc5n9xBvAZ7otGnEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ahc32jIJT4XiUwfWC+Xyddnrne0l4gYZYdCxCG8N/GpL0QbtBe+KP9BjcW2QoiCzggC8M2/07FddBgPy0WG7X1IB4D+lxbd7gEt17zK/fnm4pgPpBu7g5c3dvxOHt6x8txzlOFw7KaevcUAVGedThyhLOMotjv8QD4KgZb9vpwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cF73D2rO; arc=none smtp.client-ip=74.125.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cF73D2rO"
Received: by mail-ed2-f27.google.com with SMTP id 4fb4d7f45d1cf-6aa135d6e97so1523129a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789657085; x=1790261885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8geJb//unxMG5/ocZH8skdaBQsZ6P2d8sWowZAb/n3M=;
        b=cF73D2rOi5i34tkeka6aSz9cmZ7LPJIO3qKG9N/hnmQqcducWbXZwftdJmQOqkNTPE
         jIkUjP0yYtFaNjeKS4voiC9qCH+YDtwg+v4+0Ffke3+v596rudYlZrhwbRrF4OgKBtyP
         ATzrLYMj2/btDpIxJylysj5os82ztyepvdN+SJDP/l7F5tIKqIUyjQZZB3YgJlisYBT3
         ksnGRPEf4hlT/xH/jbDCdJHhSrkbAGJT7bPi96F/qUBkLtvDY36421TJz3nyCCsI9Hvv
         b3EbtBq3d0FZLqEdQDnx6QL2Z+8zfsMBIUrZG+GyI2tg+kLvqBVzPdIPeDO9lnkQchTh
         FZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657085; x=1790261885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8geJb//unxMG5/ocZH8skdaBQsZ6P2d8sWowZAb/n3M=;
        b=JSwqTh0faKN0c4DnK6vB9iC0UpRpHDiKpSNoROfoZAFhkk+tgHvprhr3vSa5w1vLd+
         iL9epq538AP/viKj904IfOTiN+/utHAgFURUlXsVTdJO7FaIftkkfSXGkFj4dukPCQSV
         RfwjXBzsEvazqwaFMavZvz8cgTyZnAhVdv6/Vl2olm/w/fS0Sg68lj73vAg0xMPRAlLu
         FZSNuGFR8RV4j6mLexyIozb9REk8etQVWjmXt7GNs/Y/wQjD+PMZHhSDNlRbNmum316z
         P5zfoTL2Po2QC5CvS4ljWkQW2/Kkx0CGzxMbXL6P4N+j2u7tuuWAnt7S9V8tiyXnmVKr
         d4dA==
X-Forwarded-Encrypted: i=1; AKwUvBzGNbDx9E7BtvH74ktBz8bAucwjzU8aBfe4yF5kEKDBRyRUH/HfvNAsSqSgXt+oK3WKb1S/peD5srEbYCs=@vger.kernel.org
X-Gm-Message-State: AFuF++kLvb2ZVFjTwaaVFSoikgI5G+cqv1qXxrs30YTvRD1+rQog+/C/
	/jRIJ9vH7uhaKRmP7l3Bs4SwYnLEuGLaoiT2TLJlkQS8c7wsD/tqlZJVd/ACOCRbB5Y=
X-Gm-Gg: AYBFou1dd24X+LKD8bC4UkcJTw0nVgyhIAxMoCqr75tAJDgYU63cGI5M9+IcihYPtyk
	G+9wIbo0iBAcFuE4ZxC+jg4XuGQkHLdbyazec2TcDcqCskajyX9gr1fsaxWgbOwVeBwXUOEzV3A
	EQHAkQ8h8TcK6mWRcdtwEblZ0RjRPFV+i4zAM2I1jtQwvwqTpd15i6gqRv+lgtEU1dq6RUdA70z
	hCVxBlVOm9hUQ1RWqa0RcC5DT9Q6A4xJ1B26wf9wd1q94jRirP4sTR5tctpSvndvuZsLqdnIxy9
	Now6mcLYwtPR7gQb8tHcoIIsNAYbiBgGY13rOc5K9C1T3XHQTxrQ8UcRgizvThO9Tz2RJiAIhK9
	wdEKzxsu1pD7k4lQOMR0YS0d5OS5HJkDRRdGT8QG278OqTvM7s+BhDj+4jMbp267QfUiKyXIlcT
	HHq+8KMEO4J/eb6AL8TyZkZkJAdYm/al/Infgxf/ePyThvNRmwgiwytD5MZkZtgLXkcxp7S+sW
X-Received: by 2002:a05:6402:a0cf:b0:6a9:cd42:eeae with SMTP id 4fb4d7f45d1cf-6aa224192damr9562008a12.15.1789657084575;
        Thu, 17 Sep 2026 07:58:04 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d228edfsm3954435a12.10.2026.09.17.07.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 07:58:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 16:58:02 +0200
From: Petr Mladek <pmladek@suse.com>
To: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests: livepatch: do not require a kernel build tree
 to run
Message-ID: <aqv_-n4pNKH1CoZ4@pathway.suse.cz>
References: <20260906204932.2343013-1-eva.kurchatova@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906204932.2343013-1-eva.kurchatova@virtuozzo.com>

On Sun 2026-09-06 23:49:28, Eva Kurchatova wrote:
> setup_config() calls has_kdir(), which skips every livepatch test when
> /lib/modules/$(uname -r)/build is missing.

Yes.

> The tests do not compile
> anything though,

How do you run the tests please? I personally do

   $> cd <kernel_source>/tools/tests/selftests/livepatch
   $> make run_test

And it does compile the test modules when they are not available
or when they are older than the timestamps of the related source
files.

I tried

   make TARGETS="livepatch" kselftest

and it does the same.

> they insmod the pre-built modules from test_modules/,
> so the check tests a proxy rather than the thing it cares about.

What do you mean by proxy, please?
What is the thing that is cares about, please?

> That proxy holds only for a source tree or a machine with kernel-devel
> installed. A packaged testsuite ships the modules pre-built and runs on
> machines with no kernel build tree at all, and there every single test
> reports "ok ... # SKIP". A harness that looks for "not ok" then reports
> the suite as passed, so the whole suite silently tests nothing.

Could you please paste the real output here?

I agree that the string "ok ... # SKIP" is weird. It should
either be "ok" or "skipped". But I do not see any related
change in this patch. It keeps:

		exit $ksft_skip

So, the behavior on failure is likely the same. It would be nice
to fix it but I guess that this is a generic problem in
the selftests framework.

> Test for the modules instead. Missing modules still skip rather than
> fail, which is what the KDIR check was there for, and the tests now run
> wherever the modules are.

This sounds strange as well. I guess that it is a problem with
translation. I am not a native speaker but the following would
make more sense to me:

<proposal>
Test for the modules instead. The tests will still be skipped when
the modules are missing. But the tests will run when pre-built
modules are there.
</proposal>

> --- a/tools/testing/selftests/livepatch/functions.sh
> +++ b/tools/testing/selftests/livepatch/functions.sh
> @@ -44,14 +44,12 @@ function is_root() {
>  	fi
>  }
>  
> -# Check if we can compile the modules before loading them
> -function has_kdir() {
> -	if [ -z "$KDIR" ]; then
> -		KDIR="/lib/modules/$(uname -r)/build"
> -	fi
> +# Check that the test modules are there before loading them
> +function has_test_modules() {
> +	local mods=(test_modules/*.ko)
>  
> -	if [ ! -d "$KDIR" ]; then
> -		echo "skip all tests: KDIR ($KDIR) not available to compile modules."
> +	if [ ! -e "${mods[0]}" ]; then
> +		echo "skip all tests: test modules are not built, run make first" >&2

IMHO, "make" won't help when "$KDIR" is missing. I would prefer to keep
the KDIR test as well. I mean something like:

	if [ ! -e "${mods[0]}" ] && [ ! -d "$KDIR" ]; then
		echo "skip all tests: KDIR ($KDIR) not available to compile modules."

>  		exit $ksft_skip
>  	fi
>  }

Best Regards,
Petr

PS: I am sorry for the late reply. We are overloaded. AI helps people
    to write patches. But it is not good enough to help with review.

    Sashiko AI was happy with this patch, see
    https://sashiko.dev/#/patchset/20260906204932.2343013-1-eva.kurchatova%40virtuozzo.com

    But I see it differently.
