Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEC549F127
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357532; cv=none; b=F7rFLScVYku6RF70R10I228nBef91iLiBn78N9BbazSxEVbnEsQpgfs6spfRBlMPRokYF4kf5kEo1tkzsNXhtTZNIxP42+OkDzwrJbPdzaI+3eRNXU+MKk3uu0M+xseD/tuu/q1OxxELP77dnqpdAgz3uFXhepWaWKF+r3ITKXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357532; c=relaxed/simple;
	bh=R2qNUqrd7ziAfwzjUnJC9SGXulz077UuDWu6eGBMK2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TDCShdQx2qmakqOU/Us0q03UJrgpvKer0LCOX1SPkArRjD/GwCys9KdRLrCas1PiToRb3BpDoCSSbtQMdpSlFAO1zK2tJNSEHrMrjAeAhqPgw3h5rYKMtC8xtY0FXYlzssGGOFtyBdTUajyfXUxEnvYevueq+8z69Yj/xhxF338=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tsS42Zu3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tsS42Zu3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2176C1E4D;
	Wed,  2 Sep 2026 06:58:45 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7755D3F673;
	Wed,  2 Sep 2026 06:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788357528; bh=R2qNUqrd7ziAfwzjUnJC9SGXulz077UuDWu6eGBMK2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tsS42Zu3sZ2P9A+mTf75AtGPj3PaVLgGZucmsIyHoXKxS1zIN7ohGblkYC+QmTopB
	 B9tX8RdVw4FTeZkMHzAcwvUIjxcv6dayXsnCRI0HYWK5+5pqxmNKEWNfPfYBvP/Vx2
	 KnHz0ZsU33/yb6cVRFpkSlr8u4c548gZBC8YK0Yw=
Date: Wed, 2 Sep 2026 14:58:45 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: head: correct comment for init_kernel_el()
Message-ID: <apgrlRLacxqhXsX-@J2N7QTR9R3.cambridge.arm.com>
References: <20260825205839.14571-1-brads@mainlining.org>
 <20260825205839.14571-3-brads@mainlining.org>
 <apgovCGT-D7OWbSE@J2N7QTR9R3.cambridge.arm.com>
 <FBC45096-70E5-4F97-B2F0-863BCC91BB4F@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <FBC45096-70E5-4F97-B2F0-863BCC91BB4F@mainlining.org>

On Wed, Sep 02, 2026 at 02:49:57PM +0100, Bradley Morgan wrote:
> On 2 September 2026 14:46:36 BST, Mark Rutland <mark.rutland@arm.com>
> wrote:
> >On Tue, Aug 25, 2026 at 08:58:34PM +0000, Bradley Morgan wrote:
> >> The comment above init_kernel_el() still says the function configures
> >> the CPU to execute at the highest reachable EL, but that stopped being
> >> true a while back. Ever since commit ae4b7e38e9a94798 ("arm64: Allow
> >> sticky E2H when entering EL1"), init_kernel_el() always drops to EL1,
> >> and it is finalise_el2() that brings us back up to EL2 when we want it.
> >> 
> >> Update the comment to match what the code actually does.
> >> 
> >> Signed-off-by: Bradley Morgan <brads@mainlining.org>
> >> Cc: Ard Biesheuvel <ardb@kernel.org>
> >> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >> Cc: James Morse <james.morse@arm.com>
> >> Cc: Marc Zyngier <maz@kernel.org>
> >> Cc: Will Deacon <will@kernel.org>
> >> ---
> >>  arch/arm64/kernel/head.S | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> >This looks to be my patch [1], but with a (partially) rewritten commit
> >message, and my S-o-B dropped.
> >
> >There was admittedly one typo in that commit message that needed to be
> >fixed, but I don't think the rest of the changes were necessary, and I
> >don't think it's approriate to drop my S-o-B.
> >
> >I think similar is true for the rest of the series. The patch fixing the
> >_cpu_resume() only seems to have a paraphrased commit message.
> >
> >[1]
> >https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=ee4323ff6a2ba4c3989b38f13b2c1a516d6c27e4
> >
> >Mark.
> >
> >> 
> >> diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
> >> index 87a822e5c4ca..c6301557eee1 100644
> >> --- a/arch/arm64/kernel/head.S
> >> +++ b/arch/arm64/kernel/head.S
> >> @@ -254,9 +254,9 @@ SYM_FUNC_END(__primary_switched)
> >>  	.section ".idmap.text","a"
> >>  
> >>  /*
> >> - * Starting from EL2 or EL1, configure the CPU to execute at the
> >highest
> >> - * reachable EL supported by the kernel in a chosen default state. If
> >dropping
> >> - * from EL2 to EL1, configure EL2 before configuring EL1.
> >> + * Starting from EL2 or EL1, configure the CPU to execute at EL1.
> >> + * If dropping from EL2 to EL1, configure EL2 before configuring EL1.
> >> + * To use VHE we'll upgrade back to EL2 later in finalise_el2().
> >>   *
> >>   * Since we cannot always rely on ERET synchronizing writes to sysregs
> >(e.g. if
> >>   * SCTLR_ELx.EOS is clear), we place an ISB prior to ERET.
> >> -- 
> >> 2.47.3
> Hi mark, do you **WANT** your sob? I don't mind.

Please read Documentation/process/submitting-patches.rst

The SoB lines form a chain of authorship and delivery. You *must not*
drop an SoB line.

> I dropped it because it seemed you didn't care about it (or were too
> busy),hence, yeah.

I was busy, then on holiday. Neither has any relevance to the SoB lines.

I do care about these patches, and I'm going to have to review them
regardless. The reason I hadn't posted them was that this is a subtle
area that needs careful handling.

Mark.
