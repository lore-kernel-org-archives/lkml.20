Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633920;
	b=WoJHB7RBgRFvsiOtNKrDCtpN173Pu5fV12qWNhW0vMR+V/MVJWujh0FKi1j9eVbH8ncA
	 xzMIyE45k+xE0CamQ2XB0jrpdxikVez5TaM1ufERPCa71XZA2IzV+YsipapZSASmmTLVv
	 nfbJe606m8+PzveSLvDn/svL/UqtFBlg6Uc1HfmdkNznX0L1Oxru/7rjcsf45Xxxl9Tth
	 vAKPBpmYaAlcrHTI500s8cQvCXfjxEKt4gjUglHsgR9fRBe/ywunOQFaWBgJZBxFpptY/
	 0TAKDXrqd0PKycxReNo4XqSDa9BEBSG07ffHtqxyIN/cyiTsw+v8FZaMqBgkuYJI5RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633920;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Patchwork-Hint:Organization;
	bh=nZjJXjeUpHOd3aZ53gpfx+lICFKWiYGKVClNpZUeU8Q=;
	b=J32aJfGq13TwsEPXcA9nljA/RF69TfNw/wYImlG/aawpr0v4kID0k6K2wOUakr9kenVI
	 bt6rbq7bjG++9uB0ZV7rPExLqdgUviYJrHLPrBD82WfC5epkER1dZvElCWsdyAO62biWw
	 ThRZHFygwSEHbOnLuOEHRYKieOVj2arAlTUBhGhJWUL0pgVw0CAigzTOXlTReuKzmEDv/
	 RrqBTsY4SyZEyLRYU3U8450PLDvSd7pHatm61CeQenAuP08/m6WYoPzVxfznSH/lEwiIz
	 W9Q1uR6hff+nPx5Z2bOrXtGYKEz4xEHchTtjkMOJUATRr7eSTJJF4gIdRKd5EhGl7Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xx1xLVxW;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCAD606B1C8
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:38:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABCAD606B1C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xx1xLVxW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793633920; x=1825169920;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=hTYZdetg0DVplDyNYLvgAVyDM9iUmyOuE+J0YYj/dX8=;
  b=Xx1xLVxWCEszmXqoGpIvLAUZI9/r3tTSL13MSx394B564OY4zg0wFHfy
   Bp3a5gIFNOGcT24bFcR8V0urQydenpneowTLVRMg0PAUqajvdZOYmymLU
   70S8bnA+eNdQnrWFXIaZSHIgrrrvgo2PjCOmqGwGzxGSwRRRRKW1MFlhO
   vJ3VtellEozHt9ElCBXoVopcwO0ORXbgo5RllMJnOrTp5tz0B0Jzqstu5
   puFYuCMRxJUpBd01cuLK/B/HoP0HGYkF1ANKX91HRW8Ma7rnr7UFtZ7xN
   Cvh9eFJwnoRtTUC01Wl9eoAqsEl/1CBvize8VAZXf0fqXNTW/dtk3hfex
   Q==;
X-CSE-ConnectionGUID: 1kTUdow0QOiGxd3ziAOctQ==
X-CSE-MsgGUID: mJ0CWMUEQjiKNQF79su9Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2235191"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2235191"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 07:38:39 -0800
X-CSE-ConnectionGUID: k6ktoBSPQW+rVY+t7HSheA==
X-CSE-MsgGUID: 82Q0zRELTwesE46+ATslGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6249005"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 07:38:36 -0800
Date: Mon, 2 Nov 2026 17:38:32 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Hugo Sales <hugo@hsal.es>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
	airlied@gmail.com, simona@ffwll.ch, harry.wentland@amd.com,
	amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/probe-helper: Sort and set crtcinfo before dropping
 the modeset locks
Message-ID: <auiuePf6RbhdV65A@intel.com>
References: <20261031161952.660049-1-hugo@hsal.es>
 <auh8pUx_kXUYSdZ8@intel.com>
 <2112993263.278931.1793633202457@app.mailbox.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2112993263.278931.1793633202457@app.mailbox.org>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland

On Mon, Nov 02, 2026 at 03:26:42PM +0000, Hugo Sales wrote:
> On 11/02/2026 12:05 PM WET Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Sat, Oct 31, 2026 at 04:19:52PM +0000, Hugo Sales wrote:
> > > amdgpu walks connector->modes from its atomic_check, in
> >
> > That is just wrong. connector->modes is protected by mode_config.mutex
> 
> You're right, I should have fixed the real issue rather than work around
> it. Please drop this one
> 
> I'll try to fix it in amdgpu instead. atomic_check can't take
> mode_config.mutex there, so amdgpu would pick the mode it needs while
> probing and keep its own copy, like it already does for freesync_vid_base

Yeah, that should be doable.

> 
> > And regardless of changing the locking rules or not, someone
> > should probably sprinkle lockdep asserts to bunch of places
> > where connector->modes is consulted. Perhaps even introduce
> > custom list iterator macros that include the assert...
> 
> Makes sense. amdgpu would trip them today, so I'll look at that once
> the amdgpu side is fixed

Sounds good.

-- 
Ville Syrjälä
Intel
