Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226273;
	b=dsolViZsFn3mS29m0atH+QWYZneOzoJMv61J+q/bg2tfohJuPHVXBU0GF//BOPaRXwPU
	 GkxIdHxsyqRUGNnw9KLKvlmR34p7CY8gh6It+OC8RFwXq77BcjNDXpomXCD7XKoqQu7AX
	 KJpayGX1urWjXrHlV7KpwnfwuHjtHjMUO4RMppFn2blZrrml/KA2LufgqbSWJf+DTgbp6
	 x/g+wcxGqbtfS5ydDznXq8nGskXO93nOHVnBctcBwyXLhvXyMQuuQiDim//QOTx5wNwY0
	 Eh/+rMvGk/KwLDr6gU2a8O+AQDwsI38UpZ1D7p5k75EdGQjAeHm+eFHo9e/X8XJ4htg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=tgxmkN4SDhT3DVX1MkqJXs2K3p5W6sK2g9lAo+MIV18=;
	b=jGmnxXSsbFOi4eslBPgqws25t4XH5BAv/950+bNH2u+Pt8A/HcVvURYq4uwBs/d6Z8Fo
	 D4KQepQc3OdGLVOzVKGl7fFCyIWWRcvrDk4C079Wl1hilIh4wt88aCQzXtYHXwTV3M/eS
	 q9+KpUSD2uAtEzFdhvW4cWixy/9u+0vqIRMDYLnwvKUZ1S/IGMEgkHgHTL8hG8jT4mhZg
	 GLyFaZK9E8MUqB+Md6TURjYPo568lODLtT4vwbghhUVtEBCiNnrzBo0r3LtjUBEzj6EJf
	 s5P3rq+b9ErD1yq67EEXs0xje01PgtxLvQdHDo5zZPmOTUlgMRdjIkuDC9fNEWYZgtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MW0YKzdX;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A0B606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43A0B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MW0YKzdX
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so6357765e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794226271; x=1794831071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tgxmkN4SDhT3DVX1MkqJXs2K3p5W6sK2g9lAo+MIV18=;
        b=MW0YKzdX88e0qiRGhc2GPKOo9KUhLdFdfcW9GCF7jSYRzx/wX2+BmX6r5f75wna+ey
         4AqDkEY3PnOF6EwLkUzwtFytC0yvy8OrPa0lh0+EoTIi3NQHr2Uhb1BVo0mxIAmt+Tkd
         6kEkZhpkw4FpdczlMOWnMNWTzlyrrc0RptPGw9E9umKVUTSN85qO17JVjnaOj6OqVIhV
         n/CBhaFSM8b6oAIC0Fvx1ee6PO7ek/uSkBV6E0KA92fAxN4BBanXPeWIdOF3fHpX29OO
         7gjG5CtNG7vyhc07jKxQhAwXSpWiUr8tk0sFh3rS4T3os0rBcf0h7rmoMH09L+PQrs70
         M6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794226271; x=1794831071;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgxmkN4SDhT3DVX1MkqJXs2K3p5W6sK2g9lAo+MIV18=;
        b=sEhhezECMCIankh68e+k73ClcRhEoviq2kzPnLfbYua+BIAiWso9PDpwhk1yXP4Xjx
         4CAv266CebK/QOJKrXied+iHOWUX1Mc8oK/XIET8+TXGPMurOfksApGjFGS7VArCFW0e
         oI7l8hExcb++Rvpj4vkOnK2zQWIkMo6q3DHLjMfaSduTfo7w5pa177wdRItDLKEcZ3AO
         5T8dR2BE2Todvur1efZLjNUU0QbWvsXFwCnurAk7NkM93ij4sx0JWX9yjnFhR2cymRJi
         IJOOG6PfDabwpfDnw47rWBQ2cvT3JWd1WTKC0hyy0vZ+yWPyls1CoeA7QVQr3YwlZlNO
         /jpQ==
X-Forwarded-Encrypted: i=1; AL+hErFpFxEXtEPosGhBRGr2iOkUM0LYlBodDsFP5T6O5hVmQn3SExIQ03NlcxYx8rqzuKSCXOig+ovG0TiLTks=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sHuiTPCmbQEcYo0hTqvgi3mnSEtvJvZ7FxIpQmft9y4lGp+eI
	WTAwWOvqqpVyHQbEeD1RuvzZclRq7NG/NGecxYv8lBvcX9daA3TY6QQ0hU6I0GmesrQ=
