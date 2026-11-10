Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310851;
	b=btWBDXQgh0lFnvvBSA/P7uVTjsYBif4gvRpJlO5KuSGX4av3gweYKE39lb2Q7bh0SavY
	 zNVmlqGziEVwIjDUZNIdzqrCqGRMY4rrRpogy2yJa4UHQCW20wwk4N88rG5GCEEAmKJHf
	 sFiwSX2sUosfS+O0o3RA8FvDK8WTheumfQgwqN8CYUfFZWmsfPHXZxTndN15W9s2DoI16
	 KcdyvQ2TyrBcyCOeUoVVGp8D4Fc3pSSUkkDFXBBzLsTgu8Wo7fV9Hs8wmj1bgQqLFnjUZ
	 bUe8YCVuRHnzQIsKTHCahCevs5iGZru1/a8O0zprDHB1GCSkuEQ3ycfYsuvnC/SNJvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310851;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aPaouAXbgLRUhT/xSgZXmX+UlEKNyTfIZUEDZ/uv2QE=;
	b=oCV+8fvFfer1fuc1LujbXpaTWXwOxwN8sC8fu1uJwmC6wspGpAPRgd4EvgFdpkSlkns7
	 8m34KL8gz03l97cc4jQ4xDw0+sRbXaZ/BDpmGKOjcjwqeNGdY9XmfKgNUyQvr/Sr+H8wA
	 rwWs96oobvras0acPBfSmlmNPvFfsTr8KFVtlW5Wau0PwdIFJMyOFROwUiOa7aFY8Oq2k
	 514xPW/aGivUjjn4fMl0B3A6dEB6179JBHhmE0DkS3EXwzPMi+6vzWd0rVzPuXn1IAlpX
	 DGIb6/tw8ndUj2R1GK0Yu5VJXHNvxIsnSJTl9pQC7Z4evL7igOWOdA65zbmK+Yhg71A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DWQqkoOE;
	arc=none smtp.remote-ip=95.215.58.202
Received: from mta1.migadu.com (out-202.mta1.migadu.com [95.215.58.202])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FAC606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29FAC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DWQqkoOE
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HaOqBACZfDFJv1t2HPP1x99f2DA/TbJHsxjAZEbN/bY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794310849; v=1; x=1794915649;
 b=DWQqkoOEn6unSYxAqYOiunEoWmA7J5PYL8JqA5Rwqzpvqy9wDaD5ti59E0FwVZKHLOZSt0ym
 WQNhQVVnkiH5Roias3P5v2hGvYhulgMKc/v0H4nDBB4hLG0r1W2jzky/Wp3/oN+HgwY8ZsGLHkn
 Iuct4c1pw6VbdkWBn8J6/TOE=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 24b99d424b1b6eed;
	Tue, 10 Nov 2026 11:40:34 +0000
X-Mizu-Trace-ID: 24b99d424b1b6eed
X-Migadu-Flow: FLOW_OUT
Message-ID: <aedd01b8-3f49-4916-b891-38e9c4ff3b06@linux.dev>
Date: Tue, 10 Nov 2026 19:40:27 +0800
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
Subject: Re: [PATCH-next v2 5/5] cgroup/cpuset: Correctly set isolated_cpus
 when switching partition state
To: Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <guopeng.zhang@linux.dev>
References: <20261109190955.1398611-1-longman@redhat.com>
 <20261109190955.1398611-6-longman@redhat.com>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <20261109190955.1398611-6-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/10/2026 3:09 AM, Waiman Long wrote:
> When update_prstate() is called to switch the partition state from
> root to isolated or vice versa, the whole effective_xcpus is passed to
> isolated_cpus_update(). However, if there are child partitions present,
> some of the effective_xcpus are dedicated to those child partitions
> and their partition states will remain the same or get invalidated in
> the case of child root partition with isolated parent in the latter
> update_cpumasks_heir() call. In the latter case, their exclusive CPUs

update_cpumasks_heir

