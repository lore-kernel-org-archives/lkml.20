Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418AD3DD50B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468156; cv=none; b=ihcItkc3BirTnXlU8RtYAMrusRPv6s+IT0xAGOpGmI6HEZL/J3Vg6zTPWBSiDnGXCDWSZq8tvyGlA9okeu8WLnJPz1K+ip4buYPUWPBA0FzlEJ31ozYDjmJb6HWse60Z8jqaiJ2aFYNzhUfsR8xhEITfH6NiN9gwumWxKn195Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468156; c=relaxed/simple;
	bh=ZY55PVNY0qOLFiOeHJv2dx/cuamEowWgGTeEjWMXFjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=un0EzgCkVuCjr6XfAx+wHui45kt849vI0abhr0RdPT6nAqAWmZ8mtFq8CrwSkZ/Qdy52yeNd1AeGrffuHvCnFeUakCE+1h2OLA9a6I7qAOKiIBl7cEh9999fBfsLlHZ2NLtTIzZeg2oZtpej4ZmJI4AxTGb1mhjh74TJGlZ7auc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sF8JZkZk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sF8JZkZk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7B01F000FF;
	Thu,  8 Oct 2026 14:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791468155;
	bh=6FOVnOAG8F3Is7PX6z8wmOhNapCV6GqQeEMCMGZmbmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=sF8JZkZka5TJoshODAQQEHwFwGAssPWQsh92IArjaDXB4gH/X14VgRHWvXUoc23ak
	 Vpu0LbC/Xm9nY23T+XOYIdMi8Spn1epnArNI9tDJ/MtVIXcfsHsZR5UsAy7QecbdNn
	 3lHJGtkEJgjUcK0f8pE+FTbhSnYDo4dVq/GaUxAI=
Date: Thu, 8 Oct 2026 10:02:30 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, 
	users@kernel.org
Subject: Re: [PATCH] get_maintainer: only use THE REST as a fallback
Message-ID: <20261008-imperial-sassy-pogona-afcede@lemur>
References: <20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org>
 <8e194f64-6add-4fb3-a1bb-9b27719b409e@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e194f64-6add-4fb3-a1bb-9b27719b409e@suse.com>

On Thu, Oct 08, 2026 at 03:15:03PM +0200, Jürgen Groß wrote:
> Hmm, for me this will be a major problem.
> 
> As the Xen code maintainer I have stumbled over problematic patches which
> were NOT sent to x86 or xen ML several times, which made it possible to catch
> potential regressions early.
> 
> Having to subscribe to each potentially interesting ML (or using korgalore on
> those) would not be my preferred workflow.
> 
> This isn't a NACK, but maybe there are others with similar interests/problems.
> 
> Or is korgalore capable of pulling ALL kernel related mails without having to
> spell out the MLs explicitly?

Yes, if we do add patches@lists.linux.dev as the always-on archive list, you'd
be able to run lei/korgalore to get the exact current LKML firehose by doing
something like "l:linux-kernel.vger.kernel.org OR l:patches.lists.linux.dev"
and then deduping by MID.

-K
