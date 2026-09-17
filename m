Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FF14E5327
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789666686; cv=none; b=a/d+O/Uc4jrNdktEi3lHSF7R7+zdJqiU0pqgTAPzqTt+/43K9boVHv+Vbl4JfS1pMOTM2L/71k7cO+YiF9c/R5FE3Iyg0dUbRS1hYpYpvndG7V+UNsaG9Sa9NIUZ0QCQYsGG9Q/8TStF09TJQClmOrhyXCp7xUkOE9NbscnFQIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789666686; c=relaxed/simple;
	bh=4/t4vSzdA0JJu+R9FKlITYE6OuPbv9w5TrNdLzZ+Wew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEjRR6TkB0p9C5ML5UxDFVx/NW2RzEindjSwkPdjF03L1Bdg6hv0AYLEMXEdS7VWKuKfzksvxj3Sb4g9GQf0jidRl8ZadrM5V/P6RZI38t6M96Ud5g5oFRdFFf1rcC/bjCxVM0YfN7vOff4m57qzwiE8DndiVpy+drbvUllrvsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=P95yYFXG; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="P95yYFXG"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 3987340E01ED;
	Thu, 17 Sep 2026 17:38:01 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MCM_K-lt8-Fk; Thu, 17 Sep 2026 17:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1789666670; bh=6j8VhSA2LusPIHhsgzCugnqizDJG4DbIYdwjnUCEymA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P95yYFXGgdUvthkwHqMn+UshfYEGpKkMH7oUkyxzcbo7HjDJoZeB/yP/UXuWjkKmK
	 sKdjNin536EjwhsDwkr2TIOOp9leQAPRIAWj+i8C+QlQZlznX3psP+QC7jylof9M9x
	 eZacs6WNAjmIDwZ+e4jVH8j1MlZUyH+PJs0wMOSCa8TpKW/IxDnssl2zUolS6NeOiH
	 queuqcJuQK4pRtU9JQKFfzF+kcEfZ+EFkn3MWnzq8WjHHX5hffVcZ+BFZ4gXpNP1Sl
	 iQcBXgYo50tV8s+tk5ptJ88xKjnQIfAc1LZ9FGB7Wq1idI4sXMHxc8nkbO81NJqOUi
	 I1EewmBqdO93ekblVx7WASKar2le7NLHXmcLvoen5dvlRCCqlCQKZnpNBHL1Mb+7Kz
	 eW6uwysDM/8cQQn2ZBDQnHdbDSNuIGOZaS4FAW83E/wpGlm7Y2Wg/3IHl+3K4xsI8e
	 TXrTkuTQgVX7+CZ2zdtyh5dtP84d9Q0I5wgdrBEyvvOKjbmw2LSnMg6lQ1bWxTmjTO
	 cBD0ViykHzDyfoTnesb6rN4nN7cWKL6Nn+DPwQJ0Cb+t9riq3q/kPLau+TDdpbuSet
	 4iXcZiXMKm0rpXcxle3SJz5aAMgqKbdhf7wb9dAzrQIRLvW5wh5NnEc+UqRTFJsXKO
	 /NfsWHj+OncL4dVGx9OD9HQI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9B28540E015B;
	Thu, 17 Sep 2026 17:37:41 +0000 (UTC)
Date: Thu, 17 Sep 2026 10:37:38 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Dmitry Antipov <dmantipov@yandex.ru>, x86@kernel.org,
	Tony Luck <tony.luck@intel.com>, Dave Martin <Dave.Martin@arm.com>,
	James Morse <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] fs/resctrl: Avoid extra call to strlen() in
 schemata_list_add()
Message-ID: <20260917173738.GAaqwlYumP8e88qgv5@fat_crate.local>
References: <20260821081128.19242-1-dmantipov@yandex.ru>
 <f7a73d18-25a4-4711-9d18-8b87eb9af7d3@intel.com>
 <20260917155443.GAaqwNQxslErNUtUNk@fat_crate.local>
 <9b2f721b-4611-42e1-b903-aa0dd37edd48@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b2f721b-4611-42e1-b903-aa0dd37edd48@intel.com>

On Thu, Sep 17, 2026 at 09:17:23AM -0700, Reinette Chatre wrote:
> Hi Boris,
> 
> On 9/17/26 8:54 AM, Borislav Petkov wrote:
> > On Thu, Sep 03, 2026 at 08:42:47AM -0700, Reinette Chatre wrote:
> >> Dear x86 maintainers,
> >>
> >> Could you please consider both cleanups in this series for inclusion?
> > 
> > I see Sashiko is complaining about two pre-existing issues:
> > 
> > https://sashiko.dev/#/patchset/20260821081128.19242-1-dmantipov%40yandex.ru
> > 
> 
> These same pseudo-locking related issues were reported by Sashiko during a previous
> resctrl submission:
> 
> 	https://sashiko.dev/#/patchset/20260515193944.15114-1-tony.luck%40intel.com
> 
> There was an effort to address these issues, latest attempt can be seen at: 
> 
> 	https://lore.kernel.org/lkml/cover.1779476724.git.reinette.chatre@intel.com/
> 
> These attempts at fixes just exposed more corner cases related to pseudo-locking, for example:
> 
> 	https://lore.kernel.org/all/e40a924f-5398-43bd-821a-2ff9873c5a4c@intel.com/
> 
> All of these issues are related to intricate races that could be triggered by user space stress
> of the pseudo-locking files that is only possible on very specific ten-year old hardware.
> Since such usage is contrary to the pseudo-locking usage model which requires care by default
> I decided to drop that work.

Thanks, we probably should start tracking all those Sashiko complaints which
we're not going to address.

/me notes these links.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
