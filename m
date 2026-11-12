Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503802;
	b=mbAdkrUMBVCUEApeYXVdEj+KQseO8XUfV4vDwqfR9rc8wpD2CIPCUZiMBN8O21SUbnVM
	 SXJMt7WUkuzTb4BNQESf/kLiCjx5PkIqUVATEpb28GgAtScs9Ootyrwf5sRpprr/vOWqQ
	 ZmWURDemJl7ZewZFk9HgSQgIxqHm+7vFJ4WrhoCseorjHDyYBqlXCD5ZBPkYShvtxfTIH
	 CgI70aaY3mc8Qu3yeBBYD/4lzJqz8TZLCfkpkL90BFUYWR7poZVcsfsyvH0vxZezviTTm
	 j82LZ7YipltW8+BQFV/4Uw0mxr0Fhp1siiqyTl6GfXxmECsJNK8rIwjuX9XlkkmhpBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503802;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=w1+1tscNVgFkOUECvPwWHIyIX3Va6MdsRUwTGzDutp4=;
	b=e70QnhRTfQOq1d+LHZVX59qMLoiPqjdjrZAI38bve9zHLD1mfRvQCf7oOknC/uvVEzey
	 InJV8dog+ceU8GvYNK/WTG0txpI/Sh+pUixDRf/rvQSf3E0td2OarmRqGA9stMG10jPBy
	 lpqXyU2rKX0IgWobC21dLuwwiHjIhrl16ip+3gwBnBO81G1ATtWB660oDpnlo4NwHEb8U
	 j48hC47yJ6OJoqdcUCc+qt8s8g8a5g6sJYHB5BcQxoWODwQMQJqkB1GsyMVZ4oS+rHRFN
	 b0jkaCOxcYPph4o2rFNIYcMbE6cER3kSKJsWUP4V1lDmpUqrkvvvK85aTOprQm2q3zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="tA/qa2jN";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B48606A321;
	Thu, 12 Nov 2026 17:16:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B48606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tA/qa2jN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 022321516;
	Thu, 12 Nov 2026 09:16:38 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.14.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 563903F632;
	Thu, 12 Nov 2026 09:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794503801; bh=VB5Gtl3Pw9RoKAr/cwkMBK0KqjUTj1JlFDgq5zlwbKI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tA/qa2jNYtaVCs53UlAKPtn7goLnLNdP2hMMgFb0088OJVMFvFJqFBejhyqy+EZpx
	 ec1jDq24MTu6wEKBXLtgwFFagT49yRLQaN1Ma+yMNn7kbuHCwM0Whfv+n/PeNjYoBn
	 yD4kQa7QZ47kEhazzQJs/gthYsaiYTDtocFDkZKI=
Message-ID: <7ce15dbf-d4d7-4fb3-ad50-f47f782a7440@arm.com>
Date: Thu, 12 Nov 2026 17:16:34 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v5 RESEND 7/7] fs/resctrl: Add info/moveable_mon_group
To: Jinjie Ruan <ruanjinjie@huawei.com>,
 Reinette Chatre <reinette.chatre@intel.com>, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, gshan@redhat.com,
 zengheng4@huawei.com, jic23@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-8-ruanjinjie@huawei.com>
 <efd9c3d5-a732-47bf-bca1-50a8650fd0ef@intel.com>
 <7d27b172-d186-4b7a-87af-d0d25554b964@huawei.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <7d27b172-d186-4b7a-87af-d0d25554b964@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jinjie, Reinette,

On 12/11/2026 01:42, Jinjie Ruan wrote:
> 
> 
> 在 2026/11/12 2:34, Reinette Chatre 写道:
>> Hi Jinjie and Ben,
> 
> Hi Reinette,
> 
>>
>> On 11/10/26 5:39 AM, Jinjie Ruan wrote:
>>> Moving a MON group into the mon_groups directory of another CTRL_MON
>>> group changes the CLOSID of the group while its RMID stays the same.
>>> Where the RMID is only meaningful together with the CLOSID, as on arm64
>>> MPAM, the move changes the RMID index of the group and is rejected with
>>> -EOPNOTSUPP.
>>>
>>> Userspace cannot tell whether the move is supported without trying it.
>>> Add "info/moveable_mon_group", which reads 1 when a MON group can be
>>> moved to another CTRL_MON group and 0 when the move is rejected, and
>>> refer to it where resctrl.rst describes the move.
>>>
>>> Suggested-by: Ben Horgan <ben.horgan@arm.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>
>> Do you find that this binary "supported/unsupported" accurately captures
> 
> I think this behavior is deterministic on MPAMv1, so that's enough for mpam.
> 
>> everything that MPAM may ever want to do in this area? Could it be that, for
> 
> That would be what the new version of MPAM does (such as v2 mentioned
> below), the behavior of the mapmv1 version is already determined..
> 
>> example, one day MPAM may be asked to support the move of a monitor group to
>> support scenarios where the reset of monitor counts is acceptable to the customer
>> and availability of PMG will be managed as part of the scenario needing support?

For such a destructive move I would have thought it would be better to
forbid the move and just rely on the user deleting the existing monitor
group and creating a new one at the new location. If we consider only
llc_occupancy on MPAM, which isn't affected by any requirement to be
free running as effectively the hardware re-measures the cache occupancy
on each read, then allowing monitor groups to be moved still gives a
misleading impression to the users. The actual cache occupancy of the
tasks in the moved monitor group stays the same but only the cache lines
allocated after the move with the new (PARTID, PMG) association are
accounted for in llc_occupancy. The tasks still get cache hits for the
lines allocated previous to the monitor group move.

Having said that, one problem with relying on deleting and creating a
new monitor group is that you have to keep track of the associated tasks
which isn't necessarily straight forward, e.g. when a child task is
started after deleting the monitor group.

Any relaxation of expectations of what happens when a monitor group is
moved would need explicit buy-in from the user as otherwise they could
rightly expect the established resctrl behaviour.

I haven't understood the reason why groups that monitor cpus can't be
moved. Is this impossible to implement even on an x86 system? Why can't
the cpus move move between control groups in the way that tasks do?

> 
> As stated in the MPAM manual, MPAMv2 completely separates PARTID and
> PMG, allowing for more flexible and fine-grained monitoring statistics

Which MPAM manual in particular are you referring to? Whilst the
separation of PARTID and PMG is definitely possible in MPAMv2 there is a
lot of nuance in this area.

> across partitions, so the CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID will not
> set for v2, However, it might need to be changed to a dynamic switch..
> 
>>
>> When adding a new interface it helps to consider future possible changes and
>> aim to create an interface that solves the immediate problem while leaving room
>> for future enhancements. If we do not do that the interface becomes a maze due
>> to new files just being added to address the problem of the day.
>>
> 
> I agree with your idea. We need to think twice before we act.
> 
>> I would like to propose that this patch be submitted separately with the goal
>> to obtain more feedback on the new interface. 
> 
> I don't object, but I understand this is the same thing as the previous
> patch. I'd like to hear Ben's advice.

Given that the documentation dependency has been avoided in your patch 6
I think as Reinette suggests it is indeed better to take some more time.
This is a proposal for new abi, after all.

Thanks,

Ben
> 
>>
>> Reinette
> 

