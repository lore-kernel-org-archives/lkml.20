Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C593F47FAEA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785973; cv=none; b=G1JHsnvmxla5a5oG096n95H9EuwCvTZcj1M6TCIbUL9QGn89HIJN7Tp/TNYLKAnob5MDg+Uhji/0ONwOCeFGnxK5kMvqP9la+W/KFKiamULLk22T9XW9DHv+BWKE5ew/CcAVOh2FX+dLFY0ZR4H7Lmgab3t9LLQGDayGViP96wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785973; c=relaxed/simple;
	bh=fs6D9307+D5ofEdJVbGr/fE9RQA62x0tlXgWzmyLjRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VksWGTkueX2n3WxbS69y3gCALFNfjUfOvnEGRkyCejspKTCXQgWtMBkim9rBjVfb8r0M/lvwu8yiFPqQTxO2mxtReMzV1s0078Xuq4pArkMTmq8pziCRtqOrLq99kYJC/j1u9CzseY1hA8scEWvVt5TQOFGayrjGRqdJeqHtwiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=u233w6RG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="u233w6RG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7758D1476;
	Mon,  7 Sep 2026 05:59:13 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4F033F7D8;
	Mon,  7 Sep 2026 05:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788785957; bh=fs6D9307+D5ofEdJVbGr/fE9RQA62x0tlXgWzmyLjRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u233w6RGdA63wnnNOM1ASAwHeUBU9au3b10Ya20EViUQr9/u/7lzCA0HCjc7gpO6l
	 NEj+i2bTMvaL5FGzTDGLjpvKlyE8gThWSFwbZdk8fIdt0fARLgl6r4RJnSkSzPa/ai
	 WUpyFueqgRTQ4D5MDkaI/ABLRrSN3tYBa86tkZXM=
Message-ID: <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
Date: Mon, 7 Sep 2026 13:59:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Andre Przywara <andre.przywara@arm.com>, James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260902143757.3469690-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andre,

On 02/09/2026 15:37, Andre Przywara wrote:
> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
> error value.
> 
> Check the returned value for this error condition, before passing the
> value on to other code, which would hide the negative number in some high
> value in the unsigned type.
> 
> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

This looks good to me. Out of interest what led you to find this?

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

> ---
>  drivers/resctrl/mpam_resctrl.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 9d223057953ab..a5e661eff86d7 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>  /* Find the L3 cache that has affinity with this CPU */
>  static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>  {
> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
> +
> +	if (cache_id < 0)
> +		return -ENOENT;
>  
>  	lockdep_assert_cpus_held();
>  

