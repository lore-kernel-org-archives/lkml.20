Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793347628;
	b=t5PlhDdBSd7CYdBX3w74x3dgStv98YcgmBUzlx9jVDvdGg4O4G4lJllYIOUkOkXo5wog
	 0KMkbPfqVXhOrz87J/BSEJGjApO9gwYt02uWaIvEMJt1PZs0NX/b3BbWcsdE8bUfNxrg+
	 SeVjUkToBk9tQzWLMTocW8RFj+wPELJ+QCt+CHfnHYjRAVWCygB30J4X+jGkrlxvbvT4z
	 0p6EY396YSIyPf/Wq5LBpcT5up56fO1PwQQdB/FV0XRbvUFKpchqGrLksGl+JHsETvuyS
	 ilyb7xiDZIT2Bo66UlSo+tBXYa56l9dyD6RsY+YbeIYri2tQusGkPfNZVIdj1YdNtFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793347628;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=+v8siQbRKd/hqcz0jYUhtmBmjHu6PnjE9DNLi9cq2d0=;
	b=zYqb5nCSbbMbtECy3tx4z2yrQ/HSlJS4MTYVVKgzXhBNv8ANFCqQDBIrLITMP1PeFTIR
	 tz5MgYIYaml2Ylu1UpzJ4GGiQ249jgeUCYDkYG3teRjNtHnWc1LBDO8v+m2Kt84eVgEl8
	 vXlMzlR5sfeoe99+b4Su0YgFE7WFaJ2Ix0WuBYGaVacwgVf4lfNMZMTKMvH20OlLizofK
	 l+vt+86F+h8yqAKt58k44tG0r4uIj/8wstgf75jM76cBf0I60q1MF9O+9drNa4oiOtquM
	 WwkryfKDEJCvY5TBJ6CX7dUatCytu211pWWj2KE6m5B/pRs21I/bv22x2Y+YcYRdCxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=X04yed1E;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29623606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29623606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=X04yed1E
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=+v8siQbRKd/hqcz0jYUhtmBmjHu6PnjE9DNLi9cq2d0=;
	b=X04yed1Ey5Xf0lCLEZqp+dNtsSmaHb4mdY4tc7Z3xKj1dDGa1LOQBStwbfes1yI9iWJ8W1fSQ
	ksF4VP+fcyfRN543TLKqWWI1BPthh47s5wJ+gHCZwpvRgAMZEkFIxw/2gApjVuklPuDO3eSxi6N
	IeneDSHB6Anq/LmRxjQwV/o=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jGDGD51mCz12Ld1;
	Fri, 30 Oct 2026 16:07:00 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id BCB7740561;
	Fri, 30 Oct 2026 16:07:02 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 30 Oct
 2026 16:07:02 +0800
Message-ID: <d1a81d20-3458-49ef-9adf-316b7574424c@huawei.com>
Date: Fri, 30 Oct 2026 16:07:01 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fs/resctrl: Return -EBUSY when per-CLOSID RMIDs are
 in limbo
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261029081513.924019-1-ruanjinjie@huawei.com>
 <20261029081513.924019-2-ruanjinjie@huawei.com>
 <0f6c4323-0ffb-414d-92be-e8515e05ab0e@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <0f6c4323-0ffb-414d-92be-e8515e05ab0e@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/30 2:12, Reinette Chatre 写道:
> Hi Jinjie,
> 
> Thank you very much for these fixes.
> 
> On 10/29/26 1:15 AM, Jinjie Ruan wrote:
>> resctrl_find_free_rmid() returns -ENOSPC when no matching RMID is
>> found. With CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID the target CLOSID may
>> have RMIDs in limbo rather than permanently exhausted.
> 
> Just a quick note about customs around resctrl fs and x86 patches that relate to
> both of these patches:
>   The resctrl patches need to follow the tip requirements documented in
>   Documentation/process/maintainer-tip.rst. Of particular note is the "Changelog"
>   section that needs fixes to be described in a particular format consisting
>   of a context, problem, and solution.

Hi, Reinette

Thanks for the reminder.

>   Apart from this the changelog should avoid narrating the code and instead
>   describe it at a higher level to support understanding without needing to
>   refer to the code and the impact.

I got it.

> 
> Even though the changelog mentions CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID
> it is written for somebody very familiar with the code and it is possible to
> state the impact more clearly without needing to go look where
> CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is set. I also think that it would be helpful
> to describe all scenarios of the issue to help support the shape of the fix.

Ok, will add them.

> 
> As an example that aims to address all comments above, consider a changelog
> like below:
> 
>   fs/resctrl: Report a temporary RMID shortage per CLOSID
> 
>   An RMID that is freed is held in limbo until its cache occupancy drops
>   below the threshold, after which it returns to the free list. A
>   request that fails because of limbo is thus temporary and worth
>   retrying, which resctrl reports to userspace as -EBUSY. A request
>   that fails because every RMID is in use is permanent and reported as
>   -ENOSPC.
> 
>   Where an RMID is only meaningful together with a CLOSID, a request can
>   only be satisfied by an RMID belonging to the requested CLOSID, so the
>   distinction has to be drawn per CLOSID. Instead it is drawn system
>   wide. -ENOSPC is reported when the free list holds no RMID for the
>   requested CLOSID, even when that CLOSID has RMIDs in limbo. -EBUSY is
>   reported when the free list is empty and another CLOSID has an RMID in
>   limbo, even when the requested CLOSID has none. Userspace is thus
>   told to give up on a shortage that may clear on its own, and to retry
>   one that cannot clear until it removes a group itself.
> 
>   Architectures where the RMID is independent of the CLOSID always match
>   the first entry on the free list, so neither case arises there and only
>   MPAM systems are affected.
> 
>   Draw the distinction from the number of RMIDs the requested CLOSID has
>   in limbo where the RMID depends on the CLOSID, and from the system
>   wide count otherwise. Drop the separate test for an empty free list,
>   which the search handles on its own.

Thank you very much for your example.

> 
>>
>> Check closid_num_dirty_rmid[] for the target CLOSID before returning
>> -ENOSPC, and return -EBUSY so userspace can retry.
>>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Cc: Babu Moger <babu.moger@amd.com>
>> Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
> 
> We should take care here. Even though this "Fixes:" commit added support for
> RMID allocation to be scoped by CLOSID this issue only impacts MPAM systems,
> and MPAM support landed after this commit.
> 
> Do you think this needs a "Cc: stable" tag? Have you heard complaints from

Yes , this need one.

> users or is this just something you noticed? Having a benefit to users may
> be sufficient justification for adding a stable tag. Accuracy of
> "Fixes:" tag is then very important, or the stable tag self can have extra
> information on which kernels need it.
> 
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> 
> Please re-order the tags based on "Ordering of commit tags" found in
> Documentation/process/maintainer-tip.rst

Thank you very much! I will check it.

> 
>> ---
>>  fs/resctrl/monitor.c | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>
> Patch looks good to me.
> 
> Thank you very much.
> 
> Reinette

-- 
Best regards,
Jinjie

