Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA873FFD;
	Thu, 24 Sep 2026 00:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790208306; cv=none; b=IDSsfgTQHKViVFNsxdtqb0uEP+jeeLNgt+mhmqje0gjkOWfjHXAMqXlrXouNUuEheSrspbl9kmz2rimh6vkVz81Ai9FNdgaiytnCMVFgTJiRAlErX6uScbATmGSJ29zdpEPu+k9WPVgQ8OTXYCnYWr/fAn7EltXDxN7eV25aIgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790208306; c=relaxed/simple;
	bh=7WNzo41Zoicasxs79VzMlEFPAZW5DV5fcUwTTezpuuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sw9VvhRI5bV8lDBZxMX858F2E/m2FEAZfTavXkEehYRKP2obTmxAqrrjnNbmUpQRPwjEwEvpU9vKpQ4WT3qmSg11qWkF4v65L7bsoW5Le6I86pTwETtXxds9RpyMcgAbJLdaCTipScDEDXdUJmJQ+1cAIEsdkEx8bI1c3VUjAsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5UHLrWZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5UHLrWZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D381F000FF;
	Thu, 24 Sep 2026 00:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790208305;
	bh=1z1ukKTagqvhqgiZQU9iquY49RhZyYaB3jMT9tOjWi8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b5UHLrWZVN8R+6BfnKL+/zq5MLUBcv2V38JF88gGtTZJm0uxfubEuxltZu7F2F+Av
	 tWZWVhvEIHIi3kTxmhMbDG+kAqrXSoEM9Jz9G/1V1ETVRhnEE5cH9s859gLv8S5EhS
	 JpZmtVcPbrL9j2G1+qUfz6ROVmFkaMtywwTjlmgb1uyzi1528mdCrmTk3YAfR2RkmY
	 K4alEcaAGiQRoN/GnQ5wnWX0QF0Z+ax4fzAy3TzqxOFNW2n8UPH9cRyjk8hgf3MPou
	 0WdHNHfHVFy72j57+SXDLjvW9pTZKCp7LlKx5zVTD36Fq26vqcr3hCCq1DAQk8SsYq
	 1cL+rowSBTCng==
Date: Wed, 23 Sep 2026 17:05:04 -0700
From: Kees Cook <kees@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	tab-elections@lists.linux.dev, tech-board-discuss@lists.linux.dev,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	ksummit@lists.linux.dev, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: 2026 LF Technical Advisory Board election - call for candidates
Message-ID: <202609231704.266C331@keescook>
References: <a7f69e8d-1140-44b5-baf8-bacb8c30c01a@kernel.org>
 <CAMuHMdXASe0VkAwaKedwA_4R3y9ob+n61JBVYODOEves62K_Fw@mail.gmail.com>
 <7d0497bd-3946-47e0-aba9-143e16ba2631@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d0497bd-3946-47e0-aba9-143e16ba2631@kernel.org>

On Fri, Sep 18, 2026 at 10:55:02AM +0200, David Hildenbrand (Arm) wrote:
> >> The public minutes from TAB meetings can be found in this repository:
> >>
> >>     https://git.kernel.org/pub/scm/docs/tab/tab.git/
> > 
> > No minutes since last election?
> 
> Ugh, apparently Sasha uploaded the public notes since 2020, and nobody realized
> that this task would have to be taken over once his term ended ...
> 
> Thanks for raising that!
> 
> @Dave: we need someone to upload the public notes. I'm knee deep in preparing
> the eligible voters and don't have any capacity for that right now.

I'll take this; should have it updated shortly...

-- 
Kees Cook
