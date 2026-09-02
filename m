Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91518330B3F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357709; cv=none; b=twNHNqIVkMDzGQf3EStQvSFY2HgI3AOCOMmvco6AsiiFcRB3puHTxAo2jCbhHn9Z0Le3b52V5HMiUGS6+r6y0VYiPwK8QUjbygrvVFzYbijdH6j498iqXrIBcxdAwIPeFHOC3SAM9yIHkZ/7hfN6PPHKdvFY4MVzE1FuvlgYt7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357709; c=relaxed/simple;
	bh=5gePoqX3Zr/bIBzCJJK82EybKEKX79hTmUl8Lt1nK6E=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=toddiQWChpFBQNSEcrVP0Qx0Un3E5Ptjf6aPwwqIECd22u1EbSU62Hohbj5hzAfUVuRxZKOJYoddBA/2lX6/GMPVSsO7RcoCeOvL8znlELkNDVjZ3ei2UeJrWQR8VuFBHryoqyqAN8dEjrJf8aiogw2updNB3ZZ0MnFI165fAdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=THYpt8pl; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=oR7N+qIW; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="THYpt8pl";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="oR7N+qIW"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788357698; bh=kRZwS841GcA5VzuOYLgzKhc
	r7/acQnTRJCI0lS681iY=; b=THYpt8plHH5PHoL0pm5ADvyOnwx8z5K4uGClagz7HRZ/25PLG1
	RmhMzMMLQ9bSDESWfULPx4k4yr2VpvwN+nFJyzQGClLk8CnvTcxXnqj9WyPzl0w41/BRJIVYUjG
	g+gChXg2CYyE4FBJsQNk8dzG+ErY2brU6aAN9lUv2mNavXr21v1pNLqz+61l+qesQwTxr/N/Icq
	S0TzWQ0SAQFojnkBEYZxlnlOKG61TJFqCgBEdmxgMHFjQusixUeeOPyjDGlLRz/wZRla0o3vz4C
	/WRFTdh6FkL5FY6sQPbGTy2qgyGcDqHD8pA8EBfYrTkMpKAKZLWe/G8ZHtp+hjePYsw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788357698; bh=kRZwS841GcA5VzuOYLgzKhc
	r7/acQnTRJCI0lS681iY=; b=oR7N+qIW/Wl0QWs83dGRv5hC50V7ul9TSAiv1FzAKPrmzhDT1y
	MKqvSiMeUIyIoXQo2XnUdVMv2wnj3peCLKAw==;
Date: Wed, 02 Sep 2026 15:01:36 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Mark Rutland <mark.rutland@arm.com>
CC: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: head: correct comment for init_kernel_el()
In-Reply-To: <apgrlRLacxqhXsX-@J2N7QTR9R3.cambridge.arm.com>
References: <20260825205839.14571-1-brads@mainlining.org> <20260825205839.14571-3-brads@mainlining.org> <apgovCGT-D7OWbSE@J2N7QTR9R3.cambridge.arm.com> <FBC45096-70E5-4F97-B2F0-863BCC91BB4F@mainlining.org> <apgrlRLacxqhXsX-@J2N7QTR9R3.cambridge.arm.com>
Message-ID: <9489CCEF-9599-4F1D-AD03-CC995CF1956A@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 2 September 2026 14:58:45 BST, Mark Rutland <mark.rutland@arm.com>
wrote:
>On Wed, Sep 02, 2026 at 02:49:57PM +0100, Bradley Morgan wrote:
>> On 2 September 2026 14:46:36 BST, Mark Rutland <mark.rutland@arm.com>
>> wrote:
>> >On Tue, Aug 25, 2026 at 08:58:34PM +0000, Bradley Morgan wrote:
>> >> The comment above init_kernel_el() still says the function configures
>> >> the CPU to execute at the highest reachable EL, but that stopped
>being
>> >> true a while back. Ever since commit ae4b7e38e9a94798 ("arm64: Allow
>> >> sticky E2H when entering EL1"), init_kernel_el() always drops to EL1,
>> >> and it is finalise_el2() that brings us back up to EL2 when we want
>it.
>> >> 
>> >> Update the comment to match what the code actually does.
>> >> 
>> >> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> >> Cc: Ard Biesheuvel <ardb@kernel.org>
>> >> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> >> Cc: James Morse <james.morse@arm.com>
>> >> Cc: Marc Zyngier <maz@kernel.org>
>> >> Cc: Will Deacon <will@kernel.org>
>> >> ---
>> >>  arch/arm64/kernel/head.S | 6 +++---
>> >>  1 file changed, 3 insertions(+), 3 deletions(-)
>> >
>> >This looks to be my patch [1], but with a (partially) rewritten commit
>> >message, and my S-o-B dropped.
>> >
>> >There was admittedly one typo in that commit message that needed to be
>> >fixed, but I don't think the rest of the changes were necessary, and I
>> >don't think it's approriate to drop my S-o-B.
>> >
>> >I think similar is true for the rest of the series. The patch fixing
>the
>> >_cpu_resume() only seems to have a paraphrased commit message.
>> >
>> >[1]
>>
>>https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=ee4323ff6a2ba4c3989b38f13b2c1a516d6c27e4
>> >
>> >Mark.
>> >
>> >> 
>> >> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>> >> index 87a822e5c4ca..c6301557eee1 100644
>> >> --- a/arch/arm64/kernel/head.S
>> >> +++ b/arch/arm64/kernel/head.S
>> >> @@ -254,9 +254,9 @@ SYM_FUNC_END(__primary_switched)
>> >>  	.section ".idmap.text","a"
>> >>  
>> >>  /*
>> >> - * Starting from EL2 or EL1, configure the CPU to execute at the
>> >highest
>> >> - * reachable EL supported by the kernel in a chosen default state.
>If
>> >dropping
>> >> - * from EL2 to EL1, configure EL2 before configuring EL1.
>> >> + * Starting from EL2 or EL1, configure the CPU to execute at EL1.
>> >> + * If dropping from EL2 to EL1, configure EL2 before configuring
>EL1.
>> >> + * To use VHE we'll upgrade back to EL2 later in finalise_el2().
>> >>   *
>> >>   * Since we cannot always rely on ERET synchronizing writes to
>sysregs
>> >(e.g. if
>> >>   * SCTLR_ELx.EOS is clear), we place an ISB prior to ERET.
>> >> -- 
>> >> 2.47.3
>> Hi mark, do you **WANT** your sob? I don't mind.
>
>Please read Documentation/process/submitting-patches.rst
>
>The SoB lines form a chain of authorship and delivery. You *must not*
>drop an SoB line.
>
>> I dropped it because it seemed you didn't care about it (or were too
>> busy),hence, yeah.
>
>I was busy, then on holiday. Neither has any relevance to the SoB lines.
>
>I do care about these patches, and I'm going to have to review them
>regardless. The reason I hadn't posted them was that this is a subtle
>area that needs careful handling.
>
>Mark.
Sorry mate,

V2 will have your SOB on all patches

I removed them due to like, what if you said

"Remove my sob these patches are terrible and unrelated"

Well, this is a corner case, but I had to think this through,

Yep, V2 will have your sob on all 7 patches.
--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
