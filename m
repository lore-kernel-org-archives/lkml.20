Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC663C9EE0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 23:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788997846; cv=none; b=o5yvNCzasOBY2d02qBz2jeElouEZs4Ua7tTsm0/9so4ejnUWc5bYfC4ZjdBToO5Z9hWihE5WYEAYSG1E40ExiBUMc83wDhLxTyug3Ekvw9RDgib6TZrZq9qCH83d5auxq4ZRW2DgGCdvpXDP2xnW2cjmXDcuyh6LArwBSb0wxJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788997846; c=relaxed/simple;
	bh=ogsazr23TnNRPEH4QBannd29S7wFZj3scZUV3BZ64hA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gyW4Yi7qr96h48aEojn7hP5grloRR87On2PUNQVTW5CD/PAvm2aetDNp28t+GFCfuExk+SERQpusvgld0Fx8YAfkKymF+Sb3t2Do21Zb7umpPUbn/NBZ/UHRRucWM2WQQPTNdbDQ/Bn0KDB46lmhTJH3htY9zccpYGefRUuInfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dDvjdVS8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dDvjdVS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788997844; x=1820533844;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ogsazr23TnNRPEH4QBannd29S7wFZj3scZUV3BZ64hA=;
  b=dDvjdVS8YZRVt53zq2Sbnq2WOb3vx1c08QQVzWlByciE8NWFJkUh28h9
   B4rNvZZV/SMqr9fC7HOelDDgpQKfjkBaHjdluUZhppmbUumPOBP+iKprt
   yZnHqs6OH8Ia5X8ClplBn2LSVeqylr7CzczHrrdWn7Wf3Z79fiXi+icDd
   zi9KaXLLlni1BjGMc83EQtOIAG+Upo2dVG5ngJ/B7N5vTX3vOsvWcO3BX
   ZxP9ArmPG/rqEaaVqbQ4Rjb/yIwUoZ9eMNzvua6V/fjt8C7hXHdxjRE0L
   HxpcgWgh7+SU8h5geHkUjrhfXURq+FVVPH1VKbAusy5NYW6J7GHYAyP+x
   g==;
X-CSE-ConnectionGUID: 1wxaNZreRDCNi+SgbEd38A==
X-CSE-MsgGUID: EEtKOjY9Q9i/O/Hvc5G9ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="76996844"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="76996844"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 16:50:44 -0700
X-CSE-ConnectionGUID: eDTC9dMYTiqDAjGEdU2GjQ==
X-CSE-MsgGUID: tHmngvieRkKoYZEJvnhP+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="271442997"
Received: from ssimmeri-mobl2.amr.corp.intel.com (HELO [10.125.111.187]) ([10.125.111.187])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 16:50:43 -0700
Message-ID: <f84b135af4b34c34166c557a9a99cd07e7f167bd.camel@linux.intel.com>
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: Clean up more build
 artifacts in 'clean' target
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Jiri Slaby <jirislaby@kernel.org>, zhangjiao2
	 <zhangjiao2@cmss.chinamobile.com>
Cc: raj.khem@gmail.com, linux-kernel@vger.kernel.org, trivial@kernel.org
Date: Wed, 09 Sep 2026 16:50:43 -0700
In-Reply-To: <bbbf056a-a86e-4ad4-97a4-4a32a36eafa2@kernel.org>
References: <20260901093657.1884-1-zhangjiao2@cmss.chinamobile.com>
	 <bbbf056a-a86e-4ad4-97a4-4a32a36eafa2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-09-08 at 09:39 +0200, Jiri Slaby wrote:
> On 01. 09. 26, 11:36, zhangjiao2 wrote:
> > From: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> >=20
> > The 'clean' target currently leaves behind .* .o.cmd and .* .o.d
> > files,
> > as well as the generated 'include' directory. Extend the target to
> > remove these so 'make clean' fully resets the build tree.
> >=20
> > Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
> > ---
> > =C2=A0 tools/power/x86/intel-speed-select/Makefile | 2 ++
> > =C2=A0 1 file changed, 2 insertions(+)
> >=20
> > diff --git a/tools/power/x86/intel-speed-select/Makefile
> > b/tools/power/x86/intel-speed-select/Makefile
> > index 6b299aae2ded..46874e4cee51 100644
> > --- a/tools/power/x86/intel-speed-select/Makefile
> > +++ b/tools/power/x86/intel-speed-select/Makefile
> > @@ -54,6 +54,8 @@ clean:
> > =C2=A0=C2=A0	rm -f $(ALL_PROGRAMS)
> > =C2=A0=C2=A0	rm -rf $(OUTPUT)include/linux/isst_if.h
> > =C2=A0=C2=A0	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name
> > '\.*.d' -delete
> > +	find $(or $(OUTPUT),.) -name '.*.o.cmd' -delete -o -name
> > '.*.o.d' -delete
>=20
> There are no *.d at this point (removed by the previous find). You
> can=20
> do it on one line (as many of the other tools/):
> find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '.*.o.d' -delete
> -o=20
> -name '.*.o.cmd' -delete
>=20
> > +	find $(or $(OUTPUT),.) -type d -name 'include' -exec rm -
> > rf {} +
>=20
> So you can remove "rm -rf $(OUTPUT)include/linux/isst_if.h" above,
> right?

Hi Zhang,

This makes sense.
Please resubmit.

Thanks,
Srinivas

>=20
> thanks,
