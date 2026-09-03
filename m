Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F32B49EC61
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437810; cv=none; b=MARlwYNUZpAm8iYgvc55zokkC4mp9K/BbHgNp4q+Lgr36AUlzK+aNIHsBsESaAqu90e5MSS0OldjQKfGUSF0Od8cgfpeE/ABTrI7ngQqwKVYh7egvsJN1cSPl42bjnBD7+HxharSWWGA4YOmcAbznsxqb2kKf54+mr9oH1bPvQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437810; c=relaxed/simple;
	bh=0tOIg6Q8v4JJOIh5q5jjAYeko7ok2Fvr7aua/Lj3d+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tS4Hyz71reGBixEMKsc6s3WSgE0WphcvlNeBjn6WgSbSeBoSGkKJlzYxxrellJPI0y4yYE6jmrL9SmfEYdqeYsHPudMPiXs1FYeF47Zx1tcNfr2mICMi6NuRJNs2RSW7/AAcVTze4ZNIjB8rtAN8QFD3MIXIlpg/xnTlPZpAxJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfekgQ+W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfekgQ+W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26D8D1F000E9;
	Thu,  3 Sep 2026 12:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788437808;
	bh=l5P/AdgBph3SlVsp0Z/XaOLD0gN95eYKldhRfreJuQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FfekgQ+W0ItBtRJlNm8QBpqGSkfMsg4oPcQ7Gcdf1z9bXGY1YuizfoXuaNG3uOfFX
	 42EYTFVmnONyOpvdWeAFppPTzVjFuxCXUwzkwgllmQVcZpaa2Sha2sn/+oOPvPGqDd
	 LK/maSwGR+KMxtXOmDPzSsXuWMizQxXWnNQ5kitND7YOclpXYT1t0brd4rSmdR6uIW
	 EXrFyHGLyLpi2CunJofmitENzCqfCNE6d91wv9QJ5xnD6P6VPMy/L85ufQ7rtsG9fL
	 ca2Q5Yif6m0SYLCLyn5T68hCQen41XpTboSH0/wAF5UM9QaVRR+g8ufitNKcnTcbJk
	 zUCVc8AhEha+Q==
Date: Thu, 3 Sep 2026 13:16:44 +0100
From: Will Deacon <will@kernel.org>
To: Bradley Morgan <brads@mainlining.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Morse <james.morse@arm.com>, Marc Zyngier <maz@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
Message-ID: <apllLC2jY4Ak192M@willie-the-truck>
References: <20260825205839.14571-1-brads@mainlining.org>
 <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com>
 <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org>
 <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com>
 <aplRx8f5NprO9dSU@willie-the-truck>
 <CA3C4FFB-FEAE-4537-B0DE-DEBB06D053FE@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA3C4FFB-FEAE-4537-B0DE-DEBB06D053FE@mainlining.org>

On Thu, Sep 03, 2026 at 12:26:11PM +0100, Bradley Morgan wrote:
> On 3 September 2026 11:53:59 BST, Will Deacon <will@kernel.org> wrote:
> >On Wed, Sep 02, 2026 at 03:03:07PM +0100, Mark Rutland wrote:
> >> On Wed, Sep 02, 2026 at 02:51:22PM +0100, Bradley Morgan wrote:
> >> > On 2 September 2026 14:50:22 BST, Mark Rutland <mark.rutland@arm.com>
> >> > wrote:
> >> > >On Tue, Aug 25, 2026 at 08:58:32PM +0000, Bradley Morgan wrote:
> >> > >> This comes out of the hibernate resume discussion where Will asked
> >if
> >> > >> the restored kernel's hyp vectors are reinstalled before we come
> >back
> >> > >> from swsusp_arch_suspend() and free the reserved pages. Rather than
> >> > >> answer with a one off fix, this series reworks resume to look like
> >a
> >> > >> resume from idle, which makes the answer fall out on its own.
> >> > >> 
> >> > >> The series leans on Mark Rutland's old work for inspiration, he had
> >the
> >> > >> same end goal in a branch from back then:
> >> > >> 
> >> > >>  
> >> >
> >>https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/suspend/cleanup
> >> > >
> >> > >Most of the series seems to be a rebased of those patches, just with
> >> > >paraphrased commit messages and my S-o-B lines dropped. As commented
> >on
> >> > >patch 4, I do not think that is appropriate.
> >> > 
> >> > Same question as patch 2
> >> > 
> >> > If you want your S-O-B added, ok fine, but yeah.
> >> 
> >> As on patch 2, please read the documentation before continuing futher.
> >> 
> >> > Do you think this series itself is good? 
> >> 
> >> No. At present I think it's in a worse state than it was in my branch,
> >> because portions have changed, with no rationale and no clear benefit.
> >> 
> >> Hence my ask to Catalin and Will to NOT pick this up for now.
> >
> >I wasn't going to pick them up with the incorrect authorship, but it's
> >worth noting that Bradley's patch _does_ fix one of the hibernation
> >problems and has been tested by Vladimir:
> >
> >https://lore.kernel.org/all/20260809213615.11646-1-include@grrlz.net/
> >
> >I would prefer to take your complete set of patches, but if you don't
> >want that then should I just take the above for now? Prior to this
> >series, there has been no activity for nearly two years on your branch,
> >so I'd prefer to get _something_ in, even if it only fixes some of the
> >problems.
> >
> 
> So your taking the bugfix? I'll do V2 later, you'd need to review my sleep
> patch tho. 

I'm asking Mark how he would like to proceed, so no need to send a v2 just
yet.

Will
