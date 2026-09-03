Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C35345CA1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788402108; cv=none; b=TlYe13YOLQaCDo5kS5yW7LCwh30AO7cSzqqsj6WUKhvMBoynJYfu0I2xOR29H37ZMwihm6BH6bdNyQ17Xi7PK7mjR8Z5SALzsHJlTUu5ZvuspmeIiXCKn/UNhhyW7szqO9fsMOMq/3DfQoUXB+0NFICFnbZpQF9eSNvVhFVQ5CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788402108; c=relaxed/simple;
	bh=FiSTVRTvLii3uBnQ9AyVG9QwTLdsozK2xfhFwWzvOvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2JvqbhemOTIoR7s88JJinnlP94TqBEAEGHvWm4JsItibZ++gQulNSx3MqO3Z/7XqPF2Zo8+78JXZeXcedRWoUO0tV+tHCoMzi2p05b79e6IP7sKE7C2WIBWLtLJBiRC4UjhPR4BweY5ItHF2hsQ1IVcmrLvKKP0ki/A7mcDxtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LkNTOb+R; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LkNTOb+R"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 574131682;
	Wed,  2 Sep 2026 19:21:38 -0700 (PDT)
Received: from [192.168.20.93] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4668E3F7D8;
	Wed,  2 Sep 2026 19:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788402102; bh=FiSTVRTvLii3uBnQ9AyVG9QwTLdsozK2xfhFwWzvOvI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LkNTOb+RbqNHZjP+X+7uXUJ+qS/6Yb4OpkLD8uq20t7hu/Sml7oMppqyqVkWQoG5t
	 pEKhP0LUA4FL+fJh+feRl/RF81t08kV/rCP9RV4/KghW2Qw5tDSYr3NgadQbv8eLc+
	 JDPR8KzvsCx6yYFh6WVjzN5RUf5YnMNe2FP0xjyw=
Message-ID: <d11026b0-1faf-4de1-b562-f6e46e60ef92@arm.com>
Date: Wed, 2 Sep 2026 21:21:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Use __u128 in arm64 UAPI headers
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 David Matlack <dmatlack@google.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Andreas Grapentin <gra@linux.ibm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Dave Martin
 <dave.martin@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Marc Zyngier <maz@kernel.org>
References: <20260626141730.5976-1-will@kernel.org>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <20260626141730.5976-1-will@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 6/26/26 9:17 AM, Will Deacon wrote:
> Hi folks,
> 
> This is version two of the patch I previously sent here:
> 
>    https://lore.kernel.org/r/20260619130835.5678-1-will@kernel.org
> 
> I even briefly queued that version up, but it exploded spectacularly
> when building the kselftests for arm64 [1] [2]. So the only change since
> v1 is the addition of a preliminary patch that adds the '__u128' typedef
> to the private copy of linux/types.h used by the tools/ directory.
> 
> I plan to take this all via the arm64 tree unless anybody objects.

This seems to be creating a interesting situation that the follow-on 
commit:
10a47fb67340 tools: linux/types.h: Add 128-bit integer types for arm64 
UAPI structures

Is missing from older kernel tooling/etc, which means the tools that end 
up pulling this header in won't build on machines running 7.3 kernel 
headers.

AKA, build/install master, switch back to an older branch and discover 
say bpftool won't build anymore.



Thanks,


> 
> Cheers,
> 
> Will
> 
> [1] https://lore.kernel.org/r/202606240441.7eZ1TIRM-lkp@intel.com
> [2] https://lore.kernel.org/r/ajvGS7UBpWzJtzkw@sirena.org.uk
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
> Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> Cc: David Matlack <dmatlack@google.com>
> Cc: Steffen Eiden <seiden@linux.ibm.com>
> Cc: Andreas Grapentin <gra@linux.ibm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dave Martin <dave.martin@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> 
> --->8
> 
> Will Deacon (2):
>    tools: linux/types.h: Add 128-bit integer types for arm64 UAPI
>      structures
>    arm64: uapi: Use __u128 instead of __uint128_t in UAPI headers
> 
>   arch/arm64/include/uapi/asm/ptrace.h     | 12 ++++++------
>   arch/arm64/include/uapi/asm/sigcontext.h |  6 +++---
>   tools/include/linux/types.h              |  5 +++++
>   3 files changed, 14 insertions(+), 9 deletions(-)
> 

