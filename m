Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274398;
	b=ITgNoGGlijA7C3RD9eSUacDv+VdfhI41mCF15rgOFnEcHnvDdJWTAYsUlK+sVQOpJlqj
	 miD1Iuz2yGrOYU/BWqW0kK6V1/Mvln3iFtRq5AuIgUt21SAthjiczWAjuJnkx6DmwSERB
	 iNyXEA+4kxPpAHpvpdNk2OC1W4y3zicGtPcp7zeCkZfS6p5qRikghD2MVmx5tyle9iBT4
	 AkkfMRntPMloV/QgfVEviQpWxwuz4DWRULTTyXL3TuOgL3Z9utQJfhbpuyb2cRo23o0xm
	 knoX/azgT1bTCKVngYtofi/ZoaD3AuSjnLMQY95ik/qrnNXeXHxcD4iTz9jl+vLm6AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=d3tI+lsKyAfo2SvveMIf16nV49egeDWrXlEVyRU8qIQ=;
	b=kI2a2GZ7i2yir34cNA5p33KQOvnG3xd3piS5S+9pZyy62pIjlfrInOtwmOD4j3+QwOPk
	 XbDP/sZPyfJIOe/O/ZAn+49JgX/NKrxCbvXjARMY8+CgZ1UzOw6voEdlNzSsHPkrIY2in
	 AEzgWGR1TcBWRbE46OaoLQTeRsHgieT8a3vpJfpZ3tscOHaXIeQdnYLsDUzTl0eFI7dbV
	 cziW/sojkfo8CXZPvNdaf1CLyPljtvrPWml9EyMCGaLfTPDf/VtpXTiw30EJ2JZojyEiI
	 YO37VqUqyA9/FQwhYSZFCTigsyu5xXoX90Yqz/vI3IadzaLdGDtp01Nj/vF6WvHTRgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVHGU9Tl;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343D5606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 343D5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVHGU9Tl
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-8439fe796ebso989425a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274397; x=1794879197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3tI+lsKyAfo2SvveMIf16nV49egeDWrXlEVyRU8qIQ=;
        b=XVHGU9TlCNvn8SAG6DT6WOXE24tSSOdY7Yd54yFIcu7jisGEApBnVZrvrHK64dCFPO
         mdfCax0KkOeN7fRgNTL3zzXk4waBuQhuPjKPkYUz+PwmPKIZBY7aRroR8HQj7ECAfyrc
         c9jbN+Ob3ehQIQNLnACmUlk71fN6mFqVMLEQkqn2FaW8e44hSLuK/6sb2o/3YvFmwAp7
         1PwvKvydQ0PodW18+InPS1Vk8+3c60dT7bjoS14XSdDRoSnxrFw5v0bJrE2u9VsnsYtc
         UWydCUPHZKyy/HkDOfNsWpoHLN3tyxOfR+aBfO7CdC8n5h0QUBbZ4kczyMBiZl/vXLsp
         cPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274397; x=1794879197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3tI+lsKyAfo2SvveMIf16nV49egeDWrXlEVyRU8qIQ=;
        b=Th9d+CRGOTdlxGqfo2t2ZauO/1Z8D2b9wOivR4veqSDWerJk1HMlgoHvFNxJJGGgO6
         bOsATj1UhXHhqQvV7ew3I6vENOdt9b5hxfq33uDm2f6E+rqTgXiFxS3VgsAeGJmii1Hp
         yoeOjwR1rCy0kw0A644gSdDpK8vuB29mOBO6B34wzpQ/wVHywzLjd38rS4me3gWOzKI7
         Slv3hp2y7EreWl+JWr1mAmFOnS5kzgM5OawtKXoU/tyl784XsjWkoQ2roBK33mzPG3Kz
         8arDbRucFC3a1Q6kxiCvyQZOvWr/dXyLXjOaz/mvUm3n84C/qMTYXl3n/JJ6v0B4KNzR
         SGyA==
X-Forwarded-Encrypted: i=1; AL+hErExjdmf5DhTmPIcLo0SYB+m6twQXb/Pzt+LEm3q1GN3AvPUW/qu9r3t2CZbX5rKVC2bVhckzSfIuj5dOaw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8p+xvzbNbZqk1lLtxCpvi4jOCuBQ9X9PxaZW0pdBaRwLkZK4+4
	CNH+FrVEW60JmCdUu+OGtgG5fpRtcO3H54OxCNjyWqMPwIoxlWVYDrUX
