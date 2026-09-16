Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A8F37DEBA
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573657; cv=none; b=kDoESe8/eDHm3T6gTQAWQlZGFN3Frt68jA2nQCJLb9KktBU2vDIdoSNPB06HEdOgU31OKs6pnDw9WHBHSFVjulPKzgnp21e/2o7ch0ENI3Z+rhT2Urug2mIc9JSburErxR75SlrCUUSxWCO8/Pv2wapYODOJxHmYO5grtQcvTYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573657; c=relaxed/simple;
	bh=98vpvOt6JjqkguOwWrjbZ59G63gQFvkNmpwmsu+oAZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NuyXufzjrgpu4RsHaoWtVuz+fkjbzIE6qBwbyjx4Go6ovxjBwbLTZlF4zyN5UK2QW3J13f6pat+u3jIOdAbNLZB45jHvIhvbrtdOzf+B8nSOePlK9xuDi7ifhvNv8U16nJ1fMDcQY8xl1Ctv9roK3haF7PNot/03JVM+Zmq2HRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eohmMOxV; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eohmMOxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789573656; x=1821109656;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=98vpvOt6JjqkguOwWrjbZ59G63gQFvkNmpwmsu+oAZk=;
  b=eohmMOxVNX3Q6yuofxehIRNFZITEeGBYR4yuRdOp945XSdbCZuLjzTCi
   kI1KVvpjy8uRhFrKCeFyiQXxUUXgE4ir5L+eDsQ2n5AyrlZI3eY3sNbTB
   hN7Dw5rq4+wX5nJUC9t/CuZ8WtT0a3Q29bdmmbgaFuQECUOrqnNfUnY66
   mo+eAkV6kIHxR62HAVfk74xEaB7XJMgUVXVzVlub+YmES/1k0MUri+vBk
   h6jKHxbmp4aJoij+DU5RdcvsrXtBy/eeLLvPMovL0lbkD+5dVHu2JjTt+
   57euk7pKXFt3dwnpUgvLlmyKiIqbD9cCzTTHEFcyf50XTPyDStPcz2K9G
   A==;
X-CSE-ConnectionGUID: Dx8+TDpHQ8GCtCEgy6BTLA==
X-CSE-MsgGUID: 2vF3LMlPR4iUfx7/XAJThg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="461062"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="461062"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:47:35 -0700
X-CSE-ConnectionGUID: kbGhFysYT0WfxFJ9CRGKLQ==
X-CSE-MsgGUID: +YWDDGmFSEW07iidFZLBsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267167610"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.145])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:47:34 -0700
Date: Wed, 16 Sep 2026 18:47:32 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maria Lisina <sekoohaka.sarisan@gmail.com>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/4] mfd: intel-lpss: Switch to debugfs_remove()
Message-ID: <aqq6FE0ZMqVKe5am@ashevche-desk.local>
References: <20260916-intel-lpss-debugfs-v6-0-5c118ac430ed@gmail.com>
 <20260916-intel-lpss-debugfs-v6-4-5c118ac430ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916-intel-lpss-debugfs-v6-4-5c118ac430ed@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Sep 16, 2026 at 07:36:42PM +0500, Maria Lisina wrote:
> debugfs_remove_recursive() is deprecated and has become
> a macro for debugfs_remove(), replace it with the direct

a macro for --> an alias to

> debugfs_remove() call instead.

With the above amendment,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


