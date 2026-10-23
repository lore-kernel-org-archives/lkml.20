Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764273;
	b=rz9RjxZOiLTRuwe4/EOSTWmiGiFLRMwvaBGJyNrABdOdcP9lHv731Il9FTtVRLsW5VzF
	 iSdZHWFN8AsDOrZOEpjGkkJ40PjyK2UuLwgHCPhhGsrOXPoDE5JjqKiHx7+/DV+0ZN3/r
	 m+Q+2RK3PdLx0qnOUIm7nT9JyCjg26wH25HQ5r0bw8/H7CHR6urfkcW73SlsvRiDiKqq8
	 Zump+0onJwMuq+502hyqHaANu5P8g+/QYH9IGYpfPLoxr4MQW/KferzK8tUBR4dKQp96K
	 z6/VekN92tLb7k1wpYeucFPmHXJQPxCBn3e/E91auI0hsucarD1OqjhCMu0URxW0lfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764273;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=n36re4R3i8nXuM6/wGbiNDosDIqVkvFnDzUX2RMRlk0=;
	b=SXYdAT1EHgGpn7ZpVpj5HPn9dzFZRXz8A7TjTSslr2W9GyiKSD/BN6g03vyS0MIibbDO
	 TSndW6fXlauzYjN9s6MZimA4RBetOC/tDHZBUTI6PnFDXI72A//0cvxK+LmPv5zSnQ5nz
	 fCPUtV0d3L3zsl5f+6nfAy2x0vy0sLWM6JKcO66xwmzR3NilJvzacHub3IjMeWtzHUYnf
	 w4wprzgQqJmjqnvGPgZhgk+VoC2mC/6iBelkuKy7v+PlaDMXkZd5sWleQbsIMhiXdLZxM
	 ZpiDkvMQWrJgBQc8p6mNTJjwlkgZAO/wMFo95E89g/kE99bi0O0r+MwkAnZyOolLOwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MNdayn29;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB2C606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BB2C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MNdayn29
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BE731C00;
	Fri, 23 Oct 2026 07:04:28 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAEFB3F673;
	Fri, 23 Oct 2026 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792764271; bh=5LUMkx86sW2CCaNHvIGxIW+K+1BbJjEkbPwVzal5v8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MNdayn29iT3ViLmPTZMzRluVsO7PfHn4zcOiCsLLTysTzD3Cs6MS/MP6pzsZOeyIa
	 i8F1Y57RsdzBNTeLzkb4acyVsYrD+fVBCmNLNS+yasI6jOzTLjW3d0QIGG2glwXWi0
	 PECjFLAvvaYmEV+lv2hDunZXOn2GftZHeKRfHFBc=
Message-ID: <d4570e2d-5b92-4f05-a8b3-34d5d5b299bd@arm.com>
Date: Fri, 23 Oct 2026 15:04:23 +0100
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
Subject: Re: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless
 replace of S1 domains
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-4-skhawaja@google.com>
 <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
 <20261023134900.GB3977851@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261023134900.GB3977851@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 2:49 pm, Jason Gunthorpe wrote:
> On Fri, Oct 23, 2026 at 02:43:28PM +0100, Robin Murphy wrote:
>>> @@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
>>>    		struct arm_smmu_cd target_cd;
>>>    		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
>>> -		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
>>> -					&target_cd);
>>> +		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
>>> +					  &target_cd);
>>
>> No, we cannot blindly do this for arbitrary ->attach_dev calls - the
>> majority of S1->S1 transitions are going to be moving back and forth between
>> the default domain and user domains, where there is zero expectation, let
>> alone guarantee, that the translations would be equivalent and thus not
>> liable to lead to TLB conflict aborts or amalgamation hell.
> 
> Heh, yeah this probably only works properly with BBML2 or something so
> the temporary ASID doesn't explode.

This is fundamental VMSA behaviour - see R_FVQCK in the Arm ARM. BBML 
only applies to the one specific case of identical VA->PA translations 
with identical attributes _only_ differing in the leaf level at which 
they are described.

Thanks,
Robin.