X-Gm-Gg: AYBFou0rFFUkGPze46ME3/raIQXuvW4LcVRq3rlPEMJyATcx2S0V+qCr42RYoZGRER2
	xnv32WiHxfs1WYDfJ2eFt8jpM7PfzLPxaN3633HdYbAiB6j/pVP91tWbStnXrc4FQQVkK8jpPxT
	+Z2RKzivQme/Kc5SUceSs7qooAt11RCmaD3ATWpzfygVB9lSYHEYXouhaOA0Q4Dczr5fSC3FxVb
	gDvdRA81vmEc3/wNlqkwGpRJ7NIOPScrEjdp7qofzyz56nn4EtvZEFhcsQsWdMAymhtBuyu0Acy
	upus7yy6FAHhr2WsnWk9KgmC/0r4O4qKafZDjqOZOkeEpfI2OY/MbVa2ywMIavtHcRIfGwzbJ5X
	otvIIubgAAkywyiKX7hUUKsrPr+nxl41aDeyzwDb95g5V4emH1+jcZVqHYE+dG6eBI+0u1xHo+h
	2k9+1/E01VcbyvwuP/GVW1sJS+8QZJnYuwXnPmcsOvjPDs/VIFEngGRSD968t/ZNtvmrXWTsu41
	xlPolRGpFWOU8wKO0rh9WcoBEUpocJvs7syg4j0x8jH7PObE1ciUGL/3GKsCrlEYxC1nlIo8yN8
	qz72DC1agqlUdNvJgvX55aHRKDfTf4HmHvrAxeoFftfinO+ygALs0rV/QNHr8gytInb2bODXKWO
	VJrE7KFuM1NP8MPdoTig3ynz83laAvPM=
X-Received: by 2002:a05:6808:2216:b0:4d6:90f4:48b1 with SMTP id 5614622812f47-5683cd641efmr969958b6e.51.1794274397045;
        Mon, 09 Nov 2026 17:33:17 -0800 (PST)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504e7dasm802773b6e.5.2026.11.09.17.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:33:16 -0800 (PST)
Date: Mon, 9 Nov 2026 19:33:10 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: shao.mingyin@zte.com.cn
Cc: shuah@kernel.org, linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: ublk: propagate recovery worker failures
Message-ID: <avJ0Vn9G7XhZv-XL@fedora-laptop>
References: <202611092358134332uegNg75loROSwL53Em6A@zte.com.cn>
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
In-Reply-To: <202611092358134332uegNg75loROSwL53Em6A@zte.com.cn>

On Mon, Nov 09, 2026 at 11:58:13PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> The recovery tests update ERR_CODE in background subshells and use wait
> without PIDs. A worker can report a failure while the parent still prints
> PASS and exits with zero. Calling _show_result() from a failed worker also
> removes shared backing files while other workers may still be using them.
> 
> Wait for each recorded worker PID and aggregate its status in the parent,
> keeping failures ahead of skips and preserving errors across batches.
> Return worker and device-creation errors without reporting or cleaning up
> from the child, so the parent can finish waiting before shared cleanup.
> 
> Fixes: 57e13a2e8cd2 ("selftests: ublk: support user recovery")
> Fixes: 533c87e2ed74 ("selftests: ublk: add test for UBLK_F_QUIESCE")
> Fixes: 63276182c513 ("selftests: ublk: add user copy test cases")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
> Tested on native x86_64 Bash 5.2 with the recovery scripts and common
> helpers from the unpatched and patched trees. Device and I/O operations
> were replaced by test-only stubs. Single-worker failures at every launch

Please run the real tests next time, it just needs one kernel with
ublk enabled, and stubs can't cover what the tests are supposed to
verify.

> position, multiple failures, skips, signal termination and device-creation
> errors no longer produce a final PASS or a zero exit status. Successful
> runs still pass, and cleanup follows all worker exits. Prerequisite skips
> still exit before preparation. The 71 scenarios passed their expected
> checks on each tree. This does not exercise real ublk devices or I/O.
> 
>  tools/testing/selftests/ublk/test_common.sh   | 23 +++++++++++++++++--
>  .../testing/selftests/ublk/test_recover_01.sh | 20 ++++++++++++----
>  .../testing/selftests/ublk/test_recover_02.sh | 20 ++++++++++++----
>  .../testing/selftests/ublk/test_recover_03.sh | 20 ++++++++++++----
>  .../testing/selftests/ublk/test_recover_04.sh | 14 ++++++++---
>  5 files changed, 80 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/testing/selftests/ublk/test_common.sh b/tools/testing/selftests/ublk/test_common.sh
> index af2ea4fa1..c5adb4d29 100755
> --- a/tools/testing/selftests/ublk/test_common.sh
> +++ b/tools/testing/selftests/ublk/test_common.sh
> @@ -379,6 +379,26 @@ run_io_and_kill_daemon()
>  	fi
>  }
>  
> +# Collect recovery workers in the parent before removing shared backing files.
> +_wait_recovery_tests()
> +{
> +	local pid
> +	local ret
> +
> +	for pid in "$@"; do
> +		if wait "$pid"; then
> +			continue
> +		else
> +			ret=$?
> +		fi

Nit: the above can be simplified as:

		wait "$pid" && continue
		ret=$?

Not a big deal.

BTW, test_stress_*.sh have the same issue (ERR_CODE set in background
worker + bare 'wait'), which may be handled in a follow-up.

Reviewed-by: Ming Lei <tom.leiming@gmail.com>


Thanks, 
Ming
