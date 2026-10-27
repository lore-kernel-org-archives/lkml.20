Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108699;
	b=wTupBiWHcSl2M18hYfnbdT6aV2fsOuugTPrSBWxGhJO4KLjY6W0x3rLguHms4EkgRg+x
	 5KvacevP/9kYVN4l/xelOK66WKERH0gqUhuQ6Pgz7P2JN62IFYThiO4fXefvVaZshYwC8
	 mPP4rjL6Db0QWZXm/43hbjTp2JUXnpmjqZ+2kSff0ctrDx9DmMUvZKhV7i/htZrgrSZJX
	 ZWE7n6DkhKALQTi+u4k01dM8+D3qahz3LPI6/jPkZeJ8ec951q0EsT+iFSdo7PQS1SsFS
	 Ook9+9RdA/Yhk1ma8ArHLlvl7Y7fkm1Kb4NRtLAFSzs1NZBPHNqu5D8D7vQ3fjG+AHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108699;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=sL2aVG6bsrL4GE52EbX/cWA86ITx/elg5Ft4uIRbdAM=;
	b=DDzXy5QlasVOs3dqoMJnL6s52SlIhsZRrjCn62W1TXlqNmLmpDzNxdu6HrSvtVNTGq4w
	 x9B5G0wmQkAj9Ax0i7eySUf75pFRfDh1xGcTtrsj1OkQrgTa3wRJT3o3swdfu8LB6PK3a
	 PMYfTULydW/TvyGgNUjraSzlb9o5jbSXa110vC1Ik3C30ABj2MBFxjPx8BL7hFkwDb+Gu
	 RqxB8D4KA/EJCry3Kr5wIesOfisKwgIuiwrltzLWdPt9AbkRMD9y/MdkRA0sNXoFGITVV
	 7luBTu9GeYjFdIo6I+4BQhC7mc07farz+u464lgqUa0h+xVq1pnKtJZFzn/pnaHaAfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.225
