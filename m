Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405093FCC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998729; cv=none; b=Lk8AUafjhM5hEL0JexClFnCIdnWND9aR8sfUuv/l5/5GPcFXqSGH41DHqtYXlq/+YBVKNi1a8EQ4vUYeZ3O3w/dj+xW8Ps2bb5z9FkK6nDc21IHadVzr7eeASLkJZZ1HFiOxVtU/qfRsEh/ab95WJrT6B5uZYZwjii9UkJ2+6FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998729; c=relaxed/simple;
	bh=aR0+8yQ6qie6njOcmw65DGioCP0iccIP1IUhgdEZZBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y6KpGHGNUILYysMHAnOVvXlYPHGcvrwaDATkjlvBmZ77SxkUmu3t91H4SPhW7vpcYzntaYOxy2CYny3+L8qBa1Qnt92wuuUvd0VYafRFa4TJi5pLvXg6LZ1g+0NYrfdyD4FHHc20QtFYvMerC3jb/+5/HOWa2guN2bpHS61MfTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2H1EZ48; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2H1EZ48"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so700553f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 17:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788998726; x=1789603526; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MkuZjw5eDGUjlp1TTmJ/AW6kHmyHaaRrgH/UE88Mn8=;
        b=i2H1EZ485nuXarCUOd6vbxADXvrfyibFmNPi6xr3DQTKnT9HozvB4Sk1FgapJMHXpB
         +NUK1FDyCLSM0K20J+idbfyKj6vSrEb/C8pzW0xOQNoMDIw5WnaPA0nl5+R1VzN6Escd
         ntGMdxWgT9DC4UlbxiFc9YdmWTHelc7CWdqVuCSgAX554UuaboTZ61pCPXyEW9Tw+2eu
         xGCGVCF8Wb/XmrV5TTLaKce+eaxC5M9Z4+zk7Jc0WsxJ+WB7r5vDch2ukMbblXe+I4ke
         pTLji2ZGyXSaDTsXCFUUUZs6JY6tTK8kkLqEqz2yKsqOdc7gnrcLSK7UKWoJBO7Hu7hJ
         DeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788998726; x=1789603526;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/MkuZjw5eDGUjlp1TTmJ/AW6kHmyHaaRrgH/UE88Mn8=;
        b=CvTVi7PCOKmVtxeSpCj/fad+9+R9Z0D6nYTOZQiZJ29VSmOfFRd8cT+Cqi3ytVu86N
         MgXp+zbx47fxuAznJkSxy09k22pc/rba03AIuBvRch4ADl54ZhpYWeZm3FL+mokcN9+/
         VQIzuBUkdFN6Tk+gYOTGS+DxTfj2XpF+hs2M3ZjqiJuiq1YJefKnpda0Lwr2lIUW3x/H
         eIC68w03xlh50wwwFVlImA7nZ0UzXuzvxVBVQfPfyr3g+64PfWIsdR52kny65XXbMxDe
         AvzOq5BRfR5hXJHoSMKh9SVZ/5KScTrhQ5oAsYhbtozwG94hZqnXniHfwBh6nTd6cVLw
         xSbA==
X-Forwarded-Encrypted: i=1; AKwUvBzCWhf51jl13prQRE0n5HTRbyz6o4ZbvA+J62o1o8R1cVXMlkPnrOpJmK+8WhWMilbYBzAnV6LyRe6bPRE=@vger.kernel.org
X-Gm-Message-State: AFuF++nk4sqsSXoJuV91uEI/lxx668vjnQiBFz/wA3jEz9KB+JE08ehm
	gIpAnJtA+21b2fI6fRvoxWtCOpMWDlXllMpS+bNYmL93cyo1LNda7he2
