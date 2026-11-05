Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868977;
	b=Nw5aEBcGCXvnSPN6PQ9ejHnDTxFZI9F+NCgqxSzW3GXfFaRLppMfdp9+s9wVAzasp9gf
	 YUm8FXDzjE9L7LHrIFlbf+1zIUh/pQKbaINJGYS0x7+z4cbeB/60Z4p3xIhWhpV1ZlD5i
	 sU2oSWod7xOX6y6gHByqZ+3SNjYYk7e5THjylMySMG/MZ26fFbKEMlX5MxqpCefnZUKyJ
	 e/5sqWOCOvI+QKLEdeNMXkbgk7O9hWHVZ+850mr6af85+88SNxsVQAIVlRVtfF3p/gtll
	 bXK8/xLKKV3YFVbSl+Rwmhw+Ya4yFpCY/sJ3XJPKgGFkWSdH96Aq8lLSJOIaaVxDf0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868977;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Uy9D3SP0x0Tj1umi/HazEvpl4dUpXQf1BHy267Mgz6A=;
	b=zIwXWtUnAgebyNl1WmhZx6xRFwJN2TQWZTq0mhVNFktJ6WEG8fTsHxGXby0cLrMAnbZX
	 BFKQhk7ScZwt5sScJwg6u4YuSTrXts6ZXmMnaJZq3ex+fjqEYBssu3AzpabK4Ll5ZROKg
	 kfg+k3uXk1Vrk9FrIMmOVlJeb6rdS7keI/JL4XjHdw5Y4rE7Kx4+WZ60GvUGAiBroNCPf
	 BXu4yfxX04EfGxljUOA6nOLEcLQGLeWQSV61dqgDj4rIy6XgBW3wI/wtR/cPZWzZ0eW6M
	 EC1CxVLY3ki2Wa+u49swb4UUPsdWJWirQ4/gdSir1EINTkHqLa+IlagOE0kIGvRvAPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WbSSAeI3;
	arc=none smtp.remote-ip=113.46.200.227
Received: from canpmsgout12.his.huawei.com (canpmsgout12.his.huawei.com [113.46.200.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44844606A31B;
	Thu,  5 Nov 2026 08:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44844606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=WbSSAeI3
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Uy9D3SP0x0Tj1umi/HazEvpl4dUpXQf1BHy267Mgz6A=;
	b=WbSSAeI3nlO0bN5eirTi5OLJZ5OkJUkY7IpJjQru+bnKADaUEyHaMCRuVWNz7ZugtI+V3Q4bc
	zcUj/vD7AeMA2rXPh7vgt8XG1XiDkIB7h3WtLus/leXfhc2JAvx7HCy9nf4VifSu2JR3SFlgkcZ
	u+wRUz0TofUlGN/0qsYRnSw=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4jKx4D1vDmznTtw;
	Thu,  5 Nov 2026 16:56:12 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C4164056C;
	Thu,  5 Nov 2026 16:56:10 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 16:56:09 +0800
Message-ID: <59ceb6ca-cde1-4e04-b4b3-5f26e856fa69@huawei.com>
Date: Thu, 5 Nov 2026 16:56:09 +0800
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
Subject: Re: [PATCH] fs/resctrl: Disallow monitor group rename when the RMID
 changes
To: Ben Horgan <ben.horgan@arm.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <jic23@kernel.org>, <tan.shaopeng@jp.fujitsu.com>,
	<gshan@redhat.com>, <zengheng4@huawei.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20261104101913.586595-1-ruanjinjie@huawei.com>
 <88c180d8-156d-400d-8537-5fd79b7ad10b@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <88c180d8-156d-400d-8537-5fd79b7ad10b@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/4 22:36, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 04/11/2026 10:19, Jinjie Ruan wrote:
>> From: Peter Newman <peternewman@google.com>
>>
>> Renaming a monitor group to move it below a different control group
>> changes the CLOSID of its tasks. Where the RMID only has meaning
>> together with the CLOSID, the RMID index changes as well: on arm64 MPAM
>> the RMID is a PMG that extends the PARTID, so the group's counters
>> belong to the old PARTID and cannot follow the move. The monitor data
>> would be reset and would then report the new PARTID's traffic.
>>
>> Check that the RMID index is unchanged before moving the group and
>> reject the rename with -EOPNOTSUPP otherwise. Only MPAM systems are
>> affected; architectures where the RMID is independent of the CLOSID,
>> such as x86, keep the same index and still allow the move. Document
>> the restriction in resctrl.rst.
>>
>> Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> 
> Perhaps stretching the meaning of a 'Suggested-by' tag as I only suggested the repost of Peter's patch.
> 
> It is probably worth pointing out that the moving of monitor groups is existingly broken other than
> just the resetting of mbm_total_bytes counters and so the current behaviour isn't something that an
> existing user could be relying on. As you already point out in [1]

Sorry, will delete the Suggested-by and supplement the information in [1].

> 
> [1] https://lore.kernel.org/lkml/20261031101052.1692230-1-ruanjinjie@huawei.com/
> 
> Thanks,
> 
> Ben
> 
>> Signed-off-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.1.x
>> Link: https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
>> ---
>>  Documentation/filesystems/resctrl.rst |  7 ++++---
>>  fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
>>  2 files changed, 17 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index b52795e03303..5f21ab20030a 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -552,9 +552,10 @@ will automatically remove all MON groups below it.
>>  Moving MON group directories to a new parent CTRL_MON group is supported
>>  for the purpose of changing the resource allocations of a MON group
>>  without impacting its monitoring data or assigned tasks. This operation
>> -is not allowed for MON groups which monitor CPUs. No other move
>> -operation is currently allowed other than simply renaming a CTRL_MON or
>> -MON group.
>> +is not allowed for MON groups which monitor CPUs, and fails with
>> +-EOPNOTSUPP on systems where the RMID depends on the CLOSID, such as
>> +arm64 MPAM. No other move operation is currently allowed other than
>> +simply renaming a CTRL_MON or MON group.
>>  
>>  All groups contain the following files:
>>  
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 9290a346386e..358f2dc8301d 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -4405,6 +4405,19 @@ static int rdtgroup_rename(struct kernfs_node *kn,
>>  		goto out;
>>  	}
>>  
>> +	/*
>> +	 * Moving the group changes the CLOSID. Where the RMID is only
>> +	 * meaningful together with the CLOSID, the RMID index changes and the
>> +	 * monitor state cannot follow the move.
>> +	 */
>> +	if (rdtgrp->mon.parent != new_prdtgrp && resctrl_arch_mon_capable() &&
>> +	    resctrl_arch_rmid_idx_encode(rdtgrp->closid, rdtgrp->mon.rmid) !=
>> +	    resctrl_arch_rmid_idx_encode(new_prdtgrp->closid, rdtgrp->mon.rmid)) {
>> +		rdt_last_cmd_puts("Changing parent control group not supported\n");
>> +		ret = -EOPNOTSUPP;
>> +		goto out;
>> +	}
>> +
>>  	/*
>>  	 * If the MON group is monitoring CPUs, the CPUs must be assigned to the
>>  	 * current parent CTRL_MON group and therefore cannot be assigned to
> 

-- 
Best regards,
Jinjie

