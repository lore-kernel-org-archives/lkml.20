Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794618865;
	b=KOpeqcq6VCDxEqphQudV+9LYSEYK/gnlhbyTEJBi8ueDIy9iL4eqNu3kM9eLxB8P+6fq
	 u88HZJIVxBW/bCvb5DJEF1PG8B4WTMe1ysgSpq48tuVtFuTkUIQbQHo1IupDm2rW1ocY/
	 uEh7aZXveEPaVoFaO1tFxRXxJQITChCkL7vzH1aVJlbfn6yGyZ7JjT7Vx9Z9V2yq2+b7V
	 /PQfvrojfAbxEgorb/3QwMru+PKTmrXJ4Y4ck3z/oFE8lJCRpIFWpL+0wETmXk2S/5K78
	 xyUehp5NN2r5ZQoLg0zdE56Xdt01VW26Ahe/SYyAWQD4xSNdc759BCD1IXDEmbEoIGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794618865;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UyYy92siVxlbkOAXrPBxCpNpLxro7gVqdyR2tGshRfw=;
	b=VSb6Lkxmm2doDpy2fE8tod5J7SWhs3dgmgy9/8wyuIF+2LCjQD05YWMi8CGx5NrMrl1c
	 vvt0yHYM/JuOhsV92WdL5yV+kiFCrThJks4qvu1R+NLVF5XuoxmW9hGqFqLnY6Sxz45fG
	 40Bkn/ywCfd+NESGTgYy04r21MjSyix50ODzYGYRoOhAZHE8uAV5qWBdrSsx1q8cG489J
	 hh8P41ztkXWjQNmUqdF6lFMpy6l4o5b6zNmy8dQ9eG+D9MAK2GqlpSdC61EFi/5XeKEwI
	 bMiBobqGvkC0o3lVoRv5Jzz3ZsPdjztgsIR5xw7njEqYjH+4jMqB1Hp/pBhoo21X3Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RlH6/ki1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A4606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 01:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RlH6/ki1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3620B1F000C4;
	Sat, 14 Nov 2026 01:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794618864;
	bh=UyYy92siVxlbkOAXrPBxCpNpLxro7gVqdyR2tGshRfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RlH6/ki13MdccZ31W7ZNOHZHNU4dwl06XOwI2e3Zs1ynQ6VT8B2LvBFPuM4eKNb+q
	 XtG2X2mKPQQflf5m/g4gwv8A6jrvYRbRz9V+3mWLpAYW8kWBw1GHcFpBBaHG+xcqDD
	 tpbANPB6ufF7J7sNbeg8ps2RMyNK08Zx9kBKfZg/sAdyq/hFCi4PjFOWU6PmUmcvWQ
	 cqSXj0BEyNspI5CBipxiw3UneGVz4VuhEIRCSxWsD03V+Is5hxLKAO1k+HE2Wo8/Ch
	 p+HI5RtpQHx9q2+sTQVOxUB1GgprMBo6jc1y1Jem/KJdrPuoVxIGpM+nlgPdq4DKUa
	 KUUfaDwuw3bBw==
From: SJ Park <sj@kernel.org>
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: SJ Park <sj@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com
Subject: Re: [PATCH] mm/mempolicy: ignore a bind policy whose nodes have no memory
Date: Fri, 13 Nov 2026 17:14:16 -0800
Message-ID: <20261114011417.85494-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113192642.2618878-1-gourry@gourry.net>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 13 Nov 2026 14:26:42 -0500 "Gregory Price (Meta)" <gourry@gourry.net> wrote:

> apply_policy_zone() assumes that policy->nodes intersects N_MEMORY, so
> it reads a bind policy with no N_HIGH_MEMORY node as movable-only.
> 
> On systems with CONFIG_CPUSETS=n, nothing rebinds policies when memory
> is removed, so offlining all memory on the nodes a bind policy names
> leaves it with none. The policy is then treated as movable-only, and
> movable allocations are restricted to nodes without memory.
> 
> This results in allocations failures, a VM_FAULT_OOM leak, and then
> an infinitely retrying fault that hangs the process.
> 
>   page allocation failure: order:0, mode:0x140dca ... nodemask=2
>   Huh VM_FAULT_OOM leaked out to the #PF handler. Retrying PF
> 
> Ignore a bind policy whose nodes have no memory. policy_nodemask()
> already ignores a bind policy that does not intersect the cpuset.
> This covers hugetlb's policy_mbind_nodemask() as well.
> 
> If the nodes regain memory, the policy applies again.
> 
> CPUSETS=n with HOTREMOVE=y is unlikely a common configuration, so this
> isn't marked for stable.

Makes sense and looks good to me.

> 
> Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
