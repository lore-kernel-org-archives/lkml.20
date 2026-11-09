Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229193;
	b=H0ltAJRb7dJ0lhT2AKc+W1XGKLqJRxun9P3bgAzIUq4CUzV/FYAgdAoa97v4/iCuis+E
	 G4ca0xR+u80ASoGNzyScRu1yRsVdrleeVrdMx+f+FQJj4Z87/4vZFnevOEHcHHy3bfuoP
	 567aROSKDE/qVGWPdmiJUbHmXEE5s9i8A5NTsZU2yq7FSYYRC710XQLJbYx6BggpQRn2w
	 p4QBGt7ialkL/hs9b8s4ymSEQkeuziikUJ3ruQfxO5n6pdGnjeQK+pfuBZR3yr2MTUJIJ
	 y5UJpTaOIItHOxaOUgCcrEs++7e63lLFFuS7TZmYguOR1lkppd3F26fWu0gVDmWSRug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229193;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dHJxQX6qrdjoJ9xxCpDciOGfZ1moJmuMFI7elkZmNW0=;
	b=L6TsJObbw+Fga3lBc4UzpLzsuRW0z/iVzC/58ib1NE4YZtcXeX3cnP+G91Z2dmtnOPe9
	 Mh+7oKZeun49KjOGzmJNGAK59vvXxH64/9z7QlL0VyTAm+Pa0hHAu81grTTKKTKxSdj+P
	 tTHuQj22YojpGDKWCz4+NebLOCDfacNpgoIkblLPPG0d44lLXysHia2tKIT+K/NlUK1Ng
	 22BJkOPHKpUus93HMa1YHPWeAnIJtYzH9+LjMYsAbxQgTZmfdaN+K+hcXvxXn90VajjpU
	 WbDro4DrAW3/NQqeabCJUzNuDlrLkp6Lowl9nZqhM6JbybJX4uxHcCzX9SlwgaV0xnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b0ZQJEl2;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA56A606A334;
	Mon,  9 Nov 2026 12:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA56A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b0ZQJEl2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794229192; x=1825765192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6dmvxcz7lqwbDDHNjfP4aPXb8rd73wq3lQfjHzl0tcs=;
  b=b0ZQJEl2AoWe/JLecb5OUbKNfavJW/zFw943YmNgcwiOuvpRXOpd/W6D
   eVI4rLJwDKH4pPK/Sun8xzvDfCSw1KP2dOn809+DlcnNLotJHFjESIdrz
   lORG5t7U+P5GkyTXD98pXn5jb3J4qDLaBx6DF0U9KWhtnwGsiEVOHjl2i
   eSIEXeVW+iHScPax5A3RtZmpcxm87xVmaugfxvw9K01Udaz6vEOT6rclk
   03B6p+Et0axtqMMiS8xYD5iCQLz8tMj+nzxfgYMDZdqa8OmZ6c0HA3aP0
   szpC8nGsX6Ngn0CgZNIdiFW8OhXYcv0jEjoYn8NYvBlZ55fzPTw+5ie7x
   Q==;
X-CSE-ConnectionGUID: U/3AekPXTJKd2vZ+zBS8Ow==
X-CSE-MsgGUID: 1BjrRjniT26F4FgyrzLSVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2849198"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2849198"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:59:51 -0800
X-CSE-ConnectionGUID: ljgYPguSQQ+aqfsa0muZ2A==
X-CSE-MsgGUID: JqzhGJqXRE6iA6j8DG6Qdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7869393"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 04:59:47 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5E107121B96;
	Mon, 09 Nov 2026 14:59:44 +0200 (EET)
Date: Mon, 9 Nov 2026 14:59:44 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	"D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: i2c: Add ST VD55G0 global shutter sensor
 driver
Message-ID: <avHDwGAe99WYaty9@kekkonen.localdomain>
References: <20261109093353.3757-1-lsa.uz@pm.me>
 <20261109093353.3757-3-lsa.uz@pm.me>
 <avGwRaKSqXdtXkII@kekkonen.localdomain>
 <20261109124610.85065-1-lsa.uz@pm.me>
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
In-Reply-To: <20261109124610.85065-1-lsa.uz@pm.me>

Hi Sergey,

On Mon, Nov 09, 2026 at 12:46:16PM +0000, Sergey Lebedev wrote:
> Hi Sakari,
> 
> Thank you for the quick and thorough review. I am working on v4 with
> the rest of your comments, which will take a few days. Two points
> first, as your answers may change the code.
> 
> On Mon, Nov 09, 2026 at 01:36:37PM +0200, Sakari Ailus wrote:
> >> +static const s64 vd55g0_ev_bias_menu[] = {
> >> +	-3000, -2500, -2000, -1500, -1000, -500,
> >> +	    0,
> >> +	  500,  1000,  1500,  2000,  2500, 3000,
> >
> > Is this
> 
> The sentence seems to have been cut off here. What did you mean? The
> table is vd55g1's, in the control's 0.001 EV units.

Uh, yes. I meant to ask if this is a firmware limitation. I guess so?

> 
> >> +	if (!ret) {
> >> +		sensor->expo_ctrl->val = expo;
> >> +		sensor->again_ctrl->val = again;
> >> +		sensor->dgain_ctrl->val = dgain;
> >
> > Can you use __v4l2_ctrl_s_ctrl()? That way events get handled correctly.
> 
> These three are volatile while auto exposure is on, which is the only
> time g_volatile_ctrl() is called. v4l2-controls.rst says to set
> ctrl->val there, and that a volatile control does not generate
> V4L2_EVENT_CTRL_CH_VALUE; cluster_changed() skips volatile controls, so
> __v4l2_ctrl_s_ctrl() would not send one either. Did I miss a case?

Ack.

-- 
Regards,

Sakari Ailus
