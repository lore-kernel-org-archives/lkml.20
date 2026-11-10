Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307817;
	b=J74wWUPFcezz2oHgN6rBB01YwmhMEghMudud5kpfRryKAn3h9l4TeEzmQQ2W9RTP+j2M
	 GSBkT0aumxJSceL6oN2g+Bqtq1WunNPhJMlEqleCqOVNtg+bqKQkyc/lOpiKVom+G1WxL
	 NoF0ONX+e6p4AP827CrgxxCynF6ni/52/TgnXgUYHn6jRZ67s6B+d06L4xJic9LIMcijq
	 2rTgxQ7So/L1UbCNgDSQOOpqqq+lhvIl+LX653L1pPADM3jrppp6jrUCliL5HlIImsXxp
	 q2OZZsNdjADUD976O1Yq0JxWA7RAZx597XbdBN4v/rHT4pLgbgpnaR9lWWMEAwOgdfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RVTkGzwp8ckIzdQmxfwAcPBKin5d3z25DmdwwACLOEQ=;
	b=aiJuBP7DOHWL9qe8trVuqp8FHTynMbiO6Ord6FlEJS3jTKN0xVHvS7IcrKYMibh7ypMO
	 LXZ9mU3ujOeoN01nD00WUVenWd310k2tG3edLTi2Ah+j+g1HcnDOgrT/p2zztusKFq8N3
	 hlwYzEul1vK5rUiEJl+KOy7sDlhUwMUs3WnIrzvhIwaa3Jy+0bM6/daG4aHhZFPaa5gBd
	 Mx6cZsAiUipCYjUaqKH/4tJTGXZkNGW0oOjt2JhVywVbYlyDwFOImkt3psqZfAM7BnvRz
	 mgj3D0PUaBn7id+9dRWndjDvqQKjEX7a7cBxRGUMECiZucoS8bp5vJdCvygAhK7zJMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="P/jUBQCJ";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE43B60A2605
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE43B60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=P/jUBQCJ
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so15130095e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794307815; x=1794912615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RVTkGzwp8ckIzdQmxfwAcPBKin5d3z25DmdwwACLOEQ=;
        b=P/jUBQCJoeTzk8ENZY21IS6gDU+Zdyc3XCOAcCfNMmq10lkR8U6IsmhN6Xm3LtJm8c
         57Lsbw3/yyD/WCd7dwlAtYB4m5l5PDLR8WQN55qbEKB3A1ar0X0i4ayXtpEkZSm/eleM
         6n9AJ1zMuI6fPQNhL7pK4RYhwuyzARnCAXY8ukjpWK0dVMLxQkE0hnzi++H5U5WHivPK
         7u53LDz9nSTrMJHmZ7FzqqwECFmbIJQlD68etYr8cZaqjQOw2vAxdFNZrBnmAKEJV3gn
         +8hObpVZccBlXWQdyg7IrVvXM3egRtxOSiTfU5PxSJb7YuQjs8akDrMWE61qu3NyeNvD
         /6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307815; x=1794912615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVTkGzwp8ckIzdQmxfwAcPBKin5d3z25DmdwwACLOEQ=;
        b=k6CsIfV6FTVsSGF/06el1w1U8QD+P1VHfJueaWl7lnt5E/cd+KyiDSK7F5iUUX4Rqm
         vPYwcJM4tH0MaTZUxHBAQklGzgWP/nAuArH3NSV6Q7DJIlQ8SxMDffnsBFXLAHQyVYrS
         7tiChyh5aYPOKg825n7SsW0JODpgSb3P5W8DU47RdtsdPKJbpN7YrM2CbL2QIZ3aqDee
         2e3g5mHfMDcq8N/TV0TxfNaNSf7w2/kCS+PK/2Cbmu2ZsWqotAoLJo3rYqwmpXxnScrY
         TInSoiE4PPynfrZ1jNNRJzQfWzJkzYErN+Qmxcs98DjpRtQ4K/b5tFGnaoRiFaZREKgZ
         fLFA==
X-Forwarded-Encrypted: i=1; AL+hErGY/nBVGS2vdyIV+fpqTxVkK2e/mdH5Dbtqn43EaXa1y6ci8ES5ilaQIo2QpomJ9rqlQ1Jxn2ZFs8/+Mec=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iZAAiAPQgv0iLIRY4iA0BydkBLOOTMIrVDbaMTktlde09YEMm
	KhF+HfGGcU27k4x9e1lzbOrzqIOeAqipC9Wii+ciZ5yoQ4PQKi6u2CFBGjULc+jJXWY=
