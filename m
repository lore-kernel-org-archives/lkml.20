Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17FE43DEBA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075088; cv=none; b=g7QZWINC0n35NGMebHnL6RMqxXPAjegmUntJFKG1jlfk2LnlB+JxiWl/jZGkeOZK/HRNYUjnC1EgRNdmKFb1JHlSW2HVVS9duDdeFIijlQPouJJkqR517Qmx3V9UwdB5gJLniz40URQb4hIOwH47QYhWx4+oLaDnk0Zz9K/Sq+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075088; c=relaxed/simple;
	bh=F9HgVcWPXpU8hJ9oNZYqhSMCDj8N62eZk5P035qTYQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayy7nwV2/NJrqXx2aPgucaSxkG/MIkdpX+oO30HKkOPNDhpxf3uDkWmR8OZENcRHwVl2QZRCNyzkq6hHwwfh4s0V47qrMyfwMl6kwONNwY9JdQ5tyLX87eS0nOOy9/UTFh6G1yur3uN+n4xaaQiOwZChotdBagxzRKXTNRZomJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lb3K4ynJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lb3K4ynJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48589798dbbso161549f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789075079; x=1789679879; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5aCQnhClDl9eNpW8F+cN6KkIYA0TsSlZlvTBInA/6z0=;
        b=Lb3K4ynJNVElpJ39InDMIJ5MPmOErz8P5gGHc/P7yDveW8t1MBr8LGQ0TVmswVRUn9
         kh0lZjvIHPtGKsEmxMt2YVTB1/e0W0j2JT27xtQXfB8vjLzJVO+yAO0TDDj1YzpTsQ81
         KB2GGQK+iqOvE8uv/ORla2V/JBorE4pfHNB5FHEu61rux1yRVMDkx3Q27eH9BvCGtJNe
         aLvOJGX82fYex/RNyYWv/yBVSRAiONrlf/4dlJd3/vApU2lUyK65uTZ5kO1c+VrszTCf
         eJprpDWPpWd7+OVnGkogfO9CUw2PkrXQM6WBtHJAKLs/xeHlrI57bjTPAHHMzS6L0SPA
         M3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789075079; x=1789679879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5aCQnhClDl9eNpW8F+cN6KkIYA0TsSlZlvTBInA/6z0=;
        b=fdDA3mxvgG+pYbv8lKSU2jgEqE2ipgxBAfcKwhiXEVei+lJAGdNkjcP8bwvTnkvjIe
         VqvIjQ6BtMXtqou+aqVddPe477UtpdUVdzqUHU6Il/Xvr92j0NObiQ0FpgzC+OJ73iHl
         tUANg1u5yD8XnsiNy47iCUSu+cBfjPQYaHLuS6+8K49mqvqTpJjLVCv0ByFxtvEsiBCz
         bmW8+h3ruOPlKaVmhfUz7RozTudnMgNj5zthzglCa9MTcfKiMihHkZadXKXoqqCGdGp2
         LApiKIePiHZ7THcF+57QW4DXvn7sJzNyVtTNrKqclfgQY10roHkRl3fclT79zuUYORJQ
         tvYw==
X-Forwarded-Encrypted: i=1; AKwUvBzYzQMHPlNiZmcv+Sw8nJmoG3iy3ES6SWAPj4YfaMmGR5jcKEFj1CM5HmKeQsviXcHesAw+STLXKNzMNDQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lDIwZTB570MdIUmJl486G/nRoDLuJkDgzrSsUVsiT1ZxVJfJAF
	juphDqW5wfLPHECGD3uFg6E7nnmtSMEWIcWMlMWPf6aJcpYlHot2TuEj5IrvmacI
