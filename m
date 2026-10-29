Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279556;
	b=0rXPJ9KhS8qMKC7CnJWaBnox+xxEOuXasJvse97CF5NMUTPVtoqM5Ed0Yhza7jp9SXr2
	 9Y+149a352Geux6Bgb+l2rB7h1pbKCLZFRZWShVor9azDLw2AlTYO70UdJMyqC7UARWHq
	 O8CVmGj/8F3dV3nLeytI282iSEwTPc+Nm0Lv5FNtKwxYMFuqg3OEkdMen0wVUsl5FEHUt
	 P59i4f0C9mMsVLXgfjlzW1QzW3QSM6KfbsWGzzzWposm60aDAsIeeGGobg4IlkefSnPnM
	 MpUJmTZIXL7xeoMcPsSDbUwvbHqARZNO0QA/DMWEEo8zcMQfhrwvBlDr2mckPfXUv6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279556;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=U/dn1bJxSxiZF4VVcxna9DY8oDDKRyAz/5CgUNCelhU=;
	b=d93UYrVkdS6PCwWwqHd36ZBabioC+ksh9At8mkZl3IrzMtMUJsb/7j9gAb7x+VlZfeK4
	 2qrEuQMBcLZGsoInZgN63Oipp3yg0VwxynweW5diD6YX0NkayZAyLLRNMZ2G+4HiShZMU
	 iSy9G1FEV/Z5h8dUbvCN4RqrT92vI9YkTdCV7sPJY49NS7RsayiSTb1Rtwj9EtaZkSM9a
	 osI5Ycq+sPEmnwyUx3ccS3pM2SLj7axrT4MJpDCOhpESSOA0hKebFqZqWTjEmBxx7aQe5
	 wCphu1HtEhUvHmlEz+b1ik6SVT7ac2R5arfz+UE6uZU03uVw5KmS8LLrCslX7uuORtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BRBUtqwr;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FA7606A322;
	Thu, 29 Oct 2026 13:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0FA7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BRBUtqwr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793279555; x=1824815555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rJvdpx6TIzyH5FLjB4rDEtTKuj6RYTQy+iMgZeUQkFY=;
  b=BRBUtqwrQ5E0a5SvM94BWETm8p4GVykAFzAFOUfyc/y2Z7hVwV4JBzpz
   SHGmTs9djHhK6OGF4ez79NMRJ4bbe34wRgnbJ0pf1RdazBtuwJVhZP7yH
   oG3qkNg4XO338zQhaIi9Ao89DD/bukYF7X+k23c8sucyqTQGzf+EdJi0V
   QdBVriMHc2xRk3IdEpQdw9xlZv3KYf49bIuOMtOm4cz+LqXY1SbT5jJva
   B/e6AnQpSPuJlSLkwDTF0mgadjGL5whjc8na+tpg2LAkzvgX7zMjExBEp
   D9K+niKh4GyoCqfstJVkx6M5suRUxPVwl1s6H3DltSm4O03WMGzxdx8nk
   Q==;
X-CSE-ConnectionGUID: RtVLjUINS8mrKRW7Bt4qiQ==
X-CSE-MsgGUID: wz3Yb1gIQwySD/5a706wkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1899001"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1899001"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 06:12:35 -0700
X-CSE-ConnectionGUID: MoGixHUWTIyr70a/Hk0ieQ==
X-CSE-MsgGUID: nHz/yb5BSSuH+syylIKlbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5269102"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.129])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 06:12:32 -0700
Date: Thu, 29 Oct 2026 15:12:29 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] media: atomisp: queue: move remote queue handling
 into helpers
Message-ID: <auNGPTeZWYXKrE9c@ashevche-desk.local>
References: <20261027230807.2407261-1-vladurares@gmail.com>
 <20261027230807.2407261-3-vladurares@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261027230807.2407261-3-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Oct 27, 2026 at 11:08:04PM +0000, Rareș-Mihai Vladu wrote:
> Move the remote queue branch of every queue operation into its own
> static helper, written the way the function is meant to look once the
> unused local queue support is gone, and call it from the existing
> function after the local branch.
> 
> While at it, tidy up the moved code: drop the redundant parentheses
> and '!= 0' comparisons, use !ptr instead of comparing to NULL, and
> return the result of the final ia_css_queue_store() call directly.
> 
> This prepares for removing the local queue support in the next patch
> and keeps that change easy to review. No functional change intended.

...

> +int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)

>  int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)

>  int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)

>  int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)

>  int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)

>  int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)

This change is okay, just a comment for further possible cleanup.

Please, consider making driver use uXX/sXX types over uintXX_t/intXX_t
for the kernel-only code and the respective double underscore for ABI
data types (I'm not sure about firmware protocol, it's strictly speaking
an ABI, but sometimes we use internal types) — __uXX/__sXX.

Maybe not entire driver at once (can be tons of lines to change), but small
step first to check if the approach is correct.

-- 
With Best Regards,
Andy Shevchenko


