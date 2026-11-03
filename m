Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703324;
	b=s06P+ytzbN5kfgWP7G4YnTlHRhuRMVLN/fWwo4xqXDIZZpx8jIiUlCoRsgw3Ej9S4vYJ
	 d1UCrMN8sEc1Q/oQzrIAhLChgjoAJhI5jYFs0wHzDdQrBw4gr714bROcuzu8t5GMKv1az
	 9fUCzuLVc6+0DWNDXYwbrwziidfqdxGYp84IWudiqZBdwqtlef3+cCp/aJxi5QUhkPxUE
	 Rh4bJBkG2JOqYCYWyDzTqwBlz1I/CdoTgx8B2nBtJxCnYyCGx+N0evotLIxNHoKvnk0GF
	 T4rNW63Y2x0wdB6p7pMKhlSOS8cotNzXbMoJgGJhPIvTlWpW4SLj2wySszsd6p6+Qrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703324;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=u3cLj5oN/VZ0ZNxbSXI8g2cl/Xh+rzyKi2IZeHfI1Hc=;
	b=r2W6RLUgns9QGWc28EFNojJHgyG31P67zlC6QxWJwdvF2KqIGygDcgdeZ0KymOUnxmer
	 qJKR02u3LeNTvYIKk7X70Qt0JETX+Dxxe9rSM1zmrwgvMODIeNrt3OGiWli7gW0wL65lg
	 0Hg4b8HM5JRJeQ0E2sMD8vLvUb+4dwK8Kqx/pYy8fRTyR99zUbBhDz+dW57xEMxEo2aa+
	 6IetaksfQ9SKOngxLNS24qcOmRHFkB0QpTPTNbPsl3PmoAEOvNDi6GofOBAL0thY5QZG+
	 DoLITRtPu4xORHtHmj1tVmkEDe1gxxf9RANoFojwijSa/PWZhu4a6V6jYw7CCUP5qLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q7+sAeHy;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03A9606D809;
	Tue,  3 Nov 2026 10:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03A9606D809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Q7+sAeHy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793703324; x=1825239324;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zlZAkh1fUKEzetjxu/VNbWuP8t3+57w9dqjd0ryW8yY=;
  b=Q7+sAeHyt7kkxZEYIiu513DlJmseQmOtuHoKzHYbluQA02UoY9olFOu/
   f+BdHfZmWZwVrzavu5vvUIp2yhbVDecxz1QbIKyx39T2meWtcJ4hhz+j+
   IsmMeBSSe7viDk/LxMUkyaC32cCG4HNYXHb204OXwtxX/PJer/Sp46qZN
   hJnMpr8XlMUXuxzKAj84Va5oktDZAMEeGtccPL0WTKXLw8BTbiS9pm96a
   suj+th06S1pZmRyAOHTUvPlzWUe9psv1du9qPaWM6JPFYKdnbYR+BP29K
   cpbhwd4+16OI2l4QhdH6d5lHMwrq8tkNyFWfFmAD7tiznn4bosypEJs5y
   g==;
X-CSE-ConnectionGUID: fB7vy+gdSdGHiiat4LMEig==
X-CSE-MsgGUID: QZ+pxtITQ3m2bW1jB9GROw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2301013"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2301013"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:55:23 -0800
X-CSE-ConnectionGUID: 46CalhT3TQ+EBH80tcOG+Q==
X-CSE-MsgGUID: QZxCu3gBRxCB1e+dzUPh2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6450346"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.154])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 02:55:21 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5F50B121B74;
	Tue, 03 Nov 2026 12:55:30 +0200 (EET)
Date: Tue, 3 Nov 2026 12:55:30 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Fernando Rimoli <fernandorimoli11@gmail.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: i2c: vd55g1: Mark the AE lock and bias
 controls inactive in manual mode
Message-ID: <aum9ooVly1Oq3phM@kekkonen.localdomain>
References: <20261101195006.220657-1-fernandorimoli11@gmail.com>
 <20261101195006.220657-2-fernandorimoli11@gmail.com>
 <auh9SHrLKHTjENwY@kekkonen.localdomain>
 <20261103104959.52785-1-fernandorimoli11@gmail.com>
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
In-Reply-To: <20261103104959.52785-1-fernandorimoli11@gmail.com>

Hi Fernando,

On Tue, Nov 03, 2026 at 10:49:58AM +0000, Fernando Rimoli wrote:
> Hi Sakari,
> 
> On Mon, Nov 02, 2026 at 02:08:40PM +0200, Sakari Ailus wrote:
> > I don't think grabbing a control is a bug as such; it's normal that if
> > exposure is set to auto, you can't access the manual exposure controls.
> 
> For that case the framework itself uses inactive rather than grabbed:
> v4l2_ctrl_auto_cluster() sets V4L2_CTRL_FLAG_INACTIVE on the manual
> controls while the cluster is in auto, and vd55g1 already uses it for
> its exposure cluster. The AE lock and bias are the mirror image,
> auto-only controls in manual mode, so this patch makes them follow the
> same rule.
> 
> That also matches the flag descriptions in vidioc-queryctrl.rst: grabbed
> is "temporarily unchangeable, for example because another application
> took over control of the respective resource", inactive is "not
> applicable to the current configuration".
> 
> vd56g3 has the same two __v4l2_ctrl_grab() calls. If this goes in, I can
> send the same change for it.

Right, indeed that sounds reasonable. The drivers that grab controls today
do it for the duration of streaming so the use case is a little bit
different.

-- 
Regards,

Sakari Ailus