X-Gm-Gg: AYBFou16XC5ur6o1zbAMu8mUaAUl2hIrXdzW1FhykO6ElmjV4cxt5yEleP6fp/0rd+M
	JhZp3iUXuMvV7UiG+M1loxvkT8AeKHMvjaadYi1yEmDGR4XCphKqVATDlTPmiJApiN/0aZwdAJr
	k12rnE6SBUQjLf7eyNR9/C0thZ40DkAJGvqbgsXP/c/1hT/eHEm+z7iq34Ac+2bYqqQiKShobMe
	EviX7mf3tFydx8cDRHqul/PyOMs+M7vAgeaA6q7kr3hiLIpoe6Wju9Pp0xZ4jXisgIBwQTqqiMN
	CMf2Zd2343QkEQtd7maMEBrjsDS00PGytjcnaGeXN3NueELWGH52K2bF+YfZ4oZNM+y55IxlCwX
	BEYECOsijud82sD+seb5Bxc7/nFYtUxRZtZNZ2fHbM9N9E8GtLYYMEulh2lZaT1tOxNC8AugRrS
	m7VS1aPESxYtgA5I71ZhZB5KLBSd4WSPz9c0N8AsDBTLhrJ5nwPL7rG58gtBrktVrel135Z8jXN
	zg0i25+kaRDC4gNhY53py4HpouzjRldgI2riHmssfAfY14oWVEFTl5ne0K14WsARJ9THBeO26XR
	kQ==
X-Received: by 2002:a5d:648f:0:b0:484:3310:f395 with SMTP id ffacd0b85a97d-486eb308d7bmr760212f8f.24.1789075078967;
        Thu, 10 Sep 2026 14:17:58 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm1112262f8f.5.2026.09.10.14.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 14:17:58 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <55e18f27-0ba1-433e-b4dc-a7db70172f7a@gmail.com>
Date: Thu, 10 Sep 2026 22:17:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] kconfig: warn about malformed KCONFIG_PROBABILITY
 values
To: Dmitrii Tulnov <tulnov.dl@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: jacmet@uclibc.org, yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <71d40a5d-21a7-47ae-aa18-34f640a08779@gmail.com>
 <20260910120442.26-1-tulnov.dl@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260910120442.26-1-tulnov.dl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/10/26 13:04, Dmitrii Tulnov wrote:
