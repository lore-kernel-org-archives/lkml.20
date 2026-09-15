Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FF62E737D;
	Tue, 15 Sep 2026 00:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789433638; cv=none; b=bsxg1ITI2mkleiB2Vp2/Hn6HwSnUwmURwGbisZXSjSzkv7LSWcIkjaEnmMktMeCx0YWIpCsn/GIya/+QN0e1rohQLaUKY3lAh7bDP/HypBujovtOH1+NVzjLfsfiFASnQuFHzd+faqusYwRxT+BBSNzUNIyVncGWLGQ28hqSaj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789433638; c=relaxed/simple;
	bh=v4BI8DORGEp/jVkOSrBj50ZHN0zxLx6Opdhe3f6/eSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thGUw/9mikTTvv1KV3GewBIVNSJzpetvAM7VZhqLY3nO8ASIuqeH+Z07W5esCeD/qRClHR3vmoRop+z0xVxZNcyl5sb9RlZ5jTmtzEDfNvHSnJgdf+/rftpTVRH1CgrV+5HOFsOL/VKmP3NLT5DMbYPry0eNKSZK1bs1F38biIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=f1YAT6NF; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="f1YAT6NF"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DA85340E0173;
	Tue, 15 Sep 2026 00:53:54 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id bQe7kUB22Y6H; Tue, 15 Sep 2026 00:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789433625; bh=H7l445s6yGzd2zv0X1Uvu3H21iJtrDpjsPFtU6vgDEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f1YAT6NFJlXrEp48gAJcR51XC6qiVC2a0VKHbXFhWP3ZawnBbaPZtJshXuzhi8v6s
	 IffqVOEb8OYuXkXFX5CcQHpUjlBlqYjMgWtuIHXoI3+31Ehq9Bg/XDhrP5dqtRHE97
	 NvfkKq5YPY9+HqO5qCHG7mbGpcnaXjb4LpFsn6vouS+CFUFRnSBl2XaDMDQa4YG3W2
	 95V7ZEo6HcwwnfWYvYSjUa5aEOU8hQAAc1Rryq8Grmn050/OqutmZgBSZEQIuUZ5ag
	 v0sDVzWEgTIwttkKElmkccjcWcledWINp5rZpdT4mpZFqykvwbwB4dmtoK0KIyyjpR
	 XSbQDDwKgwijC/3+BTo50OtPBMDG1XO6/AGVmsxZ5a2d/uVAIrq1g0krKd6/S55Rdh
	 XOKkbMYCbI8iSFoUULqzWEOuFWA00wfeDpU5GxGzGFeJyLAZub0d2Rrd/DYWcCkoWw
	 oDOjqyFaeE86iBzyimk8NiAytZg2eHAgfE6LDemBngw6L9+b/XUhldGB5rVAvY4jqP
	 e/q7fCArkSqldpVlioNuY/lwtuxK2SQ4UsT/z/36SVGgcgGiiEXJtbkce+9zv0iIsB
	 iG31OFpiCfYyXO9wCwxLl0liULWj2PLTPoc5h/pTQSTCBLXQKAGA6YSM5ZJctyJ6xx
	 oFQXOuNT05dqulEMYo0Qb5pQ=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 5DD8E40E015D;
	Tue, 15 Sep 2026 00:53:38 +0000 (UTC)
Date: Mon, 14 Sep 2026 17:53:34 -0700
From: Borislav Petkov <bp@alien8.de>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: Myeonghun Pak <mhun512@gmail.com>, Jason Baron <jbaron@akamai.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] EDAC/ie31200: Disable PCI device when probing fails
Message-ID: <20260915005334.GEaqiXDqDGVsYE_NXp@fat_crate.local>
References: <20260913212500.60272-1-mhun512@gmail.com>
 <SJ1PR11MB6083885F54ECDC88B894EEDAFCBB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083885F54ECDC88B894EEDAFCBB2@SJ1PR11MB6083.namprd11.prod.outlook.com>

On Mon, Sep 14, 2026 at 04:51:07PM +0000, Luck, Tony wrote:
> > Assisted-by: OpenAI:GPT-5.6
> 
> I added "LLM" to this tag based on current guidance in Documentation/process/coding-assistants.rst

Nah, it needs to be only LLM:

"Assisted-by: LLM"

because

commit 816d9992d9ed434ec52cfbd63080d518e535a41b
Author: Christian Brauner <brauner@kernel.org>
Date:   Wed Jul 1 17:54:48 2026 +0200

    coding-assistants: simplify attribution
    
    The requirement to identify specific models used in the Assisted-by tag
    provides free advertising to proprietary software companies while adding
    little or no useful information.  Change the requirement to simply:
    
      Assisted-by: LLM
    
    to capture the fact that an LLM was used without tracking which one.

Lemme fix it up.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
