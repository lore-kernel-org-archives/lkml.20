Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EF63546C5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 01:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788313032; cv=none; b=GgU41R90r91w1NojSr9ozbgoqMRWy8hA6mla3aAv5+mplTEWVB6abkUs2KqmmiC6n8nbKjwfq7L/+FfRhqYTr0qX0N1XGJsVPyJ8X+P1XoW9usJqpWROb5BHoERT3e1D7LOmWAr/1NBPFFUZkcxuq8QNLeQQ4zpWTVzSSbVAumk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788313032; c=relaxed/simple;
	bh=bs9bhKkHlLjxsVIdPhNefhVuC7ny4CRn4sjjxmGBbzw=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Td1Xl3msjgf5spUcBMU/LBS49UbFE2zTkvPefk55vfdYeU0Iqv5YojBNYMkBBluJRKzcrkQZzEDbRecpQ13f5mfVwGOp5UalcU06fXQsQBFSKujEmJYx8Va0WushP7CKz0muKDSPzEDBv6bWWJBxuENfpS0DSnEHLpW1JlFk3EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4sVWmnQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4sVWmnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788313028; x=1819849028;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bs9bhKkHlLjxsVIdPhNefhVuC7ny4CRn4sjjxmGBbzw=;
  b=V4sVWmnQZV+GmhyuRo0HuQ4Uxft/tcnyH/BHvQW5h2h36ArbzfpHejtz
   8Nzhkw4OB88lDnYgb7mXocU4eJEw3Lo0LD8JM00mTiAw5f4x251sDokgj
   ek1t0CsrZQfzheluBtR+0iagYoOpcfrfrQSqIO/tONOlG9j5iPYrR7cD3
   n3psTPXukNmUpBvlZTcdQi8IXKDUldGBTi3OewgBrb9QvZdwhpewDYjlO
   h2hq/PT2TwIJXwj/5I9eho+kSfO2QYaD+QjfcvTyFQzPCmntCcjP7eZVC
   T7DP0OpXaciAjqbLGOnA/I8F6gxAv8/PvCbyrBUw8BkgUxZh8Y2ZwSsqI
   w==;
X-CSE-ConnectionGUID: tfCgMWFdSdyjIxCvkJRFPg==
X-CSE-MsgGUID: s4qoqor+RBOIlOps1F7hfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="111530238"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="111530238"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 18:37:06 -0700
X-CSE-ConnectionGUID: 8K5ZbrpRT2aABIcLFKzl+Q==
X-CSE-MsgGUID: cPOStOv/TSCSwL1qhx92Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="271219997"
Received: from unknown (HELO [10.238.1.188]) ([10.238.1.188])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 18:37:04 -0700
Message-ID: <19132505-225a-45fb-a507-b916a718dccc@linux.intel.com>
Date: Wed, 2 Sep 2026 09:37:00 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/sva: remove iommu_sva_present flag
To: Zhaoyu Liu <liuzhaoyu.zackary@picoheart.com>, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com
References: <aoq8VGFL/Mdjd/M5@hostpc>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <aoq8VGFL/Mdjd/M5@hostpc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/23/2026 5:24 PM, Zhaoyu Liu wrote:
> The global iommu_sva_present bool merely mirrors
> !list_empty(&iommu_sva_mms) under the same mutex. Remove it and rely
> on list_for_each_entry to handle the empty list case, which is a no-op.
> 
> Signed-off-by: Zhaoyu Liu<liuzhaoyu.zackary@picoheart.com>
> ---
>   drivers/iommu/iommu-sva.c | 14 +++-----------
>   1 file changed, 3 insertions(+), 11 deletions(-)

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
