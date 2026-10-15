Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020603BB125
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792098877; cv=none; b=qoWAkuUP7E5DmIqmA2xgi+kwjBNUSv+VRlDwi2bzYKkkCmOpe2Ldk6bn6BYpMILxutFBhRl+zJMibVtdCvbuXwX18ZP9MUND/anq/TrEiA+e4KWwvsOpNXsHS2/PEVMyvvhjv7rQc7k1mVUItA7n1eaxhl82b3QHGmn/qPfrNWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792098877; c=relaxed/simple;
	bh=w4bozrjjUhEs0epPFlm7QvNDLU+eSjJ7LHpRDNgfTfc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UGcIWKiRfV32d5TdhIK5eVL/5e3ow51vUoyeCWdexvwkp18fWvp1psXBoDdGHZ1R/IeBm4eDOQOmO560VTpBG9G3Bxq7/h0Bh8OA7n2mbPcfDRhpGoYV3HAvAu//nySFlxG31xsyvkDbSO7DxOkl4zf0D0B65v0r9qDtTiQF/SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBhg7Zn4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBhg7Zn4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884721F000C4;
	Thu, 15 Oct 2026 21:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792098875;
	bh=rCEsfOaskLm09h+crM61HD8iE+zY0qtj353GUmfqrds=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=TBhg7Zn4LHu9G0JutQ6EATN+TgN27smASVTtMKii7DevH5jAL6aGEIlQj57y4Dgdt
	 wx32B4+OOmGEYLNJEeTxmxGpAv8Qgry8Ogucebd6PxOGsPP78DQMIjKdweVTKOcsXy
	 BoIvLNF8MoiG4R+zZMPIS8XEdS01/owe3hjRi1onDVlsa/meN4xXPpz0okayQp4LrC
	 buLiPNglLH6ivJO6EOCcn5Pahy0ljq5g3iPHwbHwc9GV0Tsgjjmy9qI/uGgyWc2NRj
	 t6PKUwsBwB9mPSevi6t8gPwX9yFCHfoaOaqdbiPwHKpq90zt+d51RReSIbZNBNwqVj
	 GseAZdmi233Pg==
From: Thomas Gleixner <tglx@kernel.org>
To: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>, Ben Horgan
 <ben.horgan@arm.com>, =?utf-8?Q?=C8=98tefania?= Ion <stefion@google.com>,
 Catalin Marinas
 <catalin.marinas@arm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
 Borislav Petkov <bp@alien8.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Tarun Sahu <tarunsahu@google.com>, Fuad Tabba <fuad.tabba@linux.dev>,
 David Woodhouse <dwmw@amazon.co.uk>, Peter Zijlstra
 <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2 02/23] cpu/hotplug: Avoid trying to bring up CPUs
 that are already online
In-Reply-To: <20261009100738.31288-3-will@kernel.org>
References: <20261009100738.31288-1-will@kernel.org>
 <20261009100738.31288-3-will@kernel.org>
Date: Thu, 15 Oct 2026 23:14:31 +0200
Message-ID: <874iemekeg.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 09 2026 at 11:07, Will Deacon wrote:
> There's little point trying to bring up a CPU that is already online.
> Although _cpu_up() handles this case by doing nothing (because the
> target state has already been reached), it's wasted effort when we can
> easily elide the call to cpu_up() in the first place.

s/we can ../the call can be .../

> Check that the target CPU isn't already online before invoking cpu_up()
> from cpuhp_bringup_mask().

Confused.

cpuhp_bringup_mask() is only invoked from bringup_nonboot_cpus() during
init. So there is only _ONE_ CPU which can be online and in the present
mask, i.e. the boot CPU, right? Any other CPU than that being online
would be a bug, no?

Can you spell that out please and add a comment to that effect?

I'm not opposed to the change per se, but I doubt that the "win" is
actually measurable as you trade that one pointless call against a
conditional which has to be executed NR_CPUS times, where NR_CPUS-1
times the conditinal is pointless. There is ZERO contention at that
point, so what's the actual benefit?

Thanks,

        tglx
