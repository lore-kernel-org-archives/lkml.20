Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793582897;
	b=4LVySFsupYcEBmq65sPJcUzJK9OgUF0iSCWslsNf0FWa8ELctTNCBcsjWmADIRLQBMio
	 qr/O7UmwByLGrSCdSH5l6ZgjiQI9vSCcl27v0AYluTFzPiaq8dQHNcsr2KjdXlsgQMAtv
	 SZXO17NUajN1Pv8qfNcNegJt5KO5BIb2kz5VwrXp+AIPs3jWzDEXXyBrIFjySSgfpFN3i
	 WZNcc5iA7/w93a2+wkrADvao0uSA3MPgXOlmlyCYPVVq9uI/724YEks5aaLuHDi+vm/VW
	 gDhucYwNvG8h6qoAvY392yupxK3LdLioIheltp2+G/98YiYUXJ01sSHmiFW07cj6bIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793582897;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rzoLRGpbA1YnRSHf730F0SGoltNl9naGbkAysUDHcXM=;
	b=KSPwfUEhSpz+l7Br9fjutpaJZiI4QftsR7pG7lm4zsP3Xs7vx5pUzffdnvTTDtysqnHR
	 WK8Iuh3hOLQzRv6RGnOomhKw+hz9VSlLD7QaPGQOGlPEJF75++BklQjQ7B/+d5vjx4Ki9
	 GttYI4AjFAsSU15EEyHsiG/2tcx/IrCYVeSqB9z+/ByT6VF1JTxnq39mcnSNfOw3XLmtJ
	 m80F5apnavofMfzi3k1I3wKNjJtkky721n8UNVxNdq1yDHWEKZE9DlXOKLJLkBsLnPSdR
	 yIBUefjSuiOrtKU8igpkYu1wM5ClxXMcho8CMSTTmUmXk508z7NZQzdPxv4DDdOCFKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DJ2NkJ6N;
	arc=none smtp.remote-ip=91.218.175.55
Received: from mta0.migadu.com (out-55.mta0.migadu.com [91.218.175.55])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5766606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 01:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5766606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DJ2NkJ6N
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=csedd/GblkcolFtqfu+Niv7QfYyLxrzwGS2iiAkK03Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793582894; v=1; x=1794187694;
 b=DJ2NkJ6NPdca1qRjRCIGzdehAckNz7v4+vDIZ8OfJurHcdspC4eBN+MdskrcZChpdj98DrCg
 ezsjtUAwlDfRRC70u5mkuFoLOCIceJT+fAASVIlQ8D5iG76LiY2UPhESBlBmFCkkWeWIApd0ajS
 RY97AYDipen5JBqZamAggtYI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 768c53e075c1f637;
	Mon, 02 Nov 2026 01:28:14 +0000
X-Mizu-Trace-ID: 768c53e075c1f637
X-Migadu-Flow: FLOW_OUT
Message-ID: <d1da9c1d-5ecf-4ae3-bedf-f73906758ec8@linux.dev>
Date: Mon, 2 Nov 2026 09:28:07 +0800
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
Subject: Re: [PATCH v2 1/3] cgroup/cpuset: Fix incorrect CPU accounting with
 parent's effective_xcpus expansion
To: Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261030190701.78308-1-longman@redhat.com>
 <20261030190701.78308-2-longman@redhat.com>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20261030190701.78308-2-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/31 03:06, Waiman Long 写道:
