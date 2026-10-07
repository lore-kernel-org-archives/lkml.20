Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E6E39769B;
	Wed,  7 Oct 2026 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365546; cv=none; b=FbNJLoGzSHObkFf+k7xYDcdPFrpZtwjbYQNL2HtsETSNtR7FSFuGnE4FVekxnzS8n6PKSjm+E35gVfOIxi9WbNhztAIU/zwSerYxQYt73I7rfEtPHtEpIXeFbgKySpFKs9vUyqqbOP4G4AO32M4tUxMHVXbIlJ5pQDhjp4iU69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365546; c=relaxed/simple;
	bh=IpM1zGibozvpFlc4oaLqfJnLOB5JbWAq+EH2+IcKVsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QhZ/RuZGnmjhcWaevNtHkaE3O75mEl0/8MeLkdzIS5FUYJGXSbpmdqop3DTRgJ65Yy+dAlbqx1UN2j8LHpc4ItwofP0bCEJPZTmS6OFUD4ywhbWfUkVwjUuRAf/mWYX8xQbYj4RmktOVkpRdNWNwt4S1bgyVsx4/W4DHqPF6BOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYPgEc24; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYPgEc24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791365528; x=1822901528;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IpM1zGibozvpFlc4oaLqfJnLOB5JbWAq+EH2+IcKVsY=;
  b=mYPgEc24zN7GWJqM60p/By2X3tw07QG2JMaq5L0IOPugcfr+MH++rHpo
   eTJmr3LXsMyow+1J9Gfju3VwLkF7q8qPeyAKhXLWBm0xOSE63PDCC7X4k
   TJF3IoTWdS/xdAKKD415zO6YuGThBNYGXl55Zjek/kf6uPLXwP46RSLP+
   NIKnYDCCWNMqrtHS+feySnIV/as/C/ms+AZcJHQio//YSUMlNuhzNc3w3
   SwvEgCxtEVklnenJFqWR0MT1g800aNAPjM1bVG66JgZbUvhXRHkWjhlKZ
   /w6wt+/adfxzK/3rwOiH0funIXZMHlHAufpSPAFgIrBM5I4MK0nkneDBn
   A==;
X-CSE-ConnectionGUID: CB/5bWCYR9+s0N1bgRRpYQ==
X-CSE-MsgGUID: 8XomDi09Q2aqZxlO3/xNQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="3366"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="3366"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:32:08 -0700
X-CSE-ConnectionGUID: zi1LJdwdQxej/xC8Oqm+zQ==
X-CSE-MsgGUID: 6dHLgHdZRiqC8lmVo0ieIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="285486637"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.244.221]) ([10.245.244.221])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 02:32:06 -0700
Message-ID: <59def1ff-18aa-4a6f-a97c-22a56aef49a1@linux.intel.com>
Date: Wed, 7 Oct 2026 12:31:58 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2] usb: xhci-pci: Add TUSB73x0 definitions
To: Fabio Estevam <festevam@gmail.com>, gregkh@linuxfoundation.org
Cc: mathias.nyman@intel.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261005141141.385414-1-festevam@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261005141141.385414-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/26 17:11, Fabio Estevam wrote:
> Instead of hard-coding the TUSB73X0 PCI ID, USB_CTRL register address
> and the PWRON_POLARITY, introduce definitions for them to make the code
> easier to read.
> 
> No functional change.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Thanks, added

-Mathias


