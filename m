Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED990357D0A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712391; cv=none; b=CUikh2vtzHfoXxst3dfBMA22Grtcar5fT6P9zEz3dLIQfbmJEQOU4vGZ1Vt8g3P1XnMEoXsuRYy2SeVdLst5JXH6AWbyrTTeWQAKYx8hFIKLongbeQXgt5OsNsEVW4qzl9/D73oluAiT6deAoHl0bav5gTIK5RDr/TS01F54Nzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712391; c=relaxed/simple;
	bh=uC3gSP1VWphKnsLHTSMN6q5Sugf2Ffol6uJOYV+TG04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3LcufTUNfRZEq1c2mxZ6zlvTXwRrJHa38C+w7UG3NCHxjLzy0VE4Z6doWwW2f2hWCHdyDf19lUM+vHg3w9x4nAQmuVViRpFYOz+yq6gf4WPZIGzGuTv/t08mPQaast5z/420z8shhhr/fo1P/i7yvKMgUiJ1aEQjBaiaDes0zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ine4mz+L; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ine4mz+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789712389; x=1821248389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uC3gSP1VWphKnsLHTSMN6q5Sugf2Ffol6uJOYV+TG04=;
  b=Ine4mz+LZdNtbUO5EnoWQZMZiZKxkoeHZmxc8fXMhxWUt3qyrUAGobTG
   oeMtkboYgGkvsWZhvuk6RmwVTvLD0fpnjH3tKnfDHoAkqRDfMJ9jJG4kt
   oUcxASQj2IDNtQT5Ss6vX4cvdyvE4h6IFW+aUqMBwtFoaMDzOXphyB71G
   A2tuNXO1eFcvmiJuhLv0sXfYm4pWCZEIEOSsE36hPo0uglf4HZoXm6r4j
   gMG3kqqXed8SOebQslVyA5RBtUxo941OcZoMH33/vX+zyMJXVAcEe23hf
   6wB6gMOKgVgxTL4PaNu13zvbpNnCRrxtqaXzpbQKShDi5dke7dajEGO39
   g==;
X-CSE-ConnectionGUID: jZRtbrPISuO/MWoHwwAgiw==
X-CSE-MsgGUID: UiSVFpDYReWKT5vF1bOf1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="698955"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="698955"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 23:19:48 -0700
X-CSE-ConnectionGUID: fNty+vSPQkiFor1dgoGn9Q==
X-CSE-MsgGUID: ni9fjiKgSSuvWZj8M+eOiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270919649"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.170])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 23:19:46 -0700
Date: Fri, 18 Sep 2026 09:19:44 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: akpm@linux-foundation.org, Dmitry Antipov <dmantipov@yandex.ru>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kstrtox: delete saturation in case of overflow
Message-ID: <aqzYAN30fpL7YfB_@ashevche-desk.local>
References: <a396f2ea-8de8-4eca-a216-ff69bc40fe85@p183>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a396f2ea-8de8-4eca-a216-ff69bc40fe85@p183>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Sep 17, 2026 at 07:17:07PM +0300, Alexey Dobriyan wrote:
> From 161367fd1e8b41e938274923bbb3d26de69f7a7e Mon Sep 17 00:00:00 2001
> From: Alexey Dobriyan <adobriyan@gmail.com>
> Date: Thu, 17 Sep 2026 18:49:18 +0300
> Subject: [PATCH 1/1] kstrtox: delete saturation in case of overflow

Dunno if this is okay to have in the body. I think you need to use some korg
tools to send mails in a better way.

> Partially revert
> 
> 	commit 6e30111dbb4075e3c26c230417b32bc4a1c66831
> 	lib: fix _parse_integer_limit() to handle overflow

The reference to the commit is standardized:
commit 6e30111dbb40 ("lib: fix _parse_integer_limit() to handle overflow")

> Originally, kstrto* was written in a way to keep simple_strto*()
> functions as is, so that they continue to return incorrect result
> if integer overflow occurs.
> 
> Saturation doesn't do anything useful, it just creates second incorrect
> value and potentially breaks simple_strto*() users.
> 
> Caller can decide to saturate itself anyway.
> 
> Move saturation to memparse() from where the idea came from.

I don't see the use of this saturation, so perhaps we indeed can live without
it as before (note, I haven't checked any POSIX/C standards for the conversions,
dunno if they specify that kind of behaviour).

...

All above assuming that test cases are passed as before.

-- 
With Best Regards,
Andy Shevchenko


