Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794573367;
	b=XYGZEzuPh0pZOSZRs6/VHs9pxnNFTv1D2PjROCPOYpYo8eV+Jgg1HVge3928p2yJzdij
	 62DsJYMAaXaPMNXppOXge38fT9+3m/p+iXPSoKwBYXAxiHqHWr0nemXYBIQ40JepQliII
	 1MZ+AOSgeX8ZgI4PB65+FhGC3+lfdkBNGvw4AQ6tJNf8/SB6l56YrcQDUuh0pP5y/C4U4
	 x3D+rijQuKNI+QFcK01EIGeq1kRpD0YuBjFiFZOT1mlGoTLZuJIAMNHGeBql52TR7jezL
	 vUvJ299tDzMuBwmXseeHWPyUudxzYb5YkfKt3Vbpw5sSBUWsPHJIlSpYBoBRQfJNzVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794573367;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=vOQcMdcsc8c0N79J/LhUEN6PC9PVqAbZtM3tasQIeQc=;
	b=c31OOMwIgLJWFG+NdSOGRuseJGAlI2swrZNSdBQEZ5nmxZYKiLYJu+3B0htWsM6dm4JG
	 hscLcZJjMhVApx2WohBqy3Jo/EBvboxiqGgC9WfOsbqjkDG2n8sNxcvVpi6JDzvuUfFaf
	 6EW/e5M6ErIa/1EhopJzGHhdaexfCwjzUUgeHERv0XYQWynWFyfGwBMvf85/xiM7uc3ve
	 Ry687o/8YwEcyKJnl2KOx9WtSnzfJJcZuO7k6dyS7m4AQzDDwZr2GL622lQ5Oxo6bZLY1
	 Cso+CgzK8MdrVJ27KaYD93sqdgcExg8vR/wvUdkNMB0SaFV3KgcGSfH22x2vfM5CtlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b="ncGc/66E";
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2B2606A327;
	Fri, 13 Nov 2026 12:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD2B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=ncGc/66E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vOQcMdcsc8c0N79J/LhUEN6PC9PVqAbZtM3tasQIeQc=; b=ncGc/66Ef70qRFBYxb7iC/8r9n
	1O+LLg7lyd+W/t4EBm/IG5yUuerYgPy8PaMXwmZaqZOAZSSzzazU23jGMbMxQPNaZ18W9itCVERq5
	p6ySMnnvw2Mgz0vb5muvXvRadbp/UtyT9M43/sxcWfZr6vSKr7HAOB2Yhdx9fb1zQUrZBp7O9kY32
	xw8XHxPJx833Z8v0yjdEsWxWRjmHA/MWrB0f3zCNMkcme2aQkhcFUiTpFOcyTwU0+g6R2YKGjHuLH
	1uvKzKTdy6Yrls5E3a6v3sDeo1+vxEA3M6KTmpDS0lIsjsVC/mVQdh1UrKmV7VbGKNuDD4khjXE/V
	Lwps/bAA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRqVT-00EknN-2t;
	Fri, 13 Nov 2026 12:35:52 +0000
Date: Fri, 13 Nov 2026 04:35:47 -0800
From: Breno Leitao <leitao@debian.org>
To: riel@surriel.com, bp@alien8.de
Cc: Tony Luck <tony.luck@intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH RESEND v2] x86/mce: Rate-limit the CMCI storm transition
 notices
Message-ID: <avcD0tq_Q-vlT-ya@gmail.com>
References: <20261112-mci_ratelimit-v2-1-a9e67055526b@debian.org>
 <20261112182125.GDavYDpdJpmpU2Piyu@fat_crate.local>
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
In-Reply-To: <20261112182125.GDavYDpdJpmpU2Piyu@fat_crate.local>
X-Debian-User: leitao

On Thu, Nov 12, 2026 at 10:21:25AM -0800, Borislav Petkov wrote:
> On Thu, Nov 12, 2026 at 01:56:39AM -0800, Breno Leitao wrote:
> >  void mce_track_storm(struct mce *mce)
> >  {
> >  	struct mca_storm_desc *storm = this_cpu_ptr(&storm_desc);
> > @@ -150,13 +158,17 @@ void mce_track_storm(struct mce *mce)
> >  	if (storm->banks[mce->bank].in_storm_mode) {
> >  		if (history & GENMASK_ULL(STORM_END_POLL_THRESHOLD, 0))
> >  			return;
> > -		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n", smp_processor_id(), mce->bank);
> > +		if (__ratelimit(&storm_rs))
> > +			printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm subsided\n",
> > +					smp_processor_id(), mce->bank);
> >  		mce_handle_storm(mce->bank, false);
> >  		cmci_storm_end(mce->bank);
> >  	} else {
> >  		if (hweight64(history) < STORM_BEGIN_THRESHOLD)
> >  			return;
> > -		printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n", smp_processor_id(), mce->bank);
> > +		if (__ratelimit(&storm_rs))
> > +			printk_deferred(KERN_NOTICE "CPU%d BANK%d CMCI storm detected\n",
> > +					smp_processor_id(), mce->bank);
> >  		mce_handle_storm(mce->bank, true);
> >  		cmci_storm_begin(mce->bank);
> >  	}
> 
> Should we merge all the MCE ratelimiting into a single effort?
> 
> https://lore.kernel.org/r/20261108143751.3af49e48@fangorn

Sounds good. I will send v3 as one series: Rik's patch first, since it
is a stable fix and can go in on its own, and the storm notice ratelimit
on top of it.
