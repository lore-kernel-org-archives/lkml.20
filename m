Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DFF238C1A;
	Fri, 18 Sep 2026 04:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789707503; cv=none; b=EapeKcQ3EO3pvq5rUnZUaad+jEBm5TSita4g0UONqV/r0OcPJ+E6OWF8zLYb5PnxeQHzO15QLrWbKfMLNMZRRdAUpc5iIat531d56qYqezadzBP4yDJAtHuuUAnFYr5BrBCOriDtfkdSG4dcnsCMjHMZ+qyj6Mu/bNmKYO8d6+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789707503; c=relaxed/simple;
	bh=TRfi6xifHfvgzCE/EnsRk3ewPfB5po4pZRRqXZFaeCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/MrWADZYbdcn8IlqS1GJlrCQ1gUXeSWM2CzeJrxTKXZSrtjQOXIOeAkoyEKboFDHkVFxzWSfLz0sSOGSs3wMs6nKHC6anBJfdfCWyVEotIYhLLbM3QCw09Cx4ROVLO0TesXr71edoAKB6AMOJLc0n2M91LM/IoWpl5JlQHI1l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtG68uyz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtG68uyz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789707501; x=1821243501;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TRfi6xifHfvgzCE/EnsRk3ewPfB5po4pZRRqXZFaeCo=;
  b=EtG68uyzOWUOWizTMUbdu9QXhNQYwfRpsLvE4ePzt4ftGRWofp+7c1bT
   oR+TAJyrV9kbw75gByQ+9eR/keZw7ozG/qMVfOPw0VflC7z25mMNGNmXu
   Hm0zlnfBC+CE1JI3AzfpS4MS8beKrg0gn4EgAWyLmsGKWl+4s8sHCeaRn
   TOcIToEzdylnGqaob1dh0yknC7MA3Q2e0SopTfexslpqSsLpFzPxnghh4
   CfzkKhitfChpbXmjvcMl/VfOOXlQh2Sx8CI69prKbT0ppagPZts9B6n3c
   B1EIzGDYyyrRiFmRErbYDAc8QKGBg75u4JNP7VUf6U2b9FiYGZqBUHNYY
   A==;
X-CSE-ConnectionGUID: 4oGiQMlvTkWBFvUF/D9yfQ==
X-CSE-MsgGUID: qSZ47oZ5SkC1hB+dKyRj1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90052459"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90052459"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 21:58:20 -0700
X-CSE-ConnectionGUID: Qr5yyIaSREaeYPlyQE8fqg==
X-CSE-MsgGUID: 0JIF6MifQpC294e6A7TwYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2428715"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 17 Sep 2026 21:58:16 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id E456D99; Fri, 18 Sep 2026 06:58:10 +0200 (CEST)
Date: Fri, 18 Sep 2026 06:58:10 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: YehezkelShB@gmail.com, andreas.noever@gmail.com, duoming@zju.edu.cn,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	westeri@kernel.org
Subject: Re: [PATCH] thunderbolt: Fix tunnel reference leak in
 tb_dp_dprx_start()
Message-ID: <20260918045810.GC106095@black.igk.intel.com>
References: <20260917155231.2161107-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917155231.2161107-1-vulab@iscas.ac.cn>

Hi,

On Thu, Sep 17, 2026 at 03:52:31PM +0000, Wentao Liang wrote:
> The extra tunnel reference taken to keep the tunnel around while
> tunnel->dprx_work is pending is only dropped in tb_dp_dprx_stop() when
> cancel_delayed_work() reports that it canceled a pending work. For
> tunnels created by tb_tunnel_discover_dp() there is no callback, so no
> work is queued and that condition is never true, leaking the reference
> on every activation.

There are bunch of fixes in my fixes branch that I think real with this one
too (and they make the callback mandatory) please check if that's the case.
