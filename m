Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D88314A98;
	Wed,  9 Sep 2026 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788973256; cv=none; b=Kt8jhdR4MGYyU/zX/kzQUig5f/o60jLbDp2dPpK9LbMrYdW41RdbdHeaPwsCy1yNlU/YWp8VTR5KnWufm+rhgnLVzcyj31ru22xZEOKxGicwHt4ODXAnCb/a7V6EzBR65/fVs8sBGo4hIfqaIdl4os/keZRp125SPVeSH+ZvkL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788973256; c=relaxed/simple;
	bh=Y/UIq031XmUZ5ZfP5/0PQAgB9eZRuRYbgPHSxMOJLfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D7bnA2wlTy19MnO8XHhBNNSBM7S8fVsLNNbi1Da3SO7SS4JgELCFxptaCccx/GMYzIf7ber8YyN3qxZ7FF/N8iPKEvyNnXT5ozlCtKEj68eYAchM/gU83ownEksFwPYCbOkQBruVL9JgbWUF5ll8WoVaKaffGeCbjq7xI8CqXNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9BP+1Vz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9BP+1Vz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788973254; x=1820509254;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Y/UIq031XmUZ5ZfP5/0PQAgB9eZRuRYbgPHSxMOJLfI=;
  b=I9BP+1VzkOM8xYnLnJKE8e3n+XlufuFpbjh/GLnucoXyE05rlXm0lPLW
   zDeR0NqRkQAc8XiLEmY+kk6vNKCd6mgT3T/0pgonu/ZedFfwtppuRTSt6
   jIPWZhY2/XJ1oo4xEYqoUbOaJy0Sk8EW3uFPmwflPjSQXF84tpayVriKt
   4MMC1IvBBkf1qk8f8qUa3AtSj0JnRgAvDT4lb8f64DVz0dMkZsjZxFxSN
   5TwlF7ImBeJ6pe2z/2HSLHTTXQ+npAmU+TLjhEOu4vSeZPU+p8qq2hS9O
   OATZRgVufUXqvctFf0VQ7RU1EQv44gyGsJQcT8POAnwSTp0ujoBUw4Zyf
   w==;
X-CSE-ConnectionGUID: ouCzSsBvQa+HVMgenRaDuA==
X-CSE-MsgGUID: obuP5LFPRsmt0Mo+8EEoPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="93098618"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="93098618"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 10:00:53 -0700
X-CSE-ConnectionGUID: fkKchdwgRxWLRLcc7uJdtQ==
X-CSE-MsgGUID: 8ab9o6KmRpC8CTAQmm6hOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="267084887"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.20])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 10:00:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Manuel Ebner <manuelebnerli@mailbox.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>, SJ Park <sj@kernel.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: deprecated.rst: add to syntax highlighting
In-Reply-To: <20260909141255.1367539-2-manuelebnerli@mailbox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260909141255.1367539-2-manuelebnerli@mailbox.org>
Date: Wed, 09 Sep 2026 20:00:47 +0300
Message-ID: <d35909dea037d1ac5c6a919bf1a7d53d8d5fddb4@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 09 Sep 2026, Manuel Ebner <manuelebnerli@mailbox.org> wrote:
> Mark key words 'gfp' and 'GFP_KERNEL' for syntax-highlighting.
>
> Suggested-by: SJ Park <sj@kernel.org>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
> ---
> Suggestion:
>  https://lore.kernel.org/all/20260430010332.114100-1-sj@kernel.org/
> ---
>  Documentation/process/deprecated.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index 22a5e62c9..4d4d29b97 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -404,7 +404,7 @@ become, respectively::
>  	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
>  	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
>  
> -The argument gfp is optional, the default value is GFP_KERNEL.
> +The argument `gfp` is optional, the default value is `GFP_KERNEL`.
>  If `ptr->flex_member` is annotated with __counted_by(), the allocation
>  will automatically fail if `count` is larger than the maximum
>  representable value that can be stored in the counter member associated

Single backquotes in rst mean "interpreted text" [1], not markdown style
code.


BR,
Jani.


[1] https://docutils.sourceforge.io/docs/ref/rst/roles.html


-- 
Jani Nikula, Intel
