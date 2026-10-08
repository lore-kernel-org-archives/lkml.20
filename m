Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F494A5C2F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468367; cv=none; b=hCmOkn8McWNTSpZ14Ql64HH9HXz1DvVN749NbsR/KIQGEmFL0Z2SHVo0CIsmp5OwBbyJKUm6JMouo7IRKww9WEsSzuuuLeO3Zy+rHWqjRRg4Qj9O42dgA4LzfbKcu6vTPbLfCWZ/ysae3Z7XJfMdsk/v5H83CY9epL/Fgzoiw/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468367; c=relaxed/simple;
	bh=fivp0vMleiH3kJv1sZqVG4CJPX+EoQkiKzZDDZkTN0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxxE/Sp9Y49tASNx2eIgxIvFWn4i8rVlRs38XsLJDgc+jhaLwbyUW6xx/vypazU+6FPbDaSbDc0Nzb6RPLepz9mrB8RbECCnSgY8TFk2Y3ufmdD37hAuQMBHkNH/vzAKjTAB+IcqzXBdhYCjnzkAvEps+3rNLTDSvqztQY6poIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xDJzbhxA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xDJzbhxA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6491F000FF;
	Thu,  8 Oct 2026 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791468366;
	bh=vCDEYEAlrbW1K2dKTMvYnRDIhfBH20hAt6GxYv9HX5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=xDJzbhxAse991XNJlSLd+OiYfu4wiSJvuVmGUKQ3gEyahqZSspGE+EO/YGQNk16zw
	 mngXs8nL9kJJ4kLwiX6YUdY24MQguRjmKvnRa++HRMqm4LQ1KiGU8Y+9DZANkSa676
	 31hyIRzxboZ82g1nlXYmx4n5KNJ1NjgzJrbgwUEM=
Date: Thu, 8 Oct 2026 10:06:03 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, 
	users@kernel.org
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
Message-ID: <20261008-reasonable-fragrant-nuthatch-7b66ae@lemur>
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
 <92d5ec39-6a0e-437e-a03d-b1d2c0ec24cb@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <92d5ec39-6a0e-437e-a03d-b1d2c0ec24cb@suse.com>

On Thu, Oct 08, 2026 at 03:39:53PM +0200, Petr Pavlu wrote:
> Documentation/process/submitting-patches.rst currently says:
> 
> | linux-kernel@vger.kernel.org should be used by default for all patches, but the
> | volume on that list has caused a number of developers to tune it out.  Please
> | do not spam unrelated lists and unrelated people, though.
> 
> If the behavior of scripts/get_maintainer.pl is changed, it would be
> good to update this documentation accordingly, possibly by simply
> reverting commit 77167b966b7e ("docs: submitting-patches: clarify the
> role of LKML").

Yes, I'm happy to include this edit in v2.

-K
