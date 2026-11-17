Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909437;
	b=UyGN1kT22S8ddexpEo9hMS2zKWnWv+JV6liOSppg8lvg3Sw0/tScV4TR9O8kJvoXAa5e
	 A5ijq5RL/k998n16gwTVkMdK6/Gt7dU7QIyYzA2breIaHf9MQxTNO8qwANsPMfvFQMJCN
	 zpq2KytfNbSSiMDhU1UgH60SxSIKg/0DNNB6UUa6qFwns6lVdWrMxpjweIoE/w6pZB7kG
	 WZgXQVlMEhUKseqzrypFYS8mlg4rfIrKGwtP4EfHqKGMzLcZKCS4E+A6GMowRR9O/vhZb
	 OpcDwxx86T0524uNg0yNYhj4yTQz7bpaiWQUlr3OLUcNrtoXWlmSeBRzMrdyXBcpdDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909437;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=8LQ5Dy/ADmf7zpiEEPCreTwWA/XdI0vBH6oroij8nrg=;
	b=ifwZF0TZBcxtiyOIu1rvAqhESFAHOlyfYJdjJuOUplzHn6vPg8bKH5W+s2aTAW8jlidV
	 BmZESjuNZyKNkASkt1eiKBVzB6CXNGkgcbPoX+OKgqfE+nt4DiQMvbbdlXok2W9XvQw0y
	 slnVG0akM1009RAICdcCo8HUu7W5F2PlWykn5TbxPZMwFRI2zLIgtuVnOW8dSZxlAZU/N
	 8l6StYiTFLNBvUXqMUXfrTWB5rko5mVmJN9dj7eq32kQR40WaqXHTIKJ5IQdNU167swY1
	 ZgGUmMQXM1h/qL917HOZlWLl6oYMgA1eCM37k8fEee7xlYsyvHoy9qxXUayFzknhUGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZNg7sns;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA41606A32A;
	Tue, 17 Nov 2026 09:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA41606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZNg7sns
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794909437; x=1826445437;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lY2QJ+dr42ixRPBhzmuMSDm3xf6/nYnvWnvhMZfyCCw=;
  b=PZNg7snsFPW2BzeF2H7tQ+unfqZzNvnTOsGAR/hZu+qMxO7x9UlULTZW
   ymRWpI2p/9SnnlK0/HTWlqxoiihbm3+wrLuMBH+s3MHKWUSTtMTiXXL3N
   BLSn5MuweHKgLP338uCknT2+3iMBb0POv++UdFeA4Mneuvy5U891ZE2pK
   m8SUtOPFv5bJtaGzEZ9Yz5SQFLKZgix0K9U85rdYesMAenkTO+9qe5dH9
   Pus1X9LTnIVPpZz3vjNDMNNP4A45OgluhoIUZm/eGeL17z/t5YWwwekDS
   LuWJyRFidW+GmfOYFeF76on/CEJ+HWGIBODzYTahOdRaLv8emlajKkYnJ
   A==;
X-CSE-ConnectionGUID: 8o/3HO0FT6+dLkTnkT//TQ==
X-CSE-MsgGUID: sS8F0CI9QYeSL1bZBlw8yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3667889"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3667889"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:57:16 -0800
X-CSE-ConnectionGUID: TZAdfFoSSH6ji+yZeU0MoQ==
X-CSE-MsgGUID: 9IfV9blZRRyup/Kg8IWVQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10200192"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:57:13 -0800
Date: Tue, 17 Nov 2026 11:57:11 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Volodymyr Chapman <volodymyrchapman@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: ipu-bridge: Add Sony IMX175 (INTCF1A)
Message-ID: <avwk93N8D7AYGzDX@ashevche-desk.local>
References: <20261116175151.20150-1-volodymyrchapman@gmail.com>
 <20261116175151.20150-3-volodymyrchapman@gmail.com>
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
In-Reply-To: <20261116175151.20150-3-volodymyrchapman@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 05:51:50PM +0000, Volodymyr Chapman wrote:
> Add the ACPI HID which the Lenovo ThinkPad 10 (20C1/20C3) uses for its
> Sony IMX175 rear camera, with the 320 MHz link frequency supported by the
> imx175 driver, so that ipu-bridge creates the fwnode graph for it. On
> this Bay Trail machine ipu-bridge is used through the atomisp
> csi2-bridge.
> 
> Tested on a Lenovo ThinkPad 10 (20C3) together with the rest of this
> series: the IMX175 is found ("Found supported sensor INTCF1A:00") and
> streams through atomisp.

Enough to mention this in the cover letter message.

> This patch was drafted with the help of an AI coding assistant (Claude)
> and tested on the hardware by the submitter.

This paragraph needs to be once in a cover letter, no need to have it in the
individual commit messages.

...

Since the ACPI HID here is broken (it's actually a PNP ID), can you also
provide (as a comment) the excerpt from DSDT to show that device description?

-- 
With Best Regards,
Andy Shevchenko


