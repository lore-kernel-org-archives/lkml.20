Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809134;
	b=KZg/SbVT/3iA7nEGOwb2zSSkU3rt2N4LpDcBNHBrhEDFOj9eF48uxsR6vP2m7cR7eIQq
	 hwAIeDixl2SOEgn+MFWj9D+SRPiGe7Buwi3oQfXhj3QW6FuClruFKhoLz+yseyacOTmvP
	 PIQbtftSz8G0J6nw4y38H4vf1YawHbqcLBgrvQDfz69mupbIPkZMhaveA0TfNMCNLl4NP
	 rtB5EHsN5Peg4grX32hape6ScIlBti2LGuM+tRPBJGxDuB8LOFrhPw3F4Ji3z0Z2Zwpi1
	 3jpnXCNHc8U3+xnwhnuesB6p6DuOm8kJgsxz1YGtlK5gUNpkfwx/E9P4AfElXwoiJBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809134;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:From:To:References:Content-Language:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=4qUirECz8shFD7RJri2RxiVA2hcfdx0BjV5jSEZwKdM=;
	b=nJuF1S760A71VvIAoYpdjZ3+h3DiV+7SREW5SfbNj/lbseaiObpIdmaxm6nXc5FtwGei
	 las0gsYPhT1qwwc1PJPHxexgqvyeiGeyLvgS9hShUPoEbMtjCi1CJ7mLNN4BshHLFN6zF
	 pFZooL3O9nOy2MB0nHc2ZJrSoPcEWFCIgVb02TxVsz2Wsxy420+j5y5gTfqY24602/ZP7
	 ZSZ86JU1zeC7fg4EZIM+Pr+PZ1+w1OJ3nWuKy9ennik1uMQ20M+dKn6ntc5RbJBdq0pUn
	 CYoXO99u1encDZRjsdFD8bnHKKbtxlMRgyiJ4u+IteCvbjjR9qBK77CJWLQUu+HNK/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="KUTD/tJZ";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1A56082BFE;
	Wed,  4 Nov 2026 16:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1A56082BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=KUTD/tJZ
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82ADA1BB2;
	Wed,  4 Nov 2026 08:18:49 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957FE3F632;
	Wed,  4 Nov 2026 08:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793809132; bh=V/rv5URru9iBNFldX3RW8Gi8p2B95s2zdnUeqy1hQXY=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=KUTD/tJZMYqqBVmXTpqhnfKJedO87qHbBshIti7oPGPlqDeyGjxRspg/Il9ufeu7G
	 yuGYwvHkTKYhzYO1vvs+zQWZQUGOANW3kT4I5CM0UnyCUlEE+202VJQQ7aLRxoeKkZ
	 UIDveGVMdFjghiLV5aNHeUlTGKyO1zF7chzdpFXM=
Message-ID: <11fa8a4e-432a-4612-b834-a04cf9d32d49@arm.com>
Date: Wed, 4 Nov 2026 16:18:49 +0000
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
From: Ben Horgan <ben.horgan@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 reinette.chatre@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 babu.moger@amd.com, corbet@lwn.net, skhan@linuxfoundation.org,
 rdunlap@infradead.org, jic23@kernel.org, tan.shaopeng@jp.fujitsu.com,
 gshan@redhat.com, zengheng4@huawei.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261104101913.586595-1-ruanjinjie@huawei.com>
 <88c180d8-156d-400d-8537-5fd79b7ad10b@arm.com>
Content-Language: en-US
In-Reply-To: <88c180d8-156d-400d-8537-5fd79b7ad10b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jinjie,

On 04/11/2026 14:36, Ben Horgan wrote:
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
>> +arm64 MPAM. 

In MPAMv2 there are likely to be systems where RMID doesn't depend on CLOSID and so best not to rely
on MPAM vs not for this distinction.

No other move operation is currently allowed other than
>> +simply renaming a CTRL_MON or MON group.
>>  

It was previously discussed about having a file that reports whether or not RMIDs have a fixed
CLOSID and whether or not there should be a separate file to report whether MON group moving is
allowed or not [1]. Do you think a info/moveable_mon_group file or such like would be useful?

