Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793246716;
	b=JZinKVS3aSVDhxTazwtM7w+CnC0lHkWJuKkdlb0T9J3KHGxaKW7jkcSrgV3AzIlzVNMz
	 +WxYlEACrQfXxqD3CgvUpvuqc3objFIdbTS5MU/PrkhwfK8rd7xe5/FWu4T6Fxj8r+Drv
	 JiW9da05VVRI5W5ufo4laNrw0hpBmyA7Q8odBZ+GvSbl/UXu3I21oavbNYDvZHAyzfmKA
	 KJSVBq/Js9ie1eKm4/Q3LwqvFhrFLW3jfCy1J2PyF5ROqbXaKVZfKkcA/W2CYgnBe2jdE
	 DS29A759E7liN4C0xm3MvjjtEYyMHeth32Q5nojE1Cxjoh6Xpxs9K/3m4OROLxaJA5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793246716;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=yEzPsmwW+3MIxwrHJvIgSGqlJx311neyvO8PFzLcW5I=;
	b=Tkh+Aifxy2AIutFJ/AMzSnKLMpnWhscWJ22DQvrTk3Gg5khfuhr1L7DG/JjmIkW7DSrJ
	 q3huDlTTh+IrjOqGhvocYRuD72Vg4joi8chMSUyFnf8xw91FfSTPi4rPRPIh4dT/HNice
	 1cS8BRpdQeja8fn/9To8S5aiFDQxFYQpy52LP1hOg0mSPxNJJNJ8GqefhQJme9QKrFt2m
	 aZbvn88GIge60cQbNhPpHqJzbkiVafXnAWT7gJAMpkV0qV18TmroXpP/HtmTTtSUn4CdS
	 bCeF5oYmUODoQPnH5+RoyT3Y99PW2KJf4LwjxvBxC27ox8eKYAY027ctDBnN/WNZpWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=sFg3Q+WB;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B75606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 04:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0B75606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=sFg3Q+WB
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yEzPsmwW+3MIxwrHJvIgSGqlJx311neyvO8PFzLcW5I=;
	b=sFg3Q+WBdZ48+/4bw7TqUW70sYs5Y9L2aDkoozbdp4cdwiHJ+Rp8ODKv7ejUwNWrAmBZ0U7fO
	oIYfhG3rWByxMEBpqok5OwAzgsoqYAlUsmT6UXXh0wUk0917NFrA31Zc7i1b/vjiP6yOJhzewLd
	+Sb1hqaw86NT19lqvgp68iE=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jFVxH2629zpStj;
	Thu, 29 Oct 2026 12:04:51 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3437D40575;
	Thu, 29 Oct 2026 12:05:05 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 12:05:04 +0800
Message-ID: <2c09e753-728d-46a0-932a-3c31f72333c6@huawei.com>
Date: Thu, 29 Oct 2026 12:05:03 +0800
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
Subject: Re: [PATCH v10 RESEND 02/15] fs/resctrl: Skip monitor context
 allocation when force-freeing RMIDs
To: Reinette Chatre <reinette.chatre@intel.com>, Ben Horgan
	<ben.horgan@arm.com>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>,
	<zengheng4@huawei.com>, <jic23@kernel.org>, <gshan@redhat.com>,
	<catalin.marinas@arm.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-3-ruanjinjie@huawei.com>
 <069b920d-b1f9-4074-aee0-1607860dac21@arm.com>
 <a27fb58a-563b-4c40-8be2-cc9d05f24279@arm.com>
 <f927b065-3a87-44ec-b092-4ddff877260c@huawei.com>
 <7bf71a63-fb7d-491a-ae27-b5b72c7a0edc@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <7bf71a63-fb7d-491a-ae27-b5b72c7a0edc@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Hi Reinette,

在 2026/10/29 5:29, Reinette Chatre 写道:
> Hi Jinjie,
> 
> On 10/26/26 6:33 PM, Jinjie Ruan wrote:
>>
>>
>> 在 2026/10/26 22:11, Ben Horgan 写道:
>>> Hi Jinjie,
>>>
>>> On 26/10/2026 14:08, Ben Horgan wrote:
>>>> Hi Jinjie,
>>>>
>>>> On 20/10/2026 14:42, Jinjie Ruan wrote:
>>>>> __check_limbo() allocates the architecture monitor context before the
>>>>> scan loop, even when force_free is set. The force-free path never reads
>>>>> occupancy and never uses the context.
>>>>>
>>>>> If the allocation fails, the function returns early and leaves the limbo
>>>>> list unflushed. Callers such as the unmount path then silently fail to
>>>>> return the RMIDs to the free list, leaving stale CLOSIDs in limbo that
>>>>> are re-interpreted with the CDP state of the next mount.
>>>>
>>>> Is this a theoretical fix or is there some way that resctrl_arch_mon_ctx_alloc() can fail in practice?
>>>
>>> This does seem a good change to me and we do have to consider that the memory alocation might fail.
>>
>> Hi Ben,
>>
>> I agree. force_free=true not rely on the allocation of arch_mon_ctx
>> succeeding, we should directly loop to free the RMID.
>>
>> Perhaps a small refactor is needed to split __check_limbo() into two
>> versions as there isn't much duplication?
> I agree that a split would look better here. With these additional checks of
> force_free the __check_limbo() is becoming hard to follow. Even more than

I agree.

> two versions of __check_limbo() this could just be two distinct functions,
> for example a new "void release_limbo_rmids(struct rdt_l3_mon_domain *d)"
> that is only called from resctrl_offline_l3_mon_domain().

Thank you! will adopt this naming.

> 
> The changelog mentions the unmount path but it seems that the issue is with
> domains going offline instead? As far as I understand the limbo state is not
> impacted by mount/unmount.

You're right, I misunderstood — it's when the domain goes offline.

> 
> I also think that the "Fixes:" tag should instead be:
> 	fc16126cc11d ("x86,fs/resctrl: Prevent out-of-bounds access while offlining CPU when SNC enabled")

Thank you! I got it.

> 
> The first two fixes in this series look appropriate for resctrl fs. I'd like
> to echo Ben's request to submit them separately from this work.

Thank you! I will send it separately shortly.

> 
> Thank you very much.
> 
> Reinette

-- 
Best regards,
Jinjie

