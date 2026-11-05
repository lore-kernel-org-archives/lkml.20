Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872038;
	b=awlXrM07itny7Ot1GKKdKZZJhp+IPOUghzb405xCRyrhBzbM2o4aQ26MtsKD4L74Yj7p
	 YoZvkBGUvsuny7orimmo32eZEpXDg0bGXgcwXrRlELEttfbt9YcHzoMWUbcXPI9E2OsBc
	 3fBy/Won2sUzZYfHyPst70a2ddnVDuyKP3vMtvWz0SOxqEcXPapDGuIoex5DPy1BQ8kR0
	 r166nw/7nYnIJ7LG4sWDVIeOLXa0pNRqCFscYiJomn4A/Ekap76ehv62s+D8alcQkxw2c
	 JFo1Af3SeABi4AKimWlfc9JdMWHjKQvgQ+ZSOHzoFhHaoQBLNBtZhB6YM9YH565rITg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872038;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=I06U/vTmV7cvIbW9bXxIp4l9EvkSr5/YrkZmGPUCvs4=;
	b=xsPUfJx3jG0yJx7JPsW5hepf8593DV0+8sPqy91Nx5zdWPj8ZdcobBfCEQVQmX9o8brZ
	 0AMQaFFIr1FNFNYlM8+4gJPt5Kf1HsVdnIPsKUwzyw30weKPEkJQisGWdYepaQ8AhBt+j
	 siqmuUV7NBrFEMsCiKDHqJ/SxykjbKq9NUfmIkNYQ/AMdDAe5xvYczZiSeOVB3kJxtK9y
	 UGGjIGk4kJuE2Ehg3FI7R3KaWm/7I+XEI/TwSZvDtQNzbatV4f4Jr9EohRHzbjG9QVMIL
	 e/yzMzB1jbzXxvTgD0REP42P6iXFzxJvjHLU+dr5G5MgVIF74irKlhKylX+XUlFDDzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EGq+Q5uA;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3796B606A326;
	Thu,  5 Nov 2026 09:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3796B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EGq+Q5uA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793872038; x=1825408038;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fNmdrc47ahqOWCz0AAPhS+yy1BE4Zz9/3E3/cac5jG0=;
  b=EGq+Q5uAkY5YyRuAbXm+Lajm7WKSziA+INV/KqwuBDYeERHTlTOhphv9
   oJWmV4d/rDusUgCNsipl3WLqkpdN/i/2eaokuKDea4azTqcz6XMd0OGWE
   k4gcOU+amK6By66uvf/EtZeCogqBla9j3XCQf1zp1Ubv6HYlSYXJI6BAi
   KUNXIQW3Pfp++acVCjeplhcrZ4UxcBMTXG40lSf9n3u8B02heQWyrWr24
   Z5LD7Vm5ypVrfGdqkfbZqkoQf4JyD6e2k5H4d/Szwd92zRdg2b7REhu9b
   Un72d3gFWtCRE7kHZvqYrm6JtsVZwhTpCehIW9+0LlTM2ttCLs3/F5/LU
   Q==;
X-CSE-ConnectionGUID: NuFBkg+KRX6F8KlEsq0lJA==
X-CSE-MsgGUID: B3UJtJInQt2EFWzDEse/Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2668738"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2668738"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:47:17 -0800
X-CSE-ConnectionGUID: 4mZMQvOmTgeFwRMN9apEdg==
X-CSE-MsgGUID: 10CHHb9MRd69e3w/1pahKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6861088"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:47:15 -0800
Date: Thu, 5 Nov 2026 11:47:13 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Konstantin Ryabitsev <mricon@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auxQoRrjGT-kSXav@ashevche-desk.local>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <CAMuHMdWA1LNNaih3DHUM7yxpoyrnUndWDKpOjqb6_hSWWs7KHw@mail.gmail.com>
 <auxQD7SNOOL3uZ49@shikoro>
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
In-Reply-To: <auxQD7SNOOL3uZ49@shikoro>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Nov 05, 2026 at 11:44:47AM +0200, Wolfram Sang wrote:
> 
> > > > Reviewed-by even with the "# subpart" still appears in person's credits
> > > > and reviewing entire patch of 700 lines of diff code (like Frank's SPI
> > > > patch) is not the same as 10 diff codes for one driver.
> > >
> > > Yes, if you want to spoil that, you'd need to introduce
> > >
> > >         Partly-reviewed-by: ...
> > >
> > > or something.
> > 
> > With a parameter taking a percentage or number of files or lines,
> > to serve as input for the Big Statistics Calculation?
> 
> I assume Krzysztof addresses people playing number games. While I do
> understand this motivation to raise the bar, I also know people will
> find ways to jump over the higher bar etc...
> 
> Quoting Joshua/WOPR: "A STRANGE GAME. THE ONLY WINNING MOVE IS NOT TO
> PLAY"
> 
> Maybe we should stop publishing development statistics? ;)
> 
> Seriously, the main thing I am aiming at is to improve code maintenance.
> And so, the "# subparts" are much more interesting to me.

Yep, we need tools to support that!

-- 
With Best Regards,
Andy Shevchenko


