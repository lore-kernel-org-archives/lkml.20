Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E63F449B24
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432846; cv=none; b=sfOJlcinxFW4pym8mINisQt6KQGaSCMRFoG3iLV49AxYrXXL0rGK0JCr5MeQyNtExv8wBezETtRxEoyLpHTRLNA1k5DHcD+c8TSQnypuHJI63CKQA8F5dxN4KEfgt4ueTtTxChe/HHbEQVp1FRP3vdAB6j34jkvl6twHaeA8dYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432846; c=relaxed/simple;
	bh=eU2PRGBwWSDfjuknSzKstH4CVGNPQz6F4XpHDLfW2+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsfZSNOVQCwVsMe+sO0fzY9S7AH8CAeuiEmwt0qqxkFnqqV0QomtUXDwlJygIm0qOosr6qMaPE39YmeNgf36evM1YbwkI6AM6puWhA6qLt0lVnBd5bK3hz/0X/m9ZWP3pQplLh+isR+2PIatjG4fRM411Vlmlx5MbEmUGoiB+gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fV01/3ml; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fV01/3ml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9171F000E9;
	Thu,  3 Sep 2026 10:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788432844;
	bh=jZ5ikIPdtrsw5VYyqaHGjiwcB1Oj6QXBAQanMarXMYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fV01/3mlZ/6mEninu+ZZoxUqHyhZS/GDz3zW0DCZ+bQzicyuedWOJx6onxgCoQOXu
	 02L00SCN+AxvCsUapErpvho+g+10FCPYI6xnMwTWh0T3cCQiPj9lcHbFfGVc+VD6lO
	 MqWjQkfmSn9bau6NgeKCWO63A2cEQdNfitT99HxZxWKDk86GjI0jAGK4fDknp7ZmFw
	 YaJYY8LGlzgWYtoxdm4FOIKwqU7ZnO4jLiAlw3ww8IetAWat+kuz95hGDVRUSp4US9
	 CRFQXmOsrcs3MLdwQGfK9AenFAgPaKr0UjvnzgElCcmiWJwEUmX9Q/Flg4ZI1HU5fW
	 WSIsNeGRs+a0g==
Date: Thu, 3 Sep 2026 11:53:59 +0100
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Bradley Morgan <brads@mainlining.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
Message-ID: <aplRx8f5NprO9dSU@willie-the-truck>
References: <20260825205839.14571-1-brads@mainlining.org>
 <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com>
 <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org>
 <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com>

On Wed, Sep 02, 2026 at 03:03:07PM +0100, Mark Rutland wrote:
> On Wed, Sep 02, 2026 at 02:51:22PM +0100, Bradley Morgan wrote:
> > On 2 September 2026 14:50:22 BST, Mark Rutland <mark.rutland@arm.com>
> > wrote:
> > >On Tue, Aug 25, 2026 at 08:58:32PM +0000, Bradley Morgan wrote:
> > >> This comes out of the hibernate resume discussion where Will asked if
> > >> the restored kernel's hyp vectors are reinstalled before we come back
> > >> from swsusp_arch_suspend() and free the reserved pages. Rather than
> > >> answer with a one off fix, this series reworks resume to look like a
> > >> resume from idle, which makes the answer fall out on its own.
> > >> 
> > >> The series leans on Mark Rutland's old work for inspiration, he had the
> > >> same end goal in a branch from back then:
> > >> 
> > >>  
> > >https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup
> > >
> > >Most of the series seems to be a rebased of those patches, just with
> > >paraphrased commit messages and my S-o-B lines dropped. As commented on
> > >patch 4, I do not think that is appropriate.
> > 
> > Same question as patch 2
> > 
> > If you want your S-O-B added, ok fine, but yeah.
> 
> As on patch 2, please read the documentation before continuing futher.
> 
> > Do you think this series itself is good? 
> 
> No. At present I think it's in a worse state than it was in my branch,
> because portions have changed, with no rationale and no clear benefit.
> 
> Hence my ask to Catalin and Will to NOT pick this up for now.

I wasn't going to pick them up with the incorrect authorship, but it's
worth noting that Bradley's patch _does_ fix one of the hibernation
problems and has been tested by Vladimir:

https://lore.kernel.org/all/20260809213615.11646-1-include@grrlz.net/

I would prefer to take your complete set of patches, but if you don't
want that then should I just take the above for now? Prior to this
series, there has been no activity for nearly two years on your branch,
so I'd prefer to get _something_ in, even if it only fixes some of the
problems.

Will
