Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793366398;
	b=n2qm/yvidOfYK3LTPWVl9aSDwClLony2DE89aSlYxZmIdiNJaatJOU8Nzw7waK3737Pd
	 LxpMpVbvZ+zE8Jb+lqxxlukzWBNUqizoEDFBVJ6glSOWBN3twxqUE2xQ6xPdx++5dEDY0
	 IhGqs4q7iMsVGA3q/JH6mY+UwY51iV0DYPqi7zvq/rig5fkFUJq6XBpPplIekoK64Cmdd
	 Wh9yvL4VNMqvvdcBwK1FDsFYXN/slT359boWaqt6Kc478SErxh0s6yhXftXXtNrmavmeL
	 6/pooXqJqSgPgHxRyutazr5GNLGkXY44/ixnajo82YbGYaCnQfc5TUO+q9O09Q477nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793366398;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=sUqw+TWjmWhRPtIKKRbk18IAcVACTFLave5YdSQBEyg=;
	b=f7ro6VY94Do9u0A9vMR2O00tFlpYpwktmnjG951nR6sgvAHWDhYJd2Hu3zNOi/oY6w+F
	 XdqOfUXNSexgiOEZHl1rb5BRBIxQ+l50INXI7tn5ioSsv5lIofko6UE35Xu/plIUxA81r
	 RNFdNOPveKIyENOm6wAnnEngjrRLIGcoMwSLYLNlqiKCSntfWCNJ5zYM5LzP/iQgmmSH4
	 8gbu2GQJKNozY4TUPmrtmd0ktQytplEoTlP0xa3Ts2Uq5cWpK66tlIxUGh7j19G00lZ1N
	 wSzOLadjQYk0DrXzhX+b/ia1fLpcEsg7xpC0QeJ3jVe4FXJlOSHz1D9Rk+He3zo5VEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=lWGKAbLa;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6A4606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC6A4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=lWGKAbLa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sUqw+TWjmWhRPtIKKRbk18IAcVACTFLave5YdSQBEyg=; b=lWGKAbLap1CGKRIqfgOK3dFFoF
	YWcTCvew07cEGWgXDS5zAUcmBCMLOsFD0LlVbINnJN03bofOPMDXlpvOZ1NqGZSSuy1Q0HiYJgDX3
	O3gYXdJidh7EJfL/KbfBVeuHWoj51BYMCKHR65y2n0jXM9m+VFegby2QhthAlj8Fjy5JO0lV/ZWVD
	73z/eTNvi/oslKGM1OC2m924vOgKKGHPIEk1bdLE9uYffn2ViodZfxC05aJ1W6X3e7rHQ8Bou7FYj
	Sot19Ekz7LBxNBr0ggDn38eUjwriSRCpUG+YHRwUz+VorUj5WMDT7U3l2RkV1wg+4pc+6CO0KE/9q
	ns0DK4gw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xMmWP-003qcJ-1t;
	Fri, 30 Oct 2026 13:19:53 +0000
Date: Fri, 30 Oct 2026 06:19:49 -0700
From: Breno Leitao <leitao@debian.org>
To: Corey Minyard <corey@minyard.net>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com, Dan Melnic <dmm@meta.com>
Subject: Re: [PATCH] ipmi:kcs: Rate limit the invalid state warning
Message-ID: <auSYkgAaz_jPC44A@gmail.com>
References: <20261030-ipmi-v1-1-f84d5fa1fa6c@debian.org>
 <auSU1tHoDTrIkHoR@mail.minyard.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auSU1tHoDTrIkHoR@mail.minyard.net>
X-Debian-User: leitao

On Fri, Oct 30, 2026 at 08:00:06AM -0500, Corey Minyard wrote:
> On Fri, Oct 30, 2026 at 03:29:45AM -0700, Breno Leitao wrote:
> > start_kcs_transaction() warns each time it is asked to start a
> > transaction while the KCS state machine is busy. The warning is not
> > rate limited, so if the SI layer believes the interface is idle while
> > the state machine is still running, every message sent to the BMC logs
> > another line.
> > 
> > Kernels carrying commit c608966f3f9c ("ipmi: fix msg stack when IPMI is
> > disconnected") hit this. When the interface is declared hosed, the
> > state machine is reset to KCS_ERROR0 rather than KCS_IDLE, and keeps
> > walking the error states while the SI layer, which treats it as idle,
> > tries to start new messages.
> > 
> > One host logged 29K of these lines in four days, several per second:
> > 
> >   [Thu Oct 29 14:55:54 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 9
> >   [Thu Oct 29 14:55:55 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 7
> >   [Thu Oct 29 14:55:55 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 8
> >   [Thu Oct 29 14:55:55 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 9
> >   [Thu Oct 29 14:55:55 2026] ipmi_si dmi-ipmi-si.0: KCS in invalid state 7
> 
> The rate limiting is a good idea.  I've included the patch.
> 
> However, it also sounds like you don't have working IPMI hardware on
> these systems.  The change you mention just exacerbates the problem
> here, but I think it would be a good idea to track down why this is
> happening.
> 
> If you really have working IPMI hardware, then it would be a good
> idea to trace down why this is happening.

Right. This is the Meta fleet, where we see a bunch of IPMI problems,
given the absurd number of hosts.

My main interest here is keeping these errors from flooding our
monitoring systems, but I am fairly sure other folks are looking into
the IPMI issues themselves.

> What specific kernel version are you running?

It happened on a mix of kernels (6.13, 6.16 and possibly 7.1).

> BTW, I need a link to the discussion about this so I can add a Closes:
> tag to the git change.

Sorry, I don't have a public link to Dan's report.

Thanks for the review and picking the patch.
--breno
