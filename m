Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838811;
	b=0G7Aztp0errgJJskOfAEmOZ4ZAA9ZmXtLVqukTBe6gWy1yZbSjIQZHhJgdZl9DeUnLeT
	 VVuP3mko2ha7OB/gsL7MipacWatJbNma6pF0iFmP9Rww/zTGdoRw6YSMWc9z64yFiMPXn
	 8tFeHTgmbu6czHhSZ2ooDhnV8X/xP92U6DHbwoy1/CiF1QcEZl206ejSa+3kxDUhkePhd
	 RvWnolKNpDIkAO5kwUU9P0FsycgmrhNMiDK/Bn3CuJFJvAUyImNvAA1I4qntyJ6iGAItz
	 LUax4FYzd1eQDDFWPYx2Zl8BekFdzwnHVu4E3m8kbVw5U4lfLyAKT0UIWhcR+UW4/Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838811;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=ZPnF7AXJqqhQH9EkBttMT76JzK8rqfInXWI5291QWiY=;
	b=vIPmyoYjTZTbqZ6jHJQFm7IY4vTtigT1pbbRYpT87tYaZMVYFkPBPuzd+Ey4MP8mq+GJ
	 qlD05C/b8OPSqXP7Qc+McsvTYtolhauktRWq0UVYSYhbiY30CHCmCCcws7XOaa4FwHF4I
	 K0vWZPe8ti0wGa1gEfE2nRuw12eTLhE/oCS8+PTbRIj1Vs/2oGZZvBSISEt9jW1CuMSvN
	 Ppx54QVWMABQUMXLAYf0wgi8XzLXE6IcEZwxoUW4uc4jFV8qOgoPQV2sHyH/edqxs3aA2
	 l4YIYc1yDGMHFCxmIau3FBImudpfgI9VMj9yBVty/tEdlBFl0teR+Rj4ghasAhYcVOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MRPME3eZ;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E8E606A329;
	Mon, 16 Nov 2026 14:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E8E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MRPME3eZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794838810; x=1826374810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bDcsy2RPjNi+n7ijKnyp08tkF7Mr2ciXEhvTTatXinw=;
  b=MRPME3eZiX3gJPtnIO6vGSS/5pS1kRuQ1E8XZrN77d0BJFFKzYMBbxYF
   thg7QPyl2doaMJgPxy2dLzsfr9iewL30p2laqozdFmYSk2O+/Bkl0YIDu
   mQ/nqmDQ2YitBur7sZl6C6jGej0wJ35kHjNmepwOcspcdQBWIlPwwiicu
   eExHWNAud/swm/8wt91AabWnvDZsiUFCSiXqBAA6ofAL4/d7l5budouXq
   TBtG/JEJlkRllNlgDaY2/fGCn51KhtTkD8Y0fj/cXGWeuzFo6QHdO3Rmd
   WimkjeyDzEkoFRo7kvAvv68lKXa4HdrkVVcvr3MLEYyC4DTAlHNzYaCfV
   A==;
X-CSE-ConnectionGUID: dwj5e5TIRXSzbJet8WqMyA==
X-CSE-MsgGUID: jhg3YKIbRXWUBW8vq8MPsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3611249"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3611249"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:20:09 -0800
X-CSE-ConnectionGUID: ON7eFZe5QFeg9R62tTKoEA==
X-CSE-MsgGUID: cEwgaYxaQGmvBCzhcXi0fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9554452"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 06:20:07 -0800
Date: Mon, 16 Nov 2026 16:20:04 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] media: atomisp: Remove unused any_virq_signal()
Message-ID: <avsRFGZYgz7KYcHD@ashevche-desk.local>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
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
In-Reply-To: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 12:06:56PM +0000, Avishek Chaulagain wrote:
> any_virq_signal() has no callers anywhere in the tree. Remove the
> unused function and its declaration.

...

>  
>   \return any(VIRQ.channel[irq_ID] != 0)
>   */

Do we still need a comment?

> -bool any_virq_signal(void);

-- 
With Best Regards,
Andy Shevchenko


