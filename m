Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C517C37206B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791803459; cv=none; b=rELcsiiDC7j4cyq+LqnKI/wGhxtbqpYqosQhoKvvNttQ9+FjOkW1BBdRU4ObQWbGjiTTvNlwq8yHGnUsWARqfo80DGJu/AqdI+TIT24+HNwFNn3j+0MWWH5HV5T/cr6C9iYTY2SiPxlGM21i0tfme2L0tYa+NJF5VTnMV+PzqPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791803459; c=relaxed/simple;
	bh=EuhGFyfDPuJeXZiHjuHL7QF5dqQy0HkQsqlo1Kmryz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hV3dTvuNBJSz3nl+KcxRIn4y9bJpFohuNAh9+7Mg8M8pRzZ4/+U4JXpCfNDTJZjzfjBOZN5aLB8AGK8i0JGx7mrfsr7aKlZQneXcCPh8Y36LxbJjTAHgjiOVUUvzfUz+grCRVbY28bSHsN5Bhg0ikvQhhLywOsY7jXCI60gp6Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=SP1FofXQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="SP1FofXQ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D39011655;
	Mon, 12 Oct 2026 04:10:53 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E3ADB3F882;
	Mon, 12 Oct 2026 04:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791803457; bh=EuhGFyfDPuJeXZiHjuHL7QF5dqQy0HkQsqlo1Kmryz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SP1FofXQDtL1YvrgZH9s5r9gVZFBCYSW0WkHTHvA0Fqu9uhmI0wEWVopWSIAzZg7A
	 Ni8AvttICf0V2oEgTLk4h+eCtZsqIcFHRntRB2imqgdfZtFxY3fib/VYNMaiGQB4A6
	 TMB6t/dZ13wWhaQyLlb1GuwPIDXX9mhSwtJJ4JG8=
Message-ID: <ded76345-d09f-44d1-8f62-1d9c6ebd4272@arm.com>
Date: Mon, 12 Oct 2026 12:10:53 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/23] arm64: cpufeature: Store every ID register with
 its overrides applied
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@kernel.org>,
 =?UTF-8?Q?=C8=98tefania_Ion?= <stefion@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Borislav Petkov
 <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Tarun Sahu <tarunsahu@google.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
 <20261009100738.31288-9-will@kernel.org>
 <814a1d78-73df-4b8c-b596-65fb82f7cceb@arm.com>
 <CA+EHjTwgfGzS92thiGFcJ1NgoA732RBqv3gJUWF1gJAE-jANFA@mail.gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <CA+EHjTwgfGzS92thiGFcJ1NgoA732RBqv3gJUWF1gJAE-jANFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 11/10/2026 08:34, Fuad Tabba wrote:
> Hi Ben,
> 
> On Fri, 09 Oct 2026 16:51:14 +0100, Ben Horgan <ben.horgan@arm.com> wrote:
> [...]
>>> the same way. Everything read with read_cpuid() goes through
>>> read_cpuid_with_overrides(). CTR_EL0 and CNTFRQ_EL0, which are read
> [...]
>> For completeness shouldn't read_cpuid(SMIDR_EL1) change to
>> read_cpuid_with_overrides(SMIDR_EL1)?
> 
> "Everything" should have said every register in arm64_ftr_regs[], and
> SMIDR_EL1 isn't one of them, so read_cpuid_with_overrides() would hit
> the WARN_ON() in get_arm64_ftr_reg() whenever SME is enabled.

Thanks for the explanation. If I understand correctly, SMIDR_EL1 isn't in arm64_ftr_regs[] because
there is no need to sanitize SMIDR_EL1 to give a consistent view across cpus. If and when support
for sme priority is added then a unified view of the SMIDR_EL1.HIP, highest implement priority,
would be needed and so at that point deserve a place in arm64_ftr_regs[].

Cheers,
Ben

> 
> Thanks,
> /fuad

