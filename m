Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB6351D52F;
	Tue,  8 Sep 2026 09:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858922; cv=none; b=a1enAdHl+UyeIoY8IdSROGgAkvPd9Nvmc72h0JkwOT/FqKDZX3azdrn6XCphQepxVyEvL+vpZdDBzUp3/M30w7dXLN3JE6EBD64lBQddy/kXmRjtK4aPEkw2ceweWWq3sOxnRnVY7VVwmeUBRM5JH70jo0Gxc1rGWx/6Wf6B9tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858922; c=relaxed/simple;
	bh=yDNZEhg1qi3cdLkc6pYbOR3ONrVCKjzM8UOHzV5U7TE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWfQNcwO4YR+Fkep3px8o3gXdfdi0gb13ZWaVT2B5U4XUGuB6oHoFJ3GdMhakmc2jJr7/aaBQo6od+B2ZivIcXFzwP30qHakEFXof02OD9QNFl8bGQ9vXEFOWpYydtDuLpEEnLFThBNJj93kESMAS0AOByMwnS4CB9ZRVdzf2f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVZyGCbY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVZyGCbY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788858921; x=1820394921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yDNZEhg1qi3cdLkc6pYbOR3ONrVCKjzM8UOHzV5U7TE=;
  b=MVZyGCbYBsvMCO+mZHogB1vxWyYpcdp89T6Ffi3bXPK9tsS31Cu+7XKm
   bH0xqxVVQ5reMflQ39rhdbeXhqs6veCJakeAG6qxo3qsyJ9hwR63rZhRG
   KlxaWP/I80DTQ0og4XaydqCkgPUTkbSxuwfCl5HRFAJJ9AF+CIF7tbAOT
   BOaYhEC6Qik7+Hv34ggBfJtPhYWo9cNzS1yf38c5ZF71NC/IUcgoG40wl
   wEz16LP27I47mcCU2j7qp5J3YuSsc7n+Z/spEzBqFg+eKRGwrhqkEZH0m
   FNrGdr6H2dPXBVwOCbmG6AAzSP5dW0F+gQvLMQ/Tw7LVNv4yUL9mhgX1h
   Q==;
X-CSE-ConnectionGUID: 9N3qGOQvSoOEs7TM2Nl79A==
X-CSE-MsgGUID: 2ILOEPTwSZ6TN/0BM83aCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="112032178"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="112032178"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 02:15:20 -0700
X-CSE-ConnectionGUID: QSsWcOlHT1eHpxa2iqmdJw==
X-CSE-MsgGUID: QJkqW0aASJmOyzuliKmg5g==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.120])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 02:15:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B0AFA121BC8;
	Tue, 08 Sep 2026 12:15:18 +0300 (EEST)
Date: Tue, 8 Sep 2026 12:15:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 0/2] media: i2c: Add os02g10 camera sensor driver
Message-ID: <ap_SJs-vXJu4tClB@kekkonen.localdomain>
References: <20260708110949.31313-1-elgin.perumbilly@siliconsignals.io>
 <MA0P287MB2178B8563D434B18699EFBD188CB2@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <MA0P287MB2178DE6EB4C9E675B9F967DD88D42@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
 <MA0P287MB2178A6EBE37DEB29AEF632C388B12@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MA0P287MB2178A6EBE37DEB29AEF632C388B12@MA0P287MB2178.INDP287.PROD.OUTLOOK.COM>

Hi Elgin,

On Tue, Sep 08, 2026 at 09:03:10AM +0000, Elgin Perumbilly wrote:
> >>Could you please have a look at this patch series and let me know your thoughts ?
> >>
> >>Best Regards,
> >>Elgin
> >
> >Just following up on the os02g10 patch series.
> >Is there any blocker preventing it from being merged, or anything I need to address?
> >
> >Best Regards,
> >Elgin
> 
> Just following up once again on the OS02G10 patch series. Could you
> please let me know if you had a chance to review it?

Thanks for the ping. I'd merge this, but the patches are malformed somehow.
D

Can you try resending them, please?

And my apologies for the delay -- during the summer holidays not much
happens here and the e-mail backlog can take a long time to clean.

-- 
Kind regards,

Sakari Ailus