X-Gm-Gg: AYBFou01Z4Kuvpr6+etTutd5tswPH7z5CNiSTNY5/mq3OWqyMbhmoWErWomRjH9ipiv
	5LSnRX6WstvV3fRpYzkhUyfRDItJMhLTfsFD0aSrdT4ixvAtbhX2hPprsG98qy73CDfC8m+emlj
	7vHZeMFi5NTTHKtGSBPHA2M0NgHaGdVFb+JQulLjWhuCAcpVugtkyIWT1X7JK1zHW4pA1hR0+as
	P9T4jqgKlTV7cs3zTRondf7SyXgQjfx97mIkR+uCXfzELM+Hv7WUX0bpt1hPdB234URafJjuKTH
	5l3uVuJyu2UZ9SEcia3aG12bZRcRJZ7ME4owgZiw/b25DQ4QAYnxCDGcGaIqumsxEFuIZ6D2DuX
	rw0+VkTiDeEvZctzit6cVl51oo/QsAi2lyXvSoAyR8Gh/eR9DD8+kW+b2RDOdaRnVW1oDAhsQxN
	MXPBwbYYcc05vNj/BGDdO1O1hFH293xl3DQuQc9i9m/MzNx3FcYT4NQdNnCJm8Qo3HdrIiKZMQy
	MSaLvvFJnsaj285Nzb+YOFj6KPP11gcjj0RHeHgre/IphHwLS2B1S8tEuQwABEokr0=
X-Received: by 2002:a05:6000:4a0f:b0:485:877d:ea8e with SMTP id ffacd0b85a97d-485c23d101fmr9118139f8f.14.1788998726167;
        Wed, 09 Sep 2026 17:05:26 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883a9b49sm39540921f8f.17.2026.09.09.17.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 17:05:25 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <a6171a9b-de34-45c2-90a3-4e5bc185e700@gmail.com>
Date: Thu, 10 Sep 2026 01:05:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: warn about malformed KCONFIG_PROBABILITY
 values
To: Dmitrii Tulnov <tulnov.dl@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Peter Korsgaard <jacmet@uclibc.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ce0786a7-e48d-4d7b-b601-86a598bb03d1@gmail.com>
 <20260908203621.4-1-tulnov.dl@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260908203621.4-1-tulnov.dl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitrii,

On 9/8/26 21:36, Dmitrii Tulnov wrote:
> randconfig checks the numeric range of each probability but does not
> validate where strtol() stops. For example, KCONFIG_PROBABILITY=50% is
> accepted as 50:0:0: the '%' is parsed repeatedly as zero. This silently
> sets both tristate y/m probabilities to zero, reducing the coverage of
> random configuration builds. Empty fields and extra fields are also
> accepted.
> 
> Warn when the value does not follow the documented decimal format. Keep
> the existing parsing behavior for now so that users depending on these
> inputs are not broken; the warning can be promoted to an error later.
> The documented one-field value 50 gives tristate y/m/n probabilities of
> 25%/25%/50%. Leading whitespace and signs are accepted by strtol(), but are

This "25:25:50" explanation belongs in the first paragraph where you
give the background and state that "KCONFIG_PROBABILITY=50% is accepted
as 50:0:0". Your second paragraph is about what you're changing.

