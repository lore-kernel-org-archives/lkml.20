Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C673524B1C;
	Wed, 23 Sep 2026 14:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175164; cv=none; b=DSF4ibwlCn6Bwn7UwJw9bLcVE3BeK0kImJcsP9aVCF/vNyz0JhUmScxIyukgWWYXfierAw4GmyugaUKzN94OnwdPo6JWT4zhwn0hmjZ2UsDGI7W5gmvxAvtQfpAQ7M/xSxWhU74yu9o2s2DdzJkIXbroElEjSoCGbeGWgFwzrYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175164; c=relaxed/simple;
	bh=5NEEg5ZrbVeB7iJ6/1LfdHcHnn0mLJlY5QPsY+cmr/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2xCbZzaJRCgidTnYKUy2hBEElZQzaUuP+8jy8Na3aBxgTT8W64SBGywFVrs+pIYWLHfxbCcjmGmKARxw37Pq9iM3s5Q4IFfIpu3mO40kh6jznNVjhMFK7QAT9HqTcXSPoZiC28YMnjGCst5SRK5Ticmwp19aIhqsYBxxs5AuuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=daccB0EO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="daccB0EO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790175161; x=1821711161;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5NEEg5ZrbVeB7iJ6/1LfdHcHnn0mLJlY5QPsY+cmr/M=;
  b=daccB0EO9mDPQMXA+A4h2VkA4PNSCN7XM0LhDfDQ05xiojeole41T4C2
   e686oTgHyjBe+0iN3ujnXsXKz4h+qZyhLz0pMeJUZ/S0/qw42diE91lM8
   6cNFAqJKCXt/oxIoC+ZNqsmgtloq4yZFU2yxY0znC9oLM05H6b6KPYMkZ
   jm7N8g56DAlc1CrtC4GDc0G8HH0Us8OgvRAlB6yGSgmU5En37JpMXI/No
   dOz0tGiUU6cMMP4J51pkc4bFNS4FuICTl//TRD/asb67jBiuMcAO5lkNX
   vVekP+zVko2Xyn/JIOx8x3oACXTxk3HCdyUR3qpNQRXbb+GoyEwXa/4Lo
   Q==;
X-CSE-ConnectionGUID: V1e1WA9kSFiAbx/meGgPuw==
X-CSE-MsgGUID: nqCSlFAgSha/FHxDttju7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101541248"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="101541248"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:52:40 -0700
X-CSE-ConnectionGUID: Wvq2+qLRQziT909EuE+q2A==
X-CSE-MsgGUID: QUIyiKtpR42DBfyWGqsVHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="272250904"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.54])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:52:37 -0700
Date: Wed, 23 Sep 2026 16:52:29 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Amin Gattout <amin.gattout@gmail.com>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] media: rockchip: rkcif: add a register index for
 the MIPI capture size
Message-ID: <arPnhGHzFiWOtzfi@mdjait-mobl>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
 <20260921-vicap-rk3576-v2-2-0a4582e20c72@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-vicap-rk3576-v2-2-0a4582e20c72@gmail.com>

Hello Amin,

Thank you for the patch!

On Mon, Sep 21, 2026 at 05:29:58PM +0200, Amin Gattout wrote:
> The RK3568 and RK3588 variants configure the MIPI capture size in the
> ID_CTRL1 register. The RK3576 has a dedicated ID_SET_SIZE register
> instead.
> 
> Add a register index for the capture size and write it through that
> index, in preparation for the RK3576 support. The RK3568 and RK3588
> mark the index as unsupported, so the write is a no operation for them
> and their behavior is unchanged.
> 

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>

> Signed-off-by: Amin Gattout <amin.gattout@gmail.com>

--
Kind Regards
Mehdi Djait
