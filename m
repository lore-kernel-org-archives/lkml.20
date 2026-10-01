Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A436B2D1F40;
	Thu,  1 Oct 2026 22:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894040; cv=none; b=dIg7GX/p4M8QZy1YjVxPnWxOQ7Lv9NFySJFrlth3UPqgBwKCi9DYoTMnKKFj/ugnHf07C0p6p0A6R6C75kI4SWCBGyMixaFKEl8p/QK+Mdn0snjiVoZckKseKJYS178ZUib9y5NJ8bmi8r+FfUz7R6wc1Ur4i2SwjU/ZzUC83Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894040; c=relaxed/simple;
	bh=rn3NRkbUS8gfhirwNTFRWgIl9kORmKCukJcbc6B0Hgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EKSZs4x3LvCVs49PEdrG8lQRwcx0iy6yEztaaArYnkk2fS2XX11aIm1T1DN49vt8WwY21bLJvDHnJBPq/+0GehvcSVbkZXggSwisLGa3x161gRrGI9YlEvlXMsktRDaqhe+9gWMhetI/IV173KTNU+DlHP+dYQvRmNeYQjjn6FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SnWGISAp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SnWGISAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790894038; x=1822430038;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=rn3NRkbUS8gfhirwNTFRWgIl9kORmKCukJcbc6B0Hgs=;
  b=SnWGISAp9fAAmpexDkFnTMaxZXgyNeVAyWXbt3LLkLi8CfOomZw/wvr4
   5sRt35F6zJmgBQJETJUyMuOCynYTPhuOsQ9uA7xiHyX55lBC56xDnxNIx
   BO0VdKPMIwhZpKpvwL4w0DO5Ogu1jQjdNEuRnhe93T1A7M6UEtlfYyHqV
   XeL4eON6huR44zDu9692CIRpGiYPp3h+eWlfEjH7QOplk7tAByI06IEGn
   sSTPIJy1u/YwQe9vflGXR6oDzLrhm9qb8mz3G2pzq37VSHnXGbZN2EpPx
   ScbNNa7antqcGmDwKE9c3ZdjBrTmYtqtR8H2n5w/GaJJGJX3nkwghCcpE
   Q==;
X-CSE-ConnectionGUID: 2+xu8MwLQsaJd5/AUHa6jg==
X-CSE-MsgGUID: xImDsaIhQFGJ/8ZmkrK4yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94377381"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="94377381"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:33:57 -0700
X-CSE-ConnectionGUID: 3xOw04JjSHO60sZAwzj+LA==
X-CSE-MsgGUID: PwAehYMKQJuJ4WTffmeSzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="273933416"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO [10.245.244.120]) ([10.245.244.120])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 15:33:55 -0700
Message-ID: <92d80a55-4422-4659-8f2d-e28693d6d9d7@linux.intel.com>
Date: Fri, 2 Oct 2026 01:33:52 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Add larger page size support for USB audio offload
 path
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
References: <20260909-16k_offload_v1_b4-v4-0-f24a86617597@oss.qualcomm.com>
 <d7ce8b23-64c0-43dd-a8c8-268224b9462c@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <d7ce8b23-64c0-43dd-a8c8-268224b9462c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/1/26 01:23, Wesley Cheng wrote:
> 
> Hi Mathias,
> 
> Just checking to see if there was anything that we needed to account for in this series?  I think there was the discussion that came up here:
> https://lore.kernel.org/all/TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com/

Patch v4 1/5: Looks good, is useful even as a standalone patch. Can be taken immediately.
Patch v4 2/5: Looks good, not useful as standalone patch, can be taken with rest of series.
Patch v4 3/5: I need to revisit this and look at new dma pool lifetime vs xHC accessing those DMA addresses.
PAtch v4 Rest:  ALSA, no opinion.

> 
> But, I think your suggestion about adding the sideband check in the xhci_setup_device() would mitigate that problem.  Esp, if we don't want xHCI core to really know about sideband ops.

That would be the bandaid in:
https://lore.kernel.org/all/c6c9890f-46d8-42f1-a7e7-8a5d551fa22c@linux.intel.com/

I can turn that into a proper patch.
Lianqin also gave some preliminary positive feedback, but I'm not sure if the code was
ever properly tested.

Thanks
Mathias

