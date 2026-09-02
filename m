Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945AC1B3925;
	Wed,  2 Sep 2026 13:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356381; cv=none; b=X5hIi6pHDhMPu+0gg9NWZesGqXk8YufV1T/14/3+/mc69YxFqg4LYld/bgNZS5J/7TGTq232qWBaRqXq0jiw4HwFLF4LdyT/EyE82hnVn84FDpiaoyAgxYaQw0uu3TU7zetPr8G0f+EiSFx/Om6TQpFSSQLuCzH0XAJ1TIuLKrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356381; c=relaxed/simple;
	bh=dJqBXH8BdOH6zHKEeW0xtAXFGckiKkJhrp9asTM5BW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKtuRnVNTENC8+q3tX1GYK8RdaziyMspidCi7Q47HpIPY+YFJTt0miPnCq6Kuw8vjjubzxEOZm6BXHreq0PMRofPS5qV38g7bMTn5Kpw9pp4fGr1PZW93Nyw7HCcCjC6LUWifYRLQtMFCX7vI2gj6eQsA18Xu1e7G5YOMfDbrK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZNK3EH9j; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZNK3EH9j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788356379; x=1819892379;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dJqBXH8BdOH6zHKEeW0xtAXFGckiKkJhrp9asTM5BW8=;
  b=ZNK3EH9jBrUKTJD/bE8sreE8zKTY5AiBQ4XyTuGQ5ganeRa3/Zux7TXx
   UQdkQ7OwVkV/Uxtt2L72zC7nOHKeQjg06UlkFxHaiIYBRpK2F6JSw6IfM
   2zVL4siChstT7oEBZccjMwZ6T/xQySVI66/UojSdCPr4jsGgvyO4uTYNQ
   34KYWs+0u2y/7F7VZA5XveQbzrJmP47awBk4E95InsKgSzlkuv1m+C+aF
   SX729NEhrvobi6ihQX0Ina2QcgVF0vhx5A57X66V966isuLKhyfjOpxPF
   acWH7r2LnGQCsHIe4WBD80JZNqYSe9Q7stqGd7i4lEuAZKPIBJ2Sgvs5+
   w==;
X-CSE-ConnectionGUID: 5o2g7jeZRkGmJE+tiplM0g==
X-CSE-MsgGUID: v9iNjX0AThqmGwTmP5m5IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88664108"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88664108"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 06:39:19 -0700
X-CSE-ConnectionGUID: AJp3+3dCSqKCdeKQBXAOZA==
X-CSE-MsgGUID: CYSWsZtaQI26RaP1Tlh4YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="265708939"
Received: from slindbla-desk.ger.corp.intel.com (HELO [10.245.245.217]) ([10.245.245.217])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 06:39:16 -0700
Message-ID: <5f539374-ef55-4400-89b0-f826bdf692d7@linux.intel.com>
Date: Wed, 2 Sep 2026 16:39:14 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH] usb: xhci: Fix bounce buffer overflow
To: Michal Pecio <michal.pecio@gmail.com>, co <co+fd80bc5967eb22c3@bugs.sh>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh>
 <20260828002440.312ec0b6.michal.pecio@gmail.com>
 <20260902132458.5de2f031.michal.pecio@gmail.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260902132458.5de2f031.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/26 14:24, Michal Pecio wrote:
> High-speed devices with out of spec 1024 byte bulk endpoints exist and
> are allowed by USB core, but xhci-hcd always sets packet size to 512.
> The exact nature of these devices isn't documented, commit fb5ee84ea72c
> ("USB: Accept bulk endpoints with 1024-byte maxpacket") only states
> that they "don't work with xHCI host controllers", whatever it means.
> 
> But somebody (or a malicious device) can try, and then the driver will
> allocate a 512 byte bounce buffer for this endpoint and may write up to
> 1024 bytes into it if particular scatter-gather URBs are used, because
> xhci_align_td() obtains packet size from the descriptor. Fix this.
> 
> As a side effect, TRBs will be aligned to the packet size chosen by the
> driver on all endpoints of all speeds. Alignment serves the xHC, not
> device, so this is fine. Only out of spec devices are affected anyway.
> 
> Reported-by: co+fd80bc5967eb22c3@bugs.sh
> Link: https://lore.kernel.org/linux-usb/D4tcSGerkYkIV1DmaUo1t8TaR5qQElDLkidn@bugs.sh/
> Fixes: f9c589e142d0 ("xhci: TD-fragment, align the unsplittable case with a bounce buffer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>

Thanks, added to queue

-Mathias