> also warned about because they are outside the documented format.
> Keep the strtol() result as long until the range check so that narrowing
> to int cannot turn an out-of-range value into a valid probability.
> 
> Add regression tests for malformed warnings and out-of-range values, the
> supported probability formats, and the documented empty-value default.
> 
> Fixes: e43956e60769 ("kconfig: implement KCONFIG_PROBABILITY for randconfig")
> Assisted-by: LLM
> Signed-off-by: Dmitrii Tulnov <tulnov.dl@gmail.com>
> ---
> Changes since v1:
> - Warn about malformed values while retaining their previous parsing behavior.
> - Treat leading whitespace and signs as warning-only undocumented input.
> - Clarify that 50 gives tristate y/m/n probabilities of 25%/25%/50%, and
>   compare it with the equivalent input 50:25:25 across 20 fixed seeds.
> 
> Validation on kbuild-next, x86_64, GCC 13.3.0:
> - make testconfig with HOSTCFLAGS=-Werror: 78 passed. Malformed values now
>   produce warnings while preserving the previous parsing behavior; numeric
>   range errors remain fatal.
> - ASan/UBSan at -O1, with leak detection disabled: the same 78 tests passed.
> - The fixed build accepted 916 of 1,635 generated inputs (including
>   warning-only malformed values) and rejected 719 numeric range errors.
>   It matched the original on 380 documented-input comparisons with fixed
>   seeds. Range errors preserved an existing .config, including with
>   KCONFIG_ALLCONFIG set.
> - make defconfig, allnoconfig, allmodconfig and valid randconfig passed.
>   KCONFIG_PROBABILITY=50% now produces a warning and remains compatible.
> - No vmlinux build or boot test; this changes the host configuration tool.
>   A 32-bit host build was unavailable because multilib headers were missing.
> 
>  scripts/kconfig/conf.c                        | 14 +++-
>  .../tests/randconfig_probability/Kconfig      | 12 +++
>  .../tests/randconfig_probability/__init__.py  | 79 +++++++++++++++++++
>  3 files changed, 104 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/kconfig/tests/randconfig_probability/Kconfig
>  create mode 100644 scripts/kconfig/tests/randconfig_probability/__init__.py
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index fe8ba09b0..33e8baf8d 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -186,12 +186,24 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
>  
>  	if (mode == def_random) {
>  		int n, p[3];
> +		bool warned = false;
>  		char *env = getenv("KCONFIG_PROBABILITY");
>  
>  		n = 0;
>  		while (env && *env) {
>  			char *endp;
> -			int tmp = strtol(env, &endp, 10);
> +			long tmp = strtol(env, &endp, 10);
> +
> +			if (endp == env || isspace((unsigned char)*env) ||
> +			    *env == '+' || *env == '-' ||

This condition expression is pretty long. You can simplify this:

  endp == env || isspace((unsigned char)*env) ||
  *env == '+' || *env == '-'

into:

  !isdigit((unsigned char)*env)

> +			    (*endp && *endp != ':') ||
> +			    (*endp == ':' && (!endp[1] || n == 2))) {
> +				if (!warned) {
> +					fprintf(stderr,
> +						"warning: KCONFIG_PROBABILITY has malformed format\n");
> +					warned = true;
> +				}
> +			}
>  
>  			if (tmp >= 0 && tmp <= 100) {
>  				p[n++] = tmp;
> diff --git a/scripts/kconfig/tests/randconfig_probability/Kconfig b/scripts/kconfig/tests/randconfig_probability/Kconfig
> new file mode 100644
> index 000000000..84f4e5fcc
> --- /dev/null
> +++ b/scripts/kconfig/tests/randconfig_probability/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config MODULES
> +	bool
> +	default y
> +	modules
> +
> +config BOOL
> +	bool "Bool"
> +
> +config TRI
> +	tristate "Tristate"
> diff --git a/scripts/kconfig/tests/randconfig_probability/__init__.py b/scripts/kconfig/tests/randconfig_probability/__init__.py
> new file mode 100644
> index 000000000..ff1770608
> --- /dev/null
> +++ b/scripts/kconfig/tests/randconfig_probability/__init__.py
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Validate KCONFIG_PROBABILITY without changing the supported distributions."""
> +
> +import pytest
> +
> +
> +@pytest.mark.parametrize('probability', [
> +    'invalid', ' ', '50%', '50 ', '0x32', '10 20', '10:20x',
> +    '10:20:invalid', '10:20:30x',
> +    ':50', '50:', '10::20', '10:20:', '10:20:30:', '10:20:30:40',
> +    '+100:0', ' \t100:0', '0: \t100:0',
> +])
> +def test_malformed_warns(conf, monkeypatch, probability):
> +    monkeypatch.setenv('KCONFIG_PROBABILITY', probability)

You should set the environment variables using 'conf._run_conf' instead
of 'monkeypatch.setenv'.

For an example, see the test in:
scripts/kconfig/tests/warn_changed_input/
and how it uses 'extra_env'.

> +
> +    assert conf.randconfig(seed=0) == 0
> +    assert 'warning: KCONFIG_PROBABILITY has malformed format' in conf.stderr
> +    assert conf.config is not None
> +
> +
> +@pytest.mark.parametrize('probability', [
> +    '-1', '101', '0:101', '0:0:101', '60:41', '0:60:41',
> +    '4294967296', '-4294967296',
> +    '999999999999999999999999', '-999999999999999999999999',

It would be good to include '-0', which is the only negative input
accepted before this patch.

Also you should include an instance with '+'.

- Julian Braha