I have the below patch that adds a new file for the RMID scoping but we should coordinate so we
don't end up with multiple changes to the same part of the documentation. Your MPAM patch [2] is
also related here as that that corrects 'num_rmids'.

[1] https://lore.kernel.org/linux-arm-kernel/d1110701-a2d5-4cc1-84de-4ed53ef02368@arm.com/
[2] https://lore.kernel.org/linux-arm-kernel/20261104101622.563280-1-ruanjinjie@huawei.com/

Thanks,

Ben

fs/resctrl: Add file info/mon_id_includes_control_id

    The maximum number of CTRL_MON + MON groups that can be created is visible to
    the user as the minimum of the values read from info/L3_MON/num_rmids and
    info/PERF_PKG_MON/num_rmids. Similarly, the maximum number of CTRL_MON groups is
    the minimum of the values in info/<resource>/num_closids.

    However, the number of MON that can be created as children of a given CTRL_MON
    group is not directly knowable by the user. On x86 systems, there is no separate
    limit and so in the extreme there can be a single CTRL_MON groups and num_rmids
    - 1 MON groups. On MPAM systems however, the number of MON groups per CTRL_MON
    groups is limited by the number of PMG bits and is equal
    to (num_rmids/num_closids) - 1.

    So, that the user can easily calculate the maximum number of monitoring groups
    per control add a new read only file, info/mon_id_includes_control_id.  If this
    new file reads 1, the maximum number of MON groups under a CTRL_MON group
    is (num_rmids/num_closids) - 1 and if it reads 0 the maximum is num_rmids -
    1. On a monitor only platform it will read 0 allowing the file to be easily
    interpreted when there are no num_closids files.

    Signed-off-by: Ben Horgan <ben.horgan@arm.com>
    ---

    The num_rmids in MPAM monitor only platforms is currently wrong as it takes into
    account PARTIDs that aren't usable.

diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
index b52795e03303..ca586b4e502f 100644
--- a/Documentation/filesystems/resctrl.rst
+++ b/Documentation/filesystems/resctrl.rst
@@ -510,8 +510,16 @@ with the following files:
 "mon_features":
                Lists the telemetry monitoring events that are enabled on this system.

-The upper bound for how many "CTRL_MON" + "MON" can be created
-is the smaller of the L3_MON and PERF_PKG_MON "num_rmids" values.
+The upper bound for how many "CTRL_MON" + "MON" groups can be created is the
+smaller of the L3_MON and PERF_PKG_MON "num_rmids" values.  The
+"mon_id_includes_control_id" file in the top level of the "info" directory helps
+determine how many "MON" groups can be created in any given "mon_groups"
+directory. If it reads 1, then the maximum number of "MON" groups that can be
+created in a "mon_groups" directory is equal to the amount created if the
+maximum number of "CTRL_MON" groups are created and "MON" groups evenly
+distributed between them. If it reads 0, then the number of "MON" groups than
+can be created is only limited by the global restriction on the number of
+"CTRL_MON" + "MON" groups.

 Finally, in the top level of the "info" directory there is a file
 named "last_cmd_status". This is reset with every "command" issued
diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 57ab090072c2..90712a1337d0 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -1200,6 +1200,17 @@ static int rdt_num_rmids_show(struct kernfs_open_file *of,
        return 0;
 }

+static int rdt_mon_id_includes_control_id_show(struct kernfs_open_file *of,
+                                              struct seq_file *seq, void *v)
+{
+       bool dependent = IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
+                        resctrl_arch_alloc_capable();
+
+       seq_printf(seq, "%u\n", dependent);
+
+       return 0;
+}
+
 static int rdt_mon_features_show(struct kernfs_open_file *of,
                                 struct seq_file *seq, void *v)
 {
@@ -2009,6 +2020,13 @@ static struct rftype res_common_files[] = {
                .seq_show       = rdt_num_rmids_show,
                .fflags         = RFTYPE_MON_INFO,
        },
+       {
+               .name           = "mon_id_includes_control_id",
+               .mode           = 0444,
+               .kf_ops         = &rdtgroup_kf_single_ops,
+               .seq_show       = rdt_mon_id_includes_control_id_show,
+               .fflags         = RFTYPE_TOP_INFO,
+       },
        {
                .name           = "cbm_mask",
                .mode           = 0444,


