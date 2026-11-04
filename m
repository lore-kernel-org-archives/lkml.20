Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814890;
	b=0dr1HB4hVHl8uokAL7yViBhuzFsEIcl6/75wkIi2BLpUsgbPPxvn7GA9alL+gUxWtKoO
	 W3wrTpyzRMEMzydEIKIgizqWDyObgviJfymbHXJ0j6tI1r79+/33IULWK8Qe3DNb/Fdnt
	 9EPs2U9Sbbn1GXQmPh+c1oWIphw2xp+q5ACetE1Iuv+Lrr2r0UBI3Zcj31y2iO1sTZwwq
	 LNmnJ3CYBewJJ6FUZDLe5l+CyAa5HZbJ7b9Wdb4Q0QDjY80lAjeVI1pdhXwUTgGuNAqtq
	 1m0ovCkQHGDR6vjE6cpUS+cTxT8VP7AwkL1KxuzLAHfm08wL1V5ance0ua6LLFn5qEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3XMRgIjajaQRkvFd53KAJBG+JI2fzjczkpx99FvXAIs=;
	b=hJ6Cn6xEyDSA9qHlZ7Lj0aN+u50mvdN1hv8y9rzEzDBz0QwiYUiTIs4dBBLNA0uHmPk3
	 bgzhQcdif5zy7ICGFnbKEop2KvEY9mbogdwJ30pvgMTzTV0Az/0KXRQsjZA8dXx4E7UqG
	 iiV8MbrJjoIb8Zr4Da/20qBDcKJWQA/Lz+T8OP4vmBrEVvbqsRC3Driq4aUy+9uJ3xh8Q
	 9asO7aGiY8XizruN0cO9p/MWSN2jslTnUCwvUUwMop24iARRVrx6MEWjhYoysDyJ0CQjk
	 Ur0MM+8qaCbTE62Up4GM5WqT539IyWRo17GPwdxYr6ATVbHGvZL4Cyzi/5y8huNfEMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AXaVxpkf;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A9606CFE2
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4A9606CFE2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AXaVxpkf
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso155949966b.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793814888; x=1794419688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3XMRgIjajaQRkvFd53KAJBG+JI2fzjczkpx99FvXAIs=;
        b=AXaVxpkfljM68lxlk7nie9l6HuOHkE/PNgvUOqd7yM4ZRnqrMT7lAX+miAz44WyuEq
         YhtfGBvHhh+jRrta6ETWIq7rPCmIIlJuq2lB6kUpL1ohtfFdriANJrCooZSwtpWAOOPs
         M9wu5yeQyB2sKHtOQavuzzGUSw7i2d1OLxK3swnyfeLybv9RP2KuWjVDlhTJEDb94oS4
         S82blmqu2GrU55nJ8d4Cgr3C4mEyAdhQ0FZthkEzEMGZgjr2dIuaxxvnVcabAHyjGgfg
         +Fil0gqr2iNNqqwYSqtnWnhFyJEUiuqM2e9cxkNYzMrdTlDo4HTDLJEsPwjYOcONv7Nh
         eGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814888; x=1794419688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XMRgIjajaQRkvFd53KAJBG+JI2fzjczkpx99FvXAIs=;
        b=uMYjZ2djFyWi9PjOEpOfQxnlXLofCOYbMHR9DpC5TbiFYZBRlaSTfwophv4AtfJkQr
         oOmI6GnQiZBr03ZNpmg8S3jF2K9dxm7GoRarKD8lRWPPC9xognfaibLC4r2+V7lzsPZf
         y8Ps4dwoGxtdaz7zxO7w0hiGT2D/C1Msx6Y8mHBM3dtVAAQJkww6U3x/AtIssrLTdTzu
         cTJykY05S7Zps0UNnZafaTpEVolTZzgFK27GzCA9iJH3B8pSjmZFXh4M1LSUMGoSiVHw
         87ny1k83KvlyLdciDRkHQ43VwPENGZPNC3otCMTIGsFh3MeaSqwIaAn95HgVMNRO+nNF
         Pw5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJfp4IPHjIPFEGg/I/RiJ7ELzMIRAH8Xf7gPvOI/I80Ms/CqTPxnZMhMatDdj5ZY+Szw57OoYPfbjg+FA=@vger.kernel.org
