Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76526501285;
	Fri, 18 Sep 2026 15:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745142; cv=none; b=RMdFq+zn7NexDQTTF59BcwaPa4/LEg1Cao5VRutnCgvvw6qUwfK4SrniUwKNSYVsz7bKUh2ZNi89MNbPMXXiJfIUScU89R8Q56PafsqNbecnLIGmdI2YbCg3z9VHRhqKZnPoBQcTVuV61YRPiuRF0uY5VnGnnEyuiKYbAZS1J+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745142; c=relaxed/simple;
	bh=VQXHS6SFIhzGO6H9rE1DQak0OGKm+UvN7wUGYpUkc1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NibMFNG9Ws2N2dczXAkULCaGXyhaYf4VF020mEnlcFG/4nxF2XBJq9Rhr15M6JmkT+nQH+YT08kiY2X+KLYuUDPK25pOIT7R5HCTJFbQGh4llWBA3OsfsZezyoRx2ctdHX8AWUgPYaPwMyWaXe5nGiSoxbABGXqbzlEPdpbCtvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7TKyy7z; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7TKyy7z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789745141; x=1821281141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VQXHS6SFIhzGO6H9rE1DQak0OGKm+UvN7wUGYpUkc1E=;
  b=E7TKyy7zMXC3shqALqM6zwZLS9iEJyTqYrZhHuHYLcZOWACDQMUwECp6
   d9qtS6Vbe05qsWGzRWXEIcq6xpC5ursjzSSI3eLAzokBJ8+9ghrIRkVHi
   8ozso4x9AMUQ8vBU9NuODqHgBiUTM0AKuJlvlRzhj1IOM9KEtQ3lTBdhy
   y+oVJ1iEnTC5h4PzkFBewJ0a06hJ4kwY83/FXS6lf7flavCOe7VdtMzet
   exCH3D/dpLPs2SeTjC8yXnv6J2QRram6opHwZBQxkwBEqJgKFmTOxyLyX
   UAEDsRp1jxze+LKmkSCnD5jFw52Gik/jP9oRiRGOHN3Mk7FsaqeFZf8M6
   g==;
X-CSE-ConnectionGUID: T0uDkmcvRM+fZ9hqGsFB6Q==
X-CSE-MsgGUID: Ll6+0rapTn+EY0SeHPGk2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="77822097"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="77822097"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 08:25:40 -0700
X-CSE-ConnectionGUID: H0oTxjEeRUyu62+hxvn5sg==
X-CSE-MsgGUID: X18+9KIWTaKVUEDNOUUY3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="271124492"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.5])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 08:25:38 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D7C65121BAB;
	Fri, 18 Sep 2026 18:25:35 +0300 (EEST)
Date: Fri, 18 Sep 2026 18:25:35 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] gpio: usbio: Remove bouncing maintainer
Message-ID: <aq1X72s0ir_OaZBQ@kekkonen.localdomain>
References: <20260827155127.2334936-1-dave.hansen@linux.intel.com>
 <apCYT42UKw9V-u5Z@kekkonen.localdomain>
 <2026082836-albatross-patience-e24a@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026082836-albatross-patience-e24a@gregkh>

On Fri, Aug 28, 2026 at 07:38:49AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 27, 2026 at 11:04:31PM +0300, Sakari Ailus wrote:
> > I've posted this
> > <URL:https://lore.kernel.org/linux-usb/20260803164533.58833-1-sakari.ailus@linux.intel.com/>
> > earlier but I guess it hasn't been merged yet.
> 
> It's the merge window, will pick it up after -rc1 is out.

Ping.

-- 
Sakari Ailus
