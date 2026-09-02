Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC103351C2D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357793; cv=none; b=kjJQK+wLDYKeCAtsiHHacMH0Prl711rnYN8cCVjTl8QGB06T9bvXkwA/p/CMro31RSbyIKnhpInS4xDclFHb5Hh1J9Feo2RekUdwpWXpyrj8RsbshM6GWXGBngtZD9BMH5qRIUNfVMfdVJCpzY4j/+IXoIcNLPgOJih9tNTyx+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357793; c=relaxed/simple;
	bh=3c0gDYInTZgTimYJJ/kS8+tUIjz/dRXle3zB3JebKzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fW5wRFjiV+Yt2+HmhBQAEuWrAz+fqctZsSNXmSPpBNx02Jsh0+GbN/VhBWuoMgEBu4ZwS+afaaDYRAt5HKsc9b09Om9VusVWfyEoGohHYJ8+sdgiCtIh0+ZRZ20fz+WV5nD9aTvJLecZu5y56TyeSkMRBvbmBKayvfV95feqZH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ly9NPgyN; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ly9NPgyN"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64387165C;
	Wed,  2 Sep 2026 07:03:07 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C484E3F882;
	Wed,  2 Sep 2026 07:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788357791; bh=3c0gDYInTZgTimYJJ/kS8+tUIjz/dRXle3zB3JebKzY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ly9NPgyNCw3EbKiDZoRLsBgw8+9SW/WmYI6/NYlG5ZxycQjftWVfGO7Up13PJKxJF
	 qkkiLJU52UtKXyd3PwjcWkEYZGv20GxNO5GtvL/3AD7MPL3C0KvF2fglSwN5j+Cm8C
	 rsr64c9rNZi4egaekP0YlZfp7UDKcxM+JV5sCl9c=
Date: Wed, 2 Sep 2026 15:03:07 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
Message-ID: <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com>
References: <20260825205839.14571-1-brads@mainlining.org>
 <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com>
 <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org>

On Wed, Sep 02, 2026 at 02:51:22PM +0100, Bradley Morgan wrote:
> On 2 September 2026 14:50:22 BST, Mark Rutland <mark.rutland@arm.com>
> wrote:
> >On Tue, Aug 25, 2026 at 08:58:32PM +0000, Bradley Morgan wrote:
> >> This comes out of the hibernate resume discussion where Will asked if
> >> the restored kernel's hyp vectors are reinstalled before we come back
> >> from swsusp_arch_suspend() and free the reserved pages. Rather than
> >> answer with a one off fix, this series reworks resume to look like a
> >> resume from idle, which makes the answer fall out on its own.
> >> 
> >> The series leans on Mark Rutland's old work for inspiration, he had the
> >> same end goal in a branch from back then:
> >> 
> >>  
> >https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup
> >
> >Most of the series seems to be a rebased of those patches, just with
> >paraphrased commit messages and my S-o-B lines dropped. As commented on
> >patch 4, I do not think that is appropriate.
> 
> Same question as patch 2
> 
> If you want your S-O-B added, ok fine, but yeah.

As on patch 2, please read the documentation before continuing futher.

> Do you think this series itself is good? 

No. At present I think it's in a worse state than it was in my branch,
because portions have changed, with no rationale and no clear benefit.

Hence my ask to Catalin and Will to NOT pick this up for now.

Mark.

> 
> >
> >I'll take a more in-depth look shortly.
> 
> thanks!
> 
> >
> >Catalin, Will, for the moment please do not pick these up.
> >
> >Mark.
> >
> >> The short answer to the question: yes, but only because the rework makes
> >> resume look like a resume from idle. We enter cpu_resume() at the
> >highest
> >> available EL with the MMU off, and the resumed kernel installs its own
> >> hyp stub vectors into VBAR_EL2 through init_kernel_el() before anything
> >> else runs, so by the time swsusp_free() releases the trans_pgd copies
> >> nothing points at them anymore.
> >> 
> >> The series is structured so the first patch stands alone as a stable
> >> worthy fix for the missing hvc arguments. The rest is the cleanup: the
> >> stale init_kernel_el() comment gets corrected, MTE tag pages get freed
> >> after save instead of leaking on failed hibernates, the fragile
> >> _cpu_resume() calling convention gets split, and the last patch reworks
> >> hibernate to use the regular cpu_resume() logic end to end.
> >> 
> >> Everything object compiles and passes checkpatch and sparse. I could not
> >> boot or run a hibernate cycle on real hardware here, so that still wants
> >> doing before anyone gets excited.
> >> 
> >> Bradley Morgan (7):
> >>   arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
> >>   arm64: head: correct comment for init_kernel_el()
> >>   arm64: hibernate: free MTE tag pages after saving
> >>   arm64: hibernate: fix _cpu_resume() calling convention
> >>   arm64: hibernate: use dcache_by_myline_op
> >>   arm64: hibernate: only clean to PoC
> >>   arm64: hibernate: use regular cpu_resume() logic
> >> 
> >>  arch/arm64/include/asm/suspend.h  |  1 -
> >>  arch/arm64/kernel/head.S          |  6 +--
> >>  arch/arm64/kernel/hibernate-asm.S | 87 +++++++++++++++++++------------
> >>  arch/arm64/kernel/hibernate.c     | 66 +++++++++++------------
> >>  arch/arm64/kernel/sleep.S         |  6 +--
> >>  5 files changed, 88 insertions(+), 78 deletions(-)
> >> 
> >> -- 
> >> 2.47.3
> 
> --- Thanks!
> https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/
