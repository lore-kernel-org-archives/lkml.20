Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A04233937F
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 17:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789925713; cv=none; b=sV2vBwe4Pas4vDQz20mNEcvxLRizJpIY7RY6w6tLmT3Kk4wKH1/oI9W7pPd8arlEnGEDb2Wz8lf4SurBkLt5coBvg+LB7eZtiVOSESlXoe8Y8od0BWZwFesn3xWZD3B8GiKbofGRexjkZIqtTEJxakJi5+W07e8BZ/Z04Oub1+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789925713; c=relaxed/simple;
	bh=24EbtVMuLmkk30vPdxrZdYyqcSDV6OkqMEyet0mL0Dw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l7+5cJJCBy/AjhV6Ue2oYfliTeEzSEegeEuaXOdrJE7AU4fyUGdkLoF2cWh4c3Hi7XRWlLl0d6CKGHD2/W3eSzglGU3Q2xCA6CNkrA+JLkd2Uun6ppTGc5Yrjc80ECsCl8O/jwqKGAze5O2pTvAgNuIHiVjrgcAtPe+rn2yZdi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id BD5587189D4C; Sun, 20 Sep 2026 19:35:09 +0200 (CEST)
Date: Sun, 20 Sep 2026 19:35:09 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Link Mauve <linkmauve@linkmauve.fr>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	techflashYT <officialTechflashYT@gmail.com>,
	Ash Logan <ash@heyquark.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] powerpc/sstep: Fix compilation on 32-bit PowerPC
Message-ID: <arAZTed4p3FYnUgU@desktop>
References: <20260730065007.964703-1-linkmauve@linkmauve.fr>
 <3c39b0e5-8265-4d39-ab39-196ccf560a05@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3c39b0e5-8265-4d39-ab39-196ccf560a05@kernel.org>
Jabber-ID: linkmauve@linkmauve.fr

Hi,

On Thu, Jul 30, 2026 at 09:01:10AM +0200, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 30/07/2026 à 08:50, Link Mauve a écrit :
> > Two local variables were only set but never read on 32-bit PowerPC,
> > which causes an error during compilation with W=1.
> > 
> > This series first makes the 64-bit guards consistent by converting all
> > uses of __powerpc64__ to use CONFIG_PPC64 instead, and then guard the
> > two variables rc and suffix behind CONFIG_PPC64 checks.
> > 
> 
> For the two patches,
> 
> Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

None of these two patches have made it to any kernel, do I need to ping
someone?  I was originally expecting it to reach 7.3, now I guess 7.4
will do.

> 
> > Link Mauve (2):
> >    powerpc/sstep: Consistently use one define to check arch bit width
> >    powerpc/sstep: Don’t define variables we won’t be using
> > 
> >   arch/powerpc/lib/sstep.c | 111 ++++++++++++++++++++-------------------
> >   1 file changed, 58 insertions(+), 53 deletions(-)
> > 
> > Changes since v1:
> > - Link to v1:
> >    https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flinuxppc-dev%2Famrpdv0g__ELifId%40desktop%2FT%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C69210bfbc364426c4ce108deee06d0f2%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639209910199709261%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2B%2BdoT%2FTkFxUUy63ED%2B5Kb5dfCSI8hQpjWGfpndI%2Fn0c%3D&reserved=0
> > - Switch from __powerpc64__ to CONFIG_PPC64, as it is the preferred
> >    check.
> > - Document that the build error was only occurring with W=1.
> > - Declare both variables on the same line.
> > 
> > base-commit: 78bc8af4affb9a732504eb22eeac7d1e50883853
> 

Thanks,

-- 
Link Mauve
