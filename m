Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462568;
	b=zlLVF/t690IztlDc5KsQhGVKfSMncolwu1f6//nCBWNbF23fBFc7L6kXrU4DlJVPiHJ7
	 SZEQihzr1g0qJYUdTwp5EH9hzCYQ1DyFK3kckbBHbr7ukvaXvpLTWgJ0qAtXArK4AF3fU
	 f+b+pp6+crISuVJIb6ebGAN4JD3+TDDTVRm/Bagm8tp/OVgKBtqqt8GDHEfmahmjHU3Bv
	 fd2M5pHr+vf5VyH4waxwlYG6ZJBCqK/Pgyvrizd7IIAN5i7jCyXm8n1Bg3C0omwp5EFym
	 2rZHQJUyyfQHg00uq1DWDn4Pf7LDiAT2bwfidLv6Kv9U8HsRN7aqsjUAY9FC0nvVZPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462568;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2s63RbVzPaeSMEDqulBo4WSLSy7FX64O3I4ORCTozYs=;
	b=5Rr/nHvGbylXsh7Lx1SJlwbH1nU5TAhSLFPrlVl/l3d7W5GXdnpnx7BFrIWwnpBDnPmO
	 7xWvE01la+rj7oX3Hu1eRoOtMfzT0NPN2y5+KKSVIjzPtEWzifdNLpH77hq00S5NvEl27
	 tzqWb3ViF5ZXx2hs27iDAqASNCmGFHRmelhYEW4aRNP5Zt1idUt0XdyCsnBA5CiV0W0YO
	 jQcd0VuaalpGIDpTafZ+R2fL7b3ehiFsGUvTODLQfIzzRMXftcjlwGpX5XhpSmuj7GKuz
	 MgPk66/dYrtGrLfyQtOWrFaDZD47fq+wFv2cTKW/NAl1prLiEkO/JWdJ9kB71nwRp+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djkjU0yo;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4564C606A31C;
	Thu, 12 Nov 2026 05:49:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4564C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=djkjU0yo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794462568; x=1825998568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2s63RbVzPaeSMEDqulBo4WSLSy7FX64O3I4ORCTozYs=;
  b=djkjU0yoTEXq/KMM3jrGAIQagjKWIBkgvC79tiY/YgsJwYNszZ6oB7Tf
   +OS6U/HPR0tqZm/4/LhxQOoV2V2u4XrzA48FlcL3U6kVdEAD3kl72BqrH
   efBRALwkPMX6Yd7rodS+zR5JX6jWXj3jQnU72a5By4Uep6ehmQjRllorV
   m7sJ7Y0kxNG/KYd+VcDrNyf/cAY4pXj7FCpgwIKCywxyk0uGsz/TZmSUs
   pb4GqAI8+L7q8NwlEAOtuvvqMwZwNHoEYKPck59H4oO10astzYhq0ahSW
   RfUaArdb7+1C0iIk6El3v5H8gXvMw3WufJMmv2LuI7dk0AclML58d9ueo
   g==;
X-CSE-ConnectionGUID: QZl3XOnvQqeeDUE1wN/eEQ==
X-CSE-MsgGUID: ipIMXxI2Rxq37tqsm2zIKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3134027"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3134027"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 21:49:27 -0800
X-CSE-ConnectionGUID: O0VHcGJvQhmb85wtnPTcrg==
X-CSE-MsgGUID: ZGiETdIkSk2f2LIvAryIkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8889057"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 11 Nov 2026 21:49:26 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6268A99; Thu, 12 Nov 2026 06:49:24 +0100 (CET)
Date: Thu, 12 Nov 2026 06:49:24 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andrei Rusu de Castro <arc@empyreal.works>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Optionally keep PCIe tunnels up through
 suspend-to-idle
Message-ID: <20261112054924.GK259790@black.igk.intel.com>
References: <20261111-tb-s2idle-keep-pcie-2a2a66a2@empyreal.works>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111-tb-s2idle-keep-pcie-2a2a66a2@empyreal.works>

Hi,

On Wed, Nov 11, 2026 at 10:57:08PM +0000, Andrei Rusu de Castro wrote:
> Every system sleep puts the USB4 routers to sleep, which takes all
> tunnels down, and the connection manager re-creates them on resume. A
> PCIe device behind a tunnel disappears from the bus in between. An
> external GPU that drives a display does not survive that: on a ROG Flow
> Z13 (GZ302EA) with an RTX 5090 in a Razer Core X V2 driving an external
> monitor, the GPU driver found the device gone after suspend-to-idle, the
> enclosure was removed and re-added under a compositor still using it,
> and the desktop froze.

It is supposed to work so that the tunnels get re-established before the
native stacks are resumed, for that we have the device links. In you case
it may be that they are missing.

> For suspend-to-idle the domain can keep running instead. Add a module
> parameter, s2idle_keep_pcie, off by default. When it is set, the target
> state is suspend-to-idle and the software connection manager has a PCIe
> tunnel, leave the routers, links and control channel running and keep
> the host interface in D0 by saving its PCI state in the noirq phase, so
> the PCI core does not put it into D3. The devices behind the tunnel then
> go through an ordinary PCI suspend and resume. Without a PCIe tunnel, in
> other sleep states and with the firmware connection manager nothing
> changes.

I don't think this is a good idea to be honest. We should really understand
why the PCIe link is not coming back as it should be and for that it would
be good if you can share full dmesg with thunderbolt.dyndbg=+p in the
kernel command line.
