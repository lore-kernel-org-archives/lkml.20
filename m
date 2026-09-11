Received: from mta0.migadu.com (out-96.mta0.migadu.com [91.218.175.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1413E8338
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789096452; cv=none; b=t0cRRmq2idRYRNQBN3kNcqqnAv3zO5c4XdnH34O4uqFZSBa6NNs3a0EkmsIrVfbmZGlM/ixkvs05jGhZ5kxi5vwBv+7OF4piqg99A/OpV4wnZpk3qwSbqpewVlLhxsyCDDl6inVzrVGWgb2/fESeYSEvhPptyomFaJXgEjxS03E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789096452; c=relaxed/simple;
	bh=JzIvR37qR16Jn8zCVt1Z9jhvhV88W1EIwLw3Fnll2JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ew5Z5jklkn9O+HMHWBpIomlHqUBkI2keJEeozy14Te5vZepRZE7p5CPPRh1zGXqIQceXcj4iycncElQC4Xso+1HLEU6i9zcmt59XnLFw+PA+fcfjs3/OvmNdP6RthTxSRwW+NNQDQmXpTs0NEC2fqD1Ibo0Rylgrvz/nGSpifno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C0x0VJRi; arc=none smtp.client-ip=91.218.175.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C0x0VJRi"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=JzIvR37qR16Jn8zCVt1Z9jhvhV88W1EIwLw3Fnll2JI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789096447; v=1; x=1789701247;
 b=C0x0VJRi7N24ZZ/O49Oqsu4BZ9WcQt0z6yG680RCPydUDYCz1iuyBVqg3Gbert5JLdWK0IJB
 2RGLdBYiKY4HHoWZpHZQFKBsxFNnEwpiif0Tmu2OO+LB1JP1pD4vUN0NO2zUHuDQejAE3Pr0x3S
 eprbQnzK1Ocg/TpoC+qNO3lo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 43ce09548737e336;
	Fri, 11 Sep 2026 03:14:07 +0000
X-Mizu-Trace-ID: 43ce09548737e336
X-Migadu-Flow: FLOW_OUT
Message-ID: <d876a8c2-3e4d-449a-9127-ec15b34c9e5d@linux.dev>
Date: Fri, 11 Sep 2026 11:14:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: kernel/trace/ftrace.c:6651:40: sparse: sparse: incorrect type in
 assignment (different address spaces)
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Jiri Olsa <jolsa@kernel.org>
References: <202609110704.Q3M5vCDV-lkp@intel.com>
Content-Language: en-US
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <202609110704.Q3M5vCDV-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 07:59, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   50d05c7c76c96b90462f24debacca971d2e86713
> commit: 092f8ec7dbdc71f5bde9bb0f8dead384d2115a44 ftrace: Protect direct_functions in update_ftrace_direct_mod
> date:   5 weeks ago
> config: x86_64-randconfig-122-20260911 (https://download.01.org/0day-ci/archive/20260911/202609110704.Q3M5vCDV-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609110704.Q3M5vCDV-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Fixes: 092f8ec7dbdc ("ftrace: Protect direct_functions in update_ftrace_direct_mod")
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202609110704.Q3M5vCDV-lkp@intel.com/
> 

Hi,

I reproduced the warning with sparse v0.6.5-rc1. The patch below fixes
it locally.

Could you please retest it with the reported config?

Thanks,
Leon

---

From 03079b720a8cba88b3da579acfbcf88d983a838d Mon Sep 17 00:00:00 2001
From: Leon Hwang <leon.hwang@linux.dev>
Date: Fri, 11 Sep 2026 10:43:13 +0800
Subject: [PATCH] ftrace: Use rcu_assign_pointer() for tmp_ops filter hash

tmp_ops.func_hash->filter_hash is annotated __rcu, but
update_ftrace_direct_mod() assigns hash to it directly. Sparse reports an
address-space mismatch.

Use rcu_assign_pointer() for the assignment.

Fixes: 50b35c9e50a8 ("ftrace: Use hash argument for tmp_ops in
update_ftrace_direct_mod")
Reported-by: kernel test robot <lkp@intel.com>
Closes:
https://lore.kernel.org/oe-kbuild-all/202609110704.Q3M5vCDV-lkp@intel.com/
Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 kernel/trace/ftrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 53d5db60bfa5..673a54fdf392 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -6675,7 +6675,7 @@ int update_ftrace_direct_mod(struct ftrace_ops
*ops, struct ftrace_hash *hash, b

        /* Enable the tmp_ops to have the same functions as the hash
object. */
        ftrace_ops_init(&tmp_ops);
-       tmp_ops.func_hash->filter_hash = hash;
+       rcu_assign_pointer(tmp_ops.func_hash->filter_hash, hash);

        err = register_ftrace_function_nolock(&tmp_ops);
        if (err)
--
2.55.0

