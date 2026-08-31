Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40090341057;
	Mon, 31 Aug 2026 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173125; cv=none; b=SZklGSvRjMGKTVLblSPOgndILLEwjCquvApIR4v3EUS0ZO48hG9ztp3OJMy6quwD7IXP216Hs4k/0VMtouCR0tUawl44T7xsPEkareefdxh7cyeCuNtJRMbmfx4PEdYcwEObBOWton4raJ46qCalrVKzjuFkux5LlORKh5arRdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173125; c=relaxed/simple;
	bh=S6Cy0/gEJvKcVNOS+gtHpj0dp6VeulVANP25uuTUpdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xxi91MQeD9Nqsk9vHKDasFzMgw8CaEIIMs2WQWGPyfw4qas2IcOA9uAPfIWOgiiVFyq502u01yM1X1sD+Iab5VF+JomUWc1WSEjIWofK9tZOqFLq+H+buqj4wcCRGzTQ7h1QJvtK4mrimr9Aqz0RqxQRJoNXq1714eZz9f4X1dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OcaC9KfJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OcaC9KfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788173124; x=1819709124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S6Cy0/gEJvKcVNOS+gtHpj0dp6VeulVANP25uuTUpdI=;
  b=OcaC9KfJMR8GpHmB+eT8IZrfeG0hIl+pQn582UpfoAB7vJsyW7wcT8zb
   ahfZ0ucOERsCMWA6ksrx1Lpop2+/Q66PmaayakEd3ara2mhDmZd+0YCqp
   KymgNuenXm9XT8s1Sz7sWJOLUqlQsjUYlRj8/hkfuMwD+pmcww8uuRcul
   GcHsv0KVCbNf1VgqXjjvDdsg8luueU6whdpqhFCq81cXSMzmag+FFC2gU
   feDkr89tYI9VHzyMLlywknXfrtDWeYmi8ZccGafxSEUd7e5++w3y7YgX2
   suDDaOHv5PAWfQWIjCsfdyDYEwW6kWYn5SeUfEwkAY73ClbRjp3o1zjnk
   A==;
X-CSE-ConnectionGUID: nL1qHdOFTQqi+UCMsNmy9g==
X-CSE-MsgGUID: g5+Brj+iQS2Np7m889gFxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99737829"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99737829"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 03:45:24 -0700
X-CSE-ConnectionGUID: bTc4khdUTmWWoN3UHqsKJg==
X-CSE-MsgGUID: hznkY5QmRu297pPqTVBzvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="265044519"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 31 Aug 2026 03:45:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C452B99; Mon, 31 Aug 2026 12:45:20 +0200 (CEST)
Date: Mon, 31 Aug 2026 12:45:20 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: westeri@kernel.org, andreas.noever@gmail.com, YehezkelShB@gmail.com,
	isaac.hazan@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: dma_test: Tear down DMA paths before
 stopping the rings
Message-ID: <20260831104520.GG124825@black.igk.intel.com>
References: <20260825034759.5403-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260825034759.5403-1-vulab@iscas.ac.cn>

Hi,

On Tue, Aug 25, 2026 at 11:47:59AM +0800, Haotian Zhang wrote:
> dma_test_stop_rings() stops the RX and TX rings before calling
> tb_xdomain_disable_paths().  tb_ring_stop() zeroes the ring's descriptor
> base and the cancellation callbacks unmap and free the frame buffers, so
> by the time __tb_path_deactivate_hop() polls the hop's 'pending' bit any
> data still in flight has nowhere to drain to; on ASMedia ASM4242-class
> host routers the bit never clears and every teardown burns the full
> 500 ms timeout.  This is the same defect as the one in tbnet_tear_down(),
> fixed as CVE-2026-74691 ("net: thunderbolt: Tear down DMA paths before
> stopping the rings").
> 
> Move the tb_xdomain_disable_paths() call before the tb_ring_stop() calls
> in dma_test_stop_rings(), so in-flight data drains while the rings are
> still active, and only then stop the rings and free the frame buffers.
> 
> Fixes: edc0f494ed966 ("thunderbolt: Add DMA traffic test driver")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

I dropped the Fixes that as I don't think it's needed. DMA test is not
anything a regular user should care about anyways.

Applied to thunderbolt.git/next, thanks!
