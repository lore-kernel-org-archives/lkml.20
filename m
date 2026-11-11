Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393987;
	b=r+uDxdOh1xjX6jqOHdBHIyAH5omt3YRVSLhr8SFkOD9u2oMNI2dXEScI+6tdlXul6/B0
	 ssf0o++vH2htWG0PCuGqfZ3FxBZtLC2JocGjQ4KxwMWYYGsBRTXHWtpVxGyy4nXQgsEeQ
	 rvN/jfNJkPob71YEqtwYEPoJsDgCKc3Okqab2jf3iWIJ7wVT4znLg2xSeaH2qmVibQyek
	 iS9N1uRtxZfybtC+J2zSgpN5XbN3g7qto+S4+UI6Uhx2J1NqxskRZkysqqktpezmidJqX
	 16zaI0xvbd1Ny9hZxi8vJ2om4+fYfVjSWT4AXKAfMYf4KOaaMWHfF/hiozJPH/7KGRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393987;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=oa3hkR6ZqR7fTUH+Q11dolHC41KtpjWU3cnhP6a6ivs=;
	b=xQdIA7auFt8V04OKnoBbJ8wiljWm7W9tdEuYlwi0A6DnsYUcidkrOcgnAI3kqxlpYlrn
	 wMNIGkJRpweXa00ix0fbBalYGoqxNETKlIWdCp1pWoHNw37sAXgoCGqbzlRhle0Ev69g6
	 S+x9vrwfAJuifpbXTvtW0u+jx80uOYfokv5AYhozyuHdreWp+Iy63zwNjKals1nn73sj+
	 gImnMPWjjaGGnIhqiIA4MP/ifIwblbAj5zC8U/j8YWVdfrYK1yvdVcF29z/63Nk2/u5gf
	 9GuflLCxehB/rf21IU9BUSlHkA/HP7+lEH+dC5uGvsxHrSHGtvS7a0QnFMNu11Dw/1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VBONUVvO;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD445606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD445606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=VBONUVvO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oa3hkR6ZqR7fTUH+Q11dolHC41KtpjWU3cnhP6a6ivs=; b=VBONUVvOCYYBMOpb51exE7lSHt
	8/b7coWJEqdmrSfrs/1Zwc+aPhpIXe9Mg52gSkkrg3SbH3rUY9EFBMtd3HFPguJqVXGUyq91t7X+F
	mNJ1Hc+F69dWLtrXMAJYe4rcJxXX/nWeGH8nb7SaR9sRTsVzHzUZmwHJuq/Dz1cv4tyysoBaXK2P7
	gQTeFCz2jPVei68mJV7SXx307h9aeLqEirop6EgmkJejhV/R5IKy2nduM0CrH774N7OUjmHNsRxrM
	R3b0+3PBmV2AAygHcWysnx1xoUpRqWkKF/CcaMca/pSDev3IyIhj/2yeCqdnbfhUWdgRpF0O0bcXq
	zU3WAtHA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5qN-000000092L1-3z4K;
	Wed, 11 Nov 2026 10:46:19 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7492F300969; Wed, 11 Nov 2026 11:46:18 +0100 (CET)
Date: Wed, 11 Nov 2026 11:46:18 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org, tj@kernel.org, ziqianlu@bytedance.com
Subject: Re: [PATCH v2 02/12] sched/core: Introduce rq_drop_lock()
Message-ID: <20261111104618.GM2668200@noisy.programming.kicks-ass.net>
References: <20261107115913.261163891@infradead.org>
 <20261107120206.858693648@infradead.org>
 <avA36psY6pULqy8X@scheduler.schedules>
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
In-Reply-To: <avA36psY6pULqy8X@scheduler.schedules>

On Sun, Nov 08, 2026 at 12:25:10PM +0300, Kayra Cizmeci wrote:
> Hi Peter,
> 
> On Sat, Nov 07, 2026 at 12:59:15PM +0100, Peter Zijlstra wrote:
> > Currently rq_unpin_lock() serves a dual purpose, it pairs with both
> > rq_pin_lock() and rq_repin_lock(). That is:
> > 
> > 	rq_pin_lock()
> > 	  rq_unpin_lock()
> >           rq_repin_lock()
> > 	rq_unpin_lock()
> > 
> > In prepration of making the temporary drop and the final drop
> 
> nit. 'prepration' should be 'preparation' :-).

I shall forever be making typos :-) fixed.
