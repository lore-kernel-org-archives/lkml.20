Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388581;
	b=u68VBIywgeiwQiXfe4uw/lC+0Pglk4+S75X72LqTeXGD5AzEYaXYeDDXVHhwHLbaRMkE
	 Pd+WCfomhjV8ENBakigO6MPF4QF+MPyL+o30XdCeBPFtuEsd0l27pbp8i0hyoiz6TAOC0
	 m6YeeKtcTARYsBH6VqDug7k/NU922l9zNukFKEcyyJn0oKjGNKJJTg0qLBnFMkwKM588v
	 XJVcq7abe+cHKHwUVr5AOUKeJNjuW8beum9GFHtbrwp0xkpOZvPLWIwuCEQw5e1SnAcGt
	 3D2mWyrK+2jX+iKO4qdsor3kSazG9lXMITgo5DWdVJJCvR4rk3CQ3g4nA1G9PXufcZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388581;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=UvfT6hSAyzO93qIIEMJt3Vvo8yCu/1uMWsPhY4ae/gE=;
	b=YUKLJ2PEwVnOICm3ROPLTRX+PDbk1KyXwub7cWbaR+eIh6yeL0QQira33/s+tGtwvRGu
	 bs6QL0NykN3tLj3zgM8lGePMGNjY2l/1F5mivlKac0KMaIb/efZMbYukuWZ+B4D23fDwo
	 HvsDu4Y1dcWADRB/+X5T5HYBQwjZYzqGiC4tX/u/b2dGXOXJa6yPxiJAyVw9x4RsIz0d7
	 Yib6aUCugZ8GwOTif9eojQQIN2cyJiFw2FpaYj19sZj2nal6qDDzZm2sHQ49rLofvTEtQ
	 atIV22f9WRzo6MElG+pkhqxIlljgxHjQNdgey2YMTmjb5PINnR3JgwPJAh6Dbe2aL6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fgbgjqdU;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E351606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:29:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E351606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fgbgjqdU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793388580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UvfT6hSAyzO93qIIEMJt3Vvo8yCu/1uMWsPhY4ae/gE=;
	b=fgbgjqdUkAKN8v6Z/mL9w0i+TlKYeNjrFIiaejdSX/kw6QtzqwVrNT8iiYOPdCkvRtG2VA
	YdLjTbQLm6pdFpa3r8F8Dh+udFIciRlKOMXF8Bj/7QFfhOoi0kTMAFXkgOsyA8OsG32NBo
	r2olsyZPU9gNr3DNxh1BKurTtqxa5tg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-152-VlHsgRidPJ2jzKQ_VNfY_A-1; Fri,
 30 Oct 2026 15:29:38 -0400
X-MC-Unique: VlHsgRidPJ2jzKQ_VNfY_A-1
X-Mimecast-MFC-AGG-ID: VlHsgRidPJ2jzKQ_VNfY_A_1793388577
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E5C7E195422B;
	Fri, 30 Oct 2026 19:29:36 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A43093000B7A;
	Fri, 30 Oct 2026 19:29:35 +0000 (UTC)
Message-ID: <6904bcf6-6a6a-46fe-83f3-09880d45873f@redhat.com>
Date: Fri, 30 Oct 2026 15:29:34 -0400
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
Subject: Re: [PATCH] cgroup/cpuset: Drop redundant no-cpu check in
 partcmd_update with newmask
To: Shaojie Sun <sunshaojie@kylinos.cn>, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Ridong Chen <ridong.chen@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261030131408.1054507-1-sunshaojie@kylinos.cn>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20261030131408.1054507-1-sunshaojie@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 10/30/26 9:14 AM, Shaojie Sun wrote:
> update_parent_effective_cpumask() with a non-NULL newmask is only ever
> reached from partition_cpus_change(), and only after validate_partition()
> has checked the very same condition with the very same arguments:
>
>    tasks_nocpu_error(parent_cs(cs), cs, trialcs->effective_xcpus)
>
> since newmask is exactly trialcs->effective_xcpus and both functions use
> parent_cs(cs) as the parent. cs, parent and cpu_active_mask cannot change
> in between either, as cpuset_mutex and cpu_read_lock are held for the
> whole operation. Hence
>
>    nocpu = tasks_nocpu_error(parent, cs, newmask);
>
> is always false here and the block that turns a "nocpu" condition into
> PERR_NOCPUS is dead code. A new CPU list that would drain the parent is
> fully handled by validate_partition(), which routes the write to
> partcmd_invalidate and hands the partition's CPUs back to the parent.
>
> The "!adding || !cpumask_intersects(addmask, cpu_active_mask)" test that
> guards the block does not change this: the block can only be entered when
> nocpu is true, and that never happens here.
>
> Drop the redundant check and the dead PERR_NOCPUS block, and leave a
> comment pointing at where the "parent could be drained" case is handled.
> The empty-newmask check in the same branch is left alone: it validates
> the newmask argument of this function, while what is removed here is a
> decision that belongs to validate_partition().
>
> No functional change.
>
> Signed-off-by: Shaojie Sun <sunshaojie@kylinos.cn>
> ---
>   kernel/cgroup/cpuset.c | 20 +++++---------------
>   1 file changed, 5 insertions(+), 15 deletions(-)
>
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 3219f927c35e..c7b3a734cda8 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -2016,9 +2016,6 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>   			goto write_error;
>   		}
>   
> -		/* Check newmask whether cpus are available for parent/cs */
> -		nocpu = tasks_nocpu_error(parent, cs, newmask);
> -
>   		/*
>   		 * partcmd_update with newmask:
>   		 *
> @@ -2033,6 +2030,11 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>   		 * For invalid partition:
>   		 *   delmask = newmask & parent->effective_xcpus
>   		 *   The partition may become valid soon.
> +		 *
> +		 * Note that the no-cpu check is not repeated here:
> +		 * validate_partition() has already evaluated
> +		 * tasks_nocpu_error() with this very mask, and a failing
> +		 * write is routed to partcmd_invalidate instead.
>   		 */
>   		if (is_partition_invalid(cs)) {
>   			adding = false;
> @@ -2056,18 +2058,6 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
>   			cpumask_and(tmp->new_cpus, tmp->delmask, cpu_active_mask);
>   			WARN_ON_ONCE(!cpumask_subset(tmp->new_cpus, parent->effective_cpus));
>   		}
> -
> -		/*
> -		 * Make partition invalid if parent's effective_cpus could
> -		 * become empty and there are tasks in the parent.
> -		 */
> -		if (nocpu && (!adding ||
> -		    !cpumask_intersects(tmp->addmask, cpu_active_mask))) {
> -			part_error = PERR_NOCPUS;
> -			deleting = false;
> -			adding = cpumask_and(tmp->addmask,
> -					     cs->effective_xcpus, parent->effective_xcpus);
> -		}
>   	} else {
>   		/*
>   		 * partcmd_update w/o newmask

LKTM

Reviewed-by: Waiman Long <longman@redhat.com>

