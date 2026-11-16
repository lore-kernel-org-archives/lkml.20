Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820509;
	b=4gaEnaMucFCCqRzq0XZKHT2oJc174oWSLkOwH9cAQWyqT7uUYdr1al8i4d8Pp/RQp76y
	 liqYLRFmwd17tZbMzEIlVuh979aP0ucr+dBdqyVIOHkzJk9NwiLsITcyYkiNMM7hoHmqF
	 TLiA2ky3ruqLzk5cVe5eyLtMuPKhASe95ookE8H1mcRxmxdQelL8Wjmybi4qgjENd+Fzw
	 tLUSfQDXr4eRj8vv4I50gyV/DPyd6OL/LvWM3Kufkf/B/5FIAYMSTIusli+gFWdi70y9T
	 mhENjzMY4gzxfzBpcybgGTDwcbs1YhHPCd47VcxysSDrdchtc5UpqLCrTxqlvMwhXqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820509;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=6Ig7jYUgxdgeyk8a8VW3h/phXinUIjqelDPYCG389ew=;
	b=Su5iK0lIlXJD/nwO3O34TW1oco77/Ee8Cb1e8FD2GrygbJ1xg8Xza8vtmgDK6K28GDgB
	 NpDzXCS7BXQeVkAEZ+KQJxtoWKBT2+NpwI3xkbNsTaMXtbdkKSke2HvTkrJOswNt6bNMK
	 cIiPbCVpeoTZxhs5xLvPvOTpHPz5xIPBAb4S8w4BIg350DnUurBIa4bQmVAewNakj8B1u
	 QLGgIMe0YDNxQ0c8wjcaKd2IYX6M+CwsPFn6Sd0w29nuh0Bc4lRnPhLuBfi8ZAcrTAoR6
	 7HOgmKNRdZCSdHvEBGCSNQx5ytRgSeevYanfy9SNTUYxbapNZ3MisRWviPoTbf1GRTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=deep8vfp;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2047606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:15:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2047606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=deep8vfp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820509; x=1826356509;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jdE1Oz+ifYWLMAah7BbEsOquxhgEGzyzeD+Dta8gPn4=;
  b=deep8vfpPg7Td+nMMxOqXVIPQ9i6rCR3DfGSaL/4ntpOzyHfQnbi6dV6
   X8NJ2enXgXgT2nJrsa9FkDhGZk77HCRqO/eLzT40jMW+/w+iRSIUHk9Is
   IlHzf1PgxcubfNVPWRz6RqoKSkbEaSCiaFgJfx1F1fqeAWMFiaw/fj8dJ
   4zD3KhDyjRjxHm4fl0HZhBXeOkkdb472eeQvURBkVcMTneqGx2Npq0/33
   7DRnyj2Z57IDDLUtBn8jxDcKlSVm8WgoKnv/5g+0Q13NIcnrdTZRBAwro
   Y4ycl4SsDLzrnHR4sCJbLpAR1W1FAjL7LE7B31NT+rqCtov6AKYR5iHep
   Q==;
X-CSE-ConnectionGUID: qGVN4iKSRRWLdme1DziFTQ==
X-CSE-MsgGUID: Y1Q2i78sSqmq4Do6RjiYvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3562767"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3562767"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:15:08 -0800
X-CSE-ConnectionGUID: 3ejOdWhUTn2/NwARFU6/Ew==
X-CSE-MsgGUID: qfJcMm7HTpSY9ogZMp5t0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="11280847"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.90])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 01:15:05 -0800
Date: Mon, 16 Nov 2026 11:15:03 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Chris Down <chris@chrisdown.name>, Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	printk@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk: Fix skipped entries after index iterator restart
Message-ID: <avrJl4lYirh_7oQ-@ashevche-desk.local>
References: <20261116085609.476250-2-thnkslprpt@gmail.com>
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
In-Reply-To: <20261116085609.476250-2-thnkslprpt@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 10:56:10AM +0200, Avi Weiss wrote:
> seq_read_iter() can advance the iterator before the next record
> fits in the read buffer. When iteration resumes, pi_start() calls
> pi_next() at the saved position and advances past the pending printk
> index entry. As a result, index reads can silently omit formats.
> 
> Return the entry corresponding to the saved position without
> advancing the iterator.

...

> -	return pi_next(s, NULL, pos);
> +	return pi_get_entry(s->file->f_inode->i_private, *pos - 1);

Side note (because it seems used more in the same form), we have file_inode()
helper and this should idiomatically look as

	return pi_get_entry(file_inode(s->file)->i_private, *pos - 1);

But I haven't checked if the file_inode() is recommended or deprecated API.

-- 
With Best Regards,
Andy Shevchenko


