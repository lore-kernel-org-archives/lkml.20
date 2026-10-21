Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571906;
	b=KzeTFDVU1QdPncLxIzb37grIq2nOWI0QvybYoK0TF4P0462Oo0uMoWLYBKet5J+kcs5H
	 5j6Wf4kse8VVQPQIK8IE0W6E70UURG845iaL+00f6Xm2ev5gZilaathoIuhb87WarzAUy
	 +B90lHLOcpikn4FrRjnHOLTV6mDFgBeAFlLARPF/e2rRnsVOt6ITuqV4TMlC7uErkSxL8
	 pBfSE1Z0qIgun3gNSttXTFV4lQK2AL65I+1EYadsOPJ423iMOOePNSiw3+QZBn9cwGsrs
	 XC/o7W7TRau3SftgoP+DqFsifpQKEd03xN1wY52LwCO0FH1FtkdqVaIDZ3KzkMc0Omg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571906;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=TDFRov/l+XAhp9FmFsI6kfCpkXLvo+o328yz57FheTw=;
	b=gf28Eqmx1kFIBZ5778XzecFPmWiPXnKGMImDDoZu3yv+tZ3R0jhfiURfqYRRARkBQrI8
	 UAS0ihZ+RrCkrnjYd8+ZX6zIa4HGdFCTyt8ZDO+vjShkedEwqCZohdnERAW1cfTwSJs61
	 l+iFDZdrvF+DK02jeElm7yhioyW1aNOSVcDxryOTzt99XLIuuzKZAyY9VW9SNWPAZKfWY
	 006Qf0r+jWPwwdcUXpGNhPzdQHu9xk2B3O4+HebR/tx3RehbgBfWQMf7LxwiX9EKZUL+Q
	 89nzlgozLqG+qwB4BQSjJRYgpHDEhgqKQtj1SmqP2WE5iovRcUivHHjbeSWYV3gDYUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="k/TFvvJU";
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72C4606A321;
	Wed, 21 Oct 2026 08:38:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B72C4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k/TFvvJU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792571906; x=1824107906;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hecfkEuDMhalihKY9BMlj7bW/6zIbpDkpTHwVzJjacc=;
  b=k/TFvvJURwBNRz7uQ6kuoFKRIjWrarqd2Zz7TcmpWGU563iVw8OTVqGj
   Zq7XHB+GkqgnO7WcSPYrTBhJEkHPgmk8LaQfzANRujp7tnf68vBZ7L1sc
   PAqumQY2nTwm9pDOxKeh8+29iFHDe923kxiy9zJFM33Cjcy/HvIOHz7/W
   ouCgtIauO3QMMdcNpcLlV5iZiafRNKGB0Y1QIrRxdRW8ht7sRgffOpP10
   wuttasAM8O67a8r9IWMRk6RJoJe3b0gw1LkaavTS1sGp68dCLYyxAmUBl
   ZwKbtDheQNPOTmJ8YEtmGj+pFLT+kOk4wEeN5tk1hAHLQLLP85Bqd5JsR
   w==;
X-CSE-ConnectionGUID: 1esg6ILVTvKXj2ss+okF8g==
X-CSE-MsgGUID: M1CJ45jkR/Gu2uy3kLqYdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1302480"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1302480"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 01:38:21 -0700
X-CSE-ConnectionGUID: s8cnjJfgTd2wTC6Q/D+k0w==
X-CSE-MsgGUID: 9zqGMS6QRESgPiTuW0QrMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3030859"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.66]) ([10.245.245.66])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 01:38:19 -0700
Message-ID: <ecc0265a-04e4-4ff8-9831-c5ef45a2b37c@linux.intel.com>
Date: Wed, 21 Oct 2026 11:38:12 +0300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: xhci: fix EP0 context leak on virt device allocation
 failure
To: Anfernee Cao <anferneemelokc5@gmail.com>, sashiko-reviews@lists.linux.dev
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xu Rao <raoxu@uniontech.com>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <20261017111114.1135-1-anferneemelokc5@gmail.com>
 <sashiko-outbox-175494@kernel.org>
 <6ad35dad.70c60f76.2e7ac9.12a4@mx.google.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <6ad35dad.70c60f76.2e7ac9.12a4@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/26 14:36, Anfernee Cao wrote:
>> Does jumping to disable_slot here actually disable the newly enabled
>> slot_id?
> 
> Yes, you're right, and thanks for catching it.  The disable_slot label
> should pass the local slot_id.
> 
> This is a pre-existing bug, separate from the EP0 context accounting
> leak fixed by this patch, and it has already been submitted:
> 
>    [PATCH] usb: xhci: disable the correct slot on alloc_dev failure
>    https://patchew.org/linux/6C94F1F35FF16E76+20260806084909.2959131-1-raoxu@uniontech.com/
>    Fixes: 3ffbba9511b4 ("USB: xhci: Allocate and address USB devices")
> 
> I deliberately kept this patch independent of that one.  The decrement
> added here releases the endpoint context reservation made by this
> invocation, regardless of which slot the current error path ends up
> disabling.  Once Xu Rao's fix lands, the error path will disable the
> correct slot and the two fixes compose cleanly.
> 
> If the maintainers prefer, I can resend this rebased on top of that fix
> once it is applied, or send both as a series.

I'll pick up Xu Rao's patch. It got lost somehow

Thanks for the reminder
-Mathias