X-Gm-Message-State: APuU4Z81RFTPLxPtfK2rPqcRVDShaWVhhAueSjAMcyxoA2opBzWZiMyW
	/zEUy3z78XfakExpH5wxxo0ZxmIpxV7wfQoylx65zM6KE5AW4gcplkVsG6D4KNGijOw=
X-Gm-Gg: AYBFou3OpVxwyHmkePbBRyKhMjdJ9InUgd2Ozmvk1tpkaHLiCN0OgoR9YPDMa1cSKvL
	JmluFEQH5jRRFPqVDKtjYNA1sQP+McbyDocSTLKZIcG+T6cOA/fg2L2En9FtbI+6YnuKxVexLav
	J0Tm3xOJJ84wspm1PgZT5tqk7YteoOQRN6BVOZ+Ky9AAqnHTjOK2hX637elSCHE2PU/dkjL/GXW
	YHl76LJVfPT7P0O9OiXhroC1DxbXMwayb+XFXJ6jdZ85oI/91fWaNSsCWOXH0cxQSXj9dJhHIVq
	oX9T3hE70pPpciavipRr0aKU455v/UNcIxjCCn7z94jVbU6KjCAzE8yGBW2h6+NMbaDovVTmkox
	f7+914iSB3A3F+kW+OGT+9GAwEICyehbaGn6NdzvxOdxqvUmvRH7Yun2dTsy4siO13Ry9SiYlVv
	kTefnNBuIfZU5FLbNR0zdRE6QN7+ehWEOlTT5eaoPSgW1GAJ3bEUKqAKjWRjFbEZrIX2eHf0hoX
	jKgNXd0TI12oHiYXYpthq2WvHxHesTdUlY0MFnekhHR1pAiEIBEqPx0QkxHLwI9EkKb1ZQuKzqr
	nd/wzMTRqhtQjIc6BJsyA16GB0KBqLC9
X-Received: by 2002:a17:906:99cd:b0:c41:731c:534 with SMTP id a640c23a62f3a-c4ca7a86e67mr1494767166b.24.1793814887972;
        Wed, 04 Nov 2026 09:54:47 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41e711sm92156066b.14.2026.11.04.09.54.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 09:54:47 -0800 (PST)
Message-ID: <c7c04e5f-2c65-4914-be41-f28365c47d94@linaro.org>
Date: Wed, 4 Nov 2026 17:54:45 +0000
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
Subject: Re: [PATCH v3 05/18] perf test: cs-etm: Increase window size in
 disassembly test
To: Leo Yan <leo.yan@arm.com>
Cc: Leo Yan <leo.yan@linux.dev>, Adrian Hunter <adrian.hunter@intel.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org,
 John Garry <john.garry@linux.dev>
References: <20261102-james-cs-unformatted-per-thread-fix-v3-0-dbcb0c281b9b@linaro.org>
 <20261102-james-cs-unformatted-per-thread-fix-v3-5-dbcb0c281b9b@linaro.org>
 <20261104163657.GJ9176@e132581.arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261104163657.GJ9176@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2026 16:36, Leo Yan wrote:
> On Mon, Nov 02, 2026 at 12:15:19PM +0000, James Clark wrote:
>> When we increase the default timestamp interval in a later commit, less
>> trace will be recorded. At the moment the amount of trace overflows the
>> 64K buffer, so the exit snapshot trace is what happened at the end of
>> the process rather than the beginning. With the new default interval,
>> the entire execution will be contained in one buffer and the first few
>> samples are always various instruction and data faults. These go to the
>> kernel so don't result in ranges that can be disassembled.
>>
>> Increase the window to 6 samples to ensure something with a branch can
>> be disassembled even with the fault samples.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> I don't mind to set even a bigger sample number (like 50). I did test
> and 50 samples just add 0.5s run time.
> 
> Either is fine:
> 
> Reviewed-by: Leo Yan <leo.yan@arm.com>

I quite like keeping it small because it's more likely to catch a 
regression in the decoding. But we can increase it if there is some 
other reason in the future.
