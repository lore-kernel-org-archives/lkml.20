Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793416831;
	b=curnIjrCLLZSl36VyB0BKvmyFny7HGY2T4aUm8OzvY+0SBfm3aE8GMoKM5FcQU4RGOY5
	 /BtciAEQNfVNC+80Fzhx7+qeTxt9iXxnpO/WYrD72negpvxNEDexXxkWEiJ6ZvNuuGn8a
	 FwVIiuq8N8koCszIouGXmemkUYScpyhrBbj5lMzLCYZpw0SQq9hQg7O/bS+SyrPjanETS
	 EJmomlahz/E4Y80x/ACuRFWTjVoL+ebpOy3rJhjJXAsBPczzMY2FvSPsfya2f17tET2St
	 Cel2EANNAlltSQ21IdzuKMCqp0UGI+WQlD945KvACqGbTsYMYtSTJGKDQcu9YSfaP4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793416831;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=nITl5IFk9A+mvJzHtILuBr8ym7+NtYyEOnEqaxUameA=;
	b=in1UolR1p+0NYmVOYgBpmwIWx+693tE+AqfFmORxyqR8OZBow1U/e9iyDYxwHWn9uBgQ
	 W1GeAjHL7NvbCvt6t+3vSzfIVOWn/E9urYdLAU1S7wE3vgCBHo0TQBWyhOoxWV4KMZOwf
	 FBD9az7wL3udL5VkoqhKd3ZIgHHbZVzKf21NLe3Psfxft0L0niRLQDkFWBTIvIWJxP1VI
	 njl9b76zQj01p2Ay2AQhkjNqqBm9gWdYoymtgWej0BuwJ7K3Imh3JqWNsLlEYEwdBPYNh
	 PkYCpNp4ll9qsT8eMP3sBV3vPLgWbnBFRrdApE4kBlVRGBs7izISNKz0EPlGNIfRmVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3EPknp3y;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3247606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3247606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=3EPknp3y
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nITl5IFk9A+mvJzHtILuBr8ym7+NtYyEOnEqaxUameA=;
	b=3EPknp3yVV+7kd/knlQFAAXuO68acDU8Srh3ldK5PQ+idnngPNWzZwK4fliuDpWGPFNmBtYpO
	ymRjagyj9BIN6yp4uueVBo+0NdRzngsae/Dio7djCWPssFsE9MO4YCfkFFkOhg3DhuZpots4eAt
	lLwO1yaaaWDpMk9B6q1MYHg=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jGjrj6dgJzpSxG;
	Sat, 31 Oct 2026 11:20:05 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 5CE7740579;
	Sat, 31 Oct 2026 11:20:23 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 31 Oct
 2026 11:20:22 +0800
Message-ID: <3374b30b-eb3b-4794-949f-313ef32a5ce2@huawei.com>
Date: Sat, 31 Oct 2026 11:20:22 +0800
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
Subject: Re: [PATCH v2 2/2] fs/resctrl: Do not allocate a monitor context when
 releasing limbo RMIDs
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261030092144.1233551-1-ruanjinjie@huawei.com>
 <20261030092144.1233551-4-ruanjinjie@huawei.com>
 <5c2c561e-b970-4ca0-a66d-b1043608d847@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <5c2c561e-b970-4ca0-a66d-b1043608d847@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/31 2:15, Reinette Chatre 写道:
> Hi Jinjie,
> 
> On 10/30/26 2:21 AM, Jinjie Ruan wrote:
>> Busy RMIDs of a monitor domain are normally released by the limbo
>> handler once their cache occupancy drops below the threshold. When a
>> domain goes offline, its busy RMIDs are released without checking
>> occupancy, since the domain is going away and the RMIDs must not be
>> left behind.
> 
> nit: "left behind" is vague. How about changing "RMIDs must not be
> left behind" to "RMIDs would otherwise never return to the free list."

That indeed sounds more clear.

