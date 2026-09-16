Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3F6345731
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537691; cv=none; b=Zng4eIer3+IDInty1M/YAaUUSFcG5JF+yh5QtDWoP5AjjEiwBhu8qxoidaac/7Qb9ZJMB59WnUY6/70TOzM8sCQDTePlBMQHF7Z3JvkTaBAu83+cEPPAtdEwwZRf2MZJlVZ2gNwjmQxl2Q5Xnr8/khdwD+RVFRWFIcYYpFFgYgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537691; c=relaxed/simple;
	bh=VFPYIoei+RvA92CJV80XKA2OdCl3Lj90Xdaxdoqc2JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXtY6tmD7/B/poaLAQBNCG+/KXkocbMb7PuOOSdLjG+I54Nd1sIGMY+YcD65BhYEQTx3y34TX/856a64t8fUXQ9NLnH5mlMslmWYnMbX1M+y7x3++qDEbpF3tlt2qeq96a3ekxEebEKYdxHhXyqPmIEv9nvR0VlA2fwLO/RKriQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EUML/70S; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EUML/70S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789537690; x=1821073690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VFPYIoei+RvA92CJV80XKA2OdCl3Lj90Xdaxdoqc2JQ=;
  b=EUML/70ShGUBmwPXYf1bFdmcV2RFjCA9FY0t0ZOxwVyo3Wzr5vR/OZ5+
   WwTnCx3pt8eNl0tK3R//jwmlW6xOFonNlcTPDCYSeSdVXfIeZRTLDQKry
   yal+8eVdY8v8rQHUR/AyPGQvf8dvvKT3XlIng6ghiqRBu+o1v0VJXZdCb
   dKWVE7oe6EtHbu3UkKBqIAlpW5FtKqaFhaQ5LrRtq6JcZuLLnP+DI5Yze
   4NBZ9CjOneA7IH7l+RldeA3iCrCwRL605JyKr88sm6kgGJLy0MfmDFXcN
   rZcJXp+Go9TsZbrmc5b3PaT9L+md/6bZGCYah97h2ZNWtGGxohhY205Ne
   A==;
X-CSE-ConnectionGUID: S8nSRwkHRJq7WS4JQO0uVw==
X-CSE-MsgGUID: wEaPQ7r8TvqtXJDYJjRrRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="88846047"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="88846047"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:48:09 -0700
X-CSE-ConnectionGUID: gjLPufOGRvK0JJ1Ksko7QQ==
X-CSE-MsgGUID: sWkWuan7QpWPv4K/uyCalw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="276986238"
Received: from szadworn-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.45])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:48:07 -0700
Date: Wed, 16 Sep 2026 08:48:03 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: David Engraf <david.engraf@sysgo.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk: Remove console options before decoding the name
Message-ID: <aqotk6oiOdp01hAF@tlindgre-MOBL1>
References: <20260916053218.40546-1-david.engraf@sysgo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916053218.40546-1-david.engraf@sysgo.com>

On Wed, Sep 16, 2026 at 08:32:18AM +0300, David Engraf wrote:
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2646,24 +2646,22 @@ static int __init console_setup(char *str)
>  	if (_braille_console_setup(&str, &brl_options))
>  		return 1;
>  
> +	/* Decode str into name, index, options */
> +	options = strchr(str, ',');
> +	if (options)
> +		*(options++) = 0;
> +

How about update the comment for why it needs to be first?

Maybe something like:

Decode str into options first. The options may contain a ':' used also
for DEVNAME.