> Commit ec0254b9eb49 ("cgroup/cpuset: Release invalid isolated CPUs with
> a shrunk root partition parent") fixes incorrect isolated_cpus accounting
> when contraction of a parent's effective_xcpus can cause a child partition
> to lose isolated CPUs. Expansion of parent's effective_cpus can also allow
> a child partition to gain more effective_xcpus. However, the current code
> doesn't handle this case correctly leading to incorrect effective_cpus
> and isolated_cpus accounting. Fix that by looking for this possible
> expansion of effective_xcpus and perform the proper accounting action.
> 
> New test cases are added to test this effective_xcpus expansion scenarios.
> 
> Reported-by: Guopeng Zhang <guopeng.zhang@linux.dev>
> Link: https://lore.kernel.org/lkml/20261027123837.100909-1-guopeng.zhang@linux.dev
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c                            | 12 ++++++++++++
>  tools/testing/selftests/cgroup/test_cpuset_prs.sh | 15 +++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 3219f927c35e..39c81a0a8ab9 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -2097,6 +2097,7 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>  							     parent->effective_xcpus);
>  			if (!cpumask_empty(tmp->addmask))
>  				isolated_cpus_release(cs, tmp->addmask);
> +			/* Expansion of parent's effective_xcpus is handled below */
>  		}
>  		if (nocpu) {
>  			part_error = PERR_NOCPUS;
> @@ -2106,11 +2107,22 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>  						     parent->effective_xcpus);
>  		} else if ((parent_prs == PRS_ISOLATED) &&
>  			   ((old_prs == PRS_ROOT) || (old_prs == -PRS_ROOT))) {
> +			/* Parent partition state changed to PRS_ISOLATED */
>  			part_error = PERR_ISOPARENT;
>  			if (old_prs == PRS_ROOT) {
>  				cpumask_copy(tmp->addmask, cs->effective_xcpus);
>  				adding = true;
>  			}
> +		} else if (is_partition_valid(cs) &&
> +			   !cpumask_equal(tmp->delmask, cs->effective_xcpus)) {
> +			/*
> +			 * If there is an expansion of parent's effective_xcpus,
> +			 * we may take more xcpus from parent. The parent's
> +			 * effective_cpus should still have active CPUs or nocpu
> +			 * should have been set.
> +			 */
> +			deleting = cpumask_andnot(tmp->delmask, tmp->delmask,
> +						  cs->effective_xcpus);
>  		} else if (is_partition_invalid(cs)) {
>  			struct cgroup_subsys_state *css;
>  			struct cpuset *child;
> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> index 83ef6c781af3..844efdf029cd 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> @@ -531,6 +531,21 @@ TEST_MATRIX=(
>  	" C1-4:P1 C3-4:P2   .      .    T:C4-6   .      .      .     0 A1:5-6|A2:4 A1:P1|A2:P2 4"
>  	" C1-4:P1 C1-2:P2   .      .    T:C4-6   .      .      .     0 A1:4-6|A2:4-6 A1:P1|A2:P-2 ."
>  
> +	# The extra CPUs gained by a child partition when its parent expands the
> +	# exclusive CPUs have to be taken away from the parent.
> +	" C2-6:X2-5:P1 CX3-6:P1 \
> +	                    .      .    X2-6     .      .      .     0 A1:2|A2:3-6|XA2:3-6 A1:P1|A2:P1 ."
> +	" C2-6:X2-5:P1 CX3-6:P2 \
> +	                    .      .    X2-6     .      .      .     0 A1:2|A2:3-6|XA2:3-6 A1:P1|A2:P2 3-6"
> +
> +	# Both expansion and contraction of parent's effective_xcpus will be
> +	# correctly handled in child partition and the child can be invalidated
> +	# if a populated parent could lose all its effective_cpus.
> +	" C2-6:X2-5:P1 CX3,5-6:P2 \
> +	                    .      .    X4-6     .      .      .     0 A1:4|A2:5-6|XA2:5-6 A1:P1|A2:P2 5-6"
> +	" C2-6:X2-5:P1 CX3-6:P2 \
> +	                    .      .   T:X4-6    .      .      .     0 A1:4-6|A2:4-6 A1:P1|A2:P-2 ."
> +
>  	#
>  	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
>  	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------

Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Tested-by: Guopeng Zhang <zhangguopeng@kylinos.cn>

Thanks,
Guopeng
