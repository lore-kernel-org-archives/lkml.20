Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4502D29C8
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788003173; cv=none; b=abqrvFefJFYk2gemoruBdTSiQY0X6EFW3pEPCtIWXMFIdXmjESq6ik6/agwZXILrKxckmTXPW1OiZug9Ww/U7NiI03mILkFfjao4b89aLdZJEUbvaSEEktGkRqcddv7TkQQ5z6eLnnQwE9LSjg9SiF2m2fewlNfpQLJoJmsWhkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788003173; c=relaxed/simple;
	bh=gwk+BI46++mQRfC3AlfNr23A+9jAy9KyTdI8CCPcTAI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TDjwlc3tGcM3M+YnJtSL8pN3K1Qix1CA59P5hzYFrsMMfQef9Ql8D6n2hBYBxNnxh15sD3GzYw9feX9HzltIZWZSbiwEdHGhwq8/p5nJofKuU3tgj/3c0zmUDZ/yla8nkxqxdV1Umv2AFm/9rmgdr20NAD2LyjCVcNhokYSW81w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=aXgWjF3R; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="aXgWjF3R"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gwk+BI46++mQRfC3AlfNr23A+9jAy9KyTdI8CCPcTAI=;
	b=aXgWjF3RCIrF73N2rxm23D543lwf65bN7UvH+g2NVAUDpVegRpfeATmI1PN02/WVWdpSFpa8M
	HWWnQOsJJpTvtR/aOTzTUPlt0KBHGvJmorYqKsCmKC7Tj1nlMNL+LZRwlN2uVVEpzZ6CT8gBQBD
	84eIU0ZhClM0bygV8z+7uEY=
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hXClX0C7TzJ4686;
	Sat, 29 Aug 2026 19:32:08 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A8794058B;
	Sat, 29 Aug 2026 19:32:32 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Sat, 29 Aug 2026 14:32:31 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <cl@gentwo.org>
CC: <akpm@linux-foundation.org>, <artem.kuzin@huawei.com>,
	<catalin.marinas@arm.com>, <david@kernel.org>, <liam@infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux@armlinux.org.uk>, <ljs@kernel.org>,
	<mark.rutland@arm.com>, <mhocko@suse.com>, <panov.nikita@huawei.com>,
	<rppt@kernel.org>, <surenb@google.com>, <vbabka@kernel.org>,
	<wangkefeng.wang@huawei.com>, <will@kernel.org>,
	<yang.shi@os.amperecomputing.com>
Subject: Re: [RFC PATCH 00/18] mm: arm64: Add kernel replication feature
Date: Sat, 29 Aug 2026 19:19:53 +0800
Message-ID: <20260829111953.893466-1-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f47c0ab3-6d78-fcdc-b7c0-cd3a7b5c8276@gentwo.org>
References: <f47c0ab3-6d78-fcdc-b7c0-cd3a7b5c8276@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500004.china.huawei.com (7.188.26.250)

Hello, thanks a lot for your reply.

On 8/28/2026 8:58 PM, Christoph Lameter (Ampere) wrote:
> On Fri, 28 Aug 2026, Nikita Panov wrote:
>
>> There were several prior submissions with some sort of replication
>> for NUMA systems, including one from our side for the x86_64 platform.
>> In the last couple years, several research articles related to solving
>> locality issues on NUMA machines through replication emerged as well.
>
> Thank you for this work. This aligns with our efforts to increase data
> locality and the performance of local data access. Yang Shi has a patchset
> that introduces similar code to be able to map partial virtual ranges
> differently. His code may be more mature and I think these mechanisms can
> be used in a straightforward way in future iterations of your patchset.
>
> If we combine our efforts then I think we could be rapidly come to a clean
> implementation that can be merged.
>

I will check these patches in detail and leave some comments during the
following week (or to the v3, if it will be published).
At a first glance, code is definitely more mature and can be reused
for the text replication patches.
It would be great if we merged our efforts to produce something clean
and viable.

>
> Please see Yang Shi's patches. We can provide resources to push this
> functionality forward and have seen significant performance improvements
> with earlier approaches like this. There is significant customer demand as
> well.
>
> https://lore.kernel.org/all/0344c559-1959-4531-9265-d5a5180eb7cd@arm.com/
>

For me, it looks like the kernel text and rodata replication could be
adapted on top of the "Optimize this_cpu_*" patch set.
Problems with pgd synchronizations are the same and should be fixed as well.
Since vmalloc code is used for percpu memory allocations, module replication
might be supported, the only thing that should be taken into account -
data locality.
Consider all of this, we can focus on preparing the new patch series, on top of
the Yang Shi's patches and share it. If that path is ok, we will start.

Thanks again for your input.

BR
Nikita Panov
