Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67EC3D967A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788962590; cv=none; b=sfhEqgvi+sGz1SIghg2yTRu8kvLf1TSOXs6qWRlIwXYFMQT9y7PpD41Osgjw6rsgqOSTkrHbmBdJMDmpGpxUiUOuttqjOsI4YXBk1yK+42qf9xneJJVNCTjv4piLZrCsMmwuvUW4U49pDFB9jwfqBPEo1YgGEYuwmFpgLRy383Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788962590; c=relaxed/simple;
	bh=cd4JeYv5F5dPa0SI4hhDwoObMvk28qrjEPebQcnU2gY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r/xTB1ofnaTqOG7KsHv1vpK1plmtYwoXEQ+3c2/mpURMb46zT0Oxvo4krIRyXaewWU2Z833DKS2QrTIWpwgbCKhKT0z/GNN2lZhu/ElhNAUkKtBZvoJooE1b9NOX9XCVWjgHmexyAWccmOGPkI8RGLqzoH/PBIrnMPsSLhICcG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHysCADl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHysCADl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788962588; x=1820498588;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=cd4JeYv5F5dPa0SI4hhDwoObMvk28qrjEPebQcnU2gY=;
  b=WHysCADlSc+MtA5GPJ6qsDnyPpTdWtDQzb8yDnMiAJ8oQeBcpJetm7W4
   WEsYUt2jNGJo76VRC5FEqbHxMZyiIK0BQ2KY+aBH2F9NFxH2VYzj0FQKD
   YiCMX2r72P8wYELUmyxDsyXce53ZKeCkLBRF+Vn+Q4r0EpoLTdgaWj08P
   c2DH+/JWSWTBv3WDbwXvPQCR/95Lh6ifr7OGsK+ap8mCAdeunfqPeVAUx
   JjSZDVMpBi0+jL+MI5Whjbb20lkJwkuC9QGS9aNMwJKnKYK/P2BBsJvC+
   p+KIOlsekqygW7D4iv+X7fFAEiXH6cAR0QcfrlDxpG9p4ibEO2CS852ZI
   A==;
X-CSE-ConnectionGUID: ucCTdMtuTailyXEXMelmmw==
X-CSE-MsgGUID: DavlcyBUTtGqq7XQ5xhmDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="76948640"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="76948640"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:03:07 -0700
X-CSE-ConnectionGUID: ub7ontpfRMqfkJniY7VrCA==
X-CSE-MsgGUID: cyj9KUgvQYCCAelxJzajEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="265122705"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.20])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 07:03:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jessica
 Zhang <jesszhan0024@gmail.com>, Linus Walleij <linusw@kernel.org>, Inki
 Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Albert Esteve <aesteve@redhat.com>,
 Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Hui Pu <Hui.Pu@gehealthcare.com>, Ian
 Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH RFC v2 05/19] drm/panel: embed a drm_bridge into every
 drm_panel
In-Reply-To: <aqEqx0zBQgmUgwqL@houat>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260903-drm-bridge-every-panel-v2-0-2ab8ee24538e@bootlin.com>
 <20260903-drm-bridge-every-panel-v2-5-2ab8ee24538e@bootlin.com>
 <678ddef7e56703d9adffff5c490d4857af515343@intel.com>
 <aqEqx0zBQgmUgwqL@houat>
Date: Wed, 09 Sep 2026 17:02:58 +0300
Message-ID: <3efb06a30baae6ba1bfcf2be449bf207a30f674d@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 09 Sep 2026, Maxime Ripard <mripard@kernel.org> wrote:
> I really wish i915 was at least *trying* to fit within the larger model
> basically everybody else uses. I understand that it's a large
> undertaking and regression prone and everything, but I'm also concerned
> about having the "we can't because of i915" or "supported by everybody
> else but i915" on a regular basis now.

Okay, let's hear it, please name a few things where i915 is alone in
doing something bonkers that amd, radeon, nouveau also don't do, and
what would be the changes that would bring i915 closer to everybody
else?


BR,
Jani.


-- 
Jani Nikula, Intel