Received: from mta0.migadu.com (out-225.mta0.migadu.com [91.218.175.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D5D606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54D5D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=RhRuF+NCm5gpqBzj5GdgfRXNOVXiBh/CKMER0cN82jA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793108695; v=1; x=1793713495;
 b=XYTk/py8xjg6GHRnBtYLmuZQHSlH5mT68eGutB0+asaJSVdYY81+ob9uZuDA5OABbtnMTnTs
 ipDHgWfK+ghI+WnFMnka91pOon0xyj+4m0JWqAhF13KYdloU/LOaZspBxgAM2RM7+cep1FiUHfN
 T6Snx6vzuyzR1IotQpU+3ysQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id dbf57763c894293a;
	Tue, 27 Oct 2026 13:44:55 +0000
X-Mizu-Trace-ID: dbf57763c894293a
X-Migadu-Flow: FLOW_OUT
Message-ID: <8cd8d3e9-da10-4201-ba76-e1ce8ae5d50a@linux.dev>
Date: Tue, 27 Oct 2026 21:44:51 +0800
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
Subject: Re: [PATCH] cgroup/cpuset: Fix missing effective_xcpus accounting of
 child partitions
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com
Cc: ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
 mkoutny@suse.com, shuah@kernel.org, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Guopeng Zhang <zhangguopeng@kylinos.cn>
References: <20261027123837.100909-1-guopeng.zhang@linux.dev>
Content-Language: en-US
In-Reply-To: <20261027123837.100909-1-guopeng.zhang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/27 20:38, Guopeng Zhang 写道:
> From: Guopeng Zhang <zhangguopeng@kylinos.cn>
> 
> When a partition root expands its exclusive CPUs, a valid child
> partition will be able to claim more CPUs from its parent. As
> update_cpumasks_hier() always updates a cpuset before its descendants,
> the parent has already been committed when the child partition is
> reached. Its effective_cpus is computed with the child's old
> effective_xcpus subtracted and no further adjustment is made
> after the child commits its new effective_xcpus.
> 
> The additional CPUs are thus granted to both the parent and the child
> partitions. generate_sched_domains() then emits the warning below
> about the overlapping sched domains:
> 
>   WARNING: kernel/cgroup/cpuset.c:919 at rebuild_sched_domains_locked+0x1ec/0x2e0, CPU#21: bash/1225
> 
> Fix that by taking the CPUs newly added to a valid child partition
> away from its parent at the commit point of update_cpumasks_hier()
> right before the new effective_xcpus is committed. The tasks in the
> parent cpuset as well as its other children will be updated if its
> effective_cpus is changed.
> 
> A new test case is added to test_cpuset_prs.sh to test this patch.
> 
> Fixes: e2ffe502ba45 ("cgroup/cpuset: Add cpuset.cpus.exclusive for v2")
> Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
> ---
>  kernel/cgroup/cpuset.c                        | 25 +++++++++++++++++++
>  .../selftests/cgroup/test_cpuset_prs.sh       |  4 +++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 3219f927c35e..ec0ef3ad0726 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -2241,6 +2241,7 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
>  		struct cpuset *parent = parent_cs(cp);
>  		bool remote = is_remote_partition(cp);
>  		bool update_parent = false;
> +		bool xcpus_added = false;
>  
>  		old_prs = new_prs = cp->partition_root_state;
>  
> @@ -2356,6 +2357,19 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
>  		}
>  
>  		spin_lock_irq(&callback_lock);
> +		/*
> +		 * A child partition may claim more CPUs when its parent expands
> +		 * the exclusive CPUs. Take the newly granted CPUs away from the
> +		 * parent which was committed earlier in this walk.
> +		 */
> +		if (!remote && new_prs > 0) {
> +			compute_excpus(cp, tmp->addmask);
> +			if (cpumask_andnot(tmp->delmask, tmp->addmask,
> +					   cp->effective_xcpus)) {
> +				partition_xcpus_add(new_prs, parent, tmp->delmask);
> +				xcpus_added = true;
> +			}
> +		}
>  		cpumask_copy(cp->effective_cpus, tmp->new_cpus);
>  		cp->partition_root_state = new_prs;
>  		/*
> @@ -2375,6 +2389,17 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
>  
>  		cpuset_update_tasks_cpumask(cp, tmp->new_cpus);
>  
> +		/*
> +		 * The parent's effective_cpus may have been changed by
> +		 * partition_xcpus_add() above. Update the tasks in the parent
> +		 * cpuset and its other children, if necessary.
> +		 */
> +		if (xcpus_added) {
> +			cpumask_copy(tmp->addmask, parent->effective_cpus);
> +			cpuset_update_tasks_cpumask(parent, tmp->addmask);
> +			update_sibling_cpumasks(parent, cp, tmp);
> +		}
> +
>  		/*
>  		 * On default hierarchy, inherit the CS_SCHED_LOAD_BALANCE
>  		 * from parent if current cpuset isn't a valid partition root
> diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> index 83ef6c781af3..09e430570815 100755
> --- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> +++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
> @@ -437,6 +437,10 @@ TEST_MATRIX=(
>  	" CX1-4:P1 CX3-4:P1 .     .     X1-2     .      .      .     0 A1:1-2|A2:1-2|XA2: A1:P1|A2:P-1"
>  	" CX1-4:P1 CX3-4:P1 .     .  X1-2:X1-4   .      .      .     0 A1:1-2|A2:3-4|XA2:3-4 A1:P1|A2:P1"
>  
> +	# The extra CPUs gained by a child partition when its parent expands the
> +	# exclusive CPUs have to be taken away from the parent.
> +	" C2-6:X2-5:P1 C3-6:X3-6:P1 .      .      X2-6     .      .      .     0 A1:2|A2:3-6|XA2:3-6 A1:P1|A2:P1 ."
> +
>  	# Taking away all CPUs from parent or itself if there are tasks
>  	# will make the partition invalid.
>  	"  C2-3:P1   C3:P1  .      .      T     C2-3    .      .     0 A1:2-3|A2:2-3 A1:P1|A2:P-1"

Hi Longman,

I thought of another way to fix this problem that attacks the stale
value at its source. The comment in
update_parent_effective_cpumask() says:

    When both cs and parent remain valid, parent's
    compute_partition_effective_cpumask() call would have removed cs's
    effective_xcpus from the parent's effective_cpus. So there is no
    need to adjust parent's effective_cpus here.

That is the design intent, but compute_partition_effective_cpumask()
subtracts the child's old effective_xcpus, which hasn't been updated
yet when the parent is processed. What if the parent subtracts the
CPUs the child can claim from the newly computed parent mask instead?
The rework (on top of the same base as the posted patch) looks like:

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 3219f927c35e..cd02b6b74ca2 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1602,10 +1602,14 @@ static int compute_trialcs_excpus(struct cpuset *trialcs, struct cpuset *cs)
 static void compute_partition_effective_cpumask(struct cpuset *cs,
 						struct cpumask *new_ecpus)
 {
+	static cpumask_t child_xcpus;
 	struct cgroup_subsys_state *css;
 	struct cpuset *child;
 	bool populated = partition_is_populated(cs, NULL);
 
+	lockdep_assert_cpuset_lock_held();
+
 	/*
 	 * Check child partition roots to see if they should be invalidated
 	 * when all the effective_cpus will be used up and cs is populated.
@@ -1628,7 +1632,16 @@ static void compute_partition_effective_cpumask(struct cpuset *cs,
 		 * partition root.
 		 */
 		WARN_ON_ONCE(is_remote_partition(child));
-		if (populated && cpumask_subset(new_ecpus, child->effective_xcpus)) {
+		/*
+		 * The child has not been updated yet. Compute the CPUs it
+		 * can take from this newly computed parent mask, without
+		 * overwriting its old effective_xcpus.
+		 */
+		cpumask_and(&child_xcpus, new_ecpus, user_xcpus(child));
+		if (cpumask_empty(child->exclusive_cpus))
+			rm_siblings_excl_cpus(cs, child, &child_xcpus);
+
+		if (populated && cpumask_subset(new_ecpus, &child_xcpus)) {
 			int old_prs = child->partition_root_state;
 			int parent_prs = cs->partition_root_state;
 
@@ -1646,8 +1659,7 @@ static void compute_partition_effective_cpumask(struct cpuset *cs,
 			notify_partition_change(child, old_prs);
 			continue;
 		}
-		cpumask_andnot(new_ecpus, new_ecpus,
-			       child->effective_xcpus);
+		cpumask_andnot(new_ecpus, new_ecpus, &child_xcpus);
 	}
 	rcu_read_unlock();
 }

compute_excpus() is not directly reused here as it reads
parent->effective_xcpus which hasn't been updated yet at this point.

This fixes the double grant in one step and keeps the accounting
inside compute_partition_effective_cpumask(). I boot tested it on a
32-CPU VM with the whole test_cpuset_prs.sh suite and it passes, same
as the posted patch.

Which way do you think is better? If you like the rework, I am happy
to send a v2.

Thanks,
Guopeng

