Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A05D43F0A7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769875; cv=none; b=g/mk3xO6ITcmyfe/hHrrc8gPLTaZfDPYam2LmUQITKTr9tDFXFk4yMeB82p14pBBITlhYtBJmwAvvek0VDENjzs8kk9s+0AiGOis9hx/jvfs8mm0K6T+/lZ+bR1Ai3VaxSNDcmxpAOpZzDbMqggGj/5rZrcPrE/1KoMf45ZNagA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769875; c=relaxed/simple;
	bh=cqpSnGnW7hhm7vWJ2uOFKl+pZ0tZ6rP2KfFVhXNGE8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KDk2Ud9PUXjBkBfaZViZh1BM8v1kY37vkq77LrORyj5LTAlqloBx1txZWmf/oPOivnWsyJQgCiziq2ISOr/c0ySeaue3IGbnJ+N8waWBtF+t8IP+/TZV6oJQMA9myBZP7t1Yl+2Wii9x/3xaqlRYM65JHU4oWdO8P1Glw0k3uLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=qg/3aScO; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="qg/3aScO"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788769870; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=sNYbximMpK7VrrVyM2o6QdpnBm9Ldr/h1nfCIIWu6as=;
	b=qg/3aScOAkg+FHatts2ZRJfmQH3s9dzixXszZI0NaCj1oycLiIQrswE7YEEG5OriFBmYDGyZVjyfleCqxp79QcBx/L/Qxjmm1JJArAaGwwKHQOGMMddbtNK5DzafxnRrYcJ940JcS+i1jH5DUScIO1kWa0KFyWIUXholXxLh/GE=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R371e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XARxh7s_1788769867;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XARxh7s_1788769867 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 16:31:08 +0800
Message-ID: <6367723f-f8e6-46c1-8c50-abe5ef68c819@linux.alibaba.com>
Date: Mon, 7 Sep 2026 16:31:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] mm/collapse: name the per-table scan reset for what
 it resets
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Zi Yan <ziy@nvidia.com>, "Liam R . Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <cover.1788533997.git.kas@kernel.org>
 <ec3d193817dfa5d0e4fa2f31642c066ebfdd3151.1788533997.git.kas@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ec3d193817dfa5d0e4fa2f31642c066ebfdd3151.1788533997.git.kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/4/26 11:10 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> collapse_control_init_scan() resets what one scan accumulates: the node
> load, the allocation nodemask and the eligible-PTE bitmap.  It runs before
> every PTE table a scan is given, not once per control, so its name points
> at the wrong thing.
> 
> Call it collapse_scan_reset().
> 
> Preparation for giving a control a real init and release, run once each
> for a whole series of scans.  Two names a word apart would then stand for
> two different jobs.
> 
> No functional change.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
