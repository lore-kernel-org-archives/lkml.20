Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876855;
	b=cnszQAoJNBYIoyhOOteVU22ecA5faKj9nDG8p4kSS3OL/MaciiwUS4en0JQKTYVbu2aQ
	 Gbwg4oLm+VAEuZl935o7v/YmkiQqSGeyfG0TkzMTOXgQ1aV8LvlpSGI1WlP+P0xWRVTwF
	 mwAcYWNRKZd6OJwHK5rLym1NShkkT+dhJFrXv3msSgLIGkc8n5WpsUEENWXNX5GQsIWMT
	 MrX/ixktLnv0GkoN7wwtwF9esnN4WxoIXsecVANF+y6c6VoRhkI/Tvl70quJZhvm2KP86
	 boguNGKaMDDoFA8zLluhP6rscxpx/97nIq6Rxux6ovG2TV5VIeAVdzMDn3sbekZkHnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876855;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:Content-Language:To:Cc:References:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=65Yh0STFpLyAg9Zs0iCagOebJs1u9d/lfGQNo4tHSio=;
	b=rX56UqHv2rlJO2BzNbGN8fO16c6DBJm0slcc74gJA/wjc0qLIQFyWeNinqicVkOwNgZJ
	 Ma+ii3Pr6JS7YAXWGWhHEn4hZDK9hcTC/OnKJ+I98inhx+gpSMs+D+0kLLw5QxoxqVNya
	 vlM2TSXnmu7IZsv57iHVuuRITyI7ei3R7u0u8dcWw8G/tJCbfeox+M+1stS5h24t8zO2L
	 pRkaV999CTImIVaO0WLp5HmeU2hysRo66Uev57j7yAk9VWcRnaScAwK5al6gKTo6aj8MC
	 mh/glpCnQxPoATA/EZ0sX8aYqclloJPqBWyNC7b0jb+Tb/oFNonT4f29Kwlku4fwHQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="s/eDR5GH";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9343E6082BC0
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9343E6082BC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=s/eDR5GH
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B14B219F6;
	Thu,  5 Nov 2026 03:07:30 -0800 (PST)
Received: from [10.0.128.216] (Suzukis-MBP.cambridge.arm.com [10.0.128.216])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 61A953F628;
	Thu,  5 Nov 2026 03:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793876853; bh=6vL6Hj9BVQ3Cd5slOfB844llVYPZr5KiY8zuKWjv6CI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s/eDR5GH2EXKtUZQxWAIJW0pNTIUzYp1nwESLI3Tbh7DdCBi4I4IXSZvUtxiDpHtM
	 ZGwUJUZFSBQoxl9MZlfPr8BVYx7mrcMKBXJdsCFU77HxR9VXOFwKaAl8AWi+SsCHOf
	 MgFNETUGvNpRq3F/Q/xKTPxo5wCGzvCY0tGRTWCY=
Message-ID: <d496e730-dea3-4772-bfe9-5e51e67d170b@arm.com>
Date: Thu, 5 Nov 2026 11:07:29 +0000
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
Subject: Re: [PATCH v2 1/2] KVM: arm64: Resume stage-2 teardown where the walk
 stopped
Content-Language: en-GB
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Raghavendra Rao Ananta <rananta@google.com>,
 Vincent Donnefort <vdonnefort@google.com>, Fuad Tabba <tabba@google.com>
References: <20261104124451.2148724-1-fuad.tabba@linux.dev>
 <20261104124451.2148724-2-fuad.tabba@linux.dev>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261104124451.2148724-2-fuad.tabba@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/11/2026 12:44, Fuad Tabba wrote:
> Since commit 4ddfab5436b6 ("KVM: arm64: Reschedule as needed when
> destroying the stage-2 page-tables"), kvm_stage2_destroy() walks the
> IPA space one block-sized chunk at a time. The walker steps over an
> invalid entry in one go, but the next walk starts at the following
> chunk, so an invalid entry larger than a chunk is visited once for every
> chunk it covers. Destroying a VM with a 52-bit IPA then takes 2^27 walks
> with 16K pages (2^22 with 4K), however little it maps.
> 
> Have kvm_pgtable_stage2_destroy_range() return the address its walk
> reached, which kvm_pgtable_walk() doesn't expose, and resume from there.
> pkvm_pgtable_stage2_destroy_range() returns the end of its range, and
> EL2's kvm_pgtable_stage2_destroy() ignores the value.
> 
> Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Suggested-by: Oliver Upton <oupton@kernel.org>
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>


Thanks Fuad for this, looks good to me with Oliver's suggestion.

Cheers
Suzuki

