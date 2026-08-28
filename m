Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9D8472771
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929818; cv=none; b=oGqPYozQRPzRrUUUoAWQSrzQlZhwL9CkIFVo4yXwd8NhzXD8HoB5GFuYHim2l8aD8xxUshsJz2Mw7SNNJJmgbf2jB4W5YJgyTa5uVWUyYpcrXGGdJ1r6bR/3kAQ4nxyNSSPkokxnO4TjjOk1uhewlGEGcclEH8Ol7Jf9ayOZxYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929818; c=relaxed/simple;
	bh=6L2NbXsR0lqaz4BRcEB7uuVvOOdxIBGhUOmI6+xRtG4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cGjq0Rbo8F6NxHApLIg9rQ9hRXlJ8THfxCzEvcyhbe/p/Ww8/aCQdJpvxqo/SczFjleZAiltJp+QAegVSqdsR6PYjALgI3/Ojd8mNt5sXCzrEXJN8hA2RQlnFG/qvMdWquW7PwDGHe2AURYlSshlZVng+o39KIR496CByN+5OMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=R1hTVSbR; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="R1hTVSbR"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/4HXdOnEjO2UWQf+m+lpPrXMXF/LAxWYvhtSnXIOjTE=;
	b=R1hTVSbROxgMjucOhjQ77G4yaqYa014J8x5xfqFvl2dIoIb+mAvQcLkYukrhRy25n57jqSc/w
	uzhDI07JTYJWgTsrxh+FxBZYK03D6HkkR4bKKKj3UcHXLSpPkOSDePNFcmRkmOSnhLYk7Qd7CYk
	yv4xR7jpwTYeCorKcyJGeUY=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hWhd20y5rzJ46Zq;
	Fri, 28 Aug 2026 23:09:42 +0800 (CST)
Received: from mscpeml500003.china.huawei.com (unknown [7.188.49.51])
	by mail.maildlp.com (Postfix) with ESMTPS id 410F440570;
	Fri, 28 Aug 2026 23:10:05 +0800 (CST)
Received: from mscphis00060.huawei.com (10.123.65.147) by
 mscpeml500003.china.huawei.com (7.188.49.51) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 28 Aug 2026 18:10:04 +0300
From: Artem Kuzin <artem.kuzin@huawei.com>
To: <david@kernel.org>
CC: <akpm@linux-foundation.org>, <artem.kuzin@huawei.com>,
	<catalin.marinas@arm.com>, <cl@gentwo.org>, <liam@infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux@armlinux.org.uk>, <ljs@kernel.org>,
	<mark.rutland@arm.com>, <mhocko@suse.com>, <panov.nikita@huawei.com>,
	<rppt@kernel.org>, <surenb@google.com>, <vbabka@kernel.org>,
	<wangkefeng.wang@huawei.com>, <will@kernel.org>,
	<xiongyining1480@phytium.com.cn>, <wangyuquan1236@phytium.com.cn>
Subject: Re: [RFC PATCH 00/18] mm: arm64: Add kernel replication feature
Date: Fri, 28 Aug 2026 23:05:06 +0800
Message-ID: <20260828150506.1016096-1-artem.kuzin@huawei.com>
X-Mailer: git-send-email 2.34.1-openssl
In-Reply-To: <bbd45126-8d43-40eb-8a69-a7fb6d2378f1@kernel.org>
References: <bbd45126-8d43-40eb-8a69-a7fb6d2378f1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mscpeml100003.china.huawei.com (10.199.174.67) To
 mscpeml500003.china.huawei.com (7.188.49.51)

Hi!

On 8/27/2026 10:04 PM, David Hildenbrand (Arm) wrote:
> [...]
> 
> About to go on PTO, some random points :)
> 
>>
>>> [12] - Optimize this_cpu_*() ops for non-x86 (ARM64 for this series)
>>>
>>> As of today, none of it was merged into mainline.
>>
>> I mean :) maybe take that as a hint? If a number of series trying to do X get
>> rejected by upstream, that is maybe suggestive of barking up the wrong tree?
> 
> I'd have expected an explanation at that point why previous approaches were not
> merged and how this patch set is sufficiently different that it is worth
> maintainer's time.
> 
>>
>>> However, after thorough re-evaluation, we were not able to observe
>>> performance improvement for the x86 platform, so we have decided to stop this
>>> direction and switch on arm64.
>>
>> I mean, why? You should provide details here, this is quite hand-wavey. You are
>> also proposing core mm changes for something that seems specific to unique
>> hardware as far as I can tell, which is a big ask.
> 
> What I consider interesting is "after thorough re-evaluation, we were not able
> to observe performance improvement for the x86 platform".
> 
> How confident are we that a thorough re-evaluation on arm64 will not similarly
> have the same outcome? IOW, what was the problematic part when doing the x86
> evaluation, and how was that avoided when evaluating the arm64 implementation?
>
In the x86 kernel replication patchset, performance evaluation was done on a
relatively old platform. Garg Shivank <shivankg-AT-amd.com> evaluated it on
AMD EPYC 7713 64-Core processor (dual socket, 2 NUMA nodes, 64 CPUs on each node),
and the results were completely different - no performance benefits. At that time,
I was unable to reproduce and clarify the issue because I didn't have such machine.

Also, as Nikita mentioned, kernel replication on x86 machines introduces additional
overhead related to PGD management and user space updates propagation.

As for ARM, I remember that the guys from Phytium published relatively good
performance evaluation results. [1]

Yes, both patchsets (x86 and ARM) are far from ready for upstream state,
and there has been very little feedback on them. It was not completely clear if it
is worth continuing with the kernel replication idea.

[1] https://lwn.net/ml/linux-doc/ZbjOZ1YOQUBxftrR@shell.armlinux.org.uk/

Cheers, Artem

