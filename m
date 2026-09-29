Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FF434DCF3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687986; cv=none; b=ljQId6nwMM0p+bouz1jrj4M0syHPlvkEX9tY0O0WIWllgh/aUUABlMa+DG5sNHqNVx4hOE9cMAN4jUu1IdcEECDJiT3yBy2GUAu7xp9zr+SU0D6uhAxuLMje2b2sRPF8zEVNkwKB1jF071l7DErpo8tfQksrZNr0FgE7wrshzSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687986; c=relaxed/simple;
	bh=vn5l0t/OUVHHBdlyLGDO6p0SGNJgrMNIP1/vmZxz4nY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOQrmFbWuNcWHL0HKlIjhj96ZSBxAXXrEodCf+zUjtqQYNJRNJ2xqIGLEoXQ3jsZEtEn+LdE/MHG0d8QACxu8SAbO2aN1TSHO5kvaEzITRXh4WzjT5WL1tpe4hu6qQaCxzpQPJIhsHkMUj5zwSJJNC7EIA5+J1wqViuxbvEY3EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WA23zJEr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WA23zJEr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF381F000FF;
	Tue, 29 Sep 2026 13:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790687985;
	bh=kk70s/N+uM0L6UySCCANmt/AXt6wXop6hML2fV8Jn6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WA23zJErPJHxnXCor97v34qsNsOgL/sATdXkTmNuQZdVC9PYit5HPHkCQn50iRZaA
	 QGtETVnRuqD3TiEKL3ZGKuNc0jOw4AXSia9ZZngJGfivHAo4BEv8OX3PgIzGtweaqg
	 lAESsSpsiuRSqASnnhjD1C9pHyfUr3fpNKRgIozc=
Date: Tue, 29 Sep 2026 15:19:39 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: "Winiarska, Iwona" <iwona.winiarska@intel.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] PECI changes for v7.4-rc1
Message-ID: <2026092907-clique-pod-9eee@gregkh>
References: <14b83bcafac21987132c08a23043254c6c43e3ec.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14b83bcafac21987132c08a23043254c6c43e3ec.camel@intel.com>

On Fri, Sep 25, 2026 at 09:20:59PM +0000, Winiarska, Iwona wrote:
> Hi Greg!
> 
> Please pull PECI update for Linux v7.4.
> 
> Thanks
> -Iwona
> 
> The following changes since commit 93f51579e7df248780214094418f205253383cc5:
> 
>   Linux 7.3-rc4 (2026-09-20 13:48:15 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/iwi/linux.git tags/peci-next-7.4-rc1
> 
> for you to fetch changes up to 425125e6d408b5969afb99c3e95a391f1f1ad81d:
> 
>   peci: npcm: Initialize state before requesting IRQ (2026-09-25 22:20:38 +0200)
> 
> ----------------------------------------------------------------
> Update peci-next for v7.4-rc1
> 
> Small fixes in controller drivers including:
> - fix for uninitialized clk_init_data structure (peci-aspeed),
> - moving lock and completion initializations before registering
>   interrupt handler to avoid using them uninitialized (peci-aspeed,
>   peci-npcm).

This is based against 7.3-rc4, which is ahead of my char-misc-next
branch.  I'll wait until I get it closer before pulling, is that ok?

thanks,

greg k-h
