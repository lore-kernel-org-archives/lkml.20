Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E29353A8F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790220970; cv=none; b=jDOBOnttAPLmxK4JBPu8XdhdDREjvedkTdgEKvgcUV1zXrpc3xJ0YTm65vs/vC1xhFHUmMWpqkZQDq1cvrxH39JHvY665DEMUjadVBozMXmMmCaHUFgg2yqqR2Lxbz5VoPfuvcaImF0PiJiecARNEM6auj+eHvf5YPchorw0LYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790220970; c=relaxed/simple;
	bh=sJZTiRE4OUMgIDk5R/0YM1dl/ks9KGppBoMMxq9hWO4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h32yNaK3K6JbG/sPJGg4Ha4S2mxInAnRMuXQWvlSPv49oFVp1N9f9GZCJyZKYMCMiHpxf6MvxAT+u11ytsES0L0fm8D2vIfuUzTXiNOQkVMhz7mhrfJgTedm1kWRhWx7ckO7kLmeX5SjDBAvePmECRkIQZqv/14LqesxyJnuFbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=nLm1iL6D; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="nLm1iL6D"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790220959; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=9RKSlysD+0ZWwxjfgD/8VADDTDaH0BRY2XHrTBmcZlc=;
	b=nLm1iL6DFV84z/uF4enlJc04kix8W5lar+9Oj+T4EKbjtIfc13L3ZSkbNGHFaeE8We4JNEGFpggTN00QODbzYh4BSh4HDXhTfruyJXWygIKt7tFnH5mgB3S4xFRIC05hcrUQE/t+GxmsWm9WdNd4FyBICq9ry7msyr7ICTfUXyk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0XBYWSto_1790220957;
Received: from 30.178.84.73(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XBYWSto_1790220957 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Sep 2026 11:35:58 +0800
Message-ID: <e5c16b71-1ee8-46e6-a100-c49ce81a80e7@linux.alibaba.com>
Date: Thu, 24 Sep 2026 11:35:57 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] checkpatch: don't flag ACQUIRE_ERR() assignments
 in if conditions
To: Alison Schofield <alison.schofield@intel.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-kernel@vger.kernel.org
References: <20260916020921.3480730-1-kanie@linux.alibaba.com>
 <arMQGUpW2snww9-a@aschofie-mobl2.lan>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <arMQGUpW2snww9-a@aschofie-mobl2.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/23 07:32, Alison Schofield 写道:
> On Wed, Sep 16, 2026 at 10:09:21AM +0800, Guixin Liu wrote:
>> ACQUIRE_ERR() and its wrappers, PM_RUNTIME_ACQUIRE_ERR() and
>> IIO_DEV_ACQUIRE_FAILED(), report whether a conditional cleanup.h guard
>> was acquired, and drivers consume the result directly in an if
>> condition:
>>
>> 	if ((rc = ACQUIRE_ERR(mutex_intr, &lock)))
>> 		return rc;
>>
>> That combined form is the established style at the 49 in-tree call
>> sites under drivers/cxl and drivers/pci/tsm.c, so ASSIGN_IN_IF fires
>> there only as a false positive, and every patch touching those lines
>> carries noise that reviewers have to wave off manually.
>>
>> Skip the check when the assigned expression is a call to a macro from
>> that family, matched by the *_ACQUIRE_ERR() / *_ACQUIRE_FAILED() naming
>> convention of its wrappers. Plain assignments and near-miss identifiers
>> still get flagged.
> Hi Guixin,
>
> Glad to see you picking this up!
>
> I tried to address the same checkpatch false positive last year. Joe Perches
> gave some useful feedback on my v1, including a suggestion to use checkpatch's
> $Lval, and I incorporated that into v2 along with some test cases. That may
> be useful for your next version.
>
> More inline -
Yes, got that, thanks.
>
>> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
>> ---
>> Discussion leading to this patch, where the false positive showed up on
>> a cxl patch and covering the wrapper macros was requested as well:
>>
>> https://lore.kernel.org/linux-cxl/20260910094017.4032170-3-kanie@linux.alibaba.com/
>>
>>  scripts/checkpatch.pl | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index 8a7787d228a6..fbc500bcfaa1 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -5777,7 +5777,12 @@ sub process {
>>  			my ($s, $c) = ($stat, $cond);
>>  			my $fixed_assign_in_if = 0;
>>  
>> -			if ($c =~ /\bif\s*\(.*[^<>!=]=[^=].*/s) {
>> +			# ACQUIRE_ERR() and its wrappers, e.g. PM_RUNTIME_ACQUIRE_ERR()
>> +			# and IIO_DEV_ACQUIRE_FAILED(), are intended to be evaluated in
>> +			# an if condition, with the error assigned in the condition:
>> +			#	if ((rc = ACQUIRE_ERR(name, &lock)))
>> +			if ($c =~ /\bif\s*\(.*[^<>!=]=[^=].*/s &&
>> +			    $c !~ /=\s*\w*ACQUIRE_(?:ERR|FAILED)\s*\(/) {
> What happens if there is also an unrelated assignment in the condition? For example:
> 	if ((rc = regular_function()) || (ret = ACQUIRE_ERR(lock_type, &lock)))
>
> It looks like the ACQUIRE_ERR() match suppresses ASSIGN_IN_IF for the whole condition,
> including the unrelated assignment.
>
> Could you use $Lval, as Joe suggested on my v1, to make this more precise?
OK, changed in v2, thanks.
> I also suggest running this against a small test program with the expected-pass cases,
> ordinary assignments, and mixed cases like the one above. Feel free to reuse or extend
> the test cases from my v2 [1].
Sure, I will try to test as much as possible.
>
> Could you also Cc linux-cxl on the next version? There are several users of this form
> there, so it may help get some review and testing tags on the patch.
OK, will cc linux-cxl in v2, thanks.

Best Regards,
Guixin Liu
>
> -- Alison
>
>
> [1] https://lore.kernel.org/linux-cxl/20250815010645.2980846-1-alison.schofield@intel.com/
>
>
>
>
>>  				if (ERROR("ASSIGN_IN_IF",
>>  					  "do not use assignment in if condition\n" . $herecurr) &&
>>  				    $fix && $perl_version_ok) {
>>
>> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
>> -- 
>> 2.43.7
>>

