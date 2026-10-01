Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28F537B030;
	Thu,  1 Oct 2026 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790885028; cv=none; b=KHQb1tohw7DdCURx+WhbXlNj8uSG9DMFoKvZdj5O869F0Ejj4c9yIRwlMcDfcz+u6VjZq5DaEZ2WiJ2gt7JsOzSPKZ/EUJQg206Nl0gE8SQWlyQ0z3wN7VPPLYUnjrvwW3KYWTjz8KfXZgUXesoMujQmN+woT9EE5BZb3NzKoQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790885028; c=relaxed/simple;
	bh=xF0yNOxia7Hcm1VwIH5PWvLSToVZeuLgw8EYCdR96Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRJYcZIoe316TUkDDwEP1P7nAX6jU5yCVnc31vHj+ZEoMDM1vPx0chD4ZaR5dS18liD7kQNX+YR0TlE6wGmmg+L/mUexEedi40PG3Zox00lIBxQPTpOErzKwJZtVgQJ8z6Og3THyuKPSJHeaSiHWCHLuTlSGRSOysAOX2TM3B6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvM2JCQu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvM2JCQu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790885026; x=1822421026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xF0yNOxia7Hcm1VwIH5PWvLSToVZeuLgw8EYCdR96Rw=;
  b=TvM2JCQuozuXQMW/CZwXz7Ykq6LOkyF/usP4OvI2yQhu/WrXhOa+rYtl
   Q2E13OHNLxAfEvtRKfvqgQO6K15GAmu7i4lm4kf9agRFaKMc770rolie9
   EDD9Asn+BwYputw8P+i1J/DUAal8z+o60zz/di/1skY8KrpNpL7aB1Ul1
   hgbPBgwGlyWK3nSe+6xqt/+WCaD5QmHLxht0QRekRD1GEQtvEv6bSiHY+
   7gYN738Xe9pw1pQsnGs9PmUkIV+soZTURawzvd2Jn2muncbEq614yw/v/
   0/zaNiQ16NWDRSbGKogZpYorv77w2rxQV/4znVohERBCuH6yhkGhKTDIV
   g==;
X-CSE-ConnectionGUID: Kjh2NA/xT62EKQfD6aThqg==
X-CSE-MsgGUID: Tiqrn5QKQYO19erupWjfDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="108034508"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="108034508"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 13:03:45 -0700
X-CSE-ConnectionGUID: ZXK4z+1ZSj2RO4q32holJw==
X-CSE-MsgGUID: CauQVEX6QvCiuaRNfoo7ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="275611560"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.154])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 13:03:41 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6E95A11F925;
	Thu, 01 Oct 2026 23:03:38 +0300 (EEST)
Date: Thu, 1 Oct 2026 23:03:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, andriy.shevchenko@intel.com, hansg@kernel.org,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 09/16] media: intel: ipu-bridge: allow sensor-specific
 link frequencies
Message-ID: <ar68mkS8_qRdGJQr@kekkonen.localdomain>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
 <dd8bcb40575bfcb11e92d976bec7f2b26cb95ca5.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd8bcb40575bfcb11e92d976bec7f2b26cb95ca5.1788360629.git.mauriziocasciano7@gmail.com>

Hi Maurizio,

On Wed, Sep 02, 2026 at 04:53:38PM +0200, Maurizio Casciano wrote:
> A bridge-specific firmware parser may have more accurate link-frequency
> information than the generic ACPI hardware-ID table. Let it store link
> frequencies in the per-sensor bridge data and prefer those values when
> constructing the endpoint software node.
> 
> Existing bridges continue to use the hardware-ID table when no
> sensor-specific frequencies are supplied.
> 
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Assisted-by: LLM sparse

The ipu-bridge already has a mechanism to set the link frequencies based on
the IPU PCI device ID. Would it be usable in your case as well?

-- 
Regards,

Sakari Ailus