> 
>>
>> On the monitor domain offline path, __check_limbo() allocates
>> the monitor context that an occupancy check needs before it scans
>> the busy RMIDs, but without using it, and returns early when that
>> allocation fails. Then the caller destroys the domain's monitoring state,
>> including the bitmap that records which RMIDs are busy, so nothing can
>> clear those bits afterwards and the busy counts never reach zero. Those
>> RMIDs never return to the free list and, where the RMID depends on
>> the CLOSID, the dirty count of their CLOSID never decreases. The allocation
>> can also wait for a monitor to become free, which stalls the CPU offline
>> path on a context that is not going to be used.
>>
>> Only MPAM systems are affected. An architecture that can always read an
>> RMID allocates nothing for the monitor context, so the allocation can
>> neither fail nor wait there.
>>
>> So move the release of busy RMIDs into a separate function that does
> 
> nit: Please drop "So" to stick with imperative. Just start with "Move the release ..."

Thank you! Will drop it.

> 
>> not take a monitor context and leave the occupancy check to
>> __check_limbo().
>>
>> This is not a revert of the fixed commit. It preserves the original fix's
>> intent of not reading a counter in the offline path.
> 
> More on this below but after reconsidering the fallout I think above paragraph
> needs to be dropped.
> 
> For entire changelog, could you please adjust the line wraps after edit to not
> jump around as much?
> 
>>
>> Fixes: fc16126cc11d ("x86,fs/resctrl: Prevent out-of-bounds access while offlining CPU when SNC enabled")
> 
> Taking a closer look, the issue as described is present before fc16126cc11d. 
> At fc16126cc11d^, __check_limbo() already returns early on allocation failure,

Indeed it is.

> and the force-release caller already falls through to domain_destroy_l3_mon_state(d),
> so the RMIDs leak there too. 

I agree.

> 
> The issue seems to originate from feature that added the allocation and early
> release, which is:
> e557999f80a5 ("x86/resctrl: Allow arch to allocate memory needed in resctrl_arch_rmid_read()")
> 
> Even so, as with patch #1, since the impact is only on MPAM this need not
> be backported as far. I thus think the tags should be:
> 	Fixes: e557999f80a5 ("x86/resctrl: Allow arch to allocate memory needed in resctrl_arch_rmid_read()")

Yes, I also find this patch add alloc code.

> and
> 	Cc: <stable@vger.kernel.org> # 7.1.x
> 
> This fix does depend on fc16126cc11d to apply cleanly but fortunately it has been
> backported to 7.1.

Since commit 4aab135bda16 ("arm64: mpam: Select ARCH_HAS_CPU_RESCTR")
arm64 can use resctrl fs, which is v7.1-rc1.

> 
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: James Morse <james.morse@arm.com>
>> Cc: Reinette Chatre <reinette.chatre@intel.com>
>> Cc: <stable@vger.kernel.org>
>> ---
> 
> ...
> 
>>  /*
>>   * Check the RMIDs that are marked as busy for this domain. If the
>>   * reported LLC occupancy is below the threshold clear the busy bit and
>>   * decrement the count. If the busy count gets to zero on an RMID, we
>>   * free the RMID
>>   */
>> -void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
>> +static void __check_limbo(struct rdt_l3_mon_domain *d)
>>  {
>>  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>>  	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
>>  	struct rmid_entry *entry;
>> -	bool rmid_dirty = true;
>> +	bool rmid_dirty;
>>  	u32 idx, cur_idx = 1;
>>  	void *arch_mon_ctx;
>>  	void *arch_priv;
> 
> Another difference between MPAM and tip style is that tip prefers variable
> declarations to be in reverse fir order. For reference, see "Variable declarations" in 
> Documentation/process/maintainer-tip.rst.

I also prefer the reverse Christmas tree style for local variable
declarations, and it seems other modules have similar requirements.

> 
> Please re-order the declarations to maintain reverse fir.
> 
> Everything else looks good.
> 
> Thank you very much.
> 
> Reinette

-- 
Best regards,
Jinjie

