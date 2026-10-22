Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678172;
	b=0p55xailbd1v6fyOspjGZsnvGpIAMsFQRdhEHB5v4nLSgS4Z03eGOiXQNTQaFEXHJWls
	 xxLjDrsg5LRg4Rapy4f94kh3vI8+6kssGKlwmTczP9rGksQVkvMhBnT4UBysDG7g+CN1U
	 aY1KdJqapA3ZVRQzpth6B6OkdlGLTktkJulNKK4cIHgIUChNFh7vn527/XeCrhBF9dRQq
	 9glioReTWD8yy7lNdnyp5GXEtRzCF1do5LV1ANKHyKK1Ui9ZQta51rEzjb90Yw9WOSaVI
	 eST8XAsi6gfFLZd+zehlLGbbr17TVttkQtVdaaPjurtw4f+SNdvHSJXExC5x5nHuKcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678172;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=G8eBv0gpB33N8/cz2LgEKMiVTAe8ZtCvm6RFrTr54RM=;
	b=uucemsT1wfGSAFeyh9X9fHdk1LkXMAnNExHvY7So/TmzfVh1cHjl/VBO26ZjaO4Bz5UX
	 BQXejebJ+6FVXe+LIaWwwyfSzFARp15c6hGutlFeihrJzkxAsMWeh7Y5UfccfjTWn7zh2
	 3Bg5gHDAc5Z/0suBEsrye8ropXS8PqSvLBEnG5QDDHg6goCAANYiXVAvOhYxFX5y6p9cf
	 TGj/LmJcTfrxTWYJN2oLMjkOyc4SkFTkZMdtTHfMqecrsIxlx4dX/91Vv2zEXLqK8uRFg
	 97MfSMAVf7pE5sgQeTDRRJWGzel4r8dBvxExDYR6OZzlZZF8ZFRxAMp7mpi7AvW7eiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.206
Received: from mta0.migadu.com (out-206.mta0.migadu.com [91.218.175.206])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BB7606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77BB7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Fe7CT5c1Ji9lA2b4bgotlaNbgskgySBfznXCQQ0tVCc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792678167; v=1; x=1793282967;
 b=Hv92zd/JCUl7Q6QlHGeg8nuHLSKzfKb5rKXAopyT+ek58R+A7TBAkzSSyTnLv550tVnh4weN
 UizRQ0KDDeisagPi2CQYj7/rZfnVi31AU1mplxaHnhhCeiQ6lvsnvzUwJGwNXztuGp9eTKny2HR
 /K3Ut3reD6P2wzIHX8yb031k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ee1a4f980c0ce69a;
	Thu, 22 Oct 2026 14:09:27 +0000
X-Mizu-Trace-ID: ee1a4f980c0ce69a
X-Migadu-Flow: FLOW_OUT
Message-ID: <553cb756-de36-4015-ad13-0c260dec675e@linux.dev>
Date: Thu, 22 Oct 2026 22:09:23 +0800
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
Subject: Re: [PATCH-next 5/6] selftests/cgroup: Check for a single range
 nohz_full CPUs before running test matrix
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261022031643.1351877-1-longman@redhat.com>
 <20261022031643.1351877-6-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261022031643.1351877-6-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/22 11:16, Waiman Long 写道:
> Commit 989ca25c10ca ("selftests/cgroup: Add tests for nohz_full
> housekeeping check") adds a nohz_full test matrix that will only be run
> when a nohz_full boot parameter cover all the CPUs beyond CPUs 0-7. The
> code looks for the first and last CPU numbers in the nohz_full sysfs
> file to determine if that criterion is met. However if there are holes in
> the range (i.e. has ",") the test matrix may be incorrectly run leading
> to unexpected test failure. Fix that by skipping "," and anything after
> that to make sure the first range will cover all the remaining CPUs.
> 
> Fixes: 989ca25c10ca ("selftests/cgroup: Add tests for nohz_full housekeeping check")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  tools/testing/selftests/cgroup/test_cpuset_prs.sh | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> index 8595b6b4b7bf..5bc144836bdf 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> @@ -111,9 +111,9 @@ echo "" > test/cpuset.cpus
>  #
>  # If nohz_full CPUs have been reserved at boot time, they should not include
>  # CPUs 0-7 as that may fail some of the test cases. On the other hand if the
> -# set of nohz_full CPUs includes all the CPUs except 0-7, we can run a special
> -# set of housekeeping CPUs exhaustion tests to see if the cpuset code will
> -# reject them.
> +# set of nohz_full CPUs includes all the CPUs except 0-7 in a single range
> +# <first>-<last>, we can run a special set of housekeeping CPUs exhaustion
> +# tests to see if the cpuset code will reject them.
>  #
>  FIRST_NOHZ_FULL_CPU=
>  LAST_NOHZ_FULL_CPU=
> @@ -124,7 +124,7 @@ NOHZ_FULL_CPUS=
>  LAST_PRESENT_CPU=$(cat /sys/devices/system/cpu/present | sed -e "s/.*[,-]//")
>  [[ -n "$NOHZ_FULL_CPUS" ]] && {
>  	FIRST_NOHZ_FULL_CPU=$(echo $NOHZ_FULL_CPUS | sed -e "s/[,-].*//")
> -	LAST_NOHZ_FULL_CPU=$(echo $NOHZ_FULL_CPUS | sed -e "s/.*[,-]//")
> +	LAST_NOHZ_FULL_CPU=$(echo $NOHZ_FULL_CPUS | sed -e "s/,.*//;s/.*[-]//")
>  	echo "Boot nohz_full CPUs: $NOHZ_FULL_CPUS"
>  }
>  [[ -n "$FIRST_NOHZ_FULL_CPU" && "$FIRST_NOHZ_FULL_CPU" -le 7 ]] &&

Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Tested-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
