Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A8233E34B;
	Thu, 27 Aug 2026 06:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812510; cv=none; b=kbytY/ktONwAae7H57DEqipmSbvyZk1rhWQ7QrexAUoyY5tUj/JFu0gj3WOgNw+79ka9BDNWZunS28Ng1t4Jn7lIxhLej92h0rqhuAjMKhemTeg7kc0UVoYmv/ZCyOzSSh6/G2LPKiH9+WH9Y88FLttGpNuk/AwNJQs4UWdSBkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812510; c=relaxed/simple;
	bh=WqchggjH9hn51vCdzs4WlFOEV7ma0Z4vukFOFOaqXcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1l8jj/563N3DSovuwl7Ns+8+wsNGwvF3eVaVN45tN4zHJhf8FiVBe5oFbFYYWprIvJI4jXc0m40bDd5KIkRptad3LxJw8lT4YJALeJDBl6mQtpbN8jY2D5dCwN3FsWUUJ6O+DLmDT+MOW+uUkrSZWeXDqu/lU+sfiLtzwIjwI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPwwr8VR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPwwr8VR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787812507; x=1819348507;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WqchggjH9hn51vCdzs4WlFOEV7ma0Z4vukFOFOaqXcs=;
  b=DPwwr8VRwItPicEj4wewun2cDpGEQTNFf7g01gVhYHFCXNaI6Ng7AW95
   83FyWBsXPAjHPYlBFAJxEemsDlGqYhr/QYVzpfte5M9CU9TKkDKYbx8lb
   EhbM95WQnF8qBNGbxirpambCqgBINQLVFPeCmY5COiq8U+spgk52v0m7S
   yBZgAa/wDZSUL5Cx2O/XVyd+69n8iv7rqhCOm8K8mhjAj8xEwLUn6gL1z
   bJAqIr709tbbiIGZ7fUm05zxS2Mxxtxx54GiIVy/gsYZtjdlYfGitU4tG
   r3j4pMxCu/NtTicEw7nIxyGgHnZ5TdKa9dBsmLDzfHfyXU0oThF6/cgA1
   g==;
X-CSE-ConnectionGUID: Bc3RbpwNTsGDNN4kJ1UFlg==
X-CSE-MsgGUID: +7ICXO5UReydSXMTNiQcoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="99656350"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="99656350"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 23:35:07 -0700
X-CSE-ConnectionGUID: hgx/yuobSAy2bYalaVILkA==
X-CSE-MsgGUID: g+Nc/osFRdehqhiX6rRgPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="306004445"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.94.252.51]) ([10.94.252.51])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 23:35:05 -0700
Message-ID: <fdc17e7b-5b79-4b52-a1a9-929ec1565768@linux.intel.com>
Date: Thu, 27 Aug 2026 09:34:50 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: fix ERST max field conversion
To: Youngjoon Lee <getfeus@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260827053748.3755-1-getfeus@gmail.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <20260827053748.3755-1-getfeus@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27/08/2026 8.37, Youngjoon Lee wrote:
> Commit 6d45e9556d4a ("usb: xhci: standardize multi bit-field
> macros") converted the ERST maximum calculation from BIT() to a
> left shift. These operations are not equivalent because the
> HCS_ERST_MAX field contains an exponent.
> 
> On an MT8173 xHCI controller where HCS_ERST_MAX is zero, the new
> calculation produces zero event ring segments. This reaches
> dma_alloc_coherent() with a zero size, triggers a page allocator
> warning, and prevents xHCI from probing with -ENOMEM.
> 
> Preserve the original calculation by applying BIT() to the value
> extracted with FIELD_GET().
> 
> This restores the USB 2.0 and USB 3.0 root hubs on MT8173. A USB
> webcam and both USB 2.0 and USB 3.0 hubs enumerate successfully,
> and the previous ERST allocation failure is no longer present.
> 
> Fixes: 6d45e9556d4a ("usb: xhci: standardize multi bit-field macros")
> Signed-off-by: Youngjoon Lee <getfeus@gmail.com>

Thanks for the report and patch.

This issue has already been addressed in:

https://lore.kernel.org/linux-usb/7e6648ad-7459-4248-8c6c-227cfc2586d8@linux.intel.com/

-Niklas

