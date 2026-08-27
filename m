Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6063CCFA8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820080; cv=none; b=Z8f8LOWkaXCSYMK7sS9lzrWHseZ+qbBX0llnOpbAnWdrVuxcxGLf3dYnxLhoSwA6BA1IpR9Xe31dDdGhtW6PDvynq5lbOV/MViJ2qZkm9YumrLkPMxbQcPqSZawxfd8GdjSsltDVF2xrkArL+9fYqcHWzg6f9Ru1+5LZaf7wz7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820080; c=relaxed/simple;
	bh=vvhgs5kUI78wRuI2nWyZ8yrPiCiHvcGyGw9bisUEkfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqdMy/6fAreDtzeP46rw5kmc70JCNpMSBcJkaPnhLjjOd5Le2E02yUMEiuFZUIJRQnOQrpO84epr6xmIeRvfaLC9UENzM1oHdAVDQG9XuQ4UbZARr5BKY3udkWZnROdl3S8Jly0tlgDdRQ2klYG6LAKhvZmu50oQtp+8ohXZZVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iU94Tvd1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iU94Tvd1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FC191691;
	Thu, 27 Aug 2026 01:41:08 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D2293F85F;
	Thu, 27 Aug 2026 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787820072; bh=vvhgs5kUI78wRuI2nWyZ8yrPiCiHvcGyGw9bisUEkfQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iU94Tvd1ILay26FL1QzG2god2cUN9C+gWw2/2/FoHU6IXZjRCaaPQGmfTvuDPGX/e
	 aXHME8J6SNADrjbksz1gyYfA67cecCeRhOhseeGkx5Wr9r5W60f68Ul8ezUwHRRPbL
	 zb3TNP2BhM3i+3HCOFoZULWbI0zjfeYGdJ+9SiWU=
Message-ID: <0b2c58d2-cc82-4c68-aaa2-83449d0b48c1@arm.com>
Date: Thu, 27 Aug 2026 09:41:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arm64: MPAM2_EL2 and MPAMHCR_EL2 are left UNKNOWN under
 arm64.nompam
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Xi Ruoyao <xry111@xry111.site>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
 <a491ea12-b0f6-43e4-bb5d-dba508120bfb@arm.com>
 <CA+EHjTy0jCbEb0K7Sd_+X-Ly_6fC3vuPxmyTVRkqkF_DAFMucA@mail.gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <CA+EHjTy0jCbEb0K7Sd_+X-Ly_6fC3vuPxmyTVRkqkF_DAFMucA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 26/08/2026 23:08, Fuad Tabba wrote:
> Hi Ben,
> 
> On Wed, 26 Aug 2026 at 15:48, Ben Horgan <ben.horgan@arm.com> wrote:
> ...
>>> I was wondering whether that was deliberate. AFAICT, restoring the
>>> writes would trap to EL3 wherever MPAM3_EL3.TRAPLOWER is still set, so
>>> it may not be safe on the machines the override was added for. I have
>>> a patch restoring them, but I learned my lesson.
>>
>> Yes, on a system where the firmware ignores MPAM, MPAM3_EL3.TRAPLOWER will be 1 and the traps won't
>> handled and so if MPAM2_EL2 or MPAMHCR_EL2 are touched to disable the traps then the f/w will panic.
>> As you say, if arm64.nompam is set on a platform where f/w has cleared MPAM3_EL3.TRAPLOWER to 0 then
>> the MPAM registers may or not trap . This is different from other features because the EL2 register
>> than configures the traps is MPAM specific and not in a generic register e.g. CPTR_EL2.
> 
> Marc's "Fully disable configured-out features" series [1] runs into
> this too. MPAM may be the family member EL2 cannot put into a defined
> state on its own.
> 
>> There seems to be no way round this other than documenting that you should only set arm64.nompam if
>> you are sure that MPAM3_El3.TRAPLOWER is 1 as you otherwise have a side channel. What do you think?
> 
> Documentation it is, I'm afraid... :)
> 
> Is there any way to find out what MPAM3_EL3.TRAPLOWER is set to?

No

 If
> not, could the caveat go the other way round: arm64.nompam is for
> systems where firmware ignores MPAM, and should only be set on a
> machine that does not boot without it?

Yes, seems fine.

> 
> __activate_traps_mpam() is gated on the same ID fields the override
> clears, so KVM stops trapping guest accesses to MPAM0_EL1, MPAM1_EL1
> and MPAMIDR_EL1, while still hiding the ID field.
> 
> I will send a patch for Documentation/arch/arm64/mpam.rst, unless you
> or James think it belongs elsewhere.

Thanks! Ok with me assuming you also add a reference in
Documentation/admin-guide/kernel-parameters.txt, e.g. "See Documentation/arch/arm64/mpam.rst".

Ben

> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20260302115653.1517326-1-maz@kernel.org/
> 
> 
>>
>> Thanks,
>>
>> Ben
>>
>>
>>>
>>> Cheers,
>>> /fuad
>>>
>>> [1] https://lore.kernel.org/all/20260825164219.3347229-1-fuad.tabba@linux.dev/
>>