> randconfig checks the numeric range of each probability but does not
> validate where strtol() stops. For example, KCONFIG_PROBABILITY=50% is
> accepted as 50:0:0: the '%' is parsed repeatedly as zero. For the
> documented value 50, tristate y/m/n probabilities are 25%/25%/50%.
> With 50%, both y/m probabilities silently become zero, reducing the
> coverage of random configuration builds. Empty fields and extra fields
> are also accepted.
> 
> Warn when the value does not follow the documented decimal format. For
> malformed inputs whose parsed probabilities are in range, preserve the
> existing interpretation unless KCONFIG_WERROR is set. In that case, exit
> with an error before writing the configuration. Leading whitespace and
> signs are accepted by strtol(), but also trigger the warning because they
> are outside the documented format.
> 
> Keep the strtol() result as long until the range check. This rejects
> out-of-range values that narrowing to int previously made valid, such as
> 4294967296 becoming zero on a 64-bit host, regardless of KCONFIG_WERROR.
> 
> Add regression tests for one warning per malformed input, preserved
> configurations, KCONFIG_WERROR, out-of-range values, the supported
> probability formats, and the documented empty-value default.
> 
> Fixes: e43956e60769 ("kconfig: implement KCONFIG_PROBABILITY for randconfig")
> Assisted-by: LLM
> Signed-off-by: Dmitrii Tulnov <tulnov.dl@gmail.com>
> ---
> Changes since v2:
> - Move the expected tristate distribution into the problem description.
> - Simplify the initial format check to !isdigit((unsigned char)*env).
> - Pass probability values and seeds through conf._run_conf(extra_env=...).
>   Use monkeypatch.delenv only to remove inherited variables.
> - Add -0, +0, bare + and - warning cases, and the +101 range-error case.
> - Honor KCONFIG_WERROR for malformed format warnings, as discussed with
>   Julian. Check unset, empty, 0 and 1 flag behavior.
> - Compare 50% with 50:0:0 and -0 with 0 across 20 fixed seeds and check
>   that each malformed input produces exactly one warning.
> - Clarify that compatibility applies to malformed in-range inputs with
>   KCONFIG_WERROR unset; values previously accepted by narrowing now fail.
> 
> Changes since v1:
> - Warn about malformed in-range values while retaining their previous
>   interpretation by default.
> - Warn about leading whitespace and signs as undocumented input.
> - Clarify that 50 gives tristate y/m/n probabilities of 25%/25%/50%, and
>   compare it with the equivalent input 50:25:25 across 20 fixed seeds.
> 
> Validation on kbuild-next, x86_64, GCC 13.3.0:
> - make testconfig with HOSTCFLAGS=-Werror: 138 passed. With the unpatched
>   conf: 74 failed, 64 passed; failures cover missing format warnings,
>   unchecked narrowing and ignored KCONFIG_WERROR. The previous v3 draft
>   fails only the nine strict-mode regression cases; 129 tests pass.
> - ASan/UBSan at -O1, with leak detection disabled: the same 138 tests passed.
> - Both v3 builds matched the submitted v2 on 1,635 inputs: 916 accepted
>   values and 719 range errors, with KCONFIG_WERROR unset. Each also matched
>   the original on 380 documented-input comparisons with fixed seeds.
> - Each build passed 120 strict format-error checks: no output created in
>   a fresh directory; existing .config, .config.old and input files stayed
>   unchanged, including with KCONFIG_ALLCONFIG and KCONFIG_OVERWRITECONFIG.
>   Valid inputs, range diagnostics and other configuration modes were also
>   checked with KCONFIG_WERROR set.
> - The probability tests also passed with conflicting probability and seed
>   values and KCONFIG_WERROR=1 inherited from the test runner's environment.
> - make defconfig, allnoconfig, allmodconfig and valid randconfig passed.
>   KCONFIG_PROBABILITY=50% now produces a warning and remains compatible.
> - No vmlinux build or boot test; this changes the host configuration tool.
>   32-bit hosts and other libc implementations were not tested.
> 
>  scripts/kconfig/conf.c                        |  16 +-
>  .../tests/randconfig_probability/Kconfig      |  12 ++
>  .../tests/randconfig_probability/__init__.py  | 137 ++++++++++++++++++
>  3 files changed, 164 insertions(+), 1 deletion(-)
>  create mode 100644 scripts/kconfig/tests/randconfig_probability/Kconfig
>  create mode 100644 scripts/kconfig/tests/randconfig_probability/__init__.py
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index fe8ba09b0..ca6d9d735 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -186,12 +186,23 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
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
> +			if (!isdigit((unsigned char)*env) ||
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
> @@ -227,6 +238,9 @@ static void conf_set_all_new_symbols(enum conf_def_mode mode)
>  			perror("KCONFIG_PROBABILITY");
>  			exit(1);
>  		}
> +
> +		if (warned && getenv("KCONFIG_WERROR"))
> +			exit(1);
>  	}
>  
>  	menu_for_each_entry(menu) {
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
> index 000000000..76fc39c94
> --- /dev/null
> +++ b/scripts/kconfig/tests/randconfig_probability/__init__.py
> @@ -0,0 +1,137 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +"""Validate KCONFIG_PROBABILITY without changing the supported distributions."""
> +
> +import pytest
> +
> +
> +@pytest.fixture(autouse=True)
> +def clear_werror(monkeypatch):
> +    # extra_env can set strict mode, but cannot remove an inherited flag.
> +    monkeypatch.delenv('KCONFIG_WERROR', raising=False)

Clearing this environment variable doesn't belong here, it should be
part of scripts/kconfig/tests/conftest.py.

- Julian Braha

