Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC4E418361
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755738; cv=none; b=J4CAf2eqqK/VYUiS4eNFZ1HzjL9RYitqllg5zRObXirbs6PZAwyRFvYT9LluTXmWFi2tdZYY73a5pO0dXyGSnZDGLunu98kpBph9iaCYDwGP7QoWTam/TzjUrI+k5F4NeAr6jgbZWwvLu+va1KZ74cTIjXr41u+lN0FJhk9eIug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755738; c=relaxed/simple;
	bh=vLb0Om9UgS2n6FDS9rGiXGaZDVt71YmuY1679WKO2V4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9modQeiWLDYMRsxWw2kpe9/7CpXJf+9lKLKsVpIQSmbsu7tEH0Cm7NTr7Cs6N2mSmMAQ25MLIvQ4ODjBfrUXxN8lDjEjShXhZM/4WfujwrFol90MJ5gTD7TtfU+OQMwBViQBf7Enr+YrcorwPm/vkuFn80oUXXj69jrA92HVI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=kTtoJaFE; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="kTtoJaFE"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7F1816F2;
	Wed, 26 Aug 2026 07:48:49 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DACB3F7D8;
	Wed, 26 Aug 2026 07:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787755733; bh=vLb0Om9UgS2n6FDS9rGiXGaZDVt71YmuY1679WKO2V4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kTtoJaFENZIGpQGgOEM6RwVAGj0gR0mVYgCS3/4s9CcdnY+LzFxgkQM0z0AKmc1JZ
	 v69DElMYWTGU8N5ROmOTX1FIJclhONhoSO/+IZBHodJ8iCJ/RWKOK4manc4Rxy6LdM
	 tCjO/WW8XaWXDziSHFDGtZYjsuKmhKeZM6U+R5EM=
Message-ID: <a491ea12-b0f6-43e4-bb5d-dba508120bfb@arm.com>
Date: Wed, 26 Aug 2026 15:48:50 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arm64: MPAM2_EL2 and MPAMHCR_EL2 are left UNKNOWN under
 arm64.nompam
To: Fuad Tabba <fuad.tabba@linux.dev>, Xi Ruoyao <xry111@xry111.site>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Fuad,

On 25/08/2026 20:18, Fuad Tabba wrote:
> Hi Xi, James, Catalin, Will,
> 
> I'm going through the features that can be disabled on the host
> command line, checking that EL2 either traps them or leaves its own
> controls in a defined state. That quick and easy GMID_EL1 fix came out
> of the same pass [1] :)
> 
> Since 10f885d63a0e ("arm64: Add override for MPAM"), arm64.nompam
> skips the MPAM2_EL2 and MPAMHCR_EL2 writes in finalise_el2_state, so
> on an MPAM PE with EL3 implemented the trap controls in both keep
> their reset values, which are architecturally UNKNOWN.
> 
> I was wondering whether that was deliberate. AFAICT, restoring the
> writes would trap to EL3 wherever MPAM3_EL3.TRAPLOWER is still set, so
> it may not be safe on the machines the override was added for. I have
> a patch restoring them, but I learned my lesson.

Yes, on a system where the firmware ignores MPAM, MPAM3_EL3.TRAPLOWER will be 1 and the traps won't
handled and so if MPAM2_EL2 or MPAMHCR_EL2 are touched to disable the traps then the f/w will panic.
As you say, if arm64.nompam is set on a platform where f/w has cleared MPAM3_EL3.TRAPLOWER to 0 then
the MPAM registers may or not trap . This is different from other features because the EL2 register
than configures the traps is MPAM specific and not in a generic register e.g. CPTR_EL2.

There seems to be no way round this other than documenting that you should only set arm64.nompam if
you are sure that MPAM3_El3.TRAPLOWER is 1 as you otherwise have a side channel. What do you think?

Thanks,

Ben


> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20260825164219.3347229-1-fuad.tabba@linux.dev/