X-Gm-Gg: AYBFou055YtcnP84pEW1qEVKXu3DDQBRv2cpPYlke2PpvW/fXJOyNaee/ht5do81BqR
	qzUgT5i5AAO3asnfwj9kuUfk9U0EWBufpy+TKVpn9e4JK0HoOs6XrBP2m8+dBY5Cl9jQnXhnrZ/
	UY+2zl41nA77Wd10kRgp6nlhaWk4V8CpxOGYA4dGtgb0pYPeO0rhiXUt5JKPC4rY4CxF67c11cA
	P9bRq70mOgU10RSlvwIYyDFP2MPPbQ5Lgy+7Ala5TPbhQCnq/2Ky1qCJRGvSGWOHxANTUE3nbUS
	F4zxv/ues5sGuDUjbPLzVjG6XBrnvzkQKoLG/U6LAIrNoGfadEeqmvNJdWfKABH1dcB6ABddqii
	CdYi815zv5/4Zk2q6DCHFAo5T93AqDrIU0nmTJ/koeWzoF3uXiGh5sj+kyAhdepojd97cyVnrWV
	8wSt49MH5tx3I7CjYBEGWGia9Ta2kaZefoaRPowduRaKgeoNJSUddJ7r5JWzBLp/6/dpm6QWj1z
	Wr3LO9R4tzQcBiE3AE1JK87Whi2gZYFdoqcU1cIoTdty2SdHKvi/dMhFCKAhaet7t567NMNe19j
	HLyJt92pvtoQ7DFcWnzDMBQ3Yxs206Ld
X-Received: by 2002:a05:600c:6209:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4b960da4963mr67152385e9.8.1794226271331;
        Mon, 09 Nov 2026 04:11:11 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90ee2b8c0sm149263015e9.9.2026.11.09.04.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 04:11:10 -0800 (PST)
Message-ID: <ecd60873-644e-4b8b-a786-ec84276a99c4@linaro.org>
Date: Mon, 9 Nov 2026 12:11:09 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] perf test probe_vfs_getname: Fix missing debuginfo
 detection
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jakub Brnak <jbrnak@redhat.com>,
 Leo Yan <leo.yan@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>
References: <20261109-james-perf-test-fixes-v3-0-e8d0a65e618a@linaro.org>
 <20261109-james-perf-test-fixes-v3-3-e8d0a65e618a@linaro.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261109-james-perf-test-fixes-v3-3-e8d0a65e618a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/11/2026 10:17, James Clark wrote:
> skip_if_no_debuginfo() looks for the errors that 'perf probe' prints when
> there is no debuginfo in the output of add_probe_vfs_getname(). But since
> commit 92b664dcefab ("perf test probe_vfs_getname: Skip if no suitable
> line detected"), add_probe_vfs_getname() returns early without adding a
> probe if 'perf probe -L' doesn't find the line, which is also what
> happens when there is no debuginfo. The error from 'perf probe -L' is
> discarded, so the debuginfo errors are never found.
> 
> This causes the debuginfo dependent subtests of the
> "perftool-testsuite_probe" test to fail instead of being skipped on
> kernels without debuginfo, because test_adding_kernel.sh calls
> skip_if_no_debuginfo() unconditionally. The other users only call it
> when add_probe_vfs_getname() returns 1, so they aren't affected.
> 
> Fix it by doing a dry run of a probe that needs debuginfo instead. This
> works without libdw too, where 'perf probe -L' isn't available, and also
> avoids adding a real probe just to check for debuginfo. This fixes the
> "perftool-testsuite_probe" test:
> 
>    $ sudo perf test -vvv "perftool-testsuite_probe"
>    ...
>    -- [ FAIL ] -- perf_probe :: test_adding_kernel :: listing added probe :: perf probe -l (output regexp parsing)
>    ...
>    -- [ FAIL ] -- perf_probe :: test_adding_kernel :: wildcard adding support (command exitcode + output regexp parsing)
>    ...
>    -- [ FAIL ] -- perf_probe :: test_adding_kernel :: non-existing variable (output regexp parsing)
>    ...
>    ## [ FAIL ] ## perf_probe :: test_adding_kernel SUMMARY :: 3 failures found
>    ...
>    189: perftool-testsuite_probe : FAILED!
> 
> Fixes: 92b664dcefab ("perf test probe_vfs_getname: Skip if no suitable line detected")
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>   tools/perf/tests/shell/lib/probe_vfs_getname.sh | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/perf/tests/shell/lib/probe_vfs_getname.sh b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
> index 57a59ae7d4ae..98cfb02cf7c6 100644
> --- a/tools/perf/tests/shell/lib/probe_vfs_getname.sh
> +++ b/tools/perf/tests/shell/lib/probe_vfs_getname.sh
> @@ -64,7 +64,11 @@ add_probe_vfs_getname() {
>   }
>   
>   skip_if_no_debuginfo() {
> -	add_probe_vfs_getname -v 2>&1 | grep -E -q "^(Failed to find the path for the kernel|Debuginfo-analysis is not supported)|(file has no debug information)" && return 2
> +	# Dry run a probe that needs debuginfo.
> +	perf probe -n -v 'getname_flags $params' 2>&1 | grep -q \
> +		-e "^Failed to find the path for the kernel" \
> +		-e "^Debuginfo-analysis is not supported" \
> +		-e "file has no debug information" && return 2
>   	return 1
>   }
>   
> 

Hi Namhyung,

This patch causes a shellcheck issue with certain versions. Not sure if 
you applied it already, but I'll send another version anyway:

   In tests/shell/./lib/probe_vfs_getname.sh line 30:
add_probe_vfs_getname() {
^-- SC2120 (warning): add_probe_vfs_getname references arguments, but 
none are ever passed.


