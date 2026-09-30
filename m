Received: from va-1-115.ptr.blmpb.com (va-1-115.ptr.blmpb.com [209.127.230.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8824344F564
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790758831; cv=none; b=BY9gzouEJN9RoiWraNmwIaENDnWCNP3Ebz0uS7Klo0k5AsKNeLe9dCCRiOjR0QcS2h7qqQur28xCaO41KoK3LdS+TP5HZbQpvDP3movNgDL3/5cGDPADRkoTppFGNmYnQXQWc+up7pmyxFRyj0sVUhnFPfS8l5NdJyEeO4ktI4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790758831; c=relaxed/simple;
	bh=Vbt5iyPLRXtEJgyVkzGCbXczZDhTv0UsZ2K6hMdH7UQ=;
	h=Date:From:Mime-Version:References:In-Reply-To:To:Subject:
	 Content-Type:Cc:Message-Id; b=Qm0af7COslDI7k46C6qSXJJg/VB0wWRg2HLQh1MQPd+aDf96pAXh+pgITo8ZQGgH/Sqy1AM4KUt7Pnpw9SU0AIz0my8cykVjetO6u1mCwYwy3JKLAPDl+sKQXV3Xv7j28kyIAdZAezqc/RhQibb6xrtKoywEP0JrPazuKHx7t80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=G67RfIt5; arc=none smtp.client-ip=209.127.230.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="G67RfIt5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1790758825; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=CyczEz5gT341e5VUYWKWi3gWeXf1xphfZZ7IhgAwPn0=;
 b=G67RfIt5uJ2Cmbppq6XHyrZv0cuB/SVJ0F8IxSPmIOzkofMVEeEfrPS3SwonFLIrzJsQel
 x7sJxk7bLPPbZAJnlm+ZR11vLXeWLhhTT3IkGLuCnUNpPTtn5959UrtGuxXqb3Gu3eRnOC
 wvvr1F/TlI1buwsrvOW9qBrHY8RuWakQgF82uSqnXbEPOHHc4lBFG9v/vOLPVHR2YbzI1x
 Vmr5Iy6qgn7YgsPrOqsNAB2W0bUFvrZ/bq3aZ5d9jscPuU2+YifNEk2sYJg+T8A8WEJd/z
 sv06Brjzq1yVIzHVsGyJa+pauMlGo2DiwEJU6VWJjRGQUrDyclTvLXhRC/odTA==
Date: Wed, 30 Sep 2026 16:59:50 +0800
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
X-Lms-Return-Path: <lba+26abccf9f+a9f466+vger.kernel.org+lizhe.67@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930072617.64665-1-lizhe.67@bytedance.com> <arzLw18RiTN6Hmey@fedora>
In-Reply-To: <arzLw18RiTN6Hmey@fedora>
To: "Gregory Price" <gourry@gourry.net>
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference with MPOL_WEIGHTED_INTERLEAVE policy
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8
User-Agent: Mozilla Thunderbird
Cc: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<liam@infradead.org>, <rppt@kernel.org>, <mhocko@suse.com>, 
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <ziy@nvidia.com>, 
	<joshua.hahnjy@gmail.com>, <ying.huang@linux.alibaba.com>, 
	<apopple@nvidia.com>, <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Message-Id: <7df34f77-2c52-47a3-a495-d782009ab543@bytedance.com>

On 9/30/26 4:43 PM, Gregory Price wrote:
> On Wed, Sep 30, 2026 at 03:26:17PM +0800, Li Zhe wrote:
>> Allow MPOL_F_NUMA_BALANCING for MPOL_WEIGHTED_INTERLEAVE.  As with
>> MPOL_BIND and MPOL_PREFERRED_MANY, keep migration constrained by the
>> policy nodemask: if the CPU's node is outside the nodemask, do not
>> migrate the folio there.
>>
> Why for WEIGHTED_INTERLEAVE and not INTERLEAVE as well?


Thanks for pointing this out.

I focused on MPOL_WEIGHTED_INTERLEAVE in v1 because the motivating use
case is to seed memory across tiers with a configurable ratio at
allocation time, and then let NUMA balancing/memory tiering adjust the
placement based on access patterns. With equal weights,
MPOL_WEIGHTED_INTERLEAVE can also cover the regular interleave
allocation pattern.

That said, I agree that MPOL_INTERLEAVE can be handled consistently as
well. Since this is still an explicit opt-in via MPOL_F_NUMA_BALANCING,
unless others see a reason to keep MPOL_INTERLEAVE out, I will extend
this in v2 to cover both MPOL_INTERLEAVE and MPOL_WEIGHTED_INTERLEAVE
with the same nodemask constraint.

Thanks,
Zhe

>
> Otherwise this seems reasonable.
>
> ~Gregory
