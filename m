Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B69D4CB8D7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555397; cv=none; b=dOKsP34hZFJJCWLyXVsg7QtPN973r79NpwlgeAHEZB5PIUc11U4U/ashOxxFtbqaJmOwNG3XJaYECor4F0b+JV663YrRu8bOFIJyjW9XBAwljZewRTyxkMYuRDaSY5fpqJ1O1RfekNSbLW4x27QvnbRwmRQaT02J+7p1LFusFLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555397; c=relaxed/simple;
	bh=Kq6hnJS1LPeRAuBNKz6yxBErH2+9XipDjrF6CPyZTBQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EQgXLv2rgwYyQ0z735nfQ0aQ2kMn5Lci+kQ1tvi70J6DC/CAiFWD0P/z50Mn3zP/Cs5EBccv1txdy9fNiHDugZhqFjiEHzYv9KZ/O0ZBmoPqmldJwadJ7dtgHjSGn74VRk5a4HiZ4oL6MZzWhyr6DJ24g43ypCJvl26qGx+xP4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a22qWG6x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a22qWG6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789555374; x=1821091374;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Kq6hnJS1LPeRAuBNKz6yxBErH2+9XipDjrF6CPyZTBQ=;
  b=a22qWG6x+g63k7XKwtJAqU9tlsBgpc6uf6fDX5PUyKJrdIvhrxWVTMlC
   TJx3QjV7/GU60zSh5rShTgMa+mLPS7b8mi5qyNltv4yVDm+k/nNnr2PZa
   x8DyDIlR0U/TsXLddj5ZIR5pNH4xZLJjiGT/nSDhta5VM9KjeNrUxRZp6
   pIInhLIwPGSdWyKtn9UffLmAtCPloSj09ud2gYkF2+KNH3aziBMFiZXf7
   ijQNsIy7DjUVhrmSoU7YMKbir3J3SFgyYXFoi4qy7XRfc9w7sfmu08Mpi
   RQjqziRIka5YU354oyD56ILCZ/b9j4mXB4dJSs/s45hk/9InRwplir5iq
   w==;
X-CSE-ConnectionGUID: sQkvhamjQcqLXnhU4YhtxA==
X-CSE-MsgGUID: fVFnj1g1ST+m5lpuPViv/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100253321"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100253321"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:42:50 -0700
X-CSE-ConnectionGUID: gRbfWwABTseGunggg6ZmjA==
X-CSE-MsgGUID: p8wrbXx9RriZih2aWnZV2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272826997"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO [10.245.244.154]) ([10.245.244.154])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 03:42:47 -0700
Message-ID: <df14f0da3538cbac98384bdf538de137ea2a3278.camel@linux.intel.com>
Subject: Re: [PATCH] MAINTAINERS: change TTM maintainers to Natalie and Arun
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Natalie Vock <nat@pixelcluster.dev>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <ckoenig.leichtzumerken@gmail.com>, christian.koenig@amd.com,
 ray.huang@amd.com, 	arunpravin.paneerselvam@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 16 Sep 2026 12:42:45 +0200
In-Reply-To: <5e301f2e-730c-479a-890d-7ed6044b8a1c@pixelcluster.dev>
References: <20260915154804.605772-1-christian.koenig@amd.com>
	 <a3c94fcf0029e7f257a0219532d906643846ffd1.camel@linux.intel.com>
	 <5e301f2e-730c-479a-890d-7ed6044b8a1c@pixelcluster.dev>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-09-16 at 12:35 +0200, Natalie Vock wrote:
> Hi,
>=20
> On 9/16/26 11:44, Thomas Hellstr=C3=B6m wrote:
> > On Tue, 2026-09-15 at 17:48 +0200, Christian K=C3=B6nig wrote:
> > > The blunt reality is that I don't have time to look into patches
> > > or
> > > bugs
> > > any more as it would be necessary. The same counts for Ray.
> > >=20
> > > Natalie has been working on the dmem cgroup patches for TTM and
> > > agreed
> > > to take over looking more into TTM.
> > >=20
> > > Arun is working in my team and already maintaining AMDs VRAM
> > > backend
> > > for
> > > TTM and the underlying buddy allocator.
> > >=20
> > > Add Thomas as reviewer as well, better to have more eyes on that
> > > component.
> > >=20
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > ---
> > > =C2=A0=C2=A0MAINTAINERS | 5 +++--
> > > =C2=A0=C2=A01 file changed, 3 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 5b5a4e4b35cf..b6e58a138501 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -9140,10 +9140,11 @@
> > > F:	drivers/gpu/drm/drm_privacy_screen*
> > > =C2=A0=C2=A0F:	include/drm/drm_privacy_screen*
> > > =C2=A0=20
> > > =C2=A0=C2=A0DRM TTM SUBSYSTEM
> > > -M:	Christian Koenig <christian.koenig@amd.com>
> > > -M:	Huang Rui <ray.huang@amd.com>
> > > +M:	Natalie Vock <nat@pixelcluster.dev>
> > > +M:	Arun Pravin <arunpravin.paneerselvam@amd.com>
> > > =C2=A0=C2=A0R:	Matthew Auld <matthew.auld@intel.com>
> > > =C2=A0=C2=A0R:	Matthew Brost <matthew.brost@intel.com>
> > > +R:	Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > > =C2=A0=C2=A0L:	dri-devel@lists.freedesktop.org
> > > =C2=A0=C2=A0S:	Maintained
> > > =C2=A0=C2=A0T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> >=20
> > Acked-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >=20
> > @Natalie, @Arun Do you have a presence on dri-devel IRC? If so,
> > Nicks?
>=20
> Yes, I have the nick "pixelcluster".
>=20
> >=20
> > Also what is your stance on merging pages to TTM?
> > 1) Requiring an explicit maintainer ack, or
> > 2) an R-B from one of the reviewers/maintainers and no concerns
> > raised
> > within reasonable time?
>=20
> I think my preference would more or less be 2). That is, if for some
> reason no maintainer answers, after some time the patches should be
> ok
> to merge (but if a maintainer does explicitly ack/R-b the patch it
> can
> be merged sooner). I'll try my best to not leave patches unanswered
> so
> hopefully 2) stays a rarity :)
>=20
> > 3) drm-misc as default merge repo?
>=20
> Sure, why not? Basically like it's been so far as well, right? It
> didn't
> seem to me like the patch volume for TTM is particularly large at
> least
> so far, so something like a separate branch might not be worth the
> hassle.

Great. Thanks. Reason for the last question was more that if we want to
merge TTM patches outside of the default branch if they are required
for a driver feature, and then we always ask for ack to merge on a
different branch / repo. If we have an agreed default we typically
don't ask for a separate merge ack on that one.

/Thomas

>=20
> Best,
> Natalie
