Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792972611;
	b=F1PGN3RqnxiyOckIf1rT2YvIEsV4EcPxh0HsPCMoB62L+f5jdVd+h6dv/KNSFiiJWykU
	 2HbkOGteW2XXIhxLUNP12w6kHbmMPEVMc+S9eRj+BlBUml2GdEpxmBZ1wptvBzcq9T9vx
	 vr+gE0uqv2pdCNAhR4yaqkouZU/9xU9jRCaof4yGoQHrhJIXLSO+HX6nxlye8XeG6A+aQ
	 iiPYleg9WWo7aFETcBIMy7nQg1C9h0nhAh7NccK7Bst5MHJgAQOstCL86+DiFcxdBef20
	 9/mnSb2Mgh+B1C1vpfEMz9veVxBk52sw/Lj2+/FuXn8WomSLGCOsQQTSoIbr6KkS/EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792972611;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=DFOznfXUG/tUYx4L0OP/g1K7ukXiJVEh6dUQbh/Z5hA=;
	b=25qolo2hU76cbvijYcJKat+gn8xihfCj26gbmL+iW/MfAgFkA9Ld1u587PZ9osQS8ZFA
	 nzr+0Py1KQ3Drbo9PKS5SDg2R5avJ5q/KvJX0TbnFhJsBH4KaEhgUEnbrM0C9CC59Qaxe
	 krzzuyW04OWCYMvg8g3+WR6W2zpyqzkIzR6nlkN6S7E2Rcjy1u6vGOhUSx5MlwggJBSEp
	 Roj2JimzQ5nkRNW8ugISdVwwpopH0038GNiCtOKDi03AciVMgGBUXkvj+SssrqVjUzqQC
	 epJ5i9m9xAxi5Iw0dyR4keJILHS7YibqfQHjZcKh+hvAYvwSpxKWeYPi+ERFj6j7uDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQwibZmp;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670DE606A325
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 23:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 670DE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UQwibZmp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792972609;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DFOznfXUG/tUYx4L0OP/g1K7ukXiJVEh6dUQbh/Z5hA=;
	b=UQwibZmpX5ImYjLB2f0H/rSMN538Lp+vUWJhGaoK5NyOjVehvjpPNH81EXEWTSt56c00HY
	BlmFihsDIG7T90jLoWJn3OS3BPt4cy1++NExkn5VkCcKY5Y6hWwUVcO2K0drAVf9QxA6fM
	SZBHqQs/1UKHJt7KRh0jtPYziug0X6o=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-435-IyalASxUMama3bNp9B6Dag-1; Sun,
 25 Oct 2026 19:56:43 -0400
X-MC-Unique: IyalASxUMama3bNp9B6Dag-1
X-Mimecast-MFC-AGG-ID: IyalASxUMama3bNp9B6Dag_1792972602
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B0A891956045;
	Sun, 25 Oct 2026 23:56:41 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 16DCB30000E7;
	Sun, 25 Oct 2026 23:56:39 +0000 (UTC)
Message-ID: <2751eb89-c34c-449f-893c-2e1836e3a610@redhat.com>
Date: Sun, 25 Oct 2026 19:56:39 -0400
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
Subject: Re: [PATCH-next v3 09/11] cgroup/cpuset: Release invalid isolated
 CPUs with a shrunk root partition parent
To: Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <guopeng.zhang@linux.dev>
References: <20261025214449.310715-1-longman@redhat.com>
 <20261025214449.310715-10-longman@redhat.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20261025214449.310715-10-longman@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 10/25/26 5:44 PM, Waiman Long wrote:
> It is also reported by sashiko that there may be leakages of isolated
> CPUs when a root partition parent shrinks its effective_xcpus with
> isolated partition children. Leakage here means that isolated_cpus may
> contain extra CPUs that are not in any isolated partitions and not boot
> time isolated. Those CPUs cannot be used in any isolated partitions
> anymore.
>
> There are 2 different cases here. The effective_xcpus becomes empty and
> the isolated partition should be invalidated in this case. Alternatively
> some of its effective_xcpus are not in parent's effective xcpus but
> still have some valid effective_xcpus left. The isolated partition can
> remain valid. In both cases, the invalid isolated CPUs will have to be
> released from isolated_cpus if appropriate.
>
> Fix that by calling isolated_cpus_release() to release those isolated
> CPUs from isolated_cpus.
>
> New test cases are added to test_cpuset_prs.sh to test this.
>
> Fixes: 11e5f407b64a ("cgroup/cpuset: Keep track of CPUs in isolated partitions")
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   kernel/cgroup/cpuset.c                           | 16 +++++++++++++++-
>   .../testing/selftests/cgroup/test_cpuset_prs.sh  |  6 ++++++
>   2 files changed, 21 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 6d224e614e74..3daab2381f04 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -2012,8 +2012,22 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>   		 *
>   		 * A partition error happens when parent has tasks and all
>   		 * its effective CPUs will have to be distributed out.
> +		 *
> +		 * For an isolated partition with a shrunk root partition parent
> +		 * we may need to return some or all of its isolated CPUs.
>   		 */
> -		if (nocpu || cpumask_empty(tmp->delmask)) {
> +		nocpu |= cpumask_empty(tmp->delmask);
> +		if ((parent_prs == PRS_ROOT) && (old_prs == PRS_ISOLATED)) {
> +			cpumask_clear(tmp->addmask);
> +			if (nocpu)
> +				cpumask_copy(tmp->addmask, cs->effective_xcpus);
> +			else if (!cpumask_subset(cs->effective_xcpus, parent->effective_xcpus))
> +				cpumask_andnot(tmp->addmask, cs->effective_cpus,
> +							     parent->effective_xcpus);
> +			if (!cpumask_empty(tmp->addmask))
> +				isolated_cpus_release(cs, tmp->addmask);
> +		}
> +		if (nocpu) {
>   			part_error = PERR_NOCPUS;
>   			if (is_partition_valid(cs))
>   				adding = cpumask_and(tmp->addmask,
> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> index d7d0bef0a17a..ceb1a3b4f94e 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> @@ -522,6 +522,12 @@ TEST_MATRIX=(
>   	# its effective xcpus will be removed from isolated_cpus.
>   	" C1-4:P1 C3-4:P2   .      .    T:C3-4   .      .      .     0 A1:3-4|A2:3-4 A1:P1|A2:P-2 ."
>   
> +	# When a root partition parent with an isolated partition child is shrunk
> +	# so that its effective xcpus is no longer a superset of its child effective
> +	# xcpus, the invalid isolated CPUs should be removed from cpuset.cpus.isolated.
> +	" C1-4:P1 C3-4:P2   .      .    T:C4-6   .      .      .     0 A1:5-6|A2:4 A1:P1|A2:P2 4"
> +	" C1-4:P1 C1-2:P2   .      .    T:C4-6   .      .      .     0 A1:4-6|A2:4-6 A1:P1|A2:P-2 ."
> +
>   	#
>   	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
>   	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------

I am sorry that there is a typo in this patch. I have send out a v3.1 
version with the fixed code.

Cheers,
Longman

