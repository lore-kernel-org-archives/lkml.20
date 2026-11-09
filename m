Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220812;
	b=5SZS41e0UQk0Ac8tELIWjbAfQxV1i62mNknZV2Ekr34Q8l2t5qIXG1utliXAnkfLZ1EL
	 qtSWnhrjyWI6U33Adjz8ponT9McG0YcXy9rNDvlJHlAxHNQ21EZn0bv3tw4R9C8MDuw/U
	 PfnqI2wfFktwUE0Dz8G3RVN0ZaW5ZIZmhU3K0QB62jasvMDQ3+U+gVJkZwWJgqz5Wawnf
	 IXzeyMBXCMRzTdpMQyzwcak11Acsnp9rT0cVP7f7RHW1wv8SBfs2f/P0u3GSSIyWo1AtV
	 h4poWqJosSTO2FZN01UITBAhcb5DJUVSHoqTQEXr3SoBVFd4pN8VWmdoH+bc2k1tHKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220812;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eII2xW9eK+JyhszI/hEYk6b5eDf6K60epLky3hR1lTU=;
	b=VEvBTVRv3rhKErZnwiCw4hNQjVZlsMU1440zWjKd/GlMpbnReaynMZ70zGIpZts71as5
	 0iF7P4XdOp30UDrQBVs7BseNK0oibeSUW+zZDNgxJjPjZGHIh8Ay6agPNmJXBprg36wGc
	 A4eVBQIDa3myHP3veFt+gSH6AemCA3KT9QZewZqBrF7/pRsJjERwTUPWQa75GK92S41fO
	 DmMe0lO1lC0q/Zv5mGB7KiRoTSLLWaRnXNyNchJjRn0oYbH9ZhMFv7lQIYTVbmaYvL53C
	 97LpFRfG9L7HyFxYFUTrLhwmB4BcwrO2NS+ov78gtYX7EXSWG+eheY71IScRXIqNHCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mIEZRjjg;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CA3606A31C;
	Mon,  9 Nov 2026 10:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9CA3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mIEZRjjg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794220810; x=1825756810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eII2xW9eK+JyhszI/hEYk6b5eDf6K60epLky3hR1lTU=;
  b=mIEZRjjgH69AJ3Ikqm40jVuVKsw8ClSUay9YIiU+ddJfg1svOWTxbSz5
   QLWh88Jn3Yb1mC0FW/STQZP0GexBuR82Ov+/ssm3tgpKYKAZO7vnEVmP/
   muNqNGTGVYITiCF4ZJCsW2P595nlExyV5hnDO6Vx967696jnFPt20sGI+
   FfD0XApxx6pD4Dqzwbf1So6pA+PWDin+ZLgD79384ntMGe9KSkqNg/RgW
   OIg59DROEnpo6Q6gZuj4/MgaVLR7jjSpVqYSt4goMrrC26jfd/E4xUmFM
   yJaaWITPZ6n86PMWBsJhnVCwjmVBtu1M1c6URQmsp3IH8sUYgzzb9hCJI
   A==;
X-CSE-ConnectionGUID: hCGfYjPPRLyhe3tPgqglnQ==
X-CSE-MsgGUID: +SMQPE7GS/2JHIwtFnuweg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2828175"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2828175"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 02:40:09 -0800
X-CSE-ConnectionGUID: dsf0UpurSGCCWJrR5ePICg==
X-CSE-MsgGUID: tOpkJ0ZXRV2NcD4A0pGE3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8270311"
Received: from srf-bkc.iind.intel.com ([10.49.110.107])
  by fmviesa007.fm.intel.com with ESMTP; 09 Nov 2026 02:40:07 -0800
From: Tirthendu Sarkar <tirthendu.sarkar@intel.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/time: Enable HPET under ACPI hardware-reduced mode with hpet=force
Date: Mon,  9 Nov 2026 05:40:05 -0500
Message-ID: <20261109104005.3391565-1-tirthendu.sarkar@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261005075550.463089-1-tirthendu.sarkar@intel.com>
References: <20261005075550.463089-1-tirthendu.sarkar@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Oct 05, 2026 at 03:55:50AM -0400, Tirthendu Sarkar wrote:
> Let "hpet=force" call hpet_enable() when .timer_init() was stubbed by
> ACPI hardware-reduced mode.

Gentle ping. The patch still applies cleanly to tip/master (v7.4-rc1).
Is there anything I should change, or can it be picked up?

Thanks,
Tirthendu
