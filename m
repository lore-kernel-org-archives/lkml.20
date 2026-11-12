Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794518333;
	b=HtGUBtw8t0iUBswiwm2tphar0+ihclnBIGdshI+hAT4WTrvi+JHMGcMXELrg2+KvTQyM
	 zlq13JE2GPTURvg2ANByN1SLGOFI9jgMUzzh52f3ulLw0dbkjfGoD9CcQHf+2q8XTKv6C
	 J5AU5yxmbsqoraUo7DsAPOvmsXtX13/aN0wlosS0/gP7z4xN3GvB34Upw+h3+KT3mghGV
	 dPlh3c6x4eshXKjKatLfRPRi7pBWs+J3POKNxRoRn8lAqfxyJTOQUcgEhdR/D2DDUtPDE
	 jmWioNI1oawAaswSHUfV2O+H4zB/TpqKu9TcF6cL8/ReP8ri+W49oFtUKc8OiwmwvmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794518333;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=NWZiXsZIO9JbQ9mqYN0WWdRXv+kVOWB/KKAR39dAavU=;
	b=XiFYRpljDKWj0LxthhOerPSWSmOuDDRdudZLEFGXqJdmy53BghpApkf6t0lsdVq6r8hE
	 Iafp4ddYjubYnE1sTOnraqq7EBTZtqYDrhai5DtKSV2JOV/bcpesqUjdWsgt7YlHhoEC9
	 YvW78DjNzLcTpSlWPi2kGJFWQF6jkdeENdbOoC+QYd/8j1V7OGCsorXMPL/Ied42Ipwjg
	 gPUMo86cRsBm/pcoEPomWcLaveRVa/HsIEKJZjy34sH4Mk3MF851epwvw0g9PmcPeRY+E
	 BBQR7uNMGi416Ra5rKLHiD0mk9n6fZMS5U29IzRRYYTw4yWjwbFqRTgMFeF+S/jHJPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Vsex3fdN;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1CF606A335;
	Thu, 12 Nov 2026 21:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D1CF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Vsex3fdN
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64E861516;
	Thu, 12 Nov 2026 13:18:48 -0800 (PST)
Received: from [10.211.55.3] (unknown [10.57.14.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C003D3F632;
	Thu, 12 Nov 2026 13:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794518331; bh=GjzrUYC0FSKDkhN90grSXlqpyDPaHp92cULgUh2tfzI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Vsex3fdNuqG3xF0tWSe+ChHgcFjCFRm+bCis60U/M/RAh/iE2ON/wppdCijNGYfMc
	 1nH8aCS+WxJsjv+lKCCstbW5NQbFFdazIZGbLKOnFkbarvFK/ReYFO3VfWNttcZX5C
	 BbgLuYLCC6NKGDEyeKJ7y0lEQaIThQIIHHiDsmXk=
Message-ID: <7aa50421-6e92-4ea6-be39-88045e682a9f@arm.com>
Date: Thu, 12 Nov 2026 21:18:36 +0000
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
Subject: Re: [PATCH v5 RESEND 5/7] fs/resctrl: Release the limbo RMIDs when
 the CDP state changes
To: Reinette Chatre <reinette.chatre@intel.com>,
 Jinjie Ruan <ruanjinjie@huawei.com>, tony.luck@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, babu.moger@amd.com,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, fenghuay@nvidia.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, gshan@redhat.com,
 zengheng4@huawei.com, jic23@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-6-ruanjinjie@huawei.com>
 <3c48dac2-78af-44c9-b546-e5fcf7bbd8d6@intel.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <3c48dac2-78af-44c9-b546-e5fcf7bbd8d6@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Reinette, Jinjie,

On 11/11/2026 18:33, Reinette Chatre wrote:
> Hi Jinjie,
> 
> On 11/10/26 5:39 AM, Jinjie Ruan wrote:
> 
>> still carry those RMIDs are accounted to the next user of each RMID.
>>
>> The CDP state that matters is the one that changes the PARTIDs used by
>> the monitors, which is not necessarily the CDP state of the L3
>> resource. MPAM gives every CLOSID two PARTIDs in all MSCs while CDP is
>> enabled on any resource, so enabling CDP on L2 alone also changes the
>> PARTIDs the L3 monitors use. Add resctrl_arch_mon_cdp_enabled() to let
>> the architecture report this. Only MPAM can be affected, so the RMIDs
>> are only released where the RMID depends on the CLOSID. On x86 the
>> RMID does not depend on the CLOSID, and resctrl_arch_mon_cdp_enabled()
>> returns false.
> 
> nack. The helper name and value returned on x86 is the first hint that this
> is not right. For x86 the value is not a statement about x86: CDP exists on
> x86 and can be enabled, so a function called resctrl_arch_mon_cdp_enabled()
> returning false reads as wrong until the comment above it explains that what
> is really being reported is whether CDP changes the IDs the monitors use.

The invariant that the limbo handler is currently relying on is that the
mapping of rmid index to the underlying hardware monitor index is fixed.
For MPAM, if cdp is enabled at all then the mapping is changed and so
the invariant does not hold between mounts. MPAM's emulation of CDP is
why it breaks the invariant. resctrl shouldn't need to care about this
MPAM specific reason and should only care whether or not the invariant
is upheld or not. In the future, MPAM may use more than the two existing
indexing schemes. For instance, if we wanted to have one memory
bandwidth monitor per monitor group, without assignment, then we would
need to limit the number of monitor groups.

> 
> Every architecture now needs to match this. This looks more like forcing
> every architecture to indicate whether it has the same quirk as MPAM.
> 
> If there is no way to handle this in MPAM driver then handling this should at
> least be contained between resctrl filesystem and MPAM driver. This should not
> be forced on all architectures.

I don't see a way for the MPAM to keep the same RMID for when it is
emulating CDP and when it's not.

> 
> I trust the MPAM folks to say whether it can or cannot be done in MPAM driver.
> If this is not possible in MPAM driver then it looks like this needs to go back
> to include the L2 CDP check as was done in previous version. With this check 
> gated by IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) it does hint "MPAM"
> but would also need a comment to explain why that is done.
> 

Would something like an rmid indexing generation count be any better or
is that just overthinking it?

int resctrl_arch_rmid_indexing_generation(void);

If the indexing never changes the arch could always return 1 and if it
does change the architecture can bump the number on every change. It
would still never change when resctrl is mounted.

Thanks,

Ben
