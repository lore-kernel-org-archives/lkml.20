Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020474;
	b=h7/LAUGRF8V5106WgRiRe50czzm7PP5h/ltd5KOw6YmiZmxBNDghVk3rfC7V9YbO9qFw
	 gNjhbI1TGdIitWJ6+9yzvOlTiXIhtBoTrgkRVNxi0M9xkbsH/o+ypS9aiP0V+NSyiBgho
	 /fqWpkuigNahqYT+Zy1M4fEZbCqmeAsi6VuKWV6FT4/q4lo36fElBdZ6fctspZr1ovyHc
	 +itzAEkq/P3QRGwLNwvQMccVCtDeg1LNn3eXw8i7SxfjnNB7vzmR/aRwxTYi1TWFqGUZy
	 wuaPBP8BOBVe6mwr6BX6/2VK92AKyhgVG59dEEiEzk1K7uYGGnQyYmfWmF/AgpEgguQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020474;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hHc+5QESSM5dswbHPy/P4Pkv6PdR1sZDMUBBiHWRB+E=;
	b=nYVPB3TI5avevqpUlB0bBq58xSRiBDnq8zNKuJe2wSI08JaS+S21i6laVApRfQXdcspu
	 58DskhOweGaNfJy3JeEYczFQJ2GpHcMTWe+yHH5H64wPjkAUdkrhVsEWMZ8LVJAFcg7yF
	 AvtBMZNR1y5oTn4jFWtNdYw8FKiqDaBBEBeYfBoUa1SWKyNZO91TvmU0C2xrd7TYxg8E1
	 rDuiNehZTkMN7wiwFlc8DJNayZNzivAMWs+xOK8zy4qgquWy5yL26Gaz1L34OiMxWkACD
	 SAZ0ENO1rsKajkiWXCLoARKLrcCDKVh1wosjEtITIXHThULzW3zd+6nJI4zR7SoTUeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FTkGFKKi;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755C5606A31A;
	Mon, 26 Oct 2026 13:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 755C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FTkGFKKi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793020473; x=1824556473;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5WhmKgQnXENaNYOrKsJ2LCC8p1ShMtr03iFZdCCwmMA=;
  b=FTkGFKKiB+JF17Lb6ojEa+4vnZSvUN+HrQMvqVRD3jj9XsCMzuGencMs
   lMlkka3oI6We3d3wGLb/lDMowKTCpQ5vyyi0dGc/tsheghQl6s00CjZ39
   zD3C5RIXKcxFO1hUmsdHpiNZWor3Qcu1aWqtI2DKoQGq+5yYU5vFyKiww
   vwJ6e+EZoDC0q/8g0FUClFP384cm5UUB3J4jaZzdz/x9R1hBnwJUG/xiC
   XTNz5dF7V1kmM7hM/XoYbfVfwIhPo8Wzx0CK8gPUypLbJK2jYNd+CJBUO
   l6IVR9xciFnPkXfmstU+NgNe3edYAo+9605vUQfPL/PuXMQx4ZK4pGvtC
   g==;
X-CSE-ConnectionGUID: eynoQpl1QT6afFMT1/qp9A==
X-CSE-MsgGUID: tqY4amMhRR6ZTPIUuh/k+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1680502"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1680502"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 06:14:32 -0700
X-CSE-ConnectionGUID: 3rl295nGQy+o7oAnjPmbeQ==
X-CSE-MsgGUID: kHXlQqnLR5SAMVlkqc3IWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4660539"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 26 Oct 2026 06:14:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 704D199; Mon, 26 Oct 2026 14:14:29 +0100 (CET)
Date: Mon, 26 Oct 2026 14:14:29 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Val Packett <val@packett.cool>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: fsa4480: Report switch & mux events
 to codec
Message-ID: <at9SNVc94yS5iIr0@black.igk.intel.com>
References: <20261020081343.1507986-1-val@packett.cool>
 <20261020081343.1507986-3-val@packett.cool>
 <at800xHh8lvwsi-8@black.igk.intel.com>
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
In-Reply-To: <at800xHh8lvwsi-8@black.igk.intel.com>

On Mon, Oct 26, 2026 at 12:09:07PM +0100, Heikki Krogerus wrote:
> On Tue, Oct 20, 2026 at 05:12:54AM -0300, Val Packett wrote:
> > From: Luca Weiss <luca.weiss@fairphone.com>
> > 
> > In the Type-C graph, the FSA4480 switch is in between the USB-C connector
> > and the audio codec, but the audio codec also needs to receive the
> > switch and mux events from the FSA4480.
> > 
> > Update the driver to get an Type-C mux on the next endpoint and
> > broadcast the recevied mux & switch state to it.
> > 
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > [val: enable the SENSE/MIC bits; put the refs in fsa4480_remove]
> > Signed-off-by: Val Packett <val@packett.cool>
> 
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Sorry, I noticed there's already v3 for this one.

Thanks,

-- 
heikki
