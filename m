Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A619484228
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586953; cv=none; b=TRZN6nlx8lljTDlBXCQmeBK9E2DOxDMZ8y6mfxUCLslGWRvPBq3Onbrvzr5gc3qoJK57/xqUcqkPX96nk2M/+pXYkGzlA1aezgQdcpRpEtpDbCzrgja0qTNg+iTm7uULOPH8lC2ZcE0U2TuJ5IPi1RkTCo8ld7VWvMnMQLBhUUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586953; c=relaxed/simple;
	bh=JHjweW4tKjJzdlaIpmKAFsqozfRQUWPcEqdfjwpoddk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rODWp2TFAOWa1Tys05Zm2wROUnmXEv0eP4+AxDw3E1enYjXhRUxzZIOZcBR6Os1xM6OellyCZ9SV8nuCwYKxtdNcwxs458o9irhnlRxdILS6O/znoF7vX/y1JaOWCzrfqP5URSc5fSeJlnSouCMzjVDlHsQjVqsiiXbSUXcwONU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QmWLroh8; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QmWLroh8"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac6fa788e6so1337152a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790586950; x=1791191750; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/rEuFHJDtEaYDRIoBn4eFmTqqB11z/QrLz8Ps7ePt5c=;
        b=QmWLroh8z5u4qAU/NBLXVMZUSwH6fM52h9L5UUqM6VcfrO28VlU6MHE2bh3ucis/OX
         zjEplXeiko3PjrZL4lPphY2Ra32NV+RMoDp+f5RaqqB7N2B5esuKsowsef9vOH82bwES
         hVotGwYYVt73p8TjHSBVB8E9dN4QgU3fSZgAxaoyGizuiLwFG1N1N/zHuPUPh7HG8snQ
         SazAqgYjWOww80RAYGRDBOA4utPE1RlBFdHj9Ve1nvQWNNm5alvazVu71jL53BYM3qA0
         tJiiZWpR7Dk0JGGOPjFBtetH514hDi9nEPGqpnAN6qZ4soww36abdh+UHP0Mlj6k7Y/c
         hs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586950; x=1791191750;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/rEuFHJDtEaYDRIoBn4eFmTqqB11z/QrLz8Ps7ePt5c=;
        b=NXoH41vPXNkCmVgtY2jBWo8PIULPpY4Wbdorw205+1gfWXWDFGEYXJKEIwFQtzq+Hy
         1q7QrLSmT8k9Mzf8drd5nIKx6QIdT9PH4j429ZgapkGV0JAfL8rKJ5B/ReyvKCQdqCRB
         sRaMPyFin8+jCxUa0aOkLe+R/Spxm2knUWoEGNRy/77kPh56YMCnbd854cHr0MQfGPMN
         FqlB6ulByr9v0WfPI6fjn4mMZcypqLeD4PHhfW0TEwFEl9t4/DbON17CKGc7Od2Pm0nb
         MWWNruy++dR1HJL8aK5E8DSpMf5riqmJ46JXVDo+XUmvT2ty7gsl4lUyy6HZ5CLD3bpJ
         88cA==
X-Forwarded-Encrypted: i=1; AKwUvBy7+7nNaqKMvfTFFgE/YZlUB0khOgJesiUnqFzJExxhlcdgE/DsP0Q7TbRJiuz4W3Xi1M8oTU4wi+oTzRk=@vger.kernel.org
X-Gm-Message-State: AFuF++lhbtL+GEhVrvkLI/Tf9GwGr4/gOdTiHpp5hdkxskAx4JJe14cU
	82f29/dKOWsWIwnKBsjix9aX4UBhkeBatSP38Pw9uVXHoqKZrtGRCi4rbe3fBAIBV/c=
X-Gm-Gg: AYBFou3sV9kSR4kOQ39eGeyMhz2IDxoge2tK6jCcM4Tlzls7L2tpZt3yOoh3XETlCfO
	oaq6sQp5zuLza/TuvSx1l/hKcrb4G7eXtFgCM1x5daawTQjw9GVKvVDesoL9WAZI8BqW/lvdZsa
	Ch5b3y6sFhaQwyIHOjoTfFgOJmdyzBmeTCrShdU0LvuE0Ne67ZwbqEUbQMfzXKIlGwyelhsl2Ap
	weMOuNdbObkRKAhc4x+ixA/ZUSq2LO7ZSqt4HIJpKObvHhOz3qw/90rESN1KBQsSGLugoJGdkYC
	fxyVTBKmrdwLE+SCtp6q0lPHcZZQNEnqtuN5Po2HcgRUCJtigJFF+zOpuJeDKq5bqXmt6ajXvYG
	7FV9eaDD75zG8WCCHQ60acc1W976lluDQBO3deZiZKFsdz61ulv24oFytYA7zoRcdZ2B7A121sx
	dBZd5pxvEPiZdr4G3cP0hxa8KnRysUDTEHx535RqhU/zppQXmOrxMuH8+psyotkComtF4YY1oYx
	VE=
X-Received: by 2002:a17:907:6ea3:b0:c26:1649:47af with SMTP id a640c23a62f3a-c2ac53cb0afmr1026470866b.37.1790586950002;
        Mon, 28 Sep 2026 02:15:50 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2de21a6349sm77293766b.21.2026.09.28.02.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:15:48 -0700 (PDT)
Message-ID: <8bc8b276-bc4e-4a6d-b770-5b02c79946d4@linaro.org>
Date: Mon, 28 Sep 2026 10:15:47 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf build: Improve fix for "argument list too long"
 error
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Markus Mayer <mmayer@broadcom.com>
References: <20260928-perf-orphan-args-v1-1-8cacf784621e@bootlin.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260928-perf-orphan-args-v1-1-8cacf784621e@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 28/09/2026 09:55, Benoît Monin wrote:
> The orphaned pmu-events JSON files are passed to the shell via
> `echo "$^"`, which puts the whole list into a single argument. With
> a long enough output directory path and enough files, exec'ing
> /bin/sh fails with:
> 
>    make[5]: /bin/sh: Argument list too long
>    make[5]: *** [pmu-events/Build:228: prune_orphans] Error 127
> 
> This only happens with out-of-tree builds, when setting O= to a
> relatively long path.
> 
> To reproduce, build once with JEVENTS_ARCH=all, then rebuild with
> a smaller JEVENTS_ARCH without cleaning first, so the leftover files
> become orphans. Using nds32 (which leaves ~1100 orphans), an output
> path of only ~70 characters is already enough to trigger it:
> 
>    OUT=/any/long/path (at least 70 characters)
>    make -C tools/perf JEVENTS_ARCH=all   O=$OUT -j$(nproc)
>    make -C tools/perf JEVENTS_ARCH=nds32 O=$OUT -j$(nproc)
> 
> Express the orphan file list as paths relative to $(OUT_DIR) by
> stripping the common prefix and restoring it with printf, the same
> approach used in scripts/Makefile.clean, so the shell arguments stay
> short.
> 
> Fixes: b6712d91f8f5 ("perf build: Prevent "argument list too long" error")
> Suggested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> Tested-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Reviewed-by: James Clark <james.clark@linaro.org>