> will be returned to their parent.
> 
> Therefore isolated_cpus may be set incorrectly with child partitions
> underneath. Fix that by excluding their exclusive CPUs in computing
> the correct cpumask of exclusive CPUs used by that partition alone.
> 
> Add new test cases into test_cpuset_prs.sh to test for such cases.
> 
> Fixes: 11e5f407b64a ("cgroup/cpuset: Keep track of CPUs in isolated partitions")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/cgroup/cpuset.c                        | 30 +++++++++++++++----
>   .../selftests/cgroup/test_cpuset_prs.sh       |  7 +++++
>   2 files changed, 32 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 7aa614c6ac4d..41048997a955 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -3054,12 +3054,32 @@ static int update_prstate(struct cpuset *cs, int new_prs)
>   						  cs->effective_xcpus, NULL))
>   			err = PERR_HKEEPING;
>   		else if (parent_prs == PRS_ISOLATED)
> -			err = PERR_ISOPARENT;
> +			err = PERR_ISOPARENT;	/* old_prs should be isolated */
>   
> -		if (!err)
> -			isolcpus_updated = true;
> -		else
> +		if (err) {
>   			disable_partition = true;
> +		} else {
> +			struct cgroup_subsys_state *css;
> +			struct cpuset *child;
> +
> +			/*
> +			 * Need to scan child partitions, if present, and
> +			 * exclude their effective_xcpus from cs. In the case
> +			 * of switching to isolated partition with child root
> +			 * partitions, those child partitions will be
> +			 * invalidated in update_cpumasks_hier().
> +			 */
> +			isolcpus_updated = true;
> +			cpumask_copy(tmpmask.new_cpus, cs->effective_xcpus);
> +			rcu_read_lock();
> +			cpuset_for_each_child(child, css, cs) {
> +				if (!is_partition_valid(child))
> +					continue;
> +				cpumask_andnot(tmpmask.new_cpus, tmpmask.new_cpus,
> +					       child->effective_xcpus);
> +			}
> +			rcu_read_unlock();
> +		}
>   	} else {
>   		/*
>   		 * Switching back to member is always allowed even if it
> @@ -3093,7 +3113,7 @@ static int update_prstate(struct cpuset *cs, int new_prs)
>   	if (!is_partition_valid(cs))
>   		reset_partition_data(cs);
>   	else if (isolcpus_updated)
> -		isolated_cpus_update(old_prs, new_prs, cs->effective_xcpus);
> +		isolated_cpus_update(old_prs, new_prs, tmpmask.new_cpus);
>   	spin_unlock_irq(&callback_lock);
>   
>   	/* Force update if partition is disabled & update effective_xcpus */
> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> index 2d4744f2d6ac..741a13bbeda7 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> @@ -556,6 +556,13 @@ TEST_MATRIX=(
>   	" C2-6:X2-5:P1 CX3-6:P2 \
>   	                    .      .   T:X4-6    .      .      .     0 A1:4-6|A2:4-6 A1:P1|A2:P-2 ."
>   
> +	# Switch PRS state (root <=> isolated) will properly update cpuset.cpus.isolated
> +	# even if child partitions are present.
> +	" C1-6:P1 C3-6:P1 C5-6:P2  .       .    P2      .      .     0 A1:1-2:A2:3-4:A3:5-6
> +								       A1:P1|A2:P2:A3:P2 3-6"
> +	" C1-6:P1 C3-6:P2 C5-6:P2  .       .    P1      .      .     0 A1:1-2:A2:3-4:A3:5-6
> +								       A1:P1|A2:P1:A3:P2 5-6"
> +
>   	#
>   	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
>   	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------

We hit the same issue in our testing earlier (an isolated child partition
loses its isolation when the parent is switched from isolated to root),
and this is the same fix I had in mind. I also ran a few 3-level nested
cases (root/isolated combinations, switching the parent and the middle
level) on top of this series and cpuset.cpus.isolated is correct in all
of them.

Nits: The first line of the two new test cases lacks
the trailing "\" used by the other multi-line entries. It still works
as the newline is just treated as a field separator, though.

Reviewed-by: Ridong Chen <ridong.chen@linux.dev>
Tested-by: Ridong Chen <ridong.chen@linux.dev>

-- 
Best regards
Ridong

