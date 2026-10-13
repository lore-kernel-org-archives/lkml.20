Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD7F518156;
	Tue, 13 Oct 2026 16:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908410; cv=none; b=DzikufrbibK5LNqTYqc2XIlMHsyEI282w9mvSPKl2M9OH3mxy3fpnpyQSJ7OhOyByMtEs2J6I2DrWiCtFjgfKuO02CVciQThCJ1yQSQdNcE5Dt2Bzf9k3swWXGR1GGB61GflNyPtJG7ugdPRV/lM6TjlTq5LVKnDPolofjuEl8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908410; c=relaxed/simple;
	bh=BbmNPrjSY/tGIxn+E5mxN0X/4tEFCb6SOMm9R5IDjz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cy2b6ZS7PgXorsHl8dioFeFwfO/kY2tvnX+u+F/0Bk+4HTxbXYyvSEmDfbFpscfnrN7Ng8EdzAWYaytLmQdOm++vDbayja3NIvtbYtEfa0jseNhN9picpa8U+EP3PW9lCrKWbuYZMbWFW8AKQpbMV/DcQYuHIAcn9EED0p03ecQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjlxOI5D; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjlxOI5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791908409; x=1823444409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=BbmNPrjSY/tGIxn+E5mxN0X/4tEFCb6SOMm9R5IDjz8=;
  b=GjlxOI5D6F/snBld43V92AmFVHbk+4tRxDkSd+3XsvxCVtxV3RcHXiXa
   UT5oDx23y+Q4/nhzjhK0dVa9+pcJUDjx43SB3GlPEYgatarju3ZRSmo4d
   pwsGlEekvAgf3jq3/bNjzllV29fjbWP94q5QT4q4mky7kQnGzKNfDLeU3
   N9wwrRracLnuUqQSgpvOErbf9PTtEjiD9RA/KsQr6yjPeWqYHZSkLKM6w
   vOSRV02YYN+g94KxzQfanZAm7cr9vy6qR3JCey57OcwPqj/0WqwGWmbAG
   xz+NxjLvmaqnNTQ4wEatBtrg9or9/zpOwBw30D4fnZT/PmNLn+WEg8boj
   w==;
X-CSE-ConnectionGUID: gaQ13R70QsCoVIyUy+YTeg==
X-CSE-MsgGUID: mqOBxPVTSRmqwOd2zMCfLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="535269"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="535269"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:20:08 -0700
X-CSE-ConnectionGUID: S2wRa1AQSXCVEP7a4sYSBQ==
X-CSE-MsgGUID: lepL5JzBQ7SOoHmWUJOaWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1638940"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.48])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 09:20:06 -0700
Date: Tue, 13 Oct 2026 19:20:03 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: atomisp: queue: move circbuf types and
 helpers to queue_comm.h
Message-ID: <as5aM_zYghHjRDsL@ashevche-desk.local>
References: <20261012230754.1914517-1-vladurares@gmail.com>
 <20261012230754.1914517-4-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261012230754.1914517-4-vladurares@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 12, 2026 at 11:07:52PM +0000, Rareș-Mihai Vladu wrote:
> The remote queue code only needs the circbuf descriptor and element
> layouts plus five small descriptor helpers from the circbuf library.
> Move them into ia_css_queue_comm.h and include that header instead of
> the circbuf ones.
> 
> The descriptor and element layouts are shared with the SP firmware and
> are moved unchanged, including their static_asserts.
> 
> While at it, drop the OP___assert() NULL checks from the moved helpers:
> every caller passes the address of a local variable, so the pointer can
> never be NULL.

...

> +/*
> + * @brief Data structure for the circular descriptor.
> + */
> +typedef struct ia_css_circbuf_desc_s ia_css_circbuf_desc_t;
> +struct ia_css_circbuf_desc_s {
> +	u8 size;	/* the maximum number of elements*/
> +	u8 step;   /* number of bytes per element */
> +	u8 start;	/* index of the oldest element */
> +	u8 end;	/* index at which to write the new element */
> +};
> +
> +#define SIZE_OF_IA_CSS_CIRCBUF_DESC_S_STRUCT				\
> +	(4 * sizeof(uint8_t))

Why not sizeof(u8) ?

#define SIZE_OF_IA_CSS_CIRCBUF_DESC_S_STRUCT	(4 * sizeof(u8))

...

In the same way for the rest of the similar pieces of code below.

...

> +static inline bool ia_css_circbuf_desc_is_empty(
> +    ia_css_circbuf_desc_t *cb_desc)

Don't repeat wrong style, correct it here

static inline bool ia_css_circbuf_desc_is_empty(ia_css_circbuf_desc_t *cb_desc)

...

In the same way for the rest of the similar pieces of code below.

...

> +static inline uint32_t ia_css_circbuf_desc_get_num_elems(

While at it, use uXX types directly. Would it compile?

> +    ia_css_circbuf_desc_t *cb_desc)


-- 
With Best Regards,
Andy Shevchenko


