Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707AD4E1C8D;
	Wed, 30 Sep 2026 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790773939; cv=none; b=ENVIYQembJ1Cw1bpKvihtMCSPK+KfHqwZR1zO4iaEPSQShyAFr5/GXSZn3KVYw7V0eC6dMvXDqJPi7xJgo3NnJ8Z9GIjOmcqJsEq4jsRT3HHkIbwqPnXq8MO2/b/6/TEBUCVXGmo3o2pYUGce433XDv/oR/H5z9AbtDVkkpknmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790773939; c=relaxed/simple;
	bh=Ki9TaYYk9EkrT9+TZf6vZEn8mW8sf9ndtD4HPkrtRtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONpRPlFLQFrNbU/s3fSWcwUW5aDtjlRLLk7+jUzuOAQxsJa4V4g2tLtP8/X4bBFuhZJz/wZZE3cgHoU8vQH5SK4YAO5o8KcGLKnJavJjLXlkSI04eNfyy3+QAo0dc9wkhjt8L2sPcdCV1XVDDZChZI2NMl+rbSXR8ZwwQG3sTDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RUjlZfLR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUjlZfLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790773923; x=1822309923;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Ki9TaYYk9EkrT9+TZf6vZEn8mW8sf9ndtD4HPkrtRtY=;
  b=RUjlZfLRKIpsdn1k5OFQrxM88GDhbS4ZzxJlzwlQheSMIYTRzJWrp/jO
   I4RraGaREO6EXC7Qy2D051ZglRQBw5ibsfeULmxCBlAZHesu/f8hahX/Z
   wTSh9qliOIRpbysvYE5JX//i4fm5xGAwaUlBGrGxrn2Q2RnAmmFRnj96E
   RPkof9WP9wKWlKmvvCUGisIzWng+4uRGj7HHFQyMkykbJr4v21RI32VSd
   x5l6hbOMtv7FCUareIgv1orwEvRo+odpT/IjyH0wxH4R37beSZ+eoKS7g
   cIW8VbcZgJgXbkgvluv9pyrnf1JqXPZxhnGbhr9o27tQvu3ogi5VoMu5d
   Q==;
X-CSE-ConnectionGUID: IrbnAxaLRweDL/xYo2l8vg==
X-CSE-MsgGUID: 7jGCAWdjSSanGKKc1MPKDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93995376"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="93995376"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:11:58 -0700
X-CSE-ConnectionGUID: D4Zi7TR4RziFgdp+OF6aNg==
X-CSE-MsgGUID: bcaxDf1mQvKQuieaO4EiCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="283753370"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.78]) ([10.245.245.78])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:11:57 -0700
Message-ID: <24df4566-b845-4497-8b29-456faf4d0141@linux.intel.com>
Date: Wed, 30 Sep 2026 16:11:54 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xhci: check device notification type before forwarding
 wake event
To: xy521521@gmail.com, mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hongyu Xie <xiehongyu1@kylinos.cn>
References: <20260929112821.60641-1-xy521521@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260929112821.60641-1-xy521521@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/26 14:28, xy521521@gmail.com wrote:
> From: Hongyu Xie <xiehongyu1@kylinos.cn>
> 
> The xHCI driver programs the Device Notification Control register to
> only enable the Function Wake device notification (N1), so any Device
> Notification Event TRB received is expected to be a function wake
> notification. handle_device_notification() does however not check the
> Notification Type field of the event (xHCI 1.2 section 6.4.2.7, DW0
> bits 7:4), and forwards every device notification event as a function
> wake.
> 
> A host controller that delivers an unexpected notification type (e.g.
> due to broken firmware or emulation) would trigger a spurious wake
> notification on the parent hub.
> 
> Parse the notification type and drop events other than Function Wake
> with a warning, mirroring the slot ID validation in the same function.
> 
> DEV_NOTE_FWAKE is the DNCTRL register bit for notification type 1
> (N1), while the event TRB carries the notification type value itself,
> so add a separate DEV_NOTE_TYPE_FWAKE constant for the comparison.
> 
> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>

Added, but changed warning to a debug message

Thanks
Mathias


