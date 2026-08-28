Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8F646C4AD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924911; cv=none; b=X+TT0Uu8zGwEES66NMpPYIkxL/mhqMAMrK92klrkMmnQ/WlB1fQY3gYrAJEmO3QNYkwkg/04BDlY6Np0CpwUvuAntWH8fwV+nX67C/F2lxbwMUYDUpzuTG1nrz+e/ytHph7lEVKRmYr8qRBUQV5rMVpwksT7+lXWOiTYUWgj0E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924911; c=relaxed/simple;
	bh=n9AJLnt/PiJqcn3DidIcLgCufShemItTDMInNpeJyxs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UqM5pnSsrIifWJypda8yshNEOcvhzOX8muW+pIqOVAznFhvZ9B4exbpJ+au0ojAWHPmuc4YsVdEFDKA3xe9T0yiXmxttTk+84TNYOTqkPg029/M2CMFULlnqhlRcQ6ntHa+yrO3kORpKP0Ww0MzjGHQAAGAD0x9jyITGetqbgrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=zP/rGh0d; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="zP/rGh0d"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=J1ieJYPbDNiuX52GiK9zhEf0t/H/HbxHvWGNyCiu+v4=;
	b=zP/rGh0dk1BELBjq0Zc4Qfjd02Y7orAY3TV0npmdI4UvF3g7xH08DJENULFGscJ40/322ZqNk
	DL9Be3+jtvS3SUcQi+I5dwrCRJvdS0l04jxaSb0pxDcMaF/wLdInLyExZIXJ+dXiGn2u0VoRyuw
	NtzuCm+VCxHXRaV7gGC8Ioc=
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4hWfpf4qYFzJ46ZW;
	Fri, 28 Aug 2026 21:47:54 +0800 (CST)
Received: from mscpeml500004.china.huawei.com (unknown [7.188.26.250])
	by mail.maildlp.com (Postfix) with ESMTPS id AF62740571;
	Fri, 28 Aug 2026 21:48:17 +0800 (CST)
Received: from mscphis00949.huawei.com (10.123.66.11) by
 mscpeml500004.china.huawei.com (7.188.26.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 28 Aug 2026 16:48:17 +0300
From: Nikita Panov <panov.nikita@huawei.com>
To: <willy@infradead.org>
CC: <akpm@linux-foundation.org>, <artem.kuzin@huawei.com>,
	<catalin.marinas@arm.com>, <cl@gentwo.org>, <david@kernel.org>,
	<liam@infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux@armlinux.org.uk>, <ljs@kernel.org>, <mark.rutland@arm.com>,
	<mhocko@suse.com>, <panov.nikita@huawei.com>, <rppt@kernel.org>,
	<surenb@google.com>, <vbabka@kernel.org>, <wangkefeng.wang@huawei.com>,
	<will@kernel.org>
Subject: Re: [RFC PATCH 00/18] mm: arm64: Add kernel replication feature
Date: Fri, 28 Aug 2026 21:35:47 +0800
Message-ID: <20260828133547.154953-1-panov.nikita@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <apCLzAaw6oRIqbSH@casper.infradead.org>
References: <apCLzAaw6oRIqbSH@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: mscpeml500003.china.huawei.com (7.188.49.51) To
 mscpeml500004.china.huawei.com (7.188.26.250)

Hello, thanks for your comment.

On 8/27/2026 10:11 PM, Matthew Wilcox wrote:
> On Fri, Aug 28, 2026 at 12:11:40AM +0800, Nikita Panov wrote:
>> There were several prior submissions with some sort of replication
>> for NUMA systems, including one from our side for the x86_64 platform.
>> In the last couple years, several research articles related to solving
>> locality issues on NUMA machines through replication emerged as well.
>
> You're lumping a lot of different NUMA replication things together in
> your list.  That doesn't give me confidence you know what you're doing.
>
> I *think* what you're doing here is kernel text replication.  Other
> architectures (mips, arm) have managed to do this without core MM
> changes.  Why can't you?

Yes, this patch set is for kernel text and rodata replication.
For arm such technique was not adapted by the Linux kernel.

Regarding mips, this is achieved through the TLB lockdown feature.
For aarch64 this feature is *implementation-defined*. Moreover, looks like
not a single vendor of modern enterprise aarch64 servers actually implements
it. But even having this feature would not allow us to implement
fully function kernel rodata replication:
1. TLB capacity is very limited, we can't lockdown a significant amount of
entries. In case if small pages are used for kernel text mapping (64k kernels)
this approach is not suitable.
2. Some core modifications are still required - text patching at least should
be aware of memory replicas. But yes, changes are significantly
smaller and easier.
3. Replication in kernel modules most likely will not be possible due to limited
TLB capacity as well.

Implementation could have been done only for 4K page size kernels
(maybe for 16K as well, if we do not mind some memory overconsumption),
only for kernel text and rodata. In addition, locking TLB entries for
the kernel reduces TLB capacity for user space applications.
How badly this will affect performance, I cannot say without actual hardware.

BR
Nikita Panov

