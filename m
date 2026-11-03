Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723929;
	b=bKV/+qRt7ap0N3C8Q2rM6UsmCp8xxkmPiSs5tc7gbGbtBUyIg47qgErhYBJxTqp/E+fv
	 9MiVuTk3KyNyFaM5JTnNYwXoVw79j8kGphUbRu/DZYMmpaor8r8Pl1UrqwazJC8pzOVr0
	 aLrNi91Ra5ZjTILrZBOaN+Ip1clapAOJlCB9DAcl7iO5GVPX9kh7XHBs32XmtkUfYreiM
	 ikjfewNolB9/vglY9Ky28bi+c+MjcvUKmqZBvN2bdhNJ643n1ov6rA6YBvefSSFTpqmgQ
	 LcWblTPh1b8YupkTIJ5Qzml/R86Yo/FUd+MmgtTTpdS/6fjDRdjkpFlrnb+GxiEo74A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723929;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7hO7j2WXv/PYcl55M/dCw5Cjb0o53osmcDal0KCyt7Y=;
	b=Lx0P8DK/uQbB/DtoCwVE0pEvHqb3HvLupXAAavOVN6Xw/mpL6YBfnD1xGmSvI24jRZmT
	 sRhWi7ZlkpQYbGDsp29u9kFDVRxWZKpKJC6B6v+oUftzMXMHcKqMLEVI0C4fOrx+dBcPk
	 pbxkJ14suU2ufWN6xgEfAsd9yidnMsBwkEkCNlNXo/rftr04H+tHzyaaKjD+41hs9A/n4
	 3kH40CpgAStMrP07/pwV1UmTjOU2q0UiC0UHBzVEuDmVizhxquVU2UB+0pryUpxQ28niH
	 B5JTH4fAPHgHLv3WnSeX6pfdv8xBiYGPRDVpQWhPNm5yOg3RNTfrVSMoxtZHMfRkW4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Pp0Hq8zy;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A242606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A242606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Pp0Hq8zy
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 467311595;
	Tue,  3 Nov 2026 08:38:44 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.89.242])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A8F93F628;
	Tue,  3 Nov 2026 08:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793723927; bh=DVeSfP6PI+YI1+rJ351kSNVh7maxZUYnlX0df1Cjh70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pp0Hq8zyGtIZVg8FSCk/GPvJ8sMpcdvBS7KVszXZY0J3usDWySRRAFqVl3uWvsClF
	 G/6lqtuflXknv2ZwgY1op6XKbJIrkiOp5q3oFQ0xDfyxE533L6SC4xyA9dxwYBVq9W
	 iA7sQhV6kJAhyeVfKsxU4Q1iM0vOvz4GUIYuE+UE=
Message-ID: <49141409-b0af-46f9-8e1e-47f7c9ed5ae2@arm.com>
Date: Tue, 3 Nov 2026 16:38:43 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH v2 08/10] arm_mpam: resctrl: Require a component for
 each monitoring event
To: Reinette Chatre <reinette.chatre@intel.com>, james.morse@arm.com,
 Dave.Martin@arm.com, fenghuay@nvidia.com
Cc: tony.luck@intel.com, yu.c.chen@intel.com, babu.moger@amd.com,
 fustini@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev
References: <cover.1792443633.git.reinette.chatre@intel.com>
 <3384e5bedb29e3a0bd7fa383939db8ca70c4a733.1792443633.git.reinette.chatre@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <3384e5bedb29e3a0bd7fa383939db8ca70c4a733.1792443633.git.reinette.chatre@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette,

Seems good to me.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

On 19/10/2026 23:07, Reinette Chatre wrote:
> Setting up a monitoring domain looks up, for each monitoring event, the
> component of the event's class that contains the CPU and records it in
> the domain. Reading and resetting the event's counters in the domain
> then use the recorded component.
> 
> If an event's class has no component for the CPU, the domain is still
> set up as long as another event's class has one, and the event is left
> without a component. Reading or resetting the event's counters in that
> domain then dereferences a NULL component. This is not expected to
> happen since only classes that cover all possible CPUs are picked for
> monitoring.
> 
> Fail setting up the monitoring domain, with a warning, if an event's
> class has no component for the CPU, so that every event of a monitoring
> domain has a component.
> 
> Keep the check that at least one component was found. It now only fails
> if no event has a class, and so captures that a resource that supports
> monitoring has at least one monitoring event with a class.
> 
> Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
>  drivers/resctrl/mpam_resctrl.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
> index 63c5bf45856d..36a924734484 100644
> --- a/drivers/resctrl/mpam_resctrl.c
> +++ b/drivers/resctrl/mpam_resctrl.c
> @@ -1661,9 +1661,11 @@ static int mpam_resctrl_setup_mon_domain(unsigned int cpu,
>  			continue;       // dummy resource
>  
>  		mon_comp = find_component(mon->class, cpu);
> +		if (WARN_ON_ONCE(!mon_comp))
> +			return -EFAULT;
> +
>  		dom->mon_comp[eventid] = mon_comp;
> -		if (mon_comp)
> -			any_mon_comp = mon_comp;
> +		any_mon_comp = mon_comp;
>  	}
>  	if (WARN_ON_ONCE(!any_mon_comp))
>  		return -EFAULT;

