Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5287A4248DB;
	Sat, 12 Sep 2026 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789208213; cv=none; b=t67WaASiys6llvq43SJa+5Mtob6U2S6fwpSiCXbJnfGYalfzWUnuWtsNSLY3WQeKH5lfEhA8yLZMYTgUmLCXZKqa9kbabrAkFHg00YpfJu2D/1ohjTaLxErW+le2x08Tp+spuS2IzHDmFMcRweyIkP/ClKJBSRg4TEG1HkkFp94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789208213; c=relaxed/simple;
	bh=z5WVj38IiC/hz5c3bJDAj7E0oAL60HZscOoZZnZ7vi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qfcJOo0psYg3syXoVuAM3C2Ra4pU/EaZucerTqFfofAD2VDoyQb91AxsTxZ9eW0GABnFzvafgi2emrAFvwFsk6h10uCf+rw4zBwiFbaSRt8/xmSYq6Cdj6xEUTHKCyWKEhXoUy7qNTUXhaT5e8nH/E/NIXotjjsIddugk6hXugk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oc+Iki3a; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oc+Iki3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789208210; x=1820744210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z5WVj38IiC/hz5c3bJDAj7E0oAL60HZscOoZZnZ7vi0=;
  b=Oc+Iki3aspX24lGtW1jo19/Lkk7upEpLFuux2xOPREHxA8ASkv4bB0tk
   Cc18F0LZPdJQ/XEa6TQCvzFI9ZuHev0QvPU3sW08yZHPKcrIJXFViVzGZ
   f2pwIiNWu62Ks7zQqI1ktw8/m9Kv/YDIFYU4kY81c/CDhXUT1TyGQM/wS
   MpQvOLbTLRTWEY9GyPl7iBF3zfh9fmVaaxjPwwDEE0DUs/DCipPGk15s5
   adgfAjgwyr9BiRMPn4ScHNnPf3xV2gtECh4pF2eozMw24o2MAnTCfCFlB
   cLFi6Atbt+KNtANOiqGtclax1zM4O/WBpbRBJiv++h/YvXe6IlwnhVyDl
   Q==;
X-CSE-ConnectionGUID: JGPDO89zQvSr35SxeedzLw==
X-CSE-MsgGUID: FbO4/p3GTOmUYuuNSS21jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="100248591"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="100248591"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 03:16:46 -0700
X-CSE-ConnectionGUID: WxYq0ebZTheni3f+fkGWkQ==
X-CSE-MsgGUID: LkotNZvCSiy5ua4aaoNTbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="275906220"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.236])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 03:16:44 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B4A5D121BCE;
	Sat, 12 Sep 2026 13:16:48 +0300 (EEST)
Date: Sat, 12 Sep 2026 13:16:48 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pierre Pinon <pierre@pinon1.fr>
Cc: Jason Chen <jason.z.chen@intel.com>, Jimmy Su <jimmy.su@intel.com>,
	linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken
 1928x1088 binned mode
Message-ID: <aqUmkCIizqkwrgZG@kekkonen.localdomain>
References: <20260904134604.595685-1-pierre@pinon1.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904134604.595685-1-pierre@pinon1.fr>

Hi Pierre,

On Fri, Sep 04, 2026 at 03:46:00PM +0200, Pierre Pinon wrote:
> Measured on a Dell Pro 14 Premium PA14260 (IPU7 + Intel CVS, 2 MIPI
> lanes at 1500 Mbps) by instrumenting libcamera's software ISP to count,
> for each line of the incoming buffer, how many samples were left at
> 0xffff:

Can you provide the output of lsusb on that system, plesae?

-- 
Regards,

Sakari Ailus
