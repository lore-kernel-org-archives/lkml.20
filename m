Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906733;
	b=r/6UEYz7FtRPHI+Ih9qF0T4smPXXlNaeBtfhs92kyiCX6749Db2P2r9yivKCUi7DbMhH
	 ySqjECbOVrP0ZdQQQAZD2tEkQavkSguLB9SY5/kawDUACw7+kSefUue0uGWq0Xkcyc2PF
	 syWp5g+UYXRq7awtwwTo1iXsGUya50Jd07aMlvyNVsWawx4enml9GqeF8JnR6MYTzzsSs
	 x9UKGyodg0kVrlZOL5fXK65qFE+bmdyyg+wSprAFfSEFXlDaUy8mZJ50ExZOVIJGQBx7M
	 spNtbXAf23thzyhJetoLP6Gcsk3FIhnSHmONHs+sTAkh71lxzu0gZ2KTNQxx6YAJbnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906733;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=sARh2vxI77mefNWtiaNXngUxhjlF/CvgAiwrCgNCyNw=;
	b=MUrZHxASPqXUxKT9d4IW6HJNupwWYiq84HLAJ4hsCXf8n5vJ4XSFX4wWdbgKrDygE/yo
	 htLGZXZzGNuytNncxobZtqmhVGfGyFWHAXnKu7gcrOdQLUbGh6NBuBQpmFgl0veJPAFxB
	 K9anXOHV30h/WhmfeGqm302yz9VXuAvCoBJ4GFmobQKD6fneLGycBIiHR/+tk1gsetssX
	 6OsdrY/A0hK/SZpCwrbbtZmrp20cXx4Or5COFf4DxSRm78VrxOTFeT23dJHFzm6QWJf65
	 Qufg83LMtk3JIiHvFAPiFn47IotZrsjw2NKu+xZ8b7ZpMPNnPqvI6syCGoihWg9fC0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cq+DUecl;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CAA606A323;
	Tue, 17 Nov 2026 09:12:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1CAA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cq+DUecl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794906732; x=1826442732;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xK75Rwny+8YxOayz9J2hx5xcwDjlispCGjCFjO57dxk=;
  b=cq+DUeclDtbQy2BLhgfjWrKqizJnQdVAe2QzzjNkTnFJEEYIl5awSrox
   B1QM9dcnr+F7AC0vvu9/1e47IWqMuYGJPwisbpmEW3Gxze0WwfstvR0hi
   VfH0ZLlKaaYqC6egwntZCf8ADTtDXAy+ZHTiceRbwKotuJJE4TMjJUSyK
   6J8bK10r0IiT+7kJaGr7+NkCow2LVYzaL3Ep2QrL976cD29zRshbfVbi0
   pv+qLEHvgCeGVjSs7C8bTHmxVDVYeMSZU2AZQFbam7HcrDVAxLbv/cCh8
   IHS47nV7oFBA0jVeBRpfr73rleW3u6/wgkI2tKY3JAcXKQeVb4F5oclB8
   A==;
X-CSE-ConnectionGUID: etngGhuOTly5gS5Gmke63g==
X-CSE-MsgGUID: TBx4nDeyQNS9YUQboTmpJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3751070"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3751070"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:12:12 -0800
X-CSE-ConnectionGUID: DNi+Nw6MR7eQl3esGPmN3w==
X-CSE-MsgGUID: EJ/9j85CRZm/6qg/Vl7mbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9784071"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:12:10 -0800
Date: Tue, 17 Nov 2026 11:12:07 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dan Carpenter <error27@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] media: atomisp: remove unused functions
Message-ID: <avwaZ4cK8-sgJSMG@ashevche-desk.local>
References: <cover.1794845230.git.chaulagainavishek14@gmail.com>
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
In-Reply-To: <cover.1794845230.git.chaulagainavishek14@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 05:08:10PM +0000, Avishek Chaulagain wrote:
> These three functions have no callers anywhere in the tree. Remove
> each unused function along with its declaration and the now-stale
> leading comment that described it.
> 
> Found via a tree-wide search for functions whose name appears only in
> their definition and prototype, and compile-tested under allmodconfig.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