X-Gm-Gg: AYBFou2ZwoGxiU6ZKOnJH7DIrx5RszM/800I+MgiEoiVVIG2IjEw2u/FHK6mmzErJLG
	krdMrl7vkxjaMpX+6g9RXP7ndlqCW4PmTb6i6ShWDpM/R8A3HehSKzTI/c+hnva2IdD3U7di+G6
	6GL2MhfZb+WCPwkpZFrEsBOaLE8lumQ2qWQZdcvt4Pb3L5xC0YStwferorhTzVcooW5RXB5vazK
	MmgwnxsJBpU4Xv+Z/hRNTMl1wvu3Y1P4W1FyZAfGsFZooXuComqoAnpCow2AGgU2l17GmeFt1WZ
	JtdQGu6EQEZcwKlrI2AjgoHGSPCDfVm86GlV+AU6rIi1MYGqKnRJzSxXhHcf0vuh3BP7UZoZ88Y
	GWBT2/taFXMpM9UBxsW3D8VEPyvvJkesk6ZtMYe+uXUk+FtbFPVhsLrN1NIrLcgHjYT9sTGqjAr
	aRWFKuESqlQrGaNtcrOqqRu3xWqBFH3OaKm/OPi1E46FPRjW1kLsO8npegFF2jxf8pb05qQYdbL
	fKpjdznhGd0Mm/fNBSqvPXsQuqgbwfYqBJUTWMMXeo9mlsIhjkMVR6I9ZU8xdCjbg0nFJduep5U
	fuykfdxEAWeLV6ARY5OEfUG7T+NDX/bb1D0G+45nIRYewA==
X-Received: by 2002:a05:600c:4e14:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4ba0233b8b5mr35312615e9.7.1794307814843;
        Tue, 10 Nov 2026 02:50:14 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm4522648f8f.22.2026.11.10.02.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:50:14 -0800 (PST)
Date: Tue, 10 Nov 2026 11:50:12 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] selftests/livepatch: skip based on the test
 modules instead of KDIR
Message-ID: <avL25NFPU_pJ2tXJ@pathway.suse.cz>
References: <20261103222706.1642224-1-sashal@kernel.org>
 <20261103222706.1642224-3-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103222706.1642224-3-sashal@kernel.org>

On Tue 2026-11-03 17:27:06, Sasha Levin wrote:
> setup_config() skips every test when there is no kernel build directory
> at $KDIR or /lib/modules/$(uname -r)/build. The test modules are built
> together with the selftests and the scripts load them from
> test_modules/, so nothing needs a build directory at run time. A
> machine running an installed kselftest tree usually has none, and the
> tests are skipped there although the modules were built and installed.
> 
> Check for the modules that __load_mod() loads instead, and remove
> has_kdir(), which has no other users.

This is another a bit cryptic LLM generated commit message.
IMHO, it will be much more strightforard to say that this patch
allows to run livepatch selftests with pre-built test modules
without a need to install kernel devel files.

> Fixes: 54ee3526796f ("selftests: livepatch: Avoid running the tests if kernel-devel is missing")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/testing/selftests/livepatch/functions.sh | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
> index 8b26b70f92d8c..14fc9cade4de3 100644
> --- a/tools/testing/selftests/livepatch/functions.sh
> +++ b/tools/testing/selftests/livepatch/functions.sh
> @@ -44,16 +44,10 @@ function is_root() {
>  	fi
>  }
>  
> -# Check if we can compile the modules before loading them
> -function has_kdir() {
> -	if [ -z "$KDIR" ]; then
> -		KDIR="/lib/modules/$(uname -r)/build"
> -	fi
> -
> -	if [ ! -d "$KDIR" ]; then
> -		echo "skip all tests: KDIR ($KDIR) not available to compile modules."
> -		exit $ksft_skip
> -	fi
> +# Check that the test modules were built before loading them
> +function has_test_modules() {
> +	compgen -G "test_modules/*.ko" > /dev/null ||
> +		skip "test modules are not available"

I would prefer to keep also the original tests as a fallback
and report:

		echo "skip all tests: test modules are not available and KDIR ($KDIR) is not available to compile them."

Best Regards,
Petr
