Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BBE48489D;
	Tue, 13 Oct 2026 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908080; cv=none; b=Otr3pX21mjUDt5fPlbZKZkl4V6YizANzJxUHJh4dvV1xgfDB9XDBYWem/3F5pqVLv2+XBKMAt6O7BKTCk9jKLBW3fufYduohKM+BrFxM4TF1zER9MFLGgrud3oY0HOBPOIvj3N6ULQh8RCecc0/5mNp/MsUxGFYxkfxgP/7/Nag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908080; c=relaxed/simple;
	bh=LTruQoW8hg4nggqn+OIxVCj2Kv4Z3Lu4ZK3YcscwsuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cj7pRFY0nawaStV0ib8q88eS4evqckhELfJxOMvuhS7ZnP2B2ktHV8kZFW3i99r0j9AXo76njyujKnvhSISl2iRvAw8hfoGIOP9xXXi955HgxA5w6qVR4Heb+vabyIq2uiZ+grfXh/U6QhVb0WE/ywGCmtIzsJ95isyx7Nbdw4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1cMsGQ6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1cMsGQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791908079; x=1823444079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LTruQoW8hg4nggqn+OIxVCj2Kv4Z3Lu4ZK3YcscwsuM=;
  b=O1cMsGQ6vyfAMu0cTtoEXDTFDY5ZNjgY4Mpc7fgOg36SJni+rDBiVhq7
   2j0Qb0Fw1WX5KJhKzSgFG/CEEARmOBgzWgvgozUYgbTooiFkfjjBGlokR
   Mx8VI0VIQaN8qT/OUnFdCdNZgI/E48vBMy49kI2HvKFq6juLuYuhb6yT8
   +987Up4ldr4KVTKXeSMpjQTrb46jG9inNecTRqA0IskINbqolZ5boJalL
   Fhc2D78GwQcqk5bB3GwAQ6bvR37NhKMisn18hcLplKmt0aH8Lozk2WppV
   qvXjmhIqIK6yveitExaLoarLePOD1KQXrFec+vxym7S1967EkGo1KHsZB
   g==;
X-CSE-ConnectionGUID: A9HoA/V5TLiL/Hs6CHKkeg==
X-CSE-MsgGUID: +zVQjbG4Q6mKxppOdVLtbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="670523"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="670523"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:14:38 -0700
X-CSE-ConnectionGUID: WZ61k93gRhalFd/hdCLOHw==
X-CSE-MsgGUID: g4KMYIyoT6SLBYoXPKd4tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1522795"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:14:35 -0700
Date: Tue, 13 Oct 2026 19:14:33 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] media: atomisp: queue: remove unused local queue
 support
Message-ID: <as5Y6Y6XfME9t70X@ashevche-desk.local>
References: <20261012230754.1914517-1-vladurares@gmail.com>
 <20261012230754.1914517-3-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012230754.1914517-3-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 12, 2026 at 11:07:51PM +0000, Rareș-Mihai Vladu wrote:
> ia_css_queue_local_init() has no callers, so IA_CSS_QUEUE_TYPE_LOCAL
> is never set and every local queue branch in queue.c is unreachable.
> ia_css_queue_uninit() only tore down local queues and has no callers
> either.
> 
> Remove both functions, the local branches, struct ia_css_queue_local
> and the local member of the struct ia_css_queue union. Only remote
> queues, shared with the SP firmware, are used by the driver.

...

>  /* Queue type specifier */
>  /* Avoiding enums to save space */
> -#define IA_CSS_QUEUE_TYPE_LOCAL  0
>  #define IA_CSS_QUEUE_TYPE_REMOTE 1

This is a slippery slope. 0 can be default by implicit zeroed data type, so you
need to really carefully check all call sites that use qhandle and/or allocate
it. Since there are two possible values only, the IA_CSS_QUEUE_TYPE_REMOTE
must gone together (in case this patch is proved to be correct). TL;DR: there
is more homework to do and clean up more at the end.

...

>  struct ia_css_queue {
> -	u8 type;        /* Specify remote/local type of access */
> +	u8 type;        /* Specify remote type of access */

This is FW interface, I don't think we may drop the comment above.

>  	u8 location;    /* Cell location for queue */
>  	u8 proc_id;     /* Processor id for queue access */
>  	union {
> -		ia_css_circbuf_t cb_local;

Not sure about this, but since it's union the only thing to check is
the sizeof(struct ia_css_queue) to be the same after removal.

>  		struct {
>  			u32 cb_desc_addr; /*Circbuf desc address for remote queues*/
>  			u32 cb_elems_addr; /*Circbuf elements addr for remote queue*/

-- 
With Best Regards,
Andy Shevchenko


